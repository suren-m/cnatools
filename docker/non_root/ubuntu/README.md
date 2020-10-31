## Notes on Alpine

For Alpine, use `addgroup` and `adduser` instead. (need `shadow` package for useradd)

Also note that alpine uses `musl` and and not use `glibc`. `musl` is partially binary compatible with glibc.

Alpine also uses the lightweight `OpenRC` for init system instead of `systemd` that is used on other distros such as `debian`, `arch`, `centos`, etc.