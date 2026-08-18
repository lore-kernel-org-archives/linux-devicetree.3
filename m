Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881C441A928
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040409; cv=none; b=XZfUTc2+qmx3DFc7JdJbU4bAoQ2BZfb7RHAce0kt0eGZK4Y2qyYZFAynICOTrGtfrTmsuvEsdQB8C0irNKWMFczFlQEKZE/s4IU1FV17dbViAWQ1gWfRHWCxshaUP74V745aNyJP6i1eDzqw0oLfFUMXJrHVshdBJttM0P387GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040409; c=relaxed/simple;
	bh=TVi24iBQ1QVrTa+rzUHLKX53+fSWuDkq8cbLEoN9vMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RXkMae7GggKUeU796TiO+7VuvNw25NPVQBQpzhKZJH+RVOYEuhJQ3jYhbCJKUDb/6Xa/vZIgFtQ09ABq9P1KNe/tPSLwKfvH+2faLKFjG3Lv/8FAfTuxqhy3+PfLrUJ7IyI8YQtafA9bBMX46BjIAVcSTTnIYAN8jlzmlwOi6JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I1C7/d5f; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1C7/d5f"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a3e145e1bfso1111495a12.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 01:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040406; x=1787645206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ky5AAenkhb8FlnMl43V7nWMO27MSh6zMgGttM+QAy0=;
        b=I1C7/d5ftt5iUpudS8y5TDZ60gadD80gVRZXHoTLO5DNr0Q8ZYkwU1wO6ldngYYSrL
         v6w89rUceYPpdOSCmhYjWOCAQrJIYm/L8JygtomcvtHeHjXpWEoanha+L5/8YIN4T19J
         Y8NLGIQzYU5K56Zl82jZRm8iNNhno0+hMW0gAyDHZai1OVB1GcdsGiV7sdEweO7Hn/0p
         ZETkfz/WSFEFJInV/ShLlWLcfGAomGOSD8XuJxHN5jLn+Ay2O9MTQYXdvT1O1PmHjAk0
         wlASePQZhDEBHEfxWv3DUv6V2iOoBiqnAXxIp+gv4HjNkWiSlneZWzwra2wKvwueNQ9G
         yyug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040406; x=1787645206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ky5AAenkhb8FlnMl43V7nWMO27MSh6zMgGttM+QAy0=;
        b=nqDfvLeHmsF4yogX5ruSD9zDhUx83IVgZGkWbJtBGAFSWXfguejBVgVDE5MlLqmWjB
         aoMs5Q3nOn3ZjKaI+s/Bo94WBFpkuiQePdM2ypJscLedO6PsuTHR1rKio1/WeS8cpQDY
         ki8HfvVR8sE6+/h3QH/dxxNn6Xu28G2uWMmoZ7IUAAw83gVDRvAB+Pr5EMpWsgZQ798C
         Wagz9hxZjdk+F9/2XvUdcl8rkyvU+uTo2ePi94GRyWSxBCiwegNa8G7DZopdTYnL1/pw
         yF6DgO4eY04Yo24d0RPsrMDRAyIjU787x3fkl+m1nX7iyR/i/Gep/+IinY+MUfhSwpNL
         fTxA==
X-Forwarded-Encrypted: i=1; AHgh+Rrrrnl7Z1kbTQJVLiW61wACCKzOHz6G/SvnnYbnFcQJkPvvo4/evlEmlvzCFjjhtABATEGadfppmU3/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+fVTK6tRG8G84T4ikHlBGYKF8CjsE189tokXTKw/1b11dGfI4
	IGHQxWWUx5nPYIdwFK5+bPBA1SUVnkqVhKvSFPtbfIXA7M/7TFZfTGkj
X-Gm-Gg: AR+sD12sVIQXxGkXY3EJW1k7n456gclsnWGZT5jTI0R3GgTqr7jJZFIw4hc4t1tpuYD
	dcaAs2fI8/8PhfyWiXdmMH7OPSHaKKTGZ8Prazm8XAPheQpO9lvMZYhO/nlFDc0GsmYSHKfGOGY
	IAzquedd7elvcx328ejiMfY6MyzBXHv+dWzLVHifoh+UFpqAL5gfSuhY2/lgrY6UtiSSXJE3sGh
	TVXZ/7yyxOuA53NEyuUUhQrx0+LOoMEYCZ/y4A15quzD+OBlkSCRCFhbGObaQJjwZVY/UwWo9eP
	AcL1svPtxxRD56krxR2yKJScIFqxmidQ7vIL0KENpfTLpRvoYXwoHQufVEvAIU1//GRkH/uLdip
	CCiwaIyA90b8JyFmQUCuDTRTV+s3286cHjm8PskF3btq1VVV8v5NiehNMaEGB626NjcMy2vFobX
	Q9m3Wh6mgsqD1sZkIQNS1tae/383yW5FWXNrxaVtSqEEuVvBDzpbNaJhGkkz/X67V1jdFedUyVv
	RI0
X-Received: by 2002:a17:906:a8c:b0:c20:31d1:a899 with SMTP id a640c23a62f3a-c2188470ce8mr280058166b.4.1787040405261;
        Tue, 18 Aug 2026 01:06:45 -0700 (PDT)
