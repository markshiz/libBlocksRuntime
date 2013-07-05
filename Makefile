# AUTOMATICALLY GENERATED -- DO NOT EDIT
CC = clang
INSTALL ?= /usr/bin/install
LD = clang


default: all

all:  libBlocksRuntime.so libBlocksRuntime.a blktest

blktest: test/main.o
	$(LD)  -o blktest -L . -Wl,-rpath,. -L . $(LDFLAGS) test/main.o libBlocksRuntime.a $(LDADD)

check:  blktest
	./blktest

clean: 
	rm -f *.rpm
	rm -f libBlocksRuntime-0.3.tar.gz
	rm -f runtime.o
	rm -f data.o
	rm -f libBlocksRuntime.so
	rm -f libBlocksRuntime.a
	rm -f test/main.o
	rm -f blktest

config.h: 
	@echo "/* AUTOMATICALLY GENERATED -- DO NOT EDIT */" > config.h.tmp
	@date > config.log
	@rm -f conftest.c conftest.o
	@mv config.h.tmp config.h

data.o: data.c Makefile
	$(CC) -DHAVE_CONFIG_H -I. -DBlocksRuntime_EXPORTS -DHAVE_SYNC_BOOL_COMPARE_AND_SWAP_INT -DHAVE_SYNC_BOOL_COMPARE_AND_SWAP_LONG -std=c99 -Wall -Wextra -W -pedantic -Wno-unused-parameter -o data.o -fPIC -DPIC $(CFLAGS) -c data.c

dist: libBlocksRuntime-0.3.tar.gz

distclean: clean 
	rm -f Makefile
	rm -f libBlocksRuntime-0.3.tar.gz
	rm -f config.h
	rm -f config.yaml
	rm -f rpm.spec

distdir: 
	umask 22 ; mkdir -p '$(distdir)/test'
	umask 22 ; mkdir -p '$(distdir)/makeconf'
	umask 22 ; mkdir -p '$(distdir)/makeconf/makeconf'
	cp -RL runtime.c Block_private.h config.h Makefile data.c Block.h configure configure.rb $(distdir)
	cp -RL test/main.c $(distdir)/test
	cp -RL makeconf/makeconf.rb $(distdir)/makeconf
	cp -RL makeconf/makeconf/*.rb $(distdir)/makeconf/makeconf

install: 
	/usr/bin/test -e $(DESTDIR)/usr/local/lib || $(INSTALL) -d -m 755 $(DESTDIR)/usr/local/lib
	$(INSTALL) -m 0644 libBlocksRuntime.so $(DESTDIR)/usr/local/lib/libBlocksRuntime.so.0.0
	/usr/bin/test -e $(DESTDIR)/usr/local/include || $(INSTALL) -d -m 755 $(DESTDIR)/usr/local/include
	$(INSTALL) -m 644 Block.h Block_private.h $(DESTDIR)/usr/local/include

libBlocksRuntime-0.3.tar.gz: 
	rm -rf libBlocksRuntime-0.3
	mkdir libBlocksRuntime-0.3
	$(MAKE) distdir distdir=libBlocksRuntime-0.3
	rm -rf libBlocksRuntime-0.3.tar libBlocksRuntime-0.3.tar.gz
	tar cf libBlocksRuntime-0.3.tar libBlocksRuntime-0.3
	gzip libBlocksRuntime-0.3.tar
	rm -rf libBlocksRuntime-0.3

libBlocksRuntime.a: runtime.o data.o
	ar cru libBlocksRuntime.a runtime.o data.o
	ranlib libBlocksRuntime.a

libBlocksRuntime.so: runtime.o data.o
	$(LD)  -o libBlocksRuntime.so -shared -fPIC -L . $(LDFLAGS) runtime.o data.o $(LDADD)

package: clean libBlocksRuntime-0.3.tar.gz
	rm -rf rpm *.rpm
	mkdir -p rpm/BUILD rpm/RPMS rpm/SOURCES rpm/SPECS rpm/SRPMS
	mkdir -p rpm/RPMS/i386 rpm/RPMS/x86_64
	cp libBlocksRuntime-0.3.tar.gz rpm/SOURCES
	rpmbuild --define "_topdir `pwd`/rpm" -bs rpm.spec
	cp rpm.spec rpm/SPECS/rpm.spec
	rpmbuild --define "_topdir `pwd`/rpm" -bb ./rpm/SPECS/rpm.spec
	mv ./rpm/SRPMS/* ./rpm/RPMS/*/*.rpm .
	rm -rf rpm

runtime.o: runtime.c Block_private.h config.h Makefile
	$(CC) -DHAVE_CONFIG_H -I. -DBlocksRuntime_EXPORTS -DHAVE_SYNC_BOOL_COMPARE_AND_SWAP_INT -DHAVE_SYNC_BOOL_COMPARE_AND_SWAP_LONG -std=c99 -Wall -Wextra -W -pedantic -Wno-unused-parameter -o runtime.o -fPIC -DPIC $(CFLAGS) -c runtime.c

test/main.o: test/main.c Block.h Makefile
	$(CC) -DHAVE_CONFIG_H -I. -I. -fblocks -g -O0 -o test/main.o $(CFLAGS) -c test/main.c

uninstall: 
	rm -f $(DESTDIR)/usr/local/lib/libBlocksRuntime.so
	rm -f $(DESTDIR)/usr/local/include/Block.h $(DESTDIR)/usr/local/include/Block_private.h
