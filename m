Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.186.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517116;
	b=BfyXLGFvqtaQiWs3kx+GiWBH7bqspLaZ+WL28hdNhdBpWX+RFAPLKPYHH7K0F/d8i6xx
	 kKcoMILri2mb/pBJZnU5UWQQx0IPgI9lxSPrcV5HEoxlHC9PdHiKsUFy0ScGD9ADOZ6H0
	 KJDT4Lm+kxqrPkmcWzeSDOydHUj8fkiHou8WfGiO775aCPxTQX52kaGQEcgUT5r5SJzHK
	 dp9ZXD4jnpv42+IOsq3Uk7B+Q3U9Xb4qI3G4mHRCcypjQQnQ++6/kGt7zbTESb5DQ1ClJ
	 4OtDpEy6F1dpeSO7UCMfJNjDJBcdy8Cg0Pr/gFqqfojJ1Uztbzf5k/pLBukN679vACw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517116;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=q7PBzm6IpwoqeUW4SGvSibZ8Ne3iky2jn/TgYiXQpiE=;
	b=mQ4sbvZilec5QgOVvNZc5Ar/QQTgU5F/EjsFZtQw3tfVfWKwsYW0001qbU7IApl/7hCT
	 wCB6tU6yK65HUXQ3QmfJi54cBOKvhzV6bJSOOdPkql2a/4yQ9aReT9D7sgXQAL3hxshqN
	 oFVn7iXKDlp4ihm+SYd2PMM2licETZJqnLrIfQ0ShDW5/25fAtn1WcDPjehBQQubVnMtb
	 8Bl0EOjqYYWLyOcKngv+0gWbCrxYl1Ma29r3p68vyVf7Q9Ws8uaonB6V6fnIq4bZ2oASx
	 dZySyUzn6m5OtVrSR7/Pd1rH/K7JwnpfdY+P+VOaDM7BwLdxZaxRRicqDeQM1I5JXtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=krgm.moe;
	spf=pass smtp.mailfrom=krgm.moe;
	arc=none smtp.remote-ip=103.47.186.116
Received: from krgm.moe (krgm.moe [103.47.186.116])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46D52606A691;
	Tue, 24 Nov 2026 10:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46D52606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krgm.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krgm.moe
Received: from [10.42.0.96] (unknown [114.242.206.180])
	by krgm.moe (Postfix) with ESMTPSA id 78F23859;
	Tue, 24 Nov 2026 16:15:12 +0530 (IST)
From: SignKirigami <prcups@krgm.moe>
Date: Tue, 24 Nov 2026 18:44:01 +0800
Subject: [PATCH 2/2] regulator: qcom-rpmh: Add PM6450 LDO support
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-netrani-pm6450-v1-v1-2-1914da758d3d@krgm.moe>
References: <20261124-netrani-pm6450-v1-v1-0-1914da758d3d@krgm.moe>
In-Reply-To: <20261124-netrani-pm6450-v1-v1-0-1914da758d3d@krgm.moe>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2797; i=prcups@krgm.moe;
 h=from:subject:message-id; bh=EWTkzmCy47RtwNhgEz6Zivz1+pcrn08EvhrhLiehm3I=;
 b=owEBCQL2/ZANAwAIAV0dOJt2umJjAcsmYgBrBWqOWdNjM3hehXD+I/6kn+3VGMZ/Oe5zU8bFm
 4l3hrqLbOGJAc8EAAEIADkWIQRSClJ2zjncUdNU0FFdHTibdrpiYwUCawVqjhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDIACgkQXR04m3a6YmNcDwv9EUkkkvMPQJ9/dQ9SCti11uvEl/MIBR6
 N7a1mwZiNrWEpKnjRjcUWQy6ZApw82OAGPihLuuh+B/JYPWq3ssQvYmG8eHID5MVWAzGU2o92kD
 JYkCj/nGxfontAJg8oLHZTMPxMnDNY4inIPNmsE/BWzHZa/gK/1Cz3J0746GkyEqLs0IHnFKLbu
 drULNcjB6/fAv8+OzEazXPIf25uNfFWDoehznFhemvXdmhXBLFLZp7Z/EVFziKFr1bVAjszm4MO
 A+I+5/N70lTudzO/z27Gz14yIb5bl8oqCBe3VBkmEQ7wzKWZDZ/37aEA0mvhiYN5ieUm6P36aT/
 cYgiz9uHy8kgtShI1Q/LIsTy3GChKXZo1Prm6hfDdlLexjjen4g/lYOyla7KV1PeXV5Af/ZuzUa
 KrBEDHN5Gj4qoWOepVSf7IZgLNPiVPI6xTCVEolXQOW5fQIBDclgc4fXeHMxgbvcmHMxCqlLDy5
 lnk+jtbmwdjrvCHFjlaHM8esHkjFtYm
