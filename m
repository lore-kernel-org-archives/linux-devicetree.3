Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C4E47ECDC
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 17:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443996; cv=none; b=XnTWuZdtYFR0fWeQQGfd8fElhVSeTsQW4ol3kf6mehPeMGqGMiYa4O37M2a5TLp6YNH1xe1TQnilQfq0XS1cJRtELShllcEnGkzZcefz2rFiyxL73zX754wXrpeIsze7lYQm9mpCqxnf2jlBQGY63hm6GaYJuEma7OE+FzkxWBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443996; c=relaxed/simple;
	bh=jFOEf19e06M0+Vzxyx5t50uWBqed5Yd4Wz4pvn2g1aM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M5zSQaskSYR9bR+/vqrxmnA87+tkOj7SKLWtr7H5k5HgCJ9mWJsyUp8oq6MApuwu7WrNbYywu0xxDQznGGda1YFlXLf0n543mkJFyklaT1ADRBfAyIWIk1vlaWjhuQUqqHcxyz0PehvJ6EvpYUc2zi+yUGNZYeA0EQIomoBU1o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=po1aQAMN; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="po1aQAMN"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-46ed4f66256so3999640f8f.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 10:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783443992; x=1784048792; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w81rZtSU92dE1ZJ6hHK0rUFmnz6gwlLUnyR4+bLsAV0=;
        b=po1aQAMND2uJesLvjOT1QncpPsW8NHSvJp7CNHlArGmMItb0sAPuz54KgT9QAG52bI
         NKXrS8nZAXrji2J88TX8jKFqqF8Jb3+SOm0zTZ6Q8/Iy0Qk+YJWu0litlJiWbrEikRIL
         F0DJyFcehJ+/PbYezZ3l8vl1szesd2dBAugaR5iIgR9u99cmLz8BAEikpNTpEJG8tjFm
         o2g6p1aMawr95BHRidfA81kUdHrxAjAlDQ5NxOalyHTSh4bIazdWrG65QKe8xIXJPEDw
         eCIaldROtDlHuJVAPAy4CULp51a9r4m0/mhuwhe5G2VfA1YEGxJPJNYMQmrZaL1qHlUL
         EPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443992; x=1784048792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w81rZtSU92dE1ZJ6hHK0rUFmnz6gwlLUnyR4+bLsAV0=;
        b=MBzXP4Tqw50HXeK2lUPHSG2LKDLDZUgJBE5+A4RYWfFi/HRqP0bFV2kSpP24CjfKGD
         rw/i5sYFj29lolvGMiXsSdrvLR0XGb0b/nVg8ORAhEoXOx4NQAhlikV9TineKrl4TGLA
         7mxHqrbTVXcCT7rlUAdIrphKfYVN+SQu7UfUplJtCAwnEM8THZ9LhEMHJt5yRWC+FKXF
         cuPUv5pnPM3R4fvmqg78XBq77bEAia8AjrDqn/702zkvIAqWUdZ1NCu6kZCSsc0KIHX3
         KLx/8NBpr3r4QE1b7tCGKbUOe4x6wSdpd7UDOsFuC6AAoKwVUdjJIGXjt8LoqEgaq5ni
         YIpA==
X-Forwarded-Encrypted: i=1; AHgh+RrLw1VYXiBDg8WVjo1wBHBgHeOGMoZMJwHVYglfiBt/chcEPihotpAhQcCK48o+GJHRqfA/yBCNNVUf@vger.kernel.org
X-Gm-Message-State: AOJu0YxXSOGNfSn+NeEWLmNYi63g1XJ6zAeFQQHAgLvt0G3gu7BKLvaE
	uloOKubhUQm6saYBEPrJlVkFVu97AZ24+6yI/ISOwucGl5rdPKG5UvoPU2le6axH/FI=
X-Gm-Gg: AfdE7cnsRD97ux9cazojTEe+Jc3833Ef3tje9uwfRx2AJXOPciwfAZnZMRu+1ByMvdv
	/5fuCeIxF00h6k3ggyvPgz8R6I9sXlCbRQovb1ZNHjSw15beYdFb3Yk/VfeTJFYMkb4exvJTgvV
	ds0iZ9rVvjHv1+JZRmjqmbe04p24BsBASD0UxAsfbJrF9tRxo46JKLx6ufY7tkYm4CZO65ZG2mv
	Jy4FByzww4rkVuMUPnlGnH1wpTNMN/Sq99dsloowvrQTO6A36LJT7QyVlRfZ4UAheOXLP02wjpZ
	xxt4W4I8Zniauh6sRrkQ3pCyKWzMuXiKzBL0ZWr1ZPVAmy787y806b1QiCHpAV/KL8fHSnluEbs
	8QZ9zKOnuj7au7Zf7Jpxn55MrlOoPRAH+P+b8QHkLTNNEWLm0p2nohapLZBPTxshAlNrqj+DcyP
	X1n/ns7wwJRZwB5dwKv3JujIjbCZiDt1IL+Oell6Wq46SQgS1yahNVUc//KdY3RbR9
