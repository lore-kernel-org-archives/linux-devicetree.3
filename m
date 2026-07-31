Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F1343710B
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 14:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785509027; cv=none; b=dcBm1g354nTDiKdoqMDmqNYkYb1VUuIZnPzJEaw5LWxtz3lqf09y1z/nI2M1ip9K6+TXbPPLfsMHSJeBvZTiwOloEjGy/5aAMrD+8UTz1DK/K8MrfTnse7LAvaGmKqr/UCx8DxPwYdFefmrFMNAMIA/nvKmXXzPbCrvieBuwvbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785509027; c=relaxed/simple;
	bh=lhJoISafn130K97b4c6QzeXIJVjYvF5ziHC2eS4rk3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jp2+QC5jvEcZNaBkj2h5ThuVW11FMsBZHfckdByEMxBPv7VE1Rk0BOq5aAwjMaToBjCyBKt6ysgQmWJ5ZSpUmwtV2c5PtZ+uNgZdB6Ahq4p0eIWwq4JC5udBUcr15YZFLBmFkNeA2HxQ5GxeEj+mPIHL6Vi+XsjCZ2voYMCp5CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=EuKxsibz; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="EuKxsibz"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-472326ca506so771509f8f.2
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 07:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785509024; x=1786113824; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PVrDmVbcjU7nFx3A1HBZefbtcBqMyRdnqfkjiEa3Df8=;
        b=EuKxsibz93CFbEdWiFT9u0ROhyj1FvBCi27RkIPHZrnkD3xghAKd17cjopt0AmmG/V
         EKPaoVECl8KQrr23CYw4Q2Sc42FXOtKARx02GdeN/DJFIGKg+OrcbyhHlROq5xFdZ47S
         BUGQ6a2rWpAn7hzaHwgA/b/FmtJ3q5u1VH6cnvrzT25aWPSEI+rn/5olQ093yxfLKXdy
         wuajGw2hiaPVWPojce7luhmbbk8gRoIDs0+m6N7ryxBDsV1olG78AoQbra3xG8dtPbJO
         +49ZcgOh9aWFDuIrQ5wgURaaQae+Acwl7u5tBS0amqla39fcFI/NKtpv2jjkW/Jkv0Rj
         VneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785509024; x=1786113824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PVrDmVbcjU7nFx3A1HBZefbtcBqMyRdnqfkjiEa3Df8=;
        b=IL+xQqk1ut/LHvw09Yx0VviRnu4NDg1tPi3CRK2sztU57yQ8iC5b11w7as1EMZYCQZ
         cPfB/yLk3LtpS7aOz+1R33sG/dkLdujIVuf/qY77pYYVfUdJ5JAltnvocNTb1OsBmcFT
         MGMAmILqzoDv3JTjNh4UyrrkzTqXxRSGDI+D7iCdS1vVzHuEJfxGyYKdxKRZvv2j7yvL
         owWRmlrE+sihN002T8dbiCwxXi9tBx4bWaXM1wsYIf8cKAg8/fmJgFaW298oHcrui1b8
         NC6bANMij2koYeUTvPDuVH0ZKkKrTVMbl/8skmR4qa8wuwfGOsHHvWF8tPlSltEVwkag
         yh0A==
X-Gm-Message-State: AOJu0Yx3In9UQQ7yPSKKqe0QVk6R2KvRg0AQEcKzy5o4IoCaYz5xKsth
	dBtwLDVRKj8XBJQ/+Ba6uvsLlwkCMUwwG2Smpeaayr7R9iCB4anuiaCYIHbkTbaWQPE=
