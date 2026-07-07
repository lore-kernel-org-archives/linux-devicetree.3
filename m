Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7CF426D0B
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 17:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443991; cv=none; b=BhphyfocnA3w7czc4dRddOLYOP+48cMi9wAVoy2Iey4R0wFU8MgBS7C3Ffhsw2x5tuCgvXO31ULR45xkhca9AqSn7/dOHCcSHq2qK7bugeeQ2r6yVYdIJTpWBtMCvipBVSE1s11RGtttG4zFD8+Y1wjllZ94KfVSJU8gKmgidLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443991; c=relaxed/simple;
	bh=pL9+Gp3HHNJUFJ9I1yxkiyYvcmYZWduBQ35yDMHh86M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u717SQw9xJDb9C0+VW16PzkI1QC4WRfkcBcH97yGjkCIgTq4/KaWBfdS+bFFmB29u5HEPiep58fop+UTTrT+3efQwk5pzwGaF/IYI4ypEi7wAq/7VYQztJM8rqVHPaLWcqGuC6jny5notOhRqDipKfElA/fBSRq9o1UlT4xpyUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Vu15L3wr; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Vu15L3wr"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493b61b52b6so33057385e9.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 10:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783443988; x=1784048788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0AxQnxP8jSm74fXyluLhSPK0fT8u8cFN7trYTCmlKjE=;
        b=Vu15L3wr/OwrRR3Ew+6qkVwHs/OU8q8ZbpOcdwGnSYahSaiuGKHz58XkcY9ikTcUGC
         tnKZ2R+CS67yrhAjxvsd+susmb+pD8Pw8sTlrfpuFVQt8pi/ldsXItXYmRF6FieSYqK6
         5OBz3QoKqY+aMoYRv/xJhkkKXavM8ezmbGkSHlrzOEQRGXT/TGxvxidnQ0JNEylAs8b5
         2WiXQSRVK+NoVW0tr7bfqzRVoJ1zGJSGcZbnVL+fBWb3NfANeGuoDm2SlylJy4GM/7VW
         3GLm/aJnoACIv4flrzUAxNqSyhNCuCO+r8JWj/ky2GOBcIFRVojaVqbB+TiAfq47gLaU
         pYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443988; x=1784048788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0AxQnxP8jSm74fXyluLhSPK0fT8u8cFN7trYTCmlKjE=;
        b=mBJuyRH49itn51ACR52rPFNW4GXbEq9mHIfyREDldnQqaTJcSIWpGDaIL4XET51ASj
         7nvTNaRMZ70lfRsTvyTKDN9RW1hfunLo+6GHx926Zq7zAxwLBdBv/r7rXgbx3CjLMBHF
         ZqbcXPq/bV6MXKhPtjqGLvPu5625otFgfNYTRo3hPo9ZdmpQ8CiudI0UP5SNHFSZ0Aje
         W9gfgq8SWPGKq3IEyX4gEQqy+2rALsrk9WCQOgGcwBJRv5jjAwAu38vQIkNWlcvCWZGk
         kvFhGghQt7RCPyLcy42Y72sf9rgKFOn54z3Hoc/fiE4FAanL9grc9lwasttNTyU42KVE
         dBpg==
X-Forwarded-Encrypted: i=1; AHgh+RrlcM+68VXdXpJczymnZNJuJUvUxn7VBGHOiebv4/Rw92hYD/DIzaUqFNG8Ih5+TGPdOn0MhlexWFwM@vger.kernel.org
X-Gm-Message-State: AOJu0Yxaf/cD54oxfE7UpwPwMaOMAMowkVycYLbvLaiJUPj+c3R2e1om
	sD6Q8xK3Wans9Pheor31+fCwGVNGyTn+0l11og3/5AngutCJN+Pogpw94eGBsvcowvI=
X-Gm-Gg: AfdE7clL8/OzhLOTsI09bwltJlGHn1B+qQnU6a7B4fDvFCNmJZeCWfHrxfRLyxuiHeX
	YgU3Xho8BsmGbDMCz2rWXnxmFQjVF/3wUG/LbFan3CuDokWWEHwDKpGt1q9Mgd2O6ovRoZvortV
	O228TpxpFDmQR4q/KCYwe5ldkAPXHdKTSvqEwQhE6c0zOQNQAvVvK1xoIpRCmaHS+0sZur7ung0
	GvGQO6XocyROhtwKn6x3FmBZ9p3+rocDhY3OePqoRDIDiie/De6YQosnpJuePp7dgM9a+Msx6gQ
	gm2C7dfNeo4AmSfbn4+ukl56EgRSFDeI1fqdDoDZqGpCxeZXlAQEwV8RfkG3L1UJaEh1jpx15Zd
	4UMKWj70hT9IzO+9le/fyDLSZtrR2NkNOse841+fxYtwsEeOMitRpWb9gfzV8wqFEigGx88aQVG
	RHcOSF8OQabnKSWSWHAzfKVv3NKAVT5j+1Dp+9FjyGMxojbPG85+lDjomZnw6snHBy
X-Received: by 2002:a05:600c:3f0a:b0:492:7084:32af with SMTP id 5b1f17b1804b1-493df080c62mr67623595e9.23.1783443987981;
        Tue, 07 Jul 2026 10:06:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm33644487f8f.35.2026.07.07.10.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:06:27 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 07 Jul 2026 18:04:47 +0100
Subject: [PATCH v2 15/20] media: imx355: Define the exposure offset, and
 use that define
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-media-imx355-v2-15-1683ec07b897@raspberrypi.com>
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

The difference between frame length and max exposure time in
lines is 10. That had been used as a bare value in calculations.

Move it to a define, and use that define.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index ff9eaec39fe5..0b95027983a7 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -51,6 +51,7 @@
 #define IMX355_EXPOSURE_MIN		1
 #define IMX355_EXPOSURE_STEP		1
 #define IMX355_EXPOSURE_DEFAULT		0x0282
+#define IMX355_EXPOSURE_OFFSET		10
 
 /* Analog gain control */
 #define IMX355_REG_ANALOG_GAIN		CCI_REG16(0x0204)
@@ -630,7 +631,7 @@ static int imx355_set_ctrl(struct v4l2_ctrl *ctrl)
 	switch (ctrl->id) {
 	case V4L2_CID_VBLANK:
 		/* Update max exposure while meeting expected vblanking */
-		max = imx355->cur_mode->height + ctrl->val - 10;
+		max = imx355->cur_mode->height + ctrl->val - IMX355_EXPOSURE_OFFSET;
 		__v4l2_ctrl_modify_range(imx355->exposure,
 					 imx355->exposure->minimum,
 					 max, imx355->exposure->step, max);
@@ -1118,7 +1119,7 @@ static int imx355_init_controls(struct imx355 *imx355)
 		imx355->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	/* fll >= exposure time + adjust parameter (default value is 10) */
-	exposure_max = mode->fll_def - 10;
+	exposure_max = mode->fll_def - IMX355_EXPOSURE_OFFSET;
 	imx355->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops,
 					     V4L2_CID_EXPOSURE,
 					     IMX355_EXPOSURE_MIN, exposure_max,

-- 
2.34.1

