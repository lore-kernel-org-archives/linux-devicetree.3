Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DC53446C7
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 19:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778353229; cv=none; b=IuCDjtUMldE650xoYinQ7B1NllDT5D+1XvTY7TP3DpctqoY62SEyaZnyRv8Wf6qWMq8yiR/iNfVClIfCeh7paf6jGs93DSKzfDbWroO3bxgUtYMcZH/TCEkvcq42E3NTGk0lr0W+wUq4sIQBnzoymjRbbaXnjE0n/edPI30DPXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778353229; c=relaxed/simple;
	bh=dJZiUI/nXwbVKeTyU5YlTJh5eS1vXANNoICbkU5BWMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=isCwv8hwBjjqvdL1+pX27trP7VPnANBpbl+qviBMSKJmEzVsBtXtmsOlAhSg2sCMaqtLHAbdmAPPuffTxJMF02/R73rnyWGwJr9i9QlOlxdO9Y07ka9WqzkwAkQkCD8HntiQoer2+cDccE/LRpz/pI3PxDU6//FMF2ckM8mq1Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mAfn7DsJ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mAfn7DsJ"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-449de065cb3so2793966f8f.2
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 12:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778353226; x=1778958026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFHSVkKikAqL7V5/tk/bF1gVjwq2bK7i4HjBHfLDqaU=;
        b=mAfn7DsJuE1lS8lGbqvF+gtkWlU/TsGy/CqufQjfeEA9W/jXxKCaHkQwFdKa67ESso
         yj1jhLqg2Xgx3+90wT8ohnK5GLjEheXlbHh1btbLJqgIM+sVSQINZLkiayiB6Z+YPUT9
         lnW1xrkJKFvRuS3YZRPpY5BdvNrDWvrw/SZDfWbu2AEY0y1hXaqCvUm9DiGK4XbdxE5g
         XKGK2jVbvY4rh7T2v/M017k2ae+6fwB8LrcY8nIgMGzaObAGeojriFlR1+DfOhb2VdTa
         /6v5VDBfaGk0ydDFHLkaT+rRaH9JinlZfZYgwdw02ITpNbZsn2J8QwZwTQpj7V+UG5xj
         onnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778353226; x=1778958026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OFHSVkKikAqL7V5/tk/bF1gVjwq2bK7i4HjBHfLDqaU=;
        b=hileweXTP0dQ1hZ7Fiy3f0mJI399+fF4zLaXyWeg6nXxkb7EwF4oB9w6MRgHxd35UM
         ll7//gtcp70m+i/TIFlpKEoxl63bh9R/gQWAMPaEYIHdQ92DfsR5X88wuhgRZl296551
         BTa9z621e4pR91AEMOJG84mXRy4h8iglYaprPsM5goXnTtc4+SgT1KCX9nyzi0/ijBWv
         C/ajbfIjahu8JhPTeIq0pr0YC44jRcwShrpvwYNDOY5nXn/FOJr1uUQ1TM4H4oXLYoBp
         pjJcXkTXDTUSCSD/MGyfJguaFvBpLWjbUYd9t0u4Q+ahyk9YwC9NETmG6X6sj8OOG6LT
         WPRg==
X-Forwarded-Encrypted: i=1; AFNElJ/xxsJ5vBMmyiJ02ibBF3ACjayBj7cedavDeFjgvMQ8YHIP0+60PwIaRPElOZaGwst7zCz3utvvSPXU@vger.kernel.org
X-Gm-Message-State: AOJu0YwwC5AHyr3H5RInh5XXtcjgKw6YMZNvzHQqDl+O6BLfBjnOXPN4
	V0+QXL3pYE6Dc70zuoEJS5IXyU/JgFEclKo5pT65XcvCbZKRSywuYPFq
X-Gm-Gg: Acq92OFyB0PDHVoWZaF2y7xDu+FrSlWPoGFBr57mpuvxm5evfVtaonrEZ2nNXub2Yt9
	9T2A8NhBFx7NuHPl/IkRwgTyxj6wutIRblwTOGU32VNddFF1gYdAnE4lMIAV6ezzGwRJYokKloe
	LhgV3ImZg6BDzZ6MTjnTd+88YFH/ImXDUOxGRdma1//J8eWX5aAlBT44LWp6TfPUUSkYupM+mtN
	CNYlv390qFa9UeHYO9WG8ndcwD0RYG2E4j6/obI36eKb+pssTq5y7hN7r3UU1Cbh1Avz9BpmJR4
	tUoIeF+zSd3lL6SUO7wbdN+pbQgNAc4lOgtWbH8NWm8DLcxKauWX+2lJcvyb5GIUo4uyFLNVjMk
	Ucy+6gIU1KYZ0DFHtmMDq1gEPzWrXWSao7uzmdWJE1bpndYy9cKIF4HqG8LX0ymnSrVLqr5ReOm
	wzFxSGBbmcLUrppGoHl+UY+8iPQx/dpmApc4rN7q+j4bG5aK1MkcMHPzVEF1BGZxaaFAU=
X-Received: by 2002:a05:6000:40dc:b0:43d:309b:9c4f with SMTP id ffacd0b85a97d-4515b056c90mr27920879f8f.6.1778353225999;
        Sat, 09 May 2026 12:00:25 -0700 (PDT)
Received: from jernej-laptop (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454913049ecsm13254407f8f.19.2026.05.09.12.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 12:00:25 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
X-Google-Original-From: Jernej Skrabec <jernej.skrabec@siol.net>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	jernej.skrabec@gmail.com,
	Chen-Yu Tsai <wens@kernel.org>
Subject: [PATCH v2 4/8] drm/sun4i: vi_layer: Limit formats for DE33
Date: Sat,  9 May 2026 21:00:11 +0200
Message-ID: <20260509190015.79086-5-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260509190015.79086-1-jernej.skrabec@siol.net>
References: <20260509190015.79086-1-jernej.skrabec@siol.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

YUV formats need scaler support due to chroma upscaling, but that's not
yet supported in the driver. Remove them from supported list until
DE33 scaler is properly supported.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes from v1:
- collected tag
- generalize check to be dependant on scaler feature

 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 40 ++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index cd8d6c2da0c7..afbd41a18a0e 100644
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
@@ -410,8 +437,17 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	layer->cfg = cfg;
 
 	if (layer->cfg->de_type >= SUN8I_MIXER_DE3) {
-		formats = sun8i_vi_layer_de3_formats;
-		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
+		/*
+		 * TODO: DE33 drivers doesn't support scaling yet, which is a
+		 * requirement for YUV support.
+		 */
+		if (layer->cfg->scaler_mask & BIT(phy_index)) {
+			formats = sun8i_vi_layer_de3_formats;
+			format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
+		} else {
+			formats = sun8i_vi_layer_de3_no_yuv_formats;
+			format_count = ARRAY_SIZE(sun8i_vi_layer_de3_no_yuv_formats);
+		}
 	} else {
 		formats = sun8i_vi_layer_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_formats);
-- 
2.54.0

