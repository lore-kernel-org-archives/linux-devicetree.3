Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733323;
	b=nF+R/EVB2hS/1UrJB5VytgheW+SK9ZzHtWjlPhAu1x0JxENePawNUypQm0kpKORw1wDX
	 Pm0/jL4zb6Le1qKzSzrR4BtcUICRwjWisa5wHQZdR+/ZMO22ZYb/Sb2I5u8ZzrWAcCNIp
	 +H1xatCCXvCiY9pHkuvJLdP3zzAzWehvsxk8dv+zv/l7oaT5hZ6CXOfr+CQiyRdxLhmD2
	 ujCJGxxP8XKi8JXhIPC6bMZ6Cw//sMkQ3KN7wnRF/f1b+WcK5I9ylqU3w6AGupa6b8mQh
	 4eqjDCAJZfehBEAGLf4jxMlVoyMlt8GdphlnwR5bYKqciqJT0ExgzkN9oOIljTqTRqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yQmqf4Ja1Z8wMFml1jwizSQhW4WDwS/UNz1lWjL8MPQ=;
	b=KWfRH4JXtBjcbkBTbNy1WxJAl1WyADARtrCF+MSDNMeqsUyj/FLuvOcSKo4t/Cei5ahh
	 U3JwEsiwOpGvuXcw9EDuY1dVcwL543Tt9fUlJK7reS0/dMcTEB6lX3zH6LGVa2pGanMMA
	 P6By7ItlXapODrsRPXIrzcj6GmUD4ejwmaJkcXmQ2AJnOs1s4zSgYXpzLhu/1NVo3kgOI
	 lCKfRQVXFVW3e/Mr2vNz9r7j/e1osGffBZMEvV22cAUaNYjWL86N5q+/rp8QDMjObueOk
	 zk2AsvXrVotsEXX4Ib3nPSGDtr+EMPQTEbE+xMkIFmZ1fDgsVTmYdHbxToKyTIndayA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HxUXaTxl;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BB4606A89D
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 09:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3BB4606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HxUXaTxl
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4682977f9aso386244666b.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 01:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733321; x=1795338121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQmqf4Ja1Z8wMFml1jwizSQhW4WDwS/UNz1lWjL8MPQ=;
        b=HxUXaTxlJ+9mFTqgNZ2o5vNOYRonALoI3shVgtEBS9y9QjxPnFRxV1k+YfSkj79Sk5
         wk28whhtdnuDQeVQUQYevMte6OE+DKGUbZz8vpVDSCLMjdR2LI6NP58KOKsHOc58jNRN
         zY2MNx9qk8LJ8ld9lansQMC12SergoYqx+XdiDdJQ+0SjJWt9HqTqRcqReQHb2VnjyED
         WqPvoVKRLQuSlYdOM6r8NdoXtUouO1LQ0QlytrjzxyuBRNopG/LAb3vY4UgeDBmijQs+
         grZRhdx04y/+WqEjpUa89sp+x9xwQ2eU1bZza64SblmNhmIeao0SN746JrUOAHf6lSz+
         BGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733321; x=1795338121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yQmqf4Ja1Z8wMFml1jwizSQhW4WDwS/UNz1lWjL8MPQ=;
        b=Is7lypAlogYzd+PTr/IGrbU66ZtwB8ASQ3SChqjy4pbA1wFbRBDn7j+deA1l/sDxNY
         qA+cQ4DcqagY9O70Cl//+lDLttZKofRO40A7yvJXRfHVWcaZeRcSSrbc/89KepiRt9qP
         dAs+AD1UtGGAVkrk2DMErWtSJkF/s8hv/ajxha86oKyvueEBkJHCmJilLOZHQ4SP9ihm
         WvcQ2KPnxmRMVfnIc9wNmozx7WU+fJLc1ITb4ddRwVf0SkTz6GKVmr5G1KD9Xk/Y5Jix
         aNqFX3/bTv/CRGBKaTDuD2LfJ/Khbd72J+z6HrlaqqlOqxhlUd/FSra14bNEKyfGXzvq
         ZLIw==
X-Forwarded-Encrypted: i=1; AL+hErEUlXFIeBDWWVST15Trwb9KlgaBioqcNdLHcLXBYz6h4+soC0Z01lSlsldQ1PiXe9eArwuBqfryel8b@vger.kernel.org
X-Gm-Message-State: APuU4Z93MMTrRVl0WVSz7rT4qkOtjmBFEemJFJzIRWcCmc9ip0Lgj6Ms
	TCBBrPls+EEap26qaGVrvx3rQoFUBPO8lxSmuBuh6ha4XPacah1L/WDj
