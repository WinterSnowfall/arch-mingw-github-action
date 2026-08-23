FROM archlinux:base-devel

RUN echo -e '\n\n[multilib]\nInclude = /etc/pacman.d/mirrorlist\n\n' >> /etc/pacman.conf
RUN pacman-key --init
RUN pacman -Sy --needed --noconfirm archlinux-keyring
RUN pacman -Syu --needed --noconfirm clang meson glslang git mingw-w64 wine libunwind base bash base-devel sed git tar curl wget bash gzip sudo file gawk grep bzip2 which pacman systemd findutils diffutils coreutils procps-ng util-linux
RUN git config --system --add safe.directory /github/workspace

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

