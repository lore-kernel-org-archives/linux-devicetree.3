Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723086;
	b=4rHHt1ozf8ylOmgp715ay2Jv5C+Odw9W8AHTYqS0+E9y07qXHr51HsHiUyxauGbDej1a
	 bMRdLnA5YO/F6us7DOQ2sZNDymQ5TTCLMf2g33Mmh8TyAtTndtCDz1LViCwGIPd4GONoJ
	 MrAyYqe8j6NBN/c25ZVZ473Prs2mqud7bgqdn/k83S/xil07NJHBj0YHziQn0aF+Z8oxF
	 8VchAYu0dHvvYdHpNpWxXg7P+CNd3gEbBo8fbrgN7/2Hthei2vPZYuSgXBNdR/BxyiZia
	 KrlPMSPUEaXPnxiVNkULalRUi4TSARx5Y+OSvifz3lNPHSBadLDeIyMM2svfLW6OF8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TCHhOy28B+0gI7cRQUKEe32H0lL50i1G3WDk1ReHlIc=;
	b=GVNZsXzEW46IHYSZVYkxX/Fj7FXAPU5RouanyIPiQWmfiRBawhXu2+YYyJ5J9CQssNwr
	 M1WmnZhWcSTYT5DWIcxJoLjdctIfG4EyLiCIB4BHSSO1nKTdY36imxpIIF0cEyDuQSX3y
	 ceqhOep64zHI7PvxknOfpRu9S4IDxU+H2Bk7bQaZQhDX3F3af2qdgL7HdwWKsdXwpSGWT
	 j4Ms5PWQw0xDhu3jTbFqk/wMb1xfv5xpc0jTjbIzv7KvkC9m+5cBO6Kdm6ZS8MSttFByf
	 6sNJ8y0UeKs/JJ/hXyQpPbqrwObX/0d+1lT8Ks+flM5/b22yd2m0gPIpuIXoSAumBsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ppKaYaec;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF89606A8A4
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 06:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CF89606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ppKaYaec
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-491aaed7565so1018400f8f.2
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 22:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723085; x=1795327885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TCHhOy28B+0gI7cRQUKEe32H0lL50i1G3WDk1ReHlIc=;
        b=ppKaYaecUnUwNfedyST7zZsf86RJaPMvRVSELxnTMyR/I1MLubReMWsGZV0dUyKBXp
         kCo6CvtAr/ZYIlvGUTLv/9O2tDE7dc8LUEOE6UxOZ7hDKwBEyOJYRKd/9VQPVmbDgUDg
         cfVtckQBo5p9nsk/mQfbbx+3SsAqQmfARoTS9U047vJFuC8w18uFgjqw0tvmtFL65SYw
         HdeNy4cVbP3ol1AUIMkAGA8B5m29xKuleqLfNBQKbA6WGICAAeVYMqL8Ta6JFPSxe5jK
         eScBMCV3knABDT7mHr9MUAwLz+S8iqAG00xzGpjVixp/v8OdYJntV68IWDKaBSMnAbFW
         GjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723085; x=1795327885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TCHhOy28B+0gI7cRQUKEe32H0lL50i1G3WDk1ReHlIc=;
        b=1yYSj+q01Kksp9GZyEnEf4y5mrfqePgxS7VRPt39aY7dpESM3bhB6xOUy85AqwtYX4
         AF6iRTjHIrZKdhg2ypLkenHesUV1cZHLTiIjZD5DEt1C2C5z5x8TX7vRxS5l0BJumDf5
         O5RELleDUG5ug39DiarwO20sihq/kfkpimKnUggU4o2W3/3TDxOLNtINW/iWr/dodJrA
         G3eAnjbDZD7KjUcTbLNdu1VIS6xZyOYQvdwscB1Q3kOdBeljRyDXQuxbAI6zE6BoVFmP
         22VxWRsHThzy5rvAnIJr2h+VXj1oxswCNvDoG101F17I4QyqJ+puURo6C3RlO1eCiyqu
         Rg2Q==
X-Forwarded-Encrypted: i=1; AL+hErEM5hN742wF/jLazJ1EtCRNrH+OGMquo5q7Ffbnx2VHUsMVwv/IXxTlns5aVBE7PR+YTNjg6YGzC3m/@vger.kernel.org
X-Gm-Message-State: APuU4Z+YJMAS7P9RblCpo/p37rFGb4ans9H78G59xz9q4gQ/HXk+k46P
	4Axd+YLp/FJY7oBJUmbb4WDO2ivzexo3fYweZgwwVrILFrGnjun12yWc
X-Gm-Gg: AYBFou3W5lujqKnRi0HE4HSkmZ6KcuKSo+b3zbfgEBxzl6RqAH7apHw0lCASho2Dm94
	IL/Y2Fo1dVRP5YCihtDhKX8zchEZdByoGmjG2uE/eSNqr3EtH0AHh7jvkBhXSxb46TG4q+AWOeZ
	8Ti2Jzo33TrqrKHTwZGNE4rK4hUlAIu9LiU/0xEDmip7pBJFUC2gWoOEnJTlvvCT88qLwSMgFDM
	QhaabLveV1O6P7o8EFbOGVYXLL7AklDNEB8/c8/uH4XlMj9J6in7AY6zwJUtD+7vNjYOr7lsRPg
	raceRCIi34oidc9HFML2Ka4SGFfc2+z4m/5lnWAJ2vSC+fiUSZoK/e96QIXbQTN5F5e5ljzsZF7
	T0B2BTpNHE/Y75FO+xG3XZBtfbafYaub1AWR854+sBuhS5qZSlikpP6CGBAKqlhBk5gIAXeUxw3
	Qt90JH4GBeBwYXqQK1stqmOSze4WW3lcN8ncqqULx4/c0MisWYbM5hQ5wtVLxO3GH7jo86t6GF+
	HoOmjL8gNhMeSRz6jLxHplYuNlJoD8OHaPcIgr59qdE8HPczSoDQ9lIlmTKDgdLLxigmv9qzX0x
	elpfQv9gvk2OzrBWAV5LfrvKBEWLJSAUhPNzD7HGyazAbBFOkzVCAiyhHG3Sm3u0ZRRWaNs1AeS
	6Log9F1RkutZedaqRj2CLS2AkekXaAQJ6Sr4TbEFpW60FMBxEG4Gk4R4FoVnzMATaV9ZqnzpoPY
	uFawtLUWwXZm8zQ3+12pYZtXXDBLGcpX7ZVIk1Lpn+4GtWn7Bs73P7zktCrl+bUFdRavgBsMxgD
	FKCu/Yy+oA7Sg==
