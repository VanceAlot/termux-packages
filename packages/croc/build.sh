TERMUX_PKG_HOMEPAGE=https://github.com/schollz/croc
TERMUX_PKG_DESCRIPTION="Easily and securely send things from one computer to another."
TERMUX_PKG_LICENSE=MIT
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="9.5.4"
TERMUX_PKG_SRCURL=https://github.com/schollz/croc/releases/download/v${TERMUX_PKG_VERSION}/croc_${TERMUX_PKG_VERSION}_src.tar.gz
TERMUX_PKG_SHA256=07fed98062170ae5b97fb0eb4db17026d91ab3a848e8612497c9e40451029f72
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
	cd $TERMUX_PKG_SRCDIR

	termux_setup_golang

	go build -o croc -trimpath
}

termux_step_make_install() {
	install -m755 croc $TERMUX_PREFIX/bin/croc
}
