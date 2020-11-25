# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3

EAPI=7

inherit autotools git-r3

DESCRIPTION="Auks"
HOMEPAGE="https://github.com/hautreux/auks"
EGIT_REPO_URI="https://github.com/hautreux/auks.git"

LICENSE="CeCILL-C"
SLOT="1"
KEYWORDS="amd64 x86"
IUSE="slurm"

DEPEND="
	>=app-crypt/mit-krb5-1.18
	slurm? (
		sys-cluster/slurm
	)
"
RDEPEND="${DEPEND}"

src_prepare(){
	eautoreconf
	sed 's/krb5_rc_resolve_full/k5_rc_resolve/' -i src/api/auks/auks_krb5_stream.c
	sed 's/krb5_rc_close/k5_rc_close/' -i src/api/auks/auks_krb5_stream.c
	default
}

src_configure() {
	econf \
		$(use_with slurm)
}

src_install(){
	default

	dodir /etc/auks/
	cp "${S}"/etc/*.example "${D}"/etc/

	newinitd "${FILESDIR}"/init.d.auksd auksd
	newinitd "${FILESDIR}"/init.d.auksd auksdrenewer
	newinitd "${FILESDIR}"/init.d.auksd aukspriv

	if use slurm; then
		dodir /etc/slurm/plugstack.conf.d/
		cp "${S}"/src/plugins/slurm/slurm-spank-auks.conf "${D}"/etc/slurm/plugstack.conf.d/auks.conf.example
	fi
}
