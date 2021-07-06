CC=gcc
CFLAGS=-I.

ODIR=obj
DEPS = common.h chunk.h memory.h debug.h value.h

_OBJ = chunk.o memory.o debug.o value.o 
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

clox: $(OBJ) main.c
	$(CC) -o $@ $^ $(CFLAGS)l