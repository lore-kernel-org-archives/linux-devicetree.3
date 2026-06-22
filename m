Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859A3376A15
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 15:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782141930; cv=none; b=UnwFI9MUvd5Ek2Z6VsxlCp98Xp3Kki9cuburRbAKLxaPDlDOnEqG8RyMiyFDFcdRgsQDjCtYI0eiyIeceJ+FXMdJjqKrZ838828fOBw/toghMnYnVMzwLAZMfp0perzZcnCHW07W5KdZz0l5SVELX+sR9igufW3/+zlIM6cThko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782141930; c=relaxed/simple;
	bh=I3B93BxZo0AU8LWIZx5lMY92h6w8QGPV0v3aJqD2+GY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tiIq5aIUwLsODw9fpm08qSZtz01I3fFIC5jxaME6dRWvT1uLqhhy9UjFFay1C0wc0hPsWAFgrtQi+vyfIbx4UhhLVigR/kSP8Q3bwolM7IeTTHh5PMr+ffw8VQGC6Ygtl1gNyfNMqHx5kAmQ5aUKitqE9+Id2zXhiLNwza9+ziI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gOMjhfFK; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gOMjhfFK"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b3637b90so35342975e9.3
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 08:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782141926; x=1782746726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ON6p2DcRvPR4R4Kx2yBwFjcA7sWxsAVk3Fl7vP+pyzc=;
        b=gOMjhfFKvQ8s/QVb2A8Rz721OvWvKqDzM8GUbalJaqWIhwca0Dz8hP0jH238dPUw9v
         eT9/ztoZzISXtSvbU8X59QMRbNbkqC74t//2/EOcFK8Mt43DSmGkhBCiFuMfzHWfJS1a
         3b81zMmGhLTcU4PMeLqPFGtsY7bwqvpnbIpuKwsk5jMwcyw3G2+dIy/ecsiBuWPy2kLV
         etEk2I6LNPjFmdkuzv8Qo+9CPf5NcoFinlWB4CbEwZ3Q/FeZiOpmctfPyhxAhyj1x6xh
         JDQK+V2HzYV1jV8h/WPzhBxsK2djstNVP8RAjjypnlrj+NfW8ajxqpBU48ldOqpcgDYA
         19ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782141926; x=1782746726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ON6p2DcRvPR4R4Kx2yBwFjcA7sWxsAVk3Fl7vP+pyzc=;
        b=eqEhCosbe9tvpErCCvlYmv1x9MUY3DqSb7oDA3dcoXvYF35Nle7pnDIGcpBmVmLqCj
         VIqMIaYuKMpVCwxka0emMpicFlTpWAY70jBZ0DT5ZUBJkV1yzQBJ7ofVV5Z2tk/ywZas
         5YxM0Xtfh193D2s73GgA0eLQFz6vKsvQ6LYA14CWIiitfOpm834NGphJDsqYB6kV/gi5
         MSEpFIugu53o0csagiN+EW+nZ8KhIHt+W1ApNGxYxwQUBHX161pwoAYusUClG9hK0nDd
         z66feVwbj+FbP+v9/LL+Lg4SAIWSlwC5wzMOR7TSsVjZ9tm1MRdNA27Ytw91enAJtm6u
         nstA==
X-Forwarded-Encrypted: i=1; AFNElJ/bqw1yXgiNy0XL4CIaVM8Ks5gKKTFZEE066hFIVfgWdEq4Pb5S+qUR3135SwXRBO/9nndzlN/NNoIP@vger.kernel.org
X-Gm-Message-State: AOJu0YwQNKFLGQhvhBOuPLLNtRwS+PjZfwJembaQ/GFNXtq5mz6H7ovF
	5aYcW2WDNiX+X9fDDxjnV+d9hdvO2eMeK3DFvO5wBlqPGOc2IOfenB4C
