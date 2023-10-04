
CC=clang
CFLAGS=-I.
SRC=src
OBJ=obj
SRCS=$(wildcard $(SRC)/*.c)
OBJS=$(patsubst $(SRC)/%.c, $(OBJ)/%.o,  $(filter-out $(SRC)/main.c , $(SRCS) ) )
BINDIR=bin
BIN = $(BINDIR)/clox

$(BIN): $(OBJS) $(SRC)/main.c setup
	$(CC) $(CFLAGS) $(OBJS) $(SRC)/main.c -o $@

$(OBJ)/%.o: $(SRC)/%.c $(SRC)/%.h 
	$(CC)  $(CFLAGS) -c  $< -o $@

run: $(BIN)
	./$(BIN)

setup: 
	mkdir -p $(BINDIR)
	mkdir -p $(OBJ)
	touch setup && chmod a-w setup
	
clean:
	rm -v $(BIN) $(OBJS)