Received: from anthony.local ([2a06:c701:9cc4:c200:33d8:8ea2:e077:ebe1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a3b2e9sm10367223f8f.9.2026.08.18.01.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:06:44 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Fabio Piparo <holofermes@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amit Barzilai <amit.barzilai22@gmail.com>
Subject: [PATCH v4 2/6] drm/ssd130x: Change SSD133X color format to RGB565 from RGB332
Date: Tue, 18 Aug 2026 11:06:22 +0300
Message-ID: <20260818080626.30430-3-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818080626.30430-1-amit.barzilai22@gmail.com>
References: <20260818080626.30430-1-amit.barzilai22@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SSD133X screens were driven at 8bpp RGB332 despite supporting 16bpp RGB565.
Switch the SSD133X data path to RGB565.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Amit Barzilai <amit.barzilai22@gmail.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/solomon/ssd130x.c | 45 +++++++++++++++++++------------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 0b0fc6fe3df2..1110aa63d066 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -146,6 +146,11 @@
 #define SSD133X_DEFAULT_CONTRAST_B		0x50
 #define SSD133X_DEFAULT_CONTRAST_C		0x7d
 
+/* ssd133x remap byte (data of SSD13XX_SET_SEG_REMAP) */
+#define SSD133X_SET_REMAP_COM_SPLIT		BIT(5)
+#define SSD133X_SET_REMAP_COLOR_DEPTH_MASK	GENMASK(7, 6)
+#define SSD133X_COLOR_DEPTH_65K			0x1
+
 #define MAX_CONTRAST 255
 
 const struct ssd130x_deviceinfo ssd130x_variants[] = {
@@ -618,17 +623,17 @@ static int ssd133x_set_contrast(struct ssd130x_device *ssd130x, u32 brightness)
 static int ssd133x_init(struct ssd130x_device *ssd130x)
 {
 	int ret;
+	/*
+	 * Horizontal address increment, normal SA,SB,SC (e.g. RGB) sub-pixel
+	 * order, COM split odd even and 65k (RGB565) color depth.
+	 */
+	u8 remap = SSD133X_SET_REMAP_COM_SPLIT |
+		   FIELD_PREP(SSD133X_SET_REMAP_COLOR_DEPTH_MASK, SSD133X_COLOR_DEPTH_65K);
 	const u8 cmds[] = {
 		2, SSD133X_SET_MASTER_CURRENT, 0x06,
 		3, SSD133X_SET_COL_RANGE, 0x00, ssd130x->width - 1,
 		3, SSD133X_SET_ROW_RANGE, 0x00, ssd130x->height - 1,
-		/*
-		 * Horizontal Address Increment
-		 * Normal order SA,SB,SC (e.g. RGB)
-		 * COM Split Odd Even
-		 * 256 color format
-		 */
-		2, SSD13XX_SET_SEG_REMAP, 0x20,
+		2, SSD13XX_SET_SEG_REMAP, remap,
 		2, SSD133X_SET_DISPLAY_START, 0x00,
 		2, SSD133X_SET_DISPLAY_OFFSET, 0x00,
 		1, SSD133X_SET_DISPLAY_NORMAL,
@@ -829,14 +834,20 @@ static int ssd133x_update_rect(struct ssd130x_device *ssd130x,
 	 * COM0 to COM[N - 1] are the rows and SEG0 to SEG[M - 1] are
 	 * the columns.
 	 *
-	 * Each Segment has a 8-bit pixel and each Common output has a
-	 * row of pixels. When using the (default) horizontal address
-	 * increment mode, each byte of data sent to the controller has
-	 * a Segment (e.g: SEG0).
+	 * Each Segment holds one pixel and each Common output has a row
+	 * of pixels. A pixel is 8 bits (one byte) in the 256 color
+	 * (RGB332) format or 16 bits (two bytes) in the 65k color
+	 * (RGB565) format. When using the (default) horizontal address
+	 * increment mode, the pixel data is sent Segment by Segment
+	 * (e.g: SEG0 first).
 	 *
 	 * When using the 256 color depth format, each pixel contains 3
-	 * sub-pixels for color A, B and C. These have 3 bit, 3 bit and
-	 * 2 bits respectively.
+	 * sub-pixels for color A, B and C. These have 3, 3 and 2 bits
+	 * respectively.
+	 *
+	 * When using the 65k color depth format, each pixel contains 3
+	 * sub-pixels for color A, B and C. These have 5, 6 and 5 bits
+	 * respectively.
 	 */
 
 	/* Set column start and end */
@@ -909,7 +920,7 @@ static void ssd132x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
 
 static void ssd133x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
 {
-	const struct drm_format_info *fi = drm_format_info(DRM_FORMAT_RGB332);
+	const struct drm_format_info *fi = drm_format_info(DRM_FORMAT_RGB565);
 	unsigned int pitch;
 
 	if (!fi)
@@ -978,7 +989,7 @@ static int ssd133x_fb_blit_rect(struct drm_framebuffer *fb,
 				struct drm_format_conv_state *fmtcnv_state)
 {
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
-	const struct drm_format_info *fi = drm_format_info(DRM_FORMAT_RGB332);
+	const struct drm_format_info *fi = drm_format_info(DRM_FORMAT_RGB565);
 	unsigned int dst_pitch;
 	struct iosys_map dst;
 
@@ -988,7 +999,7 @@ static int ssd133x_fb_blit_rect(struct drm_framebuffer *fb,
 	dst_pitch = drm_format_info_min_pitch(fi, 0, drm_rect_width(rect));
 
 	iosys_map_set_vaddr(&dst, data_array);
-	drm_fb_xrgb8888_to_rgb332(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
+	drm_fb_xrgb8888_to_rgb565be(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
 
 	ssd133x_update_rect(ssd130x, rect, data_array, dst_pitch);
 
@@ -1446,7 +1457,7 @@ static int ssd133x_crtc_atomic_check(struct drm_crtc *crtc,
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	struct ssd130x_crtc_state *ssd130x_state = to_ssd130x_crtc_state(crtc_state);
-	const struct drm_format_info *fi = drm_format_info(DRM_FORMAT_RGB332);
+	const struct drm_format_info *fi = drm_format_info(DRM_FORMAT_RGB565);
 	unsigned int pitch;
 	int ret;
 
-- 
2.55.0

