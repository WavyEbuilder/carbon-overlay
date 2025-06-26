# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Hardened allocator designed for modern systems"
HOMEPAGE="https://github.com/GrapheneOS/hardened_malloc"

if [[ ${PV} == 9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/GrapheneOS/hardened_malloc.git"
else
	SRC_URI="https://github.com/GrapheneOS/${PN}/archive/refs/tags/${PV}.tar.gz
		-> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"
IUSE="+light seal-metadata"

src_compile() {
	local emakeargs=(
		CONFIG_SEAL_METADATA="$(usex seal-metadata true false)"
		CONFIG_WERROR=false
	)

	emake "${emakeargs[@]}"

	if use light; then
		emake "${emakeargs[@]}" VARIANT="light"
	fi
}

src_test() {
	# Although upstream provides a check target, that seems intended for linting
	# not testing.
	emake test
}

src_install() {
	insinto /usr/$(get_libdir)/hardened_malloc
	doins out/libhardened_malloc.so

	if use light; then
		doins out-light/libhardened_malloc-light.so
	fi

	einstalldocs
}
