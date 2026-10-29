Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283537;
	b=3uiBQy0SeHDua5JaTr13osevvmWzP0Da5pMy1E8ynHqyuIgNQvmmZ2khoiooWI5MI9Se
	 b0+Vh7wl8TZcffPcVLpFZt5JIetg1kWC+NOMEO/YNdbb9ahWV2xX+6PyDEKTcug8vzeYv
	 F1kgyqTI+mRZND6T78ntBfPQG4VttA0CUfuMXAOoNn+CrqW+CXPbHp2IGwGxK1Fu6DxpM
	 DH2nab/qmIcMGqHCLEFIEF2D1+lvmU29zIBDKuVRr1cPfOIcsfXAo+7wNPPjcROFaQpGN
	 6wRQ982SDbog+bT371NhI+SFLkZ06IQWzKySgmDRckOwgWwjJ7HKqzBv9m/NDQ8UC0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=AOVaQPkVo6/j38OO1bxDSb/ojTMxBSrDABnO3LWwmIA=;
	b=rKxnvS0qPPslk+pTjZwrUES/OY1dhnnR9ynjRiUPy3NtrZmE8OIJgZl9Rsk+u3xgofSO
	 VJ42yxqVjuAXBFvLxLEwLtGVIUklr6N9eg0bQT+MYcfRwjY4zIndxwBD2l9TXJRJS34E2
	 7nSBXWcu6RHyoOhG6FGwgNlUFNgoNfUNX2K35dgCWKf3fGtmtlcQeIQi884Hjuseron38
	 05tPYvLd6sISfSVKvuM3Tgv2G40RpZJR4wr/gCH8fZ4GX9Pa7D4FzLHs+jCEEOsgLLotY
	 ef1mw5lU5BAVxiQzllQi32IrowM9SU3Nz/vLicoaDk6d4A4y57DXCprMU8CPsp8f97g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=FWdz0nYu;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BF9606C450
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6BF9606C450
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=FWdz0nYu
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so17279815e9.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 07:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283535; x=1793888335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOVaQPkVo6/j38OO1bxDSb/ojTMxBSrDABnO3LWwmIA=;
        b=FWdz0nYuSYAlNRclQpi0w9s4vHMcawD/YSU/OOb9SjbPH/hcl6kHd782UUjDtiqpTk
         wZI4hbnj8hEg0WkTXzpwt+zlydSGZe9LV7xPCFMfkhXefygtIJf25wz01iX7h308arxl
         lV2IwPd9mUbTCPnt57XR20/x9f7H3BSb+zUK3Sd3p1E5Ga9pwqqpfRYN7Ljt/eLTV3jn
         0bW7btyFdPQF+9Hfw75z+wQ2SfSIja6zpbe5dMIOQ6oWrONkxqBTHUQttpo3jYjLcWxJ
         AfG+5xmIlgA2wzlPjHPFZ6/NGfMUNWi9AodQDcASZEuVxqMYVA4OjVYnCkgaLgqPcdrX
         dDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283535; x=1793888335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOVaQPkVo6/j38OO1bxDSb/ojTMxBSrDABnO3LWwmIA=;
        b=mxpRgb438Vdy4JhH+MYecyw1Hp+K7gF9+jKxbyG/RY/8zQO3EgMQSFGAVC2LGvP1rY
         +DjKsZse5/eAURJFV9YLQ1RdUwzzqT0niJEHSl/wys12DSVfYjGGJGxkNAZAtY3SB3RL
         sPmA5o2bNcRwNvm6Cv0WL5v4f3WgHW6A6K4h/JzIikeCElINwjWsPahYsYidZXu1wgAY
         vCGBoB0AVS/fn5nNVN24Rh0ybwABmf6zhv/yYaoN3caE27OgOMzGWIuMh3m/j4dZDMQx
         24aK6YZDdKFjtYpFhftVX8To9VZTLSe/gGix85M7qzV6XhfmR1YNosmq8Tg3C053M2Hc
         BOsw==
X-Forwarded-Encrypted: i=1; AKwUvBxUdJ0zc5cvE+j74trjIJUDqGHsT2VhSet4APRUVaE0a7fz5ICatYrbIE5Qj7tO1yW/NIdX2mqCpGW/@vger.kernel.org
X-Gm-Message-State: AFq9FYLe8iLn/u9ueqxeO+SKLl36hRcSc12ogHVS2oNek7+evnHZ0/do
	HxfitjVUfbqwls/YKxIFq0lZIHU7wXyZ8cNJZ1iEvLsFDdHSyDDkkdGHlEtoLlXtaBSJymysYwO
	FIlucsko=
