CROSS_COMPILE ?=
CC := $(CROSS_COMPILE)gcc
TARGET := writer
SRC := writer.c
OBJ := $(SRC:.c=.o)

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) -o $@ $^

%.o: %.c
	$(CC) -c $< -o $@

.PHONY: clean
clean:
	rm -f $(OBJ) $(TARGET)
