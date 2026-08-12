Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689D93FF1D0
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 21:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786570262; cv=none; b=Ow6hYEZcQbo5cHejNKMqjCxPN2h1UAtOr6Qf97O2jGo3pv3m9ZEQW6HG7zxQS+Wa7X68OO1JrCHW64SFYDfATm42o+5RIj6C8208ZJC0UglBvCMiFNSaJ/RPuQBpsNkOH/YAjJXnzSQejZKstE5KZL+7m1EyHnU3dsagIRCYH7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786570262; c=relaxed/simple;
	bh=lhJoISafn130K97b4c6QzeXIJVjYvF5ziHC2eS4rk3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pELGyfUZqmqvmm8kj6Hyk9xTZoVBwCioNdN3mq9bE7E37VBIFMuGrZ2eNEFX8cDubBoSFdHyj8S+b91bHPkNd1YM/jBN7GbNu3td0nL54cYx7kdOIVwLdMW5Nk9qfEu/t889NRYWsJLi88IBrA625E03EP1c86IcBSkL6+fIm7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Y2WFcvJO; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Y2WFcvJO"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49978908b35so10860525e9.0
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 14:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786570259; x=1787175059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PVrDmVbcjU7nFx3A1HBZefbtcBqMyRdnqfkjiEa3Df8=;
        b=Y2WFcvJOmnynKhofnSCeaxYmZatAgwfG5mc/yU6cOUQcxux/xkCb7eJd2vNJEQngA2
         vQtMq4OZpUPK91JW7Ou3QEz+r9tKyp71dtqbeZjIiQMxQPbD9QNM9r8gqNMMn3WS9SqB
         +aK3e1P8AwV1omjcyL8ABd5yDcrO4ytbo8NiVFiC9LrwKVGtMYiPC1oqOoY6/Xgm0ryf
         zArJG9eSpM8K9S+XW5P4GscnhD8Y5VGfWTljYuFTXNdr+/Oof6ZZepp52RtsRUsHR6dA
         5k3lFUDrf4tyRT4yzGRsEKTxB0zoij6UazSVHX6+5O1RYyw4pjV97o8c52y5Fngi4+AO
         bQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786570259; x=1787175059;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PVrDmVbcjU7nFx3A1HBZefbtcBqMyRdnqfkjiEa3Df8=;
        b=RoyjinWnAbsEW0WAWQ+bm4iEAZW/vpZVnsefrr/2+g7PtqaAoE+nZdFaTDsKuiPdec
         5rVv0CGXFitC2TRqcihPUjhcjwtPD9K1xgQeRhO7aPb00LteRm1FuEBrLXZ04cTAcBDN
         v3D0kYpPbjYMnaDMCDv1ByCalTz+aU4qLTHFttLqXP0MH1SGnxyY63je4uon2j+0Wb7C
         67/S6gXPAXZMLIoqw1XC/f7bhmFDRnitn6xbGZVBKqYRwUHpmaeLCK3WyPI6czQv1HKp
         jrVCLgwtIKFfOofPBcxnx0nhBlUSQb9DdixXFqis9+N7TrU1zzBeTKQ1nxtGo2TowQOH
         hzwA==
X-Forwarded-Encrypted: i=1; AHgh+Rqtj48rgyOs7tQkfUauVQoGbYgbPIG7jTct3hGgJ5iXwI/ExVM8HgsIDhgbjARqxF9vJB48//gdkE6l@vger.kernel.org
X-Gm-Message-State: AOJu0YzdpJGovWl4CFQkrnSQ9brnspA3gE5G5tJ4EViB+o+ozBZUD8w2
	yn65cLjIASchhzUjli7D50076sRkiGyECB3zyUY7jPASVGHBqBVX4Qm+SqhE7dN2l3W91oHRak+
	7QYvMdYo=
