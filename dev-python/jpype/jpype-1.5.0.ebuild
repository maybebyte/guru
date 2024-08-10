# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1

DESCRIPTION="Cross-language bridge to allow Python programs full access to Java class libraries"
HOMEPAGE="https://github.com/jpype-project/jpype/"
SRC_URI="https://github.com/jpype-project/jpype/releases/download/v1.5.0/JPype1-1.5.0.tar.gz "
S=${WORKDIR}/JPype1-${PV}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="
    test? (
        dev-python/pyinstaller
    )
    virtual/jdk
"

distutils_enable_tests pytest

# WORKAROUND: Overload function to nullify blocking QA check.
# To be deleted after resolution of
# https://bugs.gentoo.org/937642
_distutils-r1_post_python_install() {
    local keep
}