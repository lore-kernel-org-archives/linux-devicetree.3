Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF733AF641
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 11:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777376387; cv=none; b=apzYsY0Ir9VcNuQwINlQtzL0adk1G+bPsO2Ci78kAg38AmprkWfILSDGnbaWykqFHOR1VNa9MOy1AK9mKRfEru9tXLFD3jpOWEd8N7oO0wYuJK8xE+gX9cjDMXeXwC9bxvQ8f2rtYbNvY4th37YGsCOEk4pGrg/9F8HGuVnlhPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777376387; c=relaxed/simple;
	bh=/aTZ7FfNJUxGAerV0GyNvRYzlJf90me3mmU4zDgewOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hEBspESmlaeEwc2VnRz/IUDMunQXu4AkS1cPqhaJSJb2wkD+tihA9Jxw67YIZQ3yWO2RsV1bSlGadaq23mGCB5zlBBmlYK2Vo09wFwWypLvjUWfkh+y/bv4S8+ALvTlWcZA3T4BE+OzmHx1K23JauHWBlS4yWG6LCY9efoWhEMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fd65MjkV; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fd65MjkV"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso118130105e9.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 04:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777376384; x=1777981184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqEpiDmgYxnJFJBZV5oyq8iX4ijdqmclDgeEbjUzvZU=;
        b=Fd65MjkVQB3E6GV8G/hk9uAj/8TTqNaJBbmypmq0adYW+KGGgx3tijofFRyE20VjpG
         2lcaUBL6TeRhAsYgYxU0h0jaxlmw2x88YcrZxEbeTpkrVdeSDXlS/JbvpnVbcIVNBZvr
         dqd8gciv5iT2Uk8AdIjFCCgFNArQuBHVLT8R6f2iXz0V8sNsoT47oi9VMb2Wcqba5zkf
         4CrX3kuxXh97RPJdZykwruAT/KwVy7/1R25gLIX07XU0L1dCDvn/5r/pHEUhU/dvMEH3
         eyj+up+GlOt3+T5cXbERY+805a1D9nOTYUiYSsDY3YAAms1pOhyjiDjoevg2rO10Ol/y
         myMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376384; x=1777981184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qqEpiDmgYxnJFJBZV5oyq8iX4ijdqmclDgeEbjUzvZU=;
        b=LlVSzReGwDTyQJ3sR+g9aaQObfPStmGW8iigRH0rA7O8ERx1Jl45YqGTF1jg5dQNev
         o0wNMzmhQLls2+bIbtsN6SuvA1Bop+FVdJ4we/zj3gwqO3muxxhy3AKYlJzJVxI1wr+X
         kSAOtMmXL+DifaznBakLeHi3hk95XFpUkkW+mkn8rrdH8SxIh8cXxma95X3rxdMl+nwp
         JtTRF2vOFZ+Cv3d4k4G3iXkkXR8VyaekbLPoh81pB63ST7haoSmJyxykJihsQGTwA3p3
         4LIJSF3oT4ovRW49ZSoR0sJVmC082+AhpT4AdoANkMAtI5FW38e2L1JGnCDmIpzaIseK
         t+rw==
X-Forwarded-Encrypted: i=1; AFNElJ97EI2WPIjc6cA8nFmyaSe86I2uGOT6EKAsi20TG0JTRlVATCM44lnc6w5wgKk5L8l5eszv2BwmV0op@vger.kernel.org
X-Gm-Message-State: AOJu0YyFjweujzSjnhU0rAchSNWQPms7ihhv3IxyNRX9pLBjMRS/zbrq
	xEKeNVAgtTG8mDIfI8XHF/W6YlodMTZyC4iv9Nb9VW4EjjvhaTW7NVTh
X-Gm-Gg: AeBDieuikEwd2c58tR2hKKQG6z+w7x5CdOVUnWwKOMCTng1Llpbd1jZAAah8uIHV9Bh
	ftZ/IYnzOetCNfQSGl8OTu1J3sApCyyihXO8oJH9NOOWaXZrWWsuiYbOgOzlIM1u9TyIKccKCQp
	ORWHTIulI3xCw6lploqmByuXtiF013ePt1H5jBlCqu6/hzlHYQseMTxFxxmHfcn3Of0S5UOn4Fz
	FAReXm40IBFKfiwtDgzYX0WwoRd0kCPXmjGYMCSfkms8owPfLUq3+Iujkfr7e3dMkx3UeUfnCIn
	SdzCxX8b3Jb4mAIMA2y/yuDwXpgFcGYy447zUs9ZsdXN7iafua2v40qDmjDAfLrFkrf4cG2wSOg
	UqynBZOnw6oG/ncuse4y+n6CsgXHMxRXITS1/AE4YFcV7MCVx0LLdLxlqCE9cNqkwjqYgq2xZYp
	nX+vQylptrlwfmTeyY5wRk+DE=
X-Received: by 2002:a05:600c:1393:b0:488:fd7e:1063 with SMTP id 5b1f17b1804b1-48a77b270efmr43569445e9.29.1777376383549;
        Tue, 28 Apr 2026 04:39:43 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a77aeb223sm43541125e9.3.2026.04.28.04.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:39:43 -0700 (PDT)
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
Subject: [PATCH v4 2/5] media: i2c: lm3560: Fix v4l2 subdev registration
Date: Tue, 28 Apr 2026 14:39:19 +0300
Message-ID: <20260428113923.112920-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260428113923.112920-1-clamor95@gmail.com>
References: <20260428113923.112920-1-clamor95@gmail.com>
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

