#!/usr/bin/env bash

# Toolchains
ARCH=$(uname -m)
ARM_NONE_EABI=true
OPENOCD=true

# Toolchain versions
[[ -n "${ARM_NONE_EABI}" ]] && ARM_NONE_EABI_VER="15.2"
[[ -n "${OPENOCD}" ]] && OPENOCD_VER="0.12.0-7"

case "$ARCH" in
    aarch64)
        [[ "${ARM_NONE_EABI}" == true ]] && export PATH="${HOME}/.local/opt/arm-gnu-toolchain-${ARM_NONE_EABI_VER}.rel1-aarch64-arm-none-eabi/bin:${PATH}"
        [[ "${OPENOCD}" == true ]] && export PATH="${HOME}/.local/opt/xpack-openocd-${OPNEOCD_VER}/bin:${PATH}"
        ;;
    x86_64)
        [[ "${ARM_NONE_EABI}" == true ]] && export PATH="${HOME}/.local/opt/arm-gnu-toolchain-${ARM_NONE_EABI_VER}.rel1-x86_64-arm-none-eabi/bin:${PATH}"
        [[ "${OPENOCD}" == true ]] && export PATH="${HOME}/.local/opt/xpack-openocd-${OPENOCD_VER}/bin:${PATH}"
        ;;
esac

# Load pyenv if present
if [[ -d "${HOME}/.pyenv" ]]; then
    export PYENV_ROOT="${HOME}/.pyenv"
    [[ -d "${PYENV_ROOT}/bin" ]] && export PATH="${PYENV_ROOT}/bin:$PATH"
    eval "$(pyenv init -)"
fi
