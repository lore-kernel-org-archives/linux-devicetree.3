Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EE7379979
	for <devicetree@vger.kernel.org>; Sun,  3 May 2026 16:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777826702; cv=none; b=sAPzpSEIrPGWJE9huAc63P1XOISDgaj08FXGnBNu55QRg/g5hRGVkXAJnzBZnN8eRG77lcK6FpaUKa2bI0YS08VfqljXSigDoHWFMER4eNaiNNxtuAIzv4vCadnVbw+Qh7FdG5XN+roFEb6iTTqGbEYTWSUbECoJMXHLYvpTBGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777826702; c=relaxed/simple;
	bh=/aTZ7FfNJUxGAerV0GyNvRYzlJf90me3mmU4zDgewOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sv/7glcEcj+xRPnuaMvxM1p1M80o0VeuanD+vr9wUO36sVRWK3BSSf8adFKc6T4w30HP6ZvcpUTZSmSGiRF4VNMr+UnbPdl1oE8zUKU8YDUva/NVWZpAIUEZ0Um5NcG7iWPU2rcsaL8pHdSTtvEPawXGECoPyuDHa/KyALODASg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPHX4tN6; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPHX4tN6"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-67bce1840f1so2617672a12.3
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 09:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777826699; x=1778431499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqEpiDmgYxnJFJBZV5oyq8iX4ijdqmclDgeEbjUzvZU=;
        b=HPHX4tN6pvOtLFDE8vxYilTNjL4kyEPNuJ5YNSx0FG8Y9ArrtjSsmw1ntDJFrMtRkq
         juMCYBXOA/Zos9GUcZac0QC4hfOThUnqc0KHaRuIQnL1Gd5rwxsEQO23RD+SaymF/OSf
         2tqXZhwNrpZvHHCrjCd+MzQ1wlAUkWAsWqTuRFw+/GtTQ8AhbXbyEw45RHh+HPsVyVYv
         3s1Tziin/HKa726vlzP9+ljJofrAVWZOZinB18nYqr6Udr8usFXxdh7fQ5RLq97U2uOF
         lorIO4dIqf2BJ6RhCaT5swb2eOSyIBYPbe6B8tTzrbi1uvK+1cvzX69Vej6WXjP1DSnd
         FbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777826699; x=1778431499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qqEpiDmgYxnJFJBZV5oyq8iX4ijdqmclDgeEbjUzvZU=;
        b=pZlgnGo88duu8B3YLU+BNT4hC0MCKI23r/obfSRnLtHnYUx5T8iwNiZurPHBvRPrNd
         VNBrw7617YWiB/GHrFb5ruU9U4J7IXmHY3lycmSH8H027IXKRdUii7BtUzPpEu1UWoqL
         mXG0LG65FjzZjw5nGtSymG/40kTpByfLT9vTSA/rLBfRwHGNVkrpHzphjWanIwm886m2
         ieWoesMC+//LYR4Kj82S2Kcz5uYY3bUoFZlKqqiIMeGcE3GnhycTgW9fMSd+mFow4z0z
         PgUFovsUex8TAX34QaRh8f26fm3uvUGeyhmpfzNpZRPZszmfT4aANyjPx6ZByjR1pFlY
         urCw==
X-Forwarded-Encrypted: i=1; AFNElJ/ZxVRVeekFMfHo0sHB0eurgsTmNK/OnuZodlhrAjktkbu5qQtGL69MFtqS5epUctoq+WTSZTzPnPor@vger.kernel.org
X-Gm-Message-State: AOJu0YyLWkcA9bUiKKLWnNoxcjKxjAl90yymyQtVavWByw966nYk6S2D
	LdfqlrQxuf6P8SbIDQlZgfIiVL2wJEq7cQjSY8mIwH6I7kOu7IfwDr2q
X-Gm-Gg: AeBDiesbbJ7nIKxQW2mNLci+5BYXJ59afmqkh57TORvSKP9DjQwsA+p6czVUb/xwAO3
	amXn9aniCWgZE6G9EFMoTUWQ8dBDi2GdiwJa5rTfEoYYbu27tSvXMeGCu92eOSUnvJlb1dvOeoR
	mvOzoDJedXoxpOFVwbfim7ceKjQtGb2qktfR7T13BMSkCUtk6G+rf5aklo46nPg3CBNMEEi5Zgn
	p/LwSMTkTc/2VAMwVOyzWl4Ci2FC+FKqBvxVLJjGmWrGoWBtqX+DCErJsIivs4MsEH8RkOGU2TM
	WY8nYQf1kc87zWOYjIsBXVQUCAilSgwz32ecelejwGE/nONZOqNvzrhr4+42chVPZsBqSkeKAXK
	LbWXSxnoa9NYhv6VZv4X4x3z6ewoEvGrKwWG3FTjEvPYAfE/sIOT4WBmJrIqeTGKccEHoh7/WSe
	mpWZc53CO8QDHgbNaO7nbLb+M=
