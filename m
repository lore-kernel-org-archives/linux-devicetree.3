Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690482;
	b=mpfFE+kM8VEu/KULGfUQZ8M9pOzRXzRz5fXxuYWQEzUq3ICtlV9y3jIG4HEe4z0Ts5s8
	 eRdnBp248Bl2YYQC1xtGdzG4GXXvFJdOlT8eZBxFZnD0hJors8MdpP4Gr6stv6yr8deBl
	 diodTYNWSX4JNnKeO+JTaehR28IDWL0GF7G4RRPI4B6jOcG76VhojJGbLi1bwe+dJIEpb
	 oHtbN4GIwy7TxuPKTS1bgylD2Y3SEid0FKBPxN7PHNXUXsfh0u4T7zktjqE7kQNxxCOVP
	 aZFAw6ng+TwolAAUPnbo6i2sRU1lMBkpVSLLgyw6FRYZCi2qNChDn9VGzE/xNnLcf6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8d1JUzHkhOEykd2vHLCoQfgBLqiimWUaKlrx1XuPKw8=;
	b=JBuVfRBwc3tIA0jTJS+2x7IDe+14yG2qM08BBjSSmN3VnBYablYTYp6BjoMFYtv7J971
	 cGd8FFvZooRDf+BsXKjty2IuEcsOA+uDeAta7WWuFTdrwdJy0QMlygtFCQXZO3xWQmnnf
	 2gY7Iu6JbwwJtR4w4zBR1hiAEa735qYHS39qPrDknnTzn40CTwoLLQIMkRYbdpFdr6kWP
	 BamWye2QznSbqVErw2N/5/MJ3V+0eWlzZZvi3JoZxjmGmN1iM2K3HcJjRJ5Dm1TyRS9dY
	 YeGeDKUq1ONVZaMPFKZEC63LPCq7buWnys8L9YSF747ZI98GDaJWblYnUmhV6xAsSoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=WHc5SoVU;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F06B60A3818
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 17:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F06B60A3818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=WHc5SoVU
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so47462f8f.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690479; x=1793295279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8d1JUzHkhOEykd2vHLCoQfgBLqiimWUaKlrx1XuPKw8=;
        b=WHc5SoVUd2hTSKLuJfzBcpNXLIJ+7F/nO+MsWUO5CIY8erk7qD6uhWZR4Q0U2Ob4zw
         pHb4mfo1dTMwA1pIyzV5X7uaGsgs60Yo3yM00LN29Sf8lvl9YFlBCqJUz8pcbIw0rUT4
         blySItgeFOlf0YNdHnE3AkKRXNikKkBFx4LrcaiGeexp4mf+eEMYkI3Cwm1VJf/JFYXq
         rywbcvfbhimYZ1nle1vGTpVITK9LwcVwAbTZ77DwY2bQTXUfOtK3V+zhRjBTY0AtFjgq
         wzQYuNps0UBTEhpUOW6E55Or44eOk1csCYDo8l0cSrccm85y20Fxx38rDMprrpmPWXX2
         9jFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690479; x=1793295279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8d1JUzHkhOEykd2vHLCoQfgBLqiimWUaKlrx1XuPKw8=;
        b=B6BAeJsrPS00nSkmczHdenjr5cSS3xRIeqKolpSe1hlcw1KAxnam/AY0hmh7QupeBa
         DbXnYbt5MpDhQCUX1cHhowqHoVvns8RfDXk/QJXifSCPi+rWJbsijZAsqA0pagJXVByj
         utBDaHuMcYdk9KsEupJ21LTZGyiwflwWeWCuw64bLFjlYtUFFpIJRwyWHoRsXGioIts+
         BkuMco2rhMTpBMgLevJRrCE6o+Jy3vVbZBayhdsTtmhdkA/GWd/c44YgULBUIccu3oU2
         VBVDKgUt1+zvdOCDw4BRHOqnWguIedocTqZvJkKaHb/z73GENgr5VLlGYXoMFYoSnk16
         Cy+Q==
