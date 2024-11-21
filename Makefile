ifndef MSYSTEM
	CPREFIX = 
endif

WINDIVERTHEADERS = include
WINDIVERTLIBS = lib
MINGWLIB = /usr/x86_64-w64-mingw32/lib/

TARGET = bin/goodbyedpibigo.exe
LIBS = -L$(WINDIVERTLIBS) -lWinDivert -lws2_32 -lwinmm
CC = gcc

CCWINDRES = windres

CFLAGS = -std=c99 -pie -fPIE -pipe -I. -Iinclude -Llib -O2 -D_FORTIFY_SOURCE=2 -fstack-protector \
         -Wall -Wextra -Wpedantic -Wformat=2 \
         -Wformat-security -Wno-format-nonliteral -Wshadow \
         -Wstrict-aliasing=1 -Wnull-dereference -m32 -D_POSIX -D_POSIX_C_SOURCE=200112L

LDFLAGS = -fstack-protector -Wl,-O1,-pie,--dynamicbase,--nxcompat,--sort-common,--as-needed \
-Wl,--disable-auto-image-base,--pic-executable,-e,_mainCRTStartup

.PHONY: default all clean

default: $(TARGET)
all: default

OBJECTS = $(patsubst core/%.c, build/%.o, $(wildcard core/*.c)) \
          $(patsubst network/%.c, build/%.o, $(wildcard network/*.c)) \
          $(patsubst utils/%.c, build/%.o, $(wildcard utils/*.c)) \
          build/goodbyedpi-rc.o

HEADERS = $(wildcard include/*.h)

build/%.o: core/%.c $(HEADERS)
	if not exist build mkdir build
	$(CC) $(CFLAGS) -c $< -o $@

build/%.o: network/%.c $(HEADERS)
	if not exist build mkdir build
	$(CC) $(CFLAGS) -c $< -o $@

build/%.o: utils/%.c $(HEADERS)
	if not exist build mkdir build
	$(CC) $(CFLAGS) -c $< -o $@

build/goodbyedpi-rc.o:
	if not exist build mkdir build
	$(CCWINDRES) core/goodbyedpi-rc.rc $@

.PRECIOUS: $(TARGET) $(OBJECTS)

$(TARGET): $(OBJECTS)
	if not exist bin mkdir bin
	$(CC) $(OBJECTS) $(LDFLAGS) $(LIBS) -s -o $@

clean:
	if exist build rmdir /s /q build
	if exist bin rmdir /s /q bin
