Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283532;
	b=XUDGzKU+iglRTMdXhEybCIUR+KyRGvIKyyiOE3AEnUj8lxbhYzuZQ1txiDLkNODJ9SCH
	 a/llssDWlhp/DFDHlN3TADhy743lDK+r8LP4p6Nue0eLYdgMRIFep/G5wKsvFEY+NxE11
	 9kptXYvnSxCF7IEp8x70IzsMNmXd/D2LIcL+i4jgepwoB0vvCZRowOqXZXoV/CScCwNkS
	 LfQFhz14un/TMi92e1oDbHnlLKYHOik8YHMZypDHiJC9WrOrNygNzFJ+cLEVtdnskFSWg
	 V8ER/zQdYGta5NeClSyi+wPsKr4WK6e32kPXU+jroUAU6YSt70rh/AxBTkMl5Fy+WCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ajMUqmJq5v1qiltV0uRwoZmJBJ8faJK2wIDhzU7JGaY=;
	b=UIDKhUp7BljvMxEZmmKU5NJDP+vIendEJZL7JrKTctpKIPn2dXrtsYshFLiLwtm/IIqR
	 hTSAEp+wKHSD9zEv5eMsILsmtKosQH+gmq/HpsesDFJmcDuwLvSere3fyRhzn61glZfIr
	 hDJ5MyxUZI7EJGUBeO1GXDNcMrp1MnckPjtCpCzViQvEmAnHZViTuHn7UeRe+V2NoSXsj
	 hyP/OHVozLifcmYObpV1EvDIfcmNyNWYIx+pyZjYAv4Kl/uSQ+A8sGAelT7tHDpFgngXL
	 p5roOY/FeJggr4zAzj+kkVIf+LiqXJ2u7DaeG8b4c9aQ+YoDH8VYjhmXKMesbfRU04A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=U00Sp+dX;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD1760A6F7A
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AD1760A6F7A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=U00Sp+dX
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso20168215e9.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 07:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283530; x=1793888330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ajMUqmJq5v1qiltV0uRwoZmJBJ8faJK2wIDhzU7JGaY=;
        b=U00Sp+dXB6rba4I/haxk6yFl667aA/WjbFL4ohOMDVu6EjuS/p2iPw5libGrCJ5BvG
         YPlEOFEzOzpBz9sxGxJud1xqbQnpV/cQINdWu3yodojETbaVO6UJn2V/MBQZyPZhNHQX
         mdxEbpv9JDDUiQ82yoyWxTnGDeIKXIxxeXTd+MuyvjTgYAwGKJ0QBz8UlmwyVQO3xvYI
         TG4xxtf949YqcnMdNHwZf4T9Jj+tSOem6ok45HSQigC0PEfrHkGFaUVGWi0Eh0YgQAiZ
         1rGpXAEqRSKgFk6ww9DOXoskRPOIN4d0ApkGdGj30KMWtgnmkgWEac7zQWpJ+ngdNQO3
         xwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283530; x=1793888330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ajMUqmJq5v1qiltV0uRwoZmJBJ8faJK2wIDhzU7JGaY=;
        b=Ye8n8nfWteC+Pl4JEBisywIc2tDV4sxFsFmrGDzNrbFtFIpkTaeIBN8f/DggaPBubQ
         PKauDxFUMRxYbjaxTkfQ4HRwqcLitOgwX32neSKq106WuW7eOYP4ewk2I87jMlb6dXoA
         3brHEM06zASD1bVMtJmObXIldeNNeefw/xocKYWWKJt5i1CFvvCYUtSHQ8lwfwBZFyk1
         +hpkDYYrUvQdmjOAqcCFTH3mdRsxMKaVkltO2ccXdjvYa2F7af7c5sRzL3sKxN9reiv3
         jmxzRqvsI3bDMXmIyQs+vNNBhrlhooluIxJ3wHluN+Hk/+1YYMUPnMyzlflhumP75iBQ
         AGiQ==
