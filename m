Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29023D667F
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 12:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341106; cv=none; b=TfA6RyhMcMWE551hET9khyv+24vCdH+A5kPOAO4/rTYH6CcSbkHas5HeLfYKPpJrxoBawFCeeUEcs9qGprVATGIjr03OpbADw40u71xOFbcqUGIOeF+hNtcrUwjtu8IWX+Uvp5/T+3yl+ez+nijiP7Rn0/fyHH7DYyaY21OZLeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341106; c=relaxed/simple;
	bh=/GzaFAOemySs/nlLPtlFiaFz3jJ0quf8oFuTtWmRDak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iQT/2UAuMjVFWgU1k7fzH7wMxxoa6AiSvqHYSZMWWXwO5yUmGZHBTuK0HlFNq93cLYUsW4VzYy8jdsmw97ZqAz7qMEcy6VI+EHpLSW4vxE3BMF05SybZsuUMWBfjHQXUaWjsmMQqEf6E1CrAEmX0IRRAwQRjuQnSpRL4RChk1qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a46SNaYG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fL0IogjP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a46SNaYG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fL0IogjP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxFnB401628
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 12:31:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FPtJLqoAlsxEODuiTU8suBNjHSX7SMerMst72naEVeA=; b=a46SNaYGU4uehRa6
	yLA3lIQWlyQukrq7E1GLJ1VRhwyfbjo2mFQD4yfqytW6x5RYLu7G6J0O8KwjHYIi
	epILVVmGYpWsY4D8CmcTNzzl7Ezm1KinwkdOaLJb+u94w80swP7D2f5yazHsxQkz
	IF4Ce2pBc79sD+bLUTa0+9plF+T/VW1EAl/9xhftOmGD54NZ9IgKa/zLu03HKsgo
	tnKhp3tMMPYZ/1G8bcjWEAeDJ2UBgbuo9ew9WMlL+m1aRW86ZaSP3LJVdcKPk8x9
	Lc0leNPcYt3EPs/JDhLX7FuAlillmLqEsLHzrt5xjhCCy/gcM3WwUXRJyPPNwwc4
	3Cskrw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3grjhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 12:31:42 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-737f663b020so1049315137.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 05:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341101; x=1783945901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FPtJLqoAlsxEODuiTU8suBNjHSX7SMerMst72naEVeA=;
        b=fL0IogjPM614sFo5I/05TPlINUlAUXkjNrfgT75zebGnOtypBB3AoNEyCdL5dSb/k7
         NZ2Hcb8OJ5lNK2lBT9Nm1c41SzgqVVFbqVL8dWy27G4gK3fy3LUCTWxcZxmo0ogvSN+V
         7+oocxqgmq6jci2G/bIvTvQuSX6FEWYjdwzqwwXMeDh9kFk+FlKhInmfHI4etGPV06UX
         lkgawU6l2A5RDrECgWe1SPpGxt7MHVKGD9w/z1zXljcomCaNJ9oX4gMOJYL3QJsCrcYt
         8XIRyRAAAtD07SmuxriYmw80LsyH4vtMtcU+aXwc1IiuGNa6QM4N6xUzXHUX6oGFB2/W
         VOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341101; x=1783945901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FPtJLqoAlsxEODuiTU8suBNjHSX7SMerMst72naEVeA=;
        b=Lee2xxPsBrwvzAyHTAeUMbvpWAaCSEqRV9A8m0OOKZjsVAylKgmvDpCauN340oF9Kn
         H5Ucuy5YC+0dzc+J1+owFv45t6xzZqJf+u2EneI93RyJO5E7C67ToTUQScAk5XaM1/5+
         +gU/3AlqatanAJWik+PdhpDP/o/ZQBTs3I6+YxONs9GoVv2wkogxbNkyH817m8xnEd4D
         f0kfza0BP6fr2UedzOa4dYVo+k5zIXPwRqRxOTuE5FUJI1A443jA1OdctpGdDJYQah6w
         d3yhjhNiSI4ZBmlR9QJZ2xSH8uRjLzvuqpJtje3GTdkUw7JixrRW5m//Q8S13L2QiGJy
         uB/w==
X-Forwarded-Encrypted: i=1; AHgh+RoEEQ0jReMROHWG2IdErhWIocIovxxsz38eQzTIhxkHp/dYVpzfNEyXno72tttU5j0TwGe5Q/PO3vxZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp2MIk2igkbvyrn+kIC50Zx0mvN9W524tK/USud5baxvkf0SzB
	G5Ul669knBVGngmRzu9xEDTPBV7uRogY8wLSzDYAvi2Sfw4D5Bk9SJs5loVkbOfujI02pJEF7gR
	4nSdlCh8d0H45p3rTLYqnYT507+7wI2z6SC/sFj2SvUlfSTgWpRDw824PwkeeyQc=