X-Gm-Gg: AYBFou386f7wmMQExSw1MdCle/Oym68KYIdHPTjSOH2C/Z3OIxFR8G+mRnCE3ubEgcV
	Ld44GTERJG7OVv9IhROtE3YNIECFSKuYO6f6469i8woTFtnk2FCiROOZFJs6VZYYn44n9D39Y/S
	f4bOTs11hvEYLtVXLIJHEH1QCQdZhkhyVFmmNLFWWMUSueypwpsMi2XsGkBkvdu6GXZlA1RacJV
	AcdZBgVd5Q5eReygdB2LIsE/1NTIpd/9mCFnE2i3zC76oVLhXPJS6obpsBPfM/591acOmdkI01W
	9UJMqVLKh2UkrgUyb7MIwMMkzMCGuh9cqqf2fSrI5fB2iXSbJ92MLiGCAkK5zt9RLS0o5ihf0nW
	sQvPUC2TqFGoWER2PvOvwOtfupIAfVikW/Tt5pb+dvXEYonTjaWijyhSynMjeW1NRmCIzirppap
	GSvpSd+YUs7IUiBuDJHEjcpTeAai1KU3nCTJPJb11ES3YMAHvdB+Ug80o4CUyjvC8z0DEm/Axxw
	5KK7vvgDSkQCi5Pj4l0VFbed8FTiYaz+Tlj57SJEZ12T0P78lTGVUJTZWwwXh9U2UtmYPy/iKid
	s3ppdlTCi5/D4S9bOvfw+ZYUO9RLJrFbJ5G00sx6/gKCgDhQ74XBRv3g5J6CQl3PkyuT2sj9u1/
	fhe6T
X-Received: by 2002:a05:600d:8496:20b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4a96677324cmr88082325e9.16.1793283535103;
        Thu, 29 Oct 2026 07:18:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:54 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:39 +0000
Subject: [PATCH v7 18/18] media: sony-starvis2: Add support for IMX676
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
Message-Id: <20261029-media-starvis2-v7-18-b33a1332fdfc@raspberrypi.com>
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

From: Jai Luthra <jai.luthra@ideasonboard.com>

The IMX676 is a 12.63MPix Starvis 2 sensor, so add support for it.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 198 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 198 insertions(+)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 5c407211edc8..ec74b00b0f4e 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -16,6 +16,8 @@
  *         pixels.
  * IMX585: Diagonal 12.84 mm (Type 1/1.2) CMOS image sensor with 8.40 M effective
  *         pixels.
+ * IMX676: Diagonal 10.04 mm (Type 1/1.6) CMOS image sensor with 12.63 M effective
+ *         pixels.
  *
  * Copyright (C) 2026 Ideas On Board Oy.
  * Copyright (C) 2026 Raspberry Pi
@@ -1380,6 +1382,179 @@ static const struct starvis2_variant imx585_variant_def = {
 	.shr_min = 8,
 };
 
