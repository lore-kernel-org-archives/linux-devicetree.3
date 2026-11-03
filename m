Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738843;
	b=F0MIZsJkPcIZ/0gplBoAXb1vH9JZqfN4paqtNS8lAQmN0obKEhC/BfMIQT6X0lF2M4Q+
	 MHHf6mhAYzK3p+P/025VzCDNAEo8WW7RQfEpm4geRaVNIAgMWh3aK7vStaN6fJf+FYVqF
	 7oLm0Mbg0ZbfbvYQwjPzb+x6uQ8vUprudeX+ANgRZUiXMQv/VWUVToVEm0t/CxiL4+M5Q
	 wFmwKTncQP+1u2y3mcBe1mNukwjYJRWThYmDfnIhdWfgYkVocAp78anT4P9DqaVoBdN9t
	 f/EcrjzAVijDsONRbMrjNZbrjTZ3j+wBbziSn5UOVW/j0c8xQs86l9qGbqjIeIWn09g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=gWBj6bhuFuCjkqdVPhizDNqOqC1e3vvIjLoz1MW5J9s=;
	b=AUj7EtA+I/CQ0CxVOeUte0Hfd0ewk3VhPA8zcwOy2nPSm4oD0Ain+e3Lvan/MwZRa2/X
	 9ZNL7Ff3QRk1vL6trPsY4AqFoq48YpKXkiWhvYw7SX88I5nmuYFPzuQw/XKX+ltEocxvp
	 DkHxQIErbvLzo2jGsRvG2wYZ2k1lfRKljnKcJ2X4U+n8k6vDkNWCsWEq5XhWgXrP7TBAX
	 dNkMdMVrJA9G5IADAKywHv8Q2HV2PWMjiDJ8fUdq22I2LmiwT/DEOSsmkaiN8L08H37Qe
	 7sv7WANPo1sWQcrjDxBHdB85m/E70O4WLTgegXd06pvaYTA5F8gNB72f/aYcHbuEPFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NygSCqpx;
	arc=none smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6E8606A32C
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 20:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF6E8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NygSCqpx
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5ea969fafeeso1688248e0c.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 12:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738842; x=1794343642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gWBj6bhuFuCjkqdVPhizDNqOqC1e3vvIjLoz1MW5J9s=;
        b=NygSCqpxOOtUNEnLyh7gOHllpYN7avtHpDoftXGeKxEwqbAmRgBNxYDPnN8K3FzPVv
         nlF3sRqM6rDl75or36NRjK2N3LZcIWADYBO/B0oHt4OA27hqsXH067l9ueFz6sNLEKpU
         7Ld40kFyqbjxy+FKRd/iGrOliS0hbOo/Ang46KpkHUlgXeyc1HgtZmM8nhc1TvMBF+ay
         Je1wNqXbL+1XiM5piWvqzOqoYMWl7i3F2JaK6Xl7ygF6Bndbm38cnZSnt6YzwCKSoIXx
         IiOxiGqlvtg9cCNn5G7vyNocWzSBKCiF+M4FzGRapMDNLR5UBiIg1/j+G1HlLqg6y+QZ
         J6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738842; x=1794343642;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gWBj6bhuFuCjkqdVPhizDNqOqC1e3vvIjLoz1MW5J9s=;
        b=qFI9WZvlLMTOVzn8ijBiDF7lgQlMCOZktwT31exoPRrSuDSMmmkKydgQT74WQc+W/q
         xWPcroOO6vWueKOz21dAx/kOKwbhtuJCipptf89MUyAmQc/OCaw1GaIzi4/yRzF63bRJ
         osQJwcz9eRV2HOA/xGfL22+p4hvLjcxHeqD3joyekmXT4BA7xxjAV1xR+Ijr0x1aXAMz
         HzvbE9TKMlTdl6yLZAKGLUcsx/KBuQf+k1N8/GeVVQ+lByU/3zEhiCXmz/0/0UqDVv8J
         a8hCf2gdHrofGiDRtpHsqPtZvNQas5JmE7xORCsB4Kp03iUI1hFnLd3/yfIsHks7IvJ8
         hYJw==
X-Forwarded-Encrypted: i=1; AKwUvByrkcX9AhJYHsKhQDFGgYji1OBLkC5UZ7YygbElpG+Xx3hlv8p2sIo54EE526g+SERNiNM0dLMnIBth@vger.kernel.org
X-Gm-Message-State: APuU4Z9j9N7qUGuPSu+ywi7b1lFF2YBUnsUkYl5GncyVE6F2AKQP9qiL
	AjeRm3MIIBWp4uUpSy0mupVIVOwQ56e4vsEB4po7M0QxJk7JJWVXi00=