X-Received: by 2002:adf:e387:0:b0:475:c578:b619 with SMTP id ffacd0b85a97d-47de6644b64mr5482940f8f.30.1783443992350;
        Tue, 07 Jul 2026 10:06:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm33644487f8f.35.2026.07.07.10.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:06:31 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 07 Jul 2026 18:04:52 +0100
Subject: [PATCH v2 20/20] media: imx355: Remove storing cur_mode in the
 state
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-media-imx355-v2-20-1683ec07b897@raspberrypi.com>
References: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
In-Reply-To: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
To: Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
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
 drivers/media/i2c/imx355.c | 65 ++++++++++++++++++++++------------------------
 1 file changed, 31 insertions(+), 34 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index bb620ebb074f..f31833e5d1d1 100644
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
 
@@ -594,6 +591,8 @@ static int imx355_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct imx355 *imx355 = container_of(ctrl->handler,
 					     struct imx355, ctrl_handler);
+	const struct v4l2_mbus_framefmt *format = NULL;
+	struct v4l2_subdev_state *state;
 	s64 max;
 	int ret;
 
@@ -604,7 +603,7 @@ static int imx355_set_ctrl(struct v4l2_ctrl *ctrl)
 	switch (ctrl->id) {
 	case V4L2_CID_VBLANK:
 		/* Update max exposure while meeting expected vblanking */
-		max = imx355->cur_mode->height + ctrl->val - IMX355_EXPOSURE_OFFSET;
+		max = format->height + ctrl->val - IMX355_EXPOSURE_OFFSET;
 		__v4l2_ctrl_modify_range(imx355->exposure,
 					 imx355->exposure->minimum,
 					 max, imx355->exposure->step, max);
@@ -635,7 +634,7 @@ static int imx355_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_VBLANK:
 		/* Update FLL that meets expected vertical blanking */
 		ret = cci_write(imx355->regmap, IMX355_REG_FLL,
-				imx355->cur_mode->height + ctrl->val, NULL);
+				format->height + ctrl->val, NULL);
 		break;
 	case V4L2_CID_TEST_PATTERN:
 		ret = cci_write(imx355->regmap, IMX355_REG_TEST_PATTERN,
@@ -721,9 +720,7 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 	const struct imx355_mode *mode;
 	struct v4l2_mbus_framefmt *framefmt;
 	struct v4l2_rect *crop;
-	s32 vblank_def;
 	s64 h_blank;
-	u32 height;
 
 	/*
 	 * Only one bayer order is supported.
@@ -748,16 +745,14 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
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
@@ -809,9 +804,11 @@ static int imx355_entity_init_state(struct v4l2_subdev *subdev,
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
@@ -820,25 +817,29 @@ static int imx355_start_streaming(struct imx355 *imx355)
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
@@ -869,7 +870,7 @@ static int imx355_start_streaming(struct imx355 *imx355)
 
 	/* set line length */
 	cci_write(imx355->regmap, IMX355_REG_LLP,
-		  imx355->hblank->val + imx355->cur_mode->width, &ret);
+		  imx355->hblank->val + fmt->width, &ret);
 
 	/* Apply customized values from user */
 	if (!ret)
@@ -1022,11 +1023,11 @@ static int imx355_init_controls(struct imx355 *imx355)
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
@@ -1048,7 +1049,6 @@ static int imx355_init_controls(struct imx355 *imx355)
 			  pixel_rate, pixel_rate, 1, pixel_rate);
 
 	/* Initialize vblank/hblank/exposure parameters based on current mode */
-	mode = imx355->cur_mode;
 	vblank_def = mode->fll_def - mode->height;
 	imx355->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops,
 					   V4L2_CID_VBLANK, IMX355_VBLANK_MIN,
@@ -1242,9 +1242,6 @@ static int imx355_probe(struct i2c_client *client)
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

