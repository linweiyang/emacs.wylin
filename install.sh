#!/bin/bash

# 

sed -i 's/\/\/elpa.gnu.org\/packages/\/\/mirrors.tuna.tsinghua.edu.cn\/elpa\/gnu/' ~/.emacs.d/lisp/init-elpa.el
sed -i 's/\/\/melpa.org\/packages/\/\/mirrors.tuna.tsinghua.edu.cn\/elpa\/melpa/' ~/.emacs.d/lisp/init-elpa.el
sed -i 's/\/\/orgmode.org\/elpa/\/\/mirrors.tuna.tsinghua.edu.cn\/elpa\/org/' ~/.emacs.d/lisp/init-elpa.el
cp init-local.el ~/.emacs.d/lisp/
cp -r wylin-emacs ~/.emacs.d/lisp/ 


