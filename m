Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A43B49553A
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985742; cv=none; b=eShQSFcfiHSPLWnE8RM9iMsFKlndWpIeO0AfqZucFvFEZHckNvDMSFDScfQV8UL6KDwym6nzfjO4YFM2ildT19yTpiufODTIlzRgN6chtlCPq9xhnNRC3yQl84dZ34EgTf11uEyhzTNvesObfKBnz98LeMvOgwVJvSt0HA4mXrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985742; c=relaxed/simple;
	bh=6ky9g4KHbUV3l6SHftocKchWejvDlv/fyysqR2kd4OU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gEo2rI3isqOiK3MgS1KSg69gOstR2RojLHdZBpD4xkHAZg4TVqu8Y8k5+r1T+94BAh3L+4rDkqUbJXs0zIZfCSafjRJN4ccg+ggvoHkOeF4SvGgjlqVWoPmfO/IlgsNr7C6Pat3Z8QJluodr9HwBomgev0W4WwVMPDBM46HNtnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P7UV/XfY; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P7UV/XfY"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4629051c946so276394f8f.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782985738; x=1783590538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0e97GBzjavtlOTUp72tsBF2P0b5wNf0hxsRbkXrGaZ4=;
        b=P7UV/XfY4cFIuaelJPVC0LK9q7hPQBVJdZ4TVUD1Vso3meyFC5VE87NhE0iipYQRen
         Er7bU8EzvnriZUopaPOtYjVb2q86W9T+Xc3bA725b/OqkfnQUqA5gFfGJUwgb30WYh1s
         QCF5lRfhGpbEe9ndvFbqe7MWjCb7vZU8BRXwe5/IEetLm6K/UvEPQVrD5jCyX57oebDb
         Rn+x0gB/MLOEgkIPZK8XiPTJpJDWGUIg6ZUjp1aN6DpK/R71myHP9hVO9HEJwtdFWycS
         theM8/MibhsNiClX9PNAqhwWDhE3Fwx5UWfjVSpu1PzrXhrlZ/4gwguDEMFzhtWSvaZk
         69sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985738; x=1783590538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0e97GBzjavtlOTUp72tsBF2P0b5wNf0hxsRbkXrGaZ4=;
        b=NzGvi9R2/pbArutX+8X2Jy3Txg8fYvc/7pbv5t7twjt/tPkIpBQRyq44KpHfZBLz74
         O63HNx4u4bn9vjKZ/TUtpnGYioITgyqBWt4n1bw+SwXz4aU/4K3yKBDmNRRwnepVt/PY
         kZOZiTfkkvf44LhJ0Y4imC12kqaYaZSbVHhCGGtHRqaNPcEFkyjZjpehbzgd6Fql1F2Q
         YJyqvDZHe8BEJWNWOJqgOvUD2d8ccRlSoJK5tJNfVzY88ouBKVT3TIh1HKo/aYtciCoP
         KP8v5Pgc6W2vNeLNZnr5bnGgVJR/rjn7ChoeGli4ZkcJsj9waQHSYJMi405q/GF1KSoC
         gnvQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqw6tCHABbg7qaXMoOz2NOCX6lmc38e51uvuDYSspABho33ymNCA7jj7xGmi5CF+5ao54V1fYP5/ZIF@vger.kernel.org
X-Gm-Message-State: AOJu0YwgpHPpicEL4hyNoHLRcy30GzG1DkKPF+8qKm0Zz0VjSN6k1+BR
	vLBwCUV12F1vdN1O6NQTfGGv/0TNJjNEIBpsLV7YYpOU7jwjRcWIKHHE
