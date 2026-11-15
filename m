Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723088;
	b=OQFXWGQYsYnjagWVn6Jv8idyOBzDMVSB6u7QTZyHcqQIE5VZnQ/4tLUw4psoy8FhvJFc
	 PxRQIjCvIDXXn9cVZsA55EzojrXRvpvzRrZkOabBj2NjAsjiuF2NUW3+TE6f0a7r2J0fP
	 15gBZ2daB/k02hmKBRf+6XxkQ1tobgaypCLJW+aalygZXNnu36NvVjeQWE7oGC2WjZd9b
	 JMoA63AkLyj6ndvCIzDQ0LVskymxtetarGRII41EIW2lA2gnoYURm3Rpg+CEKKeaiLsmu
	 3Bvv1qqNEq8OH3CGU40Yk4tN2HFmXcpByICP6IAbbucj7urr3qR3QW3RhhlkQNI/y0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bKP+aWmCnAOyzY6tYN5Sieibvo/NSg7cNkXShke5YqE=;
	b=c5x5I1fMYSNdASLNGEEXLBUGNtN3yF76nqXW3vqeUc0EMzkJLffopxXB7e+vSLy7gIAo
	 8TxWC4PlHWrknr3we6gN/sjd/vRZTGJ8ymSYx25z6zAer/sQjZhGXOQ/MTNZV+3u6ZEbr
	 8z0Npr0li8w720gQMDBkktz/OudypdZ5ForsfMCu1/SO2gEOjdCL41nqMbX4vduf/gHck
	 JToTIfQQQM0OuKcEzeQ24H0PAn5EWDMwrfqJRrXSo4ZvRcgQdb/O039ewLRgF8/fyuvS0
	 f6A+eWE1TvWNoN5x0i/jq/FHCfweT94chSnHVGBM2BUbWAFD5m55rYl8ZAt6K6nT1dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b+Lhdg4m;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D8A606A339
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 06:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3D8A606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b+Lhdg4m
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49d05d51553so12304985e9.2
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 22:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723086; x=1795327886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bKP+aWmCnAOyzY6tYN5Sieibvo/NSg7cNkXShke5YqE=;
        b=b+Lhdg4m/dcMm9HMsUKla5IAwKClyGKG9iG+iiAEbv/eH03xVtF6QnBKP0+p9IObQR
         j5v/TXJ1h7rRqBVSL+eicw255iAnOIdl++kGNKarPEm5Vua1qOWsZd9X0hTQnA6Yg/MR
         qcxwWvU2Y3SCQ7Zp4nINUZOt1R9+ETCO5HpaU8TjiXKyEMEQu/l5QSzCliddEmO1FD/b
         AjaC2V6d7vibg4hoXndn6ZyiKPbZ3GChLe0hU3vLqCLQv1Dwr0Hpg6vXEiBv1HYa3eXK
         hRWsb5IqVRPqcXFA+fe8/t51JC1mMctaTV0x6+UJXA9oa3TbLWFGP56Y4RStVfnQPMDc
         bXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723086; x=1795327886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bKP+aWmCnAOyzY6tYN5Sieibvo/NSg7cNkXShke5YqE=;
        b=K6QoSLJMc2J7au2sw0sPj//PUKc0NpnrYGdOz6xxTBt3Ni3FLicRXd4o/OlQDOH2tu
         wM0ormWWt3Ci3klWDilPJJZQ+jjwooaaD3K/PEIgolOMoKuK1kinvrax3JdFHF6AZ1FG
         FCA1fOkDcjQigyjFG6rOzQHGYRgc1m46pxLO8AZre/UNmmzMgLK3eBe3090hCi23YPoq
         61kTR5Sxr3Dk9RFp4+JuiM9ZSLkE2CO1SXzz6Kkgc5oTA3DddnQYrUi+E1allLYVuXsM
         gvSXP7t5IhtobRXbJvB+cMtt1WaThFG8Mi2uxh+GICeqPsjViLu1XgDqRoq2A2fzrr/p
         0SHA==
X-Forwarded-Encrypted: i=1; AL+hErFVuXFd16UghHbRxEk7V11w/RLsOWNac408JS4IBrGagUr3oh/IumqHTr3TvvyN3WAUg1fS6G6zHB2G@vger.kernel.org
X-Gm-Message-State: APuU4Z8A1HJ+1hGKepCYx31TVgF0VlWYkysaOnzKZ3i9ry9+bboFVmcS
	nlcbvqA8yIcr6K/lMXIFuVmDq/Uo57FPfE7I6o8BPAv5rTArUm6FPoBA
X-Gm-Gg: AYBFou3C8rM/wGWO1dirGJR8gCG53qWow12iHzlsUymwerFBDSuLlW6+5kxiPzvxNcX
	+RDddivmCFVDjXOX5FqoJhEGy0cYC5puTAfxQ2VyPh0pTBHWQeM/bzaf1kus8yY4OCQQAtDhsH9
	ReCJLLR7cxPC6D2QT/bqukdtKGxu4OJfDE5F5nxD1Osm2Mgdbvb3Um7Uhqio0jEgq5d4RN5UMhL
	dPamdJDfXfKUMvbOlBxnbjHPZ8rpwQ/jTj/cLeFDEPH5U9/qJv4A6LNMs1S9K3/Gou902/lk474
	ZS2rXL/bJ0XTR/YH1w0Z3riLh2xQvwA0wpl5zxj6Aw+Uk7xfePr+vHkHHu41f3Qp5QopdJhV10p
	rRLMzoLyIaQzf9mPbOsviJzQey8cH1Nznfp+W5jlLV+G9niYKz01B/L2EN94ZF7PfzhZwi2+Qvn
	YvqzuGDUvmxbB+yc9sVcOy3vlCHIVVxAeINq+upfygftgp8QMQ4CvkIBeBh5OIsjPvt15HAOhdi
	nnsMdn3sEmBCKLcOtYUSpMUcgVOyjyaZpxjhc7wqH1We9xCeEJC3Yfl9KWSqhkd0sBjeA1kDhL4
	ZZVgNOL6A5RpX4uV0ehMtd6FAiEH4+nPpkgpzzCfpDiMB0Wm/TT63MoDnc7zXpoMgyVukWtXu9Y
	v7b3H/0SB3aBV+dHfiBdTxGJXNiQQedXbpLEMSmQN6IHkH7c/679KGszLMtQ9sIxS0Qcj88GSpz
	wksOU9Zv1t7kblUTI+f5nCLzZJXu/cKcCHdyWUEndyeH8Ch8ZWx4ed2WOatGrl0GlRvoEJtd7t9
	ZGKspTa+rTgSA==
