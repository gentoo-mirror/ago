# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# DISCLAIMER:
# This ebuild does NOT follow the Gentoo QA Rules, instead it follows the upstream way to install and run the application

EAPI=7

inherit user

TOMCAT_VERSION="8.5.40"

DESCRIPTION="A monitoring and reporting suite for asterisk based PBX"
HOMEPAGE="https://www.queuemetrics.com"
LICENSE="all-rights-reserved"
SRC_URI="https://archive.apache.org/dist/tomcat/tomcat-8/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz \
	http://downloads.loway.ch/qm/QueueMetrics-${PV}.tar.gz"
RESTRICT="mirror"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+mysql uniloader"

RDEPEND="virtual/jdk:1.8"
PDEPEND="mysql? ( virtual/mysql[server] )
	uniloader? ( app-metrics/uniloader )"

S="${WORKDIR}"

pkg_setup() {
	enewgroup ${PN}
	enewuser ${PN} -1 -1 -1 ${PN}
}

src_prepare() {
	ewarn
	ewarn
	ewarn "This ebuild will restart your queuemetrics instance"
	ewarn
	ewarn
	sleep 5
	default
}

src_install() {
	dodir /opt/${PN}/tomcat/{logs,temp,webapps,work}
	insinto /opt/${PN}/tomcat
	doins -r apache-tomcat-${TOMCAT_VERSION}/{bin,conf,lib}

	fowners -R ${PN}:${PN} /opt/${PN}
	fperms 0750 /opt/${PN}

	cp -r ${P} "${D}"/opt/${PN}/tomcat/webapps/${PN}

	newconfd "${FILESDIR}/${PN}.confd" ${PN}
	newinitd "${FILESDIR}/${PN}.initd" ${PN}

	doenvd "${FILESDIR}/25${PN}"
}
