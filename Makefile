CC=clang
CFLAGS=-I.
SRC=src
OBJ=obj
SRCS=$(wildcard $(SRC)/*.c)
OBJS=$(patsubst $(SRC)/%.c, $(OBJ)/%.o,  $(filter-out $(SRC)/main.c , $(SRCS) ) )
BINDIR=bin
BIN = $(BINDIR)/clox

$(BIN): $(OBJS) $(SRC)/main.c
	$(CC) $(CFLAGS) $(OBJS) $(SRC)/main.c -o $@

$(OBJ)/%.o: $(SRC)/%.c $(SRC)/%.h
	$(CC)  $(CFLAGS) -c  $< -o $@

run: $(BIN)
	./$(BIN)


clean:
	rm -v $(BIN) $(OBJS)