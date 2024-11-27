# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# DISCLAIMER:
# This ebuild does NOT follow the Gentoo QA Rules, instead it follows the upstream way to install and run the application

EAPI=8

DESCRIPTION="A go-based program that uploads data to a local or remote QueueMetrics"
HOMEPAGE="https://www.queuemetrics-live.com/uniloader.jsp"
SRC_URI="https://downloads.loway.ch/software/${PN}/${P}.tar.gz"
LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

RDEPEND="acct-group/queuemetrics
	acct-user/queuemetrics"

src_prepare() {
	case ${ARCH} in
		amd64) MYARCH="amd64" ;;
		*) die "Architecture ${ARCH} not yet supported" ;;
	esac

	default
}

src_test() {
	./bin/${PN}_${MYARCH} -v || die "failed to run ./{PN}_${MYARCH} -v"
}

src_install() {
	exeinto /opt/${PN}/bin
	newexe bin/${PN}_${MYARCH} ${PN}

	keepdir /var/log/${PN}
	fowners queuemetrics:queuemetrics /var/log/${PN}
	fperms 0750 /var/log/${PN}

	newconfd "${FILESDIR}/${PN}.confd" ${PN}
	newinitd "${FILESDIR}/${PN}.initd" ${PN}
}
