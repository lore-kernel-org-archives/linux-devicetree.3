Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C865C47DFAF
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 11:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115873; cv=none; b=b/FY10KSUH37fOsBskz8pUDSDNVg5B0FkrGCYh7eBu//vU6sX2/9MtuiJJy7YMC2pWYmPVtJX2FJzlm270c+guXlatF+K+6UAKkF6kXAMmiu+oiMuBFw7fRhQHMi7jd/9D9b71VUdMreRmZiq3QKgFp3OMuLULTAi95TNg7jloU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115873; c=relaxed/simple;
	bh=mfwE1jS44P0uqg4CKploF2o77CG8x0RmlqjldJ8mKfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m+FL2OwkZEsftR8OjC0NKv6rM5EUstpxN1e0nRJPV5kPa89eXuAKHx0X6XdLvwJfMp3sj/2UxIWWCNf4Jmu3fbZ1XY0AYaUiuIBMMqS0Yv5ks/1xi0+3nwoFqDK/A+Dnus6E2VaJWn6QIMxvppIk0vIHr4SS6+NivQ1QTyAH9CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=jk+nrJwx; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="jk+nrJwx"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47dec32798aso5512137f8f.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 04:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784115869; x=1784720669; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xH4qi8mC8sbk2Ii8u4ToEy3cMhSAHSqVasTCYHLS6qA=;
        b=jk+nrJwxmFOaA1nGei4O/GXhgaMIBfeE7nxK1YKqxPvR/2PMIRlS2IJ2lQ+THnVTdY
         HrMyb4z3xdoakpJzQZKmdZRDaiNlKLjEIpZXc6UxmhdeZ1TjKvW51gY8qDmEhtLZg9K5
         w1+e5Ust7deOv/p2WE4xyBL03ad45kLAFo3RXRWvb9wX5ewr6k/Z8dnk0R+GFGCDzNsv
         vzQBkkpFyoLZ5WniNnr+Q+7MHQfPuAuQK4i6m+cmwNw5Xarfs2FTTy8OXseAQ7ZvSiT3
         msKDJ7Kpe7icRb4FhO0fblpDQJ11RdSrhyIiF2RMldG7VHPUGjO0cIV1Rog1g+03I70a
         tC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115869; x=1784720669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xH4qi8mC8sbk2Ii8u4ToEy3cMhSAHSqVasTCYHLS6qA=;
        b=H1/wfXmQfkrzFRnwvSOOG8/lN6nAu4W3DncxVJl57T9XKh67X+yXqiK3CyH2oZ0oP6
         ZFwyBrWEgSNSHeHBgl4ukC6PYcgfur2srL14TjTGC9/cqDH1Krr3I3WMBYoMFrfNwKSn
         2AqgiKtJ3nl405K0gSDy33Vsebb+cLtmSqnGKxph5PppaYF62ngiVUtOgW9nCsuOhY4+
         Yk/Em5QfxOviTTARR2XRN0KPxfFAGYRjpU7uNUL0EynT+J5WfxTgTGlJ4tTAMT3KN5T9
         WeiLVvflWnR31Su8urCokQf9HEuBlsh4rDwY/Fr3jAU8aedfAz2M1Sxs1336NCLysJII
         vPlQ==
X-Forwarded-Encrypted: i=1; AHgh+RolK8NmwwjJ7YpbxFbD53sqAHI4/j2K4YMn1HoERlJeZoREHG3QWUoxBB9oyr6hr4tui9sNiC7ro5SY@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzt71bSBNrL2RPVKX6IlWgaQvdKCMwW4tvu7o84DZXwObkb2N6
	HUeXvIqG0R9swdAZCtrsM6hrOBHIvXBxqiE1sG8ZvGZZzapCVR2wegVzP0r/3Z3dp7Y=
X-Gm-Gg: AfdE7cmCW0FPpXK8JIuKWOBybvexGFBTNgx6zOXjQDooT4VKMX05F/KPyn3jeputm71
	oCJFpJDctnMnebQDc91sqOzLTINRPxUe/wWok+osztKJSjtlEOAfUz6JksMFNTUV9yYgO7DF3Sq
	fjjkXlyKbZf6crWB/lAAZdFvL3vwFpR1sDn83/vQX6I59bXHSDeDQg2STqppmHrTleVV7TwkVJG
	dqrQ54tSJ3yh5yZsm7UITiWvqfiEihA7VIVaZD5E6sh2Zu9XITQuUwOwnbiQoUz9JG71PemsMwC
	cUUNmTobDV1ZpSnU4Gm6zkXqJHLd6NF5sFv3G/pNRrBXW8x/ljACkGvjQQSzAf1lfeo4P9I1WPB
	F/q6aYLqjAYf9pfb/4nQu3XQ3QiPtX+1RGiuUT7wB7PuRl3UQMKkAr1imSCSxoInMsdgXfu8qMN
	SLLTTFzHPwnVqGH0+kA8oshRt/FtliDhrFrqJ96fN2fuNMLUvcd8Up6atQ3hc5BxBv
X-Received: by 2002:adf:e011:0:10b0:47f:53b8:4e70 with SMTP id ffacd0b85a97d-47f53b84e90mr525804f8f.55.1784115868841;
        Wed, 15 Jul 2026 04:44:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f4829896asm14005425f8f.23.2026.07.15.04.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:44:28 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 12:43:34 +0100
Subject: [PATCH v4 21/21] media: imx355: Remove storing cur_mode in the
 state
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-media-imx355-v4-21-f7f966fb9ffd@raspberrypi.com>
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

All the information for the mode is now stored within
the subdev state, so configure the sensor based on that.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 63 +++++++++++++++++++++-------------------------
 1 file changed, 29 insertions(+), 34 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 97f4594f7ed9..8eb8588cb71b 100644
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
@@ -1031,11 +1030,11 @@ static int imx355_init_controls(struct imx355 *imx355)
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
@@ -1057,7 +1056,6 @@ static int imx355_init_controls(struct imx355 *imx355)
 			  pixel_rate, pixel_rate, 1, pixel_rate);
 
 	/* Initialize vblank/hblank/exposure parameters based on current mode */
-	mode = imx355->cur_mode;
 	vblank_def = mode->fll_def - mode->height;
 	imx355->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops,
 					   V4L2_CID_VBLANK, IMX355_VBLANK_MIN,
@@ -1250,9 +1248,6 @@ static int imx355_probe(struct i2c_client *client)
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