X-Gm-Gg: AR+sD13kBzW5wWAvokVABBbQRvbkNo+IGMZqjA/80DasaVhgjjZwpwUZTePxdm7ir5J
	EI5IKU8odyD9XGDCb2KP1uN9fJxDUvHcacOwMDAxE036DGX4k11vZcc+ZDujSJ6s9Bz/AyvN2Cm
	KodIyYM8CQ/VhqFigChbN4D0AJQHq1jYJOPjmQba5DVr1ZIdhLMNKKp/HT+Re1fBVLCzvGHbepm
	jfxQua+b7yU/fd9hmWmAg/+lkaOgpAefJ+8EpQxZM+lRGrzkBjyTOO619vUuBFYDfpIh84qPgrp
	w3/ys2OtwZAAsjAnxYoMhlS9HoVSzxZTUEAGrFnQMS/4RJ51qoW4q0jGSLHCxRNa5INb4pCdc+i
	Gi5IYf2IFPJ4bxZBBB5tF9ccE2FsDdGHSuEJlaf9EilZqYp5sbq9iWRPoTQJdLxyvWO2gCClClh
	eCbd0foKThX6iymhya8JdtS2djFYfrkf2KvqqjRkfgMweb1L7LoVJtdkXKLy0=
X-Received: by 2002:a05:600c:1c25:b0:499:726c:d658 with SMTP id 5b1f17b1804b1-499821d91d9mr4677455e9.19.1786570258706;
        Wed, 12 Aug 2026 14:30:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:282d:879b:d1fe:f977])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49981b03e70sm17057795e9.3.2026.08.12.14.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 14:30:57 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH RESEND v6 2/5] mfd: axp20x-i2c: Fix i2c instantiation
Date: Wed, 12 Aug 2026 23:30:40 +0200
Message-ID: <20260812-axp318-regulator-v6-2-d6b84b55c000@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com>
References: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3852; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=lhJoISafn130K97b4c6QzeXIJVjYvF5ziHC2eS4rk3o=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqfOJ8GssRUp0id/wW+PgZRYXJs6i+NxkYzRuqd
 xDvs7vlpE6JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCanzifAAKCRDm/A8cN/La
 he3tD/434BdrVWmDaRcxPKKCJsUJhKLWKDN3D8dspR0zLW3cyUl81/vbWA8wMM9+tiEB9idAx2s
 NG/7MCygEp9I5lYtckiOOsMGSo70m5Fh05d7HdtW2Xu1qLQh1YYYOMpyAiygyfLsTZVWPQ3Xakm
 6QS/HhH03fZeDTdYYB+pOwUCntSFs52w8uc01w5AWoUzJ7mihiBWHHZEBQSqplQMnAU6JKU1EGt
 MTXExgPkP7AuxH4O3tK66VtiaaCIE39ivZMsd2UH9vw6J6FCKC7l5qrZi6xOQXeSB0ZCRaiwKyQ
 M+EG2FtOJP18LuSdqcaS80RAEh/c7eOfrzosfaDwwQM24b9VDIbk4TEuAyE4oNwUP1v4Ofby8HY
 u8DwZwhBLlfYrB1PdhTFOdard8f9OQnZlIx4MO84OXI9kDzOBVbSM+m8l1+LRJK4kw08jtTZV6N
 zDQZtpu0gAedtIcd4zK4xpct6A8R2TCDyq0GZ7+oFwK6Z5ExXqJ9xtsexLnTq+13DngNh3x5SBr
 kTBmDcxo0OUu0aKJUkA2XsNREBAmFnNnXMysxsOxeEVzxHF5mjpnUD9IiEJD3B/fFwQNiTKJ3gJ
 zJPr8XPsU7Vfx+zH7okUEVt/2NIV/Q7v3wEua3uJptHN1dz+XwFxOpnBvIvYl8YCakTnNo6nCJo tzsRRY1pG2V5h/Q==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Content-Transfer-Encoding: 8bit

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

