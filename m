Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3204963D9
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985743; cv=none; b=FeCswJNunwDAtzFtThRak9ZuQDunYfiPDpcxkc4MHneqk3XzwIPe8aRymV91qdkj0FtMgkOcmqB6T86vJCeHu3pqDUEc5q4hH+FNly7GhkuGrCgxwz7gEgbyklJmell0Wo9cIGDQjlEjIVU2DCrb49h4JPwdMvTpCnZlAsBfYWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985743; c=relaxed/simple;
	bh=XuOknPD1hS2q5HwdOufPrXyYQTeSyWpjJoiPkpF0LtA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fT0+qqmNyYA4DgJ2DVM7alNSIkvyR+m3bq9HokyHYMP13pcASA32cPIpFK0lANQMcTNrwaCQ5hgVhyDmWzI2fdFyROmx4QIF7vLB86SnPkrX688Z3F69/+8CwoPfObYMJOcuXHmpd4ri5FejMU0cgTR26ntwe2dgdk5SizNyhKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCTXV7/N; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCTXV7/N"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-475881b9a4bso1634838f8f.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782985740; x=1783590540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7oxMnXh4V+hcg0T9wDKZ3oIMULl0k+cYP8lb8bHQAhQ=;
        b=cCTXV7/Nex//DIsCGVpfJOe33eKNTw06z8TisMyhFSyF0ZE+zxM4xeeUyFujf0pVom
         LAQ7RnM6yiiMLnfea13GwupxKR2NSDcdYov1bKjKT+/wgNztdlutX9yhvwBV1IKF5HlL
         jJKXdTz6KP/iWxyRSO9ZRpZlYkdTxmzpMYWPrpll8GSLrxe8vyPm3JP1i7y9wwhZZFn9
         sQl9KTswlJEIHov/ACdxsPQWPfRMNxIZ7vl4zy+XzVP6m9nTvo18nOpaWCjIWNIC3Q5v
         w4COXMdi9YCJ7WUWLZJkWmjxuvs1fz5EgywdBLxOn6AlqLGyMpdxvSnXZFjlqkpxQlhI
         PfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985740; x=1783590540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7oxMnXh4V+hcg0T9wDKZ3oIMULl0k+cYP8lb8bHQAhQ=;
        b=npK2th6dYQeNo0FbZyiuYXTETkKG1JOQT2lqLqeC0RRcMyr/ZIwdMQfJ6ivn6Rdt3b
         nh+qn+wdpm6ImrmBN+RkhbpnJm3c9ugDiVRS0IusgxPoa6EflUMKmO5wAi7LiPSN7zi5
         g6TET7pYyZYG6r/28Bu5tXqA2fmk+dIxw2xZjK8DKeNJxHe3K5TRWAlUFKWAgZ9N03Df
         HHQZl+NufEbc6Ks7Q3w1+PCQ0r5jiy8XNxluZUK4N7Yvtyl8lE1/hn0g5icBd6CzzubD
         XGklrRg7goLqE1e2h3S0osK1yekTg9jMKi8+DKCCX/KTO8SuvQPNLLv/s9YV1cez284C
         Ni4A==
X-Forwarded-Encrypted: i=1; AHgh+RoAf0/3wpaAk7J84nPtzZZWIQaFr8r7ijcuTAMB4NOZ7Bv6N02yZVvAPMW8p1VlRPWcGbrNNDWysbvz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7AigmqgSMZrn3kUC346jkPDl+R7S5yrpJJs8oiBouxzzH6Kgi
	Fwm6zBtGqgq8gwEyr/RA7OSGZvpeY7YesTnTNq0Iu4z3OdYlFw/4JvR1
X-Gm-Gg: AfdE7clIlr7FV4QohThIjOr4L4eJprOb12u+rkzMbx71VGxW2SipGSxPmCwsGge2ZkH
	GoBP1RKpg7PFA87bX4KTkA3bja6D6Je3j7CooTAb422IyQhjxHE4kEAP3gUAgIbQEiTBOAH883Y
	roLB8vAu+wkHfdcuym3SkfEbybShuEXNKbkDLdQ0+Qc+rD7MyLjx0zNREwrYbKFX7Hdk+sBrmoV
	V9vmPhbm6GQhC1R/rKhFHrgXuZmNbL9VLRoe9ifTIaDNzK0XXyral/w+GkX6IwIYB4OX2GcVSMC
	w5H0n1jm7DXXKoS62WzRhLCWxyLctAo9XqpW7jSUCuEWbxDGHBCQFiC3ypumwYFaSS+aNTh05RP
	5A7wEHyuG05AOuUyCVIQlCfM0dbJVp6MzkQZmxwr9pxwqqXoOS5Ij9Ral1F4FnCsehWLpUz5uz1
	82GCQc01aD9P0hGH6GrlS4eLXH1v5D4+mllfZ9DNBpEBrjFjIFXBQf71evm8PkEcSVJck5w9/p0
	r1gMw==
