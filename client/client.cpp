#include <libwebsockets.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <thread>
#include <string>
#include "TemplateQueue.h"
#include <chrono>

/*
 * The retry and backoff policy we want to use for our client connections
 */

static const uint32_t backoff_ms[] = { 1000, 2000, 3000, 4000, 5000 };

static const lws_retry_bo_t retry = {
	.retry_ms_table			= backoff_ms,
	.retry_ms_table_count		= LWS_ARRAY_SIZE(backoff_ms),
	.conceal_count			= LWS_ARRAY_SIZE(backoff_ms),

	.secs_since_valid_ping		= 3,  /* force PINGs after secs idle */
	.secs_since_valid_hangup	= 10, /* hangup after secs idle */

	.jitter_percent			= 20,
};


static struct lws *web_socket = NULL;

#define EXAMPLE_RX_BUFFER_BYTES (1024)

static int callback_example( struct lws *wsi, enum lws_callback_reasons reason, void *user, void *in, size_t len )
{
	switch( reason )
	{
		case LWS_CALLBACK_CLIENT_ESTABLISHED:
		{
			lws_set_timer_usecs(wsi, 20 * LWS_USEC_PER_SEC);
		}
			break;			
		case LWS_CALLBACK_CLIENT_RECEIVE:
			/* Handle incomming messages here. */
		{
			char* msg = (char*) in;
			std::cout<<msg<<std::endl;
		}
			break;

		case LWS_CALLBACK_TIMER:
		{
			lws_callback_on_writable( wsi );					
			lws_set_timer_usecs(wsi, 20 * LWS_USEC_PER_SEC);				
		}
			break;
		case LWS_CALLBACK_CLIENT_WRITEABLE:
		{
			TemplateQueue<std::string>* msgQueue = (TemplateQueue<std::string>*) user;
			if(msgQueue == nullptr) {
				break;
			}
			std::string msg;
			if(msgQueue->TryPop(msg)) {
				std::cout<<msg<<std::endl;
				lws_write( wsi, (unsigned char*)msg.c_str(), msg.size(), LWS_WRITE_TEXT );			
			}			
		}
			break;
		case LWS_CALLBACK_CLOSED:
		case LWS_CALLBACK_CLIENT_CLOSED:
		case LWS_CALLBACK_CLIENT_CONNECTION_ERROR:
		{
			web_socket = NULL;
			std::cout<<"LWS_CALLBACK_CLIENT_CONNECTION_ERROR"<<std::endl;
		}
			break;
		default:
			break;
	}

	return 0;
}

enum protocols
{
	PROTOCOL_EXAMPLE = 0,
	PROTOCOL_COUNT
};

static struct lws_protocols protocols[] =
{
	{
		"default",
		callback_example,
		0,
		EXAMPLE_RX_BUFFER_BYTES,
	},
	{ NULL, NULL, 0, 0 } /* terminator */
};

int main( int argc, char *argv[] )
{
	TemplateQueue<std::string> msgQueue;
	std::thread([&]()->void{
		int i = 0;
		while (true)
		{
			std::string msg = "client:";
			msg += std::to_string(i++);
			msgQueue.Push(msg);
			std::cout<<"msgQueue size="<<msgQueue.Size()<<std::endl;
			std::this_thread::sleep_for(std::chrono::milliseconds(100));
		}
		
	}).detach();

	struct lws_context_creation_info info;
	memset( &info, 0, sizeof(info) );

	info.port = CONTEXT_PORT_NO_LISTEN;
	info.protocols = protocols;
	info.gid = -1;
	info.uid = -1;

	struct lws_context *context = lws_create_context( &info );

	while( 1 )
	{
		if( web_socket == nullptr)
		{
			struct lws_client_connect_info ccinfo = {0};
			ccinfo.context = context;
			ccinfo.address = "192.168.6.104";
			ccinfo.port = 8080;
			ccinfo.path = "/websocket";
			ccinfo.host = lws_canonical_hostname( context );
			ccinfo.origin = "origin";
			ccinfo.protocol = protocols[PROTOCOL_EXAMPLE].name;
			ccinfo.retry_and_idle_policy = &retry;
			ccinfo.userdata=(void*)(&msgQueue);
			web_socket = lws_client_connect_via_info(&ccinfo);		
		}

		if(!msgQueue.Empty()) {
			if(web_socket != NULL) {
				lws_callback_on_writable( web_socket );
			}
		}  		
		lws_service( context, /* timeout_ms = */ 250 );
	}

	lws_context_destroy( context );

	return 0;
}