Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878B338F653
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 08:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783152592; cv=none; b=E3yJFtXYM30M18Ud6ZNDF09fxsrbmolfU7MaQK1Xx00YQHP6ZCSA6gVV9fMWqGDydCEt9XZ4roya5b3PpQeDqKrW4lHHjucEaK37iD4DyQaEwzn2Tti60mjlZGhRScLtYNtBAGz0JeccP9rOWE2ASbv0bj9VC40jBU/4K/48NUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783152592; c=relaxed/simple;
	bh=r3eIsgHVRCHunL3bYKEdXyrN4+Koj1l8nWsCT3YWZsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mMqapSMUg8ZRT+PQ2p+WGa0g7Kprn9QcxenrK2ABi6cD+u4GczTCuZxohGd8snAOyNdYuB8imcroEh9m785Ntqr6yJxW2GDzTWAPRZcXWZV8YjdRRIgiMezCo1o/Likk18iTApBOaXXclCU+A/3f0a0zkwgQVl/6Shdig8VHhe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OalYyJkZ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OalYyJkZ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493c83474ddso12852495e9.3
        for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 01:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783152587; x=1783757387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5sRdDxXdJoIR7rHcHYJyjPRi8VcEI0CsKE31MI1Zm8w=;
        b=OalYyJkZ+hmgRUv+Un3aWBXgP/jppVmakLS4e675ZS3tUYCkUhRJ7YvSn1Vn62e53C
         Dz388xpT+UXffFqj1fEMeBECtE18L4NZx5YLw8+RpZveGg3mWgssFVXBTMA72Ffjy+XR
         1LVQaSUgfXl+clgmbJ9LplADOhMzXglXKSoGboDbsQd7hFF2pbZyvffVv13dMlbLXy3m
         yFQJD1YkOpBH8VoblFAS9mAqpZlKDqKwHM08bQnOh9c507g7dhnUChAB548r5u0Xl12z
         nUaeA+X7cF6Swc51Gjihw7YFU3BBpx4QCHl3rf8Uz2pSON/+Vh+GkvAaQ5oAj6+CH4O7
         fcjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783152587; x=1783757387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5sRdDxXdJoIR7rHcHYJyjPRi8VcEI0CsKE31MI1Zm8w=;
        b=f/N5ensnM7c1um6QJTvlWUCfecz8MFMlXm7EnwpcKB311gfr6tsgq13g0cuJBqhwuB
         wE61CAaYXafj6XfpRuPy8nXAxlm7VYkMuvDyHFHnIBg2AVa/jU/3GsjoqusCIJsZ1fD3
         WrG1JkI5I21Yqg0uMzi1CDifBl4TsMwPYbzDvAEFaYgZNDrpHwL7UgLZ0uyiaIqTseNr
         TpdgCtLaMS7JlH7zmsOVs3w2G0yyYo/MwA7ydTbbL/asf3/GGLwuat4iakGKwT82t0zR
         DPs8j4b3EM1WFHf0TxgZwCbsOtFHEz00LT99SgGQR9t8q+6+knyxRwjUToB1QQTXmJVR
         /QwA==
X-Forwarded-Encrypted: i=1; AFNElJ9adE5lN89Em2g9EsZNpzok4WKFIczHfMBbtO+jSYVyOsAl2pd4w+CmHVPLUvldg0WW1VKxJAkVjXX/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1dNXNpJO+fPCgcyc39pvednhEf8LkIIr1mXfupP8Z27o7nXvf
	u/AHOHjm8fMv7ENpnMZMAE5T2DSUkBvtkgQrMV7hNSQH6o0iymMv+fBQ
X-Gm-Gg: AfdE7clyBNQawtPVQxqGHIk4w8Do6fcynJguIWsEnUdy9d8bVNAoWl0i8/v3swPfKxn
	p56tCBT2Va4FGez5EvaN0yGGJHlVyhytBjhn+E1vEdlTg4jsLwsDwaQ7nMpPV2st3GC5vXR7GBS
	fvqBChavLjH/FNXhn9Kx+h2etFkPGZD4AalZlZv8LyBg4Kn60FKn/1xVty+ZB1QzRla84+Ag6jk
	1CBVKcklZScM52/3YQqnpBYFIw43+ZpyD/EtLAJ5htEZxRm2RVYmoV5xuvpvKkU3pYkMDbUy8BN
	C+qDpB7R1j8U5fPBnumc1qc+8D0yO6p8KtZ/vcPq+agtnPd2x382JFHLY0aQ1Xz9ZO8hrohxJ7O
	btXLHRdfpmGjU5M+/om1x0yQ3fUXIC8sXXpai5Wgm/jOL7G6cQceOvrQs5tkRuZtqYQ1UFAmw5r
	7v+dYo26YCu/fMghue9yRWIrNlzjk=
