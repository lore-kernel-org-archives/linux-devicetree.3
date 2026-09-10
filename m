Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6353E0083
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 09:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789032711; cv=none; b=VCMBQctGkslyud0dF8lgAspXs2UNzPqpZvtBpncFK0unodndWw1AiDEzfUkjwFmlyf1mdckUcHuZldu0/cL+HSoHPble4hYU2Nj+FeQSygD23hKWIHu+nq7psHS80cW0/O5XmDo5W5eEzmkofIezgQRTK3Qyth7oK1Y83//Thxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789032711; c=relaxed/simple;
	bh=je4IU/IAiNq5H5O0okakTCOl1tHQPQzrOgxF5PvigMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YFg22E4aXCEjaADfuAhKyV0HgUASdD/rVPKXlVYloO9fkq+1c2Ygf3nkAvBOkZo4135ny5Qlb6N+Dsyf3fsifnubaqfEiWsJD4XikycleE9h0hVR2Njhm60wSVC3VOogPqtFaTCfOqA1PTGv2EdxBfny3aKzyuWtXBxEoZ2oEUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=iPguvP+N; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="iPguvP+N"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b94fce6e8so9404415e9.2
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 02:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789032702; x=1789637502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oFwgLyL207NuimkwPEL2xJQg2+Ohyu6vwh5w42Gzx6g=;
        b=iPguvP+NW63TQQVoAi1QEklQzPKDfRTbC1S/rq+3ZyR97clMD7UZTC8ZeVlGOUUXEE
         kGqPrJHqzMdDdJAQB6kTiOq2roFzr+9+8C0X7bh8Yu2pP4biKNQqQGMpQPZ9TSKIWRNu
         mnxnO90v/1P6MK0SZuTFlmfOM7yvd3lwVV8zQW6+6Ik6K/wxhkkuvT6bTSk8xroxpkFz
         2sDsRY4TIj3c0OINoBXO+fVeIL+OIDgsrZo2sSn6IUe0i6lNrx401DPFEpLQgpZCcfVv
         R5yYT0O3RqAYQabqh6XHZ/KXfuWNHs0xDbRllBOg8+25hq7XCtS/XP7R/KN9Q6+ShiaS
         RFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789032702; x=1789637502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oFwgLyL207NuimkwPEL2xJQg2+Ohyu6vwh5w42Gzx6g=;
        b=CBM0ZAK6ugJcCCjyqwBwPFn5MTdIpCCE7AyubFtJW9lsEib2KRn7BR2JNyLx8g/Oqi
         1uhldfHKpG5RlrCNtNbIBaJP5ySLmkW/Bi+Hjojj0Tr5rbmUYdx3PnSdzqdkAuUgu1Qm
         GYH5LEDkihgRE0RyhXaEf27HO0bUSrEcdptXWn1oE707uvXvYjQZ/FyBEnyZZsOFz9yK
         HqBinwpySiZ0v8nZqwQRhcbofo4uivVLSHQflFCnWaZySHtv44ipbJXubtDSRcGjB0hK
         QFKI6ojBtF2K1L5KCmK+eKLYSLOdpPgX3/zPmPSCnL2bqg3FujT5dNB0+FTiB888Txon
         TPKQ==
X-Gm-Message-State: AFuF++nJN7iGOSRjG2MqY4mtfdSs3HVbHzFlyC5uT1jUOkEnmekeZ/9E
	g0nX2rEr35+5QO39kLDPpb9jUC7tdUy+hKxHMf7L8j4IYyoYJgrAPP0RaAXUZ6m7TeQ=
