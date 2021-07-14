CC=clang
CFLAGS=-I.

ODIR=obj
DEPS = common.h chunk.h memory.h debug.h value.h vm.h

_OBJ = chunk.o memory.o debug.o value.o vm.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

clox: $(OBJ) main.c
	$(CC) -o $@ $^ $(CFLAGS)l