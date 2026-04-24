Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D024371CE4
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 07:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777015375; cv=none; b=jBbKe/28r9fopO2JDWG4y8ERT4UZB4LfP6h6bJd9Yr8fZQgHOn5R5+04eKI8l7BRepmPOj6n96fjC3yjS9dedhPAUOuBisXDZUn4vzwUrFCOrjp9CdmbQvucyei2+EkO3RwPik2tMpnj9hN3dtZv1S9xIndUlKyj6kxMrwNgIMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777015375; c=relaxed/simple;
	bh=DPuU9UKzjNveL2Uy3y9tUPnjY6ZhEX35Z5uqTrDGofg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HBvnqkMvv4bdQ1uJ2zzDO66VVaESfTmpVlzGIv5JToDi45yp2ieiLGq8sSB3YJvB3ZviRyRhVidYohjbue8bIzGKnzx7XWYEEDiziFjzymZResS79qLDvBbtw7QMlkHzc8j0V+CBYPROJNOpt36JV4MGV4MRsbNx1anB6G+u6Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SwT+e/dt; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SwT+e/dt"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a2c77c62d7so8229668e87.0
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 00:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777015372; x=1777620172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwldWTVNb+Q/QpXo1IdPnwyyFuA7X8MQ9JBz50beleY=;
        b=SwT+e/dtnF+HXvdlrQmeEZC0tlVMo9xLCeK2S8w+Bz6R6s4CSOfgxIkfESvU71nkhZ
         1P4mHnh84BRTv8JjHhZx7wu4uuFB98c+Gayvq+NeP6+5/hxZ+q7pE6Hv/6Ji/ckT3knR
         zQ08CcaB/EEz+VSkTvUF1G3jpK4XB2pRkb6Gyuzrrq/2cZLvP3dKuhDZ+KzNBuK6nZ6k
         LCdBFj1D3xlr9ox0vjcxj13hbye14vQpngehoMZVb9wiDFwIavEp5qJqW6kOJnHlfjzE
         ZE3pUPDfOh+I8vjMnYcP79740hukY9EqGyF1NznXlg8oKs804BirRCAbXLyoeU+/vS+W
         fY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777015372; x=1777620172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WwldWTVNb+Q/QpXo1IdPnwyyFuA7X8MQ9JBz50beleY=;
        b=SaELMvH9FqBaFdilgOK2eLCyDJjMPtuPp21DO8qH5ku6XfbQpLSHlu67FIWUpWNk/W
         Yj/8109f8kawoyY3XaTn4G09SmUWsbhy8T9Ew9UyGizPGURsaZVORfDXtz2yDSnkNg1g
         zCexYeke1ePhqcSaI8ENbw+2PNDMkqUAGSyxRTeVTuu6/U/4AooU8p/QjI/G+ugpAPGW
         IrbPXeKXaZiAcJDRyEXYE/P/HiGdcq2iSYVruB/FL7LoWCzequA1XI/owmR3wEmQGyun
         zcjFcBvEMznBORD2tlfBfFtkhAdKAJeeMlWxqn+b4IKq3arHtn/cv0gxWznFDAoq9voQ
         ixNA==
X-Forwarded-Encrypted: i=1; AFNElJ9q7GHQUJW0X0ymlPsjwR93zg3qRB/Vrj9BA2DhuUZmcLaU/MPOX2x/S//VET/cDAsnNIrh3SDvpgBG@vger.kernel.org
X-Gm-Message-State: AOJu0Ywea8tWOs52Vyu2EoxFsEWznamthEekSfpkOoRgs3IutXkrBGLn
	Pk/1oOfvuofudkpPdbbgejcgQX+wX6YIBC3khAvSHKfNWfaKsiuY2yfH
