Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAEA46AEC6
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 11:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115864; cv=none; b=D2YfhQDaXpd0FhfrkZIRLEF4xB/+KdblxW1Az966GhfSl+MXaY/nhlpe8++QExzYsIFLMtQobeYwqatF9sGjzv/Rh/pjTDPeJWpfj1cv88OrCGq66r4BYZWbrdl/WPNVk9XoMLy6kvUZgLbTsx67Zmnqsrs+lBHWW1U98ZoAq6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115864; c=relaxed/simple;
	bh=UnnHfdWHB3j8/q1T8HXrGgvBN3cYv/cM8AQICxBDWkk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MV1RIn+wwZCSckH0F241Xlr5IjMOwKEAsB5nOcm0SSFUqRVlDOlkxxR79wm2oooJR3Z7COB53hpviJFH2se2W3DKaTMYu/e6WlIrQ69fgGBBbyCEebESXkXamYVORk6iuzQvugxhEWNPL0xFBjF9H1MPX6XDkVMogBC4v/9jNgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=g4ieW1Z4; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="g4ieW1Z4"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-476d8e647e9so5100303f8f.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 04:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784115860; x=1784720660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pMlOxNtzedHPm6fZpmbSBE2eNBzZTV+UC4ouVws8cLY=;
        b=g4ieW1Z41sS0VRjUy/DO0oIxSyqIXbzNLPh3AHWE0zW860YElfIFmzbZfXeC+SeTH8
         vMJEgc67bfMRrujZOwNETBuC1c63yaFZ3YyVdXIzcWCZD2XaA/O9K7dAefbw1xsHI9cu
         I6atxyBwc1NpW76JCeQVS7apVLBTUz1O+9Gjc7yzRRcT8+GbPA+dsRFHKh8mcfinL5G0
         ZpWpgVIi8HrlXKc4/R55f7IM0IatuxiPk6uzCZvoEWLqB+fo1yKpf7nFr4fciRDqYXPy
         KEklxrDnH71nJ/yIEv4T4yI1fM+Sy8lTMlRAhvQ6jymq0sDa6N4lGXuxub0unhyW7aRH
         X+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115860; x=1784720660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pMlOxNtzedHPm6fZpmbSBE2eNBzZTV+UC4ouVws8cLY=;
        b=EASQp9dH3g9MAcjvGvJsyEcMwzJVxQfNDx9vgMgJS0AJ1ePqg1jv1N829iZg2CgLos
         CsuaJcyK73MIbXuTfhEypGn31nj+MzEgtZfqII4IfQu8vPWdytqf3e0n5UuZ96qlw9ar
         ebKyjAqRoo/VsCP2CIKms6lcKp0wDGbTF3DBrmWACCLuuZ3xvmBtDnQ1BLBLiseOAsWk
         V/CO7+37IcXUG/SbjLSJn5hYENicNdnTvzs4OW290gqOr+seFJJ4dnwOjzFfocn/Lf0g
         LU3AkHrokF1hx+GEdfHDKStOnPXnLaT5zzz8lWfzDpDj9KFZe234s9fUtKQ//kS4iJxi
         rJ9Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqv6eWbMIJ0W9PJtLGz4rSlp1LJCP8jQnEV1iRRnUNvNT3N7Pn/h8WgemqiauO8AYmZ8fduWxiq30Ck@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+K6aolTYiqOcsoEo08qt72lalnXWKq6CFe66qXf41nLNMu9za
	HD1fh6i2ZXgcb4M5kx4Iul2rF4s+OciCj4SydoqmI2MbtHWoUxiKfHBsnzE2e64OeFonb2HWCh1
	UBNED
X-Gm-Gg: AfdE7ckXT2rSJaeWncffZDR80PgGERYF/YXvabNWMTQlbWdop4UGv9Y9aTwTdKR1feq
	9/joxa11Z4YbqGr8iZMVtvsiH9o+KPKLH9K3mTXplWWKyNV8L3ctY9BN4x+49TQGUN8ZnVQCFuG
	IWt1khcqgtfz1vsxYytYB1cZDY9xgf3pnyRpD9NgNSBlau488IpFpEiEN1M5RvpILadmYDXi6P7
	evxuDtka9qwfmxeEIDSPH4FdiNs/vwJNAzbWhnS6GoyrnnKLEBrA8zmb0kfoGFfpKYhtHUIwc9+
	SNyKOFpR50ItTD/vFQXhEmpVPU3oYpUEXSw/kSxNr112DM3pmyQE/ozr+sKIV2dakbU78r886Ta
	YJGZoLwoAo13jThHpWZmjZdLfXvDIzNAisNggK8y32irvWlEyK8ChqaYg98Tidch2rmRxvtGekj
	p1yXMSp2IUHTvcvk0/8xNkC7BIBkSbk+15yQivUo4hV1dBxrMoiXOiGp/h12q6rNYB
X-Received: by 2002:a05:6000:2013:b0:47e:4b03:4909 with SMTP id ffacd0b85a97d-47f4885709cmr7126799f8f.18.1784115859534;
        Wed, 15 Jul 2026 04:44:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f4829896asm14005425f8f.23.2026.07.15.04.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:44:19 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 12:43:24 +0100
Subject: [PATCH v4 11/21] media: imx355: Remove redundant fll_min, and
 implement fixed offset
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-media-imx355-v4-11-f7f966fb9ffd@raspberrypi.com>
References: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
In-Reply-To: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
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
index 879e98b8a8ef..649a6fc9abe9 100644
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

