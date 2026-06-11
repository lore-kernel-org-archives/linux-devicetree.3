Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09CA3BCD12
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168618; cv=none; b=YPimxGekMClFIAknmvTNZ6634I6WMh3wAAs23LTInfydzmZ3hp/l4YCGW4blX0xDFGDBbe02RB8Zd/DMRX6UeH/iBzgwwiQzGSLhzdlnyQBoOJICZ3QjQ/aGk3PubwDbrDy03HR/zL9UgJBffe5wCIBZE0+fAPQgX6B8f1GAYYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168618; c=relaxed/simple;
	bh=zibcBFPg9JLek+JrVlGq+zace6I2ePqJsyptJEv/VQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PE8JvCPAzG9CGwdugdaYK7jEtJwgRfbwkTEIMaBC2Zfwu78R+BP0BL8mCaMMiJoypC4y3y5dMLwiIC5E5v9F9vZeuiOS1lFDWIKFgo3ZKhGfEyR6y1CozuHnYRPQPswxAnekBsmL+KLzLWAfkt8vY1D7H0rCJ8Kh+R1vuagI1Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7NP4hdB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ON8YVeDV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7NP4hdB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ON8YVeDV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GhuE3835362
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:03:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tC2t88rZPwlziJiJ1EpkCi7wbDjd/xXCSkiYjS6C3SQ=; b=f7NP4hdBK7TIxKEQ
	4F96aIf3qp6S4rsc4coXzze54GWm0WcvyDzcdxkOu+Zwp7smyJQKftTPdl/TtRei
	E2qUNxUzN3vIFhvhsZuhFyGgai7MiaKvg1Y8zD5i/YoMJdEJ5O3QHwcPiJ4MgSVL
	f9WAr9JBnt+sGvUrFjPI3db2DIcK+n9+3YInDidCO/icen74d31w3pgoeLDsEunU
	DPosBsKk4Ctc/ZyW6i9UxPF7DhUxbLSnt7v9h28cDWFPv4EFBrYbdnNJyI/xYNea
	4JzVjjn66bWmT2ZiPeSzHNLHb9Aw+R/N1vMOWRZCsBg5mOERNv3sa5h09IWyc4J9
	snBiNA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6tjmm4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:03:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0a99db8dfso82860165ad.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 02:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781168614; x=1781773414; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tC2t88rZPwlziJiJ1EpkCi7wbDjd/xXCSkiYjS6C3SQ=;
        b=ON8YVeDVYOgOw7mmnpNvD2jDgZL97DqAdbAbiOq5+nrIJG1VB7oUQWnsMnbnd2E5Cs
         5Dw5eK4JGqFziovH7KCZkXLRq9EeMgSxWahUO4qSSXcVlObRoXftEO3nDonIixguZaRe
         h5VfpwnRZM39W4Z6eVRCxWWYIpK854ryAj68R4sgtkFNCj8RxnZnlT+rNuYqZH7HRMPl
         BopcxNeDbcpPBediqGYhj2T1iFdBonNOGwlKm4DHLjifpOxfLh8SOHrDGFbTWijlQvf5
         +gG47QUsb/hOHcmxUKwhQgFskdP7X6UZgQN8hPLksIXcSwiMFV5JgK0H7dsq0aCt6JcY
         hgoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781168614; x=1781773414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tC2t88rZPwlziJiJ1EpkCi7wbDjd/xXCSkiYjS6C3SQ=;
        b=bVPUQPUuRXvAuQSAcfg8qzgMeE8csQqxMtxiiZ0HgAWDNOaeinGbFPrFRQ4YGOBoGp
         0fpQmff+AGXTgPReJMI8PN+wFXswaOGj8RDG3rQ9SQ+MM34nU2ZCqzi9hyGSb1/v6ppP
         y07u0jfMZl725HcOSoYQ1L8baEv57Bxw8vkuWlywqLzPR09Q/zMN+FAw7NFqb26mXMy+
         3IizP1EQ8wR6+SvGX8u1sycahqKDkiYqjarQjHRcZ1mLeRoyGMAOWRAPuduZc6/lNUur
         5wac/X2sTiGEzzSFwMJP1qs0XGPeq120J95kRU/lbVlO8F+Krv6NUpgw4a9zW7lh24gA
         yOow==
X-Forwarded-Encrypted: i=1; AFNElJ/3Rmt26gRYfJW8405d6n5MvOtGkclN4RODiHBVfOSuH8mXjMtWcm/t/sIn8c7vLPlRn2gdWltk1W3H@vger.kernel.org
X-Gm-Message-State: AOJu0YzEAu6/dh4kqf00fbtzemuYdDNXw7b9Hhni9SCprWtlZ/vxPo0R
	XPVhJiGqzebuj9cjLX/08Y8bT4T5pZIy3zC0Nvs4JeriHHNUtOOTcgO70sNwzOdLWA4ZT3tb4+D
	/dzKG8uoUV8WzQPTOLI9hswJw6w+i15N9srS+hLegq1hR70Wedp+PHJBmNSbMLQ+a