X-Gm-Gg: AfdE7cnPStvFkVhExrMe4GA39G8MYNKGAHiSy9fY/ohZxM0SKhlH/ValBoRNa+7Tt9Z
	OZfGBktOpSMjmYJKUQVXD/ZJUuibLonQYk1R2+U/IHPkDF8lSTI7TH3xcAeSVB18TVIFgrQQ+Se
	a8GUJnVWgIvnnP2qkus55M7oOGAQhwKN9Bqw+8GN4JMgWF8xYPWh8f8Teagg6qtIS9S4EZJsptR
	1OXSnB+OCFmCSbWQ4kc0Itjr4jYJZsOnqmxXhGhdR0OYYNkycSEhQ1/1dvnq0V4GfRzdSRZYtR4
	6uPPOmfd/LiOIKeP5/TOLqwRgPokgyACfv885MOJcCMlzmhNUnvCblICcglg5ZbxmLFqas5Li3C
	FZ7dnAlTT2GJiZ3RqRMRlOEOMcUn6R3vhF1/BNZAYGCqiOQcXzxGJ1nhtsxADOtU+VcFaAclQsn
	VZu0aEBd251t0Ued75LlQfHtMsBzo=
X-Received: by 2002:a05:600c:3ba4:b0:492:53e8:3bc1 with SMTP id 5b1f17b1804b1-49253e83d22mr107383235e9.17.1782141925472;
        Mon, 22 Jun 2026 08:25:25 -0700 (PDT)
Received: from anthony.local ([2a06:c701:49b2:4c00:12ff:e0ff:fea5:3d2e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492492338dasm217883655e9.1.2026.06.22.08.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 08:25:24 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: javierm@redhat.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	deller@gmx.de
Cc: azuddinadam@gmail.com,
	chintanlike@gmail.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Amit Barzilai <amit.barzilai22@gmail.com>
Subject: [PATCH v2 3/4] drm/ssd130x: Add SSD135X_FAMILY and SSD1351 support
Date: Mon, 22 Jun 2026 18:25:05 +0300
Message-ID: <20260622152506.78627-4-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260622152506.78627-1-amit.barzilai22@gmail.com>
References: <20260622152506.78627-1-amit.barzilai22@gmail.com>
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
via ssd135x_encoder_atomic_enable, and a longer post-reset settle delay.
The re-map byte is fixed at 0 degrees, 65k color, COM split, BGR
sub-pixel order; rotation is not supported.

The SSD1351 is SPI-only, so only the SPI transport match tables gain an
entry; no new config symbol is needed.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Amit Barzilai <amit.barzilai22@gmail.com>
---
 drivers/gpu/drm/solomon/ssd130x-spi.c |   7 +
 drivers/gpu/drm/solomon/ssd130x.c     | 214 +++++++++++++++++++++-----
 drivers/gpu/drm/solomon/ssd130x.h     |   5 +-
 3 files changed, 189 insertions(+), 37 deletions(-)

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
index 2b0a8218f529..e5a9428f91b8 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -146,6 +146,33 @@
 #define SSD133X_COLOR_DEPTH_256			0x0
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
@@ -214,6 +241,13 @@ const struct ssd130x_deviceinfo ssd130x_variants[] = {
 		.default_height = 64,
 		.format_rgb565 = 1,
 		.family_id = SSD133X_FAMILY,
+	},
+	/* ssd135x family */
+	[SSD1351_ID] = {
+		.default_width = 128,
+		.default_height = 128,
+		.format_rgb565 = 1,
+		.family_id = SSD135X_FAMILY,
 	}
 };
 EXPORT_SYMBOL_NS_GPL(ssd130x_variants, "DRM_SSD130X");
@@ -248,47 +282,16 @@ static inline struct ssd130x_device *drm_to_ssd130x(struct drm_device *drm)
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
@@ -296,6 +299,22 @@ static int ssd130x_write_cmds(struct ssd130x_device *ssd130x, const u8 *cmd,
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
@@ -305,6 +324,28 @@ static int ssd130x_write_cmds(struct ssd130x_device *ssd130x, const u8 *cmd,
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
+	int i;
+
+	if (count > ARRAY_SIZE(buf))
+		return -EINVAL;
+
+	va_start(ap, count);
+	for (i = 0; i < count; i++)
+		buf[i] = va_arg(ap, int);
+	va_end(ap);
+
+	return ssd130x_write_cmds(ssd130x, buf, count);
+}
+
 /*
  * Run a packed command sequence.  The format is a flat byte array where each
  * entry starts with a length byte followed by that many command bytes.  A
@@ -628,6 +669,49 @@ static int ssd133x_init(struct ssd130x_device *ssd130x)
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
+		0,
+	};
+
+	/*
+	 * ssd130x_power_on() issues a short reset pulse, but the SSD1351 is not
+	 * ready to accept commands immediately afterwards. Give the controller
+	 * time to settle before sending the init sequence.
+	 */
+	msleep(120);
+
+	return ssd130x_run_cmd_seq(ssd130x, cmds);
+}
+
 static int ssd130x_update_rect(struct ssd130x_device *ssd130x,
 			       struct drm_rect *rect, u8 *buf,
 			       u8 *data_array)
@@ -790,6 +874,25 @@ static int ssd132x_update_rect(struct ssd130x_device *ssd130x,
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
+		int ret = ssd130x_write_cmd(ssd130x, 1, SSD135X_WRITE_RAM);
+
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
@@ -832,7 +935,7 @@ static int ssd133x_update_rect(struct ssd130x_device *ssd130x,
 		return ret;
 
 	/* Write out update in one go since horizontal addressing mode is used */
-	ret = ssd130x_write_data(ssd130x, data_array, pitch * rows);
+	ret = ssd133x_write_pixels(ssd130x, data_array, pitch * rows);
 
 	return ret;
 }
@@ -917,7 +1020,7 @@ static void ssd133x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
 	memset(data_array, 0, pitch * ssd130x->height);
 
 	/* Write out update in one go since horizontal addressing mode is used */
-	ssd130x_write_data(ssd130x, data_array, pitch * ssd130x->height);
+	ssd133x_write_pixels(ssd130x, data_array, pitch * ssd130x->height);
 }
 
 static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb,
@@ -1380,6 +1483,12 @@ static const struct drm_plane_helper_funcs ssd130x_primary_plane_helper_funcs[]
 		.atomic_check = ssd133x_primary_plane_atomic_check,
 		.atomic_update = ssd133x_primary_plane_atomic_update,
 		.atomic_disable = ssd133x_primary_plane_atomic_disable,
+	},
+	[SSD135X_FAMILY] = {
+		DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+		.atomic_check = ssd133x_primary_plane_atomic_check,
+		.atomic_update = ssd133x_primary_plane_atomic_update,
+		.atomic_disable = ssd133x_primary_plane_atomic_disable,
 	}
 };
 
