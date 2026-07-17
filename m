Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2D142A7AE
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 14:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784298726; cv=none; b=af87SO5tGcNYdqobenO6VYNG4uJ1yvi8C8Dw2FUh9xs/QM+INBHgBE+TwMNDXV6wgGfOoEMCzdIMZ/FAgGrgpcllfaEXqbILrfM4Nk4FoYSq9+/u4GS6DblTOmViLxa+KMKilmx0PerZ6R307L1rUBccIiiLmmDkS73o4TpzwoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784298726; c=relaxed/simple;
	bh=emDMT9NIkUOn9WbfqG2lTPmNFmGjyQ6ZUvObpV0fse4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HH63xn6YK+wqlLNhWBtFB/AKQ1csoYaFyosDDZpImLnu4WAaDMx6Vyp2YOBDJWuoBlEf3WYhBDZdHWsYqRcqOgGe9QEb8c5srOt/RASa+MztlxzdTGIvCv2RJc/23YNLRi8ykDP2ZLrNwNV3yN+rXuGjsWFftz/tsK8dd429lHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=iKM6R/Do; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="iKM6R/Do"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47d70879764so5720307f8f.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784298722; x=1784903522; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JbFe/xqqWwVO7S5FZ/SPGOsIDhaRTrMUwAwwo3v1d3c=;
        b=iKM6R/Do/+kyRGSsm6qy7Eku0FDMs0JsBMzTo6JnD/uz7WBlp5uVeGovLcAWOGkzEo
         Z+fTJj/saafVQiwIU6hTmdEsY4Tx33SOWMdmgZ5CTWkYSPgBCXfUVttyJtPJfjYwBrtu
         SEDcrULRfgBRevigjudB2jfW7hjUBg0N3bHOhDN2dkIk4/RhCvlSW9n9gN1SVz/eEq94
         qrXbYdnsiDlYDFiIlfWiLiotzhfbxxQ3KxKZPSmMB/xuPFrkNO6RwVubn7BzzM5xKtUM
         TjthYsq7ckw3/WlXEwcIJgauk5sowKPXqZRn8U23aE1OOpNUPDXXPlyfkjbYmToLGw4N
         Qnhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784298722; x=1784903522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JbFe/xqqWwVO7S5FZ/SPGOsIDhaRTrMUwAwwo3v1d3c=;
        b=gl6mK4C5s9moCIp+DP8rSdzAABUfRYdSuMuaGjbp3+thEQiEYMAazjyE/jlvfcahLC
         AiejXqZOuH2YTjFE8ab2bOIz08KXVcRR0vbhCcDbRqNxOu3qqbpg532DyeXujVyUJ+GK
         uOjlV+etAu2Jze0I1o3d7PSXWLlk3luMSgpaQ8e3Lvrkbl+UxhupV5Le82aYZhnLrNIo
         mD9dNDMw45hmwspsOcbbuYCxfKXa2cbFjwmfy3L2zLmUHxzCO9jr+ZYNjK3pyPBBqRJJ
         UIyzek+IiP2raAwv44T/xvwjqZK6sg4/bYTd4pmxRicyfqv6kqMp2UiU6JKoAXoEoOKs
         j9qg==
X-Gm-Message-State: AOJu0YzZdppcSLm1fPSsn/cL1ZZp6Jn2n6muwR7cROXPXMu4bji5xgUp
	aGl+Uh/EEb0+vPpaIrTfgZKwZj2e5fYJKdHfgtXV2DU81W4iB3K1CLy2S3p8LR20NA0=
X-Gm-Gg: AfdE7cl+ZFHuPeYEjwahyJMhG5GZ07DyoedivMx9k4Y0A3TMbPH+Y9N6/m2hvilicgd
	RlShtK+DyuU1fIHKgKdsWxA2NB0BM/n391eNjCGOJ9iyUgREhAxoAUcCnNWGJwCfRYbMPwiCCA7
	8g9+5LUd+E+IlIlV20QXrJMjVKA3dvoNqXrohb3x/Fu6aHWkuGGgfMG9XVtJ4ImPnA2aWSbmYAi
	Tdc/WFMC9lChBw4S7XkE90As4BVCGCylgyGZRRn1bEg7VKUQ/TXpEtu7o+D5L4cu17Wm7djIsiZ
	dUlKyzAf7F9mTUevm0athpgGYTjA/SLas91RFtjzCYr20M18QAMIqopOiYD2641ZdM3S9JfbZA5
	25Dx8LadxqaKw8jP43WnZPlZ7hNv+nU6a7TiuR4vZQFH0KQXIki8IIRiWMNf5NQR9SrPO/8rFov
	PP