X-Gm-Gg: Acq92OHyF4KvqcwjEgDlcggLcFurxEVTvMOrmk2gfgEFWoeYIXAv3augjZ9JqojsWAM
	/2lfzWTfMT7DdSCH6X+quNsnu0S/ArMfSD7T/ADV65Crj+nqPPMMWRLdG8BU9oEV3lglAbY6BPQ
	zFKmhCKV8S+2lhgIdVi1rF0YLP+76CaPhLDF0IKisuJAOQxgToyfNjyCPNgpw0b9UftxzpOxmHp
	QjgDHOLOdlwGzCf/7lHAR5clRQtuXkRa0S1J1f40t3d9j4ikP6wJoG8cZNYRfq3jRNuivvMLykQ
	HncH4IsNNN0pf4ymLEO09b0wGyMaGsq9siC/sSPYxKLblVPx0cBVwqdirGxZ+X0iaWnGOGQMIiK
	mAlYuCFOHVPIddfNTBzuc41YB5WhzqqYzx0EEK3cNZ/vhRGE6b6CYqSaFer0AXxZjzQDrFBDmQ/
	dMo+Ls6TA9wDfQIaukt8j3V9rhpN4FzphFPCjaBuHN0B+kur/ew160bKhpA00CGG7x1Dk=
X-Received: by 2002:a17:903:234a:b0:2bf:160f:7038 with SMTP id d9443c01a7336-2c2f07330aamr21474875ad.12.1781168614345;
        Thu, 11 Jun 2026 02:03:34 -0700 (PDT)
X-Received: by 2002:a17:903:234a:b0:2bf:160f:7038 with SMTP id d9443c01a7336-2c2f07330aamr21474395ad.12.1781168613801;
        Thu, 11 Jun 2026 02:03:33 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edbb49bsm140980535ad.38.2026.06.11.02.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:03:33 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 14:33:18 +0530
Subject: [PATCH v2 3/3] regulator: qcom-refgen: add support for the IPQ9650
 SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-ipq9650_refgen-v2-3-d96a91d5b99e@oss.qualcomm.com>
References: <20260611-ipq9650_refgen-v2-0-d96a91d5b99e@oss.qualcomm.com>
In-Reply-To: <20260611-ipq9650_refgen-v2-0-d96a91d5b99e@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA4OSBTYWx0ZWRfXxC/Lz2mO2ah8
 zrtu9/h3ub7qTJvSr4u10CkSUcVseF6xkI1FYAyGOUNyGPgLWWbFEfGXHd0Fvso6qKQ5hO7L/63
 D7I33Gj2oOfrDT1AQisgnUNimm7789Bq2xS/eiIQQFJ5NzUo/4Oqpb9gHxzHPPQe/Zn3oHChL26
 pwqz7hD0PN2Qjoijm1xUbD3vpymNbYrgpT6JhyaTWgrnxTceTrnzsp6XkjMYxYKmH1pA+3aR9rc
 9+nfKeAYLmJUjAPZP7D8Jkrsl3yfquV8RugvZTAKjUlgLdIvhxFp83+JSsy+1HaKqmlbJowZTbe
 sT0zKAfdRx4Y4St5f05HxI4dyzKxm82VAbTwibq3W5+IITTgyFyYtnPfuqD5RexEM+kQxba3S5c
 oWGQ0LZZajzVNm0wb63+PgqcuRz/BR+gMr6SIKuMFVQSGLSaGE6bfDixjNE5xls7Wa1RN3dKR/3
 b09fd8CwLJ57WM+WBJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA4OSBTYWx0ZWRfX6E33glcjh3xZ
 b2v3BhpU8QTmhjS4Y2hRB/QT7+DZJtB3IS7GHrqzcnQ4DVdKd5N8FyMbwk+mhBuoqGP4SS95tNV
 iuoXdiNTOlxmSSKYih9Bjfbx+E2BZmA=
X-Authority-Analysis: v=2.4 cv=AaiB2XXG c=1 sm=1 tr=0 ts=6a2a79e7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Z5Z_lLKGqtEyjnyCENkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: nruBRtpCu0GpcNJA3Oln4YZQ6ihXAaeY
X-Proofpoint-GUID: nruBRtpCu0GpcNJA3Oln4YZQ6ihXAaeY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110089

IPQ9650 SoC has 2 REFGEN blocks providing the reference current to the
PCIe and USB, UNIPHY PHYs. For the other SoCs, clocks for this block is
enabled on power up but that's not the case for IPQ9650 and we have to
enable those clocks explicitly to bring up the PHYs properly.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/regulator/qcom-refgen-regulator.c | 89 +++++++++++++++++++++++++++++--
 1 file changed, 85 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/qcom-refgen-regulator.c b/drivers/regulator/qcom-refgen-regulator.c
index 6a3795469927..e8821f159ff1 100644
--- a/drivers/regulator/qcom-refgen-regulator.c
+++ b/drivers/regulator/qcom-refgen-regulator.c
@@ -3,6 +3,7 @@
 // Copyright (c) 2023, Linaro Limited
 
 #include <linux/bitfield.h>
+#include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -16,6 +17,10 @@
  #define REFGEN_BIAS_EN_ENABLE		0x7
  #define REFGEN_BIAS_EN_DISABLE		0x6
 
