from sys import argv
from os.path import getsize

if len(argv) != 2:
	print(f"Usage: {argv[0]} <kernel-file>")
	exit(-1)

kernel = argv[1]
kernel_size = getsize(kernel)

with open(kernel, "r+b") as f:
	f.seek(0x28)
	f.write(bytes([0,0,0,0]))
	f.seek(0x2c)
	f.write(kernel_size.to_bytes(4, byteorder='little'))
