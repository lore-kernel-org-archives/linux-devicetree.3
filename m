Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA24384CCF
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 09:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778750152; cv=none; b=erbbEBcSG3W1g3PEImw99VoveQ+6KAmAfbF8+32ARdp62euk0Zo3NcfzmZQAtOP17q5MEwWp94S3SmxLrA9AObRAEygY1BBcGgbii94JldlDypByWKa1IT+yS9iOz4OyZ/ayIB+++mssf0Y0gBhdQRIv5Jyx1ZARVOEEaesOesM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778750152; c=relaxed/simple;
	bh=m/BiIy6VgsH7EcpRIbAuuFOp68CAhUAtFh6ZHuQpTBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AsrXGq7p6etDE3dCsoho+won0P/LjYFKh7N/E06Ipxs0WJKCrZcfBqR64HZNKGn+QcpG5NgE1yuigYRV7zydwgE7XZycvtWkRDVmyzrVbAQui0uwglTwbYyblQNNBYWfIekptMayMi/5jIAVaMEZJp7QoFD98ZyeBM1WcmFFPms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=O7u7IUX/; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="O7u7IUX/"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c7ffe8eeaf2so3331914a12.0
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 02:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778750148; x=1779354948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59kt6aNwzcXJV4ZtVsWMaQLA4u7r8yoORDZ1L7mRnY0=;
        b=O7u7IUX/rZMVT3Pzev4zrbzZCDvAPK4nk/S2A+szEgl1I5TEUa7pJXt0PhCztSrHGq
         mLaNvPUNzMlrHPhMRv/ybVBKbTUts9xt/azPhUZOU+5lknE3V0akS2Cuw1xL2M9VWban
         J8Vjkj5TaV5GsVEXPHj67SumnwPFZMoqOkc1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778750148; x=1779354948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=59kt6aNwzcXJV4ZtVsWMaQLA4u7r8yoORDZ1L7mRnY0=;
        b=qT/wyHcfleKWR2i4cRmCtHrNh6N6Zibeg8DisVZuZCz356u+G1mic1U/Hi3uJ/gDNI
         DA/mJTh92NRYhR/9MbIk1tQeE+peaGyG2OegDgf+8NdwppIbKU1G48t8wFc0QYE9MOVH
         FHgd9vY/0iJVFYsZwpmjhWn7dtUcuvwuAlu5EruFcVrze1L4lXKOW87MO9OU1TJFzhHS
         H7Bi8zhVRLZouyP5RRxhO4gSMszQ6dfxMHw1SV2Vo7p+K/bfvk5ryaDt3jFyX9I31yJg
         0O3e6szJ85ptTuW/2Iodwa/h6nQ+jzUUk0tVXqj4VfGT+VYlUWLb9yHdEyO+MGExaQV1
         dXSg==
X-Forwarded-Encrypted: i=1; AFNElJ//J7yzAqVp7r1kzEcBTmd+4Ljs2xneOyCYVUt1CE2XSC1c7AxgtF2LsoZUUCB16hRwdvFvznrO33y7@vger.kernel.org
X-Gm-Message-State: AOJu0YzCmbjCjcdSZVAg90279FwGvMIgM1Yr5iw18PDRuoir8fFZxpYg
	1JBQOWCo/TrUN95ogVMPdEjiQeCaZQhCLiKAIJgUV6ZYeprI75dJIDdeTXZYqyGGut/ghRTJO9X
	RhjM=
X-Gm-Gg: Acq92OE6u1T7M4COFiHGPs/alFtXIYwEqLpgC5wQ3Z+PtPJGhQPpQ8dcySHlHfKjpzL
	UwHERKLA5rRd794CoEs4gmd9v+wwIikd/m3ypo6XcPJo5dxmMNA8Z8xiviGGcQ+UMkHd74PFbzZ
	2kRTIGfDc8LUrWuyh2ipwsKT1bJ//uMU9/c3f+f+cqMUq3sOuC1KmKcDVoaN2P1nRCauT9rngID
	iAmx0m7upasvx5KAZ9pOXsBp0VT0xjE6+OsI3AdWz6YvehLzprO6xr8UP2KraOXEMK3kEnw32lD
	cYe4vzy7IzpQ384QT0yGDZKB+g0f06ypiU8p2vMZrQ+KMoSmR94Bcc5J9IGcTwLk8hxE5YzSAlb
	IYo+soP1BqzCBgGDCXcDjgiJu2pmF+2fvIpNh+n0z3vYgN2/KoDfe45OiaTcnXESxIsWKlV7bY7
	29pqQCpDxjTCgAKKzkcF999bNCJ5cNLngbc0QR6ePwqDjKWGu11rI1k3OOTEGiNtIkIDeppECMk
	OUrSYx3Hew2IkazZfU=
X-Received: by 2002:a05:6a21:9995:b0:3aa:c99b:5c64 with SMTP id adf61e73a8af0-3afb1a0aa29mr7653595637.42.1778750147593;
        Thu, 14 May 2026 02:15:47 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3a91:2f7b:b635:8285])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb0fef5esm1650768a12.15.2026.05.14.02.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:15:47 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 4/6] regulator: mt6359: const-ify regulator descriptions
Date: Thu, 14 May 2026 17:15:17 +0800
Message-ID: <20260514091520.2718987-5-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260514091520.2718987-1-wenst@chromium.org>
References: <20260514091520.2718987-1-wenst@chromium.org>
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
2.54.0.563.g4f69b47b94-goog