+#define REFGEN_REG_REFGEN_STATUS	0xC
+#define REFGEN_STATUS_OUT_MASK		BIT(3)
+ #define REFGEN_STATUS_OUT_ENABLE	0x8
+
 #define REFGEN_REG_BG_CTRL		0x14
 #define REFGEN_BG_CTRL_MASK		GENMASK(2, 1)
  #define REFGEN_BG_CTRL_ENABLE		0x3
@@ -25,6 +30,16 @@
 #define REFGEN_PWRDWN_CTRL5_MASK	BIT(0)
  #define REFGEN_PWRDWN_CTRL5_ENABLE	0x1
 
+struct qcom_refgen_regulator_data {
+	const struct regulator_desc *rdesc;
+	bool has_clocks;
+};
+
+struct qcom_refgen_drvdata {
+	struct clk_bulk_data *clks;
+	int num_clks;
+};
+
 static int qcom_sdm845_refgen_enable(struct regulator_dev *rdev)
 {
 	regmap_update_bits(rdev->regmap, REFGEN_REG_BG_CTRL, REFGEN_BG_CTRL_MASK,
@@ -62,6 +77,42 @@ static int qcom_sdm845_refgen_is_enabled(struct regulator_dev *rdev)
 	return 1;
 }
 
+static int qcom_ipq9650_refgen_enable(struct regulator_dev *rdev)
+{
+	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int qcom_ipq9650_refgen_disable(struct regulator_dev *rdev)
+{
+	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
+
+	clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
+
+	return 0;
+}
+
+static const struct regulator_desc ipq9650_refgen_desc = {
+	.enable_reg = REFGEN_REG_REFGEN_STATUS,
+	.enable_mask = REFGEN_STATUS_OUT_MASK,
+	.enable_val = REFGEN_STATUS_OUT_ENABLE,
+	.enable_time = 5,
+	.name = "refgen",
+	.owner = THIS_MODULE,
+	.type = REGULATOR_CURRENT,
+	.ops = &(const struct regulator_ops) {
+		.enable		= qcom_ipq9650_refgen_enable,
+		.disable	= qcom_ipq9650_refgen_disable,
+		.is_enabled	= regulator_is_enabled_regmap,
+	},
+};
+
 static const struct regulator_desc sdm845_refgen_desc = {
 	.enable_time = 5,
 	.name = "refgen",
@@ -90,6 +141,19 @@ static const struct regulator_desc sm8250_refgen_desc = {
 	},
 };
 
+static const struct qcom_refgen_regulator_data ipq9650_data = {
+	.rdesc = &ipq9650_refgen_desc,
+	.has_clocks = true,
+};
+
+static const struct qcom_refgen_regulator_data sdm845_data = {
+	.rdesc = &sdm845_refgen_desc,
+};
+
+static const struct qcom_refgen_regulator_data sm8250_data = {
+	.rdesc = &sm8250_refgen_desc,
+};
+
 static const struct regmap_config qcom_refgen_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -98,6 +162,8 @@ static const struct regmap_config qcom_refgen_regmap_config = {
 
 static int qcom_refgen_probe(struct platform_device *pdev)
 {
+	const struct qcom_refgen_regulator_data *data;
+	struct qcom_refgen_drvdata *drvdata = NULL;
 	struct regulator_init_data *init_data;
 	struct regulator_config config = {};
 	const struct regulator_desc *rdesc;
@@ -106,10 +172,23 @@ static int qcom_refgen_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	void __iomem *base;
 
-	rdesc = of_device_get_match_data(dev);
-	if (!rdesc)
+	data = of_device_get_match_data(dev);
+	if (!data)
 		return -ENODATA;
 
+	if (data->has_clocks) {
+		drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+		if (!drvdata)
+			return -ENOMEM;
+
+		drvdata->num_clks = devm_clk_bulk_get_all(dev, &drvdata->clks);
+		if (drvdata->num_clks < 0)
+			return dev_err_probe(dev, drvdata->num_clks,
+					     "failed to get clocks\n");
+	}
+
+	rdesc = data->rdesc;
+
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
@@ -126,6 +205,7 @@ static int qcom_refgen_probe(struct platform_device *pdev)
 	config.init_data = init_data;
 	config.of_node = dev->of_node;
 	config.regmap = regmap;
+	config.driver_data = drvdata;
 
 	rdev = devm_regulator_register(dev, rdesc, &config);
 	if (IS_ERR(rdev))
@@ -135,8 +215,9 @@ static int qcom_refgen_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_refgen_match_table[] = {
-	{ .compatible = "qcom,sdm845-refgen-regulator", .data = &sdm845_refgen_desc },
-	{ .compatible = "qcom,sm8250-refgen-regulator", .data = &sm8250_refgen_desc },
+	{ .compatible = "qcom,ipq9650-refgen-regulator", .data = &ipq9650_data },
+	{ .compatible = "qcom,sdm845-refgen-regulator", .data = &sdm845_data },
+	{ .compatible = "qcom,sm8250-refgen-regulator", .data = &sm8250_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_refgen_match_table);

-- 
2.34.1

