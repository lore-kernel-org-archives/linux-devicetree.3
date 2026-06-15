Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3163D88F6
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512574; cv=none; b=j5NC2lBq+lvEirGCGBJlRxjeuohKZTcra2Nv1/8TJ5KQX27nUazr2pHGTlFvW+tk+U+ktSI4YdEQuXAxemXJACUOz7x4LRw6jAo8W/lHiX98pPbJtN57qpzgVnkQvIShnpPG56LNg2ZEWahGthEiY4EkCESFZTE5Cjd5Nh8B9lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512574; c=relaxed/simple;
	bh=q8n8EcRVEqDx0rTIRxW16mASt8lBbsLXkx6/x0MGZYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FD98yhqqvh5wqPQ8x0E3wOabcpdCKYlpn1AC9a+RNJWeNKXRFAOUxAPaLrv8MYMXxDcZPzfEqg8EAnte3TKyasCVwtcCft3j3N55dYkyVxkhJQ5M7yjtYTQoaN1ulM+33ulfz54KiY7opT5FfM6ImbiAqD4M0LdENqFXvdeCkvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RuVSpvvU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IvcbDkUB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RuVSpvvU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IvcbDkUB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F7UKvg4092026
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E/j9QF8dbDj+/82a7BdJ5T+MI0kCyu4OX+6hRc/SsO8=; b=RuVSpvvUEMiuBjlI
	9zsEvK6ONbflYHJT9WRNWoF6qLgf68k9o+6lvEbdW5ic1vtKifJMiSi7hdFb6P7t
	6/k+O5oGOgpjTo0ymNmcd16DdydvKEQ1WpbuxPNoL5+JThzv+29jB2A4c5I672/e
	Hwxz6muxvJyz1u+uxokFwhccxeANnkiBMvvuYAIKzl7dwnCY22KkBHUuSFDdIyTh
	zKYM+Ve/oaCIYNMid0mkZR3NMVmN1YzXlqtnYRYhBxl8HwAVxDJZ1y/TQiXmUuzw
	BWDmHZD0dyR/FKr3dWLX6eCT4QdGS2Cz5mwOpOjrc44lg99/U+tnsK+nkLO/1qjq
	k4UwOQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etd2c887r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:36:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36e09ec696aso5224242a91.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 01:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512568; x=1782117368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/j9QF8dbDj+/82a7BdJ5T+MI0kCyu4OX+6hRc/SsO8=;
        b=IvcbDkUByhuvPF4Lse6geYD36uWHMKXDckUv+SNVHkFXv+JgGxmW96K06UzVeiBFqL
         42n66R24p7sLJJnzux25fszE0Eecz8lqtAE8WmJUDRsablyP8PJDEkx3QAgqzrEq1W1m
         DbNky7jBC8hOjF9tyT4fUKZev3pieQIonwfaaks+wpbawKhgw5qUDfad2KvWi+vHskOr
         65VGNzcwUy0/BpTzLlGVG/OuREE4ngVphjgkEsaRmskE5LBmq8C5g2Ny3XgZq8OiPMba
         5v7pmJ2hu5C/W63rVLPFEq8jTN0ytvOjmNPIaA/e7hcNrdamg/9EKd/etr0513fFSFkh
         F/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512568; x=1782117368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E/j9QF8dbDj+/82a7BdJ5T+MI0kCyu4OX+6hRc/SsO8=;
        b=dsphnudAG2RKjOYkeIkJqOT/Qi9b4Y3ZO+fDpBU0uXi5Av9ewjK43SctUfYtaBtLai
         FyQtoAxgwrkL88+v9hitEHSanawboFmuyzpiSpTR/sYSJQyvJWBRg4qTivZ1ueQ0li6K
         vr8LJGOtPimH5qqva0s6WN6ZcLNfuD/0I7F+t4F0bhD5ZIKT6b5YMw4J1jYPlP4e+HQM
         HTiuRCoIUMLAWys9Pk3zg44DaqX17KLo084TW+KA0AY10ToHysO85LKlSprFbDEZaa8k
         QjsOCJt0+oPB03rcnN1yH6l2kbgQB4CorKeto+ep2WiLb7OeHPKwRcA6rAdcwvXWCbHU
         0PzQ==
X-Forwarded-Encrypted: i=1; AFNElJ/7oFAbMKKq3LbAougdQzTEU3ifcx7EwDcXL3Repo834Usb0DYOBYXZGCioopfdOwIwLt/JiCkWQtgm@vger.kernel.org
X-Gm-Message-State: AOJu0YxFXZ/XyKarNGJ0JNL2swKC6fbHQJFmtza0fpXUn8CGqWjuKfA6
	9Xr8ishBSvbPYRRTWsDlyrEJ/ysYPGy6uwnYR61R5vrtEvhw1z4EUIRMpFhayksL0omy1YmcFm7
	5zJfU8rf+DpKKnEkki4NGOvK6bFSBP7/vOq5zmMmzgEBdqN7FTkcGdQE8cGj/fFN7
