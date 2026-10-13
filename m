Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D267535FAC
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 18:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915285; cv=none; b=qhu6D5PxotX+H7IGRq3Ic5cdaefX8X8RKgtI2n2xr/JY65Hi/Nq0KJAk5PnIbTUmQzcLSs6aDZp1cIClYqWhqa2RW75dvbw6MIrMRwnLbTdksggMa6ZbpQkGfTV6NVHrSXfHqpSUPb2p/PLuLkEPr27MyvzeYM2LFW3/aWEJZ+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915285; c=relaxed/simple;
	bh=98M+cff6j0XiJ9T6ZM/odfPd7A2vCJn3FWi368Ee22w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NnMtfu8vM50TaDsUOjoFKsM0wRAppXoSKsfcCDCisOOvSYP0vMt7Apt2RNhX+rEbJU45q883AYi7qqOLMFusTb0gy9hJC9WJ6eTcxDfPDV6PflKTmTzI1w6nvDuvvF7WjBPv15hJ1sg7W343cKihq5Cp6LHsezAD2IHJWWDTRus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XRz4AZ/V; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XRz4AZ/V"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso1782915e9.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791915278; x=1792520078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=84y+98dUTavPi8UlWvfsOTAI4E9Cfm8/Vo72h+4TbCE=;
        b=XRz4AZ/VrA76G3jveY1IrCMbqnl492PeWS30Inbs2860PEqotAMBhouFIGc2DRPpKc
         UuWwHjuz4ymwLBdFtLV0m4ulXtPc0p76nEISFn1GrwtFKwpXFlvEQEarg111vWmMmVuh
         3GP2iM8mVA22VJBFzVfPQfXOOcUOzkOOS8N2zs1F85FVtPKfpOkbK8e068MzgWIOJ/sE
         ucbTqYkFXKbpWEi8hVdoV7sZxxBPmYsSys/+2yOqxadEqGntNT3wD7KCDiA9eyjbhkWE
         VhLcypp1+4LZHkwIFuLS2YgpMCp0+k6v2GK0rj580ZNu+gXhmWil3YxD02bbkDgTyPND
         coKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791915278; x=1792520078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=84y+98dUTavPi8UlWvfsOTAI4E9Cfm8/Vo72h+4TbCE=;
        b=iCPJb42+tJqBEPXy/gz63nBhiSaCWCHe02qkazckDz2Zsq/+vlmQ8/uAC0sp0WnR2I
         45lKYvEgUsbL8FC1vDI2eKPVElcRK/VudSjYTYdgj2FEJ5gwy+pJnx2Szeqnx4yV+CIr
         qVxbPPhVCFz5A+/WVwxy4kpuaJwqPgFoeMzg2N87VdbO5YGTqMoMmyeCBiy12LrtDTQz
         nBKHBm+WCEr+NkqelALDJBZAr01qAWncK9Va+peIo5BjSC2xUsCV32b6h6rOFJ5sEajm
         ycZ1A7hupzIq4HVWZ3o1BinucXvzG6FMLHqhitoC8qW5ejO0ipfDjn4B+KhkMdCoxY4k
         O93A==
X-Forwarded-Encrypted: i=1; AKwUvBySWtsGbB8D30VOWVHjx4uMzsxq9u/NifKU+pxW0Pwaa6KI1CVE+UNY3nAywT8qOO/DnRa3GA/2e27i@vger.kernel.org
X-Gm-Message-State: AFq9FYIYSZDs6VXnJ5YKprMWSSGUoNfvB8YJVJkp9PZoxtYmesqw/dd4
	AkIY9sj6Vjbb4XkCl4Hoy6fiAiYkuwMuaRCTJPjrJruC+5cxGz+2vvaN
