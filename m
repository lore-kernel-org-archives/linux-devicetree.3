Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1107D390992
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 11:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787484036; cv=none; b=Oc6mBK6IRUtPHEKP2ic7HmWv22HfRsn87g83OJkqzWgaq60e9W7oWYuZo0oj8jPy8Ohbf8LfXYnEblOrA3p7NbbSxmnjqxT6GPEAhY39aWKFhX3rvAe+pS5WGAY03aj+9rimRz3Af7TO+oBK7QudXmoElG+1WRSs/eqlX/0rF5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787484036; c=relaxed/simple;
	bh=sS+JQZ85OpW7bY3sDFgkgCR9UWbFFQQuEfzVJqKunbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i0XBwSik7mOocd5GNr6C1NZeGR0zeBm7QiLAEIttJqLxyOmTEWKY/ht48D5fQHSHumRyqz4GNAn5b1B7BvILRYRS92qXUPnczSgZILS3jk9Z7U3t2CGLhkRcUGjl19NEoedJRLjWDc8NuDsPMGwHyosM6vjEmqUusfXwmo0vlrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=osA8EUBa; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="osA8EUBa"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so4737165a12.3
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 04:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787484032; x=1788088832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O2nHmLuWlmB9nT6PWD8W1i/ls2Umb2NuoFiA04KEePk=;
        b=osA8EUBawZ0heovjb25FQajptwNPN/DzUbbO/VBCR0zPArKIz69alwAXKes1mwGe4d
         B0x0AVjzIrPkiwym0Mmle8OqbKplgJ21RLxuA0qdW0zDnuGAESoxx08XLnZHhNKxkcDm
         fwIRPfMYriLPnussVhHak87k+MDEiyiepq8Iwl+zMfL5WdFOj0ZkC8mvRfA8giv+AupZ
         7/b0F+Aq+8BfWZjl1Ci9Z0ZuouD+autyZXyaifMk8IHWf3W8FKpacFOyFZ4KJ1fems8+
         kmcB9vcsuUKJfiGCSSnmeDFXo0D9VW9yTDeZ9Bw4FFWJS2x6VWNfEJ3OdrfYFhftTLsD
         1uQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787484032; x=1788088832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O2nHmLuWlmB9nT6PWD8W1i/ls2Umb2NuoFiA04KEePk=;
        b=EWsuEEV06qxQSgY4c3IhBT5FK0JgTNH2T0dHWcTuX16wEVFiJVX9jOHX5mjxrseOEQ
         mRsFYkCPVqIbUFPe2aWVKLnwF+dHgLMRyEacITCgGmbgEOoDcGf3e3AYuNf6LamDpF10
         LGldHBKNUdBABhBKG3MouiL2EM9Z39J3q3i3ngHN/heENDM9wRfN8aowxB7glnMFTWDH
         EVo4zLwFOKBGMmxHC6W7UC3Ln6DSE2glh6s/l9pIaItXRhinECNbqwutZ2EJrtPZqUIs
         U6/KspicRFAUAjLRzmtfebxTYLREkVQngm8ZtwOggnMdjRjLnfg5ch5XYFf/MRlvBjGP
         ps+g==
X-Forwarded-Encrypted: i=1; AHgh+RohQtRda9CJ11aeOuwr4CHLnX5kFM3B7iGj8zUqI/ZZ9f/BPQPqOyUuVwxP3cWc9dveik/iYAjLPeFQ@vger.kernel.org
X-Gm-Message-State: AFuF++mOqCJDD3CjJ2OKCZc50PqWS7xmLgW2roT4EFLirNeOhBiIxYQX
	NJ4ks8QHh9dFxow9vbEahywEOuyRhKiFa/oNopedfvQ2zBiNPXUK2U8r
X-Gm-Gg: AR+sD12YNZHZKdRB9Id2fajHqLeEaJK5Z2D7UlhQa24ZeLFPEKV9DyOUIApTltc1Z3Q
	WLMoPzyh11pNxtLQmwoctMGRoAf0t/EC2KGc4/ftkoDGsMW0zLkMVSW4QXf2ZrJ6HmGusQu1guz
	0GPkXg/86mbqEYzvNlNK0y0oxjEjITjwzEplz2+OTaAR5+2HQaOWcT4Ae65fzPheBxI3+nM4shY
	VN3DeOeeKVplVKR0OWDPY3fey5/ofubDr7vyUb6fsU9nQKln2Ma14UYinoTM4li3tEwlvuyIzja
	W4aYKDDZtTf82uLDa4+TOZbeoLegM2WYQ46WZzfOy8iMWjv+JAcEnnstaiTHrMJJKm/AqGnxJUb
	xmK+IQ25qTKL56iJ8ikJLgtsTe6BQ3JrSNQtYQp9tnRXALU/NUrZ9fpR3lhSyUFecxbcz1pZNW+
	8le9svibeCsgIoJGsHOgmj39szBdRDIooi9bU1954wQZWNNeqJRi1sWkGkUWjVkbH59g==
X-Received: by 2002:a17:907:9495:b0:c21:49df:1650 with SMTP id a640c23a62f3a-c2491c9bae2mr962084666b.8.1787484032115;
        Sun, 23 Aug 2026 04:20:32 -0700 (PDT)
Received: from thinker ([2a13:54c2:f000:e268:6d0c:d746:2b12:231f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f58dfsm707233866b.38.2026.08.23.04.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:20:31 -0700 (PDT)
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
	Amit Barzilai <amit.barzilai22@gmail.com>
Subject: [PATCH v5 2/6] drm/ssd130x: Change SSD133X color format to RGB565 from RGB332
Date: Sun, 23 Aug 2026 14:19:55 +0300
Message-ID: <20260823111959.17029-3-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260823111959.17029-1-amit.barzilai22@gmail.com>
References: <20260823111959.17029-1-amit.barzilai22@gmail.com>
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
 drivers/gpu/drm/solomon/ssd130x.c | 48 ++++++++++++++++++++-----------
 1 file changed, 31 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 0b0fc6fe3df2..8cf1e9c84a81 100644
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

