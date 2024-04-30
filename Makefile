BUILDDIR=sign-0.2

all: el8 el9

el8:
	rpmdev-setuptree
	mkdir -p $(BUILDDIR)
	cp -f sign.conf $(BUILDDIR)
	cat sign-ol8.conf >> $(BUILDDIR)/sign.conf
	cp -f sign $(BUILDDIR)
	gzip -c sign.1 > $(BUILDDIR)/sign.1.gz
	tar --create --file ~/rpmbuild/SOURCES/$(BUILDDIR).tar.gz $(BUILDDIR)
	rm -rf $(BUILDDIR)
	cp sign.spec ~/rpmbuild/SPECS
	rpmbuild --define '_rel .el8' -ba ~/rpmbuild/SPECS/sign.spec

el9:
	rpmdev-setuptree
	mkdir -p $(BUILDDIR)
	cp -f sign.conf $(BUILDDIR)
	cat sign-ol9.conf >> $(BUILDDIR)/sign.conf
	cp -f sign $(BUILDDIR)
	gzip -c sign.1 > $(BUILDDIR)/sign.1.gz
	tar --create --file ~/rpmbuild/SOURCES/$(BUILDDIR).tar.gz $(BUILDDIR)
	rm -rf $(BUILDDIR)
	cp sign.spec ~/rpmbuild/SPECS
	rpmbuild --define '_rel .el9' -ba ~/rpmbuild/SPECS/sign.spec