X-Gm-Gg: AYBFou31iqCmLtSSzB4HcjLMhQzSZf4FOrVxjqbH2i5JhBjeMvb4gJz/+6tf6ndGx2z
	+YBDy9nofZoYdRn7TDOh3z0O1XIiWB7wSUZRcfF3FW/K7kpbxDs/jZ97N9eV1HDwj9or9mFicUH
	u/9oNkr466wgVcim5bAThYioIoPbVDALaonvFnJNJFUljp3JkOzPMWN5TrSMfkvsaUu2+YGaaGA
	n51YGx8RiToKvhfaXBNbLncUFH7dif2Tpht3vNYy4u+vcCyNiUxOfKxWUzzTsSf5ntazqQn5vf+
	rAi2U/IPoL2OiCVMNW+C8RP/1ahQa1t40ut9dTC5zy0RWGNqTzVN5ZQW9BKcq5GvE/5be+k80hi
	BBHgQ1VlBqnk1UYVrCYTRsgEBG528Ez4q2o/3XY46dN4TwkQU2sdtNG9FHFMsnuRW//iQZ7LaCg
	eOkQYRwh29jzF1v/p1t1Hl/KxroRKsNlsT16cpA/iS/BdaacsV6uNgIBmqsCq6ibKpKCZ+al2xV
	SfVwc31qW1MwHDyhUk=
X-Received: by 2002:a05:600c:8708:b0:4a1:7b05:3a6d with SMTP id 5b1f17b1804b1-4a18e49881amr250198175e9.8.1791915278441;
        Tue, 13 Oct 2026 11:14:38 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf1358asm383933345e9.4.2026.10.13.11.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:14:37 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Milo Kim <milo.kim@ti.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 6/7] regulator: lp872x: Add support for input and regulator power supplies
Date: Tue, 13 Oct 2026 21:14:16 +0300
Message-ID: <20261013181417.492252-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013181417.492252-1-clamor95@gmail.com>
References: <20261013181417.492252-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LP872x support dedicated main power supply input usually shared with
parent power supply for one of internal regulators (ldo1).

