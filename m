Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF96947CC8F
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522166; cv=none; b=jrbPFm/mIKJcZcQQmcYfyBSAos4C+KpRTU9TgOQZA9XMcLeRgJzCQD8zFdVRk/h3MzYKdY0OD8M5+M3t38iNdTXfUbAaZL85U28y1GCQTw/rhkQebKtCUzzQVsIUe4l7NzlXfF1EyoiMHYaIQGGkfTfGCt1R36HjymZv9RK2YD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522166; c=relaxed/simple;
	bh=UElEKgx5eHfzk8J2KAJPSWZW6uMMfWtwZrksO9N6Tgw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I2UDH3Aub8JXb/E84T9uPBeiXJ8m7q5FK7x6fzzuNSXPuXIJlAopwe9n2MSTNKoDrL4ElTZwJ5PNQxZK9GsyENaanUOEIHmoosBHHCunJNx7nvzxYedB7rwlVd70oEEpQPej0hXZuUnpHaN4i8j8RnfCICl4Khpns9sDo3dbwoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=g+jz2P4B; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="g+jz2P4B"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493c55d5c7aso8041185e9.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783522158; x=1784126958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8MdvxgOZXywHJMIvMKFBTdmdPZacbqOOXj1fqUFx+10=;
        b=g+jz2P4B5ayBWbaYFt/0zbbaswROo/uLmAM48UQ4DTTRh70I0HHE9MhYOplG1iPhGw
         AXTDLqOEddI0iRn+Nesl3RGJIO33sFZjW80/mhe8Uq5LA+qlcYx8MDxDbyYdrLCcyJTG
         v9SrjaOsujRmXuYsb6lN4gNZYsURrK77i3+fi3/byAqhwnnYWqgRO9D2vnyy+XI4pr2i
         +DaaqTC9ui1xlbcLv34X2680FJU9LtDGHRAv8DNEp9/AqHLFru2cDtvB41FyBXYbu8Fw
         /NtpsOXeGSgAFc3yLGFqabvRUeRw1CU9nye8cOpg5ugWxoXorH0Q7YK9bPH0omu2IiZq
         I0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522158; x=1784126958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8MdvxgOZXywHJMIvMKFBTdmdPZacbqOOXj1fqUFx+10=;
        b=rU8xTV6aUBo0UsIr2YO7yENl6XzPlY7VM3paRtuR9lCeJBLiBq4b16Tgo7KYffjedT
         oE+/ttQdjP1jUPbNStRu3l4HP0lhZVoo+UvAfdQzsRb7pPzLTHr1sfgVXtRvXujd3FUC
         ooPuofFM6cxh2NF8daqSK1KB8B+VaDOnX+vxmonlS22DuEWV/u9wbRd58cMsMBaVLWot
         wq5hzJufXt3s04abRlch2dGjqGfSGd/97Om0QfQZGQjBqhGlZjdKwDkP0qbdTG+YRy1l
         lYx5CJFakSJppT+/N+EfPOUbQEf91pVbt66HlRhIllcRa5AejqCT7IaMF5MFE/7bocA6
         J2aw==
X-Forwarded-Encrypted: i=1; AHgh+RodEcv7rSWSkLX1c8jIyj/C92kEJLR5MMnatYHGJ5AT5jMmTDC2Xi0zHyec94kMx/mbvEp4ukTsThBs@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl2m0/n9/G2jEqPNwVYGH0BWbKujroj8JYtmaIJQy2qsHkSAaf
	ttivcUToHSc1p+o4A3M0VhJnk/HytNGCMvjMNAbo++kq92N/Qo9F3cJZpPFhFvih6nQ=
X-Gm-Gg: AfdE7cnnu9DbDeGn2nEKAU3FFFZw1u9QpNMgwv2UY0FJcw1ZHjzprSF0CVP9VTpcTuT
	jlWkgvrFLNTUxV0rhB+9iC8AqdOtyJu0cVsu9M6nPc/DWCalVAhUQ7M2+5JmNMlFIjsrBS0/0Yn
	Z2bc4CCToJPKxNYMSGR/BxbpnbCw1V5Hff9uz2aql8TmQg9Nx6MnnYz8mrSdJ8dicyx8sdA1e2D
	jxQ2TqM+QBb+MR8L+F67xTMGx+vfKLw+kPeCUvkvcumIN+yvCQF5PL647SCGHZeL700iXV52Kd6
	0taquKNjI11GXEPHwftOjISXA6rc474n8Hq2hKuMaVdTy3nOTVkr2tn/IptYx/3jAjZxVZC2Grs
	3LQyPLXhzh/DtZklycnw8FokQ2mdLacDThN7eAFhT5BL6IlsFsR8p1ClsqmpbxlznkOceakzum8
	SNX9Lj7xFG10pE7gXAt+8bS5KdYb3LWhTci6SvHL8HZIiZod/1f3acmLfIHCzpQNVVIqgbv8vvY
	VI=
