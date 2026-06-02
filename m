Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E0D3CFF49
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 09:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780392137; cv=none; b=CCMOIF7fsXe3+JGKexPS0V4Jg9VYsl4LNIb5VjiQpQOd8QtZIDUhMzzhrGgW7rLOk5msYJFXKW4FUqy5e4egv26Fa/BZFQ01hysUvwmlPcT48phikIhQ+cenuE7vv1YFPDIbZ97Hk/MAN0gyJl9l4dCLndKb8guiSan3y0ecsDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780392137; c=relaxed/simple;
	bh=nJr0f2i5H2A5VVRNHa2M0Oo/CaVCv4/HnDg5AdP6qa4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rkNRFZXF9qU473i5LPF5KL6K39ksgQ1ST0NKllkSgUPPKJNyy8dKlph+AYP3TmPXimd1MXB1fZN0XXz8yCXBgjAVMHToFgBHjwuzHM4IjWjwBRDTsm6GvWZg3bmKrBCxeOwmE72gm2CRPx171f86BaFgpLFeV6FS4Pb12pVzPfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GwpH7FzZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZmhbltG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GwpH7FzZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MZmhbltG"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6527hDLd1639570
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 09:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PCOE5vNKdTDdBmQCrOJcOWEluMHOBRxEstM1XYLtgTU=; b=GwpH7FzZv8y8u6lj
	iRBzfvO/0r0rVLC+l7jxF2DtKyX3X+HjVw14Q76NqMBaxGZauTy9OyBpMgQ+Co69
	BKXHN9qAMs0VTMjTArxOx1we94iYlpw5+TDLnUSR+yU0p7Qqd+J5J+KOz7Y5dQ+2
	Y5V04yeKq4ga4BxyC4fXWp27NWaLr1AwtRyEPKe6xOw0kHjiY//RMMqU9Of6CxRB
	f2JBncVfgYKRbl0bSSy2SbaEcNIF1aWR1rw1x8Sj6XSAOuU6EtTnLM+E/2SF3Pf/
	otsXtEPEAiPUjM+rsrrylC8O7baLqvLLtwofezzA8NHBwz6YbAi7ItSkoTvThlO3
	QrG8/Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehu1cgdgt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 09:22:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso2079087a91.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 02:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780392134; x=1780996934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PCOE5vNKdTDdBmQCrOJcOWEluMHOBRxEstM1XYLtgTU=;
        b=MZmhbltGH1+s1ovO1hp9qdPYl/lyYA6eX7wk3a5xx2AXXpSFWAft4UJyfcTiqP53dV
         AfNEw/kVIG1WNHfY0Z7rXSZ9Xy/gxp7d8eVEz33jQUfgkZ1p4opf4lwjqkcrwbzVYKXO
         hWlkIb/QbkY93Id6HFLHUoCO8UdutmYXk9Q8fnj1/AliQckj3VXfbhGtyai1IjNxmbaa
         JBSWCBgxgzBTvwwBRYLIl5hfoy3TdT5kBBnqbDYDPPx2YCrJCB0/2FsWdlYi84aPygnh
         SzEcQ5B3dhG1dy3H8XSlTtcjNsXLCwM51EnrvKvTmIFqgp2+l99+wdaB8yICx7bhp1Lm
         lMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780392134; x=1780996934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PCOE5vNKdTDdBmQCrOJcOWEluMHOBRxEstM1XYLtgTU=;
        b=N/Or3TShcPJm0BsBqJiTmI7BdU2O0barsqxrloobtU9TuQd0sQlMBtrJuS0uE+FCjZ
         tmAuDr6kyLKZVCnViAU4uZ3qVoebKMRi7P76K37Sdx24BTZ7N+nFhjn0XgzRgiaW0NbL
         rseIIUK4otcm4XRNrtle3KRiKpgW8qCbSQ+GPfmoimOG1n93AlZTSd5ZdjY22yykjUmk
         dJGcf888wyJl3cHe0vwNz4GkBdAqrObquRNd7riFQmzunMiSMTk/E6bJFWPdjwW6tRkG
         xRH9/eqweyAJOb2wBlDFSm9fOqsMLU890idddbA1qAUxD9fTBUvdZCpgylY56u8jcPZb
         hY6g==