X-Received: by 2002:a05:600c:811a:b0:493:bc92:ba9a with SMTP id 5b1f17b1804b1-493d11d7e5bmr23547495e9.13.1783152587230;
        Sat, 04 Jul 2026 01:09:47 -0700 (PDT)
Received: from anthony.local ([2a06:c701:49b2:4c00:12ff:e0ff:fea5:3d2e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm6143055f8f.26.2026.07.04.01.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 01:09:46 -0700 (PDT)
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
Subject: [PATCH v3 2/3] drm/ssd130x: Change SSD133X color format to RGB565 from RGB332
Date: Sat,  4 Jul 2026 11:09:24 +0300
Message-ID: <20260704080925.75113-3-amit.barzilai22@gmail.com>
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

SSD133X screens were driven at 8bpp RGB332 despite supporting 16bpp RGB565.
Switch the SSD133X data path to RGB565.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Amit Barzilai <amit.barzilai22@gmail.com>
---
 drivers/gpu/drm/solomon/ssd130x.c | 45 +++++++++++++++++++------------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 04da4f2f7d08..3f09977d227b 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -140,6 +140,11 @@
 #define SSD133X_SET_PRECHARGE_VOLTAGE		0xbb
 #define SSD133X_SET_VCOMH_VOLTAGE		0xbe
 
+/* ssd133x remap byte (data of SSD13XX_SET_SEG_REMAP) */
+#define SSD133X_SET_REMAP_COM_SPLIT		BIT(5)
+#define SSD133X_SET_REMAP_COLOR_DEPTH_MASK	GENMASK(7, 6)
+#define SSD133X_COLOR_DEPTH_65K			0x1
+
 #define MAX_CONTRAST 255
 
 const struct ssd130x_deviceinfo ssd130x_variants[] = {
@@ -584,6 +589,12 @@ static int ssd132x_init(struct ssd130x_device *ssd130x)
 
 static int ssd133x_init(struct ssd130x_device *ssd130x)
 {
+	/*
+	 * Horizontal address increment, normal SA,SB,SC (e.g. RGB) sub-pixel
+	 * order, COM split odd even and 65k (RGB565) color depth.
+	 */
+	u8 remap = SSD133X_SET_REMAP_COM_SPLIT |
+		   FIELD_PREP(SSD133X_SET_REMAP_COLOR_DEPTH_MASK, SSD133X_COLOR_DEPTH_65K);
 	const u8 cmds[] = {
 		2, SSD133X_CONTRAST_A, 0x91,
 		2, SSD133X_CONTRAST_B, 0x50,
@@ -591,13 +602,7 @@ static int ssd133x_init(struct ssd130x_device *ssd130x)
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
@@ -794,14 +799,20 @@ static int ssd133x_update_rect(struct ssd130x_device *ssd130x,
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
@@ -874,7 +885,7 @@ static void ssd132x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
 
 static void ssd133x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
 {
-	const struct drm_format_info *fi = drm_format_info(DRM_FORMAT_RGB332);
+	const struct drm_format_info *fi = drm_format_info(DRM_FORMAT_RGB565);
 	unsigned int pitch;
 
 	if (!fi)
@@ -945,7 +956,7 @@ static int ssd133x_fb_blit_rect(struct drm_framebuffer *fb,
 				struct drm_format_conv_state *fmtcnv_state)
 {
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
-	const struct drm_format_info *fi = drm_format_info(DRM_FORMAT_RGB332);
+	const struct drm_format_info *fi = drm_format_info(DRM_FORMAT_RGB565);
 	unsigned int dst_pitch;
 	struct iosys_map dst;
 	int ret = 0;
@@ -956,7 +967,7 @@ static int ssd133x_fb_blit_rect(struct drm_framebuffer *fb,
 	dst_pitch = drm_format_info_min_pitch(fi, 0, drm_rect_width(rect));
 
 	iosys_map_set_vaddr(&dst, data_array);
-	drm_fb_xrgb8888_to_rgb332(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
+	drm_fb_xrgb8888_to_rgb565be(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
 
 	ssd133x_update_rect(ssd130x, rect, data_array, dst_pitch);
 
@@ -1414,7 +1425,7 @@ static int ssd133x_crtc_atomic_check(struct drm_crtc *crtc,
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	struct ssd130x_crtc_state *ssd130x_state = to_ssd130x_crtc_state(crtc_state);
-	const struct drm_format_info *fi = drm_format_info(DRM_FORMAT_RGB332);
+	const struct drm_format_info *fi = drm_format_info(DRM_FORMAT_RGB565);
 	unsigned int pitch;
 	int ret;
 
-- 
2.54.0

