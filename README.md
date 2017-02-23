# Install emacs configuration
1. If you don't have purcell's configuration of emacs, please install it with the following command.  
	git clone https://github.com/purcell/emacs.d ~/.emacs.d  

2. Install my emacs configuration.  
	git clone https://github.com/linweiyang/emacs.wylin  
	cd emacs.wylin  
	cp init-local.el ~/.emacs.d/lisp/init-local.el  
	cp -r wylin-emacs ~/.emacs.d/lisp/wylin-emacs  

3. For google cpplint.  
	sudo apt-get install python-pip  
	sudo pip install cpplint  

4. Change 'Caps' to 'Ctrl' (not swap), create ~/.Xmodmap file in Linux:  
	remove Lock = Caps_Lock  
	keysym Caps_Lock = Control_L  
	add control = Control_L  
	
	(In ubuntu 14 or 16, we need to add "xmodmap ~/.Xmodmap" at the end of ~/.xinputc file.)  

# install rtags for cmake-ide. (if you don't like it, just ignore this section)
Rtags URL: https://github.com/Andersbakken/rtags  
Rtags is a c/c++ client/server indexer for c/c++/objc[++] with integration for Emacs based on clang.  
Rtags need helm packge, but the helm package only supports emacs version >= 24.4. User need to install emacs 24.4 or higher version.  
(User can also compile emacs using the link : http://ubuntuhandbook.org/index.php/2014/10/emacs-24-4-released-install-in-ubuntu-14-04/)  
-----------
The following shows how to rtags:  
for Ubuntu : sudo apt-get install llvm clang libclang-dev openssl  
for OSX or macOS : brew install llvm --with-libcxx --with-clang --without-assertions --with-rtti  

NOTE:  
1. LLVM/Clang >= 3.3  
2. GCC/Clang >= 4.7/3.2  
3. cmake >= 2.8  
4. emacs >= 24.4 is recommended  

-----------
Install rtags.  
git clone --recursive https://github.com/Andersbakken/rtags.git  
cd rtags  
mkdir build  
cd build  
cmake ..  
make  
sudo make install  

# Start emacs and enjoy yourself :)