X-Gm-Gg: AYBFou3VcfDosFqG6tg2D7aNj+GiVYRl3ViVQlyQjoGwDWt5n89DgSmvRGE4ozqC6eM
	kySmun/PfPMXtcmEOZTZbxN1nRgn8Ns0Z+WOxQzR+nCv7pBcdDJ8xjZ+1SbOBWQ8FVAVQ0+A7NA
	hmN2z9o7ngAEEaMaHVWy2DF6CI4fXE/urwOgpCUY5uEuRbsDzLj96dKdJb8lnrrKcImMKIu8Vmk
	152R71TQ37vDdqDIm7iaibhkySAkjUmPKEBaqX+L0ok9K3QfMBX5Cc+U2B3l43pmTnXUXYHEDdU
	GxDidgQpJBDrJ3bCPPOevf9w6GG6K9150nI1DwFK23Ssg9tEdmbsiTQqqKakVP16fc9PQH3Ox7P
	eyus1143cflF4DxhJ2uJ61thdMRuYa78Tfycby5jruU3X0t98B9rm6U9/pqn+fyOqXQTnDHSgAe
	6Tad8+mDPuQdOnLT/Ie99Ma9Ud5lSgnYi/afc1boPUqJvJUv7JiaT3SQ/VlOtbsj9X4Z/VRbeTj
	PyuI5mi0emEsPJ9yr+DFyZ5dsqz8+QwgPz7Ywarr3pP7yjqphSS0cl1JGBxtF2Yq09D5Pvz2FJL
	tKQt2C/ERolGiaeUR793HJWAjgBazov0Dmkhx4VUhutJ2qeeFAlTp0KSTo7WcELM+cIDz3AlL3y
	Mqr5Liw==
X-Received: by 2002:a05:6122:1da0:b0:5ea:c51a:37a1 with SMTP id 71dfb90a1353d-5ec686ff12emr5194620e0c.8.1793738841186;
        Tue, 03 Nov 2026 12:47:21 -0800 (PST)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca89b81b3sm119618e0c.2.2026.11.03.12.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:47:19 -0800 (PST)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Brigham Campbell <me@brighamcampbell.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v6 2/3] drm/ch1115: add support for Chipwealth CH1115 OLED controller
Date: Tue,  3 Nov 2026 17:46:52 -0300
Message-ID: <01cee5640e8637cbe0cd49e920f3aeed2c60640a.1793735996.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793735996.git.nico.antinori.7@gmail.com>
References: <cover.1793735996.git.nico.antinori.7@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Chipwealth CH1115 is a controller for monochrome dot matrix OLED panels.

Add DRM support for this chip using i2c bus.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 drivers/gpu/drm/tiny/Kconfig      |  17 +
 drivers/gpu/drm/tiny/Makefile     |   1 +
 drivers/gpu/drm/tiny/ch1115-i2c.c | 859 ++++++++++++++++++++++++++++++
 3 files changed, 877 insertions(+)
 create mode 100644 drivers/gpu/drm/tiny/ch1115-i2c.c

diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index f0e72d4b6a47..4f9d677b35f6 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -36,6 +36,23 @@ config DRM_BOCHS

 	  If M is selected the module will be called bochs.

+config DRM_CH1115_I2C
+	tristate "DRM support for CH1115 OLED panels (I2C BUS)"
+	depends on DRM && MMU && I2C && OF
+	select BACKLIGHT_CLASS_DEVICE
+	select DRM_CLIENT_SELECTION
+	select DRM_GEM_SHMEM_HELPER
+	select DRM_KMS_HELPER
+	select REGMAP_I2C
+	select VIDEOMODE_HELPERS
+	help
+	  Chipwealth CH1115 is a controller for monochrome dot matrix OLED
+	  panels.
+
+	  DRM driver for CH1115 OLED panels connected via I2C.
+
+	  If M is selected the module will be called ch1115-i2c.
+
 config DRM_CIRRUS_QEMU
 	tristate "Cirrus driver for QEMU emulated device"
 	depends on DRM && PCI
diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
index 48d30bf6152f..daf493142549 100644
--- a/drivers/gpu/drm/tiny/Makefile
+++ b/drivers/gpu/drm/tiny/Makefile
@@ -3,6 +3,7 @@
 obj-$(CONFIG_DRM_APPLETBDRM)		+= appletbdrm.o
 obj-$(CONFIG_DRM_ARCPGU)		+= arcpgu.o
 obj-$(CONFIG_DRM_BOCHS)			+= bochs.o
+obj-$(CONFIG_DRM_CH1115_I2C)		+= ch1115-i2c.o
 obj-$(CONFIG_DRM_CIRRUS_QEMU)		+= cirrus-qemu.o
 obj-$(CONFIG_DRM_GM12U320)		+= gm12u320.o
 obj-$(CONFIG_DRM_PANEL_MIPI_DBI)	+= panel-mipi-dbi.o