X-Forwarded-Encrypted: i=1; AKwUvBysQ93ivzsm/lyKwwDyO0nSAQl3tJcqyWFKBjqlfJFvn44B19EKowWsybUERh7POU6u4mF7lugVHk4r@vger.kernel.org
X-Gm-Message-State: AFq9FYKrHjBp1Zz6aDPDLUvNWQY608YhMiMtHhJtfpsyXPHALqet2ZUw
	kZn9pHm3cVo37O53xet8YXTSThPE0zUyiZiZ8SLhx19k4TgCgBrg9Fv1UJuPDAHG8yk=
X-Gm-Gg: AYBFou0O99W2x/q6P7Tom07weJG1SXRaTGTepSxyOJn42dknpWA3Mkln5NOnypnTBc3
	/pRO2EEl1jk1OclVAX4FTUU4/mYLk5eICyEqhLhJbFiydJMDeOS7NvaWfcy7A6aY6QjkhX3xDf0
	t5MnWll6PFqevQng/e/Q1/5WzPWpKZeru729ZpqtcmE5jP+ge2x1/p6HMnsmEIL3WiavZts5P1u
	ox9fMdzq1URntPjThWf+rbpCwBbpWZo3fzIw1Owykg8AG5Pweojr+zKU9BX3eTzDP5LwvgLthyR
	uEaDoLDTecziJBc0hQGAEoKM65jjbBVe6fqNCPPvMnan/lFh9If4DVf4fpsIJjCLycT3iNhU7Kn
	zNU5ioIXZmnu/JIR2aI1Wj5bwJoQLGFcOm7Ub5Kx4bF3DHl5p3CMB2gePrhEYDnlue4czmgubKj
	7Lw9Buvgp53RitadDpbZoTNm0hMSZhYQRXs8pla/LvOHIvBuCjKtaLpS00cE3HFwc7VU/v0ecs0
	FR8FWsyJlcj6aWmasd1D2917e+PNDTxuSodHAO3hcl+EznXjdAbEFWWpQ+Y3NvO9+sMQ+0vdzKL
	CUSrnZbAWRfdKcayln4x2zzGGgzYxiI=
X-Received: by 2002:a05:6000:288e:b0:485:8cc8:1f5f with SMTP id ffacd0b85a97d-48e264a1f81mr12526348f8f.42.1792690479554;
        Thu, 22 Oct 2026 10:34:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:38 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:34:04 +0100
Subject: [PATCH v6 11/18] media: sony-starvis2: Add support for IMX662
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
Message-Id: <20261022-media-starvis2-v6-11-374343f55fd3@raspberrypi.com>
References: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
In-Reply-To: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
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

IMX662 is a 1080p Starvis 2 sensor that follows the same programming
pattern as IMX678, so add it to the newly parameterised common
driver.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 155 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 155 insertions(+)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 27357cc293be..2db9ac28308a 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -8,6 +8,8 @@
  * Currently supported are:
  * IMX678: Diagonal 8.86 mm (Type 1/1.8) CMOS image sensor with 8.40 M effective
  *         pixels.
+ * IMX662: Diagonal 6.45mm (Type 1/2.8) CMOS image sensor with 2.12 M effective
+ *         pixels.
  *
  * Copyright (C) 2026 Ideas On Board Oy.
  * Copyright (C) 2026 Raspberry Pi
@@ -663,6 +665,136 @@ static const struct starvis2_variant imx678_variant_def = {
 	.hmax_min_pixel_array = 550,
 };
 