X-Received: by 2002:a05:600c:1509:b0:494:6baa:ccef with SMTP id 5b1f17b1804b1-4954a3dcaa5mr21904115e9.11.1784298721998;
        Fri, 17 Jul 2026 07:32:01 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8e22:8a15:f33f:dc60])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f63ee9281sm4815844f8f.36.2026.07.17.07.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:32:01 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 17 Jul 2026 16:31:26 +0200
Subject: [PATCH v4 4/5] mfd: axp20x-i2c: Fix i2c instantiation
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-axp318-regulator-v4-4-50aff97084dd@baylibre.com>
References: <20260717-axp318-regulator-v4-0-50aff97084dd@baylibre.com>
In-Reply-To: <20260717-axp318-regulator-v4-0-50aff97084dd@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3202; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=emDMT9NIkUOn9WbfqG2lTPmNFmGjyQ6ZUvObpV0fse4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqWjzReCRYZxUGT43zb0ThRQ5oxtrJNQwDM6D86
 e6witjKCFCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCalo80QAKCRDm/A8cN/La
 hRCeD/9mtk/YuSR0N3RlnumgDn7oIem0X4A1ex7l6FOWE03Xm5vI3XhccX4SnKOU7SkSZ+YUOE8
 fXGGUE1Og00+sEsOeBCU5oBBui9Z6M2wmS+vVmWd5GWe4TXd3lrXCl5MWgtUnorDR4qfaNXJjY1
 zVO3f47Veh+n/rVrt/KqWNn3Zy+xyIikVhM31DUIO5zXCHhy3F95LUI47FwJGTXyNI4XwEt0Jdk
 yNFaW4iUtlQLP3lTEchV14siGAqEBe4guTVY2YjFcAg1YqVyLyyG2hGZd1T9Qj9MxqD2PKVJXeT
 mniBD6oG3NZ8ijrqVa+WTz/qQu7q7ZHao9ZsQksWdxYfDH4TkkIuKloqAXa0/eSVAyRRukRX7ml
 8XXP8HX/xvzrqWSOC2zv8/9z0h/wZHlnoLwBCV0Co0lD3VbdigmV3PwzbV0USqFFjaMx4A/edvS
 l+9EgX02ly6v+x3GQ1ohWU6f0Ntxd9rvSL/eoRX1GGd+dJWoa9QN0g6SYIHOmzNn+1XPjOhCS6I
 IUArsPZQ9qF6Ggkp5hiCKWv0tJxf9eVQd//sf7hyZi8rywdHZXclqo1h67z+x3bxu3PlPuTzi7W
 27APUSh0gZsutOeVlJc2VpUYVWueBVZhJt7h1nNoyV1TG7OYTc9GTHyPhMokZRzQthI8MdvauKO
 dQ5jqSS/MAlXVUQ==
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
 drivers/mfd/axp20x-i2c.c | 26 ++++++++++++++------------
 drivers/mfd/axp20x-rsb.c |  1 +
 drivers/mfd/axp20x.c     |  1 -
 3 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
index 4e4ebfc78525..64c212b76e5e 100644
--- a/drivers/mfd/axp20x-i2c.c
+++ b/drivers/mfd/axp20x-i2c.c
@@ -35,6 +35,7 @@ static int axp20x_i2c_probe(struct i2c_client *i2c)
 	axp20x->irq = i2c->irq;
 	dev_set_drvdata(axp20x->dev, axp20x);
 
+	axp20x->variant = (kernel_ulong_t)i2c_get_match_data(i2c);
 	ret = axp20x_match_device(axp20x);
 	if (ret)
 		return ret;
@@ -77,18 +78,19 @@ MODULE_DEVICE_TABLE(of, axp20x_i2c_of_match);
 #endif
 
 static const struct i2c_device_id axp20x_i2c_id[] = {
-	{ "axp152" },
-	{ "axp192" },
-	{ "axp202" },
-	{ "axp209" },
-	{ "axp221" },
-	{ "axp223" },
-	{ "axp313a" },
-	{ "axp318w" },
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
+	{ .name = "axp318w",	.driver_data = AXP318_ID },
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
index 2bbe73afff43..25509e47bedc 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -1339,7 +1339,6 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
 	const struct mfd_cell *cells_no_irq = NULL;
 	int nr_cells_no_irq = 0;
 
-	axp20x->variant = (long)device_get_match_data(dev);
 	switch (axp20x->variant) {
 	case AXP152_ID:
 		axp20x->nr_cells = ARRAY_SIZE(axp152_cells);

-- 
2.47.3

