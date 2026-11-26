Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.186.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678825;
	b=vTgsbHyLJ13PhwkmOA8lqX2mgwUvgn7YonIpnubM259AqpQ5NurjLDh14dLj+Fs0eT0v
	 O8zBjo3Tx3Heos8gFBwetE7OsYFyVkfZHfDrTGH8D1HB1qWznp0SvolIGvc/ZtATh+M9I
	 3PPi7Be4tnF2AOvZh9IZ+tIVxOkmxWLhlhLR3WmkyPFGdgNCr0j8vxkRAMUfg0XxeU6BQ
	 OthWQTPpBWzufKI10UO9pft9dqUOjK55lFrs59UHaSOavPvMrFS8yG1eu18S/FJLRhQp4
	 5C0aXkkrlJ6e/YOZ0mvHpN5aGCSWn44H2dEoq8o2UluSxcY56VyqwAaPYqnLXZIwFOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678825;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=vjz176ImvmQFR5EZ1p2cPQ2UhYlLSM/GPN0mYQcudnA=;
	b=ipy8i8BLSj6Xk7dXfhyxJukrwF8I0Hb501eF80ZOeCDGLtoJNM87t3FEuAdkOSFTfq5M
	 cM4nhX3OwLIk9nD9tyFTY/jF4ipg0pCRWdLLgHlM8NTzYdTUx+hu1R57U8d+ZQn+Mvr/K
	 C2niHLWEhtmJ0tNPd93fM9d8KKl4R2Q2y46txE9bAENSBeaNeD72ZpCnmww9aKK6rvBmL
	 DEpdOx94wsY9mWInCuLwxLg5SAGmaoe8to4gnpHBQq3rZ3re1SyaICMDelyK5Dbczhu9q
	 CdpT9xE4BzhdcRO4ERpK7itqHFBph0amIZcktbass7U3EUHdj819nwcb8UVq+dMGAXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=krgm.moe;
	spf=pass smtp.mailfrom=krgm.moe;
	arc=none smtp.remote-ip=103.47.186.116
Received: from krgm.moe (krgm.moe [103.47.186.116])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB03606A31C;
	Thu, 26 Nov 2026 07:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CB03606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krgm.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krgm.moe
Received: from [10.42.0.96] (unknown [114.242.206.180])
	by krgm.moe (Postfix) with ESMTPSA id 55728859;
	Thu, 26 Nov 2026 13:10:21 +0530 (IST)
From: SignKirigami <prcups@krgm.moe>
Date: Thu, 26 Nov 2026 15:39:12 +0800
Subject: [PATCH v3 2/2] regulator: qcom-rpmh: Add partial PM6450 LDO
 support
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
Message-Id: <20261126-netrani-pm6450-v1-v3-2-2343209bbf4c@krgm.moe>
References: <20261126-netrani-pm6450-v1-v3-0-2343209bbf4c@krgm.moe>
In-Reply-To: <20261126-netrani-pm6450-v1-v3-0-2343209bbf4c@krgm.moe>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 SignKirigami <prcups@krgm.moe>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1798; i=prcups@krgm.moe;
 h=from:subject:message-id; bh=+HpkFBGvT1zcUIG+pwvb6gHum/XGlpkjcpVLev15dAc=;
 b=owEBCQL2/ZANAwAIAV0dOJt2umJjAcsmYgBrB+I44qmm4qCVdvl0BYeCGEEQde5XYmw9AHkvQ
 GyOWE7IubKJAc8EAAEIADkWIQRSClJ2zjncUdNU0FFdHTibdrpiYwUCawfiOBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDIACgkQXR04m3a6YmP6rQwAlZ059Iu6obDIZDv5szH1Hjt/a9ZVng2
 yQtr11d3KLRVRkYw3zqXOA+J43HGyyZhoPBB9lr1YMd2hKczGoGeAgWOYsZhTJxmI33gXQMgaRY
 ot2g2qeTs2D8a6O8oaBxvXgLhXK5o1eKYMRKWK8FnIlG9ieymxs29W83tEyFgRyYfxDVrU1p6yv
 dnBuhi75jZxMHPomBeqjYj2J6C8lEBypEYIa/CPIr0ImjEj4CtvWax9BAX4OipnrKiPPpUZ8i/F
 Ng1nZR5SF8wJyT6juurWPYkkj7i33+OgcG87SoAOxneY8FSshVhNaLqk+X8R0bvbxw+ZTSIcIse
 5VSvOv/WH7FJfvAury4+9lZs58dbUG/2gYTUjXabagc45tGzSzn1VASTFZX48oJocxukaRf+G95
 gBI/dEwfKtYslby9i2FY+VBEDnRiK8J87CHo1mNexJv475DETo3dw0fDTvhqjLpxWnVwMotm2nS
 KhJsfm+QjJHTvxmvti8ZbYAzBw5u1Wo
X-Developer-Key: i=prcups@krgm.moe; a=openpgp;
 fpr=520A5276CE39DC51D354D0515D1D389B76BA6263

Add the eight PM6450 RPMh LDO resources used by Portov.

Signed-off-by: SignKirigami <prcups@krgm.moe>
---
 drivers/regulator/qcom-rpmh-regulator.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index da4764ffa6325..e8571e287a30b 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -1619,6 +1619,18 @@ static const struct rpmh_vreg_init_data pm6350_vreg_data[] = {
 	RPMH_VREG("ldo22",  LDO,  22, &pmic5_nldo,      "vdd-l15-l19-l22"),
 };
 
+static const struct rpmh_vreg_init_data pm6450_vreg_data[] = {
+	RPMH_VREG("ldo5",  LDO, 5,  &pmic5_nldo,    "vdd-l5-l7-l9-l11"),
+	RPMH_VREG("ldo7",  LDO, 7,  &pmic5_nldo,    "vdd-l5-l7-l9-l11"),
+	RPMH_VREG("ldo13", LDO, 13, &pmic5_nldo,    "vdd-l13"),
+	RPMH_VREG("ldo16", LDO, 16, &pmic5_nldo,    "vdd-l16"),
+	RPMH_VREG("ldo19", LDO, 19, &pmic5_pldo_lv, "vdd-l19-l23"),
+	RPMH_VREG("ldo23", LDO, 23, &pmic5_pldo_lv, "vdd-l19-l23"),
+	RPMH_VREG("ldo24", LDO, 24, &pmic5_pldo,    "vdd-l24-l25-l26-l27-l28"),
+	RPMH_VREG("ldo25", LDO, 25, &pmic5_pldo,    "vdd-l24-l25-l26-l27-l28"),
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