X-Gm-Gg: AYBFou34fDsItfY1UuPGL6+HBVzz+OXesix/WYN2nJv88SKq/DUj7G4gSlBBufF7qB1
	p5VR7wf0XqnuBvaIO24QxjFurq3VdsRT9/u7S2B30wa5rRwpLFNLWhBTSg5tGAGPqHX9yS2158Y
	QXJ5FE/nRYQ2grBQOyyO9Xh0FTYSBVBaCH3GmCqLk6uYoNO64v5+trC2F84E25ArWi+V9LopBwr
	NZivl1u6d70qIR0aOOASFoHeFYxynLktgS2ySj9gHRdD8XBWeiPKhV4whg9McQzqLRr5ghLONgs
	Tb4YheO7eD7DPeZLbc79tHdZn3ikqqiB0xx2zMFkeJ9Zkabw8YxASBYEeyM5OP7rP3l6GUbae4u
	vcBSHT1C+SaE1d212oe9MIpACgJ2KLFi2qrB8vWEyVHmy1HJdLvY05zRYrXZVb0qnkV53ybjtO2
	rB1upgVMwEQNEMJT4XpqOgUht92KQ+E5JwX5xudOlJ9Z7iPfePCJz5HDU6xL58a8b7JYY/ij/iC
	Q7rZxX9q2aVn2rebg==
X-Received: by 2002:a05:600c:4695:b0:499:9240:9a1c with SMTP id 5b1f17b1804b1-49d258e3ce3mr54932335e9.15.1789032701888;
        Thu, 10 Sep 2026 02:31:41 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d1fb02bffsm85117265e9.0.2026.09.10.02.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:31:40 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 10 Sep 2026 11:31:09 +0200
Subject: [PATCH v7 2/5] mfd: axp20x-i2c: Fix i2c instantiation
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-axp318-regulator-v7-2-de720ceb9bac@baylibre.com>
References: <20260910-axp318-regulator-v7-0-de720ceb9bac@baylibre.com>
In-Reply-To: <20260910-axp318-regulator-v7-0-de720ceb9bac@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mfd@lists.linux.dev, linux-sunxi@lists.linux.dev, 
 Sashiko <sashiko-bot@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3852; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=je4IU/IAiNq5H5O0okakTCOl1tHQPQzrOgxF5PvigMM=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqonjvRKinlEcCy4A0ri5MNpxfQ4L3yuLTNOmma
 AZwFQfELm6JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaqJ47wAKCRDm/A8cN/La
 hbHOD/9/LdCt1jO5+h/A3gefSQM7t6pVQOmanJ47AAd5LkCxiW4JLGe0jPxDa5BCqD8F3Vr1++E
 6k7SoMfIXGbch9uX96UfYaZkCoTCoD2CSl5I5brpbTPPTRIyNu/pApaqduNWvPxZD7EwTNFFOem
 gQWGNzonSdfP8+yk26GvQLda64r2Z22tNw1nQZMms7240xIxY2fRIONOgh98rR/WVZUgNgcqfa7
 CPl3ROEFUgyxDxeHEEPpyFYFa2s7XcST0PjUWQXt9znjRB2wAVFv2SIAK2CcH+kBJJvHHqn2pn6
 /IbCVNrxcKuIJgT5QMa3u2yfloJTsSitfZIV9w3D5WckqN7vsPDzBp7ApJW2BrDO9I/MFnrHuyP
 oJIzosn5xhDVPUgki6MepZumeiR+/KvJe6wBD/dklHZIa20tv166OGH3Dyx/dgvkkRu8+C23ouI
 /r1Fl38URbNHGdh9IDCaqODrWi5OiN/Vei9G3F6/3NPXAtqJagRhADCzXSmRCgcE55spOnSJi8j
 CyjVbZpbEF9m8VbBeC7ZkOaA1oA1+hvkrf0MGRGKcEczKtuF2KAcaPy2xlxo7Z+RuYpa/2r2g/P
 ervHbrYQIDdZJDRuMc8zdhaEp7vK4HE3sgf1TqcadnDNwXeRlAAFcGAFnQ7FLmLjlDOTfJ3RbQj
 Dw2CEPWme0N8LtQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Apparently this device never really supported i2c instantiation via
sysfs, because the driver does not even look at the i2c device data,
which are not set. It would only probe if the device matched through DT.