X-Gm-Gg: AfdE7cmKK4ky80QWWDd2Mi8u2P9EAoqixazNgcUFsvWnNXcqB9iOLY1QSzDkPxmS9av
	ax+eIZomOQSmrSpB57Kley+B0rnBaP2gT+KM3v94UlDOnKB2jQaOtmCFGqEoYbIykbq8SFrDMWq
	ASyIpclVGqj6L52mElzkostMFkB1DSjzgMXVSmeZrQEn6QRkZ/58OM/CvMwt1B6VKGOO4IJru6a
	7lcdw4By3mnuRN1rhhu0q9goZWhlH13HH0ru7NiICt08cZv7wGGucrLAfKyTHh6jK/OeS0nvgob
	Mi12qxvwxCKI2ZD5QoM8qHyY7OoyczkPRsn7D+LClkrWEJAh0+LhaQ/qQVRULJaDWIu7CmzCUIh
	K67fbMMmViDT/XqFizfBCuRUjZ8DG2g3gmWfAwTA0
X-Received: by 2002:a05:6102:c08:b0:73a:2195:4386 with SMTP id ada2fe7eead31-744b7e4e3a8mr107857137.24.1783341101308;
        Mon, 06 Jul 2026 05:31:41 -0700 (PDT)
X-Received: by 2002:a05:6102:c08:b0:73a:2195:4386 with SMTP id ada2fe7eead31-744b7e4e3a8mr107806137.24.1783341100861;
        Mon, 06 Jul 2026 05:31:40 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-969838e1980sm5252990241.7.2026.07.06.05.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:31:40 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 18:01:06 +0530
Subject: [PATCH v3 2/4] regulator: qcom_usb_vbus: add register abstraction
 and PM8150B support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-add_pm4125-vbus-reg-v3-2-999d78a87b81@oss.qualcomm.com>
References: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
In-Reply-To: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783341082; l=4897;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=/GzaFAOemySs/nlLPtlFiaFz3jJ0quf8oFuTtWmRDak=;
 b=C2vCoEe5tidcdA+fabiAER2zmvmjcEDfMkbAEd1nGmJv8vRcF0zurc2NP5QsbCIPlT+ChJe4K
 HcsBQII1k5RDTKIFokDQcvpDmt8EURZlCTyN+2oNMkRvxYb8utCcLiV
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-GUID: wV6C0oQkhpg4LB2Baanty8qw5-LpLNSF
X-Proofpoint-ORIG-GUID: wV6C0oQkhpg4LB2Baanty8qw5-LpLNSF
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4ba02e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=aEv-xYknOxzy9_AnOEwA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyNyBTYWx0ZWRfX0p40B5bKdlaD
 jznSFvlOMxc9PNphnaS58H3xjc5RYTBIJ4kz8rLqfs5PUx3RE6gjCWO3teRhXOdroibocv8VHae
 z570l0eD55ikdZBqWtxK5sP+3xd4ubfN3W/UiyERtZkNiZxxPsN4H3we71WqZNhbUOmK9VVvJma
 UKb1oa9OHh/uUVSs0yvwepeltFROZp/BkVeYo0KUHtWCfcCL2L6ocqi6ZfcSoGMMg+Hy316QVII
 OqbDnYdSmRI6SLV3mtpE2z7DatM31q2bhjFiX73GSpQwpnC4X/h2qtRHo1OqZatVf8D3zYFfhJ0
 cfyoLsry2hHIKD8IFpKzYWLuaVH19YWhIXzvtv/RuiVIaMrQbqZuInXdR0sQSoGIfiimedzOjjj
 AAsJ1eA/KXJ1ag/BL0zZcKOGDwHZkBE2LCxGZAP/eY8rRnwBwSmYdLMqTbQG7VFZ/A9fITm6Kss
 j8BLmXpzKYVoBVjA/kA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyNyBTYWx0ZWRfX6JxLl7/X192V
 BzRyNoKCs4W4S/3HqJh37sz7fiZAmlfaR6iSO3L+dCXO5JRIB4UriqrPkVYHXcQeYELVj5D2pAd
 oToi/HcOoeO99HQIvZljvSAvTDwJXKY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060127

Introduce per-compatible regulator descriptor data via struct
qcom_usb_vbus_reg_data to abstract register layout differences between
PMICs. This allows the probe function to dynamically populate the
regulator_desc fields rather than relying on compile-time constants.

Refactor the existing PM8150B support to use this abstraction, wiring in
its CMD_OTG, OTG_CFG, and current-limit registers through pm8150b_data.
No functional change is intended for PM8150B.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 drivers/regulator/qcom_usb_vbus-regulator.c | 71 +++++++++++++++++++++++------
 1 file changed, 57 insertions(+), 14 deletions(-)

diff --git a/drivers/regulator/qcom_usb_vbus-regulator.c b/drivers/regulator/qcom_usb_vbus-regulator.c
index cd94ed67621fee9f6d7a0327054db0ebab6cc7ee..0201a3983981eec1f475d4b8cdccc9148b5e3b2e 100644
--- a/drivers/regulator/qcom_usb_vbus-regulator.c
+++ b/drivers/regulator/qcom_usb_vbus-regulator.c
@@ -20,6 +20,21 @@
 #define OTG_CFG				0x53
 #define OTG_EN_SRC_CFG			BIT(1)
 
