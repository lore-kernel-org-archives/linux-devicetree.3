Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D66139C013
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 08:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778576077; cv=none; b=PUj3Wo5bZ1tEMH7pf2HjzWxXx2CvgPSX3l1qTfSMSbbkrhrOMNyJ0/5EJDSKGgw+N8nj1WMeVKMxEjX6Kek4MWlVhvZWAHNKQLSFon3HUMrQI6hLv9akuMprtGZu/dL0ow+8LET3vgdC0dDu5pT1Vza/tryEWVcgDl58Z/bnG58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778576077; c=relaxed/simple;
	bh=m/BiIy6VgsH7EcpRIbAuuFOp68CAhUAtFh6ZHuQpTBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ajNJHW/Uaayzt91LnysPatvB4qYe3cF/yYXW2hT7pyQhNf7R438vROf4s/lXN0Zrgz169TuhhKwZhCyx8FIY+0jC/HkjjcrxlWSMBHc7m7pi1iGxFZGweJaOKk3hUWdALfvr6il+RyeFyNuEyzu0LZT8qPayGJTl814H/mYVDfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y/u9wwjw; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y/u9wwjw"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c80227b1f6cso2212976a12.1
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 01:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778576068; x=1779180868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59kt6aNwzcXJV4ZtVsWMaQLA4u7r8yoORDZ1L7mRnY0=;
        b=Y/u9wwjw32qPMxTJ6EVHRbZNxD7ChBgDgNE64nrfMJ3RkUj8SIepism2q5eXuo5Wsr
         wCFNEav9ZerPNNGPz0I50XUmlKmL7syr75gT121Xpx0+DCLzCHU5ZnvEjFTEEDDvcEE8
         QBtmB6Wh8do8NfoRiAdrdkdqPCs/kqXYiv+Tc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576068; x=1779180868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=59kt6aNwzcXJV4ZtVsWMaQLA4u7r8yoORDZ1L7mRnY0=;
        b=PF3KiljlvsiDpuskqxP8Yg3hxssBUMGVWoYYh2saHjgUi2jWXYN2Y5pX6UPUJacPDc
         gkL9UFVULzoHNF4+1sGIqx7qABWWLhZRdiNBil6UQAwJME/hKQu2tIkGcsst4Oxhv7Qg
         vAgvpV2sqGAm8OXF3Zda7x5Tm+D1oxZq2y5QRKO4x6khPuYfuUe+yH6JCzPH/J9X2TH/
         ccg77Qpy2C1EaTSt8oz3X4wrsXGCtdXGj/bO26DR0Wuh3wCrdn3nAna8s8m52L8+dxho
         TqjG+PYxhaPdMJK3glpj0kezNkiKR7crRELvl7/bM8a2YAcB0AAOll15/UaJs/kI1vke
         F9EA==
X-Forwarded-Encrypted: i=1; AFNElJ9DH1rW7Hs08S7GSX6o+Zf+QGIpochXpKuITOcVfDgMesolaS9nsT6wDGrPMySs+xQ8GVgFofNbVHJU@vger.kernel.org
X-Gm-Message-State: AOJu0YxEcY4/nHXz0Yi8uZY+312iPfyy2fOaRsNSaLaQQcr8IKRePKai
	73iP3GHfYsrmiTAHQqZ5UMp1OJ6K6pX+o4kAk3qMG4wWhUrHyqFR1HNwDT3dxAGSzg==
X-Gm-Gg: Acq92OEGK808zpaKdEEZ6kZEdl+7T2uZgSsV2qANPv/8P12MKVPupIRrloU9iuFVfhl
	1OMNkjGA1FIsKtlsP4xTWIzhW6QddSqZlAcXXGSvo5ghxFhcCbB88yHPz2t2T++38yQsmjbZK/w
	iEPB8xZSyTx72YO2zyzdquVxA1IQEr4tJW7TMV4OJqLEqB/wf431uS5rBaYE23hGDbvw59XjSbY
	uSv/iTsj5dx7rXzRrKOZB9tTLQoMEMP+IiOmif1ih8eQJVIXR56QstAg6ImAtey/RikWzXIzX/E
	nfaVM/lErDj1DqdB115+cFPJDm++KREMZh6eNqhrxudGw+DFYP9q5l7lM6dEcTbVj++kMygEO8w
	5XoNPJfeIrSWSI/1bD3d6Jwr6YMrYvFXsIBE3zM8e55scosHt8C2JlDJLVIu2/yBZigrFHPa2TL
	cePAYGHcUmu+Se5JGTFmYdL0iHtHzUGjpzUl5XYlNM4udibSeK+BnNALv6977pwXc0AAXJLHzjR
	KCkhBih
X-Received: by 2002:a05:6a21:e082:b0:39c:787:f197 with SMTP id adf61e73a8af0-3aab17186femr19074564637.36.1778576068336;
        Tue, 12 May 2026 01:54:28 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:6606:2bd2:159a:55e3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826771a8a1sm11136856a12.24.2026.05.12.01.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:54:27 -0700 (PDT)
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
Subject: [PATCH v3 4/6] regulator: mt6359: const-ify regulator descriptions
Date: Tue, 12 May 2026 16:53:52 +0800
Message-ID: <20260512085358.1693208-5-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260512085358.1693208-1-wenst@chromium.org>
References: <20260512085358.1693208-1-wenst@chromium.org>
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