Fix that for correctness, even-though it is probably useless.
Add the missing AXP323 while at it.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260717090209.2A09B1F000E9@smtp.kernel.org
Fixes: 41751b033aaa ("mfd: axp20x-i2c: Add i2c-ids to fix module auto-loading")
Acked-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mfd/axp20x-i2c.c   | 24 +++++++++++++-----------
 drivers/mfd/axp20x-rsb.c   |  1 +
 drivers/mfd/axp20x.c       |  1 -
 include/linux/mfd/axp20x.h |  3 +--
 4 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
index 5c93136f977e..a76bec5604c4 100644
--- a/drivers/mfd/axp20x-i2c.c
+++ b/drivers/mfd/axp20x-i2c.c
@@ -35,6 +35,7 @@ static int axp20x_i2c_probe(struct i2c_client *i2c)
 	axp20x->irq = i2c->irq;
 	dev_set_drvdata(axp20x->dev, axp20x);
 
+	axp20x->variant = (kernel_ulong_t)i2c_get_match_data(i2c);
 	ret = axp20x_match_device(axp20x);
 	if (ret)
 		return ret;
@@ -76,17 +77,18 @@ MODULE_DEVICE_TABLE(of, axp20x_i2c_of_match);
 #endif
 
 static const struct i2c_device_id axp20x_i2c_id[] = {
-	{ "axp152" },
-	{ "axp192" },
-	{ "axp202" },
-	{ "axp209" },
-	{ "axp221" },
-	{ "axp223" },
-	{ "axp313a" },
-	{ "axp717" },
-	{ "axp803" },
-	{ "axp806" },
-	{ "axp15060" },
+	{ .name = "axp152",	.driver_data = AXP152_ID },
+	{ .name = "axp192",	.driver_data = AXP192_ID },
+	{ .name = "axp202",	.driver_data = AXP202_ID },
+	{ .name = "axp209",	.driver_data = AXP209_ID },
+	{ .name = "axp221",	.driver_data = AXP221_ID },
+	{ .name = "axp223",	.driver_data = AXP223_ID },
+	{ .name = "axp313a",	.driver_data = AXP313A_ID },
+	{ .name = "axp323",	.driver_data = AXP323_ID },
+	{ .name = "axp717",	.driver_data = AXP717_ID },
+	{ .name = "axp803",	.driver_data = AXP803_ID },
+	{ .name = "axp806",	.driver_data = AXP806_ID },
+	{ .name = "axp15060",	.driver_data = AXP15060_ID },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, axp20x_i2c_id);
diff --git a/drivers/mfd/axp20x-rsb.c b/drivers/mfd/axp20x-rsb.c
index 059656f2a1bd..8fdc870c1fe4 100644
--- a/drivers/mfd/axp20x-rsb.c
+++ b/drivers/mfd/axp20x-rsb.c
@@ -35,6 +35,7 @@ static int axp20x_rsb_probe(struct sunxi_rsb_device *rdev)
 	axp20x->irq = rdev->irq;
 	dev_set_drvdata(&rdev->dev, axp20x);
 
+	axp20x->variant = (kernel_ulong_t)device_get_match_data(axp20x->dev);
 	ret = axp20x_match_device(axp20x);
 	if (ret)
 		return ret;
diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 4d770e718716..de6946d4bb13 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -1267,7 +1267,6 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
 	const struct mfd_cell *cells_no_irq = NULL;
 	int nr_cells_no_irq = 0;
 
-	axp20x->variant = (long)device_get_match_data(dev);
 	switch (axp20x->variant) {
 	case AXP152_ID:
 		axp20x->nr_cells = ARRAY_SIZE(axp152_cells);
diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
index b352661d99a1..1badb4868d17 100644
--- a/include/linux/mfd/axp20x.h
+++ b/include/linux/mfd/axp20x.h
@@ -997,8 +997,7 @@ static inline int axp20x_read_variable_width(struct regmap *regmap,
 /**
  * axp20x_match_device(): Setup axp20x variant related fields
  *
- * @axp20x: axp20x device to setup (.dev field must be set)
- * @dev: device associated with this axp20x device
+ * @axp20x: axp20x device to setup (.dev and variant fields must be set)
  *
  * This lets the axp20x core configure the mfd cells and register maps
  * for later use.

-- 
2.53.0