X-Forwarded-Encrypted: i=1; AKwUvByRoiD0sMFWbhcdEuKJPKKswMieLks+/tT7oQusx6AHhG2kiryOH8+kgurYxPwlNM0IQ8hHEf0BDOmL@vger.kernel.org
X-Gm-Message-State: AFq9FYLaOmSvaAA++7gqIEeegj4k7ppT+qDII1TGicsCTvub6OUG/eTK
	1BotM5xScpVNWbHlzhL/Tou7NSpcZ3njRfCd9KUDZjEqg1D+KaJWC7/IoMAaZ0N4i4k=
X-Gm-Gg: AYBFou2382GtBHIhK7wddJlfvy2wvZMNFrJXyNFqxceVH8OBYJtyBPp9W8/bua64pon
	sRuX+rYJ/IIy9tVC0FQpf7XRxmh0bNzJykMInAtkovqFaXuUEwZtFrNqeutyKNpFLApET2JjZO0
	4ELkrTlPcDU8OsR3SijB+4fCib6VFPKAGP6nQ7G1lE7NDBIwlxD+/Wb4eDw2zxWO7OmdW3iwL4I
	BSRg38cqZAZacbQgblTMlGgeE8iExna+2aObFvfB8SBfhk0Bb//VHtgK36crkRdGtpTb+UCHweP
	YZcXTp4sD9PjqAiDubqBaGCQ8GkguO+3gfpypt3Om5xRzMZah31cl1jaFNNK1leId3f4Dfla/7n
	T6vHcgCZNzWYari3IbPp1rsyKVgj+dmU5llsaqe+/VhFPA29yYchdXWln4ldOzU+UcDEzuetR+D
	z3+Nu8Y5kiP6L/ZwBhWbicKT+0h5Y2R/QMdsMNBoVZqYaifGJDIcGSgS9dbL1JupIG/4JTXXBTb
	xRQi11isiJNYeSqvntXP2OKjjQJdGocN6udGc1IdJ+/tif3dOHQ37BCVoCZpnbEGMnSFpJvRhjJ
	LDYsaGdZD4vVzSBHLmarDBFL3r4nIWRfMXwGyxlxGjAZNv7j6ygUFuAeKWi9zREhfp3th51qki2
	DDyb+
X-Received: by 2002:a05:600c:3b11:b0:4a1:dade:f049 with SMTP id 5b1f17b1804b1-4a966c41007mr129434185e9.15.1793283529927;
        Thu, 29 Oct 2026 07:18:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:49 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:33 +0000
Subject: [PATCH v7 12/18] media: sony-starvis2: Add support for IMX675
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-media-starvis2-v7-12-b33a1332fdfc@raspberrypi.com>
References: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
In-Reply-To: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

The IMX675 is a 5MPix Starvis2 sensor that follows the same
programming pattern as IMX678 and IMX662, so add it into the
driver.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 212 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 212 insertions(+)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 2db9ac28308a..a4815a142c9d 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -10,6 +10,8 @@
  *         pixels.
  * IMX662: Diagonal 6.45mm (Type 1/2.8) CMOS image sensor with 2.12 M effective
  *         pixels.
+ * IMX675: Diagonal 6.53mm (Type 1/2.8) CMOS image sensor with 5.12 M effective
+ *         pixels.
  *
  * Copyright (C) 2026 Ideas On Board Oy.
  * Copyright (C) 2026 Raspberry Pi
@@ -795,6 +797,193 @@ static const struct starvis2_variant imx662_variant_def = {
 	.hmax_min_pixel_array = 990,
 };
 
