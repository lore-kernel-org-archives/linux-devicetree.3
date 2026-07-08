Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E8847DD72
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522166; cv=none; b=iQGktq2W43G63pODEG1PXPN5llX+ENhUb25ZccDQ6zpEZK4Q6zdlmOkesObl2oGXj6MdRS04K0YbJLeJ6pBEE96+gXsueUpBd+aoByYTO6H8OjNSBEoxBXOLCinKo3LX8eckX6EmevIm27NBdX6SVckHwKIKMir6l3Wvh9KfBeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522166; c=relaxed/simple;
	bh=WmGz4nPgmAYFKTk0UHv3cgym/1CZLfveDLzGzzdpKXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ngQFtlawpXph7ZbLyoV5KMOMp+/SjTzm0Sk3ohn7m9pF6QOJ9VcpQhKol/qLM4s1oUw+bfJ//rbqSLmIhhoCM9sHp87OBOWh/vyJgE2ciXoOsB4RKxkXMoM1BbfXWB08NE5Y0nm/KSwWKDuzX3pceomg7P+xLFbSydvtjde1Qro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=cAhn5afI; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="cAhn5afI"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493c486f012so3334315e9.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783522157; x=1784126957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=poih6FWktQDQKgkCTECxgZzsFqMFD3r/FGOUzaesYvE=;
        b=cAhn5afI10yGdIL7k8Xblf5IvVuzKqghzNCIAiVKorHu+MCMFbxvAFjqhIWYKmX/9j
         GK+tEUQfxzYasmQLJ2fSZ4rjjTV8ukdC3qUiizfyB65oA7aQTBvC+CztyROKkBlEVrvq
         QNIAEAQqdPJZ24ox/nBJgusXu7pWwqnSv1CfLQ47nWSYKE9J7D05KmApzHTpYy8xyjkd
         zLTa6vXRB+wb5IiKxuH6+7otBPm04RPa4QhtV+CmXPvVlDQDNiajxgPespI0oR3i0sPR
         Qnc9atiaRS5GyjKQAIVWs+vMQ8Z3+IvNuTfb/Z9cYRjMrur5j0CBmmRhgplYCpIxSzqZ
         OgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522157; x=1784126957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=poih6FWktQDQKgkCTECxgZzsFqMFD3r/FGOUzaesYvE=;
        b=Woiv9vN+NCqW5AnSBlL/K4Vb8MVbHLEWCnv+bWXW99YRFfiSTxAEwaeAW/igVLM0s1
         NNjPVpiI6my7tWa+Ni6gcJDHz6kgJK/iZCEt4z9U9OKqmA+JMcQ530B5koEA+JPKP1YJ
         nBJZ9YM5O73N2UJCDEqsbQGz82KHamMwV3fAQ+yDkb7M01/if1A2C/33aYTChMPfZ8rm
         pe5/U/WGKMP9ZBcpaW/oyiQLScZOtHwUfSGQrkKXgWIqu5KcneTBwdW941wjMjItEv0k
         YW5lVyA49YpGsxOqAp/2kffDPsR7MFE/Dgbz/3gnHXXNE99FsBGgDAoXyDbKjRvbwdbK
         oXTA==
X-Forwarded-Encrypted: i=1; AHgh+RqCKhCwbxzzbruZyhPhc7qyji3FjJXbCKC/lyHJCTiXZ0iK4m9tvSZu43H+WTjallWtMrShL6f2xJLQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzdM0/lx2/eyAw9vJuyQi5WRdTBjXHzDt92WRxtxn/AM+2qlQWo
	Z4ubsZmm18oxEDDPr1LfOMYQYYeHxGS7Ovvhui2NlpT/DasZn5I6m+n5STzv6wCOmm4=
X-Gm-Gg: AfdE7cmPfs0IU4GdRdmE5UddIe1MRai2CtZiy6PWX7LXhvPLWdZ7wpAsDR2a2zl6bUU
	yPoo5U8DjEe3OUkHxQ1bFiSkzRdnS5BGyMefHqdYwDgObB7EG3Uifeu6i6UHAfaKx9Vtjd1Acx1
	+EBBfayYa6kpgOVCYKvLQTrjY8FB28oJQtOoVv0MJbYdWFIMoeYnYhbxnQEufnwI8FvfK1apyGL
	eAtFP1Gf2rnF5SamGIXwSrA2cXz2Ng9B+rUI7fvN06UM41X5Ygxp+4kQrzM5CJMn56yft/847Rv
	nqbmySJ1DLmSdMD1NHgmVhSaNP61iSiX/mgyagUKwJWNcmUFhtYBcUzMhWMcBv8Dd/XRMIGqaqu
	1hl8/f0EUH07XwknAfxFhpJN4pX1nrt+zW/hsOXF7ECZoxnTJWA3tQpOwBodOzCEuKk+9xc2dpu
	TdI5wmzppikMzA7f8wi0qSIZSMjKEiHLFQguuI/waRTrupQLuzevzOtuEK5qo9j5Lp
