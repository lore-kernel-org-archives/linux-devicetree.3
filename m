Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304AB46AF33
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 11:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115864; cv=none; b=c/G5DRa+xbuoy9V1YAdpuVr+MMcD5OmqjNDZPfWOHhU8zhzScjQrsYPzGzeGMWdaUbQeAbNjTwGaTdvKxOJDApXEF1mq1C617XEUBow8p1bbYwMlwLZFxIYmkEe1rK+ytxdTZrymC5hWVyui8pKrm19cGqCGaS76Ne3Q5zhfLsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115864; c=relaxed/simple;
	bh=QPSz7fNjipJoxhGgne7N/ewO/88rd81fw6g6fFaqWwY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cGXFEndUvhOLEuuGMCuw1hFHSQEjronbHtM87cKDeDoOJEp6WKQhIYh+9nWm/4FqVnWoU/AIqUOBw0hkaQzzQKilm+Yw9EtxBlS8p1oSnNzenimZT9YDgBacWSqBX/XfvVra9sq/VCMEz3ichq0rOK6hxyHvibt+vA9VKAXv1l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Sqj2KZ4c; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Sqj2KZ4c"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493f75f7172so36747955e9.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 04:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784115860; x=1784720660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Y8stE43huuTKZ9RKy4x8t79KHGScJVKOZ/vGCx6NPU=;
        b=Sqj2KZ4cr18u2A65xn4RFqphwtH0J1o20KhfwemxpO1BLE8aFqySaTCDCZXwrqksOS
         Iy3pKbX+ALjEvb8oq3IEyBeZtiWtmYQDFLuNf+wi2D2zSTGXRZnIbunqu/ovUl2d6dc2
         jwYnkjTbXaKEZTDozkqU+5s1ZJoDWG4fnsz0IWKgWc2M58kLI/Cg8hbbykdnu5xGTAn/
         cn2wqxjlKRJm8BlGLJrTvz2JeT/OvvPvjA21g00J+eQkebmBg9jeAnuakavxDcAs+mJN
         YRCRqx2/+73hcNjpaRvTrQtZY+OvZrkTXfgka0lTlNTIorfkTF7dEhOAkLN1njVAu4Tt
         pmWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115860; x=1784720660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Y8stE43huuTKZ9RKy4x8t79KHGScJVKOZ/vGCx6NPU=;
        b=UhhNn+6HXN9o4u8NEqd5UVQLUeLOxomQh6lPxQz/GTanN79Ue1RhZi4wgGtLoKYGrA
         uf0FnpCrIFOBBRzzFqY8NGbca4AwEJK/ozF3Zxs5WH+cqvJtQ3Fko+Uxl5gwFC7KCAoJ
         uPTETI6ZGj46K4pc6nPLLzzqUCX/iI8ko9iJDHjnYkBPEE6OO+6UHFvXmntd/9MQxufw
         j1JZFy3ekSlYYEK4vGtW9lfnEBDUMVrc80Oj4TkIwVT6eZmaBYwED42+xIWXla06XzIx
         meGmHykKO1VvSoN8wCZCGfZ/F939Y/8gWvl6VDu/Mh+Jacret2V9ZmCoOIqAmeROrK26
         1x+Q==
X-Forwarded-Encrypted: i=1; AHgh+RoUJBI1pXmjDGE+jSrCy8OLvIgclEb569KmprxpYVQVusvQ4fM+iaIB0/vEgn14c2Fpb8mmJESpe0YU@vger.kernel.org
X-Gm-Message-State: AOJu0YyKSAuSJnlkwUKr96IgVCbYUlUAJ66jiM/XXWVZ7gedIYM30+4Z
	m5h16TZYSNrj76qUVW8HhqzC85JuQkpfD6eU7rxHoid5HP36MbHsP9t7cEgQZpvqiAQ=
X-Gm-Gg: AfdE7cnVpw66x85WoojQYMoTU5E0GhoHU3lBJP/VVTfgl6VWoEMpArrDAAc+lllQQLX
	arFzyk5WoOacrbKIGvNcIcgeX+na95wcKpi6yRPIffJYlecPS9KLmzsuRRv89A0bFkoCIWWYRRy
	v9ijWk08hLoCvKuliqAAqBHwrAQCg6rN91lznDkLkohxG+9IDEr9YqlLkhwZZAVHDaUunPfpnn1
	+UVQa3xWdYU8gh82bfaJHT+siq0Nlrx6s3UZWPOEQ3yaEvhn+nM43WCbC/ck4chMt27tSV0pMSI
	c4TrQhaA8pXoX6MqAlfnfJBN2bq3jiny1K0w0exXCCzCF8cig+o8RHmW5rLVgAU289qwtvYRg2f
	dDTArf8SSVPOaW3huRIz3f/ecujGNUfw6CI5k+P66QkCPQnx7wkQoOIly++yNTJQm8xWrIhvn/6
	5BhyZ7EWfKEo5i6lEF0dHQpxL/Y0r7SWE5Tzfpf2E59Xm8qYpF0mB6WuMeK2ihoyJm
X-Received: by 2002:a05:600c:4593:b0:493:cc25:85cb with SMTP id 5b1f17b1804b1-4953c14752amr29475675e9.8.1784115860470;
        Wed, 15 Jul 2026 04:44:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f4829896asm14005425f8f.23.2026.07.15.04.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:44:19 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 12:43:25 +0100
Subject: [PATCH v4 12/21] media: imx355: Add support for get_selection
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-media-imx355-v4-12-f7f966fb9ffd@raspberrypi.com>
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

Provide all the cropping information via get_selection.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 649a6fc9abe9..120eda46d982 100644
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
@@ -849,6 +857,7 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 	struct imx355 *imx355 = to_imx355(sd);
 	const struct imx355_mode *mode;
 	struct v4l2_mbus_framefmt *framefmt;
+	struct v4l2_rect *crop;
 	s32 vblank_def;
 	s64 h_blank;
 	u32 height;
@@ -869,6 +878,12 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
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
@@ -892,6 +907,50 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
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
@@ -1066,6 +1125,7 @@ static const struct v4l2_subdev_pad_ops imx355_pad_ops = {
 	.get_fmt = imx355_get_pad_format,
 	.set_fmt = imx355_set_pad_format,
 	.enum_frame_size = imx355_enum_frame_size,
+	.get_selection = imx355_get_selection,
 };
 
 static const struct v4l2_subdev_ops imx355_subdev_ops = {

-- 
2.34.1

