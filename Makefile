CC=clang
CFLAGS=-I. #$(OBJ)

ODIR=obj
DEPS = ./*.h #common.h chunk.h memory.h debug.h value.h vm.h

_OBJ = chunk.o memory.o debug.o value.o vm.o
OBJ = $(patsubst %,$(ODIR)/%, $(_OBJ))

$(ODIR)/%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

clox: $(OBJ) main.c
	$(CC) -o $@ $^ $(CFLAGS)


clean:
	rm -v clox $(OBJ)