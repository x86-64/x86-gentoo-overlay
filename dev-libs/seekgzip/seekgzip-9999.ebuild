# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3

EAPI=5

inherit git-2

DESCRIPTION="Seekgzip library"
HOMEPAGE="https://github.com/chokkan/seekgzip"
EGIT_REPO_URI="git://github.com/x86-64/seekgzip.git"

LICENSE="|| ( zlib )"
SLOT="1"
KEYWORDS="amd64 x86"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare(){
	sed "s/\(PHONY_TARGETS=\).python/\1/g" -i ${S}/Makefile
}

src_compile(){
	emake all
}
