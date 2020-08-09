# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit java-pkg-2 eutils unpacker

DESCRIPTION="LDAP Synchronization Connector"
HOMEPAGE="http://lsc-project.org/"
SRC_URI="
	https://lsc-project.org/archives/lsc-core-2.1.5-dist.tar.gz -> ${P}.tar.gz
	https://lsc-project.org/archives/lsc-executable-plugin_1.0-1_all.deb
	https://lsc-project.org/archives/lsc-nis-plugin_1.0-1_all.deb
	https://lsc-project.org/archives/lsc-obm-plugin_1.4-1_all.deb
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

COMMON_DEP="
	dev-perl/Text-CSV
	dev-perl/perl-ldap
"
RDEPEND="${COMMON_DEP}
	>=virtual/jre-1.5"
DEPEND="${COMMON_DEP}
	>=virtual/jdk-1.5"
BDEPEND=""

pkg_setup() {
	java-pkg-2_pkg_setup
}

src_install() {
	java-pkg_dojar lib/*.jar
	sed -i \
		-e "s|^LSC_HOME=.*|LSC_HOME=\"/usr/share/${PN}\"|" \
		"${S}"/bin/* \
		|| die
	insinto "/usr/share/${PN}"
	doins -r "${S}"/*
	doins -r "${WORKDIR}"/var/lib/lsc/*

	insinto "/usr/share/${PN}/lib"
	doins -r "${WORKDIR}"/usr/lib/lsc/*

	chmod +x "${D}"/usr/share/${PN}/bin/* "${D}"/usr/share/${PN}/*.pl
	dosym /usr/share/${PN}/bin/lsc /usr/bin/lsc
	dosym /usr/share/${PN}/bin/lsc-agent /usr/bin/lsc-agent
	dosym /usr/share/${PN}/bin/hsqldb /usr/bin/hsqldb
}