X-Received: by 2002:a05:6000:2087:b0:477:3d23:f920 with SMTP id ffacd0b85a97d-477b3e55ab7mr6235026f8f.26.1782985739651;
        Thu, 02 Jul 2026 02:48:59 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-52-250-217.retail.telecomitalia.it. [79.52.250.217])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-477dbe617b1sm7381364f8f.16.2026.07.02.02.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:48:59 -0700 (PDT)
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
Subject: [PATCH v6 4/7] thermal/drivers: airoha: Generalize probe function
Date: Thu,  2 Jul 2026 11:48:32 +0200
Message-ID: <20260702094846.17325-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260702094846.17325-1-ansuelsmth@gmail.com>
References: <20260702094846.17325-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for support of Airoha AN7583, generalize the probe
function to address for the 2 SoC differece.

Implement a match_data struct where it's possible to define a more
specific probe and post_probe function and specific thermal ops and
pllrg protect value.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/thermal/airoha_thermal.c | 102 +++++++++++++++++++++++--------
 1 file changed, 75 insertions(+), 27 deletions(-)

diff --git a/drivers/thermal/airoha_thermal.c b/drivers/thermal/airoha_thermal.c
index b63893a8997a..ebb47ae5f2ce 100644
--- a/drivers/thermal/airoha_thermal.c
+++ b/drivers/thermal/airoha_thermal.c
@@ -198,12 +198,23 @@ struct airoha_thermal_priv {
 	struct regmap *chip_scu;
 	struct resource scu_adc_res;
 
+	u32 pllrg_protect;
+
 	struct thermal_zone_device *tz;
 	int init_temp;
 	int default_slope;
 	int default_offset;
 };
 
+struct airoha_thermal_soc_data {
+	u32 pllrg_protect;
+
+	const struct thermal_zone_device_ops *thdev_ops;
+	int (*probe)(struct platform_device *pdev,
+		     struct airoha_thermal_priv *priv);
+	int (*post_probe)(struct platform_device *pdev);
+};
+
 static int airoha_get_thermal_ADC(struct airoha_thermal_priv *priv)
 {
 	u32 val;
@@ -220,7 +231,8 @@ static void airoha_init_thermal_ADC_mode(struct airoha_thermal_priv *priv)
 	regmap_read(priv->chip_scu, EN7581_PLLRG_PROTECT, &pllrg);
 
 	/* Give access to thermal regs */
-	regmap_write(priv->chip_scu, EN7581_PLLRG_PROTECT, EN7581_SCU_THERMAL_PROTECT_KEY);
+	regmap_write(priv->chip_scu, EN7581_PLLRG_PROTECT,
+		     priv->pllrg_protect);
 	adc_mux = FIELD_PREP(EN7581_MUX_TADC, EN7581_SCU_THERMAL_MUX_DIODE1);
 	regmap_write(priv->chip_scu, EN7581_PWD_TADC, adc_mux);
 
@@ -228,7 +240,7 @@ static void airoha_init_thermal_ADC_mode(struct airoha_thermal_priv *priv)
 	regmap_write(priv->chip_scu, EN7581_PLLRG_PROTECT, pllrg);
 }
 
-static int airoha_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
+static int en7581_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
 {
 	struct airoha_thermal_priv *priv = thermal_zone_device_priv(tz);
 	int min_value, max_value, avg_value, value;
@@ -253,7 +265,7 @@ static int airoha_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
 	return 0;
 }
 
