Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2272D3F928E
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376434; cv=none; b=OJrf+vFaW8xG5gLcOzC0XXmau9SYSHGh32+CmQM8cE5eSczJPzHykZfh4r9bO+nFMjnC6EFPKibp4Ol2TQA2YkZOaTpZHXvxBsheDxG4gTx/xmtPwBUeMPRYOHINW0IVJsIJnB0HTVnQzd0ZJ5/xotd9XIBdbKtm1ku/gjJUDr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376434; c=relaxed/simple;
	bh=Ie0FCsE2DHtI4jhzGqR+dmG93hiTT/8SIraHQpg8y4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Re+pFtwalUWjotrl4+OW0+yMKNon330GmY2ShHKKHYknbXcRO+iTVF+7px3lq4wQnGkIs5xK/KcfM0y4YJ89/IQh0/Zm8Bvxx2EGqeOPiS7jPjLXVoZAc1uoZhazzwjg50y77O0aJLgS0OBasDjXvX8BB7jU6oxM4M5nDvyvzHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oHyMKVHG; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oHyMKVHG"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843378fb37so753101f8f.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 02:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789376423; x=1789981223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VT13ksi3OXIOndUOzudMSplx3NO7d38IamwYpMwrKgo=;
        b=oHyMKVHGHZBwZ+N3uFSDeVSrJqzY0mn9UM25WIQkh5CXuPLM2miWF1PqI9oujKm59P
         NlwigdLiAvAdRIDFlhuz2iriltWCAvP3cKk0kT9VL1J9+kz39BnY5n3I1K6jY9+dKLgq
         8uzof4GdCGCEE5nHfRQ1ps0rWmfMqAtdnOdhGQvsMbVAVuS2E/d3EIQ4aZkHbUQ7E3JD
         pAT9/Yc6Cp/WUMoY44z3C9IuqIQi3STttxajcCrXdZcH2aJoRxWowPaQZzooChTPohOU
         inDG7PX2NNouxtczNRiYZZ7m4DDQAqxRlfNSXajhxHBqBKh+EET+Cfs4Jg9b8bTffGCc
         s1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376423; x=1789981223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VT13ksi3OXIOndUOzudMSplx3NO7d38IamwYpMwrKgo=;
        b=L8MnoifGuRFt7n6G9YgJRK3douaT0BX67tBcYcl9epnQt9QOErJ/uQDz+FFnVvwUF2
         TIQfCaABp5FzFxASg3PpslvGwro8EmOTcU88MPvnzX3YVV2gUbMRE3K8Nn8eQ7AA7QhN
         uHTb2lcLg5/b/X4CW3w0ab+xyxpfzWK0otNhPrJy8Pm7FPEDxPtt1VTtYZgXyiRSWGn9
         WO7UCUCHrpMESY132StsBWv06KOjrfcUvPVU45yUjhFFnt5S+HHi75JyOjhNLraOO57m
         7TPAF8RGQZwS8WWVIXL6oQnsTIa2kah4QSVyODjnXnSVioATmCJfgK/A05IsTZTiDV1j
         Elnw==
X-Forwarded-Encrypted: i=1; AKwUvBz/ht2/eA+UQCZ7W6ZOr4URUm/uQkcDoWFL100kDDCa+8gz0QcTFZoFHwHCrziU4Fi3bv5DSzuYhnw3@vger.kernel.org
X-Gm-Message-State: AFuF++nG3BjeZl81NSNYuu4azXIrf76MG9qH4e4aj221vu9TV4AQMSGl
	y+p9+bn0hB2TAVjX+FIJ9NT/wN1iNlnuUfeIbSWIFAsH7YNxxIqfZ9IB