X-Gm-Gg: AeBDiesEOyC92k/1a/YcV9KtiP8SMnxa/UqfyMslNIipVjzODet9PNG5I1TBXSvFxe4
	qY9o0nJBxR7V7ZJjjaa8cLhnrW31GGS+RzpM56ZJYgAqHKmkL0qFtwylWYONSdJOkZGfEDfOIxE
	efwuHqhTP/6evdgk8L+9R79hORGa2N9t1J07Df3mqG/hrVtxZh10t0tjxk4lm0ChIExZrFVIfIn
	kfyORcpRkX/vv6/xdxix5dGTREBk0pkdeKPckSdt8E5RqbD0rlOqjK0/2vgJegOJdHMnDYL/RXs
	ajdtygv8QJfGj4Tw1MMieQ1v7355Wv4UjWMZ7uLi4fusyZZ0/vul3UXL4X1dWSfWxG/ZZMvP2Eh
	YWqrwttZraeFGYfFVxFncOsJq6Fb0SurUeMEX7NVmSK/Px/PEMr2BCN84FkGZnKCpZJ762VzHlG
	Ry1EF40RMmt/PvNyvb6VXD7OQ=
X-Received: by 2002:a05:6512:8005:20b0:5a4:1904:b1fb with SMTP id 2adb3069b0e04-5a41904b214mr6711948e87.40.1777015371479;
        Fri, 24 Apr 2026 00:22:51 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a41a238563sm5612550e87.55.2026.04.24.00.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 00:22:51 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v3 3/5] media: i2c: lm3560: Optimize mutex lock usage
Date: Fri, 24 Apr 2026 10:22:28 +0300
Message-ID: <20260424072230.90354-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260424072230.90354-1-clamor95@gmail.com>
References: <20260424072230.90354-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pass the device's own mutex lock to the control handler so that the media
framework can handle control access instead of managing it manually. The
lock must be common to both sub-devices, so the individual sub-device
locks will not work here.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index 085a0ef70e39..5cd22c2fbb64 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -162,14 +162,12 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 	struct lm3560_flash *flash = to_lm3560_flash(ctrl, led_no);
 	int rval = -EINVAL;
 
-	mutex_lock(&flash->lock);
-
 	if (ctrl->id == V4L2_CID_FLASH_FAULT) {
 		s32 fault = 0;
 		unsigned int reg_val;
 		rval = regmap_read(flash->regmap, REG_FLAG, &reg_val);
 		if (rval < 0)
-			goto out;
+			return rval;
 		if (reg_val & FAULT_SHORT_CIRCUIT)
 			fault |= V4L2_FLASH_FAULT_SHORT_CIRCUIT;
 		if (reg_val & FAULT_OVERTEMP)
@@ -179,8 +177,6 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 		ctrl->cur.val = fault;
 	}
 
-out:
-	mutex_unlock(&flash->lock);
 	return rval;
 }
 
@@ -190,8 +186,6 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 	u8 tout_bits;
 	int rval = -EINVAL;
 
-	mutex_lock(&flash->lock);
-
 	switch (ctrl->id) {
 	case V4L2_CID_FLASH_LED_MODE:
 		flash->led_mode = ctrl->val;
@@ -202,14 +196,12 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 	case V4L2_CID_FLASH_STROBE_SOURCE:
 		rval = regmap_update_bits(flash->regmap,
 					  REG_CONFIG1, 0x04, (ctrl->val) << 2);
-		if (rval < 0)
-			goto err_out;
 		break;
 
 	case V4L2_CID_FLASH_STROBE:
 		if (flash->led_mode != V4L2_FLASH_LED_MODE_FLASH) {
 			rval = -EBUSY;
-			goto err_out;
+			break;
 		}
 		flash->led_mode = V4L2_FLASH_LED_MODE_FLASH;
 		rval = lm3560_mode_ctrl(flash);
@@ -218,7 +210,7 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 	case V4L2_CID_FLASH_STROBE_STOP:
 		if (flash->led_mode != V4L2_FLASH_LED_MODE_FLASH) {
 			rval = -EBUSY;
-			goto err_out;
+			break;
 		}
 		flash->led_mode = V4L2_FLASH_LED_MODE_NONE;
 		rval = lm3560_mode_ctrl(flash);
@@ -239,8 +231,6 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 		break;
 	}
 
-err_out:
-	mutex_unlock(&flash->lock);
 	return rval;
 }
 
@@ -332,6 +322,8 @@ static int lm3560_init_controls(struct lm3560_flash *flash,
 		return hdl->error;
 
 	flash->subdev_led[led_no].ctrl_handler = hdl;
+	flash->subdev_led[led_no].ctrl_handler->lock = &flash->lock;
+
 	return 0;
 }
 
-- 
2.51.0

