pkg_name=lens-composer-install
pkg_origin=holo
pkg_version="2.1"
pkg_maintainer="Chris Alfano <chris@jarv.us>"
pkg_license=("Apache-2.0")

pkg_deps=(
  core/bash
  jarvus/composer/2.1.9/20211022205258 # pending https://github.com/habitat-sh/core-plans/pull/4194
  jarvus/hologit
)

pkg_bin_dirs=(bin)


do_build() {
  return 0
}

do_build() {

  pushd "${CACHE_PATH}" > /dev/null
    build_line "Preparing bin scripts"
    mkdir -v "bin"
    cp -v "${PLAN_CONTEXT}/bin"/* "./bin/"
    fix_interpreter "bin/*" core/bash bin/bash
  popd > /dev/null
}

do_install() {
  cp -r "${CACHE_PATH}"/* "${pkg_prefix}/"
}

do_strip() {
  return 0
}