Add support for retrieving and managing these supply regulators using the
regulator framework to ensure proper power supply dependencies and
power-up sequencing.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/regulator/lp872x.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/regulator/lp872x.c b/drivers/regulator/lp872x.c
index 50870ffe75ac5..633ac1da1de62 100644
--- a/drivers/regulator/lp872x.c
+++ b/drivers/regulator/lp872x.c
@@ -471,6 +471,7 @@ static const struct regulator_ops lp8725_buck_ops = {
 static const struct regulator_desc lp8720_regulator_desc[] = {
 	{
 		.name = "ldo1",
+		.supply_name = "vbatt",
 		.of_match = of_match_ptr("ldo1"),
 		.id = LP8720_ID_LDO1,
 		.ops = &lp872x_ldo_ops,
@@ -485,6 +486,7 @@ static const struct regulator_desc lp8720_regulator_desc[] = {
 	},
 	{
 		.name = "ldo2",
+		.supply_name = "vin1",
 		.of_match = of_match_ptr("ldo2"),
 		.id = LP8720_ID_LDO2,
 		.ops = &lp872x_ldo_ops,
@@ -499,6 +501,7 @@ static const struct regulator_desc lp8720_regulator_desc[] = {
 	},
 	{
 		.name = "ldo3",
+		.supply_name = "vin1",
 		.of_match = of_match_ptr("ldo3"),
 		.id = LP8720_ID_LDO3,
 		.ops = &lp872x_ldo_ops,
@@ -513,6 +516,7 @@ static const struct regulator_desc lp8720_regulator_desc[] = {
 	},
 	{
 		.name = "ldo4",
+		.supply_name = "vin2",
 		.of_match = of_match_ptr("ldo4"),
 		.id = LP8720_ID_LDO4,
 		.ops = &lp872x_ldo_ops,
@@ -527,6 +531,7 @@ static const struct regulator_desc lp8720_regulator_desc[] = {
 	},
 	{
 		.name = "ldo5",
+		.supply_name = "vin2",
 		.of_match = of_match_ptr("ldo5"),
 		.id = LP8720_ID_LDO5,
 		.ops = &lp872x_ldo_ops,
@@ -541,6 +546,7 @@ static const struct regulator_desc lp8720_regulator_desc[] = {
 	},
 	{
 		.name = "buck",
+		.supply_name = "vinb",
 		.of_match = of_match_ptr("buck"),
 		.id = LP8720_ID_BUCK,
 		.ops = &lp8720_buck_ops,
@@ -556,6 +562,7 @@ static const struct regulator_desc lp8720_regulator_desc[] = {
 static const struct regulator_desc lp8725_regulator_desc[] = {
 	{
 		.name = "ldo1",
+		.supply_name = "vin1",
 		.of_match = of_match_ptr("ldo1"),
 		.id = LP8725_ID_LDO1,
 		.ops = &lp872x_ldo_ops,
@@ -570,6 +577,7 @@ static const struct regulator_desc lp8725_regulator_desc[] = {
 	},
 	{
 		.name = "ldo2",
+		.supply_name = "vin2",
 		.of_match = of_match_ptr("ldo2"),
 		.id = LP8725_ID_LDO2,
 		.ops = &lp872x_ldo_ops,
@@ -584,6 +592,7 @@ static const struct regulator_desc lp8725_regulator_desc[] = {
 	},
 	{
 		.name = "ldo3",
+		.supply_name = "vin2",
 		.of_match = of_match_ptr("ldo3"),
 		.id = LP8725_ID_LDO3,
 		.ops = &lp872x_ldo_ops,
@@ -598,6 +607,7 @@ static const struct regulator_desc lp8725_regulator_desc[] = {
 	},
 	{
 		.name = "ldo4",
+		.supply_name = "vin3",
 		.of_match = of_match_ptr("ldo4"),
 		.id = LP8725_ID_LDO4,
 		.ops = &lp872x_ldo_ops,
@@ -612,6 +622,7 @@ static const struct regulator_desc lp8725_regulator_desc[] = {
 	},
 	{
 		.name = "ldo5",
+		.supply_name = "vin3",
 		.of_match = of_match_ptr("ldo5"),
 		.id = LP8725_ID_LDO5,
 		.ops = &lp872x_ldo_ops,
@@ -626,6 +637,7 @@ static const struct regulator_desc lp8725_regulator_desc[] = {
 	},
 	{
 		.name = "lilo1",
+		.supply_name = "vinlilo1",
 		.of_match = of_match_ptr("lilo1"),
 		.id = LP8725_ID_LILO1,
 		.ops = &lp872x_ldo_ops,
@@ -640,6 +652,7 @@ static const struct regulator_desc lp8725_regulator_desc[] = {
 	},
 	{
 		.name = "lilo2",
+		.supply_name = "vinlilo2",
 		.of_match = of_match_ptr("lilo2"),
 		.id = LP8725_ID_LILO2,
 		.ops = &lp872x_ldo_ops,
@@ -654,6 +667,7 @@ static const struct regulator_desc lp8725_regulator_desc[] = {
 	},
 	{
 		.name = "buck1",
+		.supply_name = "vinb",
 		.of_match = of_match_ptr("buck1"),
 		.id = LP8725_ID_BUCK1,
 		.ops = &lp8725_buck_ops,
@@ -670,6 +684,7 @@ static const struct regulator_desc lp8725_regulator_desc[] = {
 	},
 	{
 		.name = "buck2",
+		.supply_name = "vinb",
 		.of_match = of_match_ptr("buck2"),
 		.id = LP8725_ID_BUCK2,
 		.ops = &lp8725_buck_ops,
@@ -745,6 +760,7 @@ static const struct regmap_config lp872x_regmap_config = {
 static int lp872x_probe(struct i2c_client *cl)
 {
 	struct device *dev = &cl->dev;
+	const char *in_supply_name;
 	struct lp872x *lp;
 	int ret;
 
@@ -761,6 +777,12 @@ static int lp872x_probe(struct i2c_client *cl)
 		return dev_err_probe(dev, PTR_ERR(lp->regmap),
 				     "Failed to init regmap\n");
 
+	/* LDO0 parent supplies chip itself */
+	in_supply_name = lp->info->rdesc[0].supply_name;
+	ret = devm_regulator_get_enable(dev, in_supply_name);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable supply regulator\n");
+
 	lp->dev = dev;
 	i2c_set_clientdata(cl, lp);
 
-- 
2.53.0

