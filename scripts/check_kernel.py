from sys import argv

if len(argv) != 2:
        print(f"Usage: {argv[0]} <kernel-file>")
        exit(-1)

kernel = argv[1]

with open(kernel, "rb") as f:
	f.seek(0x2c)
	a = int.from_bytes(f.read(4), "little")
	f.seek(0x28)
	b = int.from_bytes(f.read(4), "little")
	kernel_size = a - b
	print(f"kernel size: {kernel_size}")
	try:
		f.seek(kernel_size)
	except:
		print("kernel size is not valid :(")
		exit(-1)
	fdtmag = f.read(4)
	if len(fdtmag) < 4:
		print("kernel size is not valid or dtb image not added :(")
		exit(-1)
	elif fdtmag.hex() != "d00dfeed":
		print("kernel size is not valid :(")
		exit(-1)
	else:
		print("kernel looks like good :D")
