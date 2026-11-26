Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.186.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795663795;
	b=Q49S0i2LC/vQVxlPoRD8BsHJG7FS/gkULVo+sBaXmPKZIPELzX+ldL4DUPDblR4DklhP
	 mCa90Txg1cKRZp/h8PY8kniR84kjRDQVXXJQpWrY73HEvhi9+PoizZGgqpMjRzBHpbirO
	 ZtiCwPXuXnYufYe0tByosX3EdYzh0Pn+86ZGLbh9IiqGfQPz+QORyomld1OjgU0d8eGk7
	 FZy4IraQ5tV19JmVR+FRxcSVYlngD3cOUdVwuusZ+PFd57eOzPZPJ/xUYnTWikFE4UI4q
	 jBn1m5mzR5/1Sl0748/c2Pi4JzdyZU0XpUVglztb00ghDIqL2a3UyU9rJ5o7l2PiHOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795663795;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=2zDPtWW78XlhayfnJyx/e/yTX61o+FpaWBJ1zeXnBJg=;
	b=BqdjEz/rTPp99u/GKFfd8+ECigtlc6aLIo/qUvRo9PTRDMsjE92HvRu0CyU/yV25eXVz
	 JeqLkrVXWnXiIPaGK/U9NN7b9KI3uXJQmOQxKDoW9bG2c6U/w5sRwxNPeMmaRiCnY6IY7
	 hXEulqTtjdWRoo5Eeh8nW9T4j/G4qkBhGwiaJDiPv1eh4xOIf0h5n136eEWzxjZZSp4UN
	 xmFkHw7dTBP+b8DqIOWdBgkcp6Wh7FWqp1z9Z+QOtq/Y921ux+QMKBJyk85xzlTygKQI/
	 dwtU+gy7pVPemzysoAcL0ZliKgdBhohRkGb4ilP9Mhel7twZYvpClG5gupJg8LYPDTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=krgm.moe;
	spf=pass smtp.mailfrom=krgm.moe;
	arc=none smtp.remote-ip=103.47.186.116
Received: from krgm.moe (krgm.moe [103.47.186.116])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CADB606A31E;
	Thu, 26 Nov 2026 03:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CADB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krgm.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krgm.moe
Received: from [10.42.0.96] (unknown [114.242.206.180])
	by krgm.moe (Postfix) with ESMTPSA id 2C74C859;
	Thu, 26 Nov 2026 08:59:49 +0530 (IST)
From: SignKirigami <prcups@krgm.moe>
Date: Thu, 26 Nov 2026 11:28:38 +0800
Subject: [PATCH v2 2/2] regulator: qcom-rpmh: Add PM6450 LDO support
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
Message-Id: <20261126-netrani-pm6450-v1-v2-2-2539a2422218@krgm.moe>
References: <20261126-netrani-pm6450-v1-v2-0-2539a2422218@krgm.moe>
In-Reply-To: <20261126-netrani-pm6450-v1-v2-0-2539a2422218@krgm.moe>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 SignKirigami <prcups@krgm.moe>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1899; i=prcups@krgm.moe;
 h=from:subject:message-id; bh=pKBgMURvzrwlZYHbF673QCLOjHYgmLg4mAdaraDaFOY=;
 b=owEBCQL2/ZANAwAIAV0dOJt2umJjAcsmYgBrB6eA0nVxAYEjcxCxvnHkEQ3U4HpRIoOvPCvcG
 C2TTZTQ4fSJAc8EAAEIADkWIQRSClJ2zjncUdNU0FFdHTibdrpiYwUCawengBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDIACgkQXR04m3a6YmOf6gwArV4w51RStXcDEV3ybSUMO0OpOuMEzho
 slPfIlX+Na+thfSgXYNWYu/eCymc/Labwc3bLRyO9Sl4nffdmjfbhydJiS0g//22Hyewi43grI+
 aIGnmH79pA2oVO9ogBLkzhebuLmtJydjEe3NhAxPL0rgY02laEhsFznvEmNAo9RyoLtGEqMPune
 15B77U0MFY9BWs4f4hi5lD4fr4kMDvq75lDmR35STSclDgqBH68O0z2lFcTFhabZC4rmZn/XF62
 bWHKCZiUIkJ6JgYfc5K0vZxN5MweVrfKaiFQqn0jZmzaBwgIaVNAZhx11r3BxHLeWmlq1wZg3d3
 quCqxgjL4mWzxpqTwMNe/hLR5wdzpJZw69H6dNAbd2C+mPEHWY6XOrE5f20MLrqEEU1Im1bQ2zh
 y8VzrO3h8uYCZs3i6pnXgfZMb9uBNGgT6YIRZGERhzDNIROqA65oXeZPiB6w2Al56SyciDTK6vK
 XhxOAH56J508UWEeI7GgSunbzs+CVuV
X-Developer-Key: i=prcups@krgm.moe; a=openpgp;
 fpr=520A5276CE39DC51D354D0515D1D389B76BA6263

Add PM6450 RPMh regulator resources using the existing PMIC5 NLDO and
PLDO voltage models. LDO24 uses the PLDO model so UFS can vote load and
mode while retaining the normal RPMh behaviour for the power-on voltage
when no voltage is requested.

Signed-off-by: SignKirigami <prcups@krgm.moe>
---
 drivers/regulator/qcom-rpmh-regulator.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index da4764ffa6325..ff5022bba5fc6 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -1619,6 +1619,18 @@ static const struct rpmh_vreg_init_data pm6350_vreg_data[] = {
 	RPMH_VREG("ldo22",  LDO,  22, &pmic5_nldo,      "vdd-l15-l19-l22"),
 };
 
+static const struct rpmh_vreg_init_data pm6450_vreg_data[] = {
+	RPMH_VREG("ldo5",  LDO, 5,  &pmic5_nldo,    "vin"),
+	RPMH_VREG("ldo7",  LDO, 7,  &pmic5_nldo,    "vin"),
+	RPMH_VREG("ldo13", LDO, 13, &pmic5_nldo,    "vin"),
+	RPMH_VREG("ldo16", LDO, 16, &pmic5_nldo,    "vin"),
+	RPMH_VREG("ldo19", LDO, 19, &pmic5_pldo_lv, "vin"),
+	RPMH_VREG("ldo23", LDO, 23, &pmic5_pldo_lv, "vin"),
+	RPMH_VREG("ldo24", LDO, 24, &pmic5_pldo,    "vin"),
+	RPMH_VREG("ldo25", LDO, 25, &pmic5_pldo,    "vin"),
+	{},
+};
+
 static const struct rpmh_vreg_init_data pmcx0102_vreg_data[] = {
 	RPMH_VREG("smps1",   SMPS, 1,    &pmic5_ftsmps530, "vdd-s1"),
 	RPMH_VREG("smps2",   SMPS, 2,    &pmic5_ftsmps530, "vdd-s2"),
@@ -2056,6 +2068,10 @@ static const struct of_device_id __maybe_unused rpmh_regulator_match_table[] = {
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