X-Forwarded-Encrypted: i=1; AFNElJ9vIKd3j1HlwpU2VbkKuexndf+x3j5c1WdVmqxyLL+M4CRWJ8I/BfHQjHPQMwHgN9tXXXgMobIDBQCb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7epp5SGfpXgYg5PNE7Id+p+H3RnPmW5iOMIYg7Pl5hpmYLoFz
	GUbksppYb3ed7+DweGh2K/m1pVEG7+jSCOIo1WsMrLw0jh+ov8HFQxeX10UM56bGumVZCICMlkE
	Xkq9/a16LH2+bJlKEGrzF97jO4ccSbrz/t/IQcH4BSB2y/kRm0Iy8UOucHO9Ong+P
X-Gm-Gg: Acq92OGsanes/2X0IC0ivletFMLCxiO2ktV2yY+yKFyyznsYjx6R/Fihb934IYdvXz+
	iwc/AlhiIkgKa6gV1IyS3rlSj/Iw2iH28IiKYD3beW5JzFJPfhmxIyHzG+4PGFSmGV7Litn33Of
	QhohYaYdrHTYG5JCBhvdGj60yHK8u64nJ9cpA3mdmpnDToZzpp++1q3Mch9smZJb41C8wtEVF1W
	asNxreNK5fj3/oFwYJJMJUqqPdQE7eub/id4I2rUsyHrLrAAugxzjkahZY1XB85su3ANjmyVR2d
	vZMyxa2PocWfdjicN+MDFL1XBj/aFBrpbRdUZq6/x+ve+WrQzGO88YgaDtR9w28UhFTu/LQdlbj
	MBQ/ghYpKeb0W8vbQMvGUzh5c4KWrg+HB10Z2/jjhiOb6QGgkf1ct1gC/9aSO+n3umpeA7ywYGZ
	MFa9dFmo/8fsNIawkYssm82O/9ie3p3WpLVahYEWKr6aOMv1fbntfG1/6ncQyubi7b2qc=
X-Received: by 2002:a17:90b:498d:b0:36b:98a3:4a85 with SMTP id 98e67ed59e1d1-36c685a8b24mr15601022a91.27.1780392133920;
        Tue, 02 Jun 2026 02:22:13 -0700 (PDT)
X-Received: by 2002:a17:90b:498d:b0:36b:98a3:4a85 with SMTP id 98e67ed59e1d1-36c685a8b24mr15600991a91.27.1780392133436;
        Tue, 02 Jun 2026 02:22:13 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd91f1affsm2154028a91.11.2026.06.02.02.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 02:22:13 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 14:52:00 +0530
Subject: [PATCH 2/2] regulator: qcom-refgen: add support for the IPQ9650
 SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-ipq9650_refgen-v1-2-55e2afa5ff64@oss.qualcomm.com>
References: <20260602-ipq9650_refgen-v1-0-55e2afa5ff64@oss.qualcomm.com>
In-Reply-To: <20260602-ipq9650_refgen-v1-0-55e2afa5ff64@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: EAi_3vkCOOhCfrkGS0qeI5XzjTdVdWNp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4NyBTYWx0ZWRfX5gWYnaOul6cx
 jU5WzhX/1TSPstM8qECqlj4ABXHwnxCZB9q23NubuFHsLSYXM7oTxuQ/x0cdIP/rzsGprjBAs5W
 LNGFN02u2PmsBmk2yOOohmb+di32jJDmO5Dd843kYKxV4rgCfn0GCLpsJBfEc7J7vYJYfOLgmWy
 eMf38yJ1o+wHJlM/3WGGRzhK17FJM5HByqa4KXl0rEeDR/xZfitczLrRFSMyL4BwXM1tFr0O0AY
 nCNjnv25OPCiewKWCaLkQtbEQQQmPX5a6jKInDaPWvTxAiYWer6x5Ay6l10TYF7eJYRgwjYHlmC
 8nD2sx26ENj+LkkQkjgGXEsbnsBsMl+bs8sXi4Vrgpy4Pogmrjh3RfgJz/4O8Hx7Uvlx5yz4VnA
 XG+hxVC1jolKaAUZ09YG6Er/8LxYl48HAmBLQoSKee4fpK7hq6oKtFWwpJm5dFo9msDKvpOWet/
 f8OXmM+SCEyjKrU5qtg==
