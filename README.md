Gokmax's vim configuration
==========================

Welcome to see my vim configuration! Below will describe the whole features of
the Gokmax's vim.

##What is vim?
In my opinion, vim is an editor which can almostly meet all your requirements in
the editing environment, which means you can edit in the style you want.

##Why should I use it?
You may say that some IDEs are strong enough to write code because of its
excellent ability to build the big project which the simple editor can't do.
Yeah, it is a main reason that sometimes I don't use it too.
But, without that reason personally I think there is no reason to reject such a
good editor because it can give you what you want -- the pleasant sensation of
writing quick codes and the quick moves of your flexible fingers and the tap-tap
of your keyboard. In addition and of course, it can improve your efficiency of
your work! And that's very important.

##How to use it?
If you are familiar to the vim and know the basic control of it, just skip this
paragraph. But if you are new to it, the next post may help you.

* [Vim Introduction and Tutorial](http://blog.interlinked.org/tutorials/vim_tutorial.html)
* [Vim plugins I use](http://mirnazim.org/writings/vim-plugins-i-use/)

##How to get it as my vim file?
1. If you don't familiar to the command-line, just download the whole file as 
   the .zip file in the download icon in the front of this page.
2. Else if you have a git account, just type the following command in your 
   terminal.  // remember to cd the folder you want before git clone it!
•git clone git://github.com/gokmax/.vim.git

##The shining feature of this vim file comparing to other one.

###Shining points
The scripts are grouped separated with each one in a single folder, which
leads to better add and remove. In addition, most of the scripts that work
for specific language, such as c, will only loaded when you are writing the
specific language, thus saving key mappings and accelerate the start up.

###Requirements
1. *clang* is installed in order to use the clang completion plugin.
   You'd better install clang is the default path.
2. *cscope* is installed. You'd better install cscope in the default
   path.
3. *cscope* feature is enabled if you compile vim from source code.
4. *python* feature should be enabled when you compile you vim

###Remarkable Features
1. Fairly good completion method, you can almost complete everything
   in C and C++ with a fairly fast speed. I don't use *ctags* for
   completion any longer, instead, I use *clang_complete* and
   *neocomplcache*, making them working together at the same time. You
   can even use such complete method for the Qt library, which is
   quite large.

2. Nice cross-reference look up using *cscope*. I replace *ctags*
   completely with *cscope*. Now *cscope* has better capability, and
   you can jump to and jump back just like using ctags. For more
   keymappings you can refer to *.vim/bundle/cscope/plugin/cscope.vim*