-static int airoha_thermal_set_trips(struct thermal_zone_device *tz, int low,
+static int en7581_thermal_set_trips(struct thermal_zone_device *tz, int low,
 				    int high)
 {
 	struct airoha_thermal_priv *priv = thermal_zone_device_priv(tz);
@@ -290,12 +302,12 @@ static int airoha_thermal_set_trips(struct thermal_zone_device *tz, int low,
 	return 0;
 }
 
-static const struct thermal_zone_device_ops thdev_ops = {
-	.get_temp = airoha_thermal_get_temp,
-	.set_trips = airoha_thermal_set_trips,
+static const struct thermal_zone_device_ops en7581_thdev_ops = {
+	.get_temp = en7581_thermal_get_temp,
+	.set_trips = en7581_thermal_set_trips,
 };
 
-static irqreturn_t airoha_thermal_irq(int irq, void *data)
+static irqreturn_t en7581_thermal_irq(int irq, void *data)
 {
 	struct airoha_thermal_priv *priv = data;
 	enum thermal_notify_event event;
@@ -326,7 +338,7 @@ static irqreturn_t airoha_thermal_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static void airoha_thermal_setup_adc_val(struct device *dev,
+static void en7581_thermal_setup_adc_val(struct device *dev,
 					 struct airoha_thermal_priv *priv)
 {
 	u32 efuse_calib_info = 0;
@@ -357,7 +369,7 @@ static void airoha_thermal_setup_adc_val(struct device *dev,
 	}
 }
 
-static void airoha_thermal_setup_monitor(struct airoha_thermal_priv *priv)
+static void en7581_thermal_setup_monitor(struct airoha_thermal_priv *priv)
 {
 	/* Set measure mode */
 	regmap_write(priv->map, EN7581_TEMPMSRCTL0,
@@ -412,30 +424,26 @@ static void airoha_thermal_setup_monitor(struct airoha_thermal_priv *priv)
 		     FIELD_PREP(EN7581_ADC_POLL_INTVL, 146));
 }
 
-static const struct regmap_config airoha_thermal_regmap_config = {
+static const struct regmap_config en7581_thermal_regmap_config = {
 	.reg_bits		= 32,
 	.reg_stride		= 4,
 	.val_bits		= 32,
 };
 
-static int airoha_thermal_probe(struct platform_device *pdev)
+static int en7581_thermal_probe(struct platform_device *pdev,
+				struct airoha_thermal_priv *priv)
 {
-	struct airoha_thermal_priv *priv;
 	struct device_node *chip_scu_np;
 	struct device *dev = &pdev->dev;
 	void __iomem *base;
 	int irq, ret;
 
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
 	priv->map = devm_regmap_init_mmio(dev, base,
-					  &airoha_thermal_regmap_config);
+					  &en7581_thermal_regmap_config);
 	if (IS_ERR(priv->map))
 		return PTR_ERR(priv->map);
 
@@ -455,18 +463,55 @@ static int airoha_thermal_probe(struct platform_device *pdev)
 		return irq;
 
 	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
-					airoha_thermal_irq, IRQF_ONESHOT,
+					en7581_thermal_irq, IRQF_ONESHOT,
 					pdev->name, priv);
 	if (ret) {
 		dev_err(dev, "Can't get interrupt working.\n");
 		return ret;
 	}
 
-	airoha_thermal_setup_monitor(priv);
-	airoha_thermal_setup_adc_val(dev, priv);
+	en7581_thermal_setup_monitor(priv);
+	en7581_thermal_setup_adc_val(dev, priv);
+
+	return 0;
+}
+
+static int en7581_thermal_post_probe(struct platform_device *pdev)
+{
+	struct airoha_thermal_priv *priv = platform_get_drvdata(pdev);
+
+	/* Enable LOW and HIGH interrupt (if supported) */
+	regmap_write(priv->map, EN7581_TEMPMONINT,
+		     EN7581_HOFSINTEN0 | EN7581_LOFSINTEN0);
+
+	return 0;
+}
+
+static int airoha_thermal_probe(struct platform_device *pdev)
+{
+	const struct airoha_thermal_soc_data *soc_data;
+	struct airoha_thermal_priv *priv;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	soc_data = device_get_match_data(dev);
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->pllrg_protect = soc_data->pllrg_protect;
+
+	if (!soc_data->probe)
+		return -EINVAL;
+
+	ret = soc_data->probe(pdev, priv);
+	if (ret)
+		return ret;
 
 	/* register of thermal sensor and get info from DT */
-	priv->tz = devm_thermal_of_zone_register(dev, 0, priv, &thdev_ops);
+	priv->tz = devm_thermal_of_zone_register(dev, 0, priv,
+						 soc_data->thdev_ops);
 	if (IS_ERR(priv->tz)) {
 		dev_err(dev, "register thermal zone sensor failed\n");
 		return PTR_ERR(priv->tz);
@@ -474,15 +519,18 @@ static int airoha_thermal_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
-	/* Enable LOW and HIGH interrupt */
-	regmap_write(priv->map, EN7581_TEMPMONINT,
-		     EN7581_HOFSINTEN0 | EN7581_LOFSINTEN0);
-
-	return 0;
+	return soc_data->post_probe ? soc_data->post_probe(pdev) : 0;
 }
 
+static const struct airoha_thermal_soc_data en7581_data = {
+	.pllrg_protect = EN7581_SCU_THERMAL_PROTECT_KEY,
+	.thdev_ops = &en7581_thdev_ops,
+	.probe = &en7581_thermal_probe,
+	.post_probe = &en7581_thermal_post_probe,
+};
+
 static const struct of_device_id airoha_thermal_match[] = {
-	{ .compatible = "airoha,en7581-thermal" },
+	{ .compatible = "airoha,en7581-thermal", .data = &en7581_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, airoha_thermal_match);
-- 
2.53.0

