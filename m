Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7335352ED28
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 20:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788813258; cv=none; b=ZOSG5oRjkNr9G8BhYcBmYBmu7BOu3MDYuXUMjeb6P+1Dx6FkfJ/TvxGmjTsXmx/uHFC3Qnb10QUZgjbmRSH9IiTX8kmi3DgMW7+B2Op/m4bA+l69ZttTKWhGvonYhuuu8zga8VKUV3mNXqJsUhHQvlsTCxpbywF5l5hTjwnDYas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788813258; c=relaxed/simple;
	bh=u6W3uQqF5WC0l814vqgtpr19+91xoqe57+O0xG04yJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HiCTyVEBL+A/Nqx/XAZAu1PlsFBl4e7Xy9o5siyZxpJqdzkLTV5wiLZCJCACzG+manrmf0D2lFtxBZBSbGATJa5LGVlNSYalBR0RSjuNHajchvry7mzwNEvxGdmZs9NNHfnoiLsvbmjlXjZY7Iz4SMyn7Mhb8WKgBfCvNBhc3mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I2dbpTvN; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2dbpTvN"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4858303de5dso4849798f8f.2
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 13:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788813254; x=1789418054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqcKjV4zD80YFZLKABhggbODsHGhhWgZ8BP7yh3DqWw=;
        b=I2dbpTvNoJH8oZdQeYNIZ4QK9SNAIJWaAxxOqC7xxNeBhYERmZQcqNWeXtab/cwy+9
         dewnQcDHYGFDnpcsIYpbsG3qBmspkg0QoHedgK54nvf3Y+2C8SecWg4KBfoH5mRLtvI8
         j1zL7fEr3Po1dLYktXoBzxjgjFr6KJRpuW/nmNM2YWtQBcGZv9pzreE//Z7re6mxjFaP
         IzJEqSCcSUc3mVGTAQ94AMbKcSTmx+RgkDvkdJdlZ6zLVUfMvld259zkatLyEhi7S2+C
         W+f4HIEXUTjJU62Tj04hiIccWFzQOMZypDp/akchm8koe74oZZcwKj226hk8uCYwkVK8
         I3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788813254; x=1789418054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HqcKjV4zD80YFZLKABhggbODsHGhhWgZ8BP7yh3DqWw=;
        b=UXvi59GmBoGGeABrLfBQSuyWA3WzUoNrGsy4NcW/HPfJImAXqGbstQEpuOuJe0zhtG
         iJeTTBq3i5yyM8HNkZ4a7hvNT5hxYOx16Gq6hQGOKl0odVpoG/D3GTTtz2/Mu5jhAF8y
         aSOKRoPz8ERCtTfvoRgjdGffO5ocCk2Mv+1wVrVlzR5sRsQr7Iuw4kBAAOhj4la/4qdN
         sqnYm0brPjy9w6m5MqVCTH4n3bh2fWaSPzYAoGLPyoXnvvxGQBPlfPNWdUHhFtAEQ3qp
         cqzXEn5ad5hSmbi4McErWAeGTBvFgkWyz7z37DlIQq0nKa3+G0J8Gi9fJwfDUhTDaeI1
         c2BA==
X-Forwarded-Encrypted: i=1; AKwUvBywvsfipFR/p2fdkr2Grlxfhg2HWXT9eHKoR/oWNOg/VWY4fyAfoxaoWfSs3lgrzzAD856Tw4X9LnD/@vger.kernel.org
X-Gm-Message-State: AFuF++nwFdlkM8+SIEypsuBWJXlQRlVRroz5aTJfqZRm55EUKtdfdYlA
	s2xg72RCRJlObCmXguV6nOwyLR40ePnjn/4vrb3huZsIRpC85clxqAYt
X-Gm-Gg: AYBFou2wE3rWtSyeuO11kKXlN/uql4EfFcFAOu3gUKy0gJjA47Xe4TANGNhKdZXI+WK
	kTLgPYhJXwRVEA3qFksUV4kUyi8BZBWBl/MLJo9tvyb0XA+lUgylyjNu5g22Dx/35NT3G+IoPtb
	WWd7GrdwPaBp9v1kBMdYNe8gFvKxrf6Hx6+VVXqKIsb/jFLLB2kS1T4mjXyqrK0umomPOa+Zd6W
	mpCYzThtVVWXjt3YzlwLkAb3+x7GhuVSrrIxE59KA+Gj494jlnwnnUl/53FbJ8u9P/NNe7dP6eY
	gleXg2kwyvielbmxsrBbr/SB/a0zhfTZQe/4SQx6J4WWb5dKw5QlsGRYo+7CyB4Nid5g+m2zAvg
	GRS8HKtUNQHcWhHHPPPaDTm3+H36nbNnW2Mb//uItJ2zvQ1/wr1dglcV52eN7TDmyiem0x8+Vqf
	hgIqRm3qcStCUXdkESHZ5mf4CAExo2HNK2/gUYg9I499fNDlZx9Xk8lmSjdHAoKw==
