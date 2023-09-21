export LD_LIBRARY_PATH=/home/liushangyang/dev/mouseu/wss_demo/lib:$LD_LIBRARY_PATH;
cd client
rm -rf wssClient out
mkdir wssClient out
cd ./wssClient
cmake ..
make -j
cd ../out
cp ../../lib/* .
./wssClient