+static const struct cci_reg_sequence imx675_common_regs[] = {
+	{ STARVIS2_REG_THIN_V_EN, 0x00 },
+	{ STARVIS2_REG_VCMODE, 0x01 },
+
+	{ CCI_REG8(0x3081), 0x00 },
+	{ STARVIS2_REG_XXS_OUTSEL, 0xaa },
+	{ STARVIS2_REG_XXS_DRV, 0x0f },
+	{ CCI_REG8(0x30cc), 0x00 },
+	{ CCI_REG8(0x30cd), 0x00 },
+	{ CCI_REG8(0x30ce), 0x02 },
+	{ CCI_REG8(0x3400), 0x01 },
+
+	{ CCI_REG8(0x3460), 0x22 },
+	{ CCI_REG8(0x347b), 0x02 },
+	{ CCI_REG8(0x3492), 0x08 },
+	{ CCI_REG8(0x3b1d), 0x17 },
+	{ CCI_REG8(0x3b44), 0x3f },
+	{ CCI_REG8(0x3b60), 0x03 },
+	{ CCI_REG8(0x3c03), 0x04 },
+	{ CCI_REG8(0x3c04), 0x04 },
+	{ CCI_REG8(0x3c0a), 0x1f },
+	{ CCI_REG8(0x3c0b), 0x1f },
+	{ CCI_REG8(0x3c0c), 0x1f },
+	{ CCI_REG8(0x3c0d), 0x1f },
+	{ CCI_REG8(0x3c0e), 0x1f },
+	{ CCI_REG8(0x3c0f), 0x1f },
+	{ CCI_REG8(0x3c30), 0x73 },
+	{ CCI_REG8(0x3c3c), 0x20 },
+	{ CCI_REG8(0x3c44), 0x06 },
+	{ CCI_REG8(0x3c7c), 0xb9 },
+	{ CCI_REG8(0x3c7d), 0x01 },
+	{ CCI_REG8(0x3c7e), 0xb7 },
+	{ CCI_REG8(0x3c7f), 0x01 },
+	{ CCI_REG8(0x3cb0), 0x00 },
+	{ CCI_REG8(0x3cb2), 0xff },
+	{ CCI_REG8(0x3cb3), 0x03 },
+	{ CCI_REG8(0x3cb4), 0xff },
+	{ CCI_REG8(0x3cb5), 0x03 },
+	{ CCI_REG8(0x3cba), 0xff },
+	{ CCI_REG8(0x3cbb), 0x03 },
+	{ CCI_REG8(0x3cc0), 0xff },
+	{ CCI_REG8(0x3cc1), 0x03 },
+	{ CCI_REG8(0x3cc2), 0x00 },
+	{ CCI_REG8(0x3cc6), 0xff },
+	{ CCI_REG8(0x3cc7), 0x03 },
+	{ CCI_REG8(0x3cc8), 0xff },
+	{ CCI_REG8(0x3cc9), 0x03 },
+	{ CCI_REG8(0x3e00), 0x1e },
+	{ CCI_REG8(0x3e02), 0x04 },
+	{ CCI_REG8(0x3e03), 0x00 },
+	{ CCI_REG8(0x3e20), 0x04 },
+	{ CCI_REG8(0x3e21), 0x00 },
+	{ CCI_REG8(0x3e22), 0x1e },
+	{ CCI_REG8(0x3e24), 0xba },
+	{ CCI_REG8(0x3e72), 0x85 },
+	{ CCI_REG8(0x3e76), 0x0c },
+	{ CCI_REG8(0x3e77), 0x01 },
+	{ CCI_REG8(0x3e7a), 0x85 },
+	{ CCI_REG8(0x3e7e), 0x1f },
+	{ CCI_REG8(0x3e82), 0xa6 },
+	{ CCI_REG8(0x3e86), 0x2d },
+	{ CCI_REG8(0x3ee2), 0x33 },
+	{ CCI_REG8(0x3ee3), 0x03 },
+	{ CCI_REG8(0x4490), 0x07 },
+	{ CCI_REG8(0x4494), 0x19 },
+	{ CCI_REG8(0x4495), 0x00 },
+	{ CCI_REG8(0x4496), 0xbb },
+	{ CCI_REG8(0x4497), 0x00 },
+	{ CCI_REG8(0x4498), 0x55 },
+	{ CCI_REG8(0x449a), 0x50 },
+	{ CCI_REG8(0x449c), 0x50 },
+	{ CCI_REG8(0x449e), 0x50 },
+	{ CCI_REG8(0x44a0), 0x3c },
+	{ CCI_REG8(0x44a2), 0x19 },
+	{ CCI_REG8(0x44a4), 0x19 },
+	{ CCI_REG8(0x44a6), 0x19 },
+	{ CCI_REG8(0x44a8), 0x4b },
+	{ CCI_REG8(0x44aa), 0x4b },
+	{ CCI_REG8(0x44ac), 0x4b },
+	{ CCI_REG8(0x44ae), 0x4b },
+	{ CCI_REG8(0x44b0), 0x3c },
+	{ CCI_REG8(0x44b2), 0x19 },
+	{ CCI_REG8(0x44b4), 0x19 },
+	{ CCI_REG8(0x44b6), 0x19 },
+	{ CCI_REG8(0x44b8), 0x4b },
+	{ CCI_REG8(0x44ba), 0x4b },
+	{ CCI_REG8(0x44bc), 0x4b },
+	{ CCI_REG8(0x44be), 0x4b },
+	{ CCI_REG8(0x44c0), 0x3c },
+	{ CCI_REG8(0x44c2), 0x19 },
+	{ CCI_REG8(0x44c4), 0x19 },
+	{ CCI_REG8(0x44c6), 0x19 },
+	{ CCI_REG8(0x44c8), 0xf0 },
+	{ CCI_REG8(0x44ca), 0xeb },
+	{ CCI_REG8(0x44cc), 0xeb },
+	{ CCI_REG8(0x44ce), 0xe6 },
+	{ CCI_REG8(0x44d0), 0xe6 },
+	{ CCI_REG8(0x44d2), 0xbb },
+	{ CCI_REG8(0x44d4), 0xbb },
+	{ CCI_REG8(0x44d6), 0xbb },
+	{ CCI_REG8(0x44d8), 0xe6 },
+	{ CCI_REG8(0x44da), 0xe6 },
+	{ CCI_REG8(0x44dc), 0xe6 },
+	{ CCI_REG8(0x44de), 0xe6 },
+	{ CCI_REG8(0x44e0), 0xe6 },
+	{ CCI_REG8(0x44e2), 0xbb },
+	{ CCI_REG8(0x44e4), 0xbb },
+	{ CCI_REG8(0x44e6), 0xbb },
+	{ CCI_REG8(0x44e8), 0xe6 },
+	{ CCI_REG8(0x44ea), 0xe6 },
+	{ CCI_REG8(0x44ec), 0xe6 },
+	{ CCI_REG8(0x44ee), 0xe6 },
+	{ CCI_REG8(0x44f0), 0xe6 },
+	{ CCI_REG8(0x44f2), 0xbb },
+	{ CCI_REG8(0x44f4), 0xbb },
+	{ CCI_REG8(0x44f6), 0xbb },
+	{ CCI_REG8(0x4538), 0x15 },
+	{ CCI_REG8(0x4539), 0x15 },
+	{ CCI_REG8(0x453a), 0x15 },
+	{ CCI_REG8(0x4544), 0x15 },
+	{ CCI_REG8(0x4545), 0x15 },
+	{ CCI_REG8(0x4546), 0x15 },
+	{ CCI_REG8(0x4550), 0x10 },
+	{ CCI_REG8(0x4551), 0x10 },
+	{ CCI_REG8(0x4552), 0x10 },
+	{ CCI_REG8(0x4553), 0x10 },
+	{ CCI_REG8(0x4554), 0x10 },
+	{ CCI_REG8(0x4555), 0x10 },
+	{ CCI_REG8(0x4556), 0x10 },
+	{ CCI_REG8(0x4557), 0x10 },
+	{ CCI_REG8(0x4558), 0x10 },
+	{ CCI_REG8(0x455c), 0x10 },
+	{ CCI_REG8(0x455d), 0x10 },
+	{ CCI_REG8(0x455e), 0x10 },
+	{ CCI_REG8(0x455f), 0x10 },
+	{ CCI_REG8(0x4560), 0x10 },
+	{ CCI_REG8(0x4561), 0x10 },
+	{ CCI_REG8(0x4562), 0x10 },
+	{ CCI_REG8(0x4563), 0x10 },
+	{ CCI_REG8(0x4564), 0x10 },
+	{ CCI_REG8(0x4569), 0x01 },
+	{ CCI_REG8(0x456a), 0x01 },
+	{ CCI_REG8(0x456b), 0x06 },
+	{ CCI_REG8(0x456c), 0x06 },
+	{ CCI_REG8(0x456d), 0x06 },
+	{ CCI_REG8(0x456e), 0x06 },
+	{ CCI_REG8(0x456f), 0x06 },
+	{ CCI_REG8(0x4570), 0x06 },
+};
+
+static const u16 imx675_min_hmax_2lane[] = {
+	[STARVIS2_LINK_FREQ_297MHZ] = 2044,
+	[STARVIS2_LINK_FREQ_360MHZ] = 1692,
+	[STARVIS2_LINK_FREQ_445MHZ] = 1376,
+	[STARVIS2_LINK_FREQ_594MHZ] = 1064,
+	[STARVIS2_LINK_FREQ_720MHZ] = 840,
+	[STARVIS2_LINK_FREQ_891MHZ] = 684,
+	[STARVIS2_LINK_FREQ_1039MHZ] = 592,
+	[STARVIS2_LINK_FREQ_1188MHZ] = 528,
+};
+
+static const struct starvis2_variant imx675_variant_def = {
+	.name = "imx675",
+	.id_reg = CCI_REG16_LE(0x4d12),
+	.id_mask = 0xfff,
+	.id_value = 0x576,
+	.native_area = {
+		.top = 0,
+		.left = 0,
+		.width = 2609,
+		.height = 1984,
+	},
+	.active_area = {
+		.top = 0,
+		.left = 0,
+		.width = 2608,
+		.height = 1984,
+	},
+	.pixel_rate = 594000000,
+	.pix_per_clk = 8,
+	.common_regs = imx675_common_regs,
+	.num_common_regs = ARRAY_SIZE(imx675_common_regs),
+	.vmax_default = 2024,
+	.hmax_min_link_freq = imx675_min_hmax_2lane,
+	.hmax_min_pixel_array = 528,
+};
+
 struct starvis2_model_info {
 	enum starvis2_type type;
 	const u32 *codes;
@@ -845,6 +1034,26 @@ static const struct starvis2_model_info imx662_autodetect_info = {
 	.auto_detect_mono = &imx662_aamr_info,
 };
 
+static const struct starvis2_model_info imx675_aaqr_info = {
+	.type = STARVIS2_COLOR,
+	.codes = codes_bayer,
+	.num_codes = ARRAY_SIZE(codes_bayer),
+	.variant = &imx675_variant_def,
+};
+
+static const struct starvis2_model_info imx675_aamr_info = {
+	.type = STARVIS2_MONOCHROME,
+	.codes = codes_monochrome,
+	.num_codes = ARRAY_SIZE(codes_monochrome),
+	.variant = &imx675_variant_def,
+};
+
+static const struct starvis2_model_info imx675_autodetect_info = {
+	.variant = &imx675_variant_def,
+	.auto_detect_colour = &imx675_aaqr_info,
+	.auto_detect_mono = &imx675_aamr_info,
+};
+
 static const char * const starvis2_supply_name[] = {
 	"avdd",  /* Analog (3.3V) supply */
 	"dvdd",  /* Digital Core (1.1V) supply */
@@ -1682,10 +1891,13 @@ static const struct dev_pm_ops starvis2_pm_ops = {
 static const struct of_device_id starvis2_of_match[] = {
 	{ .compatible = "sony,imx662-aamr", .data = &imx662_aamr_info },
 	{ .compatible = "sony,imx662-aaqr", .data = &imx662_aaqr_info },
+	{ .compatible = "sony,imx675-aamr", .data = &imx675_aamr_info },
+	{ .compatible = "sony,imx675-aaqr", .data = &imx675_aaqr_info },
 	{ .compatible = "sony,imx678-aamr", .data = &imx678_aamr_info },
 	{ .compatible = "sony,imx678-aaqr", .data = &imx678_aaqr_info },
 	/* for non-conforming DTs that rely on runtime check */
 	{ .compatible = "sony,imx662", .data = &imx662_autodetect_info },
+	{ .compatible = "sony,imx675", .data = &imx675_autodetect_info },
 	{ .compatible = "sony,imx678", .data = &imx678_autodetect_info },
 	{ /* sentinel */ }
 };

-- 
2.34.1

