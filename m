Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA08E30F7FF
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 15:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079896; cv=none; b=ta3ME7IYX1kqvVl7cZD1xnFcSjeViYWr48Jljcv23KAv00HPKK+578lBd5rkdjY3YB9Mhl1qN9M//nJRZpHyjOCxw9Nf1enfNoSQJ35j0V3DoeQpkZvT03hXawFJ/V/zyCX8VLcO01ZUYev2Kxv2fUYAI9aHObneaUMmbinNzVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079896; c=relaxed/simple;
	bh=WFwaN6l1InwHpWmro44GXUpQlmOi9SBBR9O6QCn2b80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bZxPwgA43nhvDe3hYob85rWXzR2zekF9h/CirCeZDvooTUiuS5KLbo9Lcr8hx7JVVrx968WnLSDLFDgnjS4ko0cN8pta/Z30n+zZVYQK147aT6hC3W7sSyIob9QU81gHg4yKM3fvUZOdPcpHeRGGp5z4ZEV6J32rxTaMMV+ZykU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=oO1X54ql; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="oO1X54ql"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c4649b35bso599566f8f.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792079872; x=1792684672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3In2oOWO8+3UsZU5x8EvcHjp1PcydHDNy8dPtqhayIc=;
        b=oO1X54qlBQAugab6birvpc0WKJW3ShbgET9LTlM/MMM+d2UooQcVkzUbsmM67Ri2Aw
         Gq/zSt/EPdX1rUoQGWCK0xWYJ1oGY4fksbfzAq4z76BYkGKmRI5nc1J+gRKOlSLFLyzV
         2CqklgOR/JR9+cYu7aGBTxvB351yP3OKhpQybtc06VK3/8+aEydgWLfzldvr5sH9cV6I
         oCM4Utbv/HSuM6c/60QC03tRJDTT33YcQ2d9MX+XcOS8Gu5JNCujhXoIdmzUpq6DjOLw
         DMUC6Zd5x818uGYVSw7MrsxCVNiKXqi00hGPdU1SRgAHXvigVwpQY0vadKa6/DTsKG95
         xYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079872; x=1792684672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3In2oOWO8+3UsZU5x8EvcHjp1PcydHDNy8dPtqhayIc=;
        b=GD9J3Ac9lMSwU+JiLocZMyiFjUA8D6ES+gui0tv+Oag8uFLRw/oKk/omEEeIYk7Xef
         rOXH95mRpJFlXfucqbt1LgfYbZU2j0LadS7sTWMKlvPLlVOc2/D66ZZTcLGFg0siGMya
         RhHljCmFOsOWRhL37YBPS/4MBGfIB0gXclsPdmkOKHlloFr2/l3+wtDioAVFqWD/HDkB
         4MCAMvMxxuCJW3T0QPE+7z5eu2tla1U08aHXcBNmtayK9s22e6f4zR2o44S+mEMDSkKx
         lhTRmXoPDvrHsVbM+EmcIVlLiMjdzdn4/oB93iltgSfPLaEpqNvfO4YORVd84ztW24jG
         SqqA==
X-Forwarded-Encrypted: i=1; AKwUvBywG3gTmudG01FWnO9R3r0H1zSD4jBDyjHdvCb1HPninsVD3puGo6ET3jPL7/HmMB9w169pHPv84Xnm@vger.kernel.org
X-Gm-Message-State: AFq9FYKUPbCbgI/h4pciqnaDOSqgsIofopXdAW/RhzAOVSTspaDsK3H4
	l9cSqo5vZGQlzxWckKX3OqoQrszJJgyvsjT7vginPf3SQ069Z46XtYgBar6oOeelTAU=
X-Gm-Gg: AYBFou0DBlhA+hejlMr+JhgfcSFZljw+dQnEk1XMV/yc8uV+FpXnPjqmezb2lNjAr46
	eU+EPXlpIwGnd/HPNTs9e9Ag5oaePkNw0AUfjYQN4Is1UiAbZF8JtW9JcCJk0boHnMkIILT95VH
	7dNMd0HyXkEuDAqZS/5PhOsXwhQpCNT0RmNb/HxQDn5qrhoCAe2XLKZCkU0x9+slBZzgyA/x7+E
	T4GpJECnqLiV1KCuHT1BAvLs9FZl7rudEjgiIxjf9Pem5XY8mGzozzJ1AT4izrFaCkqaUex01cJ
	ib8xGyVOFrL9CAHXelDVebckX75IHE7LYE9Y04c7g0vB93VNcrZTJ3uUvJvS5v5SWSCulth73HJ
	StXuw7hwJcGagPeOuQ5cbb0Eg7M7OE7Z4lWutY+r+kuAWEKXVrx3ectpPFozJ0FfPllgZ4u7+bT
	/nVMikhsf3rRX/p14P9AWSCDTsMp1PYkdKqWKDU8DMzbdWSY1v+0iv/mZiLABSGqzl5Qb7iDPpW
	LE/xmWxj5UCOQeVj7Iy2xAA6wLiHmRwnTNt4WKUOMvkYHI39A==
