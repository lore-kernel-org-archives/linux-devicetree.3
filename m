Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101615;
	b=fJJYlu9psQR896NLD+F6OdIwyHk+EDX5MPWCORdzrv42pzdFxcETPGbBr+lQUmWmgzIN
	 fZLf1V4Cv7dCxLFQS9YJsDweZcqvce6ePZLqL2OLXBf7yJGdGQ6gqJBtTht8mQQJnAqhM
	 DsBg8xkuoQ4mA2hKD7wVJersm7+hWrGvLosu9Qqq5BDrUJ6KQgpaiuhzARhn+i6+lGQDo
	 HgREhTUzvH0JKQBMXY29KRUk5POAwup9y9vNHtw0WU8MhPkm/oCeXrMzEFbWtzvFtbPUC
	 xwvRDbDyPNUhzgcWzO5i16ppkNwrwCepfDjaGF9U0db2r4lrN1XDN4WJHBa0QrKs/TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PrGVcr7lTIwJczC3an0BTfgU2CbCkLrUmq4RV7ahjvk=;
	b=v4eXGCXnQHQMtAFHR3gM4vrHKrYEF8Mg4IZiLk8F2ifllaW1Op6UJFr6jx36IrmkILlI
	 zd6gLGFvRGFhZ4KK6IBXpJrpGk7oExbLQV0vGJ8KSobMPrCZQb0B2fAE5OZZdM8Rcoxpa
	 OJiSJbrNppzPaFvMRjKN6XZq0Ol/sFv6YcNZ4M4loibktd/FuwVsLs5yMz9yTlt99S9bj
	 t+Hpilx3VnRDJRhzigqxJim8YeGbqsswLtOqdTE0ZrwcPcjxBtFGG/UckYP3CNsvkkjdj
	 EoEOncyGU0cXOo++lrRcHy9dx9eZmWvmxhux7iVEx5EwbSVicXltN5haaVKxXhrhnzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RXJ7qE4U;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C97606A877
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:46:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6C97606A877
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RXJ7qE4U
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c38ac26cc5dso604668566b.2
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793101613; x=1793706413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrGVcr7lTIwJczC3an0BTfgU2CbCkLrUmq4RV7ahjvk=;
        b=RXJ7qE4U+shAUP2bMUZqaFSGHokR26tFXhMVkM8UO3Hs1Ji/G5Y3LoTa/KhmX64/Up
         Om2ZN19LQf3eSxw0uwmVwZcEDAYFmMI+GpDXV7sVfvmaNB7od8i+uSyVsEx7BOqlQnd6
         exHM/yJRfBdyFcWptMl7L8WB/tMHcKPjGKxWuTvec5mpNCx4+Upe1VALwPifvEpkwa0L
         t5xIleUJiqsYam1E9vgv1TvFQzRdrKTMPvExzG5LtgovOKuYbGER4+QIO8iE/hccy6cx
         RdBprgvm6DoQhGfFLEsFGwWXdJB2k2bl5QIJbohG+89Mp2WLwHeAdvKM/ZCdQdBw53eq
         WaGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101613; x=1793706413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PrGVcr7lTIwJczC3an0BTfgU2CbCkLrUmq4RV7ahjvk=;
        b=kdPcBD+deWKWrRl2Uu6k/RRR8pjN7fy560nzonOgFJEpYPsh9Sr1D3/M3UewUl3/55
         zPjgdd7VlAm4aLxjpHfn+9u9km41pvMfL9qphwuJg5d5qrHpOkYCU8tYMoSEj5ZuoML9
         kcQvCyB3J/MCg/jbFG9BVJCR3/4doGS66Z5Pa7RIKZEChCXrt3wqXPj9piFp+Sim6EFw
         tpXdONz1CbtN9b9pWfkcuU2dk0tUGhTB5NSBw5X/CN0qCZksZR589jfnSACtXB1bjPkR
         eP4HJpgWgbwJFYNI7h77xsqiO+peZw9MPDrfQ3HDHiJ/UDRG7KxlUFNPjR+PMhEyx33s
         n7ag==
X-Forwarded-Encrypted: i=1; AKwUvByDxVv/Jh1kQGjkDWO+IPKza/rNUeBp/OCO+4tnlRr+kuTTcWPtX06slvm2YQ1tfq64+uK1iVrbNnb7@vger.kernel.org
X-Gm-Message-State: AFq9FYLSkY7TlEllmQU1ueGaTOOg68Wqgohb8/6yz113d2NNX5HM3msx
	Pr03D4b2IkXtIk1Pu7oFTaZpWYmlwSfI/X6bCkJhN6bgSx3yNGE/4mMt
X-Gm-Gg: AYBFou3cehhAa7ET6Fc5d2tsEPCEluaXHRXvcxkdIhgPM5KYHLpaysEDJWOAGz+oPu4
	aNLEzVFmESFvx3cINtdFM0ePdhYuD7Tn2NANA61dr0z+D9jjs+hOOeToqliltdzMnzucZAh4g0M
	fpSBJB6FLdtl0SGlsHJ5iOxCMSj5CaV6hcKaUUSA6y+G9HW1tfpUn9uz50XJdAWUdgCbQCYklo9
	d/+IrvVY1WZcZuVhB2N40TSU4KF8K+1hCuKxnWk9h5mvRMyj5+9CGeJR64rYiICKQcRlkPOZnbI
	FzV7BDX2GCwqJQymjUPyl1zmGOWUduh6fCpFDHMrmh7DJ3S3M+WskiczU8dk+4yvhC4sF9csQS6
	pQg0jklB/6SBx3+p2BETvQkPjqWSNbHllCCiuZi8VWzeaXB3d5m34lT2aqf15U6Ie72GqWORSSr
	+lNlwEUU3z5bBNNacAjyGEr0NqF2IZnuXChaqAP22fNAqVWNQ9y7rqNqzFhtEimFTn+9PXDuG5O
	ldZTWhyLYKzx+g2f9usJiXVvFcDP55vC7eZsNhCAf98R+38QzRFPqLq74YodT5Aks/QtU1KM1jR
X-Received: by 2002:a17:907:3ccc:b0:c29:f5d8:9c75 with SMTP id a640c23a62f3a-c46bde7eabemr1005881666b.36.1793101612946;
        Tue, 27 Oct 2026 04:46:52 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd529b3csm430692866b.37.2026.10.27.04.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:46:52 -0700 (PDT)
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
Subject: [PATCH v4 3/4] mfd: max8907: Switch to resource-managed versions of helpers
Date: Tue, 27 Oct 2026 13:46:33 +0200
Message-ID: <20261027114634.79706-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027114634.79706-1-clamor95@gmail.com>
References: <20261027114634.79706-1-clamor95@gmail.com>
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
index 363ac80c0593b..2a38e00a10c3b 100644
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
 
-	max8907 = devm_kzalloc(&i2c->dev, sizeof(struct max8907), GFP_KERNEL);
-	if (!max8907) {
-		ret = -ENOMEM;
-		goto err_alloc_drvdata;
-	}
+	max8907 = devm_kzalloc(dev, sizeof(*max8907), GFP_KERNEL);
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

