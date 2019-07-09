#!/usr/bin/env bash
#
# installer

uninstall_manpage() {
  printf '%s\n' "Remove man page from /usr/local/man/man8"

  if [[ -e "/usr/local/man/man8/${INSTALLABLE_NAME}.8.gz" ]]; then
    rm /usr/local/man/man8/${INSTALLABLE_NAME}.8.gz
  fi
}

uninstall() {
  printf '%s\n' "Remove installation"

  if [[ -d "${INSTALL_DIRECTORY_PATH}/${INSTALLABLE_NAME}" ]]; then
    rm -r "${INSTALL_DIRECTORY_PATH}/${INSTALLABLE_NAME}"
  fi

  printf '%s\n' "Remove symbolic link from /usr/local/bin"

  if [[ -L "/usr/local/bin/${INSTALLABLE_NAME}" ]]; then
    unlink /usr/local/bin/${INSTALLABLE_NAME}
  fi

  uninstall_manpage
}

upgrade() {
  local tmp_script_location="/tmp/dcc-download.sh"

  printf '%s\n' "Upgrading dcc.sh to latest version"

  if [[ ! -d /tmp ]]; then
    mkdir /tmp
  fi

  printf '%s\n' "Creating temporary supa.sh download script as ${tmp_script_location}"
  cp "${INSTALL_DIRECTORY_PATH}/${INSTALLABLE_NAME}/download.sh" "${tmp_script_location}"

  uninstall
  source "${tmp_script_location}"

  rm "${tmp_script_location}"
}