@@ -1534,6 +1643,10 @@ static const struct drm_crtc_helper_funcs ssd130x_crtc_helper_funcs[] = {
 		.mode_valid = ssd130x_crtc_mode_valid,
 		.atomic_check = ssd133x_crtc_atomic_check,
 	},
+	[SSD135X_FAMILY] = {
+		.mode_valid = ssd130x_crtc_mode_valid,
+		.atomic_check = ssd133x_crtc_atomic_check,
+	},
 };
 
 static const struct drm_crtc_funcs ssd130x_crtc_funcs = {
@@ -1621,6 +1734,31 @@ static void ssd133x_encoder_atomic_enable(struct drm_encoder *encoder,
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
@@ -1646,6 +1784,10 @@ static const struct drm_encoder_helper_funcs ssd130x_encoder_helper_funcs[] = {
 	[SSD133X_FAMILY] = {
 		.atomic_enable = ssd133x_encoder_atomic_enable,
 		.atomic_disable = ssd130x_encoder_atomic_disable,
+	},
+	[SSD135X_FAMILY] = {
+		.atomic_enable = ssd135x_encoder_atomic_enable,
+		.atomic_disable = ssd130x_encoder_atomic_disable,
 	}
 };
 
diff --git a/drivers/gpu/drm/solomon/ssd130x.h b/drivers/gpu/drm/solomon/ssd130x.h
index b0b487c06e04..da89d4455270 100644
--- a/drivers/gpu/drm/solomon/ssd130x.h
+++ b/drivers/gpu/drm/solomon/ssd130x.h
@@ -26,7 +26,8 @@
 enum ssd130x_family_ids {
 	SSD130X_FAMILY,
 	SSD132X_FAMILY,
-	SSD133X_FAMILY
+	SSD133X_FAMILY,
+	SSD135X_FAMILY
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

