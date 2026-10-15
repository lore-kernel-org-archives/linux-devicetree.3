Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7852C521228
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 15:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079888; cv=none; b=Q7cxzrTyQgA5IXD5vfOAWwZ0h5vpkBueANxrWZ6GUyrQGWq9NKoaSRDgR2o5eoM5CO/vr2FqjYv/HODgxX2qwaSHEe7BF2Kk7HqTVnZpHY/aLEK5kqOHNZ6XVTW4g0FWz8WPSl2LERah9xP01qgn56S0kgBa+xh0RVapJ2mYLsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079888; c=relaxed/simple;
	bh=ccbmzk1mDLjJkMCMqTVZiJIs8myJOiM9s67m0/K4pLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qR16w0sUZQFWwzR1G4LloAjR+GmdrMFJTc6li+Slc7TUCWP4PXtegCSnw5xmem1jdwe5zlUtCQkC8LpPNAj2BILx3oNFvn/y8SnBULcd7OLwdxIIC5NbYHIJrIhF0yw7JoNKixb3MDV010DAO2CFacahYYc28miUtoqgho4E4Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=KC11xP51; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="KC11xP51"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so20493115e9.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792079865; x=1792684665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R6xE9wzYHAMIeHjvm7ZwNBfCozBSihzOwHk4H3NMT9w=;
        b=KC11xP513BQi1GEkAlcKnH8ImfL5SR7z/WOJJK4S6tJCKTLlkS79/1VXKDrci/tWFg
         7eUcwYdGROL3PqBthAwUxhmghxtjq4MUgdiwataxXQLrICBxL1+Ig+TWGCpIpw7+yZfP
         ypOrJVXxdvt+lDYR6VJRFsuOSA2S7N2E7F5m9gVsofgamT/Cj+gp/C+SSZeowllRJvxR
         m91S/YZY8VzRC4q2kH5TpxCzSWBPCzTA3IBkgxJEcRjB4V9krFXZeEDl4bssrm24uzV6
         Q3xYYqERCPYRcC7R0Fm5iVVnwCjk21Egv9OolLw93euIloiLt8OEp0BHQytwcRcLxsk9
         pUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079865; x=1792684665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R6xE9wzYHAMIeHjvm7ZwNBfCozBSihzOwHk4H3NMT9w=;
        b=aRwuTOrcq76OBVF/DXSIa0l8E16Vz6eNp6wIaB30ShagHm7DZG15qnUjuTNhvUcZhU
         LAINIIl9Gjw2U1hdmKFII003VppHFKOnecnnCdcLkPM5IZga1hMQA3injS70Wo9O+DDF
         99ZjTH6Ll5+354s1ijB8stcyC5UGaTQvCud4PtSeTew3SVTJrsWlmhdUx7KJvdnkH/Sd
         3aH/G20Wj62uXVs7JRfhl5pLhl+ffjX8fUgrWAPxVG3F7PvOO9D3h2J4+xqu8jg2aGKD
         OT4gFsm2d7Ss8JJb3cKzNEGD+woEL2EkET/aGZzWvMq8Yc8WRXvZJ0ziCfKf57vv+2Lq
         INJA==
X-Forwarded-Encrypted: i=1; AKwUvBz15HqCo4mgRp2QwqOZDX4PxQY7XLr2F9FehP1P1UxfLg81nFvaT77Zqq341s72wQI7G/e46EGdW78z@vger.kernel.org
X-Gm-Message-State: AFq9FYKlyBBk73TAMZMRfpasJmZ3YYyLDhoKlsugWyi4CAv2F8arZ8b1
	FbITjuCTSvrKGSNJ16kuHtLDClJgqs5vVf9EGrRFFLAGPFgIJ8V5ImgVkdtGACme1qg=
X-Gm-Gg: AYBFou2+cifYl+Mawl3IpTuUNz9F9DoWqW55y0WaorlSGUKC5BBTVejal/VoNCdGBqJ
	AMVxAL7EkYZJ3iqB9jhcu7c75KxFPe3pu/b5YtrMkS8bYQp9eBR6w0vvACdolH/Lca454kplkWw
	+7ALKQ85w29TnKhS/2XSlpEPvJKiMUxJ37c3XtKMDiZtjVkEhyeuE19Tyxqs7CLdk4roIrQBDe5
	eOk4MgXW+gedALsM4FbM2BRdG4ixvMheeEyMwpIzXz98scMfePbCXbKkgfNKvd2bSP3qMD9JPZN
	WYQh9R9O+yb5v6PNrHo+9HZqP3NAG2Zo0nLew6qfGfIlmmBkgzQgx8P3+CVvRltyEwHsnCNeDLE
	jIrJf+NPRTX3VNfKnCuN1x9M9U/mC2MidVLFBwUbWh6YZWQegjiahpwy11UEInNRSdiCHCvb4xh
	x5YOuMrugDFcNGEvr/VmdaFcqz/C7Y4lzee3qm3FDCHhgQHC/DrR+QaUn3SYASViY8wA77WGiuZ
	RcQvHRSNgVI2pDykzSUokjliU0b03A+LwDxy/QdyFP/AZ2rlQ==
X-Received: by 2002:a05:600c:4e41:b0:49f:c1a1:5222 with SMTP id 5b1f17b1804b1-4a18e4d80bdmr387159205e9.33.1792079865401;
        Thu, 15 Oct 2026 08:57:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm19877251f8f.14.2026.10.15.08.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:57:44 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 15 Oct 2026 16:57:34 +0100
Subject: [PATCH v4 08/16] media: sony-starvis2: Put module into standby
 after identify
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-media-starvis2-v4-8-75fcdb4163f3@raspberrypi.com>
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

The module has to be brought out of standby in order to read
some of the identification registers. Whilst it would be
powered down via pm_runtime, should that be disabled it would
be left in streaming mode.

Restore standby mode after identify.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 10f91c4b6db3..49dcbda9ecdd 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -1159,7 +1159,8 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	 * This sensor's ID registers become accessible 80ms after coming out
 	 * of STANDBY mode.
 	 */
-	cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT, 0, &ret);
+	cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT,
+		  STARVIS2_MODE_STREAMING, &ret);
 	fsleep(STARVIS2_MODULE_ID_DELAY);
 
 	cci_read(starvis2->cci, variant->id_reg, &val, &ret);
@@ -1167,14 +1168,15 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	if (ret) {
 		dev_err(&client->dev,
 			"I2C transaction failed ret = %d\n", ret);
-		return ret;
+		goto err_standby;
 	}
 
 	val &= variant->id_mask;
 	if (val != variant->id_value) {
 		dev_err(&client->dev, "Chip ID mismatch: %x!=%llx\n",
 			variant->id_value, val);
-		return -ENXIO;
+		ret = -ENXIO;
+		goto err_standby;
 	}
 
 	cci_read(starvis2->cci, STARVIS2_REG_MONOCHROME, &val, &ret);
@@ -1182,7 +1184,7 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	if (ret) {
 		dev_err(&client->dev,
 			"I2C transaction failed ret = %d\n", ret);
-		return ret;
+		goto err_standby;
 	}
 
 	detected = val & STARVIS2_TYPE;
@@ -1204,7 +1206,10 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	}
 	starvis2->variant = starvis2->info->variant;
 
-	return 0;
+err_standby:
+	cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT,
+		  STARVIS2_MODE_STANDBY, NULL);
+	return ret;
 }
 
 static const struct v4l2_subdev_video_ops starvis2_video_ops = {

-- 
2.34.1

