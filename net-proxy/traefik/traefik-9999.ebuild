# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGO_PN="github.com/traefik/traefik"
inherit golang-vcs
inherit golang-build
inherit systemd user

DESCRIPTION="A modern HTTP reverse proxy and load balancer made to deploy microservices"
HOMEPAGE="https://traefik.io"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug examples pie"

G="$WORKDIR/$P/src/$EGO_PN"

pkg_setup() {
	enewgroup traefik
	enewuser traefik -1 -1 -1 traefik
}

src_unpack(){
	golang-vcs_src_unpack
	cd $G
	GO111MODULE=off go get github.com/containous/go-bindata/...
	PATH="$HOME/go/bin:$PATH"
	go generate || die
	go build ./cmd/traefik || die
}

src_install() {
	dobin $G/traefik
	use debug && dostrip -x /usr/bin/traefik
	einstalldocs

	newinitd "${FILESDIR}/${PN}.initd" "${PN}"
	newconfd "${FILESDIR}/${PN}.confd" "${PN}"
	systemd_dounit "${FILESDIR}/${PN}.service"

	insinto /etc/traefik
	newins $G/traefik.sample.toml traefik.toml.example

	if use examples; then
		docinto examples
		dodoc -r examples/*
		docompress -x "/usr/share/doc/${PF}/examples"
	fi

	diropts -o traefik -g traefik -m 0750
	keepdir /var/log/traefik
}

pkg_postinst() {
	if [[ ! -e "${EROOT}/etc/traefik/traefik.toml" ]]; then
		elog "No traefik.toml found, copying the example over"
		cp "${EROOT}"/etc/traefik/traefik.toml{.example,} || die
	else
		elog "traefik.toml found, please check example file for possible changes"
	fi
}
