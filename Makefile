# Define the applications properties here:

APP_NAME = Quake

# Define the compiler settings here:

CC        = gcc
#CC        = clang
LD        = ld

SOURCE    = .

# INCLUDE   = -I$(DINGOO_SDK)/include -I$(DINGOO_SDK)/include/SDL -I../lib -I$(MIPSTOOLS)/mipsel-linux/include -I$
INCLUDE   = -I/usr/include -I/usr/include/SDL -I/usr/lib -I$

#STD_OPTS  = -O2 $(INCLUDE) -Wall -msoft-float -funroll-loops -trigraphs
STD_OPTS  = -O3 $(INCLUDE) -Wall -msoft-float -funroll-loops -trigraphs -g
#-trigraphs -ffast-math -msoft-float -funroll-loops -fno-builtin -fno-pic
CC_OPTS   = -c $(STD_OPTS)
CC_OPTS_A = $(CC_OPTS) -D_ASSEMBLER_

LIB_PATH  = /usr/lib64
#LIB_PATH  = /usr/lib
#LIBS      = -lSDL -lsml -lc -lm -lgcc
LIBS      = -lSDL -lc -lm

LD_OPTS   = -L$(LIB_PATH) $(LIBS) -o $(APP_NAME).elf

# Find all source files

SRC_C   = $(foreach dir, $(SOURCE), $(wildcard $(dir)/*.c))
SRC_S   = $(foreach dir, $(SOURCE), $(wildcard $(dir)/*.S))
OBJ_C   = $(patsubst %.c, %.o, $(SRC_C))
OBJ_S   = $(patsubst %.S, %.o, $(SRC_S))
OBJ     = $(OBJ_CPP) $(OBJ_C) $(OBJ_S)

# Compile rules.

.PHONY : all

all : $(APP_NAME).elf

$(APP_NAME).elf : $(OBJ)
	$(CC) $(OBJ) $(LD_OPTS)

$(OBJ_C) : %.o : %.c
	$(CC) $(CC_OPTS) -o $@ $<

$(OBJ_S) : %.o : %.S
	$(CC) $(CC_OPTS_A) -o $@ $<



# Clean rules

.PHONY : clean

clean :
	rm -f $(OBJ) $(APP_NAME).elf
	# $(APP_NAME).bin $(APP_NAME).app
