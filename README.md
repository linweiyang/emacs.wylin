# Install emacs configuration
1. If you don't have purcell's configuration of emacs, please install it with the following command.  
	$ git clone https://github.com/purcell/emacs.d ~/.emacs.d  

2. Install my emacs configuration.  
	$ git clone https://github.com/linweiyang/emacs.wylin  
	$ cd emacs.wylin  
	$ cp init-local.el ~/.emacs.d/lisp/init-local.el  
	$ cp -r wylin-emacs ~/.emacs.d/lisp/wylin-emacs  
    
    <font color=#ff0000>NOTE: Recommend to use Chinese mirror in China.</font>  
    cp mirror/init-elpa.el ~/.emacs.d/lisp/lisp/init-elpa.el
    

3. For google cpplint.  
	$ sudo apt-get install python-pip  
	$ sudo pip install cpplint  

4. Change 'Caps' to 'Ctrl' (not swap), create ~/.Xmodmap file in Linux:  
   remove Lock = Caps_Lock  
   keysym Caps_Lock = Control_L  
   add control = Control_L  
	
	(In ubuntu 14 or 16, we need to add "xmodmap ~/.Xmodmap" at the end of ~/.xinputc file.)  

# install rtags for cmake-ide. (if you don't like it, just ignore this section)
Rtags URL: https://github.com/Andersbakken/rtags  
Rtags is a c/c++ client/server indexer for c/c++/objc[++] with integration for Emacs based on clang.  
Rtags need helm packge, but the helm package only supports emacs version >= 24.4. User need to install emacs 24.4 or higher version.  
1. Provided packages for LTS 14.04 and 16.04. Stable versions (25.1 currently):  
	$ sudo apt-add-repository -y ppa:adrozdoff/emacs  
	$ sudo apt update  
	$ sudo apt install emacs25  
2. Or compile emacs by yourself : http://ubuntuhandbook.org/index.php/2014/10/emacs-24-4-released-install-in-ubuntu-14-04/  

-----------
Prepare for installing rtags:  
for Ubuntu :       sudo apt-get install llvm clang libclang-dev openssl  
for OSX or macOS : brew install llvm --with-libcxx --with-clang --without-assertions --with-rtti  

<font color=#ff0000>NOTE:</font>  
1. LLVM/Clang >= 3.3  
2. GCC/Clang >= 4.7/3.2  
3. cmake >= 2.8  
4. emacs >= 24.4 is recommended  

-----------
Install rtags.  
$ git clone --recursive https://github.com/Andersbakken/rtags.git  
$ cd rtags  
$ mkdir build  
$ cd build  
$ cmake ..  
$ make  
$ sudo make install  

Usage:  
In a cmake project using the following command to compile the source code   
$ cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ..  

In simple method, please add cmake-rtags to .bashrc  
$ echo alias cmake-rtags=\'cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1\' >> ~/.bashrc


# Start emacs and enjoy yourself :)
