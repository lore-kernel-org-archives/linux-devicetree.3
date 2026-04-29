Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504433859FF
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 07:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448502; cv=none; b=nnRMPgn4RxzqmoLKS14wppoH2RS3V2jdf0ZWyRWYJbPrWHkTPdQ7IfG2J5Vl6DjcC25cvKB6isNbI4RffrKFz45v3/X1/VsYJGCsSnW/uz2FHwTC+CA7L9h/qIVFgkEKUdDPDts6WKWsj5utnSq4JRcTBTxrj92z11Qj2GBiVso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448502; c=relaxed/simple;
	bh=76wWcpzoVnUh+yIqEcTkYuAvB//XHQpDiq8/+oD/T2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aXlhw+4AIwDOdLejtBvyPUQku629MylqmSMbJWV9HdVHTSAkelcbdvR324AnPtJASQ5TTEF06LLHnhB9RnXtaDB3IvCYMuau7AJwUFfkW5wvSvDgcLwa1vpaiNkRqUoEwqlLnp471r0kV5EjT9o3frPeolYvuLZVU7H8KKghL10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=P16dNM6b; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="P16dNM6b"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35fb16e56efso8036889a91.2
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 00:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777448500; x=1778053300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49bfdYYbIg6tfnc++pVfPk+Atqcr9AmhHhh6IHuVStw=;
        b=P16dNM6bbf5KNWwtM1H8nTOr943Adlb4abo1z+k0YEUmItxvGj+5TAy09jG2206Xay
         1/3XCWMALbIFDryNnfd6Bhyyq0R1ZnLJkXXtx8HNS7sJjV9kLiNKuWW/fmcsLgZ6QQQf
         HUsQ21X2kWzkYi7eEdWnntye8mW/JVV19m1L0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448500; x=1778053300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=49bfdYYbIg6tfnc++pVfPk+Atqcr9AmhHhh6IHuVStw=;
        b=R/6VQayl3pcqRXgzLV7h1Dr1NE+NBXVV4cX7QtQPVnobUcpFO5ob3GkjpwTEwj5EVE
         iW+2xepz9+yekkzj9ABT8P+4lLmDEz6buYqEc+wCHsQ2V7RlI3kTzQqQLhvoZhSt3eaX
         ov5RScV6GWF4L25zE0PBgaFzxOEi227wD4ivfpi9BCs89cP+q/ZN2eOJ0Cbuq0+eub0i
         MN0r3OefUtgCAvunQvNNYDpOLu38+d3/waRdWLFNrsP269ZU9iG9k/mxCBaKimGvO7e4
         Gbs4ISRu50mFC2M2EpXU8zkqX31RZ3biecbzWT7dG07ztoJ4I8PVU0jt7BxeuHUQIofm
         JfrA==
X-Forwarded-Encrypted: i=1; AFNElJ8JgjlnHGV7mf4zTgsj6jI2ZCQPdfaDB12KgWvzI6jKHSQ7CBh/LOCCy7P9tRbaHJdNRzXVBpybEVll@vger.kernel.org
X-Gm-Message-State: AOJu0YwU6So5wWN+vsqgl+EcbcMVHP8Zpd3gVBTgyhrgNng2RLI7KtsZ
	Ri+78jr0DAfz4lrmqFblxPbNoOUpCy2U6grzl2g4lcG1VKQB5OT01p52HVo6G4Q7ag==
X-Gm-Gg: AeBDieuWcQu8ODyQTSZC7bsY0/AOhVx8stQJgQqNjKzL1R6iWcmjFc+DKrD/78RUgYQ
	aehBTWZp8Av3Kt/wm9Yysmjl/HpmoV1BcM4hBz1xkuGzdXKuyF8pJpp9lwIbJgGh6NmiTRr0hpj
	g5pici6W246ChY8cxq7Po2RkOZyYp/hUicMH8oQhXRC1O45lPLhGFGieubS457oP6hWZNLp74VT
	fB0je5gDCPS9H8iYu1N57Svl/qSa2bQ0Bl3lvIQzMSnXyHuR/Ji8j3nuQVZe9sn9RKR+bGsgK5h
	2bvMzA5EFGGwmtqf3vJaD8atVaO3YZ4++h4SqflCKeL3Tn+otEnQzXlcUHJ7F2UvwcGS01wtTkg
	97/NgF0XHggKoflko/9m5ikovGusnE9Jhy/ZKIINYmWr3U7Gj124xNsZ7JqD/MBHGpBs0AZ9LRU
	0dyBKsWWmrUuK86p/1NRBYV2raGb8ax0255WzXE7d3Hc/R48eUjihEiaPXL/8wHUi9NEIhJBske
	aDqK/tAbINUjn4ACYc=
X-Received: by 2002:a17:90b:3c05:b0:35d:a3b4:2f00 with SMTP id 98e67ed59e1d1-364a0b1d676mr3078321a91.8.1777448500621;
        Wed, 29 Apr 2026 00:41:40 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:e49b:67f9:cdcb:8366])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a439248fsm1341528a91.9.2026.04.29.00.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:41:39 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 4/6] regulator: mt6359: const-ify regulator descriptions
