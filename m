Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB7D33B6EA
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 11:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784546450; cv=none; b=JWqlVfKpF8IXN1meyvuA/EMfsJ7RPwkVafXxHcV931HoKEXTUJ/yhyJdNcqGGkWNtVlHrjY22MLxWc8PrQXoWm9AnJMgyiSLHWvgvIjCjYRXPYxlFaEyB/iPcVq1cAzWsbED0M80moGBGi7LOF7S3pOwa+pPf3nlhHa7LfTMbIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784546450; c=relaxed/simple;
	bh=IIUZtjYeAgjkjY+KiecPS6RBNf9bht5M1+J2u9CKmR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ET0+oTYv3GmZGurJGtC9odYr2RKwxaYcVCdJr2YnliM7ZIaT4LpXatw9zmkfIrWmvDOM5BouwjQ0Ks1NZxvWOvhNnh8SbLty/JEUYsw6CQVKpUlQar4fQ/oHJWE2yQSrQeratU/SEK3DpgYWJoV0CVxMjfr3Nw6pr+S1cXuYOKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=O01jBJSw; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="O01jBJSw"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so9666405e9.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 04:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784546447; x=1785151247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2WuKp07RnT3lHFLt+YLF1Nf5rGNaEWONm2LTrQxfq48=;
        b=O01jBJSwVtddleGAabDZUwwCb7/0V34sYYEH3lPq82CZX6AL3or1Mutfpl9zt/hhAn
         z0dvCxjLJ97O2bVGdOedmEMi7aVt7p/ZiXkNUyiIcnINBbMD2Q4jaRtqCiJhSANDD+TJ
         028k+TufyWourJ7vCkSYj2ZvGEA4pRDaBvMSQf1cNkySpIVKCnZc2q0e55MN06eDwfzc
         NKsPepit2o22+0fa/DzHr34Zjzn1b8Kjg/9MAcGnGqTc/6jUrsiiPBz++xP1IgvGUuqP
         OAt1eE/740MOoze0E38AEaGEWX41DaAKH3r1oHhuATsuygSceDpnOhGVPUjLM0fxVYkn
         i1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784546447; x=1785151247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2WuKp07RnT3lHFLt+YLF1Nf5rGNaEWONm2LTrQxfq48=;
        b=lfhPt3lUyw95Z9y51PCXB92+hzJZScFd5RqCWIiSF67eT9XsL9DZROaO94+hXKux9C
         fO76xHPLadH7zSlXIvqePOeh4/0twy96tES/KXJXJuLces2HKLqHpB/eJAFEY71tGZGL
         Bx/Cmc26ewn5GhqGMW06UHfaMnvKdSL3WXwEODGobtvoEIQfZCWe71acl0cKzI5yPOxV
         TebgtgRGOeTeiUncAFvVzOe7+hdEKr2PZo5o/wvwMsrZ5aS4pveuxaIZ842zWHOFeheH
         7cIueOeFo18EmzUNAcnepX+M6L0FsoWFOn+pMB2NiZPYeyayIB3TIzQS4drsXCOcKP0q
         3ppw==
X-Gm-Message-State: AOJu0YyMt3HLUSLYrXUEgHX0gCEJqbWgG8SswVClCFBJ+Ct+8TyzOIKT
	s2TX2PHLMigToRFjbK0TkUzSex5yxm1JrNG4KYv4gVffRStawe4SEkGvAmgChsjGIoE=
