# This is a helper to start 9front in QEMU.
# Obviously, you should have 9front and QEMU downloaded.

# Notes:
#
# To get Go:
# - https://fqa.9front.org/appendixl.html
# - https://wiki.9front.org/building-go
#
# Etcetera:
# - To middle click with a touchpad, hold shift and right click.

# We don't need a separate install step, since `-drive` is preferred over `-cdrom`.
start: 9front.qcow2 # Launch the Plan 9 installer or boot from the drive, if Plan 9 is already installed.
	# Note: seems like using MBR instead of GPT works better under this setup.
	# To install, create a terminal and type `inst/start`.
	qemu-system-x86_64 \
		-m 6G \
		-smp 4 \
		-cdrom 9front-11554.amd64.iso \
		-drive file=9front.qcow2,format=qcow2 \
		$(ARGS) \
	;

9front.qcow2:
	qemu-img create -f qcow2 9front.qcow2 32G $(ARGS)
