Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F0852758F
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 15:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904670; cv=none; b=WhLGT/jHIOI+/B0SUbS1AQP/grwYajoUJ1XGDBsL0Js5ntUvDurdtCk4aOVC5lJKqfVD5Vl394xc3QqEKjaLM+EePlj7RaFMBdfL/t3BPEkhWXMbAYmfOGiHvEiiVOrjLIvvAGwgUNnDvR08K0pSta6LYuTCX2m4hzGIgudEUWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904670; c=relaxed/simple;
	bh=RY1WCtr9f/kQLLEeiQXWHIcIdE7FXDNxR49ZFI/S/Rs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NsbPaAgeda0nif3hq+OwlWZx3z30WuAOu8bJmLTgxZyggvpu1DiP/fFjgs2g9W3yBaOINJ7aaKpt15qfsJ77LNPjJy9K5IUQaoESk0m/wJeuPaX1yHebmr0pY0VWe210uauY/SgAUuSPNPmWyRwft2Yxkjc+wGgVN7DLTa7RM1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=tvD7G4VE; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="tvD7G4VE"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48af27fe287so2707460f8f.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1791904666; x=1792509466; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Laec1e1QvQEMFqCIyVMV9FORuIqN9Ff8K+K71ukXvAM=;
        b=tvD7G4VErb3uGRwHhS2XaL1RcytedN5BALSUCe6wVlRzw/5mvF4t+STodhGcwKqKe+
         YHtSXp181Iql5kvXziuuOq9JHzIxLCX098XIjL7g8uZmgDnaPOVwXXqEmBxbWILU0uGb
         OdsWVxkovmp/0F+MBOP0eQxk2br5e+dtDB/nIfcohuHow2d67vxzIrJfmTZWnIpZbXpC
         xj/BWZtoYlzb/f+IxktlKkAG/kDD0+1vBkv9RNQMI7tk+3GQu+tSxLPqJFoZAAtVp/5s
         NprMQcF9EJpl1shbLGl8Zw6zfq76YQJ5zqhTXCLqLLrMepbZCvtYuABYbrYr754HMmwx
         +hRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904666; x=1792509466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Laec1e1QvQEMFqCIyVMV9FORuIqN9Ff8K+K71ukXvAM=;
        b=inzLI8HTQJzwBkSxLPaQ0XLPBAA/8ggA0trICurlQ87rqTQl9oOAdvtlJAbriUu/K7
         rQ1W9QxBujTvT/vIdlLopH+fiHE6T0zwYQeN/EXa2aqZLlAvJdt5ZQ+wEyvCA8o5sW+w
         jD6a9eRo0MAEg5uP5nHtSDuOFFmpZqEBllf139CHo+u/4rIAJYPsedOjbycN4oQ6SLwG
         3/8LNLT03X+L4hLLkKMx1yY9twFRBudp4tmpKkvA30+k3GHq8Jo+GCvaB/xzk0dIZLDp
         5Zejau2l4pqdsGJvt9zbJRZ4hLB6OHz+lGU4wwIhcACYCJZI0aL51XaSeHj9jGtKRaAE
         K8cQ==
X-Forwarded-Encrypted: i=1; AKwUvByGM/nxlm50fSZExxZFikdsu9kIUtjQFo6rbHuTGxdzDBpNs9EGisP1sRnGB7sjfVLO0nizAh9c3nXb@vger.kernel.org
X-Gm-Message-State: AFq9FYLJOcxH/cxng/Ahopx6sP4hUJOYhKoIqSg/4JENaKcGhZ5uuKXE
	q709xnnIpl+PNnTbkGUIjSwUjiAR0YUkoKW01r0TTch2g5AUQ0sUCI1k0HOUPG1se8Q=
X-Gm-Gg: AYBFou1ekXfsp/ilZpNF1Oe3+yfzPi410hnXF0zfJ5C6Gh5xLmzJNLt/MWjqm48ypv8
	1Sz89obAbqfSWxAkxLin52na4e26vG1vsaqpaO2zRBYVaieRVcGDRGpBclgBTBmO1HvfokH4NmH
	NF8HnyWp0IUnTpCiCtE6ry4A53e2tCXCSCPmdU568Yet96ZcO2NEmqhVeTV/u5WIW1PZdnAaS2z
	rOkx5/doFYNiVZgYp1vmjcfw6lM4vn1WNrYoKloI+xEQMLMRbHsMVryI1XgYgZTAhvqiqMIdGY9
	ijnKK5kxzhVPKBdiuT0GbV5KRrbvRw8HXffCE09Nb+bzH/bB0RERQd5aYh939PqwWOy1mIeHnOV
	SVXyvMkO0Zxx61cYxLWmv0of0VNqEK59VyTSsas/HRjBErt/mvAeNdpMXntrpmzJQtmwJzWtRke
	Mp5SgVwhbhbM9LzPKWBKFe4znsHOfA33miwffViYnKC/zZnZP1mejmEqFsiPNtCbCbbOu/Q3MZ1
	gH2eXKwrS84UABmQI7Cgz+4ttY77SjkhdaJwb6i7ECZxaZraw==