X-Gm-Gg: AYBFou1p6pe6Fy05AVIiz7/tUQOk0C7EXt919SObY3BsCF6WmkpNinybbH5ih/fSpGl
	GU1W+FHY/VB9hxuI0wpMc61DQ9ygmH9QmnPxTXF8/YO2FWpRrNKdJBzuI3+01xJJqkLa/eBgfhH
	SiZj1Z8eniA3RGxe6pLj6Ji4Fj8pBhHwaVsqvGA0jfXK052HekgpJNIoiQZH5wwa+/JeSbHJOss
	5KpUAMiRyU0jYBH+h99gLXPlch+eqDpdlq6dRe8hA8iGv2KM5tDDrLxrZ+dekvQmAhzJcC2x5qm
	9nS3Lnk1uRESZ8kXbHWvPHAGnzYXrwwKrwaf30fsZPUJ4QfRdK0dYjnxd8x6yWo3vpry2qCFsum
	MwiB3FKnStKpJZYM+JIux9HLhvZ06WGSNoH+rV1XTixbKTb1JCTBoDH51iCppeoPnS/Aza7ojxJ
	2QrmR5lyFGLwf4VxPX0nywbP680RbTc5mRo2GLpFCKe6wVtOnXg8kYKttDMBEcmPL4TbUWvDsi6
	xWvttNL4N8E
X-Received: by 2002:a5d:5f8e:0:b0:485:8a46:b3ce with SMTP id ffacd0b85a97d-48702b8316dmr1416118f8f.54.1789376420461;
        Mon, 14 Sep 2026 02:00:20 -0700 (PDT)
Received: from anthony.local ([2a06:c701:9cc4:c200:33d8:8ea2:e077:ebe1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e7f5sm25245851f8f.9.2026.09.14.02.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:00:20 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: javierm@redhat.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andriy.shevchenko@intel.com,
	holofermes@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	amit.barzilai22@gmail.com
Subject: [PATCH v6 2/6] drm/ssd130x: Change SSD133X color format to RGB565 from RGB332
Date: Mon, 14 Sep 2026 11:59:27 +0300
Message-ID: <20260914085931.66857-3-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914085931.66857-1-amit.barzilai22@gmail.com>
References: <20260914085931.66857-1-amit.barzilai22@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SSD133X screens were driven at 8bpp RGB332 despite supporting 16bpp RGB565.
Switch the SSD133X data path to RGB565.

Assisted-by: LLM
Signed-off-by: Amit Barzilai <amit.barzilai22@gmail.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/gpu/drm/solomon/ssd130x.c | 48 ++++++++++++++++++++-----------
 1 file changed, 31 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index feec4933e3e6..cbf77a74c4fa 100644
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
+	const u8 remap = SSD133X_SET_REMAP_COM_SPLIT |
+			 FIELD_PREP(SSD133X_SET_REMAP_COLOR_DEPTH_MASK, SSD133X_COLOR_DEPTH_65K);
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
@@ -909,9 +920,10 @@ static void ssd132x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
 
 static void ssd133x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
 {
-	const struct drm_format_info *fi = drm_format_info(DRM_FORMAT_RGB332);
+	const struct drm_format_info *fi;
 	unsigned int pitch;
 
+	fi = drm_format_info(DRM_FORMAT_RGB565);
 	if (!fi)
 		return;
 
@@ -978,17 +990,18 @@ static int ssd133x_fb_blit_rect(struct drm_framebuffer *fb,
 				struct drm_format_conv_state *fmtcnv_state)
 {
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
-	const struct drm_format_info *fi = drm_format_info(DRM_FORMAT_RGB332);
+	const struct drm_format_info *fi;
 	unsigned int dst_pitch;
 	struct iosys_map dst;
 
+	fi = drm_format_info(DRM_FORMAT_RGB565);
 	if (!fi)
 		return -EINVAL;
 
 	dst_pitch = drm_format_info_min_pitch(fi, 0, drm_rect_width(rect));
 
 	iosys_map_set_vaddr(&dst, data_array);
-	drm_fb_xrgb8888_to_rgb332(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
+	drm_fb_xrgb8888_to_rgb565be(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
 
 	ssd133x_update_rect(ssd130x, rect, data_array, dst_pitch);
 
@@ -1446,10 +1459,11 @@ static int ssd133x_crtc_atomic_check(struct drm_crtc *crtc,
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	struct ssd130x_crtc_state *ssd130x_state = to_ssd130x_crtc_state(crtc_state);
-	const struct drm_format_info *fi = drm_format_info(DRM_FORMAT_RGB332);
+	const struct drm_format_info *fi;
 	unsigned int pitch;
 	int ret;
 
+	fi = drm_format_info(DRM_FORMAT_RGB565);
 	if (!fi)
 		return -EINVAL;
 
-- 
2.55.0