X-Gm-Gg: AfdE7cn+MCXsScg4WZoDbMl+bkptbvrm9fTnHsisLSU6cIfAHhU7nlbVRdgIajL2rYm
	4xu5yAkr2ZzrDkIsFsSfxJzc/LrJWMo0SvYUXCsOtJVmMIPCguJAF/mFwC1itBwX18RUVMGxLru
	RsWVqUJPXpOEXvjEaU3j5gssOXhMxwRrLhtuMuUXzrp1jBiZ+7RatnlmmcPDesQQyEccYxhKwLH
	LvwlGOflF63ieau6Pp3dbuCmo0rkwLOQXYwlzEVhLFJOKUS4zTLvfTF5B5FVWQntZN8HwTygP2g
	k7fKcDHgo6guOpIGk9idHDNDDHmH7uXgcLyL7+fZOw6TDlLqSgnraYjn0nl7yTqbNHPFjY8/nNy
	GuUCTR9jc0cxAnz9s0EmqRZTo7o6JUX73NZhh7eJTOPbq6d7JX98rwV9RUVZ3w+gw2mDQChv018
	aEvkYGP8iov7grKZ6CGC0Gz7qcoiafm+TB1dRPa3wod7pAiQfpuXO2+wDbYt+nLghyzrQ5QmFbt
	2+LVKeS1t9SBV2Y
X-Received: by 2002:a05:6000:4a13:b0:472:e43b:5e8c with SMTP id ffacd0b85a97d-475dff5e567mr13844172f8f.20.1782985738375;
        Thu, 02 Jul 2026 02:48:58 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-52-250-217.retail.telecomitalia.it. [79.52.250.217])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-477dbe617b1sm7381364f8f.16.2026.07.02.02.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:48:57 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v6 3/7] thermal/drivers: airoha: Convert to regmap API
Date: Thu,  2 Jul 2026 11:48:31 +0200
Message-ID: <20260702094846.17325-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260702094846.17325-1-ansuelsmth@gmail.com>
References: <20260702094846.17325-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In preparation for support of Airoha AN7583, convert the driver to
regmap API. This is needed as Airoha AN7583 will be based on syscon
regmap.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/thermal/airoha_thermal.c | 77 +++++++++++++++++++-------------
 1 file changed, 45 insertions(+), 32 deletions(-)

diff --git a/drivers/thermal/airoha_thermal.c b/drivers/thermal/airoha_thermal.c
index 829a7327fc40..b63893a8997a 100644
--- a/drivers/thermal/airoha_thermal.c
+++ b/drivers/thermal/airoha_thermal.c
@@ -194,7 +194,7 @@
 #define AIROHA_MAX_SAMPLES			6
 
 struct airoha_thermal_priv {
-	void __iomem *base;
+	struct regmap *map;
 	struct regmap *chip_scu;
 	struct resource scu_adc_res;
 
@@ -265,8 +265,8 @@ static int airoha_thermal_set_trips(struct thermal_zone_device *tz, int low,
 			       RAW_TO_TEMP(priv, FIELD_MAX(EN7581_DOUT_TADC_MASK)));
 
 		/* We offset the high temp of 1°C to trigger correct event */
-		writel(TEMP_TO_RAW(priv, high) >> 4,
-		       priv->base + EN7581_TEMPOFFSETH);
+		regmap_write(priv->map, EN7581_TEMPOFFSETH,
+			     TEMP_TO_RAW(priv, high) >> 4);
 
 		enable_monitor = true;
 	}
@@ -277,15 +277,15 @@ static int airoha_thermal_set_trips(struct thermal_zone_device *tz, int low,
 			      RAW_TO_TEMP(priv, FIELD_MAX(EN7581_DOUT_TADC_MASK)));
 
 		/* We offset the low temp of 1°C to trigger correct event */
-		writel(TEMP_TO_RAW(priv, low) >> 4,
-		       priv->base + EN7581_TEMPOFFSETL);
+		regmap_write(priv->map, EN7581_TEMPOFFSETL,
+			     TEMP_TO_RAW(priv, low) >> 4);
 
 		enable_monitor = true;
 	}
 
 	/* Enable sensor 0 monitor after trip are set */
 	if (enable_monitor)
-		writel(EN7581_SENSE0_EN, priv->base + EN7581_TEMPMONCTL0);
+		regmap_write(priv->map, EN7581_TEMPMONCTL0, EN7581_SENSE0_EN);
 
 	return 0;
 }