X-Received: by 2002:adf:e183:0:b0:487:490:8391 with SMTP id ffacd0b85a97d-48dbaadd94cmr38049648f8f.16.1792079871811;
        Thu, 15 Oct 2026 08:57:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm19877251f8f.14.2026.10.15.08.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:57:51 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 15 Oct 2026 16:57:41 +0100
Subject: [PATCH v4 15/16] media: sony-starvis2: Parameterise exposure min
 and step
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-media-starvis2-v4-15-75fcdb4163f3@raspberrypi.com>
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

All the Starvis2 sensors supported to this point have specified
the range for the SHR (exposure) register as being 4 to
(number of line per frame -1).

Newer sensors are deviating from that, so parameterise
these into the sensor variant, replacing STARVIS2_EXPOSURE_MIN,
STARVIS2_EXPOSURE_STEP, and STARVIS2_SHR_MIN.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 37 ++++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 8585f5c93dc2..5f360f557671 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -67,11 +67,8 @@
 
 /* SHR internal */
 #define STARVIS2_REG_SHR                  CCI_REG24_LE(0x3050)
-#define STARVIS2_SHR_MIN                  4
 
 /* Exposure control */
-#define STARVIS2_EXPOSURE_MIN             1
-#define STARVIS2_EXPOSURE_STEP            1
 #define STARVIS2_EXPOSURE_DEFAULT         1000
 
 /*
@@ -640,6 +637,9 @@ struct starvis2_variant {
 	unsigned int vmax_default;
 	const u16 *hmax_min_link_freq;
 	u16 hmax_min_pixel_array;
+	unsigned int exposure_min;
+	unsigned int exposure_step;
+	unsigned int shr_min;
 };
 
 static const struct starvis2_variant imx678_variant_def = {
@@ -666,6 +666,9 @@ static const struct starvis2_variant imx678_variant_def = {
 	.vmax_default = 2250,
 	.hmax_min_link_freq = imx678_min_hmax_2lane,
 	.hmax_min_pixel_array = 550,
+	.exposure_min = 1,
+	.exposure_step = 1,
+	.shr_min = 4,
 };
 
 static const struct cci_reg_sequence imx662_common_regs[] = {
@@ -796,6 +799,9 @@ static const struct starvis2_variant imx662_variant_def = {
 	.vmax_default = 1136,
 	.hmax_min_link_freq = imx662_min_hmax_2lane,
 	.hmax_min_pixel_array = 990,
+	.exposure_min = 1,
+	.exposure_step = 1,
+	.shr_min = 4,
 };
 
 static const struct cci_reg_sequence imx675_common_regs[] = {
@@ -983,6 +989,9 @@ static const struct starvis2_variant imx675_variant_def = {
 	.vmax_default = 2024,
 	.hmax_min_link_freq = imx675_min_hmax_2lane,
 	.hmax_min_pixel_array = 528,
+	.exposure_min = 1,
+	.exposure_step = 1,
+	.shr_min = 4,
 };
 
 static const struct cci_reg_sequence imx832_common_regs[] = {
@@ -1076,6 +1085,9 @@ static const struct starvis2_variant imx832_variant_def = {
 	.vmax_default = 1136,
 	.hmax_min_link_freq = imx832_min_hmax_2lane,
 	.hmax_min_pixel_array = 990,
+	.exposure_min = 1,
+	.exposure_step = 1,
+	.shr_min = 4,
 };
 
 struct starvis2_model_info {
@@ -1247,12 +1259,15 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 		starvis2->vmax = format->height + ctrl->val;
 
 		current_exposure = clamp_t(u32, current_exposure,
-					   STARVIS2_EXPOSURE_MIN,
-					   starvis2->vmax - STARVIS2_SHR_MIN);
+					   starvis2->variant->exposure_min,
+					   starvis2->vmax -
+						starvis2->variant->shr_min);
 		ret = __v4l2_ctrl_modify_range(starvis2->exposure,
-					       STARVIS2_EXPOSURE_MIN,
-					       starvis2->vmax - STARVIS2_SHR_MIN,
-					       1, current_exposure);
+					       starvis2->variant->exposure_min,
+					       starvis2->vmax -
+						starvis2->variant->shr_min,
+					       starvis2->variant->exposure_step,
+					       current_exposure);
 		if (ret)
 			return ret;
 	}
@@ -1775,10 +1790,10 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 
 	starvis2->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops,
 					       V4L2_CID_EXPOSURE,
-					       STARVIS2_EXPOSURE_MIN,
+					       starvis2->variant->exposure_min,
 					       starvis2->variant->vmax_default -
-					       STARVIS2_SHR_MIN,
-					       STARVIS2_EXPOSURE_STEP,
+						starvis2->variant->shr_min,
+					       starvis2->variant->exposure_step,
 					       STARVIS2_EXPOSURE_DEFAULT);
 
 	v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,

-- 
2.34.1