X-Received: by 2002:a05:600c:3b10:b0:493:a7fd:15d6 with SMTP id 5b1f17b1804b1-493e689b2d8mr34274405e9.9.1783522158200;
        Wed, 08 Jul 2026 07:49:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm135363315e9.13.2026.07.08.07.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:49:17 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 08 Jul 2026 15:48:47 +0100
Subject: [PATCH v3 11/20] media: imx355: Add support for get_selection
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-media-imx355-v3-11-9df386a623d7@raspberrypi.com>
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

Provide all the cropping information via get_selection.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 59 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index c6f27cf269b4..ee1f41a66a0b 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -86,6 +86,11 @@
 /* number of data lanes */
 #define IMX355_DATA_LANES		4
 
+#define IMX355_PIXEL_ARRAY_TOP		0
+#define IMX355_PIXEL_ARRAY_LEFT		0
+#define IMX355_PIXEL_ARRAY_WIDTH	3280
+#define IMX355_PIXEL_ARRAY_HEIGHT	2464
+
 struct imx355_reg {
 	u16 address;
 	u8 val;
@@ -677,6 +682,7 @@ static int imx355_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	struct imx355 *imx355 = to_imx355(sd);
 	struct v4l2_mbus_framefmt *try_fmt =
 		v4l2_subdev_state_get_format(fh->state, 0);
+	struct v4l2_rect *crop = v4l2_subdev_state_get_crop(fh->state, 0);
 
 	mutex_lock(&imx355->mutex);
 
@@ -686,6 +692,8 @@ static int imx355_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	try_fmt->code = imx355_get_format_code(imx355);
 	try_fmt->field = V4L2_FIELD_NONE;
 
+	*crop = imx355->cur_mode->crop;
+
 	mutex_unlock(&imx355->mutex);
 
 	return 0;
@@ -869,6 +877,12 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 		*framefmt = fmt->format;
+
+		crop = v4l2_subdev_state_get_crop(sd_state, 0);
+		crop->width = mode->crop.width;
+		crop->height = mode->crop.height;
+		crop->left = mode->crop.left;
+		crop->top = mode->crop.top;
 	} else {
 		imx355->cur_mode = mode;
 		/* Update limits and set FPS to default */
@@ -892,6 +906,50 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static void
+__imx355_get_pad_crop(struct imx355 *imx355,
+		      struct v4l2_subdev_state *sd_state, unsigned int pad,
+		      enum v4l2_subdev_format_whence which, struct v4l2_rect *r)
+{
+	switch (which) {
+	case V4L2_SUBDEV_FORMAT_TRY:
+		*r = *v4l2_subdev_state_get_crop(sd_state, pad);
+		break;
+	case V4L2_SUBDEV_FORMAT_ACTIVE:
+		*r = imx355->cur_mode->crop;
+		break;
+	}
+}
+
+static int imx355_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP: {
+		struct imx355 *imx355 = to_imx355(sd);
+
+		mutex_lock(&imx355->mutex);
+		__imx355_get_pad_crop(imx355, sd_state, sel->pad, sel->which,
+				      &sel->r);
+		mutex_unlock(&imx355->mutex);
+
+		return 0;
+	}
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+		sel->r.top = IMX355_PIXEL_ARRAY_TOP;
+		sel->r.left = IMX355_PIXEL_ARRAY_LEFT;
+		sel->r.width = IMX355_PIXEL_ARRAY_WIDTH;
+		sel->r.height = IMX355_PIXEL_ARRAY_HEIGHT;
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
 /* Start streaming */
 static int imx355_start_streaming(struct imx355 *imx355)
 {
@@ -1066,6 +1124,7 @@ static const struct v4l2_subdev_pad_ops imx355_pad_ops = {
 	.get_fmt = imx355_get_pad_format,
 	.set_fmt = imx355_set_pad_format,
 	.enum_frame_size = imx355_enum_frame_size,
+	.get_selection = imx355_get_selection,
 };
 
 static const struct v4l2_subdev_ops imx355_subdev_ops = {

-- 
2.34.1