Date: Wed, 29 Apr 2026 15:41:10 +0800
Message-ID: <20260429074113.3720271-5-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260429074113.3720271-1-wenst@chromium.org>
References: <20260429074113.3720271-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The regulator descriptions and extended descriptions don't change at
runtime. The only reason they are not const is that the regulator
driver data is non-const.

Const-ify the descriptions and all references to them. For the driver
data, explicitly cast it to non-const void *.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- New patch

This is included in the series as it touches the same context.

 drivers/regulator/mt6359-regulator.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/regulator/mt6359-regulator.c b/drivers/regulator/mt6359-regulator.c
index c8a788858824..bcf9a476a34e 100644
--- a/drivers/regulator/mt6359-regulator.c
+++ b/drivers/regulator/mt6359-regulator.c
@@ -251,7 +251,7 @@ static int mt6359_get_status(struct regulator_dev *rdev)
 {
 	int ret;
 	u32 regval;
-	struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
+	const struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
 
 	ret = regmap_read(rdev->regmap, info->status_reg, &regval);
 	if (ret != 0) {
@@ -267,7 +267,7 @@ static int mt6359_get_status(struct regulator_dev *rdev)
 
 static unsigned int mt6359_regulator_get_mode(struct regulator_dev *rdev)
 {
-	struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
+	const struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
 	int ret, regval;
 
 	ret = regmap_read(rdev->regmap, info->modeset_reg, &regval);
@@ -299,7 +299,7 @@ static unsigned int mt6359_regulator_get_mode(struct regulator_dev *rdev)
 static int mt6359_regulator_set_mode(struct regulator_dev *rdev,
 				     unsigned int mode)
 {
-	struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
+	const struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
 	int ret = 0, val;
 	int curr_mode;
 
@@ -354,7 +354,7 @@ static int mt6359_regulator_set_mode(struct regulator_dev *rdev,
 static int mt6359p_vemc_set_voltage_sel(struct regulator_dev *rdev,
 					u32 sel)
 {
-	struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
+	const struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
 	int ret;
 	u32 val = 0;
 
@@ -393,7 +393,7 @@ static int mt6359p_vemc_set_voltage_sel(struct regulator_dev *rdev,
 
 static int mt6359p_vemc_get_voltage_sel(struct regulator_dev *rdev)
 {
-	struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
+	const struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
 	int ret;
 	u32 val = 0;
 
@@ -469,7 +469,7 @@ static const struct regulator_ops mt6359p_vemc_ops = {
 };
 
 /* The array is indexed by id(MT6359_ID_XXX) */
-static struct mt6359_regulator_info mt6359_regulators[] = {
+static const struct mt6359_regulator_info mt6359_regulators[] = {
 	MT6359_BUCK("buck_vs1", VS1, 800000, 2200000, 12500,
 		    MT6359_RG_BUCK_VS1_EN_ADDR,
 		    MT6359_DA_VS1_EN_ADDR, MT6359_RG_BUCK_VS1_VOSEL_ADDR,
@@ -705,7 +705,7 @@ static struct mt6359_regulator_info mt6359_regulators[] = {
 			  MT6359_RG_LDO_VSRAM_OTHERS_SSHUB_VOSEL_SHIFT),
 };
 
-static struct mt6359_regulator_info mt6359p_regulators[] = {
+static const struct mt6359_regulator_info mt6359p_regulators[] = {
 	MT6359_BUCK("buck_vs1", VS1, 800000, 2200000, 12500,
 		    MT6359_RG_BUCK_VS1_EN_ADDR,
 		    MT6359_DA_VS1_EN_ADDR, MT6359_RG_BUCK_VS1_VOSEL_ADDR,
@@ -950,7 +950,7 @@ static int mt6359_regulator_probe(struct platform_device *pdev)
 	struct mt6397_chip *mt6397 = dev_get_drvdata(pdev->dev.parent);
 	struct regulator_config config = {};
 	struct regulator_dev *rdev;
-	struct mt6359_regulator_info *mt6359_info;
+	const struct mt6359_regulator_info *mt6359_info;
 	int i, hw_ver, ret;
 
 	ret = regmap_read(mt6397->regmap, MT6359P_HWCID, &hw_ver);
@@ -965,7 +965,8 @@ static int mt6359_regulator_probe(struct platform_device *pdev)
 	config.dev = mt6397->dev;
 	config.regmap = mt6397->regmap;
 	for (i = 0; i < MT6359_MAX_REGULATOR; i++, mt6359_info++) {
-		config.driver_data = mt6359_info;
+		/* drop const here, but all uses in the driver are const */
+		config.driver_data = (void *)mt6359_info;
 		rdev = devm_regulator_register(&pdev->dev, &mt6359_info->desc, &config);
 		if (IS_ERR(rdev)) {
 			dev_err(&pdev->dev, "failed to register %s\n", mt6359_info->desc.name);
-- 
2.54.0.545.g6539524ca2-goog

