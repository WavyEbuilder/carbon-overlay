# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

WANT_AUTOCONF="2.69"
inherit autotools

DESCRIPTION="A tool for detecting usbguard policy and device presence changes"
HOMEPAGE="https://github.com/Cropi/usbguard-notifier"

if [[ ${PV} == 9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Cropi/usbguard-notifier.git"
else
	SRC_URI="https://github.com/Cropi/${PN}/releases/download/${P}/${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-2"
SLOT="0"

DEPEND="
	app-text/asciidoc
	gnome-base/librsvg
	sys-apps/usbguard
	x11-libs/libnotify
"

PATCHES=(
	"${FILESDIR}/0001-configure.ac-use-Gentoo-path-for-Catch2-headers.patch"
	"${FILESDIR}/0002-autotools-use-printf-instead-of-echo-e-for-posix-com.patch"
	"${FILESDIR}/0003-autotools-concatenate-CXXFLAGS-in-a-posix-compliant-.patch"
)

src_prepare() {
	default

	eautoreconf
}
