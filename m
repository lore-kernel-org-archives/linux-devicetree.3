Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE1E376494
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 17:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781717949; cv=none; b=u4/giP6XoJ8S6tC3i9mUa7vI3GUQ3mmfgineO/5hqkslm1o0Zs2+DqvfCvwa/uCJ0Vxbqrl4KgdXFh5QR6p7BrN8JffY0GioEgh2xo/s++7DgGkoCeXgf27VlJitcpjAu0rgLKCk+0Zc/dpOSpGD6PSwfuvGLzhXf9xZmw6XnD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781717949; c=relaxed/simple;
	bh=VdeyKwp31SkXwUky2ZmUzSNGxlgUFbHtWCnnQJQPNqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b/USjKq5wIv9NSFiIl0LLGW5/vx9xUv1iZb/R6GOl2hsWRWRsxps5pP7gF2EEQW9NgDJYSWplC2lLc9rcgCQxoQzGJVbz9DQfqpn9s9Qj6vT+b/VLVp9/7i86NvNsVdXCfRCrnpf+cActnmOm3WG0nuuaDKgqJHcJ35w8ccB6VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n2LA5y1o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bv0lX4HT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n2LA5y1o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bv0lX4HT"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HHd7Lo2944391
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 17:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	680+Yl6okt3675HUysJcgfxeYSokKelrviBWT8/HYkg=; b=n2LA5y1oSHhc5LcO
	znso0OIABX0d47gJXom0EdA09HNITtiX0YiqfD2ok14qH3tvQKUz4SPPbEMnOTxM
	L1ZEuYMW2b72Ro3l63pB9syNBkHxzg/sxHuxG1NEj3OIPE72eRxfcp6YtZSj1WPE
	d3eL0pK+puOjRpOZRIbfkGfOYYAbFNjgKoIA0CdK7CxpX9e2tEvuzrczYEGq36Nv
	Gsvd1tvt6fMv7thd2lhI7GNZOe2fkPuTDw+axnmKeEfdB9NR71I9i3ik0PFY45a1
	9iG6IM7u1R4pigyQvyQcM+rpXQmkgZTh9HMeP5d9sGUB5OmF+MYf0NxqsDXynZzR
	5TrAQQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueet4jpy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 17:39:07 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2beff6b6e74so932695ad.1
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781717946; x=1782322746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=680+Yl6okt3675HUysJcgfxeYSokKelrviBWT8/HYkg=;
        b=bv0lX4HTMX3ga9isCEepVzRWaj1FoKO5Eh2A8IvX3PXQxhgVfOadctypn0tBY9DIiP
         nGNWqipyRMNAzSZwC5JaTlAsPghrnKvpvePlk/Fy2gOLTliQD38xmnFgFQBUA0F7OXIz
         V7ctYx3eqGuxzIoxOAhdMu02a085eo81o4Pe2uVnZV9uR9qAu7C4qBbC86PODPe6TBiD
         af2Xn47wqFY/CXriNXR62CIhD7QNccnOMsukU80TqrExaVKknFicC0fjoAeT11becZVM
         aNabiHvuwbRIzg9R2LV45LcVWcydTvAaC7oGX5eOg1rcf80lnCJxge8850UyAH+oUgc1
         RatQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781717946; x=1782322746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=680+Yl6okt3675HUysJcgfxeYSokKelrviBWT8/HYkg=;
        b=Umog2iZPaI9MTSHduUvGZxhJtCN2bCwwpuaRezlbFpYJJweWaIGJlecR4KuecrSQOO
         jpCPZiWCxM+hL8Q03GqvV386E2lpC6aqMujpwkU1gownvdj20v1+2bUPPs6GSCLomru2
         hTzI6tBXnek/YwVwV9uJMLRUKqddaGUbbKQihu+WTgY7ZkYYrA91XHuswSSQwNm0UqqS
         NtWqmK8zj28XNNsBW2wyRk6NFtGnhWtn0AFytsw/YrMTluQce9UxwXsUYckoqmsLYNmb
         0/Cpx4BgynTuRdy1+fQd4so4GNwSY8TkNXS2phvXDWjiMc6W5GzHJaBPvY3tal8O0Eui
         /I/A==
