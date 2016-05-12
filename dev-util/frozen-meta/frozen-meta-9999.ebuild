EAPI=5

DESCRIPTION="Data management and processing library"
HOMEPAGE="http://x86-64.github.com/frozen/"
SRC_URI=""

LICENSE="|| ( GPL-3 )"
SLOT="1"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="
	dev-util/frozen-curl
	dev-util/frozen-gzip
	dev-util/frozen-leveldb
	dev-util/frozen-memcache
	dev-util/frozen-mustache
	dev-util/frozen-openssl
	dev-util/frozen-perl
	dev-util/frozen-redis
	dev-util/frozen-wgetlib
	dev-util/frozen-curl
"
