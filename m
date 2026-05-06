Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C0C36C597
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 06:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778050151; cv=none; b=WnzoqIqlbPaNjZjus1iMQyFplqZf3QacHMxDTGZ+LVzPetm5a9Ybhxk5fwkxzdxa34U4Kya/70BJu7JM4maCx2vjYZ6YlSUw0K7Jtz9ofLoy/RegHCqPQFXXUeeOMupab/2yJFKF8vL5K+Uwd1Mr4f8uKXZse0LPeaI4NNfxbjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778050151; c=relaxed/simple;
	bh=LRXlNS9x02z8g+CGxmATU/6gvHvDK0YuBVqtECCU2ME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OQlu/qXmDRe1EkBCMQZ4ai0WyJMiP8xCQ1edLlptqgc2iHzi8vEM3sI9W3SxXicmpL5hjqJe1FN7HcZ97lZrsIfFQHqG86/32ZoHaWnxv71HxN1ruZxmLJ4MhMxicIWpJ5nvlv7BeGocvY/tsnGgrxTaae/4UQFbQMnkY4IRXfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YwEXz4Pz; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YwEXz4Pz"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso53274825e9.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 23:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778050149; x=1778654949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2KGU01Qq2W7EXZE5uDuHFOzhjoXBSa5CoF8m94VBiMo=;
        b=YwEXz4Pzty/l82umOVfQLn1ytJucYokbpH7jLwYuugLDPyvHkirQUCYwncQZpvqWQQ
         jCbAv27Mv6yFUm90kCMHtAxRM80+coU5/ZSPClG3zP/aCcW+O1m50DSxxaMPPVAaojjT
         sraGyH4Qu7XOvxb7WO1st01yK7bgAjjT23GfhWivW8Mjx/TMX8O9ipFlVL6rnm8YsAiA
         utJYo2PTfj5K0Te4sfmqUe3YFiQ/5pP3uxt4iAYiuqwYASrlYs+shLvTm6rzvSNHFtVy
         r5Xx1nkpLrdpvpziZr/09uB9rBdiDysPlVZIXp13lyAToN1oapuBQc7yKHQ1M1UAARkn
         SNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778050149; x=1778654949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2KGU01Qq2W7EXZE5uDuHFOzhjoXBSa5CoF8m94VBiMo=;
        b=N0PokmHUui2D3JDHv4bh4PCw3wHdxI6/59+P7ffaU5DmuBFM5c8V/1rb9Q8H/8Shc/
         ddYyoCKXJlG4Z8O6IYspIa3yMc/tp1otXZPEz8bymiyTyk0qJEv/cRsErmUP00WhhcbT
         2smu1Ap8bBgQJM5UUxAQwcqLQiSMvtz9X9OJ472jmMRvCYbbzMINRGn9sEtRuf9JPDpS
         SdN5FA/nC1y19kKZXIBzY2U3VieqtpuEZcJqrXykvc9J30MEkUfGOHVtPHnxzGA8LraK
         oUQUOgncDcX93SjJ38gmynl0dMmvsqKuBbsOJHbVpH+v4g47Tj2wgCkTqzvSZzEykyiv
         pUEg==
X-Forwarded-Encrypted: i=1; AFNElJ9RsmPFHxQGPI/+PTEvcRJsr6zz7r8O6sUcxIkLRIR3Duv1TShyquZppSEtKOJpJrdvl4d7ybotzQR4@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj2udQFDTEM5jBSbAl1HQh3gYgbtfV9yR3KHAVaNLyEbQbfEQC
	rzUaB5LYLKJdQOI2COr7aOitqqMXbkyJYRYS+D541/QH0riJhd7AVGqi
X-Gm-Gg: AeBDieubXaQwD4VDG/b/dr90pL2AsngzrX0b+XdDmcRr/JfclyEuYJ9tKZfFeB1ziGR
	p2aNLEbjkFjUHCbA2CdCfzWpoy36KAyWbioWmpjDnPqOwbNykIn5jEOwebcwwQFweEdq9JVZCsM
	qfVmGJoVPn+MdNSDI3xVYWC2Om8FWXZMifW05qwpHqCRvBUtLDaJxyHPRkQceDnqC7V3WQ0aXVW
	YpHbEC1g9vaxy/yo3fB95qr5FjGUzz0RKzFDT1hwkGSOFCFmkOZmNETPGInUXP+DbHpfw253Ji5
	3igetm5+vdZTkzSRD2fYGIx8DnuC+f/b0KsyQpRW4czXmh9l1NgFEnGTPe37YnYp3E6Mce6DpkS
	Afr+f7k5S0inF6xiDS16gpl5j8zCW8Tey7E0hU4q9JvLUfCdr7a4eJazTH9C+rz/QRjzfSEaycp
	OUTTCdv2FQFS5Xfk0eUuwI4Ro=
X-Received: by 2002:a05:600c:608f:b0:489:1ba8:5be9 with SMTP id 5b1f17b1804b1-48e51f4b0e1mr36256855e9.29.1778050148544;
        Tue, 05 May 2026 23:49:08 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53891d62sm38398835e9.1.2026.05.05.23.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 23:49:08 -0700 (PDT)
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
Subject: [PATCH v6 3/6] media: i2c: lm3560: Optimize mutex lock usage
Date: Wed,  6 May 2026 09:48:44 +0300
Message-ID: <20260506064847.37795-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260506064847.37795-1-clamor95@gmail.com>
References: <20260506064847.37795-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pass the device's own mutex lock to the control handler so that the media
framework can handle control access instead of managing it manually. The
lock must be common to both sub-devices since they share same hardware,
so the individual sub-device locks will not work here.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index edfb07587cab..5b568ed9536b 100644
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
 
@@ -328,6 +318,8 @@ static int lm3560_init_controls(struct lm3560_flash *flash,
 	if (fault != NULL)
 		fault->flags |= V4L2_CTRL_FLAG_VOLATILE;
 
+	hdl->lock = &flash->lock;
+
 	if (hdl->error)
 		return hdl->error;
 
@@ -363,6 +355,7 @@ static int lm3560_subdev_init(struct lm3560_flash *flash,
 	if (rval < 0)
 		goto err_out;
 	flash->subdev_led[led_no].entity.function = MEDIA_ENT_F_FLASH;
+	flash->subdev_led[led_no].state_lock = &flash->lock;
 
 	rval = v4l2_async_register_subdev(&flash->subdev_led[led_no]);
 	if (rval < 0) {
-- 
2.51.0

