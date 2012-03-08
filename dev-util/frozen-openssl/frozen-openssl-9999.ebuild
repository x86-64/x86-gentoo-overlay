# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3

EAPI=4
WANT_AUTOCONF=2.5
WANT_AUTOMAKE=1.11

inherit autotools git-2

DESCRIPTION="OpenSSL support for frozen"
HOMEPAGE="https://github.com/x86-64/frozen-openssl"
EGIT_REPO_URI="git://github.com/x86-64/frozen-openssl.git"

LICENSE="|| ( GPL-3 )"
SLOT="1"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="
	dev-util/frozen
	dev-libs/openssl
"
RDEPEND="${DEPEND}"

src_prepare(){
	eautoreconf
}
