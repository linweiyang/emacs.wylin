# install emacs.wylin

cp init-local.el ~/.emacs.d/lisp/init-local.el  
cp -r wylin-emacs ~/.emacs.d/lisp/wylin-emacs  


# install rtags for cmake-ide
https://github.com/Andersbakken/rtags  
In Ubuntu:  
sudo apt-get install llvm clang libclang-dev lua5.3 openssl  
git clone --recursive https://github.com/Andersbakken/rtags.git  
cd rtags  
mkdir build  
cd build  
cmake ..  
make  
make install  

restart emacs 
