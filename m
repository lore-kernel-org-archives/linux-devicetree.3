Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AA548BD57
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522177; cv=none; b=cp2Z0OZP2CilwaFERgpi7R9DP15Dr9kqtROAVRIxZ1YOkhHKIxbyO81/n3DN4TFRyeah+Zpq667Ft7VPI/626mIDhM5aK8qz6MoX3vnFqiFSO0TaZzXNgSxWicbCIaZIfZbQ61i66Bfwt2qZVf4XdXXrSaRjc3XRME9uPDT5mWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522177; c=relaxed/simple;
	bh=V7cfXfus1wMTH8uUlTulTCFw9RvrshHM+7AA6flR5yk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LFjPxoL03eEUQPpiltgcGw0qE41bzDfv/OWqq5Y9CBjO60gpVxIXlWlE4+Kwk5HPObO3O4yQPcPbBrmmog8K74FJjiaFOK/KJb7nzLmhxX4RIT/fgTy3lWshN2ZvV+SLMePShNCdAKkja3y9bGXoDCJlyZhHlQQqZARl9ucERdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=gDL1S+W+; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="gDL1S+W+"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so4455655e9.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783522165; x=1784126965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zYXkUhjNUNGBxpm6qSdNLGjTwbO67Pooqx5qDG7FHec=;
        b=gDL1S+W+kVZMt3oTlU+dVDmIvstHM4u+kj3XUL9GiMAqnNuSfHGNeOUsowcuH4nUvB
         3Qb2vo9O/tLB9WtI2wSPqZSNJofa5SAQYUyENOTtyAx/3H9KJbZv2s3ejkFyAtfQ94Jb
         h54JjGNeJ+ZBSkLT69OBnWp/rJ7v3zm+UBFLkmwpcg1M5PrLQ0/VGxL7TwZZ/HeAe8l4
         wycXegyet3wbNh116hnEJyWtXV7eYeeMObNMUaHWtuRtWWurgj/ZWwaZVwJ1wxaPu6c6
         q6KzFQf29p5SfDWiWYMrBso6qx1gX76aVujBCR+q4LkTqtyq868sb/jw9xUI8ag48wrj
         aJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522165; x=1784126965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zYXkUhjNUNGBxpm6qSdNLGjTwbO67Pooqx5qDG7FHec=;
        b=SBeUSRI0D/9EovtDFI0Dq4r2I128i4GDq5+HWscH278si1uZhmY1NjknDesvd0QyPy
         FhsgS8LyppHT1v/WXjMLYecG7ad5ccYriegy2uTxjh/3zSZezMSx1dRXUhwiJjyWFXBi
         RO4ZBrn2Bv8Ylt4bvW4b9o/pcKbya7/3XFre7DUzlxliPx2gNz5wuoc3TfpyfQgl3s0E
         GSmVqgFHhNCqvjlHysS5TNpTiMWvEM9UlLMiAGeZvCUwUXPfRAuyg/VAVaBBGklZy+ag
         lATTN7syzr63R9479mtWXDd5lWX8YkPgz2eQgNASi3U0o5zMyzV4FpsfVr3TO4piCOCZ
         FgIA==
X-Forwarded-Encrypted: i=1; AHgh+RrfeHRI9Zkt42wL2Z7z3ODsuIihCM2BI00NwAFLZlkgbp2ctqjZZ+6ZSBR2Pac+69cAjnL7F8sff6C+@vger.kernel.org
X-Gm-Message-State: AOJu0YyiG+4OxmcP/L/MNrnvwSXsIwlHvvJyjhTK3idTFTQiNr/JPTAR
	znUsQtxbfDsCnxQSH9dygIHzzoKLvb1/TCPJV1h7JieXkFKfLi9N8sVjIKcpxREVjiC7spXsqSA
	VXgPZ
X-Gm-Gg: AfdE7clf+nAbfRbG7kp+9Nx4/i6XSIkoBtCzGzM0BPknNRxPS3n6Pv7FZCw8ufy+Qu4
	/V+vdMIWMRVQDz+IgiaDvLzaRGyAlgMlQCw8TUDWgsepwdtO+7RUJBAV3LAJy4zaEFvaL2wKF6e
	WDM1/hVtOc3Xylbl6Djos7xq+FJG4yZERIxiyjJy/6xR/cLY8OMBPuRn+Mgy1YHWwv36lj1Z+ZK
	bmZre10AJGO/K/musokUWy5GwufAETHPEid2a2wE61lGLOr30T2rR6r48yE24OSftI6VDRcG4tj
	WOtuPQ/Hv7gQb4BnqQgwrfT3FvioxPJxpwD2qB+AFmfcpmm+9aSGh8GkBCmcx02Z8dfHatd8oBy
	6dNnlaNap/UEoCkf3us2LZIapdqp0pACJQhT4lcpnWNM41/t5xYB+fy2EhdNXs82QHo23Uxe22B
	eVRJkZm+F3cPAvnjCRi5VwYtAR+s3NWbxPnL8P/SYO6VkhJWDNcud/kq4g9tPdN3DZ