X-Received: by 2002:a17:907:9455:b0:b9c:9594:e00 with SMTP id a640c23a62f3a-bbff9e28c78mr324860966b.1.1777826698801;
        Sun, 03 May 2026 09:44:58 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc237ef8297sm27430566b.57.2026.05.03.09.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 09:44:58 -0700 (PDT)
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
Subject: [PATCH v5 2/6] media: i2c: lm3560: Fix v4l2 subdev registration
Date: Sun,  3 May 2026 19:44:41 +0300
Message-ID: <20260503164445.215540-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260503164445.215540-1-clamor95@gmail.com>
References: <20260503164445.215540-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing driver does not call media subdev registration, making it
invisible to the media framework. Since the LM3560 supports two
independent LEDs, register each LED as a separate media entity.

Because registering LEDs before device initialization may cause access
attempts before the hardware is ready, lm3560_init_device has been moved
before the subdevice initializations.

An additional helper, lm3560_subdev_cleanup, was added to release LED0 if
the initialization of LED1 fails, and to deregister both LEDs in the
remove function.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index f4cc844f4e3c..edfb07587cab 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -364,8 +364,15 @@ static int lm3560_subdev_init(struct lm3560_flash *flash,
 		goto err_out;
 	flash->subdev_led[led_no].entity.function = MEDIA_ENT_F_FLASH;
 
-	return rval;
+	rval = v4l2_async_register_subdev(&flash->subdev_led[led_no]);
+	if (rval < 0) {
+		dev_err(flash->dev, "failed to register V4L2 subdev");
+		goto error_out_media;
+	}
 
+	return rval;
+error_out_media:
+	media_entity_cleanup(&flash->subdev_led[led_no].entity);
 err_out:
 	v4l2_ctrl_handler_free(&flash->ctrls_led[led_no]);
 	return rval;
@@ -391,6 +398,14 @@ static int lm3560_init_device(struct lm3560_flash *flash)
 	return rval;
 }
 
+static void lm3560_subdev_cleanup(struct lm3560_flash *flash,
+				  enum lm3560_led_id led_no)
+{
+	v4l2_async_unregister_subdev(&flash->subdev_led[led_no]);
+	v4l2_ctrl_handler_free(&flash->ctrls_led[led_no]);
+	media_entity_cleanup(&flash->subdev_led[led_no].entity);
+}
+
 static int lm3560_probe(struct i2c_client *client)
 {
 	struct lm3560_flash *flash;
@@ -425,17 +440,19 @@ static int lm3560_probe(struct i2c_client *client)
 	flash->dev = &client->dev;
 	mutex_init(&flash->lock);
 
-	rval = lm3560_subdev_init(flash, LM3560_LED0, "lm3560-led0");
+	rval = lm3560_init_device(flash);
 	if (rval < 0)
 		return rval;
 
-	rval = lm3560_subdev_init(flash, LM3560_LED1, "lm3560-led1");
+	rval = lm3560_subdev_init(flash, LM3560_LED0, "lm3560-led0");
 	if (rval < 0)
 		return rval;
 
-	rval = lm3560_init_device(flash);
-	if (rval < 0)
+	rval = lm3560_subdev_init(flash, LM3560_LED1, "lm3560-led1");
+	if (rval < 0) {
+		lm3560_subdev_cleanup(flash, LM3560_LED0);
 		return rval;
+	}
 
 	i2c_set_clientdata(client, flash);
 
@@ -447,11 +464,8 @@ static void lm3560_remove(struct i2c_client *client)
 	struct lm3560_flash *flash = i2c_get_clientdata(client);
 	unsigned int i;
 
-	for (i = LM3560_LED0; i < LM3560_LED_MAX; i++) {
-		v4l2_device_unregister_subdev(&flash->subdev_led[i]);
-		v4l2_ctrl_handler_free(&flash->ctrls_led[i]);
-		media_entity_cleanup(&flash->subdev_led[i].entity);
-	}
+	for (i = LM3560_LED0; i < LM3560_LED_MAX; i++)
+		lm3560_subdev_cleanup(flash, i);
 }
 
 static const struct i2c_device_id lm3560_id_table[] = {
-- 
2.51.0