X-Gm-Gg: AYBFou1LsKydlPf8WLbIx3MVZEZlQ6rAoRWwwdXwi0xpXiNjhmRQFCX8I/bJMjXg9pe
	6IvfMxaFzNEINRAilin4e7j5AqThMJEKlVWTTzY7Xu9i61HQnlRI1lFQceRpeEWctG+HTcm6JWZ
	ZuV+/ZnexSDC5r8pNlZXfhAL7cxe6uRfkFVYYrLe93Imsh2MorpInip5NPu3DVYsu9bAVHZXZVb
	YQEXAbZYmu/qMOEQa2muOxGFZdf2RA1nxoKZscwVnzRh5Qo8b86GEsTAf4XJlCMaS8dzh1KxeNw
	3Xk0cEY0VaqJj9HaZVCiM1A1Wj1srBCRlIPrWxfexiBe01wYnJ5bSBe+bPMSIfQpJcX3j9QsFlb
	1WnQqimDwW805sCBDuEk5HtazY5r5t/ylPrd7NER7kIXq/c/lTnTnvnk1AcGPtTjm1EYiwmJCal
	oRGgX/4ruDEQbQvMa/aFmhEIggFfyIKCzFGAwGrQP7stfldMtAewJV7Q+R5xiL/mq61IvYYyMHS
	/pbKZfC0OCUQG54tdwVN59ufsAU8439G9mptcbTd9wqMI1n2smztqLenATw/kx3AINu/rlY8tq5
	stYfTknj3GvcBrEAr9FmsSpPxX6TFzfsMI8AV/cIMSdsWaUHVxv7YFYM6VBeCjbGNrB4qyEK5oG
	wDN8da2dEYw==
X-Received: by 2002:a17:907:3e9e:b0:c40:4848:f7fa with SMTP id a640c23a62f3a-c50965421ebmr588354466b.44.1794733320589;
        Sun, 15 Nov 2026 01:02:00 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b8651bsm291440966b.78.2026.11.15.01.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:01:59 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v5 3/5] mfd: max8907: Switch to resource-managed versions of helpers
