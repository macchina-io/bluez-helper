TARGET = bluez-helper
BLUEZ_PATH = ./bluez

BLUEZ_SRCS  = lib/bluetooth.c lib/hci.c lib/sdp.c lib/uuid.c
BLUEZ_SRCS += attrib/att.c attrib/gatt.c attrib/gattrib.c attrib/utils.c
BLUEZ_SRCS += btio/btio.c src/log.c src/shared/log.c src/shared/mgmt.c
BLUEZ_SRCS += src/shared/crypto.c src/shared/att.c src/shared/queue.c src/shared/util.c
BLUEZ_SRCS += src/shared/io-glib.c src/shared/timeout-glib.c

BLUEZ_FULL_SRCS = $(addprefix $(BLUEZ_PATH)/, $(BLUEZ_SRCS))
LOCAL_SRCS  = src/bluez-helper.c

CC ?= gcc
CFLAGS ?= -O3
EXTRA_CFLAGS  = -DHAVE_CONFIG_H
EXTRA_CFLAGS += -I$(BLUEZ_PATH)/attrib -I$(BLUEZ_PATH) -I$(BLUEZ_PATH)/lib -I$(BLUEZ_PATH)/src -I$(BLUEZ_PATH)/gdbus -I$(BLUEZ_PATH)/btio -I$(BLUEZ_PATH)/sys
EXTRA_CFLAGS += $(shell pkg-config glib-2.0 --cflags)
GLIB = $(shell pkg-config glib-2.0 --libs)

all: $(TARGET)

$(TARGET): $(LOCAL_SRCS) $(BLUEZ_FULL_SRCS)
	$(CC) -L. $(CFLAGS) $(EXTRA_CFLAGS) -o $@ $(LOCAL_SRCS) $(BLUEZ_FULL_SRCS) $(GLIB)

clean:
	rm -f $(TARGET)