X-Received: by 2002:a05:6000:298e:10b0:48c:7f53:9603 with SMTP id ffacd0b85a97d-48dba77d033mr19245755f8f.7.1791904666196;
        Tue, 13 Oct 2026 08:17:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaabb8sm6529743f8f.15.2026.10.13.08.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:17:45 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 13 Oct 2026 16:17:05 +0100
Subject: [PATCH v2 06/13] media: sony-starvis2: Allow runtime control of
 link frequency
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-media-starvis2-v2-6-3670722d250a@raspberrypi.com>
References: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
In-Reply-To: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
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
 drivers/media/i2c/sony-starvis2.c | 62 ++++++++++++++++++++++++++++-----------
 1 file changed, 45 insertions(+), 17 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 66c77c5957e3..2bb438d22ada 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -724,6 +724,7 @@ struct starvis2 {
 	struct v4l2_ctrl *exposure;
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *link_freq;
 
 	/* Track VMAX for exposure updates */
 	u32 vmax;
@@ -754,6 +755,7 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct starvis2 *starvis2 = container_of_const(ctrl->handler, struct
 						       starvis2, ctrl_handler);
 	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
+	const struct starvis2_variant *variant = starvis2->variant;
 	const struct v4l2_mbus_framefmt *format;
 	struct v4l2_subdev_state *state;
 	int ret = 0;
@@ -777,6 +779,25 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -823,6 +844,12 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -937,9 +964,6 @@ static int starvis2_write_common(struct starvis2 *starvis2)
 
 	cci_write(starvis2->cci, STARVIS2_REG_INCK_SEL, starvis2->inck_sel_val,
 		  &ret);
-	cci_write(starvis2->cci, STARVIS2_REG_DATARATE_SEL,
-		  __fls(starvis2->link_freq_bitmap),
-		  &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_LANEMODE, starvis2->lane_mode,
 		  &ret);
 
@@ -1006,6 +1030,7 @@ static int starvis2_enable_streams(struct v4l2_subdev *sd,
 		goto err_rpm_put;
 	}
 
+	__v4l2_ctrl_grab(starvis2->link_freq, true);
 	return 0;
 
 err_rpm_put:
@@ -1030,6 +1055,8 @@ static int starvis2_disable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		dev_err(&client->dev, "%s failed to stop stream\n", __func__);
 
+	__v4l2_ctrl_grab(starvis2->link_freq, false);
+
 	pm_runtime_put(&client->dev);
 
 	return ret;
@@ -1194,7 +1221,6 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
 	const struct starvis2_variant *variant = starvis2->variant;
 	struct v4l2_fwnode_device_properties props;
-	struct v4l2_ctrl *link_freq;
 	s32 hblank, max_hblank, vblank, max_vblank;
 	u32 hmax;
 	int ret;
@@ -1210,25 +1236,23 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 
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
+	__v4l2_ctrl_modify_range(starvis2->link_freq,
+				 __ffs(starvis2->link_freq_bitmap),
+				 __fls(starvis2->link_freq_bitmap),
+				 ~(starvis2->link_freq_bitmap),
+				 __ffs(starvis2->link_freq_bitmap));
 
 	vblank = starvis2->vmax - starvis2->variant->active_area.height;
 	max_vblank = STARVIS2_VMAX_MAX - starvis2->variant->active_area.height;
@@ -1236,6 +1260,10 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 					     V4L2_CID_VBLANK, vblank, max_vblank,
 					     2, vblank);
 
+	hmax = variant->hmax_min_link_freq[starvis2->link_freq->val];
+	if (starvis2->lane_mode == STARVIS2_LANEMODE_4L)
+		hmax = max(hmax >> 1, variant->hmax_min_pixel_array);
+
 	hblank = hmax * starvis2->variant->pix_per_clk -
 					starvis2->variant->active_area.width;
 	max_hblank = STARVIS2_HMAX_MAX * starvis2->variant->pix_per_clk -

-- 
2.34.1