X-Forwarded-Encrypted: i=1; AFNElJ/HdX2u5LT++NbzB6Qhpulk2aTg6o7Y44WNwJVM2KRcTV4Rr2e2eXCdl4jxxPYC1u8p8yH1e2z444ln@vger.kernel.org
X-Gm-Message-State: AOJu0YzJPQcORTjQlYWoIUYE1huiqUh3lPudv5F4dg2O2i8epoHe1sDv
	ntYo/QGaJ2lXQKznl4DgZirglDTddVUiPze0TPPjxyg8qRp7vcYQC7Z7gKqaobeCJlLd3Lb1Var
	JgvyTuPLDESkzfZf+ER6p1bHWJ9n6cuLcAJhC0Owru2KLwVwki5ai5ifuks/KdL4OTFCSU32Y
X-Gm-Gg: AfdE7cmTgvQQNMZis0km2SfFAsXaeBTjxTVoDaEjkkVQ2+/5r2zahfbohEFJiqUPguP
	ccDw8x6Rta+XdIaH0GH6AvKW4EXwb2OgdI+uY2U2oDRYXdweHyCYIMXpIoyQ48vaoY64VMWmD2Q
	hOx2vFULhnqFGQ1tosMDtCpelykzMlI9WoAHQtdQ7kxAnJaDF83iBJiCbueiK7sWxF3n6rqci34
	laHmrDNDwu13bfVZZHS33hIbEPwQnwRdk3FFQXPeGrPIzWQg7R1GDbdiIleWtb5CEcCzMk6VmeM
	6pLV7WU9ySXn3SyFprJIlodPbBg2JsW1lFSM/PESqvl+fzt7yesRHCiKvlHoWSopGktTnLA7MLq
	mFyidIKerFI5TAUOl74KZf7jkelJc92E4K2/OhR/hclQd0LLCoyJBjjTkyFUTXFWQXMoEhOjhvz
	DlCVq7de8cxqmuIPCyPDtZOtjrzyKt8H3TYhUdxa/neTwGuw==
X-Received: by 2002:a17:903:249:b0:2b2:4d36:7ba with SMTP id d9443c01a7336-2c6bbc93959mr49101265ad.0.1781717946493;
        Wed, 17 Jun 2026 10:39:06 -0700 (PDT)
X-Received: by 2002:a17:903:249:b0:2b2:4d36:7ba with SMTP id d9443c01a7336-2c6bbc93959mr49100995ad.0.1781717946018;
        Wed, 17 Jun 2026 10:39:06 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433369c8asm173973215ad.73.2026.06.17.10.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 10:39:05 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 23:08:45 +0530
Subject: [PATCH v4 3/3] regulator: qcom-refgen: add support for the IPQ9650
 SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-ipq9650_refgen-v4-3-c505ea6c6661@oss.qualcomm.com>
References: <20260617-ipq9650_refgen-v4-0-c505ea6c6661@oss.qualcomm.com>
In-Reply-To: <20260617-ipq9650_refgen-v4-0-c505ea6c6661@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: oqUU78TVWIT39WLzF-OiLTUJfhvUNKd9
X-Authority-Analysis: v=2.4 cv=JufBas4C c=1 sm=1 tr=0 ts=6a32dbbb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=LWuR3IfAbWH38ddlVOMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: oqUU78TVWIT39WLzF-OiLTUJfhvUNKd9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE3MCBTYWx0ZWRfX/IMZt47mG5xI
 9U6qQrsn6oI3R2vi0d0XoQlkKXu06FWVA5ZKCawHfZErxcwxAozz/3YZfRUsaBEGkBwRS6P9Q3N
 lrSMasMiAEHsapKR5wfGcoiSGrMLfc6rpnmNKsZqPraF1LUtDd8Op0w0MYclYE3aC/09jt4yPUS
 gqyPw1DZsT7uIdd1r5//0sEpC6pwF7TKr97+22c3g27MRyjkK80yb6/aYBFtqAsQXu4Mqxrozlk
 6Yr/HwT1Vn8sp97elIHJgScy0DvNMYoWCVAROfwR7tCnEZBNhB4BinBPrzugnvYWew+gtLRwFCF
 hRItP9q59Ul1GdjT1lWJkUMCK2/G7B0zSE7hDbr8JI+1qV3IAYtTzDXVx/vWtfrwAkPEyjzfNC+
 wM8nNX+IPER996QtGyT3SB41WU3unpxjvz/OzONaFbhhhTuIbEKz2NczLZbUl4aVt+EnvJ8J0Wb
 kWIEfb3jw5KHJlpLLZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE3MCBTYWx0ZWRfXyKivdhTfiAdd
 C5pQZBeBuVLzZF8gUrePthxnZHvmf3cmyH9p3to/XvV9DrVfV39U34gAlWuDf3ama9up+Lc+p53
 B9U6q/DvLZr+0bY/KE+yEdNlt8XBbQY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170170

