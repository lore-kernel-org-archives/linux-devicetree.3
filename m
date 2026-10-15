Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B2E369236
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 15:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079882; cv=none; b=l9BddY+LqTMcBhZVJKHqOh+WH1Va6T+QsFUD6N6JFj2SzMBjLaQQHksoRgeVBaAmMPM5h3OcOi78srHCkzGK9/u3idZ5c2lp8Mtpb/nIyWKwnblOStKK9655qwZAIEn1zji4TZm8PAZBxfJq4NgztkeSbQ1wJPiEMH9RLj+TgSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079882; c=relaxed/simple;
	bh=4vyVMLpeAnOFH5/yuEKve2ynKiDTmbNx8gT71nEScyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=baw/LwuvGd3X+oq57JG0AkYLDtL11jKCr4vWLMJKDodfDeQchyBp549JxF1u8wyPcYfCyjaY/Z8iMHTmz37zJjzmim+F6uUBbYfwaRLJSwwOMbDBgpQbptADlLavHh7N9wEWA53CfYAmFFDqDl/rTbG+6Y4QH2EYtWr6xLp2va0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=kimBKrzO; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="kimBKrzO"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a01933b584so47151255e9.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792079862; x=1792684662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bW6VTJYfPLvw/zFo7RnCcLbRhKbz99aJMOdQOJHcatU=;
        b=kimBKrzO72x6NK2U0mdFUupPrQOxQz5n3/SBzKLJ/n7SHlVzWlb1TKzakAak8DAx5a
         +fzCkSQM6J/P0bO0WpAsKVb8VZC2zIeHHC78y915XdQ10mFym1pD1n5AVXh00XFxrBG5
         9HyAoe/gK50zgdjd/0mxFEvLcXWeN3y2nKrk51+E1lc+GudjfncXxhILiLbwRqyOOfco
         M9BWZjc91JxmTY1BSNfJuF8kxugtXhAmw7ZCH3CJa4jN9hL4MlvJrlZlbr/w884PFSY7
         Kt+jO/GcqzXl4jr3AXBo4xKQUQoc77Vb4digIMHFY/qMSbLjUm9dSo1jrw3LN+jh5sQj
         fPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079862; x=1792684662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bW6VTJYfPLvw/zFo7RnCcLbRhKbz99aJMOdQOJHcatU=;
        b=cOyRTZPEK3t4LGOfnSvuwRqYYOlYulzUgnvdJ8GgBtjeLriQwQ1mlxdHI79owb5i/7
         Jluk5AW9paLOQSYdd9DvRkh6qow4zaFOjkNRGYE1yKGpicwTJMY7KkJGVjIVp2oNepVu
         zh6t5T5orEIs/Gw4j5gIWtbjdAV/uxc8EeR+ILOXVeBkkCBiC5jr7uMxLUgsSn/9rBxV
         IMvqIDTk0675l6cOJUoQC+MJGh7WUsnuYoT5ViV8FiiznKbK8JQ92xTTjAmwwqfD0X1G
         6FfN8hlm6/xDaPE2RwXnuVpYohUYks7VhG/IVjgwBpZOh9GTlUddlPzVpJAHQ8ytSjGx
         ewcQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+fFG9ozJzsMy6MC9p/5ND1ohsc3EJdaPcgb8fVQdWp2MDiVYRRH4L8/jvWs3G920kNhvrpc0P4Jlq@vger.kernel.org
X-Gm-Message-State: AFq9FYLHbHSmQMdcdGpZPCoNV44mdQH/KEjcUhGhiEjRgISUi+8C/k1l
	HnTo60gq2u0ffqlAScD3LsibkYzrEIuUq+VbnS022+YZWTihtWlaXzPi15VR/78u1dDREYPm1O8
	pNEGRbtQ=
