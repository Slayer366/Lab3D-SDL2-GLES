CC := gcc

BIN  = ken
SRCS = adlibemu.c demo.c glues/glues_project.c glues/glues_mipmap.c glues/glues_error.c glues/glues_registry.c graphx.c init.c lab3d.c oldlab3d.c setup.c subs.c eglport.c
OBJS = $(SRCS:%.c=%.o)

WARNFLAGS = -Wall -Wno-pointer-sign -Wno-unused-result -Wno-unused-but-set-variable -Wno-unused-variable -Wno-unused-function
OPTFLAGS  = -O2 -fno-aggressive-loop-optimizations -fno-strict-aliasing


all: $(BIN)

clean:
	rm -f $(BIN) $(OBJS)

$(BIN): $(OBJS)
	$(CC) $(LDFLAGS) -fPIC -o $@ $(OBJS) $(shell sdl2-config --libs) -lSDL2_image -lGL -lEGL -lm -lz

%.o: %.c
	$(CC) -DUSE_OSS -g $(WARNFLAGS) $(OPTFLAGS) $(CFLAGS) $(CPPFLAGS) $(shell sdl2-config --cflags) -o $@ -c $<