+static const struct cci_reg_sequence imx676_common_regs[] = {
+	{ CCI_REG8(0x304e), 0x04 },
+	{ CCI_REG8(0x3148), 0x00 },
+	{ CCI_REG8(0x3460), 0x22 },
+	{ CCI_REG8(0x347b), 0x02 },
+	{ CCI_REG8(0x355a), 0x1c },
+	{ CCI_REG8(0x3a3c), 0x0f },
+	{ CCI_REG8(0x3a44), 0x0b },
+	{ CCI_REG8(0x3a76), 0xb5 },
+	{ CCI_REG8(0x3a77), 0x00 },
+	{ CCI_REG8(0x3a78), 0x03 },
+	{ CCI_REG8(0x3b22), 0x04 },
+	{ CCI_REG8(0x3b23), 0x44 },
+	{ CCI_REG8(0x3c03), 0x04 },
+	{ CCI_REG8(0x3c04), 0x04 },
+	{ CCI_REG8(0x3c0a), 0x03 },
+	{ CCI_REG8(0x3c0b), 0x03 },
+	{ CCI_REG8(0x3c0c), 0x03 },
+	{ CCI_REG8(0x3c0d), 0x03 },
+	{ CCI_REG8(0x3c0e), 0x03 },
+	{ CCI_REG8(0x3c0f), 0x03 },
+	{ CCI_REG8(0x3c30), 0x73 },
+	{ CCI_REG8(0x3c34), 0x6c },
+	{ CCI_REG8(0x3c3c), 0x20 },
+	{ CCI_REG8(0x3cb8), 0x00 },
+	{ CCI_REG8(0x3cba), 0xff },
+	{ CCI_REG8(0x3cbb), 0x03 },
+	{ CCI_REG8(0x3cbc), 0xff },
+	{ CCI_REG8(0x3cbd), 0x03 },
+	{ CCI_REG8(0x3cc2), 0xff },
+	{ CCI_REG8(0x3cc3), 0x03 },
+	{ CCI_REG8(0x3cc8), 0xff },
+	{ CCI_REG8(0x3cc9), 0x03 },
+	{ CCI_REG8(0x3cca), 0x00 },
+	{ CCI_REG8(0x3cce), 0xff },
+	{ CCI_REG8(0x3ccf), 0x03 },
+	{ CCI_REG8(0x3cd0), 0xff },
+	{ CCI_REG8(0x3cd1), 0x03 },
+	{ CCI_REG8(0x3e00), 0x1e },
+	{ CCI_REG8(0x3e02), 0x04 },
+	{ CCI_REG8(0x3e03), 0x00 },
+	{ CCI_REG8(0x3e20), 0x04 },
+	{ CCI_REG8(0x3e21), 0x00 },
+	{ CCI_REG8(0x3e22), 0x1e },
+	{ CCI_REG8(0x3e24), 0xb6 },
+	{ CCI_REG8(0x4490), 0x07 },
+	{ CCI_REG8(0x4494), 0x10 },
+	{ CCI_REG8(0x4495), 0x00 },
+	{ CCI_REG8(0x4496), 0xb2 },
+	{ CCI_REG8(0x4497), 0x00 },
+	{ CCI_REG8(0x4498), 0x4c },
+	{ CCI_REG8(0x449a), 0x4b },
+	{ CCI_REG8(0x449c), 0x4b },
+	{ CCI_REG8(0x449e), 0x49 },
+	{ CCI_REG8(0x44a0), 0x33 },
+	{ CCI_REG8(0x44a2), 0x10 },
+	{ CCI_REG8(0x44a4), 0x10 },
+	{ CCI_REG8(0x44a6), 0x10 },
+	{ CCI_REG8(0x44a8), 0x4b },
+	{ CCI_REG8(0x44aa), 0x4b },
+	{ CCI_REG8(0x44ac), 0x4b },
+	{ CCI_REG8(0x44ae), 0x46 },
+	{ CCI_REG8(0x44b0), 0x33 },
+	{ CCI_REG8(0x44b2), 0x10 },
+	{ CCI_REG8(0x44b4), 0x10 },
+	{ CCI_REG8(0x44b6), 0x10 },
+	{ CCI_REG8(0x44b8), 0x42 },
+	{ CCI_REG8(0x44ba), 0x42 },
+	{ CCI_REG8(0x44bc), 0x42 },
+	{ CCI_REG8(0x44be), 0x42 },
+	{ CCI_REG8(0x44c0), 0x33 },
+	{ CCI_REG8(0x44c2), 0x10 },
+	{ CCI_REG8(0x44c4), 0x10 },
+	{ CCI_REG8(0x44c6), 0x10 },
+	{ CCI_REG8(0x44c8), 0xe7 },
+	{ CCI_REG8(0x44ca), 0xe2 },
+	{ CCI_REG8(0x44cc), 0xe2 },
+	{ CCI_REG8(0x44ce), 0xdd },
+	{ CCI_REG8(0x44d0), 0xdd },
+	{ CCI_REG8(0x44d2), 0xb2 },
+	{ CCI_REG8(0x44d4), 0xb2 },
+	{ CCI_REG8(0x44d6), 0xb2 },
+	{ CCI_REG8(0x44d8), 0xe1 },
+	{ CCI_REG8(0x44da), 0xe1 },
+	{ CCI_REG8(0x44dc), 0xe1 },
+	{ CCI_REG8(0x44de), 0xdd },
+	{ CCI_REG8(0x44e0), 0xdd },
+	{ CCI_REG8(0x44e2), 0xb2 },
+	{ CCI_REG8(0x44e4), 0xb2 },
+	{ CCI_REG8(0x44e6), 0xb2 },
+	{ CCI_REG8(0x44e8), 0xdd },
+	{ CCI_REG8(0x44ea), 0xdd },
+	{ CCI_REG8(0x44ec), 0xdd },
+	{ CCI_REG8(0x44ee), 0xdd },
+	{ CCI_REG8(0x44f0), 0xdd },
+	{ CCI_REG8(0x44f2), 0xb2 },
+	{ CCI_REG8(0x44f4), 0xb2 },
+	{ CCI_REG8(0x44f6), 0xb2 },
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
+	{ CCI_REG8(0x4604), 0x04 },
+	{ CCI_REG8(0x4608), 0x22 },
+	{ CCI_REG8(0x479c), 0x04 },
+	{ CCI_REG8(0x47a0), 0x22 },
+	{ STARVIS2_REG_WDMODE, 0x00 },
+	{ STARVIS2_REG_MDBIT, 0x01 },
+	{ STARVIS2_REG_XXS_DRV, 0x00 },
+};
+
+static const u16 imx676_min_hmax_2lane[] = {
+	[STARVIS2_LINK_FREQ_297MHZ] = 2744,
+	[STARVIS2_LINK_FREQ_360MHZ] = 2277,
+	[STARVIS2_LINK_FREQ_445MHZ] = 1854,
+	[STARVIS2_LINK_FREQ_594MHZ] = 1410,
+	[STARVIS2_LINK_FREQ_720MHZ] = 1176,
+	[STARVIS2_LINK_FREQ_891MHZ] = 965,
+	[STARVIS2_LINK_FREQ_1039MHZ] = 838,
+	[STARVIS2_LINK_FREQ_1188MHZ] = 743,
+};
+
+static const struct starvis2_variant imx676_variant_def = {
+	.name = "imx676",
+	.id_reg = CCI_REG16_LE(0x4d12),
+	.id_mask = 0xfff,
+	.id_value = 0x676,
+	.interface_sel_reg = CCI_REG8(0x4e3c),
+	.mono_id_reg = CCI_REG8(0x4d18),
+	.native_area = {
+		.top = 0,
+		.left = 0,
+		.width = 3553,
+		.height = 3577,
+	},
+	.active_area = {
+		.top = 24,
+		.left = 0,
+		.width = 3552,
+		.height = 3552,
+	},
+	.pixel_rate = 594000000,
+	.pix_per_clk = 8,
+	.common_regs = imx676_common_regs,
+	.num_common_regs = ARRAY_SIZE(imx676_common_regs),
+	.vmax_default = 3940,
+	.hmax_min_link_freq = imx676_min_hmax_2lane,
+	.hmax_min_pixel_array = 454,
+	.exposure_min = 2,
+	.exposure_step = 2,
+	.shr_min = 8,
+};
+
 struct starvis2_model_info {
 	enum starvis2_type type;
 	const u32 *codes;
@@ -1490,6 +1665,26 @@ static const struct starvis2_model_info imx585_autodetect_info = {
 	.auto_detect_mono = &imx585_aamj_info,
 };
 
+static const struct starvis2_model_info imx676_aacr_info = {
+	.type = STARVIS2_COLOR,
+	.codes = codes_bayer,
+	.num_codes = ARRAY_SIZE(codes_bayer),
+	.variant = &imx676_variant_def,
+};
+
+static const struct starvis2_model_info imx676_aamr_info = {
+	.type = STARVIS2_MONOCHROME,
+	.codes = codes_monochrome,
+	.num_codes = ARRAY_SIZE(codes_monochrome),
+	.variant = &imx676_variant_def,
+};
+
+static const struct starvis2_model_info imx676_autodetect_info = {
+	.variant = &imx676_variant_def,
+	.auto_detect_colour = &imx676_aacr_info,
+	.auto_detect_mono = &imx676_aamr_info,
+};
+
 static const char * const starvis2_supply_name[] = {
 	"avdd",  /* Analog (3.3V) supply */
 	"dvdd",  /* Digital Core (1.1V) supply */
@@ -2335,6 +2530,8 @@ static const struct of_device_id starvis2_of_match[] = {
 	{ .compatible = "sony,imx662-aaqr", .data = &imx662_aaqr_info },
 	{ .compatible = "sony,imx675-aamr", .data = &imx675_aamr_info },
 	{ .compatible = "sony,imx675-aaqr", .data = &imx675_aaqr_info },
+	{ .compatible = "sony,imx676-aamr", .data = &imx676_aamr_info },
+	{ .compatible = "sony,imx676-aacr", .data = &imx676_aacr_info },
 	{ .compatible = "sony,imx678-aamr", .data = &imx678_aamr_info },
 	{ .compatible = "sony,imx678-aaqr", .data = &imx678_aaqr_info },
 	{ .compatible = "sony,imx832-amr", .data = &imx832_amr_info },
@@ -2343,6 +2540,7 @@ static const struct of_device_id starvis2_of_match[] = {
 	{ .compatible = "sony,imx585", .data = &imx585_autodetect_info },
 	{ .compatible = "sony,imx662", .data = &imx662_autodetect_info },
 	{ .compatible = "sony,imx675", .data = &imx675_autodetect_info },
+	{ .compatible = "sony,imx676", .data = &imx676_autodetect_info },
 	{ .compatible = "sony,imx678", .data = &imx678_autodetect_info },
 	{ .compatible = "sony,imx832", .data = &imx832_autodetect_info },
 	{ /* sentinel */ }

-- 
2.34.1

