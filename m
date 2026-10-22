Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690484;
	b=scS20clZOFsg42obzW+Mi76EuA/NHTSqtUHv+tssuYMKZeyHMRdZeqeIkbSaYvdxTWLI
	 lUQgKQTZPsPucUEWkEDPKkJGLw3s/EKTW0fj2iTgSWfCr3PkRD54PVY+QSQ5fNEtvqtyC
	 Lxw2AzL2WVNrOvJF2cxUZgye/jN1+eJiWu2nwUNm12gd//RM1uzGjDxmRWU7k6rEeEfA2
	 KD3P50KPuib4N84mjh1IyisWzPyuW3fWJCzM+hI3sAIXvnbWWhVzUaApYP9paJ4SZf2ak
	 iMDz4NQLcmMdRTdZ2/SRAgcXjO6jux3l72iB//OX/gWwSeK26DudgvYfqRPKYDS+Z/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=VSv5iuwo2+u6yZ/vu9IKOx8gXurrCzY9e0DhNAIbsQ0=;
	b=g0cTbdiap6Ia37lQ9uVUEHn28IALC9ym858sU3Kv82WWZJIkYmNRRNHhhOT/ZtQWDRLf
	 QUj1mgsBEiN2A3TZO5EkXusmZ8lJIdQCkqxZibjZ7opTPKEY8uSUzKKumr37dyFLRu3+r
	 Uhka1mGJ7L3Bv2+sx7UaiLEfKF/3Cr/iJkKYbBRhweU/+W9g+at0QC0y5mmEpoeqfGa6J
	 NWrklRbVLHEemDzq8Mdt4fGuZCfidY7Nq30/JXSJde352NRrPEfE2ZyGMJuwko3vQ04Wi
	 y3a/031GAwah7VgJ2FoppOQPgiKD6wBV0U85qxJPzRa62yaPIB6CR9uDw4tX9Dv6IVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=SXT6bHxo;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C55F60A383D
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 17:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C55F60A383D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=SXT6bHxo
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48bbb06e746so15628f8f.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690482; x=1793295282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSv5iuwo2+u6yZ/vu9IKOx8gXurrCzY9e0DhNAIbsQ0=;
        b=SXT6bHxogpOGZuiuWTqC6NQPjc06joj+n99rqzbJqp/SAh9mHvNdib63POOcm7/Qlp
         OHvGZXonF7hfeaoW9JGos1XoWTJYLlqgwGoWbEr8ilIgPVJrh13dR13mGtCVXLJ3z3qu
         9HLhr4ZE+aQn2bchTKXDNI7C7Zk9V4MLuJ+p/iXgpUbK11yqPZ4GUTDNvDabtVDatk4R
         E881cXVjbRPy8mSgsA8OfkyO1cJCn/WDBs3t4l6maaCY36dtY7WtlNhZrfXHjMTbZ3+E
         6Xjl624ElMihvvidAHNhydCJZkWcnq38t9jWHvJp8il+o77qPrFnWRBQqEuh7YYwGEqA
         0JJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690482; x=1793295282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSv5iuwo2+u6yZ/vu9IKOx8gXurrCzY9e0DhNAIbsQ0=;
        b=vgf+hDFkOvIgZgH3xyoS7Xt2AwEb8JkM3lbPsKexHMIIrUm2In3vKqgEoC+lJgyKR0
         ZuXX9YTFFLJn0pKpcrndFifvOXQfS4QBfDD+Xm45wUdfiw+GL16zlVoctouVtWU5blZw
         XMYL/yVGW8xTcQVXqL805n/SI8bFF7xIobEbLmcsFAjGGx998YnAOrJ10cvsbBW7hG4P
         pFnZTGzDxTyz5deSBszShjnwmSEYnTXMAGFvuRmmb1c3mpQIiuRlBJB0eipgDdww/khX
         5dQFxXu0ycNCqYjaUPelj+CYoGhynA5OZZtHvhauYEteDb0ExmU856H/LIKkiuACijJi
         n72g==
X-Forwarded-Encrypted: i=1; AKwUvByXAYEj2//PvJqoXrQH3jT/0KeYr/yRDXQol3Pzbygj7ZZNl7OsMXDjG1xW3xx0Gs0YlL7pkxzv7cIK@vger.kernel.org
X-Gm-Message-State: AFq9FYJqRnl4P4hD6N+i6Fb2TcZz5aLSRjv8pa8S1O5iZbiJhUsk3Nru
	sy9w4XGvqnUhkRUPxix/r5J9joaFZ5P0NZ/1VQLohVzHBNgHr2yvcBXVhmtHfEUkejA=
