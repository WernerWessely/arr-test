
.PHONY: all clean lib exe

all: doodly.out

lib:
	export RUSTFLAGS="$${RUSTFLAGS} --sysroot /workspaces/rust/sysroot-ar" && export RUSTC_BOOTSTRAP=1 \
		&& cd doodly && cargo build -v --target=../../i686-br-ar.json

# ../toolchain/AS/gnuinst/V6.5.0/bin/i686-elf-gcc.exe -o doodly.out doodly.c -specs=SG4-c++_brelf.specs -D_REPLACE_CONST -nostdlib -Wl,--compress-debug-sections=zlib -Wl,-Bsymbolic-functions,--gc-sections -Wl,
doodly.out: lib doodly.c Makefile
	wine ../toolchain/AS/gnuinst/V6.5.0/bin/i686-elf-gcc.exe -o doodly.out doodly.c \
		doodly/target/i686-br-ar/debug/libdoodly.a \
		-specs=SG4-c++_brelf.specs -g

clean:
	cd doodly && cargo clean
	rm -rf *.o
	
