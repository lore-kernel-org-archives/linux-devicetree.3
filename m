Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B48396D13
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 08:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783152596; cv=none; b=m0pGgdyb1AikwPWIQsbVDHYN/E6As4ILWL7W2iTfQNSg+p68d7JRUpPm60Hoj+uzOps+9yXqyKp8e9U7t/q8vFdYEpo0DxxsjtCxsfjPpMLKZLzb87qBxr1SonYGqnl9yUdXWWa3e9IXe+MUpXJMVyB7fQqyiEODP1NjHmwmaFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783152596; c=relaxed/simple;
	bh=SrUD1OJFs4PcNk4pGbsCcLmb/7WeL8cj2cP+AmChSBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m29M6p+t8zo1on64TR43mIz0dv+NSa/0IIDHvWT7//R7WRt4pcR3iXhvlcNUhsVbkJDRq8zR/qCrWuaqDFIe9wN3M0Ve3QyaAz2t79NBeCYr0/OrXIBIAAwllS4E2YgUC/W0IiBI5yGl8ZFd7sd4Z/+OVXCWJwD/glCvDlpw60g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XV5+fRbk; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XV5+fRbk"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4631679f204so1436035f8f.0
        for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 01:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783152589; x=1783757389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYDxuX3FVRBJpJ1bDqTLna4Pl7UtMkhAxcFqUu25+/4=;
        b=XV5+fRbkQ4Xlw5zT4IKal/3hyoEKMGPIrF00jHFw6NUcQW/s5r7FmnjVsvExpRkL3y
         4mzn7zEiZc4Tty2uooWc4oCIQOqy4mzJmRPmPRcZYxU+FFE0KwmXyKyQWjd5lWp6R4aT
         6RaEP6CJwfqHbG0s9Q14Htk1Mwm5hOw6AwrTTxcsNysSRuPxjb14DD8n9r1Ghs6pHccw
         17wb5VX4GdhWYRJFge/jl4XM7fg9mCsHcmdZ/4cgQ0jRRZihysHLUqwhAe5osCCBa2a4
         yMyyqpwGN7sUj6Yy9R71BsSdoN/lIT/MrECaDaNdhKAFivecqowdYGeBxiMGpWJtaocH
         EZ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783152589; x=1783757389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OYDxuX3FVRBJpJ1bDqTLna4Pl7UtMkhAxcFqUu25+/4=;
        b=M/KIj8J0bKFYY6/C9rUXvby/zUawvB6RWIzAzpSQwZeyyyTFPKZa+kkd45OlRF8OME
         wgaeI7oU2AYxJyYPqoTmKXcXxw6ZEN/u+6fxuoijm5mlwVzSCffPQrCMWn6VaQf6gqd9
         NwzqwjYZruG8VuNMV1STY+Hp5mr/iSTYrbfuWEjw9xWZ5tmLkbNvvEKCgDFIeKlUtagS
         UAyol3tgkOq5tBr8ONv8wPsfTptCp8KPVSSFb7KyUNf19cV682kawUOidbM8adhZWe92
         7/6w3Ol4RqaHz56B6ogksqwAFIQnIcjoBHEAqR7sPBjIsCKZvw6u31i457xZlhJAjlDH
         hccA==
X-Forwarded-Encrypted: i=1; AHgh+RrXC/TxXwdH3Wb28Vz2xYcr2Y21V9UAm1Kve3+FmbsznXGh3YMUNqXhTS3if403VhggXKiRVEewA/gC@vger.kernel.org
X-Gm-Message-State: AOJu0YzOr2DKmO7+I7O/FxZkUThYzzIOmfOtvLJmugetiQa3rQmJU79g
	qrr0DgZGK5FLgQWQvux6JiqZ7PsW17cY91gTqyEBJ1RUxtrCU1zxsTJc