X-Received: by 2002:a05:600c:3b98:b0:4b7:6a8b:9df2 with SMTP id 5b1f17b1804b1-4bb55a8c128mr151718065e9.25.1794723084885;
        Sat, 14 Nov 2026 22:11:24 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:24 -0800 (PST)
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
Subject: [PATCH v3 3/8] drm/sun4i: Add support for DE33 CSC
Date: Sun, 15 Nov 2026 07:10:57 +0100
Message-ID: <20261115061102.229680-4-jernej.skrabec@gmail.com>
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

DE33 has channel CSC units (for each plane separately) so pipeline can
be configured to output in desired colorspace.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.c | 71 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun8i_csc.h |  5 +++
 2 files changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index ce81c12f511d..70fc9b017d17 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -205,6 +205,72 @@ static void sun8i_de3_ccsc_setup(struct regmap *map, int layer,
 			   mask, val);
 }
 
+/* extract constant from high word and invert sign if necessary */
+static u32 sun8i_de33_ccsc_get_constant(u32 value)
+{
+	value >>= 16;
+
+	if (value & BIT(15))
+		return 0x400 - (value & 0x3ff);
+
+	return value;
+}
+
+static void sun8i_de33_convert_table(const u32 *src, u32 *dst)
+{
+	dst[0] = sun8i_de33_ccsc_get_constant(src[3]);
+	dst[1] = sun8i_de33_ccsc_get_constant(src[7]);
+	dst[2] = sun8i_de33_ccsc_get_constant(src[11]);
+	memcpy(&dst[3], src, sizeof(u32) * 12);
+	dst[6] &= 0xffff;
+	dst[10] &= 0xffff;
+	dst[14] &= 0xffff;
+}
+
+static void sun8i_de33_ccsc_setup(struct regmap *map, int layer,
+				  enum sun8i_csc_mode mode,
+				  enum drm_color_encoding encoding,
+				  enum drm_color_range range)
+{
+	u32 addr, val, base, csc[15];
+	const u32 *table;
+	int i;
+
+	table = yuv2rgb_de3[range][encoding];
+	base = DE33_CCSC_BASE + layer * DE33_CH_SIZE;
+
+	switch (mode) {
+	case SUN8I_CSC_MODE_OFF:
+		val = 0;
+		break;
+	case SUN8I_CSC_MODE_YUV2RGB:
+		val = SUN8I_CSC_CTRL_EN;
+		sun8i_de33_convert_table(table, csc);
+		regmap_bulk_write(map, SUN50I_CSC_COEFF(base, 0), csc, 15);
+		break;
+	case SUN8I_CSC_MODE_YVU2RGB:
+		val = SUN8I_CSC_CTRL_EN;
+		sun8i_de33_convert_table(table, csc);
+		for (i = 0; i < 15; i++) {
+			addr = SUN50I_CSC_COEFF(base, i);
+			if (i > 3) {
+				if (((i - 3) & 3) == 1)
+					addr = SUN50I_CSC_COEFF(base, i + 1);
+				else if (((i - 3) & 3) == 2)
+					addr = SUN50I_CSC_COEFF(base, i - 1);
+			}
+			regmap_write(map, addr, csc[i]);
+		}
+		break;
+	default:
+		val = 0;
+		DRM_WARN("Wrong CSC mode specified.\n");
+		return;
+	}
+
+	regmap_write(map, SUN8I_CSC_CTRL(base), val);
+}
+
 static u32 sun8i_csc_get_mode(struct drm_plane_state *state)
 {
 	const struct drm_format_info *format;
@@ -238,6 +304,11 @@ void sun8i_csc_config(struct sun8i_layer *layer,
 				     mode, state->color_encoding,
 				     state->color_range);
 		return;
+	} else if (layer->cfg->de_type == SUN8I_MIXER_DE33) {
+		sun8i_de33_ccsc_setup(layer->regs, layer->channel,
+				      mode, state->color_encoding,
+				      state->color_range);
+		return;
 	}
 
 	base = ccsc_base[layer->cfg->ccsc][layer->channel];
diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
index 2a4b79599610..d2ba5f8611aa 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.h
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
@@ -18,9 +18,14 @@ struct sun8i_layer;
 #define CCSC10_OFFSET 0xA0000
 #define CCSC11_OFFSET 0xF0000
 
+#define DE33_CCSC_BASE 0x800
+
 #define SUN8I_CSC_CTRL(base)		((base) + 0x0)
 #define SUN8I_CSC_COEFF(base, i)	((base) + 0x10 + 4 * (i))
 
+#define SUN50I_CSC_COEFF(base, i)	((base) + 0x04 + 4 * (i))
+#define SUN50I_CSC_ALPHA(base)		((base) + 0x40)
+
 #define SUN8I_CSC_CTRL_EN		BIT(0)
 
 void sun8i_csc_config(struct sun8i_layer *layer,
-- 
2.43.0