X-Gm-Gg: AYBFou39wckPCaEaA6VWOA5Vn6ou7danhbhgz3hxJJxi4oiOuRnUs3rfP+BYoU4HC+C
	W2yS0Cv4txOLLGMRh+CDMVRooqa9frD7oxMPBgAGEuO8i/JQpcQY7/NB8vKMGBlg8NntAtbtqZu
	P7NIYdf2TibXLsup00F5diOhHjlIlXOSyfLnvjlcVzGpcaRtBKTwxDdh+auDoiFMuU4sxtU8lno
	2Q5ZB/TL58YjRWDzLhkqEOF6lEoviSDi+yWFXYaDrvnCdnSjbdL0ngiLS5jmmwBwwGAQAdMRouC
	cK9pY5bj9KlWrxhz54Sw1oQOxYckiNU5TDWzHgWTspFKHicrso0I8ch2NOOZi6H0UPk8L5jBufh
	3HZhDLYlA61l/0/7dTgK8rUboL9UUJt49PfWFhr8wXMsSSj/VsImr+rsn1Y7FGQCgAv8hPBBot3
	DKiTgL2XuUsfKHj6cf+XrMjTSyn260FMPIspZlhz2Q/OoFESSP6JIBI3TVuiLCagFb2VNnJjMle
	I1raUV9kW4NtVPcAW48Ri20af05VHf1I2wFBWmU1mS6hrE+EXBwoD3yVzawpOTf+txdH5GAm3/v
	ZMG8OLemUHcwCzHNMJpZvESGRfPUFsk=
X-Received: by 2002:adf:edcd:0:b0:488:5852:6ee3 with SMTP id ffacd0b85a97d-48e264f18f8mr10242795f8f.34.1792690481792;
        Thu, 22 Oct 2026 10:34:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:41 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:34:06 +0100
Subject: [PATCH v6 13/18] media: sony-starvis2: Add support for IMX832
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
Message-Id: <20261022-media-starvis2-v6-13-374343f55fd3@raspberrypi.com>
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

IMX832 is replacing IMX662, and it follows the same pattern as all the
Starvis2 sensors.

Add the sensor specific configuration for it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 118 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index a4815a142c9d..645417cc08fb 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -12,6 +12,8 @@
  *         pixels.
  * IMX675: Diagonal 6.53mm (Type 1/2.8) CMOS image sensor with 5.12 M effective
  *         pixels.
+ * IMX832: Diagonal 6.45mm (Type 1/2.8) CMOS image sensor with 2.12 M effective
+ *         pixels.
  *
  * Copyright (C) 2026 Ideas On Board Oy.
  * Copyright (C) 2026 Raspberry Pi
@@ -984,6 +986,99 @@ static const struct starvis2_variant imx675_variant_def = {
 	.hmax_min_pixel_array = 528,
 };
 
