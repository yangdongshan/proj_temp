

CUR_DIR=$(shell pwd)

COBJ=$(patsubst %.c,%.o,$(CSRC))

obj: SUBMODULE $(COBJ)

SUBMODULE:$(MODULE)
	$(Q) $(foreach dir,$(MODULE),$(MAKE) -C ./$(dir) obj;)

%.o:%.c
	$(Q) echo "CC -c $^ -o $@"
	$(Q) $(CC) $(CFLAGS) -c $^ -o $@

.PHONY: clean lib

LIB_OBJS=$(shell find . -name *.o)

lib:
	$(Q) echo "ar $(libname) $(LIB_OBJS)"
	$(Q) $(AR) $(ARFLAGS) $(libname) $(LIB_OBJS)

clean:
	$(Q) $(foreach dir,$(MODULE),$(MAKE) -C ./$(dir) clean;)
	$(Q) rm -rf $(COBJ)

