
GPARAMS = -m32 -fno-use-cxa-atexit -nostdlib -fno-builtin -fno-rtti -fno-exceptions -fno-leading-underscore
APARAMS = --32
LDPARAMS = -melf_i386

objects = loader.o kernel.o

%.o: %.cpp
	g++ $(GPARAMS) -o $@ -c $<

%.o: %.s
	as $(APARAMS) -o $@ $<

airos.bin: linker.ld $(objects)
	ld $(LDPARAMS) -T $< -o $@ $(objects)

install: airos.bin
	sudo cp $< /boot/airos.bin