X-Gm-Gg: AfdE7cmBFNFhC41eNPKtnvdaFxz+RQRLAsl4EPqK4jFqTDVECs6IFhaF2ZcPU6006te
	5LkcSoL4Bh3Sscz5tP90U70MMOtAtHmM+kWt8OYZy/LuakOfXHpoKD3PVSqJ/SDt4djjQ/3eIOr
	CpF6PRqMbgqXFNP0hwgNpY+s6JYtT80YzrEqCWN0V0uH9Z1xOFdEcyTJd6pr+YaALavrkf+coOI
	HvXUkABvsYBHkQcPeDD54tmrJcN1GITKWRlEnf8P/emxlEgrdHHM89fOCPgqfg2B5UB+RbWdAHE
	E7suolmoRmFvWo4XBZsKhoseqjss1o8Zh/320/gXvozT6+voBDAm++4IGdEWPNVZLJR+FIEECtl
	ocP8mIAtaC+XpJpV2pnJ//O0M0Lj6BIojTfbffFOmw0Z25O3ldjwhsJtfivBFmg3QS5S/EuJlbK
	IhBs/xqfJ0M5XN3Xyu9ly4d98DV2U=
X-Received: by 2002:a05:6000:288b:b0:475:b34a:dc1b with SMTP id ffacd0b85a97d-47abc8b7f0bmr2340050f8f.21.1783152589095;
        Sat, 04 Jul 2026 01:09:49 -0700 (PDT)