IPQ9650 SoC has 2 REFGEN blocks providing the reference current to the
PCIe and USB, UNIPHY PHYs. For the other SoCs, clock for this block is
enabled on power up but that's not the case for IPQ9650 and we have to
enable those clocks explicitly to bring up the PHYs properly.

Also, add the get_status() callback to report the regulator status to
the userspace.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/regulator/qcom-refgen-regulator.c | 109 ++++++++++++++++++++++++++++--
 1 file changed, 105 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/qcom-refgen-regulator.c b/drivers/regulator/qcom-refgen-regulator.c
index 6a3795469927..cc72e5a43ba6 100644
--- a/drivers/regulator/qcom-refgen-regulator.c
+++ b/drivers/regulator/qcom-refgen-regulator.c
@@ -3,6 +3,7 @@
 // Copyright (c) 2023, Linaro Limited
 
 #include <linux/bitfield.h>
+#include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -16,6 +17,9 @@
  #define REFGEN_BIAS_EN_ENABLE		0x7
  #define REFGEN_BIAS_EN_DISABLE		0x6
 
+#define REFGEN_REG_REFGEN_STATUS	0xc
+#define REFGEN_STATUS_OUT_MASK		BIT(3)
+
 #define REFGEN_REG_BG_CTRL		0x14
 #define REFGEN_BG_CTRL_MASK		GENMASK(2, 1)
  #define REFGEN_BG_CTRL_ENABLE		0x3
@@ -25,6 +29,17 @@
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
+	bool is_enabled;
+};
+
 static int qcom_sdm845_refgen_enable(struct regulator_dev *rdev)
 {
 	regmap_update_bits(rdev->regmap, REFGEN_REG_BG_CTRL, REFGEN_BG_CTRL_MASK,
@@ -62,6 +77,62 @@ static int qcom_sdm845_refgen_is_enabled(struct regulator_dev *rdev)
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
+	drvdata->is_enabled = true;
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
+	drvdata->is_enabled = false;
+
+	return 0;
+}
+
+static int qcom_ipq9650_refgen_is_enabled(struct regulator_dev *rdev)
+{
+	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
+
+	return drvdata->is_enabled;
+}
+
+static int qcom_ipq9650_refgen_get_status(struct regulator_dev *rdev)
+{
+	u32 val;
+
+	regmap_read(rdev->regmap, REFGEN_REG_REFGEN_STATUS, &val);
+	if (FIELD_GET(REFGEN_STATUS_OUT_MASK, val))
+		return REGULATOR_STATUS_ON;
+
+	return REGULATOR_STATUS_OFF;
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
+		.get_status	= qcom_ipq9650_refgen_get_status,
+	},
+};
+
 static const struct regulator_desc sdm845_refgen_desc = {
 	.enable_time = 5,
 	.name = "refgen",
@@ -90,6 +161,19 @@ static const struct regulator_desc sm8250_refgen_desc = {
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
@@ -98,6 +182,8 @@ static const struct regmap_config qcom_refgen_regmap_config = {
 
 static int qcom_refgen_probe(struct platform_device *pdev)
 {
+	const struct qcom_refgen_regulator_data *data;
+	struct qcom_refgen_drvdata *drvdata = NULL;
 	struct regulator_init_data *init_data;
 	struct regulator_config config = {};
 	const struct regulator_desc *rdesc;
@@ -106,10 +192,23 @@ static int qcom_refgen_probe(struct platform_device *pdev)
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
@@ -126,6 +225,7 @@ static int qcom_refgen_probe(struct platform_device *pdev)
 	config.init_data = init_data;
 	config.of_node = dev->of_node;
 	config.regmap = regmap;
+	config.driver_data = drvdata;
 
 	rdev = devm_regulator_register(dev, rdesc, &config);
 	if (IS_ERR(rdev))
@@ -135,8 +235,9 @@ static int qcom_refgen_probe(struct platform_device *pdev)
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