Date: Sun, 15 Nov 2026 11:01:45 +0200
Message-ID: <20261115090147.95337-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115090147.95337-1-clamor95@gmail.com>
References: <20261115090147.95337-1-clamor95@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to resource-managed versions of regmap_add_irq_chip() and
i2c_new_dummy_device(). This involves probe refactoring in order to
remove jumps and allows to drop the .remove callback.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 127 ++++++++++++++----------------------------
 1 file changed, 43 insertions(+), 84 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index d5d40d2c7c425..f6d7a4ce9712f 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -182,73 +182,60 @@ static void max8907_power_off(void)
 
 static int max8907_i2c_probe(struct i2c_client *i2c)
 {
+	struct device *dev = &i2c->dev;
 	struct max8907 *max8907;
 	int ret;
-	bool pm_off = of_property_read_bool(i2c->dev.of_node,
+	bool pm_off = of_property_read_bool(dev->of_node,
 					"maxim,system-power-controller");
 
-	max8907 = devm_kzalloc_obj(&i2c->dev, struct max8907);
-	if (!max8907) {
-		ret = -ENOMEM;
-		goto err_alloc_drvdata;
-	}
+	max8907 = devm_kzalloc_obj(dev, struct max8907);
+	if (!max8907)
+		return -ENOMEM;
 
-	max8907->dev = &i2c->dev;
+	max8907->dev = dev;
 	max8907->i2c_gen = i2c;
 	i2c_set_clientdata(i2c, max8907);
+
 	max8907->regmap_gen = devm_regmap_init_i2c(i2c,
-						&max8907_regmap_gen_config);
-	if (IS_ERR(max8907->regmap_gen)) {
-		ret = PTR_ERR(max8907->regmap_gen);
-		dev_err(&i2c->dev, "gen regmap init failed: %d\n", ret);
-		goto err_regmap_gen;
-	}
+						   &max8907_regmap_gen_config);
+	if (IS_ERR(max8907->regmap_gen))
+		return dev_err_probe(dev, PTR_ERR(max8907->regmap_gen),
+				     "GEN regmap init failed\n");
 
-	max8907->i2c_rtc = i2c_new_dummy_device(i2c->adapter, MAX8907_RTC_I2C_ADDR);
-	if (IS_ERR(max8907->i2c_rtc)) {
-		ret = PTR_ERR(max8907->i2c_rtc);
-		goto err_dummy_rtc;
-	}
-	i2c_set_clientdata(max8907->i2c_rtc, max8907);
-	max8907->regmap_rtc = devm_regmap_init_i2c(max8907->i2c_rtc,
-						&max8907_regmap_rtc_config);
-	if (IS_ERR(max8907->regmap_rtc)) {
-		ret = PTR_ERR(max8907->regmap_rtc);
-		dev_err(&i2c->dev, "rtc regmap init failed: %d\n", ret);
-		goto err_regmap_rtc;
-	}
+	max8907->i2c_rtc = devm_i2c_new_dummy_device(dev, i2c->adapter, MAX8907_RTC_I2C_ADDR);
+	if (IS_ERR(max8907->i2c_rtc))
+		return PTR_ERR(max8907->i2c_rtc);
 
-	ret = regmap_add_irq_chip(max8907->regmap_gen, max8907->i2c_gen->irq,
-				  IRQF_ONESHOT | IRQF_SHARED,
-				  -1, &max8907_chg_irq_chip,
-				  &max8907->irqc_chg);
-	if (ret != 0) {
-		dev_err(&i2c->dev, "failed to add chg irq chip: %d\n", ret);
-		goto err_irqc_chg;
-	}
-	ret = regmap_add_irq_chip(max8907->regmap_gen, max8907->i2c_gen->irq,
-				  IRQF_ONESHOT | IRQF_SHARED, -1,
-				  &max8907_on_off_irq_chip,
-				  &max8907->irqc_on_off);
-	if (ret != 0) {
-		dev_err(&i2c->dev, "failed to add on off irq chip: %d\n", ret);
-		goto err_irqc_on_off;
-	}
-	ret = regmap_add_irq_chip(max8907->regmap_rtc, max8907->i2c_gen->irq,
-				  IRQF_ONESHOT | IRQF_SHARED, -1,
-				  &max8907_rtc_irq_chip,
-				  &max8907->irqc_rtc);
-	if (ret != 0) {
-		dev_err(&i2c->dev, "failed to add rtc irq chip: %d\n", ret);
-		goto err_irqc_rtc;
-	}
+	i2c_set_clientdata(max8907->i2c_rtc, max8907);
 
-	ret = mfd_add_devices(max8907->dev, -1, max8907_cells,
-			      ARRAY_SIZE(max8907_cells), NULL, 0, NULL);
-	if (ret != 0) {
-		dev_err(&i2c->dev, "failed to add MFD devices %d\n", ret);
-		goto err_add_devices;
-	}
+	max8907->regmap_rtc = devm_regmap_init_i2c(max8907->i2c_rtc,
+						   &max8907_regmap_rtc_config);
+	if (IS_ERR(max8907->regmap_rtc))
+		return dev_err_probe(dev, PTR_ERR(max8907->regmap_rtc),
+				     "RTC regmap init failed\n");
+
+	ret = devm_regmap_add_irq_chip(dev, max8907->regmap_gen, max8907->i2c_gen->irq,
+				       IRQF_ONESHOT | IRQF_SHARED, -1, &max8907_chg_irq_chip,
+				       &max8907->irqc_chg);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add chg irq chip\n");
+
+	ret = devm_regmap_add_irq_chip(dev, max8907->regmap_gen, max8907->i2c_gen->irq,
+				       IRQF_ONESHOT | IRQF_SHARED, -1, &max8907_on_off_irq_chip,
+				       &max8907->irqc_on_off);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add on off irq chip\n");
+
+	ret = devm_regmap_add_irq_chip(dev, max8907->regmap_rtc, max8907->i2c_gen->irq,
+				       IRQF_ONESHOT | IRQF_SHARED, -1, &max8907_rtc_irq_chip,
+				       &max8907->irqc_rtc);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add rtc irq chip\n");
+
+	ret = devm_mfd_add_devices(dev, -1, max8907_cells, ARRAY_SIZE(max8907_cells),
+				   NULL, 0, NULL);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add MFD devices\n");
 
 	if (pm_off && !pm_power_off) {
 		max8907_pm_off = max8907;
@@ -256,33 +243,6 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 	}
 
 	return 0;
-
-err_add_devices:
-	regmap_del_irq_chip(max8907->i2c_gen->irq, max8907->irqc_rtc);
-err_irqc_rtc:
-	regmap_del_irq_chip(max8907->i2c_gen->irq, max8907->irqc_on_off);
-err_irqc_on_off:
-	regmap_del_irq_chip(max8907->i2c_gen->irq, max8907->irqc_chg);
-err_irqc_chg:
-err_regmap_rtc:
-	i2c_unregister_device(max8907->i2c_rtc);
-err_dummy_rtc:
-err_regmap_gen:
-err_alloc_drvdata:
-	return ret;
-}
-
-static void max8907_i2c_remove(struct i2c_client *i2c)
-{
-	struct max8907 *max8907 = i2c_get_clientdata(i2c);
-
-	mfd_remove_devices(max8907->dev);
-
-	regmap_del_irq_chip(max8907->i2c_gen->irq, max8907->irqc_rtc);
-	regmap_del_irq_chip(max8907->i2c_gen->irq, max8907->irqc_on_off);
-	regmap_del_irq_chip(max8907->i2c_gen->irq, max8907->irqc_chg);
-
-	i2c_unregister_device(max8907->i2c_rtc);
 }
 
 #ifdef CONFIG_OF
@@ -305,7 +265,6 @@ static struct i2c_driver max8907_i2c_driver = {
 		.of_match_table = of_match_ptr(max8907_of_match),
 	},
 	.probe = max8907_i2c_probe,
-	.remove = max8907_i2c_remove,
 	.id_table = max8907_i2c_id,
 };
 
-- 
2.53.0

