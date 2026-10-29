Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283537;
	b=n7vgl9gMTZCxjBsGIiEpOwdEeBcxVLmsXe3DhRhHxy7RWwmDXocMRUZ/nn34Sa73TgAJ
	 pfqc4+JtRwniURXN+t81cBWwUMjvL0uosmLH4MV6XyseyUB+zoHXCLQKHhf/R33eHq+cy
	 Ryb5FxeUWbYveK5LLnh2Fb0DKyTnaiD43EIa5G0ZBgHXl4TmUd+rEozzVRkXHuJfp/VOf
	 uH6ciGz9Rjy+FgeXc4PI410Myq59oa2Or5LnRHlSf8QFX8CmiZg758JBWuuKsXxVpDTFQ
	 fPCDWDERfAA4SecbcKBHt+turQG5enyqEGpZT2Cp09yQ8CyEGTOEf1hqJu9e+5VUbqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=VSv5iuwo2+u6yZ/vu9IKOx8gXurrCzY9e0DhNAIbsQ0=;
	b=WnCepnUjCQoPzmI5NFpaqyAYc09KaOCxYJBHfjTKr+Pa8/GGxSRr6zCQke7D3j9QpRsI
	 6Cn4+dKmR0hLdojzo+lMftqsgm+sFC/+crejtwkAEQNJLAdzz+lUxnlix6RPgIM5teGf0
	 8X2NxyAqNIaZj8XR5hFovc9t4l7C5ao7S/MuASsPcGCtOxB7DSCz5TG4sTby4jmbJw7Ca
	 cewOZPxHEkhfsqWtstMnX7BK1Kdg3bEmgTb8Am7AxVrsgu2aJgH0we8rSisiw+5myWwzu
	 dD0QUIhYItXWH65vJR1Sjn6qXyVm5Mza0mNHHGpaCf1dIaxWpEKd2cZuNfOlDwZDhiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941C4606B6E2
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 941C4606B6E2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so22865955e9.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 07:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283531; x=1793888331; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSv5iuwo2+u6yZ/vu9IKOx8gXurrCzY9e0DhNAIbsQ0=;
        b=U5QvBAkEHFeQUPa7mIoJ2tnS6H21i5vNQxgO8zYKKVfldO/R91nnx+iWp9JSyyCKyx
         ecTBS9Cv71lLj6+LhcRXRxl9oX0DjbkhKXlHB9F0ub3fHm4gnC6RYPFiKV8iMnDS2C3S
         LW7SV+07GqOFJO3KDDxUYmvq7Uw4COs6QAyoyuBOCJ0McHy2Mq76Lo2NCAeeHOnJOCsz
         J3QPzatJ4AEUlj8Pg4VJVC3jcgI7E2ZQrKpLDYOdhw6Tb7n4wLHsYCXqwyCOaxQjW893
         pews9uL805MVBf2XwXt0cjC0Lx7NBZQVnhoQa2izCmbTsWXOWjuu4V4ifsDr2lpAITn1
         E3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283531; x=1793888331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSv5iuwo2+u6yZ/vu9IKOx8gXurrCzY9e0DhNAIbsQ0=;
        b=pwSqG4BKSeGVeykCUDWoiRADd2hQSyETKy3FVy9EJde34uEa4QThQk2UL8Oe4jr7/H
         4pH2BLJJuxEIe/UhC6ZJMihE0F7WVNw/u+YfKZ13jVUbOkLHR8hI+fJSkKfGeHkkUJrc
         QgrqYU4P+/HIyedCTAOQKDw7CdAr5Z/Cwwsb5KoJqv8W6N5ONGlN552qGJlegOT4Lcj9
         fQ6zrIm6fIJZSgvB6LucihCmSE+nyMo3/HFXYABk1QEPVxl9pJ7CO1/5FS4E74gSs1Ca
         Nb9ROGrcBOty9E5C7Q8FKYF0Bd3mXkiZyffL1Rp91KtYYqc1V+GHMNbZHcm7cM8gf5fK
         rE1A==
X-Forwarded-Encrypted: i=1; AKwUvBzSUOo0hxw3VK3oE3j2599MpxxNY+aNABffTuHNuJUjSJAMVM0ZHy5VMawJtTC8/95V86O9g+vZsfTh@vger.kernel.org
X-Gm-Message-State: AFq9FYIXWVNSSh50iyIXm7TGcVPCMCfIoJ7c9lLZ5POXdmMTHsFbd5cV
	1YTBJJu9ze/pf41rwe25U7Jwg/jsvRBcL8V1QUptcUGQMHCGMIulvmeKag9WbIzvVnI=
X-Gm-Gg: AYBFou0iGddVp5UwXvspKSgG8w6iB1pt/WH/dhrpLoVwOqo5QfazQVLjp0g9Awq/BiZ
	bbbJJx9kwEmj9bvocJOsU6lTV4c2OH2eZn0KsU+4/yzxJQPjHsEAHcM/MaPTJjWgjMXjVQugYtD
	txm+YHD6nC6lLmX/203VGbkeVHNae04r0IBtwu8Sp6XdbhNcpcXa7qrS46bLWDsQtH2HXUnHeMx
	NkTf+dQq9b7FLREUYZTtw8EdtciX155nU8CONVRDi13hq3+hJ/aYqWbtIH2xfZsIgmcYxeQlMOF
	jLPMubAU3u0ebIy/ywiOUsVzFGGjjCXTDGajGhsMiuzk+Jcesfi+O5IQQRvNtvcLkHpBS5CPkDq
	9jF1oIo9ImRb0mthjUoWnRVRVcF35enmmG/2TMnj04e8bWQxMsZ1paYo45+v02sf4QGX+HpVEEL
	eAeDUPlZiSDeYLuXEBE+hZV+6k+Uzhzkd7ixNrcD8gL/aIN5d90UyN45pRI0bCqDvoPFOpSNQte
	wtXqyBvoIGNAz1bvuBRdjgOSnuE9cEq9E5/r4b2BkbiVhHbTDw4iyUPOP3t/HCUJ6n4/lcumo4K
	cc3rnP7uSrGyReKAZZAp0oAHNpfIIy+Nye0fhff8nSCmrmCGFIooekdxFei9Ef8tylUrny+DgPn
	au6Mw
X-Received: by 2002:a05:600c:8b85:b0:4a3:18ca:806 with SMTP id 5b1f17b1804b1-4a966f220f2mr121003265e9.20.1793283530836;
        Thu, 29 Oct 2026 07:18:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:50 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:34 +0000
Subject: [PATCH v7 13/18] media: sony-starvis2: Add support for IMX832
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
Message-Id: <20261029-media-starvis2-v7-13-b33a1332fdfc@raspberrypi.com>
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

