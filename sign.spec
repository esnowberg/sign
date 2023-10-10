Name:           sign
Version:        0.1
#Release:        1%{?dist}
Release:        1%{?_rel}
Summary:        Dev signing tools
BuildArch:      noarch
Packager:	Eric Snowberg <eric.snowberg@oracle.com>

License:        GPLv2+
Source0:        %{name}-%{version}.tar.gz

Requires:       pesign
Requires:	efivar
Requires:	glibc-common
Requires:	mokutil
Requires:	nss-tools
Requires:	binutils
Requires:	gawk
Requires:	coreutils
Requires:	kernel-headers
Requires:	ima-evm-utils

%description
Signing Tools for Developers.

%prep
%autosetup

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT/usr/bin
mkdir -p $RPM_BUILD_ROOT/etc/sign
install -m 755 sign $RPM_BUILD_ROOT/usr/bin
install -m 644 sign.conf $RPM_BUILD_ROOT/etc/sign

%clean
rm -rf $RPM_BUILD_ROOT

%files
/usr/bin/sign
/etc/sign/sign.conf

%changelog
* Thu Oct 5 2023 Eric Snowberg <eric.snowberg@oracle.com>
-
