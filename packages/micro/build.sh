TERMUX_PKG_HOMEPAGE=https://micro-editor.github.io/
TERMUX_PKG_DESCRIPTION="Modern and intuitive terminal-based text editor"
TERMUX_PKG_VERSION=1.3.2
TERMUX_PKG_SHA256=1a08301e39353914d7e699e36455bac1fee7d6d5ff1e211499bc10b46d8b35f5
TERMUX_PKG_SRCURL=https://github.com/zyedidia/micro/releases/download/v${TERMUX_PKG_VERSION}/micro-${TERMUX_PKG_VERSION}-src.tar.gz

termux_step_make() {
	return
}

termux_step_make_install() {
	termux_setup_golang

	export GOPATH=$TERMUX_PKG_BUILDDIR
	local MICRO_SRC=$GOPATH/src/github.com/zyedidia/micro

	cd $TERMUX_PKG_SRCDIR
	mkdir -p $MICRO_SRC
	cp -R . $MICRO_SRC

	cd $MICRO_SRC
	make build-quick
	mv micro $TERMUX_PREFIX/bin/micro
}