X-Received: by 2002:a05:600c:4796:b0:493:e97b:3b9c with SMTP id 5b1f17b1804b1-493e97b3bcfmr1416705e9.29.1783522157466;
        Wed, 08 Jul 2026 07:49:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm135363315e9.13.2026.07.08.07.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:49:17 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 08 Jul 2026 15:48:46 +0100
Subject: [PATCH v3 10/20] media: imx355: Remove redundant fll_min, and
 implement fixed offset
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-media-imx355-v3-10-9df386a623d7@raspberrypi.com>
References: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
In-Reply-To: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, devicetree@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

fll_min (Frame Length Lines) is set to the same value as fll_def
for all modes, which makes it redundant.

The actual value is also erroneous as the sensor works in all
the defined modes with FLL set at the mode height + 20 lines,
so set the vblank control minimum to 20 rather than varying it.
This also improves the maximum frame rate achievable.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/imx355.c | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 2a97e076bff7..c6f27cf269b4 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -32,6 +32,7 @@
 /* V_TIMING internal */
 #define IMX355_REG_FLL			0x0340
 #define IMX355_FLL_MAX			0xffff
+#define IMX355_VBLANK_MIN		20
 
 #define IMX355_REG_LLP			0x0342
 #define IMX355_LLP_MAX			0xffff
@@ -105,7 +106,6 @@ struct imx355_mode {
 
 	/* V-timing */
 	u32 fll_def;
-	u32 fll_min;
 
 	/* H-timing */
 	u32 llp;
@@ -359,7 +359,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 0,
 		},
 		.fll_def = 2615,
-		.fll_min = 2615,
 		.llp = 3672,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_3280x2464_regs),
@@ -376,7 +375,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 8,
 		},
 		.fll_def = 2615,
-		.fll_min = 2615,
 		.llp = 3672,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_3268x2448_regs),
@@ -393,7 +391,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 8,
 		},
 		.fll_def = 2615,
-		.fll_min = 2615,
 		.llp = 3672,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_3264x2448_regs),
@@ -410,7 +407,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 684,
 		},
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 3672,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1940x1096_regs),
@@ -427,7 +423,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 684,
 		},
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 3672,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1936x1096_regs),
@@ -444,7 +439,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 692,
 		},
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 3672,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1924x1080_regs),
@@ -461,7 +455,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 692,
 		},
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 3672,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1920x1080_regs),
@@ -478,7 +471,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 0,
 		},
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 1836,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1640x1232_regs),
@@ -495,7 +487,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 304,
 		},
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 1836,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1640x922_regs),
@@ -512,7 +503,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 496,
 		},
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 1836,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1300x736_regs),
@@ -529,7 +519,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 496,
 		},
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 1836,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1296x736_regs),
@@ -546,7 +535,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 512,
 		},
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 1836,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1284x720_regs),
@@ -563,7 +551,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 512,
 		},
 		.fll_def = 1306,
-		.fll_min = 1306,
 		.llp = 1836,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
@@ -580,7 +567,6 @@ static const struct imx355_mode supported_modes[] = {
 			.top = 0,
 		},
 		.fll_def = 652,
-		.fll_min = 652,
 		.llp = 3672,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_820x616_regs),
@@ -864,7 +850,6 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 	const struct imx355_mode *mode;
 	struct v4l2_mbus_framefmt *framefmt;
 	s32 vblank_def;
-	s32 vblank_min;
 	s64 h_blank;
 	u32 height;
 
@@ -889,10 +874,9 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 		/* Update limits and set FPS to default */
 		height = imx355->cur_mode->height;
 		vblank_def = imx355->cur_mode->fll_def - height;
-		vblank_min = imx355->cur_mode->fll_min - height;
 		height = IMX355_FLL_MAX - height;
-		__v4l2_ctrl_modify_range(imx355->vblank, vblank_min, height, 1,
-					 vblank_def);
+		__v4l2_ctrl_modify_range(imx355->vblank, IMX355_VBLANK_MIN,
+					 height, 1, vblank_def);
 		__v4l2_ctrl_s_ctrl(imx355->vblank, vblank_def);
 		h_blank = mode->llp - imx355->cur_mode->width;
 		/*
@@ -1151,7 +1135,6 @@ static int imx355_init_controls(struct imx355 *imx355)
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	s64 exposure_max;
 	s64 vblank_def;
-	s64 vblank_min;
 	s64 hblank;
 	u64 pixel_rate;
 	const struct imx355_mode *mode;
@@ -1181,9 +1164,8 @@ static int imx355_init_controls(struct imx355 *imx355)
 	/* Initialize vblank/hblank/exposure parameters based on current mode */
 	mode = imx355->cur_mode;
 	vblank_def = mode->fll_def - mode->height;
-	vblank_min = mode->fll_min - mode->height;
 	imx355->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops,
-					   V4L2_CID_VBLANK, vblank_min,
+					   V4L2_CID_VBLANK, IMX355_VBLANK_MIN,
 					   IMX355_FLL_MAX - mode->height,
 					   1, vblank_def);
 

-- 
2.34.1