diff --git a/drivers/gpu/drm/tiny/ch1115-i2c.c b/drivers/gpu/drm/tiny/ch1115-i2c.c
new file mode 100644
index 000000000000..08fee5a09f4f
--- /dev/null
+++ b/drivers/gpu/drm/tiny/ch1115-i2c.c
@@ -0,0 +1,859 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * DRM driver for CH1115 panels
+ *
+ * Copyright (C) 2026 Nicolás Antinori <nico.antinori.7@gmail.com>
+ *
+ * Datasheet: https://datasheet4u.com/download/1576606/CH1115.html
+ *
+ * Based on
+ *  - drivers/gpu/drm/sitronix/st7571-i2c.c
+ *  - drivers/gpu/drm/sitronix/st7571.c
+ * Copyright (C) 2025 Marcus Folkesson <marcus.folkesson@gmail.com>
+ */
+
+#include <linux/backlight.h>
+#include <linux/bitfield.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+#include <drm/clients/drm_client_setup.h>
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_damage_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_fbdev_shmem.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_probe_helper.h>
+
+#include <video/display_timing.h>
+#include <video/of_display_timing.h>
+
+#define CH1115_VAL_CLOCK_DIVIDE_RATIO(c, d)		(FIELD_PREP(GENMASK(7, 4), (c)) | \
+							 FIELD_PREP(GENMASK(3, 0), (d)))
+#define CH1115_VAL_DC_DC_OFF				0x8a
+#define CH1115_VAL_DC_DC_ON				0x8b
+#define CH1115_VAL_PRECHARGE_PERIOD			0x22
+#define CH1115_VAL_CLOCK_OSC_FREQ			0x8
+#define CH1115_VAL_CLOCK_DIV_RATIO			0x0
+#define CH1115_VAL_VCOM_DESELECT_LVL			0x20
+#define CH1115_VAL_CONTRAST				0x7f
+
+#define CH1115_PAGE_HEIGHT				8
+#define CH1115_MAX_WIDTH				128
+#define CH1115_MAX_HEIGHT				64
+#define CH1115_MAX_CONTRAST				255
+
+#define CH1115_COMMAND_MODE				0x00
+#define CH1115_DATA_MODE				0x40
+
+#define CH1115_CMD_START_LINE				0x40
+#define CH1115_CMD_CONTRAST				0x81
+#define CH1115_CMD_SEG_REMAP_NORMAL			0xa0
+#define CH1115_CMD_SEG_REMAP_FLIP			0xa1
+#define CH1115_CMD_FOLLOW_RAM				0xa4
+#define CH1115_CMD_NORMAL				0xa6
+#define CH1115_CMD_INVERTED				0xa7
+#define CH1115_CMD_MUX_RATIO				0xa8
+#define CH1115_CMD_DC_DC				0xad
+#define CH1115_CMD_OFF					0xae
+#define CH1115_CMD_ON					0xaf
+#define CH1115_CMD_COM_REMAP_NORMAL			0xc0
+#define CH1115_CMD_COM_REMAP_FLIP			0xc8
+#define CH1115_CMD_OFFSET				0xd3
+#define CH1115_CMD_CLOCK_DIVIDE_RATIO			0xd5
+#define CH1115_CMD_PRECHARGE_PERIOD			0xd9
+#define CH1115_CMD_VCOM_DESELECT_LVL			0xdb
+
+#define CH1115_SET_COLUMN_LSB(c)			FIELD_PREP(GENMASK(3, 0), (c))
+#define CH1115_SET_COLUMN_MSB(c)			(0x10 | FIELD_PREP(GENMASK(2, 0), (c) >> 4))
+#define CH1115_SET_PAGE(p)				(0xb0 | FIELD_PREP(GENMASK(3, 0), (p)))
+
+#define DRIVER_NAME "ch1115"
+#define DRIVER_DESC "ch1115 DRM driver"
+#define DRIVER_MAJOR 1
+#define DRIVER_MINOR 0
+
+struct ch1115_device {
+	struct drm_device dev;
+
+	struct drm_connector connector;
+	struct drm_crtc crtc;
+	struct drm_display_mode mode;
+	struct drm_encoder encoder;
+	struct drm_plane primary_plane;
+
+	struct backlight_device *bl_dev;
+
+	struct i2c_client *client;
+	struct regmap *regmap;
+
+	bool inverted;
+	bool flip_horizontal;
+	bool flip_vertical;
+	u8 contrast;
+
+	u8 bytes_per_row;
+
+	u8 width;
+	u8 height;
+	u32 width_mm;
+	u32 height_mm;
+	u8 x_start_offset;
+	u8 y_start_offset;
+
+	u8 *hwbuf;
+	u8 *row;
+};
+
+static inline int ch1115_send_command_list(struct ch1115_device *ch1115,
+					   const u8 *cmd_list, size_t len)
+{
+	return regmap_raw_write(ch1115->regmap, CH1115_COMMAND_MODE, cmd_list, len);
+}
+
+static inline int ch1115_draw_screen(struct ch1115_device *ch1115,
+				     const u8 *data, size_t len)
+{
+	return regmap_raw_write(ch1115->regmap, CH1115_DATA_MODE, data, len);
+}
+
+static inline struct ch1115_device *drm_to_ch1115(struct drm_device *dev)
+{
+	return container_of(dev, struct ch1115_device, dev);
+}
+
+static int ch1115_set_position(struct ch1115_device *ch1115, int x, int y)
+{
+	u8 cmd_list[] = {
+		CH1115_SET_PAGE(y / CH1115_PAGE_HEIGHT),
+		CH1115_SET_COLUMN_LSB(x),
+		CH1115_SET_COLUMN_MSB(x),
+	};
+
+	return ch1115_send_command_list(ch1115, cmd_list, ARRAY_SIZE(cmd_list));
+}
+
+static void ch1115_shutdown(struct i2c_client *client)
+{
+	struct ch1115_device *ch1115 = i2c_get_clientdata(client);
+	struct drm_device *drm_dev = &ch1115->dev;
+
+	drm_atomic_helper_shutdown(drm_dev);
+}
+
+static int ch1115_clear_screen(struct ch1115_device *ch1115)
+{
+	int ret;
+	int y = 0;
+	u8 *row = ch1115->row;
+
+	for (int i = 0; i < ch1115->width; i++)
+		row[i] = 0x00;
+
+	do {
+		ret = ch1115_set_position(ch1115, ch1115->x_start_offset, y);
+		if (ret < 0)
+			return ret;
+
+		ret = ch1115_draw_screen(ch1115, row, ch1115->width);
+		if (ret < 0)
+			return ret;
+
+		y += CH1115_PAGE_HEIGHT;
+	} while (y < ch1115->height);
+
+	return 0;
+}
+
+static int ch1115_oled_init(struct ch1115_device *ch1115)
+{
+	u8 commands[] = {
+		CH1115_CMD_OFF,
+
+		CH1115_CMD_CLOCK_DIVIDE_RATIO,
+		CH1115_VAL_CLOCK_DIVIDE_RATIO(CH1115_VAL_CLOCK_OSC_FREQ,
+					      CH1115_VAL_CLOCK_DIV_RATIO),
+
+		CH1115_CMD_MUX_RATIO,
+		ch1115->height - 1,
+
+		CH1115_CMD_OFFSET,
+		ch1115->flip_vertical
+			? ch1115->y_start_offset
+			: CH1115_MAX_HEIGHT - ch1115->y_start_offset,
+
+		CH1115_CMD_START_LINE,
+
+		CH1115_CMD_DC_DC,
+		CH1115_VAL_DC_DC_ON,
+
+		ch1115->flip_horizontal
+			? CH1115_CMD_SEG_REMAP_FLIP
+			: CH1115_CMD_SEG_REMAP_NORMAL,
+
+		ch1115->flip_vertical
+			? CH1115_CMD_COM_REMAP_FLIP
+			: CH1115_CMD_COM_REMAP_NORMAL,
+
+		CH1115_CMD_CONTRAST,
+		ch1115->contrast,
+
+		CH1115_CMD_PRECHARGE_PERIOD,
+		CH1115_VAL_PRECHARGE_PERIOD,
+
+		CH1115_CMD_VCOM_DESELECT_LVL,
+		CH1115_VAL_VCOM_DESELECT_LVL,
+
+		CH1115_CMD_FOLLOW_RAM,
+
+		ch1115->inverted
+			? CH1115_CMD_INVERTED
+			: CH1115_CMD_NORMAL,
+	};
+
+	return ch1115_send_command_list(ch1115, commands, ARRAY_SIZE(commands));
+}
+
+static void ch1115_prepare_buffer(struct ch1115_device *ch1115,
+				  const struct iosys_map *vmap,
+				  struct drm_framebuffer *fb,
+				  struct drm_rect *rect,
+				  struct drm_format_conv_state *fmtcnv_state)
+{
+	unsigned int dst_pitch;
+	struct iosys_map dst;
+
+	dst_pitch = DIV_ROUND_UP(ch1115->width, 8);
+
+	rect->y1 = round_down(rect->y1, CH1115_PAGE_HEIGHT);
+	rect->y2 = min_t(unsigned int, round_up(rect->y2, CH1115_PAGE_HEIGHT), ch1115->height);
+
+	rect->x1 = (rect->x1 / 8) * 8;
+	rect->x2 = min_t(unsigned int, DIV_ROUND_UP(rect->x2, 8) * 8, ch1115->width);
+
+	iosys_map_set_vaddr(&dst, ch1115->hwbuf + rect->y1 * dst_pitch + rect->x1 / 8);
+	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
+}
+
+static inline u8 ch1115_transform_xy(const u8 *p,
+				     int x,
+				     int y,
+				     int display_height,
+				     u8 bytes_per_row)
+{
+	int xrest = x % 8;
+	u8 result = 0;
+	int iterations = min(display_height - y, 8);
+
+	/*
+	 * Transforms an (x, y) pixel coordinate into a vertical 8-bit
+	 * column from the framebuffer. It calculates the corresponding byte in the
+	 * framebuffer, extracts the bit at the given x position across 8 consecutive
+	 * rows, and packs those bits into a single byte.
+	 *
+	 * Return an 8-bit value representing a vertical column of pixels.
+	 */
+
+	x = x / 8;
+	y = (y / 8) * 8;
+
+	for (int i = 0; i < iterations; i++) {
+		int row_idx = y + i;
+		u8 byte = p[row_idx * bytes_per_row + x];
+		u8 bit = (byte >> xrest) & 1;
+
+		result |= (bit << i);
+	}
+
+	return result;
+}
+
+static int ch1115_fb_update_rect(struct drm_framebuffer *fb, struct drm_rect *rect)
+{
+	struct ch1115_device *ch1115 = drm_to_ch1115(fb->dev);
+	u8 *row = ch1115->row;
+	int ret;
+
+	rect->y1 = round_down(rect->y1, CH1115_PAGE_HEIGHT);
+	rect->y2 = min_t(unsigned int, round_up(rect->y2, CH1115_PAGE_HEIGHT), ch1115->height);
+
+	for (int y = rect->y1; y < rect->y2; y += CH1115_PAGE_HEIGHT) {
+		for (int x = rect->x1; x < rect->x2; x++)
+			row[x] = ch1115_transform_xy(ch1115->hwbuf, x, y, ch1115->height,
+						     ch1115->bytes_per_row);
+
+		ret = ch1115_set_position(ch1115, ch1115->x_start_offset + rect->x1, y);
+		if (ret < 0)
+			return ret;
+
+		ret = ch1115_draw_screen(ch1115, row + rect->x1, rect->x2 - rect->x1);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+/*
+ * DRM
+ */
+DEFINE_DRM_GEM_FOPS(ch1115_fops);
+static const struct drm_driver ch1115_driver = {
+	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
+
+	.name		 = DRIVER_NAME,
+	.desc		 = DRIVER_DESC,
+	.major		 = DRIVER_MAJOR,
+	.minor		 = DRIVER_MINOR,
+
+	.fops		 = &ch1115_fops,
+	DRM_GEM_SHMEM_DRIVER_OPS,
+	DRM_FBDEV_SHMEM_DRIVER_OPS,
+};
+
+/*
+ * Modeset
+ */
+static struct drm_display_mode ch1115_mode(struct ch1115_device *ch1115)
+{
+	struct drm_display_mode mode = {
+		DRM_SIMPLE_MODE(ch1115->width, ch1115->height,
+				ch1115->width_mm, ch1115->height_mm),
+	};
+
+	return mode;
+}
+
+static const struct drm_mode_config_funcs ch1115_mode_config_funcs = {
+	.fb_create = drm_gem_fb_create_with_dirty,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
+static int ch1115_mode_config_init(struct ch1115_device *ch1115)
+{
+	struct drm_device *dev = &ch1115->dev;
+	int ret;
+
+	ret = drmm_mode_config_init(dev);
+	if (ret)
+		return ret;
+
+	dev->mode_config.min_width = ch1115->width;
+	dev->mode_config.max_width = ch1115->width;
+	dev->mode_config.min_height = ch1115->height;
+	dev->mode_config.max_height = ch1115->height;
+	dev->mode_config.preferred_depth = 24;
+	dev->mode_config.funcs = &ch1115_mode_config_funcs;
+
+	return 0;
+}
+
+/*
+ * Plane
+ */
+static const struct drm_plane_funcs ch1115_primary_plane_funcs = {
+	.update_plane = drm_atomic_helper_update_plane,
+	.disable_plane = drm_atomic_helper_disable_plane,
+	.destroy = drm_plane_cleanup,
+	DRM_GEM_SHADOW_PLANE_FUNCS,
+};
+
+static int ch1115_primary_plane_helper_atomic_check(struct drm_plane *plane,
+						    struct drm_atomic_commit *state)
+{
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc *new_crtc = new_plane_state->crtc;
+	struct drm_crtc_state *new_crtc_state = NULL;
+
+	if (new_crtc)
+		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_crtc);
+
+	return drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   false, false);
+}
+
+static void ch1115_primary_plane_helper_atomic_update(struct drm_plane *plane,
+						      struct drm_atomic_commit *state)
+{
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	struct drm_framebuffer *fb = plane_state->fb;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_device *dev = plane->dev;
+	struct drm_rect damage;
+	struct ch1115_device *ch1115 = drm_to_ch1115(plane->dev);
+	int idx;
+
+	if (!fb)
+		return;
+
+	if (drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE))
+		return;
+
+	if (!drm_dev_enter(dev, &idx))
+		goto out_drm_gem_fb_end_cpu_access;
+
+	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
+	drm_atomic_for_each_plane_damage(&iter, &damage) {
+		ch1115_prepare_buffer(ch1115,
+				      &shadow_plane_state->data[0],
+				      fb, &damage,
+				      &shadow_plane_state->fmtcnv_state);
+
+		ch1115_fb_update_rect(fb, &damage);
+	}
+
+	drm_dev_exit(idx);
+
+out_drm_gem_fb_end_cpu_access:
+	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
+}
+
+static void ch1115_primary_plane_helper_atomic_disable(struct drm_plane *plane,
+						       struct drm_atomic_commit *state)
+{
+	struct drm_device *dev = plane->dev;
+	struct ch1115_device *ch1115 = drm_to_ch1115(plane->dev);
+	int idx;
+
+	if (!drm_dev_enter(dev, &idx))
+		return;
+
+	ch1115_clear_screen(ch1115);
+
+	drm_dev_exit(idx);
+}
+
+static const struct drm_plane_helper_funcs ch1115_primary_plane_helper_funcs = {
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+	.atomic_check = ch1115_primary_plane_helper_atomic_check,
+	.atomic_update = ch1115_primary_plane_helper_atomic_update,
+	.atomic_disable = ch1115_primary_plane_helper_atomic_disable,
+};
+
+static const u64 ch1115_primary_plane_fmtmods[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
+static const u32 ch1115_primary_plane_formats[] = {
+	DRM_FORMAT_XRGB8888,
+};
+
+static int ch1115_plane_init(struct ch1115_device *ch1115)
+{
+	struct drm_plane *plane = &ch1115->primary_plane;
+	struct drm_device *dev = &ch1115->dev;
+	int ret;
+
+	ret = drm_universal_plane_init(dev, plane, 0,
+				       &ch1115_primary_plane_funcs,
+				       ch1115_primary_plane_formats,
+				       ARRAY_SIZE(ch1115_primary_plane_formats),
+				       ch1115_primary_plane_fmtmods,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+
+	drm_plane_helper_add(plane, &ch1115_primary_plane_helper_funcs);
+	drm_plane_enable_fb_damage_clips(plane);
+
+	return 0;
+}
+
+/*
+ * CRTC
+ */
+static enum drm_mode_status ch1115_crtc_mode_valid(struct drm_crtc *crtc,
+						   const struct drm_display_mode *mode)
+{
+	struct ch1115_device *ch1115 = drm_to_ch1115(crtc->dev);
+
+	return drm_crtc_helper_mode_valid_fixed(crtc, mode, &ch1115->mode);
+}
+
+static const struct drm_crtc_helper_funcs ch1115_crtc_helper_funcs = {
+	.atomic_check = drm_crtc_helper_atomic_check,
+	.mode_valid = ch1115_crtc_mode_valid,
+};
+
+static const struct drm_crtc_funcs ch1115_crtc_funcs = {
+	.destroy = drm_crtc_cleanup,
+	.set_config = drm_atomic_helper_set_config,
+	.page_flip = drm_atomic_helper_page_flip,
+	.atomic_create_state	= drm_atomic_helper_crtc_create_state,
+	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
+};
+
+static int ch1115_crtc_init(struct ch1115_device *ch1115)
+{
+	struct drm_plane *primary_plane = &ch1115->primary_plane;
+	struct drm_crtc *crtc = &ch1115->crtc;
+	struct drm_device *dev = &ch1115->dev;
+	int ret;
+
+	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
+					&ch1115_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+
+	drm_crtc_helper_add(crtc, &ch1115_crtc_helper_funcs);
+
+	return 0;
+}
+
+/*
+ * Encoder
+ */
+static void ch1115_encoder_atomic_enable(struct drm_encoder *encoder,
+					 struct drm_atomic_commit *state)
+{
+	struct drm_device *drm = encoder->dev;
+	struct ch1115_device *ch1115 = drm_to_ch1115(drm);
+	int ret;
+
+	ret = ch1115_oled_init(ch1115);
+	if (ret < 0)
+		return;
+
+	u8 command = CH1115_CMD_ON;
+
+	ret = ch1115_send_command_list(ch1115, &command, 1);
+	if (ret < 0)
+		return;
+
+	backlight_enable(ch1115->bl_dev);
+}
+
+static void ch1115_encoder_atomic_disable(struct drm_encoder *encoder,
+					  struct drm_atomic_commit *state)
+{
+	struct drm_device *drm = encoder->dev;
+	struct ch1115_device *ch1115 = drm_to_ch1115(drm);
+
+	backlight_disable(ch1115->bl_dev);
+
+	u8 command = CH1115_CMD_OFF;
+
+	ch1115_send_command_list(ch1115, &command, 1);
+}
+
+static const struct drm_encoder_funcs ch1115_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
+static const struct drm_encoder_helper_funcs ch1115_encoder_helper_funcs = {
+	.atomic_enable = ch1115_encoder_atomic_enable,
+	.atomic_disable = ch1115_encoder_atomic_disable,
+};
+
+static int ch1115_encoder_init(struct ch1115_device *ch1115)
+{
+	struct drm_encoder *encoder = &ch1115->encoder;
+	struct drm_crtc *crtc = &ch1115->crtc;
+	struct drm_device *dev = &ch1115->dev;
+	int ret;
+
+	ret = drm_encoder_init(dev, encoder, &ch1115_encoder_funcs, DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
+
+	drm_encoder_helper_add(encoder, &ch1115_encoder_helper_funcs);
+
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
+	return 0;
+}
+
+/*
+ * Connector
+ */
+static int ch1115_connector_get_modes(struct drm_connector *conn)
+{
+	struct ch1115_device *ch1115 = drm_to_ch1115(conn->dev);
+
+	return drm_connector_helper_get_modes_fixed(conn, &ch1115->mode);
+}
+
+static const struct drm_connector_helper_funcs ch1115_connector_helper_funcs = {
+	.get_modes = ch1115_connector_get_modes,
+};
+
+static const struct drm_connector_funcs ch1115_connector_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.atomic_create_state = drm_atomic_helper_connector_create_state,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int ch1115_connector_init(struct ch1115_device *ch1115)
+{
+	struct drm_connector *connector = &ch1115->connector;
+	struct drm_encoder *encoder = &ch1115->encoder;
+	struct drm_device *dev = &ch1115->dev;
+	int ret;
+
+	ret = drm_connector_init(dev, connector, &ch1115_connector_funcs,
+				 DRM_MODE_CONNECTOR_Unknown);
+	if (ret)
+		return ret;
+
+	drm_connector_helper_add(connector, &ch1115_connector_helper_funcs);
+
+	return drm_connector_attach_encoder(connector, encoder);
+}
+
+/*
+ * Backlight
+ */
+static int ch1115_update_bl(struct backlight_device *bdev)
+{
+	struct ch1115_device *ch1115 = bl_get_data(bdev);
+	u8 brightness = backlight_get_brightness(bdev);
+
+	ch1115->contrast = brightness;
+
+	u8 cmd_list[] = {
+		CH1115_CMD_CONTRAST,
+		brightness
+	};
+
+	return ch1115_send_command_list(ch1115, cmd_list, ARRAY_SIZE(cmd_list));
+}
+
+static const struct backlight_ops ch1115_bl_ops = {
+	.update_status	= ch1115_update_bl,
+};
+
+/*
+ * I2c
+ */
+static const struct regmap_config ch1115_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static int ch1115_parse_dt(struct ch1115_device *ch1115)
+{
+	struct device *dev = &ch1115->client->dev;
+	struct device_node *np = dev->of_node;
+	struct display_timing dt;
+	int ret;
+	u32 val;
+
+	if (!np) {
+		dev_err(dev, "No Device Tree entry\n");
+		return -EINVAL;
+	}
+
+	ret = of_property_read_u32(np, "chipwealth,offset", &val);
+	if (ret) {
+		ch1115->y_start_offset = 0;
+	} else {
+		if (val > CH1115_MAX_HEIGHT - 1) {
+			dev_err(dev, "chipwealth,offset=%d must be [0-%d]\n",
+				val, CH1115_MAX_HEIGHT - 1);
+			return -EINVAL;
+		}
+		ch1115->y_start_offset = (u8)val;
+	}
+
+	ret = of_property_read_u32(np, "width-mm", &ch1115->width_mm);
+	if (ret) {
+		dev_err(dev, "Failed to get width-mm from DT\n");
+		return ret;
+	}
+	if (ch1115->width_mm == 0) {
+		dev_err(dev, "Invalid width-mm 0\n");
+		return -EINVAL;
+	}
+
+	ret = of_property_read_u32(np, "height-mm", &ch1115->height_mm);
+	if (ret) {
+		dev_err(dev, "Failed to get height-mm from DT\n");
+		return ret;
+	}
+	if (ch1115->height_mm == 0) {
+		dev_err(dev, "Invalid height-mm 0\n");
+		return -EINVAL;
+	}
+
+	ret = of_get_display_timing(np, "panel-timing", &dt);
+	if (ret) {
+		dev_err(dev, "Failed to get display timing from DT\n");
+		return ret;
+	}
+	if (dt.hactive.typ <= 0 || dt.hactive.typ > CH1115_MAX_WIDTH) {
+		dev_err(dev, "hactive=%d must be greater than 0 and less or equal %d\n",
+			dt.hactive.typ, CH1115_MAX_WIDTH);
+		return -EINVAL;
+	}
+	if (dt.vactive.typ <= 0 || dt.vactive.typ > CH1115_MAX_HEIGHT) {
+		dev_err(dev, "vactive=%d must be greater than 0 and less or equal %d\n",
+			dt.vactive.typ, CH1115_MAX_HEIGHT);
+		return -EINVAL;
+	}
+
+	ch1115->width = dt.hactive.typ;
+	ch1115->height = dt.vactive.typ;
+
+	ch1115->inverted = of_property_read_bool(np, "chipwealth,inverted");
+	ch1115->flip_horizontal = of_property_read_bool(np, "flip-horizontal");
+	ch1115->flip_vertical = of_property_read_bool(np, "flip-vertical");
+	ch1115->contrast = CH1115_VAL_CONTRAST;
+
+	return 0;
+}
+
+static int ch1115_probe(struct i2c_client *client)
+{
+	struct ch1115_device *ch1115;
+	struct device *dev;
+	int ret;
+
+	dev = &client->dev;
+	ch1115 = devm_drm_dev_alloc(&client->dev, &ch1115_driver,
+				    struct ch1115_device, dev);
+	if (IS_ERR(ch1115))
+		return PTR_ERR(ch1115);
+
+	i2c_set_clientdata(client, ch1115);
+
+	ch1115->client = client;
+	ch1115->regmap = devm_regmap_init_i2c(client, &ch1115_regmap_config);
+	if (IS_ERR(ch1115->regmap))
+		return dev_err_probe(dev, PTR_ERR(ch1115->regmap),
+				     "Failed to initialize regmap\n");
+
+	ret = ch1115_parse_dt(ch1115);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to parse DT\n");
+
+	ch1115->bytes_per_row = DIV_ROUND_UP(ch1115->width, 8);
+	ch1115->x_start_offset = ch1115->flip_horizontal
+		? CH1115_MAX_WIDTH - ch1115->width
+		: 0;
+	ch1115->mode = ch1115_mode(ch1115);
+
+	ch1115->hwbuf = devm_kzalloc(dev,
+				     ch1115->bytes_per_row * ch1115->height,
+				     GFP_KERNEL);
+
+	if (!ch1115->hwbuf)
+		return -ENOMEM;
+
+	ch1115->row = devm_kzalloc(dev, ch1115->width, GFP_KERNEL);
+	if (!ch1115->row)
+		return -ENOMEM;
+
+	/* Backlight */
+	const struct backlight_properties bl_props = {
+		.type = BACKLIGHT_RAW,
+		.brightness = ch1115->contrast,
+		.max_brightness = CH1115_MAX_CONTRAST,
+	};
+
+	ch1115->bl_dev = devm_backlight_device_register(dev, dev_name(dev), dev, ch1115,
+							&ch1115_bl_ops, &bl_props);
+	if (IS_ERR(ch1115->bl_dev))
+		return dev_err_probe(dev, PTR_ERR(ch1115->bl_dev),
+				     "Unable to register backlight device\n");
+
+	/* DRM */
+	ret = ch1115_mode_config_init(ch1115);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to initialize mode config\n");
+
+	ret = ch1115_plane_init(ch1115);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to initialize primary plane\n");
+
+	ret = ch1115_crtc_init(ch1115);
+	if (ret < 0)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to initialize CRTC\n");
+
+	ret = ch1115_encoder_init(ch1115);
+	if (ret < 0)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to initialize encoder\n");
+
+	ret = ch1115_connector_init(ch1115);
+	if (ret < 0)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to initialize connector\n");
+
+	drm_mode_config_reset(&ch1115->dev);
+
+	ret = drm_dev_register(&ch1115->dev, 0);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to register DRM device\n");
+
+	drm_client_setup(&ch1115->dev, NULL);
+
+	return 0;
+}
+
+static void ch1115_remove(struct i2c_client *client)
+{
+	struct ch1115_device *ch1115 = i2c_get_clientdata(client);
+
+	u8 cmd_list[] = {
+		CH1115_CMD_OFF,
+		CH1115_CMD_DC_DC,
+		CH1115_VAL_DC_DC_OFF,
+	};
+
+	drm_dev_unplug(&ch1115->dev);
+	drm_atomic_helper_shutdown(&ch1115->dev);
+
+	ch1115_send_command_list(ch1115, cmd_list, ARRAY_SIZE(cmd_list));
+}
+
+static const struct i2c_device_id ch1115_id[] = {
+	{ .name = "ch1115" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, ch1115_id);
+
+static const struct of_device_id ch1115_of_match[] = {
+	{ .compatible = "chipwealth,ch1115" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ch1115_of_match);
+
+static struct i2c_driver ch1115_i2c_driver = {
+	.driver = {
+		.name	= DRIVER_NAME,
+		.of_match_table = ch1115_of_match,
+	},
+	.probe		= ch1115_probe,
+	.remove		= ch1115_remove,
+	.shutdown	= ch1115_shutdown,
+	.id_table	= ch1115_id,
+};
+module_i2c_driver(ch1115_i2c_driver);
+
+MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_AUTHOR("Nicolás Antinori <nico.antinori.7@gmail.com>");
+MODULE_LICENSE("GPL");
--
2.47.3