+static const struct cci_reg_sequence imx832_common_regs[] = {
+	{ CCI_REG8(0x3460), 0x21 },
+	{ CCI_REG8(0x3a94), 0x75 },
+	{ CCI_REG8(0x3a96), 0x69 },
+	{ CCI_REG8(0x3a98), 0x1e },
+	{ CCI_REG8(0x3a9a), 0x1e },
+	{ CCI_REG8(0x3b58), 0xeb },
+	{ CCI_REG8(0x3b5c), 0xeb },
+	{ CCI_REG8(0x3b88), 0xeb },
+	{ CCI_REG8(0x3b8c), 0xeb },
+	{ CCI_REG8(0x3c40), 0x06 },
+	{ CCI_REG8(0x3cae), 0x79 },
+	{ CCI_REG8(0x3cbc), 0x7b },
+	{ CCI_REG8(0x4508), 0x00 },
+	{ CCI_REG8(0x4509), 0x02 },
+	{ CCI_REG8(0x450a), 0x41 },
+	{ CCI_REG8(0x450b), 0x03 },
+	{ CCI_REG8(0x4660), 0x12 },
+	{ CCI_REG8(0x4661), 0x00 },
+	{ CCI_REG8(0x4662), 0x29 },
+	{ CCI_REG8(0x4664), 0x12 },
+	{ CCI_REG8(0x4665), 0x00 },
+	{ CCI_REG8(0x4666), 0x25 },
+	{ CCI_REG8(0x4667), 0x03 },
+	{ CCI_REG8(0x46c0), 0x13 },
+	{ CCI_REG8(0x46c1), 0x00 },
+	{ CCI_REG8(0x46c2), 0x28 },
+	{ CCI_REG8(0x46c4), 0x13 },
+	{ CCI_REG8(0x46c5), 0x00 },
+	{ CCI_REG8(0x46c6), 0x24 },
+	{ CCI_REG8(0x46c7), 0x03 },
+	{ CCI_REG8(0x4720), 0x07 },
+	{ CCI_REG8(0x4721), 0x00 },
+	{ CCI_REG8(0x4722), 0x23 },
+	{ CCI_REG8(0x4723), 0x03 },
+	{ CCI_REG8(0x4724), 0x14 },
+	{ CCI_REG8(0x4725), 0x00 },
+	{ CCI_REG8(0x4726), 0x2a },
+	{ CCI_REG8(0x4750), 0x1e },
+	{ CCI_REG8(0x4752), 0x22 },
+	{ CCI_REG8(0x4753), 0x03 },
+	{ CCI_REG8(0x4754), 0x25 },
+	{ CCI_REG8(0x4755), 0x00 },
+	{ CCI_REG8(0x4756), 0x29 },
+	{ CCI_REG8(0x4780), 0x08 },
+	{ CCI_REG8(0x4781), 0x00 },
+	{ CCI_REG8(0x4782), 0x1d },
+	{ CCI_REG8(0x4783), 0x03 },
+	{ CCI_REG8(0x4784), 0x15 },
+	{ CCI_REG8(0x4785), 0x00 },
+	{ CCI_REG8(0x4786), 0x24 },
+	{ STARVIS2_REG_WDMODE, 0x00 },
+	{ STARVIS2_REG_MDBIT, 0x01 },
+	{ STARVIS2_REG_XXS_DRV, 0x00 },
+};
+
+static const u16 imx832_min_hmax_2lane[] = {
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
+static const struct starvis2_variant imx832_variant_def = {
+	.name = "imx832",
+	.id_reg = CCI_REG16_LE(0x4d1c),
+	.id_mask = 0x3ff,
+	.id_value = 0x340,
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
+	.common_regs = imx832_common_regs,
+	.num_common_regs = ARRAY_SIZE(imx832_common_regs),
+	.vmax_default = 1136,
+	.hmax_min_link_freq = imx832_min_hmax_2lane,
+	.hmax_min_pixel_array = 990,
+};
+
 struct starvis2_model_info {
 	enum starvis2_type type;
 	const u32 *codes;
@@ -1054,6 +1149,26 @@ static const struct starvis2_model_info imx675_autodetect_info = {
 	.auto_detect_mono = &imx675_aamr_info,
 };
 
+static const struct starvis2_model_info imx832_aqr_info = {
+	.type = STARVIS2_COLOR,
+	.codes = codes_bayer,
+	.num_codes = ARRAY_SIZE(codes_bayer),
+	.variant = &imx832_variant_def,
+};
+
+static const struct starvis2_model_info imx832_amr_info = {
+	.type = STARVIS2_MONOCHROME,
+	.codes = codes_monochrome,
+	.num_codes = ARRAY_SIZE(codes_monochrome),
+	.variant = &imx832_variant_def,
+};
+
+static const struct starvis2_model_info imx832_autodetect_info = {
+	.variant = &imx832_variant_def,
+	.auto_detect_colour = &imx832_aqr_info,
+	.auto_detect_mono = &imx832_amr_info,
+};
+
 static const char * const starvis2_supply_name[] = {
 	"avdd",  /* Analog (3.3V) supply */
 	"dvdd",  /* Digital Core (1.1V) supply */
@@ -1895,10 +2010,13 @@ static const struct of_device_id starvis2_of_match[] = {
 	{ .compatible = "sony,imx675-aaqr", .data = &imx675_aaqr_info },
 	{ .compatible = "sony,imx678-aamr", .data = &imx678_aamr_info },
 	{ .compatible = "sony,imx678-aaqr", .data = &imx678_aaqr_info },
+	{ .compatible = "sony,imx832-amr", .data = &imx832_amr_info },
+	{ .compatible = "sony,imx832-aqr", .data = &imx832_aqr_info },
 	/* for non-conforming DTs that rely on runtime check */
 	{ .compatible = "sony,imx662", .data = &imx662_autodetect_info },
 	{ .compatible = "sony,imx675", .data = &imx675_autodetect_info },
 	{ .compatible = "sony,imx678", .data = &imx678_autodetect_info },
+	{ .compatible = "sony,imx832", .data = &imx832_autodetect_info },
 	{ /* sentinel */ }
 };
 

-- 
2.34.1