X-Proofpoint-GUID: EAi_3vkCOOhCfrkGS0qeI5XzjTdVdWNp
X-Authority-Analysis: v=2.4 cv=O6IJeh9W c=1 sm=1 tr=0 ts=6a1ea0c7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=mehsi33qI3AhlkpvdBkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020087

IPQ9650 SoC has 2 REFGEN blocks providing the reference current to the
PCIe and USB, UNIPHY PHYs. For the other SoCs, clocks for this block is
enabled on power up but that's not the case for IPQ9650 and we have to
enable those clocks explicitly to bring up the PHYs properly.

As per the design team, REFGEN block provides the reference current.
Hence marked the regulator type as REGULATOR_CURRENT.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/regulator/qcom-refgen-regulator.c | 94 +++++++++++++++++++++++++++++--
 1 file changed, 90 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/qcom-refgen-regulator.c b/drivers/regulator/qcom-refgen-regulator.c
index 299ac3c8c3bc..2858792acba8 100644
--- a/drivers/regulator/qcom-refgen-regulator.c
+++ b/drivers/regulator/qcom-refgen-regulator.c
@@ -3,6 +3,7 @@
 // Copyright (c) 2023, Linaro Limited
 
 #include <linux/bitfield.h>
+#include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -10,6 +11,7 @@
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 #include <linux/regulator/of_regulator.h>
+#include <linux/slab.h>
 
 #define REFGEN_REG_BIAS_EN		0x08
 #define REFGEN_BIAS_EN_MASK		GENMASK(2, 0)
@@ -25,6 +27,17 @@
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
+	unsigned int enable_count;
+};
+
 static int qcom_sdm845_refgen_enable(struct regulator_dev *rdev)
 {
 	regmap_update_bits(rdev->regmap, REFGEN_REG_BG_CTRL, REFGEN_BG_CTRL_MASK,
@@ -62,6 +75,49 @@ static int qcom_sdm845_refgen_is_enabled(struct regulator_dev *rdev)
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
+	drvdata->enable_count++;
+
+	return 0;
+}
+
+static int qcom_ipq9650_refgen_disable(struct regulator_dev *rdev)
+{
+	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
+
+	clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
+	drvdata->enable_count--;
+
+	return 0;
+}
+
+static int qcom_ipq9650_refgen_is_enabled(struct regulator_dev *rdev)
+{
+	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
+
+	return drvdata->enable_count > 0;
+}
+
+static const struct regulator_desc ipq9650_refgen_desc = {
+	.enable_time = 5,
+	.name = "refgen",
+	.owner = THIS_MODULE,
+	.type = REGULATOR_CURRENT,
+	.ops = &(const struct regulator_ops) {
+		.enable		= qcom_ipq9650_refgen_enable,
+		.disable	= qcom_ipq9650_refgen_disable,
+		.is_enabled	= qcom_ipq9650_refgen_is_enabled,
+	},
+};
+
 static const struct regulator_desc sdm845_refgen_desc = {
 	.enable_time = 5,
 	.name = "refgen",
@@ -90,6 +146,19 @@ static const struct regulator_desc sm8250_refgen_desc = {
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
@@ -98,6 +167,8 @@ static const struct regmap_config qcom_refgen_regmap_config = {
 
 static int qcom_refgen_probe(struct platform_device *pdev)
 {
+	const struct qcom_refgen_regulator_data *data;
+	struct qcom_refgen_drvdata *drvdata = NULL;
 	struct regulator_init_data *init_data;
 	struct regulator_config config = {};
 	const struct regulator_desc *rdesc;
@@ -106,10 +177,23 @@ static int qcom_refgen_probe(struct platform_device *pdev)
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
@@ -126,6 +210,7 @@ static int qcom_refgen_probe(struct platform_device *pdev)
 	config.init_data = init_data;
 	config.of_node = dev->of_node;
 	config.regmap = regmap;
+	config.driver_data = drvdata;
 
 	rdev = devm_regulator_register(dev, rdesc, &config);
 	if (IS_ERR(rdev))
@@ -135,8 +220,9 @@ static int qcom_refgen_probe(struct platform_device *pdev)
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