X-Gm-Gg: AR+sD10hu8dN0isrlGbCyuSwVog91YE6q1bSZuAS9/HMePFxypAhfMsYIIYIDV5LmsS
	JeYw6k29Jmherspi+AEnKgmmt6xxSAYRPAcmtTsQCHS1csOl3C5TVpYkHvrF+reMrPjkyZngmwg
	JkYvAWSN+EuR5+e45SZm64JHYvc+8ZTDZK26c08vBA4Iah7F9SvFVBCrVWwFoN2K2sCjjvs9Jl0
	L3wMehy/Jl5iJaI/CmwZjFiUUr4NI1S1fO6PvBgdibRtOE04YMb1P+wb93lSsQ66+/WHUQ3QSzg
	qHFQLDMHF4MAK/INxmo8oYfENb99XgD/FYJyUh1SyIdDVhw/xO8wXGeqChAOo1lfqC/cAKJa+xh
	NEccYfkAnu6Fh+75pCS39gsE7uYagv9F7JpairIQHLx8atHEkfy1oTNg0saaZAfYmVLuio0lEkU
	ECYHT5+VEYCR4KzuZgauLGhwjygNRmUTYF0f3lYjRyGCAhojri6fQAx6U/b3FIICa4neaf
X-Received: by 2002:a05:6000:240a:b0:47f:9447:62bf with SMTP id ffacd0b85a97d-47fd2ab7af3mr5341878f8f.2.1785509024159;
        Fri, 31 Jul 2026 07:43:44 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d00b:bc94:65a:a73d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fd458ab61sm5519323f8f.25.2026.07.31.07.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:43:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 31 Jul 2026 16:43:27 +0200
Subject: [PATCH v6 2/5] mfd: axp20x-i2c: Fix i2c instantiation
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-axp318-regulator-v6-2-b4e745552a35@baylibre.com>
References: <20260731-axp318-regulator-v6-0-b4e745552a35@baylibre.com>
In-Reply-To: <20260731-axp318-regulator-v6-0-b4e745552a35@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3852; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=lhJoISafn130K97b4c6QzeXIJVjYvF5ziHC2eS4rk3o=;
 b=kA0DAAoB5vwPHDfy2oUByyZiAGpstJWjcEsIoA1CfVov/PilL27bZbLXKeyEKxSVkr6cq/DEX
 4kCMwQAAQoAHRYhBPThWa4Y8/VtXxu3G+b8Dxw38tqFBQJqbLSVAAoJEOb8Dxw38tqF/bMP/jm1
 dxxZsIPtFRUXEd0Hhb5JaXi/Rs3tayID3Fu8bLq28Hg87mr24yYLxuAyzmOR+AryrdKbmI4mvGw
 CzoZa8DyE6zQY4eSOosE7Ae5Fd/IB1QAo6/VFm2Aw9JDBIBTQlo9YNqeGaMlkSNBWSOgDSjrV+l
 iEvf+PW05gI93yBo29SlGKEWbZkLLmyu9w5wjkGYvaOJAfMiPFqs9mB0YFtN4zvIMgGVqiUOHGo
 yrKeJHnr8+6NGHSg5uwg8NFd+oLYuhsY0iNXUr+qtR1VxsQqXZwMsF7MTPRi0WJDOvX3hoZRLFn
 EUxttrpMC3HDv5+IZovgrJFlTXBlmDrlvEkSvOs+y5pMu4tPIJIU37S7hcJv1j7njGe/yho6p8W
 Pz6vJpBtCTLJmaUUpU02r0jCiuMWD13okZ0QAWmeNZBelIpSVL5p1edeDFd9pxqc+3DEFEngBTT
 A/+2gMI9eyoOtX3pQ8xTZwHfv4tX1YWq+ZzGEWq5w8X6JnzzxWkvx4bJhZveutylgonHxep5UoH
 M2qiTdxUwRtO7IiS3gj8bvolx/rHfy0eZ7p256qXUf1rUJFnA61K3iip8rT5q5CJT29idBoVOqf
 GgnqeunuIYzScY0HA2j//FKezgBd4lvG/UinuTLVfG0VbfwvkRMJ0zTuZpywL8dqLlLCKPuG94J
 vvmJE
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
index 22baab6e10fa..84839d4aa1ca 100644
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
2.47.3

