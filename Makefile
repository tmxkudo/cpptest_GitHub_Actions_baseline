CC=gcc
INCLUDE_FLAGS=-Iinclude
DEBUG_FLAGS=
CFLAGS=-g
OBJ_DIR=obj

OBJ = $(OBJ_DIR)/main.o \
	  $(OBJ_DIR)/sub.o

.PHONY = clean all
	
all : $(OBJ_DIR) $(OBJ)

$(OBJ_DIR) :
	mkdir $(OBJ_DIR)

$(OBJ_DIR)/%.o : %.c
	$(CC) $(CFLAGS) $(INCLUDE_FLAGS) -o $@ -c $^ 

clean:
	rm -rf $(OBJ_DIR)