X-Gm-Gg: AYBFou1P9Bo2Z6z3CLuHTjXs8Zu9qun8PTVabeZStnEWsAgcwZpX+39BHW3IF/f5egi
	VrdFMOONRoCoqK5IH1c0DvL8VfVcFBl7gdnHdxXr9/qGn7Dq4Ubz2+q0w4jGE/RyQpUzDugncLQ
	1KFWr71ADgPy7PScowDgBsA7/vJkWvh9xEwiaAYznqg1ay1g8XBOxxid4n4R2JUhDdEl4GiqqDx
	Aw5rK8ttXZWmHeZZcuKsTLZy2DbPLuuqzc4DpIRPmcZ/kAFy8eD0RFacxVRaOAkFSVD5aGU2LQ2
	GZK59Un865ty8jUxuabzLQMTVYeBtlK08p5O0QEboA+ZxMtq3K91KUZ8oYrGNGUeKdY/ahRAFfM
	dJ/i9DEfnvTjf/VhCXkRQY6baEp7XjiF349qLrBMyIWoMrJyOnfzm6x8ZunuZGyM6SfiAM/qerB
	c/WILXPue27u5IU0mSP1qivfV2ErkAb9/jkfkEM3AS4zf/qKCasH6HwyapmLkM0qqk8ph0VIBnp
	ei9InlW5jcbLMWw+YrZ/PenlbyY7DEHj8uPem7fdEGOYOb7PA==
X-Received: by 2002:a05:600c:83c7:b0:4a1:698d:3044 with SMTP id 5b1f17b1804b1-4a18e493020mr389328665e9.11.1792079861816;
        Thu, 15 Oct 2026 08:57:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm19877251f8f.14.2026.10.15.08.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:57:41 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 15 Oct 2026 16:57:32 +0100
Subject: [PATCH v4 06/16] media: sony-starvis2: Allow runtime control of
 link frequency
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-media-starvis2-v4-6-75fcdb4163f3@raspberrypi.com>
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
In-Reply-To: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
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

DT allows configuration of multiple link frequencies.
V4L2_CID_LINK_FREQ allows read write control.

Join these up so that link frequency can be configured at run time,
as long as the sensor isn't streaming.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 75 ++++++++++++++++++++++++++++-----------
 1 file changed, 55 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 0edb0b4dd25f..02199336010e 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -725,6 +725,7 @@ struct starvis2 {
 	struct v4l2_ctrl *exposure;
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *link_freq;
 
 	/* Track VMAX for exposure updates */
 	u32 vmax;
@@ -755,6 +756,7 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct starvis2 *starvis2 = container_of_const(ctrl->handler, struct
 						       starvis2, ctrl_handler);
 	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
+	const struct starvis2_variant *variant = starvis2->variant;
 	const struct v4l2_mbus_framefmt *format;
 	struct v4l2_subdev_state *state;
 	int ret = 0;
@@ -778,6 +780,25 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 			return ret;
 	}
 
+	if (ctrl->id == V4L2_CID_LINK_FREQ) {
+		u32 hmax = variant->hmax_min_link_freq[ctrl->val];
+		s32 hblank;
+
+		if (starvis2->lane_mode == STARVIS2_LANEMODE_4L)
+			hmax = max(hmax >> 1, variant->hmax_min_pixel_array);
+
+		hblank = hmax * variant->pix_per_clk -
+					variant->active_area.width;
+
+		ret = __v4l2_ctrl_modify_range(starvis2->hblank,
+					       hblank,
+					       starvis2->hblank->maximum,
+					       starvis2->hblank->step,
+					       hblank);
+		if (ret)
+			return ret;
+	}
+
 	/*
 	 * Only apply control values when device is powered on (RPM ACTIVE)
 	 * and streaming (usage count != 0)
@@ -824,6 +845,12 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 		cci_write(starvis2->cci, STARVIS2_REG_WINMODEV, ctrl->val,
 			  &ret);
 		break;
+	case V4L2_CID_LINK_FREQ:
+		/* The STARVIS2_LINK_FREQ_ enums match up with the register */
+		cci_write(starvis2->cci, STARVIS2_REG_DATARATE_SEL, ctrl->val,
+			  &ret);
+		break;
+
 	default:
 		dev_warn(&client->dev,
 			 "ctrl(id:0x%x,val:0x%x) is not handled\n",
@@ -938,9 +965,6 @@ static int starvis2_write_common(struct starvis2 *starvis2)
 
 	cci_write(starvis2->cci, STARVIS2_REG_INCK_SEL, starvis2->inck_sel_val,
 		  &ret);
-	cci_write(starvis2->cci, STARVIS2_REG_DATARATE_SEL,
-		  __fls(starvis2->link_freq_bitmap),
-		  &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_LANEMODE, starvis2->lane_mode,
 		  &ret);
 
@@ -1018,6 +1042,7 @@ static int starvis2_enable_streams(struct v4l2_subdev *sd,
 		goto err_rpm_put;
 	}
 
+	__v4l2_ctrl_grab(starvis2->link_freq, true);
 	return 0;
 
 err_rpm_put:
@@ -1042,6 +1067,8 @@ static int starvis2_disable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		dev_err(&client->dev, "%s failed to stop stream\n", __func__);
 
+	__v4l2_ctrl_grab(starvis2->link_freq, false);
+
 	pm_runtime_put(&client->dev);
 
 	return ret;
@@ -1208,7 +1235,6 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
 	const struct starvis2_variant *variant = starvis2->variant;
 	struct v4l2_fwnode_device_properties props;
-	struct v4l2_ctrl *link_freq;
 	s32 hblank, max_hblank, vblank, max_vblank;
 	u32 hmax;
 	int ret;
@@ -1224,25 +1250,26 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 
 	starvis2->vmax = starvis2->variant->vmax_default;
 
-	hmax = variant->hmax_min_link_freq[__fls(starvis2->link_freq_bitmap)];
-	if (starvis2->lane_mode == STARVIS2_LANEMODE_4L)
-		hmax = max(hmax >> 1, variant->hmax_min_pixel_array);
-
 	/* PIXEL_RATE is fixed and read-only */
 	v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops, V4L2_CID_PIXEL_RATE,
 			  starvis2->variant->pixel_rate,
 			  starvis2->variant->pixel_rate, 1,
 			  starvis2->variant->pixel_rate);
 
