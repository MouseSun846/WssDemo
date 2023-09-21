export LD_LIBRARY_PATH=/home/liushangyang/dev/mouseu/wss_demo/lib:$LD_LIBRARY_PATH;
cd server
rm -rf wssServer out
mkdir wssServer out
cd ./wssServer
cmake ..
make -j
cd ../out
./wssServer