X-Developer-Key: i=prcups@krgm.moe; a=openpgp;
 fpr=520A5276CE39DC51D354D0515D1D389B76BA6263

Add PM6450 LDO resources using the existing PMIC5 NLDO and PLDO
voltage models. Preserve the power-on voltage for LDO24.

Signed-off-by: SignKirigami <prcups@krgm.moe>
---
 drivers/regulator/qcom-rpmh-regulator.c | 38 +++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index da4764ffa6325..c397717dc0d6d 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -475,6 +475,15 @@ static const struct regulator_ops rpmh_regulator_vrm_bypass_ops = {
 	.get_bypass		= rpmh_regulator_vrm_get_bypass,
 };
 
+static const struct regulator_ops rpmh_regulator_vrm_no_voltage_ops = {
+	.enable			= rpmh_regulator_enable,
+	.disable		= rpmh_regulator_disable,
+	.is_enabled		= rpmh_regulator_is_enabled,
+	.set_mode		= rpmh_regulator_vrm_set_mode,
+	.get_mode		= rpmh_regulator_vrm_get_mode,
+	.get_optimum_mode	= rpmh_regulator_vrm_get_optimum_mode,
+};
+
 static const struct regulator_ops rpmh_regulator_xob_ops = {
 	.enable			= rpmh_regulator_enable,
 	.disable		= rpmh_regulator_disable,
@@ -1588,6 +1597,31 @@ static const struct rpmh_vreg_init_data pm6150l_vreg_data[] = {
 	{}
 };
 
+static const struct rpmh_vreg_hw_data pm6450_ldo_10ma_no_voltage = {
+	.regulator_type = VRM,
+	.ops = &rpmh_regulator_vrm_no_voltage_ops,
+	.hpm_min_load_uA = 10000,
+	.pmic_mode_map = pmic_mode_map_pmic5_ldo,
+	.of_map_mode = rpmh_regulator_pmic4_ldo_of_map_mode,
+};
+
+static const struct rpmh_vreg_init_data pm6450_vreg_data[] = {
+	RPMH_VREG("ldo5", LDO, 5, &pmic5_nldo, NULL),
+	RPMH_VREG("ldo7", LDO, 7, &pmic5_nldo, NULL),
+	RPMH_VREG("ldo13", LDO, 13, &pmic5_nldo, NULL),
+	RPMH_VREG("ldo16", LDO, 16, &pmic5_nldo, NULL),
+	RPMH_VREG("ldo19", LDO, 19, &pmic5_pldo, NULL),
+	RPMH_VREG("ldo23", LDO, 23, &pmic5_pldo, NULL),
+	/*
+	 * UFS VCC is selected at power-on (2.4 V or 2.96 V) according to
+	 * the storage configuration. Preserve that selection and only vote
+	 * enable and mode.
+	 */
+	RPMH_VREG("ldo24", LDO, 24, &pm6450_ldo_10ma_no_voltage, NULL),
+	RPMH_VREG("ldo25", LDO, 25, &pmic5_pldo, NULL),
+	{},
+};
+
 static const struct rpmh_vreg_init_data pm6350_vreg_data[] = {
 	RPMH_VREG("smps1",  SMPS, 1,  &pmic5_ftsmps510, "vdd-s1"),
 	RPMH_VREG("smps2",  SMPS, 2,  &pmic5_hfsmps510, "vdd-s2"),
@@ -2056,6 +2090,10 @@ static const struct of_device_id __maybe_unused rpmh_regulator_match_table[] = {
 		.compatible = "qcom,pm6350-rpmh-regulators",
 		.data = pm6350_vreg_data,
 	},
+	{
+		.compatible = "qcom,pm6450-rpmh-regulators",
+		.data = pm6450_vreg_data,
+	},
 	{
 		.compatible = "qcom,pmc8180-rpmh-regulators",
 		.data = pm8150_vreg_data,

-- 
2.56.0