X-Received: by 2002:a05:6000:2085:b0:484:3313:9475 with SMTP id ffacd0b85a97d-4858729a271mr26780978f8f.28.1788813254331;
        Mon, 07 Sep 2026 13:34:14 -0700 (PDT)
Received: from antoniarch ([78.212.37.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858e239862sm25959116f8f.9.2026.09.07.13.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:34:13 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v6 8/9] rtc: abx80x: create abx80x_i2c_probe()
Date: Mon,  7 Sep 2026 22:32:15 +0200
Message-ID: <20260907203216.53192-9-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907203216.53192-1-apokusinski01@gmail.com>
References: <20260907203216.53192-1-apokusinski01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the I2C-specific code from abx80x_probe() to the newly created
function. This is a preparation for introducing the support for
ABX81X RTCs which use SPI interface.

Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 drivers/rtc/rtc-abx80x.c | 173 ++++++++++++++++++++++++---------------
 1 file changed, 106 insertions(+), 67 deletions(-)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index b1d8d5a5ddcf..c90407a023fe 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -782,73 +782,38 @@ static const struct regmap_access_table abx80x_write_table = {
 	.n_no_ranges = ARRAY_SIZE(abx80x_no_write_ranges),
 };
 
-static const struct regmap_config abx80x_regmap_config_i2c = {
-	.reg_bits = 8,
-	.val_bits = 8,
-	.max_register = ABX8XX_SRAM_BASE + ABX8XX_SRAM_WIN_SIZE - 1,
-
-	.rd_table = &abx80x_read_table,
-	.wr_table = &abx80x_write_table,
-};
-
-static const struct i2c_device_id abx80x_id[] = {
-	{ .name = "abx80x", .driver_data = ABX80X },
-	{ .name = "ab0801", .driver_data = AB0801 },
-	{ .name = "ab0803", .driver_data = AB0803 },
-	{ .name = "ab0804", .driver_data = AB0804 },
-	{ .name = "ab0805", .driver_data = AB0805 },
-	{ .name = "ab1801", .driver_data = AB1801 },
-	{ .name = "ab1803", .driver_data = AB1803 },
-	{ .name = "ab1804", .driver_data = AB1804 },
-	{ .name = "ab1805", .driver_data = AB1805 },
-	{ .name = "rv1805", .driver_data = RV1805 },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, abx80x_id);
-
-static int abx80x_probe(struct i2c_client *client)
+static int abx80x_probe(struct device *dev, struct regmap *regmap, int irq,
+			struct device_node *np, unsigned int part)
 {
-	struct regmap *regmap;
-	struct device_node *np = client->dev.of_node;
 	struct abx80x_priv *priv;
 	int i, err, trickle_cfg = -EINVAL;
 	char buf[7];
-	unsigned int part = (uintptr_t)i2c_get_match_data(client);
 	unsigned int partnumber;
 	unsigned int majrev, minrev;
 	unsigned int lot;
 	unsigned int wafer;
 	unsigned int uid;
 
-	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
-		return -ENODEV;
-
-	regmap = devm_regmap_init_i2c(client, &abx80x_regmap_config_i2c);
-	if (IS_ERR(regmap)) {
-		dev_err(&client->dev, "Unable to allocate regmap\n");
-		return PTR_ERR(regmap);
-	}
-
-	priv = devm_kzalloc(&client->dev, sizeof(*priv), GFP_KERNEL);
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (priv == NULL)
 		return -ENOMEM;
 
-	priv->rtc = devm_rtc_allocate_device(&client->dev);
+	priv->rtc = devm_rtc_allocate_device(dev);
 	if (IS_ERR(priv->rtc))
 		return PTR_ERR(priv->rtc);
 
 	priv->rtc->ops = &abx80x_rtc_ops;
-	priv->irq = client->irq;
+	priv->irq = irq;
 	priv->regmap = regmap;
-	err = devm_mutex_init(&client->dev, &priv->lock);
+	err = devm_mutex_init(dev, &priv->lock);
 	if (err)
 		return err;
 
-	dev_set_drvdata(&client->dev, priv);
+	dev_set_drvdata(dev, priv);
 
 	err = regmap_bulk_read(regmap, ABX8XX_REG_ID0, buf, sizeof(buf));
 	if (err < 0) {
-		dev_err(&client->dev, "Unable to read partnumber\n");
+		dev_err(dev, "Unable to read partnumber\n");
 		return -EIO;
 	}
 
@@ -858,14 +823,14 @@ static int abx80x_probe(struct i2c_client *client)
 	lot = ((buf[4] & 0x80) << 2) | ((buf[6] & 0x80) << 1) | buf[3];
 	uid = ((buf[4] & 0x7f) << 8) | buf[5];
 	wafer = (buf[6] & 0x7c) >> 2;
-	dev_info(&client->dev, "model %04x, revision %u.%u, lot %x, wafer %x, uid %x\n",
+	dev_info(dev, "model %04x, revision %u.%u, lot %x, wafer %x, uid %x\n",
 		 partnumber, majrev, minrev, lot, wafer, uid);
 
 	err = regmap_update_bits(regmap, ABX8XX_REG_CTRL1,
 				 ABX8XX_CTRL_12_24 | ABX8XX_CTRL_ARST | ABX8XX_CTRL_WRITE,
 				 ABX8XX_CTRL_WRITE);
 	if (err < 0) {
-		dev_err(&client->dev, "Unable to write control register\n");
+		dev_err(dev, "Unable to write control register\n");
 		return -EIO;
 	}
 
@@ -880,7 +845,7 @@ static int abx80x_probe(struct i2c_client *client)
 		err = regmap_update_bits(regmap, ABX8XX_REG_CTRL2,
 					 ABX8XX_CTRL2_RSVD, 0);
 		if (err < 0) {
-			dev_err(&client->dev, "Unable to write control2 register\n");
+			dev_err(dev, "Unable to write control2 register\n");
 			return -EIO;
 		}
 
@@ -888,7 +853,7 @@ static int abx80x_probe(struct i2c_client *client)
 		 * Write the configuration key register to enable access to
 		 * the config2 register
 		 */
-		if (abx80x_write_config_key(&client->dev, ABX8XX_CFG_KEY_MISC) < 0)
+		if (abx80x_write_config_key(dev, ABX8XX_CFG_KEY_MISC) < 0)
 			return -EIO;
 
 		/*
@@ -900,7 +865,7 @@ static int abx80x_probe(struct i2c_client *client)
 					ABX8XX_OUT_CTRL_EXDS,
 					ABX8XX_OUT_CTRL_EXDS);
 		if (err < 0) {
-			dev_err(&client->dev,
+			dev_err(dev,
 				"Unable to write output control register\n");
 			return -EIO;
 		}
@@ -912,26 +877,24 @@ static int abx80x_probe(struct i2c_client *client)
 			if (partnumber == abx80x_caps[i].pn)
 				break;
 		if (abx80x_caps[i].pn == 0) {
-			dev_err(&client->dev, "Unknown part: %04x\n",
-				partnumber);
+			dev_err(dev, "Unknown part: %04x\n", partnumber);
 			return -EINVAL;
 		}
 		part = i;
 	}
 
 	if (partnumber != abx80x_caps[part].pn) {
-		dev_err(&client->dev, "partnumber mismatch %04x != %04x\n",
+		dev_err(dev, "partnumber mismatch %04x != %04x\n",
 			partnumber, abx80x_caps[part].pn);
 		return -EINVAL;
 	}
 
 	if (np && abx80x_caps[part].has_tc)
-		trickle_cfg = abx80x_dt_trickle_cfg(&client->dev);
+		trickle_cfg = abx80x_dt_trickle_cfg(dev);
 
 	if (trickle_cfg > 0) {
-		dev_info(&client->dev, "Enabling trickle charger: %02x\n",
-			 trickle_cfg);
-		abx80x_enable_trickle_charger(&client->dev, trickle_cfg);
+		dev_info(dev, "Enabling trickle charger: %02x\n", trickle_cfg);
+		abx80x_enable_trickle_charger(dev, trickle_cfg);
 	}
 
 	err = regmap_write(regmap, ABX8XX_REG_CD_TIMER_CTL, BIT(2));
@@ -939,7 +902,7 @@ static int abx80x_probe(struct i2c_client *client)
 		return err;
 
 	if (abx80x_caps[part].has_wdog) {
-		err = abx80x_setup_watchdog(&client->dev);
+		err = abx80x_setup_watchdog(dev);
 		if (err)
 			return err;
 	}
@@ -953,30 +916,30 @@ static int abx80x_probe(struct i2c_client *client)
 				 ABX8XX_IRQ_EX1E | ABX8XX_IRQ_EX2E |
 				 ABX8XX_IRQ_TIE | ABX8XX_IRQ_BLIE, 0);
 	if (err < 0) {
-		dev_err(&client->dev, "Unable to update irq register\n");
+		dev_err(dev, "Unable to update irq register\n");
 		return -EIO;
 	}
 
 	/* Unlock write access to Oscillator Control Register */
-	if (abx80x_write_config_key(client, ABX8XX_CFG_KEY_OSC) < 0)
+	if (abx80x_write_config_key(dev, ABX8XX_CFG_KEY_OSC) < 0)
 		return -EIO;
 
 	err = regmap_write_bits(regmap, ABX8XX_REG_OSC,
 				ABX8XX_OSC_ACIE | ABX8XX_OSC_OFIE, 0);
 	if (err < 0) {
-		dev_err(&client->dev, "Unable to update Oscillator Control register\n");
+		dev_err(dev, "Unable to update Oscillator Control register\n");
 		return -EIO;
 	}
 
 	if (priv->irq > 0) {
-		dev_info(&client->dev, "IRQ %d supplied\n", priv->irq);
-		err = devm_request_threaded_irq(&client->dev, priv->irq, NULL,
+		dev_info(dev, "IRQ %d supplied\n", priv->irq);
+		err = devm_request_threaded_irq(dev, priv->irq, NULL,
 						abx80x_handle_irq,
 						IRQF_SHARED | IRQF_ONESHOT,
 						"abx8xx",
-						&client->dev);
+						dev);
 		if (err) {
-			dev_err(&client->dev, "unable to request IRQ, alarms disabled\n");
+			dev_err(dev, "unable to request IRQ, alarms disabled\n");
 			priv->irq = 0;
 		}
 	}
@@ -985,14 +948,39 @@ static int abx80x_probe(struct i2c_client *client)
 
 	err = rtc_add_group(priv->rtc, &rtc_calib_attr_group);
 	if (err) {
-		dev_err(&client->dev, "Failed to create sysfs group: %d\n",
-			err);
+		dev_err(dev, "Failed to create sysfs group: %d\n", err);
 		return err;
 	}
 
 	return devm_rtc_register_device(priv->rtc);
 }
 
+#if IS_ENABLED(CONFIG_I2C)
+
+static const struct regmap_config abx80x_regmap_config_i2c = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = ABX8XX_SRAM_BASE + ABX8XX_SRAM_WIN_SIZE - 1,
+
+	.rd_table = &abx80x_read_table,
+	.wr_table = &abx80x_write_table,
+};
+
+static const struct i2c_device_id abx80x_id[] = {
+	{ .name = "abx80x", .driver_data = ABX80X },
+	{ .name = "ab0801", .driver_data = AB0801 },
+	{ .name = "ab0803", .driver_data = AB0803 },
+	{ .name = "ab0804", .driver_data = AB0804 },
+	{ .name = "ab0805", .driver_data = AB0805 },
+	{ .name = "ab1801", .driver_data = AB1801 },
+	{ .name = "ab1803", .driver_data = AB1803 },
+	{ .name = "ab1804", .driver_data = AB1804 },
+	{ .name = "ab1805", .driver_data = AB1805 },
+	{ .name = "rv1805", .driver_data = RV1805 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, abx80x_id);
+
 #ifdef CONFIG_OF
 static const struct of_device_id abx80x_of_match[] = {
 	{
@@ -1040,16 +1028,67 @@ static const struct of_device_id abx80x_of_match[] = {
 MODULE_DEVICE_TABLE(of, abx80x_of_match);
 #endif
 
+static int abx80x_i2c_probe(struct i2c_client *client)
+{
+	unsigned int part = (uintptr_t)i2c_get_match_data(client);
+	struct regmap *regmap;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
+		return -ENODEV;
+
+	regmap = devm_regmap_init_i2c(client, &abx80x_regmap_config_i2c);
+	if (IS_ERR(regmap)) {
+		dev_err(&client->dev, "Unable to allocate regmap\n");
+		return PTR_ERR(regmap);
+	}
+
+	return abx80x_probe(&client->dev, regmap, client->irq,
+			    client->dev.of_node, part);
+}
+
 static struct i2c_driver abx80x_driver = {
 	.driver		= {
 		.name	= "rtc-abx80x",
 		.of_match_table = of_match_ptr(abx80x_of_match),
 	},
-	.probe		= abx80x_probe,
+	.probe		= abx80x_i2c_probe,
 	.id_table	= abx80x_id,
 };
 
-module_i2c_driver(abx80x_driver);
+static int abx80x_register_driver(void)
+{
+	return i2c_add_driver(&abx80x_driver);
+}
+
+static void abx80x_unregister_driver(void)
+{
+	i2c_del_driver(&abx80x_driver);
+}
+
+#else
+
+static int abx80x_register_driver(void)
+{
+	return 0;
+}
+
+static void abx80x_unregister_driver(void)
+{
+}
+
+#endif /* IS_ENABLED(CONFIG_I2C) */
+
+static int __init abx80x_init(void)
+{
+	return abx80x_register_driver();
+}
+module_init(abx80x_init);
+
+static void __exit abx80x_exit(void)
+{
+	abx80x_unregister_driver();
+}
+module_exit(abx80x_exit);
 
 MODULE_AUTHOR("Philippe De Muyter <phdm@macqel.be>");
 MODULE_AUTHOR("Alexandre Belloni <alexandre.belloni@bootlin.com>");
-- 
2.55.0