+struct qcom_usb_vbus_reg_data {
+	u16 cmd_otg;
+	u16 otg_cfg;
+	u8  otg_en_src_cfg;
+	u16 csel_reg;
+	u8 csel_mask;
+	const unsigned int *curr_table;
+	unsigned int n_current_limits;
+	u16 vsel_reg;
+	u8 vsel_mask;
+	const unsigned int *volt_table;
+	unsigned int n_voltages;
+	const struct regulator_ops *ops;
+};
+
 static const unsigned int curr_table[] = {
 	500000, 1000000, 1500000, 2000000, 2500000, 3000000,
 };
@@ -32,19 +47,23 @@ static const struct regulator_ops qcom_usb_vbus_reg_ops = {
 	.set_current_limit = regulator_set_current_limit_regmap,
 };
 
-static struct regulator_desc qcom_usb_vbus_rdesc = {
-	.name = "usb_vbus",
-	.ops = &qcom_usb_vbus_reg_ops,
-	.owner = THIS_MODULE,
-	.type = REGULATOR_VOLTAGE,
+static const struct qcom_usb_vbus_reg_data pm8150b_data = {
+	.cmd_otg = CMD_OTG,
+	.otg_cfg = OTG_CFG,
+	.otg_en_src_cfg = OTG_EN_SRC_CFG,
+	.csel_reg = OTG_CURRENT_LIMIT_CFG,
+	.csel_mask = OTG_CURRENT_LIMIT_MASK,
 	.curr_table = curr_table,
 	.n_current_limits = ARRAY_SIZE(curr_table),
+	.ops = &qcom_usb_vbus_reg_ops,
 };
 
 static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	const struct qcom_usb_vbus_reg_data *data;
 	struct regulator_dev *rdev;
+	struct regulator_desc *rdesc;
 	struct regmap *regmap;
 	struct regulator_config config = { };
 	struct regulator_init_data *init_data;
@@ -57,27 +76,51 @@ static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	data = of_device_get_match_data(dev);
+	if (!data)
+		return -EINVAL;
+
 	regmap = dev_get_regmap(dev->parent, NULL);
 	if (!regmap) {
 		dev_err(dev, "Failed to get regmap\n");
 		return -ENOENT;
 	}
 
-	init_data = of_get_regulator_init_data(dev, dev->of_node,
-					       &qcom_usb_vbus_rdesc);
+	rdesc = devm_kzalloc(dev, sizeof(*rdesc), GFP_KERNEL);
+	if (!rdesc)
+		return -ENOMEM;
+
+	rdesc->name = "usb_vbus";
+	rdesc->ops = data->ops;
+	rdesc->owner = THIS_MODULE;
+	rdesc->type = REGULATOR_VOLTAGE;
+	rdesc->enable_reg = base + data->cmd_otg;
+	rdesc->enable_mask = OTG_EN;
+
+	if (data->curr_table) {
+		rdesc->curr_table = data->curr_table;
+		rdesc->n_current_limits = data->n_current_limits;
+		rdesc->csel_reg = base + data->csel_reg;
+		rdesc->csel_mask = data->csel_mask;
+	}
+
+	if (data->volt_table) {
+		rdesc->volt_table = data->volt_table;
+		rdesc->n_voltages = data->n_voltages;
+		rdesc->vsel_reg = base + data->vsel_reg;
+		rdesc->vsel_mask = data->vsel_mask;
+	}
+
+	init_data = of_get_regulator_init_data(dev, dev->of_node, rdesc);
 	if (!init_data)
 		return -ENOMEM;
 
-	qcom_usb_vbus_rdesc.enable_reg = base + CMD_OTG;
-	qcom_usb_vbus_rdesc.enable_mask = OTG_EN;
-	qcom_usb_vbus_rdesc.csel_reg = base + OTG_CURRENT_LIMIT_CFG;
-	qcom_usb_vbus_rdesc.csel_mask = OTG_CURRENT_LIMIT_MASK;
 	config.dev = dev;
 	config.init_data = init_data;
 	config.of_node = dev->of_node;
 	config.regmap = regmap;
 
-	rdev = devm_regulator_register(dev, &qcom_usb_vbus_rdesc, &config);
+	rdev = devm_regulator_register(dev, rdesc, &config);
 	if (IS_ERR(rdev)) {
 		ret = PTR_ERR(rdev);
 		dev_err(dev, "not able to register vbus reg %d\n", ret);
@@ -85,13 +128,13 @@ static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
 	}
 
 	/* Disable HW logic for VBUS enable */
-	regmap_update_bits(regmap, base + OTG_CFG, OTG_EN_SRC_CFG, 0);
+	regmap_update_bits(regmap, base + data->otg_cfg, data->otg_en_src_cfg, 0);
 
 	return 0;
 }
 
 static const struct of_device_id qcom_usb_vbus_regulator_match[] = {
-	{ .compatible = "qcom,pm8150b-vbus-reg" },
+	{ .compatible = "qcom,pm8150b-vbus-reg", .data = &pm8150b_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_usb_vbus_regulator_match);

-- 
2.34.1

