# Zero out the free space to save space in the final image:
set +e
dd if=/dev/zero of=/zero bs=1M
set -e

sync
rm -fv /zero

