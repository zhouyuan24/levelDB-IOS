levelDB-IOS

===========
为什么要用leveldb
跑分请看此文http://blog.nosqlfan.com/html/2819.html
注意：LevelDB 是 非关系型数据库，Keyvalue 模式的，有点类似于redis，而SQLite 是关系数据库。
使用的情景不一样。
编译准备：
clone levelDB repo https://code.google.com/p/leveldb/
编译
在levelDB 根目录下 CXXFLAGS=-stdlib=libc++ make PLATFORM=IOS
注意：如果出现
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ranlib: archive library: libleveldb.a will be fat and ar(1) will not be able to operate on it
我们貌似可以无视掉。。。
设置工程
将.a 和include 拖入XCode
由于是cpp项目，记得把和leveldb有关的所有.m 都改成.mm
在build setting 里面修改一下header path。
编译
处理错误
这个时候报了一个错，找不到arm64，于是就在Build Setting 里面将 Architectures 改成 armv7 armv7s
结果还报错，找不到armv7s
于是我随手就把.a扔入ida了

明显，这个Makefile 文件有点老了，需要改一下：
vim Makefile
通过 /IOS 定位到 .cc.o: 和 .c.o:
将里面的 -arch armv6 改成 -arch armv7s
添加arm64 -arch arm64
:wq!
make clean
CXXFLAGS=-stdlib=libc++ make PLATFORM=IOS
再编译就一切正常了。
注意：如果添加了arm64支持，记得把Architectures改回standard
