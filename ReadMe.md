# 说明
本仓库实现对libwebsocket通信验证，主要包括client与server（其中server分为两个版本C++
版本与java版本）

# 仓库目录说明
* **./build_client.sh** 是构建wss_demo的C++客户端,其源文件在client文件夹下面

* **./build_client.sh** 是构建wss_demo的C++服务端，其源文件在server文件夹下面

* **inc**目录提供wss_demo依赖的openssl与websocket头文件

* **lib**目录提供wss_demo依赖的openssl与websocket库文件

## openssl编译
* [仓库地址](https://github.com/openssl/openssl.git )

* 编译脚本 

    ```
    ./Configure --prefix=/home/dev/mouseu/openssl/out/build --openssldir=/home/dev/mouseu/openssl/out/build  "-Wl,-rpath,/home/dev/mouseu/openssl/out/lib"
    make -j8
    make install
    ```


## libwebsocket编译
* [仓库地址](https://github.com/warmcat/libwebsockets.git)

* 编译脚本 

    ```
    rm -rf ./build
    mkdir build
    cd build
    rm -rf /home/dev/mouseu/install/libwebsockets
    mkdir -p /home/dev/mouseu/install/libwebsockets/lib /home/dev/mouseu/install/libwebsockets/bin /home/dev/mouseu/install/libwebsockets/include /home/dev/mouseu/install/libwebsockets/example 
    cmake .. -DLWS_OPENSSL_LIBRARIES='/home/dev/mouseu/openssl/out/build/lib64/libssl.so;/home/dev/mouseu/openssl/out/build/lib64/libcrypto.so' -DLWS_OPENSSL_INCLUDE_DIRS=/home/dev/mouseu/openssl/out/build/include/ -DLWS_WITH_MINIMAL_EXAMPLES=1 -DLWS_INSTALL_LIB_DIR=/home/dev/mouseu/install/libwebsockets/lib -DLWS_INSTALL_BIN_DIR=/home/dev/mouseu/install/libwebsockets/bin -DLWS_INSTALL_INCLUDE_DIR=/home/dev/mouseu/install/libwebsockets/include -DLWS_INSTALL_EXAMPLES_DIR=/home/dev/mouseu/install/libwebsockets/example 
    make -j8
    make install
    ```