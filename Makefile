BUILDDIR=sign-0.2

all: el8 el9

el8:
	rpmdev-setuptree
	mkdir -p $(BUILDDIR)
	cp -f sign.conf $(BUILDDIR)
	cp -f sign $(BUILDDIR)
	gzip -c sign.1 > $(BUILDDIR)/sign.1.gz
	patch $(BUILDDIR)/sign 0001-Hack-to-work-around-efikeygen-bug-in-OL8.patch
	tar --create --file ~/rpmbuild/SOURCES/$(BUILDDIR).tar.gz $(BUILDDIR)
	rm -rf $(BUILDDIR)
	cp sign.spec ~/rpmbuild/SPECS
	rpmbuild --define '_rel .el8' -ba ~/rpmbuild/SPECS/sign.spec

el9:
	rpmdev-setuptree
	mkdir -p $(BUILDDIR)
	cp -f sign.conf $(BUILDDIR)
	cp -f sign $(BUILDDIR)
	gzip -c sign.1 > $(BUILDDIR)/sign.1.gz
	tar --create --file ~/rpmbuild/SOURCES/$(BUILDDIR).tar.gz $(BUILDDIR)
	rm -rf $(BUILDDIR)
	cp sign.spec ~/rpmbuild/SPECS
	rpmbuild --define '_rel .el9' -ba ~/rpmbuild/SPECS/sign.spec