X-Received: by 2002:a05:600c:528c:b0:493:d21f:8f98 with SMTP id 5b1f17b1804b1-493e68de964mr30032775e9.36.1783522165093;
        Wed, 08 Jul 2026 07:49:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm135363315e9.13.2026.07.08.07.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:49:24 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 08 Jul 2026 15:48:56 +0100
Subject: [PATCH v3 20/20] media: imx355: Remove storing cur_mode in the
 state
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-media-imx355-v3-20-9df386a623d7@raspberrypi.com>
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

All the information for the mode is now stored within
the subdev state, so configure the sensor based on that.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 66 ++++++++++++++++++++++------------------------
 1 file changed, 32 insertions(+), 34 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index ee012efe25bf..8e5eb5998591 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -173,9 +173,6 @@ struct imx355 {
 	struct v4l2_ctrl *vflip;
 	struct v4l2_ctrl *hflip;
 
-	/* Current mode */
-	const struct imx355_mode *cur_mode;
-
 	struct imx355_hwcfg *hwcfg;
 	const struct imx355_clk_params *clk_params;
 
@@ -607,7 +604,7 @@ static int imx355_set_ctrl(struct v4l2_ctrl *ctrl)
 	switch (ctrl->id) {
 	case V4L2_CID_VBLANK:
 		/* Update max exposure while meeting expected vblanking */
-		max = imx355->cur_mode->height + ctrl->val - IMX355_EXPOSURE_OFFSET;
+		max = format->height + ctrl->val - IMX355_EXPOSURE_OFFSET;
 		__v4l2_ctrl_modify_range(imx355->exposure,
 					 imx355->exposure->minimum,
 					 max, imx355->exposure->step, max);
@@ -638,7 +635,7 @@ static int imx355_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_VBLANK:
 		/* Update FLL that meets expected vertical blanking */
 		ret = cci_write(imx355->regmap, IMX355_REG_FLL,
-				imx355->cur_mode->height + ctrl->val, NULL);
+				format->height + ctrl->val, NULL);
 		break;
 	case V4L2_CID_TEST_PATTERN:
 		ret = cci_write(imx355->regmap, IMX355_REG_TEST_PATTERN,
@@ -724,9 +721,7 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 	const struct imx355_mode *mode;
 	struct v4l2_mbus_framefmt *framefmt;
 	struct v4l2_rect *crop;
-	s32 vblank_def;
 	s64 h_blank;
-	u32 height;
 
 	/*
 	 * Only one bayer order is supported.
@@ -750,16 +745,14 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 	crop->top = mode->crop.top;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		imx355->cur_mode = mode;
 		/* Update limits and set FPS to default */
-		height = imx355->cur_mode->height;
-		vblank_def = imx355->cur_mode->fll_def - height;
-		height = IMX355_FLL_MAX - height;
 		__v4l2_ctrl_modify_range(imx355->vblank, IMX355_VBLANK_MIN,
-					 height, 1, vblank_def);
-		__v4l2_ctrl_s_ctrl(imx355->vblank, vblank_def);
+					 IMX355_FLL_MAX - mode->height, 1,
+					 mode->fll_def - mode->height);
+		__v4l2_ctrl_s_ctrl(imx355->vblank, mode->fll_def - mode->height);
+
+		h_blank = mode->llp - mode->width;
 
-		h_blank = mode->llp - imx355->cur_mode->width;
 		/*
 		 * Currently hblank is not changeable.
 		 * So FPS control is done only by vblank.
@@ -811,9 +804,11 @@ static int imx355_entity_init_state(struct v4l2_subdev *subdev,
 /* Start streaming */
 static int imx355_start_streaming(struct imx355 *imx355)
 {
-	const struct imx355_reg_list *reg_list;
+	const struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_subdev_state *state;
 	const struct imx355_mode *mode;
 	int lane_idx = imx355->hwcfg->num_lanes == 4 ? 0 : 1;
+	struct v4l2_rect *crop;
 	u64 link_bitrate;
 	u8 binning_mode;
 	int ret = 0;
@@ -822,25 +817,29 @@ static int imx355_start_streaming(struct imx355 *imx355)
 	cci_multi_reg_write(imx355->regmap, imx355_global_regs,
 			    ARRAY_SIZE(imx355_global_regs), &ret);
 
-	/* Apply default values of current mode */
-	mode = imx355->cur_mode;
-	reg_list = &mode->reg_list;
-	cci_multi_reg_write(imx355->regmap, reg_list->regs,
-			    reg_list->num_of_regs, &ret);
+	/* Apply values of current mode */
+	state = v4l2_subdev_get_locked_active_state(&imx355->sd);
+	fmt = v4l2_subdev_state_get_format(state, 0);
+	crop = v4l2_subdev_state_get_crop(state, 0);
+	mode = v4l2_find_nearest_size(supported_modes,
+				      ARRAY_SIZE(supported_modes),
+				      width, height, fmt->width, fmt->height);
+	cci_multi_reg_write(imx355->regmap, mode->reg_list.regs,
+			    mode->reg_list.num_of_regs, &ret);
 
 	/* Set readout crop and size registers  */
-	cci_write(imx355->regmap, IMX355_REG_X_ADD_START, mode->crop.left,
+	cci_write(imx355->regmap, IMX355_REG_X_ADD_START, crop->left,
 		  &ret);
-	cci_write(imx355->regmap, IMX355_REG_Y_ADD_START, mode->crop.top, &ret);
+	cci_write(imx355->regmap, IMX355_REG_Y_ADD_START, crop->top, &ret);
 	cci_write(imx355->regmap, IMX355_REG_X_ADD_END,
-		  mode->crop.width + mode->crop.left - 1, &ret);
+		  crop->width + crop->left - 1, &ret);
 	cci_write(imx355->regmap, IMX355_REG_Y_ADD_END,
-		  mode->crop.height + mode->crop.top - 1, &ret);
-	cci_write(imx355->regmap, IMX355_REG_X_OUT_SIZE, mode->width, &ret);
-	cci_write(imx355->regmap, IMX355_REG_Y_OUT_SIZE, mode->height, &ret);
+		  crop->height + crop->top - 1, &ret);
+	cci_write(imx355->regmap, IMX355_REG_X_OUT_SIZE, fmt->width, &ret);
+	cci_write(imx355->regmap, IMX355_REG_Y_OUT_SIZE, fmt->height, &ret);
 
-	binning_mode = ((mode->crop.width / mode->width) << 4) |
-			(mode->crop.height / mode->height);
+	binning_mode = ((crop->width / fmt->width) << 4) |
+			(crop->height / fmt->height);
 	cci_write(imx355->regmap, IMX355_REG_BINNING_MODE,
 		  binning_mode == 0x11 ? 0x00 : 0x01, &ret);
 	cci_write(imx355->regmap, IMX355_REG_BINNING_TYPE, binning_mode, &ret);
@@ -871,7 +870,7 @@ static int imx355_start_streaming(struct imx355 *imx355)
 
 	/* set line length */
 	cci_write(imx355->regmap, IMX355_REG_LLP,
-		  imx355->hblank->val + imx355->cur_mode->width, &ret);
+		  imx355->hblank->val + fmt->width, &ret);
 
 	/* Apply customized values from user */
 	if (!ret)