X-Gm-Gg: Acq92OHPSs2SBweHNXeM5xlRfz5qPKUMxk1N+Z9+synKxkfBOgD272oUwwytHxmOmQr
	bzPcDWZ3qxTlf6C3JWL9mLZaHHCkvQasd21S88q1NsLf3gg+yB2oFvhV5y3105ltoLCLOiCidfX
	ydLlogsGdBvG+ngugvQlcvIXR2ahrWrYHT0e4WJ0SjslTkhImuRPMIjWgVJE2ZEVp3sNDxjUsui
	zAEK+HVypXYSE3gLbvVCZqu95ZYNy3aKWPuya9XNVstZsWXWT3CfcmKu4+oFuWi73kpPNWtf1t8
	FfwzTrtwAq7VhCP8FXPr453oQtH238GNHVfF054+uiCoDrzUuFEbZToZFLGPaUAd/w4sr7IeBye
	cpToGaJPzZ/BfM2NSEuZx7OUWTCUmcsfzjMWSY8g4YyZBfmbmKyPN8ulE/SNhXayFc96KXj4j+P
	8e1e8eJma9zZtzXnf4MMHBD48eJeBinWsv8NhCKjLx5S4UtVN3fHLHDgwB
X-Received: by 2002:a17:90a:d44e:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-37a01847870mr13819078a91.1.1781512568272;
        Mon, 15 Jun 2026 01:36:08 -0700 (PDT)
X-Received: by 2002:a17:90a:d44e:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-37a01847870mr13819056a91.1.1781512567813;
        Mon, 15 Jun 2026 01:36:07 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a210ad64esm9558974a91.0.2026.06.15.01.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:36:07 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:05:49 +0530
Subject: [PATCH v3 3/3] regulator: qcom-refgen: add support for the IPQ9650
 SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-ipq9650_refgen-v3-3-5f611623629c@oss.qualcomm.com>
References: <20260615-ipq9650_refgen-v3-0-5f611623629c@oss.qualcomm.com>
In-Reply-To: <20260615-ipq9650_refgen-v3-0-5f611623629c@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX0DJZePuakK+k
 j4E5Mts66lf8RZ87k45Qls8y9lmG5wHFzGSpt2PyxojEj/gh6jjWQqYujbZTrXyNyiCLDu4lRW3
 MEXtw/XHiGNWV98wXc7Fadth64Oznv+wOfr5H6J3pCvG49sxbeC0J2pl1uFiiBpIw/0uLTDKWJj
 oZ3GBXo2Yi89Wmq5m1sDiusa/xf/8C2+OniFHaDmHb7dr9t/tCkdiGSSHMwlspFQuytyEh16ifI
 ETN492G+A12kmSnA7j+5l05m9eA5vc/QFmAwSAYs9nvh6jCocQlg23iQgJlYwSrA4TN7GL4rrcL
 KP4YURfIwv7f50TItuB9PSAGXzEYUuGAdKBn6BXuoFHr+T0Lpm25l+ZrBwIWOovDGLGFMaBaeFC
 4B3WPA7YpOxX8++Za4S5e7olfhrGpbQKl7aYbGnQnbOM9wuAQoFpmpgQnDQOEeWT0tO1EdtAME/
 qOtIey/9jZ9eMlh+MHA==
X-Proofpoint-ORIG-GUID: _xjCq1WWXe8XlKc6X8FjkT4fzcaB81PA
X-Proofpoint-GUID: _xjCq1WWXe8XlKc6X8FjkT4fzcaB81PA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX2zPBs0zMW3wy
 Or+rmZ7algN8AlEs/lX9xfZ+4XJU31cPJ9EiXsTYjMmZyB1+KTxqULAgw3pJHMwoNxQBipuH5g4
 ObCadhzxV2fZ0xXU4R2meTWldX2D2mo=
X-Authority-Analysis: v=2.4 cv=MsRiLWae c=1 sm=1 tr=0 ts=6a2fb979 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Z5Z_lLKGqtEyjnyCENkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150089

IPQ9650 SoC has 2 REFGEN blocks providing the reference current to the
PCIe and USB, UNIPHY PHYs. For the other SoCs, clock for this block is
enabled on power up but that's not the case for IPQ9650 and we have to
enable those clocks explicitly to bring up the PHYs properly.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/regulator/qcom-refgen-regulator.c | 89 +++++++++++++++++++++++++++++--
 1 file changed, 85 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/qcom-refgen-regulator.c b/drivers/regulator/qcom-refgen-regulator.c
index 6a3795469927..4b8aa40d7efe 100644
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
 
+#define REFGEN_REG_REFGEN_STATUS	0xc
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

