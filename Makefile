
PROJ_NAME=test

ifeq ($(V),)
	Q=@
else
	Q=
endif

export Q

CC=gcc
export CC

CFLAGS=-g
export CFLAGS

ARFLAGS=rcs
export ARFLAGS

SRC_ROOT=$(shell pwd)
export SRC_ROOT

SCRIPTS=$(SRC_ROOT)/scripts
export SCRIPTS

lib_dir:= src \
	      kernel

libs=$(foreach dir,$(lib_dir),$(dir)/$(dir).a)

all: lib main.o
	$(Q) $(CC) -o $(PROJ_NAME).elf main.o $(libs)

lib: $(lib_dir)
	$(Q) $(foreach dir, $(lib_dir),\
		$(MAKE) -C $(dir) obj;\
		$(MAKE) -C $(dir) lib libname=$(dir).a;)

%.o:%.c
	$(Q) $(CC) $(CFLAGS) -c $^ -o $@

clean:
	$(Q) $(foreach dir, $(lib_dir), $(MAKE) -C $(dir) clean;)
	$(Q) rm -rf $(PROJ_NAME).elf $(libs) main.o