@@ -893,6 +892,7 @@ static int imx355_stop_streaming(struct imx355 *imx355)
 static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct imx355 *imx355 = to_imx355(sd);
+	struct v4l2_subdev_state *state;
 	int ret = 0;
 
 	if (enable) {
@@ -904,7 +904,9 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 		 * Apply default & customized values
 		 * and then start streaming.
 		 */
+		state = v4l2_subdev_lock_and_get_active_state(sd);
 		ret = imx355_start_streaming(imx355);
+		v4l2_subdev_unlock_state(state);
 		if (ret)
 			goto err_rpm_put;
 	} else {
@@ -1024,11 +1026,11 @@ static int imx355_init_controls(struct imx355 *imx355)
 {
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl_handler *ctrl_hdlr;
+	const struct imx355_mode *mode = &supported_modes[0];
 	s64 exposure_max;
 	s64 vblank_def;
 	s64 hblank;
 	u64 pixel_rate;
-	const struct imx355_mode *mode;
 	int ret;
 
 	ctrl_hdlr = &imx355->ctrl_handler;
@@ -1050,7 +1052,6 @@ static int imx355_init_controls(struct imx355 *imx355)
 			  pixel_rate, pixel_rate, 1, pixel_rate);
 
 	/* Initialize vblank/hblank/exposure parameters based on current mode */
-	mode = imx355->cur_mode;
 	vblank_def = mode->fll_def - mode->height;
 	imx355->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops,
 					   V4L2_CID_VBLANK, IMX355_VBLANK_MIN,
@@ -1243,9 +1244,6 @@ static int imx355_probe(struct i2c_client *client)
 		goto error_power_off;
 	}
 
-	/* Set default mode to max resolution */
-	imx355->cur_mode = &supported_modes[0];
-
 	ret = imx355_init_controls(imx355);
 	if (ret) {
 		dev_err(imx355->dev, "failed to init controls: %d", ret);

-- 
2.34.1

