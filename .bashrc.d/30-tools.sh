#!/usr/bin/env bash

# Current machine architecture
HOST_ARCH=$(uname -m)

# Defaults
TOOLCHAIN_DIR=${TOOLCHAIN_DIR:-"${HOME}/.local/opt"}
ARM_NONE_EABI=${ARM_NONE_EABI:-true}
OPENOCD=${OPENOCD:-true}

function load_toolchains() {
    # 32-bit ARM target cross compiler
    if [[ "${ARM_NONE_EABI}" == true ]]; then
        local ARM_NONE_EABI_BIN="${TOOLCHAIN_DIR}/arm-gnu-toolchain-15.2.rel1-${HOST_ARCH}-arm-none-eabi/bin"

        # Check if arm-none-eabi bin directory exists, and if it has already been added to the PATH
        if [[ -d "${ARM_NONE_EABI_BIN}" ]] && [[ ":${PATH}:" != *":${ARM_NONE_EABI_BIN}:"* ]]; then
            export PATH="${ARM_NONE_EABI_BIN}:${PATH}"
        fi
    fi

    # OpenOCD
    if [[ "${OPENOCD}" == true ]]; then
        local OPENOCD_BIN="${TOOLCHAIN_DIR}/xpack-openocd-0.12.0-7/bin"

        if [[ -d "${OPENOCD_BIN}" ]] && [[ ":${PATH}:" != *":${OPENOCD_BIN}:"* ]]; then
            export PATH="${OPENOCD_BIN}:${PATH}"
        fi
    fi

    # Load pyenv if present
    if [[ -d "${HOME}/.pyenv" ]]; then
        export PYENV_ROOT="${HOME}/.pyenv"
        if [[ -d "${PYENV_ROOT}/bin" ]] && [[ ":${PATH}:" != *":${PYENV_ROOT}/bin:"* ]]; then
            export PATH="${PYENV_ROOT}/bin:$PATH"
        fi
        eval "$(pyenv init -)"
    fi
}