-	/* LINK_FREQ is also read only */
-	link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &starvis2_ctrl_ops,
-					   V4L2_CID_LINK_FREQ,
-					   ARRAY_SIZE(link_freqs) - 1,
-					   __ffs(starvis2->link_freq_bitmap),
-					   link_freqs);
-
-	if (link_freq)
-		link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	starvis2->link_freq =
+		v4l2_ctrl_new_int_menu(ctrl_hdlr, &starvis2_ctrl_ops,
+				       V4L2_CID_LINK_FREQ,
+				       __fls(starvis2->link_freq_bitmap),
+				       __ffs(starvis2->link_freq_bitmap),
+				       link_freqs);
+	if (!starvis2->link_freq)
+		goto err_free_handler;
+
+	v4l2_ctrl_modify_range(starvis2->link_freq,
+			       __ffs(starvis2->link_freq_bitmap),
+			       __fls(starvis2->link_freq_bitmap),
+			       ~(starvis2->link_freq_bitmap),
+			       __ffs(starvis2->link_freq_bitmap));
 
 	vblank = starvis2->vmax - starvis2->variant->active_area.height;
 	max_vblank = STARVIS2_VMAX_MAX - starvis2->variant->active_area.height;
@@ -1250,6 +1277,10 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 					     V4L2_CID_VBLANK, vblank, max_vblank,
 					     2, vblank);
 
+	hmax = variant->hmax_min_link_freq[starvis2->link_freq->val];
+	if (starvis2->lane_mode == STARVIS2_LANEMODE_4L)
+		hmax = max(hmax >> 1, variant->hmax_min_pixel_array);
+
 	hblank = hmax * starvis2->variant->pix_per_clk -
 					starvis2->variant->active_area.width;
 	max_hblank = STARVIS2_HMAX_MAX * starvis2->variant->pix_per_clk -
@@ -1285,16 +1316,20 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &starvis2_ctrl_ops, &props);
 
 	if (ctrl_hdlr->error) {
-		ret = ctrl_hdlr->error;
 		dev_err(&client->dev, "%s control init failed (%d)\n",
 			__func__, ret);
-		v4l2_ctrl_handler_free(ctrl_hdlr);
-		return ret;
+		goto err_free_handler;
 	}
 
 	starvis2->sd.ctrl_handler = ctrl_hdlr;
 
 	return 0;
+
+err_free_handler:
+	ret = ctrl_hdlr->error;
+	v4l2_ctrl_handler_free(ctrl_hdlr);
+
+	return ret;
 }
 
 static int starvis2_check_hwcfg(struct device *dev, struct starvis2 *starvis2)

-- 
2.34.1