X-Gm-Gg: AfdE7clWNU55OqHPK2d0PtrLZacnc2ck5sgZvVN5j/G1CGqw0UgC/j8jEZLgTK7HUfX
	j6Mwt/rMcj0oX43d20A4ZX9tlv5z6/1fpH8fJUK8QKO7CKP9kJpGmKE06+x4YZg2aVOmbKBuO/P
	OvGp9JyI9MJw02vCGoSq00vka9mZotFYaBTGk0qcCbSbvNS+V77Hx/0CpPG8Du6L/cOoAhC0p16
	h34bxksHjZxXur2PWaAhH1/d13tQA3FxONz+eHIPiTG4Yg1r2t2w9i3KFYOQjZB6zBKJpglZ7aC
	dWIfu7imeqZzVZU5jYSfB1Au1stOWBsaV0224aVz7V2kRUA45ZEebdn4ChNF1O30ffJ9eHpsSzZ
	RwonQ2t+6BfvIxv9eAZduQMQB7k4in3+nrnyofi7U8kQxrJODApOyzuhTKTnvdHbe6m1P7v+/qF
	5L
X-Received: by 2002:a05:600c:4585:b0:492:437a:a653 with SMTP id 5b1f17b1804b1-4954a50b811mr143084395e9.26.1784546446969;
        Mon, 20 Jul 2026 04:20:46 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:f341:e28f:dde9:3687])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f6b85970esm23123632f8f.15.2026.07.20.04.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 04:20:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 20 Jul 2026 13:20:29 +0200
Subject: [PATCH v5 2/5] mfd: axp20x-i2c: Fix i2c instantiation
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-axp318-regulator-v5-2-a1afa7ee24f9@baylibre.com>
References: <20260720-axp318-regulator-v5-0-a1afa7ee24f9@baylibre.com>
In-Reply-To: <20260720-axp318-regulator-v5-0-a1afa7ee24f9@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3805; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=IIUZtjYeAgjkjY+KiecPS6RBNf9bht5M1+J2u9CKmR4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqXgSFmd849so+EGCWmUof27RJS162c4uQgBjDD
 m49MxrIlVOJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCal4EhQAKCRDm/A8cN/La
 hWqiEACojaHK8APs2Bfkw12iMRe3hoTT8Y5pPt8HuVNSfqtzFwybA6SQ3+MjXbqrUvwHCS5xHCD
 NY7lJ724BZQ8R2QEpNg2Od0/ttz56u6hYjwjssRy13qpORE1H1Ybhh+fCaIY0loHrkUR0CGuoAU
 SeSH7L1S751bIeXvmudhndv5aBY+Jfnl+4nNHv7LH+ptUHU8exZiMCycGqpe937+GhHkXZcuRi+
 EsnFEb8njLdS2O9KeZy93sYNPrGOTFis67mA+9GuoPStItuBF5W/eCTsm3AudNadOYEesAfZKeu
 KvQR+xuwS1fo3sN5ZE4vV53rgJiq/mzIoKyOKIsg5jKCu4c/piTTCf7nNsw3jeLiiucKl5XEChU
 bsKkKGIsIUdZAduEIxgPolEn3HyrnbP3Tr1Qssnih7N9VmvKvCSY5YTkiRKidyBm4W0TsrmyT9N
 B2kvQp3FJpM+JVyITxC/NvOWevHl+IgKJaz2WFmJQGEtW/MuS9C6gm96fl/FhDb6+cAaD2HoXAj
 fWwlWNfcK4ZumFz0rw9HSx7KS/kJsKoWGOmbKTfOFBAqoGdXOlaV7zxp+vBGlO2SwKGbB8dleaE
 aPSuzDgz4HYrMJuN3S1NBsCR7Qn/dIbRmQLzrBZU6n9RZv7vRhhMMQ7Ev6I+Mv/QPXyCfI4eNJU
 vqyRJf7Xym2HJVQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Apparently this device never really supported i2c instantiation via
sysfs, because the driver does not even look at the i2c driver, which are
not set. It would only probe if the device matched through DT.

Fix that for correctness, even-though it is probably useless.
Add the missing AXP323 while at it.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260717090209.2A09B1F000E9@smtp.kernel.org
Fixes: 41751b033aaa ("mfd: axp20x-i2c: Add i2c-ids to fix module auto-loading")
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

