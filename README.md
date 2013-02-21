Gokmax's Vim configuration
==========================

###Welcome to see my vim configuration! Below I will describe the whole features of the Gokmax's Vim.

##What is Vim?
In my opinion, vim is an editor which can almostly meet all your requirements in
the editing environment, which means you can edit in the style you want.

###NOW, below is a quick look of it.

![Screenshots](https://raw.github.com/gokmax/.vim/master/doc/quickLook.png)


###Features:

   * The left part as we can see is the Window Manager. // you can type ,wm to
       open it in the normal mode.

   * The right part is the main environment that we works. The color style of the
       code is using the ranbom-scheme which is my favorite one.

   * At the bottom of the right part these is some external information which can
       remind us where we are when typing and what it is the time.

   * The ":!" can help you to go back to the terminal temporary.

###Shortcuts:
   * 'Ctrl + h/j/k/l' to change you cursor between the different parts.


##Why should I use it?
You may say that some IDEs are strong enough to write code because of its
excellent ability to build the big project which the simple editor can NOT do.
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
* If you don't familiar to the command-line, just download the whole file as
   the .zip file in the download icon in the front of this page.
* Else if you have a git account, just type the following command in your
   terminal.  // remember to open the folder you want before git clone it!

                  git clone git://github.com/gokmax/.vim.git
* Belows Are the Installation in Unix-like system.

###Installation
1. Backup your old vim configuration files:

        mv ~/.vim ~/.vim.orig
        mv ~/.vimrc ~/.vimrc.orig

2. Clone and install this repo:

        git clone git://github.com/gokmax/.vim.git ~/.vim
        ln -s ~/.vim/vimrc ~/.vimrc

##Where should I put the .vim files? (important!)
This .vim files uses the map theory to save its configurations. As default, I
put the .vim files in the username/home/ which can easily to enter and map it to
the real configurations file which means when you change your PC of system, it
will be a great convenience since you are needn't to re-configure the vim. And,
this is the shining point of this .vim files. Bellow I will describe it more
detailedly.

##The syntax check tools that it provides:

Languages    | Lint Tools    | Install guide
------------ | ------------- | ------------
C            | gcc           | built-in
CPP          | g++           | built-in
CoffeeScript | coffee        | `npm install -g coffeelint`
CSS          | csslint       | `npm install -g csslint`
Erlang       | escript       | built-in
Go           | go            | built-in
Haml         | haml          | built-in
Haskell      | ghc-mod       | `cabal install ghc-mod`
HTML         | tidy          | built-in
Java         | javac         | built-in
Javascript   | jshint        | `npm install -g jshint`
Json         | jsonlint      | `npm install -g jsonlint`
Less         | lessc         | built-in
Lisp         | clisp         | built-in
Lua          | luac          | built-in
Perl         | perl          | built-in
PHP          | php           | built-in
Puppet       | puppet        | built-in
Python       | pyflakes      | `sudo pip install pyflakes`
Ruby         | ruby          | built-in
Scala        | scala         | built-in
Sass         | sass          | built-in
Scss         | scss/compass  | `gem install compass`
XML          | xmllint       | built-in
YAML         | js-yaml       | `npm install -g js-yaml`

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


##About the this Vim
###It is the files that many people I know and I don't know who contributed to it. I get the first version of [huige](http://github.com/copico) and develop a little of it(such write some functions or add my own color-scheme).
###Hope you can enjoy the magic tours of Vim, sincerely, Gokmax, 2013.02.21.