+static const struct cci_reg_sequence imx662_common_regs[] = {
+	{ CCI_REG8(0x3444), 0xac },
+	{ CCI_REG8(0x3492), 0x08 },
+	{ CCI_REG8(0x3b00), 0x39 },
+	{ CCI_REG8(0x3b23), 0x2d },
+	{ CCI_REG8(0x3b45), 0x04 },
+	{ CCI_REG8(0x3c0a), 0x1f },
+	{ CCI_REG8(0x3c0b), 0x1e },
+	{ CCI_REG8(0x3c38), 0x21 },
+	{ CCI_REG8(0x3c44), 0x00 },
+	{ CCI_REG8(0x3cb6), 0xd8 },
+	{ CCI_REG8(0x3cc4), 0xda },
+	{ CCI_REG8(0x3e24), 0x79 },
+	{ CCI_REG8(0x3e2c), 0x15 },
+	{ CCI_REG8(0x3edc), 0x2d },
+	{ CCI_REG8(0x4498), 0x05 },
+	{ CCI_REG8(0x449c), 0x19 },
+	{ CCI_REG8(0x449d), 0x00 },
+	{ CCI_REG8(0x449e), 0x32 },
+	{ CCI_REG8(0x449f), 0x01 },
+	{ CCI_REG8(0x44a0), 0x92 },
+	{ CCI_REG8(0x44a2), 0x91 },
+	{ CCI_REG8(0x44a4), 0x8c },
+	{ CCI_REG8(0x44a6), 0x87 },
+	{ CCI_REG8(0x44a8), 0x82 },
+	{ CCI_REG8(0x44aa), 0x78 },
+	{ CCI_REG8(0x44ac), 0x6e },
+	{ CCI_REG8(0x44ae), 0x69 },
+	{ CCI_REG8(0x44b0), 0x92 },
+	{ CCI_REG8(0x44b2), 0x91 },
+	{ CCI_REG8(0x44b4), 0x8c },
+	{ CCI_REG8(0x44b6), 0x87 },
+	{ CCI_REG8(0x44b8), 0x82 },
+	{ CCI_REG8(0x44ba), 0x78 },
+	{ CCI_REG8(0x44bc), 0x6e },
+	{ CCI_REG8(0x44be), 0x69 },
+	{ CCI_REG8(0x44c0), 0x7f },
+	{ CCI_REG8(0x44c1), 0x01 },
+	{ CCI_REG8(0x44c2), 0x7f },
+	{ CCI_REG8(0x44c3), 0x01 },
+	{ CCI_REG8(0x44c4), 0x7a },
+	{ CCI_REG8(0x44c5), 0x01 },
+	{ CCI_REG8(0x44c6), 0x7a },
+	{ CCI_REG8(0x44c7), 0x01 },
+	{ CCI_REG8(0x44c8), 0x70 },
+	{ CCI_REG8(0x44c9), 0x01 },
+	{ CCI_REG8(0x44ca), 0x6b },
+	{ CCI_REG8(0x44cb), 0x01 },
+	{ CCI_REG8(0x44cc), 0x6b },
+	{ CCI_REG8(0x44cd), 0x01 },
+	{ CCI_REG8(0x44ce), 0x5c },
+	{ CCI_REG8(0x44cf), 0x01 },
+	{ CCI_REG8(0x44d0), 0x7f },
+	{ CCI_REG8(0x44d1), 0x01 },
+	{ CCI_REG8(0x44d2), 0x7f },
+	{ CCI_REG8(0x44d3), 0x01 },
+	{ CCI_REG8(0x44d4), 0x7a },
+	{ CCI_REG8(0x44d5), 0x01 },
+	{ CCI_REG8(0x44d6), 0x7a },
+	{ CCI_REG8(0x44d7), 0x01 },
+	{ CCI_REG8(0x44d8), 0x70 },
+	{ CCI_REG8(0x44d9), 0x01 },
+	{ CCI_REG8(0x44da), 0x6b },
+	{ CCI_REG8(0x44db), 0x01 },
+	{ CCI_REG8(0x44dc), 0x6b },
+	{ CCI_REG8(0x44dd), 0x01 },
+	{ CCI_REG8(0x44de), 0x5c },
+	{ CCI_REG8(0x44df), 0x01 },
+	{ CCI_REG8(0x4534), 0x1c },
+	{ CCI_REG8(0x4535), 0x03 },
+	{ CCI_REG8(0x4538), 0x1c },
+	{ CCI_REG8(0x4539), 0x1c },
+	{ CCI_REG8(0x453a), 0x1c },
+	{ CCI_REG8(0x453b), 0x1c },
+	{ CCI_REG8(0x453c), 0x1c },
+	{ CCI_REG8(0x453d), 0x1c },
+	{ CCI_REG8(0x453e), 0x1c },
+	{ CCI_REG8(0x453f), 0x1c },
+	{ CCI_REG8(0x4540), 0x1c },
+	{ CCI_REG8(0x4541), 0x03 },
+	{ CCI_REG8(0x4542), 0x03 },
+	{ CCI_REG8(0x4543), 0x03 },
+	{ CCI_REG8(0x4544), 0x03 },
+	{ CCI_REG8(0x4545), 0x03 },
+	{ CCI_REG8(0x4546), 0x03 },
+	{ CCI_REG8(0x4547), 0x03 },
+	{ CCI_REG8(0x4548), 0x03 },
+	{ CCI_REG8(0x4549), 0x03 },
+	{ STARVIS2_REG_WDMODE, 0x00 },
+	{ STARVIS2_REG_MDBIT, 0x01 },
+	{ STARVIS2_REG_XXS_DRV, 0x00 },
+};
+
+static const u16 imx662_min_hmax_2lane[] = {
+	[STARVIS2_LINK_FREQ_297MHZ] = 1980,
+	[STARVIS2_LINK_FREQ_360MHZ] = 1980,
+	[STARVIS2_LINK_FREQ_445MHZ] = 1188,
+	[STARVIS2_LINK_FREQ_594MHZ] = 990,
+	[STARVIS2_LINK_FREQ_720MHZ] = 990,
+	[STARVIS2_LINK_FREQ_891MHZ] = 990,
+	[STARVIS2_LINK_FREQ_1039MHZ] = 990,
+	[STARVIS2_LINK_FREQ_1188MHZ] = 990,
+};
+
+static const struct starvis2_variant imx662_variant_def = {
+	.name = "imx662",
+	.id_reg = CCI_REG16_LE(0x4d1c),
+	.id_mask = 0x3ff,
+	.id_value = 0x296,
+	.native_area = {
+		.top = 0,
+		.left = 0,
+		.width = 1937,
+		.height = 1101,
+	},
+	.active_area = {
+		.top = 0,
+		.left = 0,
+		.width = 1936,
+		.height = 1096,
+	},
+	.pixel_rate = 222750000,
+	.pix_per_clk = 3,
+	.common_regs = imx662_common_regs,
+	.num_common_regs = ARRAY_SIZE(imx662_common_regs),
+	.vmax_default = 1136,
+	.hmax_min_link_freq = imx662_min_hmax_2lane,
+	.hmax_min_pixel_array = 990,
+};
+
 struct starvis2_model_info {
 	enum starvis2_type type;
 	const u32 *codes;
@@ -693,6 +825,26 @@ static const struct starvis2_model_info imx678_autodetect_info = {
 	.auto_detect_mono = &imx678_aamr_info,
 };
 
+static const struct starvis2_model_info imx662_aaqr_info = {
+	.type = STARVIS2_COLOR,
+	.codes = codes_bayer,
+	.num_codes = ARRAY_SIZE(codes_bayer),
+	.variant = &imx662_variant_def,
+};
+
+static const struct starvis2_model_info imx662_aamr_info = {
+	.type = STARVIS2_MONOCHROME,
+	.codes = codes_monochrome,
+	.num_codes = ARRAY_SIZE(codes_monochrome),
+	.variant = &imx662_variant_def,
+};
+
+static const struct starvis2_model_info imx662_autodetect_info = {
+	.variant = &imx662_variant_def,
+	.auto_detect_colour = &imx662_aaqr_info,
+	.auto_detect_mono = &imx662_aamr_info,
+};
+
 static const char * const starvis2_supply_name[] = {
 	"avdd",  /* Analog (3.3V) supply */
 	"dvdd",  /* Digital Core (1.1V) supply */
@@ -1528,9 +1680,12 @@ static const struct dev_pm_ops starvis2_pm_ops = {
 };
 
 static const struct of_device_id starvis2_of_match[] = {
+	{ .compatible = "sony,imx662-aamr", .data = &imx662_aamr_info },
+	{ .compatible = "sony,imx662-aaqr", .data = &imx662_aaqr_info },
 	{ .compatible = "sony,imx678-aamr", .data = &imx678_aamr_info },
 	{ .compatible = "sony,imx678-aaqr", .data = &imx678_aaqr_info },
 	/* for non-conforming DTs that rely on runtime check */
+	{ .compatible = "sony,imx662", .data = &imx662_autodetect_info },
 	{ .compatible = "sony,imx678", .data = &imx678_autodetect_info },
 	{ /* sentinel */ }
 };

-- 
2.34.1