@@ -300,9 +300,9 @@ static irqreturn_t airoha_thermal_irq(int irq, void *data)
 	struct airoha_thermal_priv *priv = data;
 	enum thermal_notify_event event;
 	bool update = false;
-	u32 status;
+	u32 status = 0;
 
-	status = readl(priv->base + EN7581_TEMPMONINTSTS);
+	regmap_read(priv->map, EN7581_TEMPMONINTSTS, &status);
 	switch (status & (EN7581_HOFSINTSTS0 | EN7581_LOFSINTSTS0)) {
 	case EN7581_HOFSINTSTS0:
 		event = THERMAL_TRIP_VIOLATED;
@@ -318,7 +318,7 @@ static irqreturn_t airoha_thermal_irq(int irq, void *data)
 	}
 
 	/* Reset Interrupt */
-	writel(status, priv->base + EN7581_TEMPMONINTSTS);
+	regmap_write(priv->map, EN7581_TEMPMONINTSTS, status);
 
 	if (update)
 		thermal_zone_device_update(priv->tz, event);
@@ -329,18 +329,19 @@ static irqreturn_t airoha_thermal_irq(int irq, void *data)
 static void airoha_thermal_setup_adc_val(struct device *dev,
 					 struct airoha_thermal_priv *priv)
 {
-	u32 efuse_calib_info, cpu_sensor;
+	u32 efuse_calib_info = 0;
+	u32 cpu_sensor = 0;
 
 	/* Setup thermal sensor to ADC mode and setup the mux to DIODE1 */
 	airoha_init_thermal_ADC_mode(priv);
 	/* sleep 10 ms for ADC to enable */
 	usleep_range(10 * USEC_PER_MSEC, 11 * USEC_PER_MSEC);
 
-	efuse_calib_info = readl(priv->base + EN7581_EFUSE_TEMP_OFFSET_REG);
+	regmap_read(priv->map, EN7581_EFUSE_TEMP_OFFSET_REG, &efuse_calib_info);
 	if (efuse_calib_info) {
 		priv->default_offset = FIELD_GET(EN7581_EFUSE_TEMP_OFFSET, efuse_calib_info);
 		/* Different slope are applied if the sensor is used for CPU or for package */
-		cpu_sensor = readl(priv->base + EN7581_EFUSE_TEMP_CPU_SENSOR_REG);
+		regmap_read(priv->map, EN7581_EFUSE_TEMP_CPU_SENSOR_REG, &cpu_sensor);
 		if (cpu_sensor) {
 			priv->default_slope = EN7581_SLOPE_X100_DIO_DEFAULT;
 			priv->init_temp = EN7581_INIT_TEMP_FTK_X10;
@@ -359,8 +360,8 @@ static void airoha_thermal_setup_adc_val(struct device *dev,
 static void airoha_thermal_setup_monitor(struct airoha_thermal_priv *priv)
 {
 	/* Set measure mode */
-	writel(FIELD_PREP(EN7581_MSRCTL0, EN7581_MSRCTL_6SAMPLE_MAX_MIX_AVG4),
-	       priv->base + EN7581_TEMPMSRCTL0);
+	regmap_write(priv->map, EN7581_TEMPMSRCTL0,
+		     FIELD_PREP(EN7581_MSRCTL0, EN7581_MSRCTL_6SAMPLE_MAX_MIX_AVG4));
 
 	/*
 	 * Configure ADC valid reading addr
@@ -375,15 +376,15 @@ static void airoha_thermal_setup_monitor(struct airoha_thermal_priv *priv)
 	 * We set valid instead of volt as we don't enable valid/volt
 	 * split reading and AHB read valid addr in such case.
 	 */
-	writel(priv->scu_adc_res.start + EN7581_DOUT_TADC,
-	       priv->base + EN7581_TEMPADCVALIDADDR);
+	regmap_write(priv->map, EN7581_TEMPADCVALIDADDR,
+		     priv->scu_adc_res.start + EN7581_DOUT_TADC);
 
 	/*
 	 * Configure valid bit on a fake value of bit 16. The ADC outputs
 	 * max of 2 bytes for voltage.
 	 */
-	writel(FIELD_PREP(EN7581_ADV_RD_VALID_POS, 16),
-	       priv->base + EN7581_TEMPADCVALIDMASK);
+	regmap_write(priv->map, EN7581_TEMPADCVALIDMASK,
+		     FIELD_PREP(EN7581_ADV_RD_VALID_POS, 16));
 
 	/*
 	 * AHB supports max 12 bytes for ADC voltage. Shift the read
@@ -391,40 +392,52 @@ static void airoha_thermal_setup_monitor(struct airoha_thermal_priv *priv)
 	 * in the order of half a °C and is acceptable in the context
 	 * of triggering interrupt in critical condition.
 	 */
-	writel(FIELD_PREP(EN7581_ADC_VOLTAGE_SHIFT, 4),
-	       priv->base + EN7581_TEMPADCVOLTAGESHIFT);
+	regmap_write(priv->map, EN7581_TEMPADCVOLTAGESHIFT,
+		     FIELD_PREP(EN7581_ADC_VOLTAGE_SHIFT, 4));
 
 	/* BUS clock is 300MHz counting unit is 3 * 68.64 * 256 = 52.715us */
-	writel(FIELD_PREP(EN7581_PERIOD_UNIT, 3),
-	       priv->base + EN7581_TEMPMONCTL1);
+	regmap_write(priv->map, EN7581_TEMPMONCTL1,
+		     FIELD_PREP(EN7581_PERIOD_UNIT, 3));
 
 	/*
 	 * filt interval is 1 * 52.715us = 52.715us,
 	 * sen interval is 379 * 52.715us = 19.97ms
 	 */
-	writel(FIELD_PREP(EN7581_FILT_INTERVAL, 1) |
-	       FIELD_PREP(EN7581_SEN_INTERVAL, 379),
-	       priv->base + EN7581_TEMPMONCTL2);
+	regmap_write(priv->map, EN7581_TEMPMONCTL2,
+		     FIELD_PREP(EN7581_FILT_INTERVAL, 1) |
+		     FIELD_PREP(EN7581_SEN_INTERVAL, 379));
 
 	/* AHB poll is set to 146 * 68.64 = 10.02us */
-	writel(FIELD_PREP(EN7581_ADC_POLL_INTVL, 146),
-	       priv->base + EN7581_TEMPAHBPOLL);
+	regmap_write(priv->map, EN7581_TEMPAHBPOLL,
+		     FIELD_PREP(EN7581_ADC_POLL_INTVL, 146));
 }
 
+static const struct regmap_config airoha_thermal_regmap_config = {
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+};
+
 static int airoha_thermal_probe(struct platform_device *pdev)
 {
 	struct airoha_thermal_priv *priv;
 	struct device_node *chip_scu_np;
 	struct device *dev = &pdev->dev;
+	void __iomem *base;
 	int irq, ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	priv->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(priv->base))
-		return PTR_ERR(priv->base);
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	priv->map = devm_regmap_init_mmio(dev, base,
+					  &airoha_thermal_regmap_config);
+	if (IS_ERR(priv->map))
+		return PTR_ERR(priv->map);
 
 	chip_scu_np = of_parse_phandle(dev->of_node, "airoha,chip-scu", 0);
 	if (!chip_scu_np)
@@ -462,8 +475,8 @@ static int airoha_thermal_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, priv);
 
 	/* Enable LOW and HIGH interrupt */
-	writel(EN7581_HOFSINTEN0 | EN7581_LOFSINTEN0,
-	       priv->base + EN7581_TEMPMONINT);
+	regmap_write(priv->map, EN7581_TEMPMONINT,
+		     EN7581_HOFSINTEN0 | EN7581_LOFSINTEN0);
 
 	return 0;
 }
-- 
2.53.0