X-Received: by 2002:a05:600c:3487:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4bb55a4f1b4mr151025935e9.13.1794723086291;
        Sat, 14 Nov 2026 22:11:26 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:25 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	sboyd@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 4/8] drm/sun4i: vi_layer: Limit formats for DE33
Date: Sun, 15 Nov 2026 07:10:58 +0100
Message-ID: <20261115061102.229680-5-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115061102.229680-1-jernej.skrabec@gmail.com>
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

YUV formats need scaler support due to chroma upscaling, but that's not
yet supported in the driver. Remove them from supported list until
DE33 scaler is properly supported.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 72 ++++++++++++++++++++------
 1 file changed, 56 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 6b19fafd50ad..09d94f7f9977 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -380,6 +380,33 @@ static const u32 sun8i_vi_layer_de3_formats[] = {
 	DRM_FORMAT_YVU422,
 };
 
+static const u32 sun8i_vi_layer_de3_no_yuv_formats[] = {
+	DRM_FORMAT_ABGR1555,
+	DRM_FORMAT_ABGR2101010,
+	DRM_FORMAT_ABGR4444,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_ARGB1555,
+	DRM_FORMAT_ARGB2101010,
+	DRM_FORMAT_ARGB4444,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_BGR565,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_BGRA1010102,
+	DRM_FORMAT_BGRA5551,
+	DRM_FORMAT_BGRA4444,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_RGBA1010102,
+	DRM_FORMAT_RGBA4444,
+	DRM_FORMAT_RGBA5551,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_XRGB8888,
+};
+
 static const uint64_t sun8i_layer_modifiers[] = {
 	DRM_FORMAT_MOD_LINEAR,
 	DRM_FORMAT_MOD_INVALID
@@ -395,6 +422,7 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	u32 supported_encodings, supported_ranges;
 	unsigned int format_count;
 	struct sun8i_layer *layer;
+	bool yuv_support = true;
 	const u32 *formats;
 	int ret;
 
@@ -410,8 +438,18 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	layer->cfg = cfg;
 
 	if (layer->cfg->de_type >= SUN8I_MIXER_DE3) {
-		formats = sun8i_vi_layer_de3_formats;
-		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
+		/*
+		 * TODO: DE33 drivers doesn't support scaling yet, which is a
+		 * requirement for YUV support.
+		 */
+		yuv_support = layer->cfg->scaler_mask & BIT(phy_index);
+		if (yuv_support) {
+			formats = sun8i_vi_layer_de3_formats;
+			format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
+		} else {
+			formats = sun8i_vi_layer_de3_no_yuv_formats;
+			format_count = ARRAY_SIZE(sun8i_vi_layer_de3_no_yuv_formats);
+		}
 	} else {
 		formats = sun8i_vi_layer_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_formats);
@@ -443,22 +481,24 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 		return ERR_PTR(ret);
 	}
 
-	supported_encodings = BIT(DRM_COLOR_YCBCR_BT601) |
-			      BIT(DRM_COLOR_YCBCR_BT709);
-	if (layer->cfg->de_type >= SUN8I_MIXER_DE3)
-		supported_encodings |= BIT(DRM_COLOR_YCBCR_BT2020);
+	if (yuv_support) {
+		supported_encodings = BIT(DRM_COLOR_YCBCR_BT601) |
+				      BIT(DRM_COLOR_YCBCR_BT709);
+		if (layer->cfg->de_type >= SUN8I_MIXER_DE3)
+			supported_encodings |= BIT(DRM_COLOR_YCBCR_BT2020);
 
-	supported_ranges = BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
-			   BIT(DRM_COLOR_YCBCR_FULL_RANGE);
+		supported_ranges = BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
+				   BIT(DRM_COLOR_YCBCR_FULL_RANGE);
 
-	ret = drm_plane_create_color_properties(&layer->plane,
-						supported_encodings,
-						supported_ranges,
-						DRM_COLOR_YCBCR_BT709,
-						DRM_COLOR_YCBCR_LIMITED_RANGE);
-	if (ret) {
-		dev_err(drm->dev, "Couldn't add encoding and range properties!\n");
-		return ERR_PTR(ret);
+		ret = drm_plane_create_color_properties(&layer->plane,
+							supported_encodings,
+							supported_ranges,
+							DRM_COLOR_YCBCR_BT709,
+							DRM_COLOR_YCBCR_LIMITED_RANGE);
+		if (ret) {
+			dev_err(drm->dev, "Couldn't add encoding and range properties!\n");
+			return ERR_PTR(ret);
+		}
 	}
 
 	drm_plane_helper_add(&layer->plane, &sun8i_vi_layer_helper_funcs);
-- 
2.43.0

