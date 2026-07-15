Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C9D450902
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 11:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115862; cv=none; b=ZsYD02yQjyCFDBjZ/w/35uPA5I+t845PM9+UBgOqnEiAmOOzNhcnNkDfe0V2MQLKkARHkDEb4FEJJ6aAj/BuuttI5ella0lSqCFrL90fEMTIvQB2eU+5v4AT+QgW2onWx5fFvSr3Wa6crnC3vzE2nuTGoZo/GKkyhAEln06MeA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115862; c=relaxed/simple;
	bh=fMZKryxQmK9xInKacewLC6J+EQDsnbDnLfr0OntXxwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lnxh1gT+5KVZGHAvskJvvVEJbqvD9IMFYMylMMsEPI2+b/rGS/jIgxw99aemey2SNAOjtNEWeS9DNPqZ4ISu9ZaLd88My4Z24F9I1gfb46TmeNLZDk/9ymFYq0jMP6ejt4qIqnaajt3yF1kjN9Bl7C36ZYasaF0nJLY87zN1oYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=e+lL2Elp; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="e+lL2Elp"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493f60208a5so45347955e9.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 04:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784115859; x=1784720659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NYbwYTOXVK4epL4nJxXsUqEGgL/QA5hnuNFZvu8Ghx8=;
        b=e+lL2Elp3okyMXkSww1nguVWhm+AB0mGIlsoEuEAKhM39ynXeJPlt/sgDde+771pb6
         oje8h2810SCoNsmXlnj660BP2nIB8tIgLPRb9kEAyd3f3mi2lAYYmsc1joQ2Cre7OC68
         WpJQxKFXafOXAYltbXE3fKx1Ubh3KLlH/YOn4EFfV+4ppTLKyKUK1jZQB04HC1pFqNnF
         OVsYCPgEP/xYcwyadsKoEALjO66gxUE8yOYmKqHrkD3DYeD1/0DgHOhQdGGS9NcZtC0E
         jHrlrdojLmUWv/+ngsjFqL9tqKFzDIunwGl9GZAM5LgFjrri0zJTBKMiHLEPPFKnNVyw
         iQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115859; x=1784720659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NYbwYTOXVK4epL4nJxXsUqEGgL/QA5hnuNFZvu8Ghx8=;
        b=YXcTk428OWlsMCnyQ9EZ/Fcj2uSUe4n5ElWzqMdRHXnwvYQDQH1KvlhEdoluZGd5y5
         H1+0lJ5/1rEiuWvEzye3T1PTEtRLRgBRCvi4fV1/59XjuYXYH/KUIdFLkzfVwtg17UYp
         CDbA3heCiKUxyo8SPnaHiSd4avcSAkBbqtMfqZBh7tDPdEvmmeXhSP23ehLYzGCq5x6A
         x5vecTF7fKaXaIvXrqwzapLx2yx4YPf7lLKS+r41UHJ68gGKmAs/zdENYTMNSdkVj8YN
         hoCfsO60+BwvEYOeufgKtUMnivALus4GJwmlGlLpSjpV+/SQOHl9dXnps9/tc9UiCAtH
         HMsQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq53qaLnUXmuvqA3ampHAF3NTVA0DKEY1anWs8Gj1roOr4PIIrue8Bm/rusOH6a4DlXkxDKuF6/DFNJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfprg5/NHhmJHIYmtrWBzGNCti/CAeJTDNP8TAxPRHvMNC5DjM
	tor493/Va0gXmB+IfSkZx2Qlo/eiXZpGkEV1kBs5wQ/64DUjy6qS0cYPa0uM7BPx2Rw=
X-Gm-Gg: AfdE7cnwmcbf56qnwKltYLnz89J3wxcP9KGs4P436m3d54KbL1l7qyr2H6DsLugCgr2
	dHYGBFNzCFQdW/cK4gVy02ZhuyAdNGCITN6N6rJlIKkzt7vIyz0/4yCDm2WrSWBOvLYv3VPIrp3
	nYBMQEpYqvdZ7lAlC96BBhWYB0eTmX2ZxM2q0sCbnl9dKpX5qVbaya9wmyRN4q8+/4i0il1dFm0
	liJs8pkMnPkN2/5EnF+mNzaJuQbm0niuFnQzOeQTl+EH9dBZ+ZCdSU0Vxl092yI4bEwZuBKYm8i
	EsUAvECwWDQqFtnPb9O0emSKwOz9fh+gr3V+x68iDDH6Ma//gUG6IBjg0UvjSef3ss4V2RAeaci
	19IBQFINXIJcZRTzy7ykrc6C/P/pQFxa8W2u18NWdQksXx+FmL9dm95tLAQ2u3Up8/D7x5hgn7j
	YB0v4+EIPwF6LCXxd8/ml9tSgiFQJOn6F8m9SQujUsj4p183rtwSarPOUcEtGeFUYKeEvlcnRNr
	Ig=
X-Received: by 2002:a05:600c:a08e:b0:493:f639:9b2f with SMTP id 5b1f17b1804b1-4953c390347mr28066415e9.39.1784115858714;
        Wed, 15 Jul 2026 04:44:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f4829896asm14005425f8f.23.2026.07.15.04.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:44:18 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 12:43:23 +0100
Subject: [PATCH v4 10/21] media: imx355: pixel_rate never changes, so don't
 recompute
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-media-imx355-v4-10-f7f966fb9ffd@raspberrypi.com>
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

The pixel rate is always the same, so there is no need to try and
recompute it in imx355_set_pad_format, and then no need to have the
pointer to it stored.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/imx355.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index b329da85ddc0..879e98b8a8ef 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -151,7 +151,6 @@ struct imx355 {
 	struct v4l2_ctrl_handler ctrl_handler;
 	/* V4L2 Controls */
 	struct v4l2_ctrl *link_freq;
-	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
@@ -867,7 +866,6 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 	s32 vblank_def;
 	s32 vblank_min;
 	s64 h_blank;
-	u64 pixel_rate;
 	u32 height;
 
 	mutex_lock(&imx355->mutex);
@@ -888,9 +886,6 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 		*framefmt = fmt->format;
 	} else {
 		imx355->cur_mode = mode;
-		pixel_rate = IMX355_LINK_FREQ_DEFAULT * 2 * 4;
-		do_div(pixel_rate, 10);
-		__v4l2_ctrl_s_ctrl_int64(imx355->pixel_rate, pixel_rate);
 		/* Update limits and set FPS to default */
 		height = imx355->cur_mode->height;
 		vblank_def = imx355->cur_mode->fll_def - height;
@@ -1180,9 +1175,8 @@ static int imx355_init_controls(struct imx355 *imx355)
 	pixel_rate = IMX355_LINK_FREQ_DEFAULT * 2 * 4;
 	do_div(pixel_rate, 10);
 	/* By default, PIXEL_RATE is read only */
-	imx355->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops,
-					       V4L2_CID_PIXEL_RATE, pixel_rate,
-					       pixel_rate, 1, pixel_rate);
+	v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops, V4L2_CID_PIXEL_RATE,
+			  pixel_rate, pixel_rate, 1, pixel_rate);
 
 	/* Initialize vblank/hblank/exposure parameters based on current mode */
 	mode = imx355->cur_mode;

-- 
2.34.1

