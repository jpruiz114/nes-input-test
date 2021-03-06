NAME = test
OBJS = test.o

CC = wla-6502
LD = wlalink

CFLAGS =
LDFLAGS =

all: $(NAME).nes

$(NAME).nes: $(NAME).rom header.bin
	@cat header.bin $< > $@

$(NAME).rom: $(OBJS) linkfile
	@$(LD) $(LDFLAGS) linkfile $@

%.o: %.s
	@$(CC) $(CFLAGS) -o $<

run: $(NAME).nes
	fceux $(NAME).nes

clean:
	@rm -f $(OBJS) $(NAME).rom $(NAME).nes

.PHONY: all clean