Received: from anthony.local ([2a06:c701:49b2:4c00:12ff:e0ff:fea5:3d2e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm6143055f8f.26.2026.07.04.01.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 01:09:48 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amit Barzilai <amit.barzilai22@gmail.com>
Subject: [PATCH v3 3/3] drm/ssd130x: Add SSD135X_FAMILY and SSD1351 support
Date: Sat,  4 Jul 2026 11:09:25 +0300
Message-ID: <20260704080925.75113-4-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260704080925.75113-1-amit.barzilai22@gmail.com>
References: <20260704080925.75113-1-amit.barzilai22@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Solomon SSD1351 is a 128x128 RGB color OLED controller. It shares
the SSD133X data path: a column/row addressing window followed by a bulk
RGB565 pixel write. Add it as a new SSD135X_FAMILY rather than a separate
driver, reusing the SSD133X plane, CRTC and blit/clear helpers.

The only data-path difference is that the SSD1351 requires an explicit
Write RAM command (0x5c) after the address window is programmed, before
pixel data is accepted, whereas the SSD133X enters data mode implicitly.
This is emitted from a shared ssd133x_write_pixels() helper so both the
damage-update and clear-screen paths cover it.

The SSD1351 also needs its own init sequence (ssd135x_init), dispatched
via ssd135x_encoder_atomic_enable. The re-map byte is fixed at 0 degrees,
65k color, COM split, BGR sub-pixel order; rotation is not supported.

The SSD1351 doesn't implement the SSD13XX_CONTRAST command (0x81) and
expects different opcodes for contrast and brightness management. The
current ssd130x_update_bl() function wouldn't work and the brightness
byte would be executed as a command opcode if run on the SSD1351 panel.
Until the backlight path is family-aware, skip backlight device
registration for the SSD135X family.

The SSD1351 is SPI-only, so only the SPI transport match tables gain an
entry; no new config symbol is needed.

While adding the SSD135X command path, ssd130x_write_cmds() forwards its
'const u8 *cmd' buffer to ssd130x_write_data(), which previously took a
non-const 'u8 *'. Constify the ssd130x_write_data() 'values' parameter
so the const-qualified buffer passes through without casting away const.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Amit Barzilai <amit.barzilai22@gmail.com>
---
 drivers/gpu/drm/solomon/ssd130x-spi.c |   7 +
 drivers/gpu/drm/solomon/ssd130x.c     | 244 +++++++++++++++++++++-----
 drivers/gpu/drm/solomon/ssd130x.h     |   5 +-
 3 files changed, 208 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x-spi.c b/drivers/gpu/drm/solomon/ssd130x-spi.c
index b52f5fd592a1..6e0dd6e5a88d 100644
--- a/drivers/gpu/drm/solomon/ssd130x-spi.c
+++ b/drivers/gpu/drm/solomon/ssd130x-spi.c
@@ -146,6 +146,11 @@ static const struct of_device_id ssd130x_of_match[] = {
 		.compatible = "solomon,ssd1331",
 		.data = &ssd130x_variants[SSD1331_ID],
 	},
+	/* ssd135x family */
+	{
+		.compatible = "solomon,ssd1351",
+		.data = &ssd130x_variants[SSD1351_ID],
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ssd130x_of_match);
@@ -171,6 +176,8 @@ static const struct spi_device_id ssd130x_spi_id[] = {
 	{ "ssd1327", SSD1327_ID },
 	/* ssd133x family */
 	{ "ssd1331", SSD1331_ID },
+	/* ssd135x family */
+	{ "ssd1351", SSD1351_ID },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(spi, ssd130x_spi_id);
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 3f09977d227b..f7f0a74a297e 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -145,6 +145,33 @@
 #define SSD133X_SET_REMAP_COLOR_DEPTH_MASK	GENMASK(7, 6)
 #define SSD133X_COLOR_DEPTH_65K			0x1
 
+/* ssd135x commands */
+#define SSD135X_SET_COL_RANGE			0x15
+#define SSD135X_WRITE_RAM			0x5c
+#define SSD135X_SET_ROW_RANGE			0x75
+#define SSD135X_SET_DISPLAY_START		0xa1
+#define SSD135X_SET_DISPLAY_OFFSET		0xa2
+#define SSD135X_SET_DISPLAY_NORMAL		0xa6
+#define SSD135X_SET_FUNCTION			0xab
+#define SSD135X_SET_PHASE_LENGTH		0xb1
+#define SSD135X_SET_CLOCK_FREQ			0xb3
+#define SSD135X_SET_VSL				0xb4
+#define SSD135X_SET_GPIO			0xb5
+#define SSD135X_SET_PRECHARGE2			0xb6
+#define SSD135X_SET_PRECHARGE			0xbb
+#define SSD135X_SET_VCOMH_VOLTAGE		0xbe
+#define SSD135X_SET_CONTRAST			0xc1
+#define SSD135X_SET_CONTRAST_MASTER		0xc7
+#define SSD135X_SET_MUX_RATIO			0xca
+#define SSD135X_SET_COMMAND_LOCK		0xfd
+
+/* ssd135x remap byte (data of SSD13XX_SET_SEG_REMAP) */
+#define SSD135X_SET_REMAP_COLUMN		BIT(1)
+#define SSD135X_SET_REMAP_COLOR_BGR		BIT(2)
+#define SSD135X_SET_REMAP_COM_SCAN		BIT(4)
+#define SSD135X_SET_REMAP_COM_SPLIT		BIT(5)
+#define SSD135X_SET_REMAP_65K			BIT(6)
+
 #define MAX_CONTRAST 255
 
 const struct ssd130x_deviceinfo ssd130x_variants[] = {
@@ -212,7 +239,13 @@ const struct ssd130x_deviceinfo ssd130x_variants[] = {
 		.default_width = 96,
 		.default_height = 64,
 		.family_id = SSD133X_FAMILY,
-	}
+	},
+	/* ssd135x family */
+	[SSD1351_ID] = {
+		.default_width = 128,
+		.default_height = 128,
+		.family_id = SSD135X_FAMILY,
+	},
 };
 EXPORT_SYMBOL_NS_GPL(ssd130x_variants, "DRM_SSD130X");
 
@@ -246,47 +279,16 @@ static inline struct ssd130x_device *drm_to_ssd130x(struct drm_device *drm)
 /*
  * Helper to write data (SSD13XX_DATA) to the device.
  */
-static int ssd130x_write_data(struct ssd130x_device *ssd130x, u8 *values, int count)
+static int ssd130x_write_data(struct ssd130x_device *ssd130x, const u8 *values, int count)
 {
 	return regmap_bulk_write(ssd130x->regmap, SSD13XX_DATA, values, count);
 }
 
-/*
- * Helper to write command (SSD13XX_COMMAND). The fist variadic argument
- * is the command to write and the following are the command options.
- *
- * Note that the ssd13xx protocol requires each command and option to be
- * written as a SSD13XX_COMMAND device register value. That is why a call
- * to regmap_write(..., SSD13XX_COMMAND, ...) is done for each argument.
- */
-static int ssd130x_write_cmd(struct ssd130x_device *ssd130x, int count,
-			     /* u8 cmd, u8 option, ... */...)
-{
-	va_list ap;
-	u8 value;
-	int ret;
-
-	va_start(ap, count);
-
-	do {
-		value = va_arg(ap, int);
-		ret = regmap_write(ssd130x->regmap, SSD13XX_COMMAND, value);
-		if (ret)
-			goto out_end;
-	} while (--count);
-
-out_end:
-	va_end(ap);
-
-	return ret;
-}
-
 /*
  * Write a command byte sequence from a buffer.
  *
- * Like ssd130x_write_cmd() but takes a pre-built byte array instead of
- * variadic arguments, handy when the command is already in an array or
- * when the caller wants to use sizeof() for the length.
+ * The first byte is the command opcode and the following bytes are its
+ * options/parameters.
  */
 static int ssd130x_write_cmds(struct ssd130x_device *ssd130x, const u8 *cmd,
 			      size_t len)
@@ -294,6 +296,22 @@ static int ssd130x_write_cmds(struct ssd130x_device *ssd130x, const u8 *cmd,
 	unsigned int i;
 	int ret;
 
+	/*
+	 * The SSD135X family latches command parameters with D/C# HIGH (i.e.
+	 * clocked in as data), unlike the other families where the opcode and
+	 * all of its parameters are sent as commands (D/C# LOW). Send the
+	 * opcode as a command and any following parameter bytes as data.
+	 */
+	if (ssd130x->device_info->family_id == SSD135X_FAMILY) {
+		if (len == 0)
+			return 0;
+		ret = regmap_write(ssd130x->regmap, SSD13XX_COMMAND, cmd[0]);
+		if (ret || len == 1)
+			return ret;
+
+		return ssd130x_write_data(ssd130x, cmd + 1, len - 1);
+	}
+
 	for (i = 0; i < len; i++) {
 		ret = regmap_write(ssd130x->regmap, SSD13XX_COMMAND, cmd[i]);
 		if (ret)
@@ -303,6 +321,27 @@ static int ssd130x_write_cmds(struct ssd130x_device *ssd130x, const u8 *cmd,
 	return 0;
 }
 
+/*
+ * Variadic wrapper around ssd130x_write_cmds(). The first variadic argument is
+ * the command opcode and the following ones are its options/parameters.
+ */
+static int ssd130x_write_cmd(struct ssd130x_device *ssd130x, int count,
+			     /* u8 cmd, u8 option, ... */...)
+{
+	u8 buf[8];
+	va_list ap;
+
+	if (count > ARRAY_SIZE(buf))
+		return -EINVAL;
+
+	va_start(ap, count);
+	for (int i = 0; i < count; i++)
+		buf[i] = va_arg(ap, int);
+	va_end(ap);
+
+	return ssd130x_write_cmds(ssd130x, buf, count);
+}
+
 /*
  * Run a packed command sequence.  The format is a flat byte array where each
  * entry starts with a length byte followed by that many command bytes.  A
@@ -415,6 +454,12 @@ static void ssd130x_reset(struct ssd130x_device *ssd130x)
 	udelay(4);
 	gpiod_set_value_cansleep(ssd130x->reset, 0);
 	udelay(4);
+	/*
+	 * No long post-reset delay: the controller datasheets only specify
+	 * microsecond-scale reset timing. The lengthy delay seen in some other
+	 * drivers comes from fbtft's generic reset helper and targets slow
+	 * parallel-bus GPIOs, which do not apply here.
+	 */
 }
 
 static int ssd130x_power_on(struct ssd130x_device *ssd130x)
@@ -622,6 +667,42 @@ static int ssd133x_init(struct ssd130x_device *ssd130x)
 	return ssd130x_run_cmd_seq(ssd130x, cmds);
 }
 
+static int ssd135x_init(struct ssd130x_device *ssd130x)
+{
+	/*
+	 * Horizontal address increment, COM split, reversed COM scan direction,
+	 * BGR sub-pixel order and 65k (RGB565) color depth. Rotation is not
+	 * supported, so the remap byte is fixed.
+	 */
+	u8 remap = SSD135X_SET_REMAP_65K | SSD135X_SET_REMAP_COM_SPLIT |
+		   SSD135X_SET_REMAP_COLOR_BGR | SSD135X_SET_REMAP_COM_SCAN;
+	const u8 cmds[] = {
+		2, SSD135X_SET_COMMAND_LOCK, 0x12,
+		2, SSD135X_SET_COMMAND_LOCK, 0xb1,
+		1, SSD13XX_DISPLAY_OFF,
+		2, SSD135X_SET_CLOCK_FREQ, 0xf1,
+		2, SSD135X_SET_MUX_RATIO, ssd130x->height - 1,
+		3, SSD135X_SET_COL_RANGE, 0x00, ssd130x->width - 1,
+		3, SSD135X_SET_ROW_RANGE, 0x00, ssd130x->height - 1,
+		2, SSD135X_SET_DISPLAY_START, 0x00,
+		2, SSD135X_SET_DISPLAY_OFFSET, 0x00,
+		2, SSD135X_SET_GPIO, 0x00,
+		2, SSD135X_SET_FUNCTION, 0x01,
+		2, SSD135X_SET_PHASE_LENGTH, 0x32,
+		4, SSD135X_SET_VSL, 0xa0, 0xb5, 0x55,
+		2, SSD135X_SET_PRECHARGE, 0x17,
+		2, SSD135X_SET_VCOMH_VOLTAGE, 0x05,
+		4, SSD135X_SET_CONTRAST, 0xc8, 0x80, 0xc8,
+		2, SSD135X_SET_CONTRAST_MASTER, 0x0f,
+		2, SSD135X_SET_PRECHARGE2, 0x01,
+		1, SSD135X_SET_DISPLAY_NORMAL,
+		2, SSD13XX_SET_SEG_REMAP, remap,
+		0
+	};
+
+	return ssd130x_run_cmd_seq(ssd130x, cmds);
+}
+
 static int ssd130x_update_rect(struct ssd130x_device *ssd130x,
 			       struct drm_rect *rect, u8 *buf,
 			       u8 *data_array)
@@ -784,6 +865,26 @@ static int ssd132x_update_rect(struct ssd130x_device *ssd130x,
 	return ret;
 }
 
+/*
+ * Write a run of pixel data to the controller's display RAM. The SSD135X
+ * family requires an explicit Write RAM command once the address window has
+ * been set, before any pixel data is accepted; the SSD133X family enters data
+ * mode implicitly after the column/row range is programmed.
+ */
+static int ssd133x_write_pixels(struct ssd130x_device *ssd130x,
+				u8 *data_array, unsigned int count)
+{
+	if (ssd130x->device_info->family_id == SSD135X_FAMILY) {
+		int ret;
+
+		ret = ssd130x_write_cmd(ssd130x, 1, SSD135X_WRITE_RAM);
+		if (ret < 0)
+			return ret;
+	}
+
+	return ssd130x_write_data(ssd130x, data_array, count);
+}
+
 static int ssd133x_update_rect(struct ssd130x_device *ssd130x,
 			       struct drm_rect *rect, u8 *data_array,
 			       unsigned int pitch)
@@ -826,7 +927,7 @@ static int ssd133x_update_rect(struct ssd130x_device *ssd130x,
 		return ret;
 
 	/* Write out update in one go since horizontal addressing mode is used */
-	ret = ssd130x_write_data(ssd130x, data_array, pitch * rows);
+	ret = ssd133x_write_pixels(ssd130x, data_array, pitch * rows);
 
 	return ret;
 }
@@ -896,7 +997,7 @@ static void ssd133x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
 	memset(data_array, 0, pitch * ssd130x->height);
 
 	/* Write out update in one go since horizontal addressing mode is used */
-	ssd130x_write_data(ssd130x, data_array, pitch * ssd130x->height);
+	ssd133x_write_pixels(ssd130x, data_array, pitch * ssd130x->height);
 }
 
 static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb,
@@ -1356,7 +1457,13 @@ static const struct drm_plane_helper_funcs ssd130x_primary_plane_helper_funcs[]
 		.atomic_check = ssd133x_primary_plane_atomic_check,
 		.atomic_update = ssd133x_primary_plane_atomic_update,
 		.atomic_disable = ssd133x_primary_plane_atomic_disable,
-	}
+	},
+	[SSD135X_FAMILY] = {
+		DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+		.atomic_check = ssd133x_primary_plane_atomic_check,
+		.atomic_update = ssd133x_primary_plane_atomic_update,
+		.atomic_disable = ssd133x_primary_plane_atomic_disable,
+	},
 };
 
 static const struct drm_plane_funcs ssd130x_primary_plane_funcs = {
@@ -1510,6 +1617,10 @@ static const struct drm_crtc_helper_funcs ssd130x_crtc_helper_funcs[] = {
 		.mode_valid = ssd130x_crtc_mode_valid,
 		.atomic_check = ssd133x_crtc_atomic_check,
 	},
+	[SSD135X_FAMILY] = {
+		.mode_valid = ssd130x_crtc_mode_valid,
+		.atomic_check = ssd133x_crtc_atomic_check,
+	},
 };
 
 static const struct drm_crtc_funcs ssd130x_crtc_funcs = {
@@ -1597,6 +1708,31 @@ static void ssd133x_encoder_atomic_enable(struct drm_encoder *encoder,
 	ssd130x_power_off(ssd130x);
 }
 
+static void ssd135x_encoder_atomic_enable(struct drm_encoder *encoder,
+					  struct drm_atomic_commit *state)
+{
+	struct drm_device *drm = encoder->dev;
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
+	int ret;
+
+	ret = ssd130x_power_on(ssd130x);
+	if (ret)
+		return;
+
+	ret = ssd135x_init(ssd130x);
+	if (ret)
+		goto power_off;
+
+	ssd130x_write_cmd(ssd130x, 1, SSD13XX_DISPLAY_ON);
+
+	backlight_enable(ssd130x->bl_dev);
+
+	return;
+
+power_off:
+	ssd130x_power_off(ssd130x);
+}
+
 static void ssd130x_encoder_atomic_disable(struct drm_encoder *encoder,
 					   struct drm_atomic_commit *state)
 {
@@ -1622,7 +1758,11 @@ static const struct drm_encoder_helper_funcs ssd130x_encoder_helper_funcs[] = {
 	[SSD133X_FAMILY] = {
 		.atomic_enable = ssd133x_encoder_atomic_enable,
 		.atomic_disable = ssd130x_encoder_atomic_disable,
-	}
+	},
+	[SSD135X_FAMILY] = {
+		.atomic_enable = ssd135x_encoder_atomic_enable,
+		.atomic_disable = ssd130x_encoder_atomic_disable,
+	},
 };
 
 static const struct drm_encoder_funcs ssd130x_encoder_funcs = {
@@ -1897,15 +2037,25 @@ struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap)
 	if (ret)
 		return ERR_PTR(ret);
 
-	bl = devm_backlight_device_register(dev, dev_name(dev), dev, ssd130x,
-					    &ssd130xfb_bl_ops, NULL);
-	if (IS_ERR(bl))
-		return ERR_PTR(dev_err_probe(dev, PTR_ERR(bl),
-					     "Unable to register backlight device\n"));
+	/*
+	 * The backlight update path drives contrast through the
+	 * SSD13XX_CONTRAST command (0x81), which the SSD135X family does not
+	 * implement; the brightness byte would be interpreted as a command
+	 * opcode instead. Do not register a backlight device for this family
+	 * until the backlight path is family-aware.
+	 */
+	if (ssd130x->device_info->family_id != SSD135X_FAMILY) {
+		bl = devm_backlight_device_register(dev, dev_name(dev), dev,
+						    ssd130x, &ssd130xfb_bl_ops,
+						    NULL);
+		if (IS_ERR(bl))
+			return ERR_PTR(dev_err_probe(dev, PTR_ERR(bl),
+						     "Unable to register backlight device\n"));
 
-	bl->props.brightness = ssd130x->contrast;
-	bl->props.max_brightness = MAX_CONTRAST;
-	ssd130x->bl_dev = bl;
+		bl->props.brightness = ssd130x->contrast;
+		bl->props.max_brightness = MAX_CONTRAST;
+		ssd130x->bl_dev = bl;
+	}
 
 	ret = ssd130x_init_modeset(ssd130x);
 	if (ret)
diff --git a/drivers/gpu/drm/solomon/ssd130x.h b/drivers/gpu/drm/solomon/ssd130x.h
index a4554018bb2a..350472cc5a12 100644
--- a/drivers/gpu/drm/solomon/ssd130x.h
+++ b/drivers/gpu/drm/solomon/ssd130x.h
@@ -26,7 +26,8 @@
 enum ssd130x_family_ids {
 	SSD130X_FAMILY,
 	SSD132X_FAMILY,
-	SSD133X_FAMILY
+	SSD133X_FAMILY,
+	SSD135X_FAMILY,
 };
 
 enum ssd130x_variants {
@@ -42,6 +43,8 @@ enum ssd130x_variants {
 	SSD1327_ID,
 	/* ssd133x family */
 	SSD1331_ID,
+	/* ssd135x family */
+	SSD1351_ID,
 	NR_SSD130X_VARIANTS
 };
 
-- 
2.54.0

