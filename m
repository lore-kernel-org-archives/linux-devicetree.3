Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00283BADA9
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779268060; cv=none; b=LNXCUElgzdo4X1H2lhk79/aRd+sHdGs0lfw22KEvkWIePbNI9h86sy38E/NDjk0BUI/sagfe0rhk583miTbU7ZGvQ4DzONEDQLp0zsbYHDHK0ZZ3y2wJ0UAwWcJ4tkdpBZ7opRJCLJ3za8Gz3h027RS4PRveXCHEPMRmks3/ZK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779268060; c=relaxed/simple;
	bh=vo9QszaRVCVBLynmMk2Tlo0NH6xJ4ftEm46gUfYlE+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YmALTw1yXo/zWdEGKIjYgLWtlhEAw3buEe9ysEmbztf9EQI2FwByM58kWQqst0Iga7X2w5ADceJBpRDw50Lvf3tYunJ6fAs7qf+SSydd/jDM3Y6mdLZd7CBcLPYLKmJRcLVc/MvDB5qtEbfExOZtr4k2smGRSKmM5dY29sKpJoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pyYLx734; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XjyiShJG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pyYLx734";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XjyiShJG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K8umD94115399
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PhUsGD2Ij6JrjuwQpUKSKSZDLzGC8nTynYmL00kksfY=; b=pyYLx734wvdTDEjn
	eapAre0PHFOkv0lyBh10TmY+vlamvFnytEFBhxHUZginb1a0U7sEaHDpMVu1c+FE
	F28+ojGyfRyIi6mMnpvANYltcNm8OSQhLn/yUUryEQyELv2EkDD/qFF4NEUSCQl/
	Gcn4Oh99ytDgD5ZT/D8Fmb/PMp3bxSe1ecMpY4FpA3QHoyYvEPk721ROtBAuWf8H
	iAEdiVh8M3jYR93HIlf112nvegmU+mYJtauGgsJZNre25b6DtGbWWD2uRfcBmgh+
	fIFa0HmqoJWnmGGbqfnP2h9yu7SJW/fuY9EGwZyaJo3pig4JY4TVzbJiZFpgO/UM
	oLIZmQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e99w0g1hp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:07:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36642d2f4deso10119239a91.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 02:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779268052; x=1779872852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PhUsGD2Ij6JrjuwQpUKSKSZDLzGC8nTynYmL00kksfY=;
        b=XjyiShJGIPIxRirJKuAN6fmP+Mk2sYSuvWItqGyZDUm5F/89Rg9TfNe1Jh4uv09EcG
         6chLmD6YjrGzQg9233vKPBra1zy/cQxSAlvCPT2v+gU/0hVmhCJlOK5TXxkjiThHWHNk
         mMp+i794ZF6kM86VMcusbeAPp+DTbIhimx7ZIarLyNZaJo24jSDIIkYWwbGAlacqYxy3
         JxUy9z+nxaNNh7lssMOARarY72Eocewqg0A1sBaCBQ4fBg05jMB2xpWHu96zW2Z3K8mW
         IDMeLx6P6HShr2SZRPpYEOexrx0E9BrLk54lOaNIi4OH3glhGuafkFxX7r2yEN9AUBkr
         +B3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268052; x=1779872852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PhUsGD2Ij6JrjuwQpUKSKSZDLzGC8nTynYmL00kksfY=;
        b=pT1wSW4/6YishwiWKQ5DCu2oJvEG+dEy/xK0TLKnmkRo4Sp0Paw3iVa4lYWdUrcqEw
         Q8NEskAvJOTqEhrVJRdmwzzFd6K1gz96z+1xZtX7e+gtDTU/4bqDm1qKfEMHIgb9QYk4
         inEyn4noUFcaek7eU7D4dOq6Y3K09cgFEJR2gRKacYxCmnfrAukgLhYwVknKjbIwCtk7
         YeT42GQ2uxRDcY81CAGIs0p3ys40VDStZpFiJTC3P0IWA+Yhy7LehaU0uStJ6DsH+hq8
         2yEK4bMxdtosvhRyMsttkjc+Q/f4slFeJGk7P4hte3l9TIViAkG/n0U44ZMrGxN8rYC7
         MFEw==
X-Forwarded-Encrypted: i=1; AFNElJ9noWLY4EeD3Q9KjyMUZ5iT4sP0sRDq4WrXghBaynb9vIfPJLEhuoIj4E+DlX9bB2FQjBNLRzC9pqDj@vger.kernel.org
X-Gm-Message-State: AOJu0YzORtFtD6t2qrSr/YWfVckDzRiHJF6nncDD0mJ4yx6eg/sVxtzj
	Eq32HK9mUaiOA6vuALCR/O7rpbvqUXGsnxrp+JAwiycTHC10YgZnYzZgGEoWVI11bzk40OAcUkP
	jjJ9Bipx7L0zTbsZ0KRvOggiracVffofJCT7b7zf+gXUQdy8Gb5gHYH652TcDnLY=
X-Gm-Gg: Acq92OHuDuPabsAhviz4xCNq7geZ8XLPaQqTGfsoL/wOzq79LavT9IjiLmmnzy+5WB5
	LtqOzLOAIePbYuSOVNiSLcv6yMyq/e+3yNLordWw84yQD0ge+6Z0CQM7dKE/zxSwh92qveF61pX
	AmctoTegu9zOj0ePq49aOlHvX+SoYG1f9h2KPU46OjZI/sVjV7uLiCQXiP55yR8xfsK45O6U+pf
	+fwZlZ71s8UI9pG7D5JOR8F7TBdkdq3NaEBr4TxnU8+gZJ+1DIE8Rv8S9Am+FA9BShRpnqDetwr
	XPasM3j0Q+M330dckZ7oZxJxavocDc2FyK4kFlzbSnQZ5sOrerczYl66JLhgDYjlNO8wxddvXd0
	p67j4TvLJF2IMhhM4Byols5LOVdN6yTz6E07fVGqNZnir6VymI3vrqVxhQsXNgQ==
X-Received: by 2002:a17:90b:4c:b0:366:19da:832f with SMTP id 98e67ed59e1d1-36951b75e31mr23314346a91.17.1779268052171;
        Wed, 20 May 2026 02:07:32 -0700 (PDT)
X-Received: by 2002:a17:90b:4c:b0:366:19da:832f with SMTP id 98e67ed59e1d1-36951b75e31mr23314303a91.17.1779268051647;
        Wed, 20 May 2026 02:07:31 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369517a8612sm17079903a91.12.2026.05.20.02.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:07:31 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Wed, 20 May 2026 14:37:12 +0530
Subject: [PATCH 2/2] regulator: qcom_usb_vbus: add support for
 qcom,pm4125-vbus-reg
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-add_pm4125-vbus-reg-v1-2-f6d15d7dbbe8@oss.qualcomm.com>
References: <20260520-add_pm4125-vbus-reg-v1-0-f6d15d7dbbe8@oss.qualcomm.com>
In-Reply-To: <20260520-add_pm4125-vbus-reg-v1-0-f6d15d7dbbe8@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779268039; l=6127;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=vo9QszaRVCVBLynmMk2Tlo0NH6xJ4ftEm46gUfYlE+w=;
 b=5oRumBCBbUQiupUigj6X/K4pwShmcJcZu8NFnst5iC/MrZgyo6e+UoBVpLJNTk9JHbmssG1UE
 gO6dez28JwtAaRgcK6iTYmLXbJbbei3eeXiMA8IkEfhMz+18eZ1eme7
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-ORIG-GUID: Tbr8dqM6SpN3EPohCx1bQFCq9gWO2YY5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA4NyBTYWx0ZWRfXwqXmELnVnLYd
 5ZVv/FHTDGkbfXg3ttz0H0ZABZNq8ZddYlcssmo5MGKuYr/KON7pQ2ge85jTiDCpo/1fT464hOV
 2ZkuT2Io3dlqmovY5qdAq7OWOFLsZYtSRS1hfD/IL5P8CKVJ4hqcGG04aXGP/pezgsZzRXMRhcl
 R09pXMwe1dKQEsg+JGaF4n4fiBFqlwBxCQB190iuvNZSgveOBP7EyTBJ3QX/y/SDCK3qIeKgQms
 FtD6KGTmwL9Ki3zm61RcpajHqW9Z+v9qMO1hPdltus3AGg9U4gmNlYxkrrMmcDL3aRpzqHIuN0h
 f1oLqaKlzJ0kW4VA8kjIcRkqVd4R+9ZPEBYMckxxlSdnrWYov0bnqdHEg3KVuSy4VQXphi8sc1X
 sk+GNOjWW1l4Mtrlxqxm75f6Ezwe4JYJ3l/F5CMu+fnNJYoteQqZrPtZ2fXPEUqq6+baTHL4rOC
 Uib+++EYeKVAvCH24ig==
X-Authority-Analysis: v=2.4 cv=RZigzVtv c=1 sm=1 tr=0 ts=6a0d79d5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=xNrmRdIuzdWpR3jzgYgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Tbr8dqM6SpN3EPohCx1bQFCq9gWO2YY5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200087

The PM4125 PMIC uses a different register layout for USB VBUS control
compared to PM8150B. On PM4125, CMD_OTG is at offset 0x50, OTG_CFG is
at 0x56, and offset 0x52 is a 2-bit VBOOST voltage selector rather than
a current-limit selector.

Introduce per-compatible regulator descriptor data to accommodate these
differences. This keeps the existing PM8150B current-limit logic intact
while adding a dedicated voltage-selector path for PM4125.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 drivers/regulator/qcom_usb_vbus-regulator.c | 102 ++++++++++++++++++++++++----
 1 file changed, 88 insertions(+), 14 deletions(-)

diff --git a/drivers/regulator/qcom_usb_vbus-regulator.c b/drivers/regulator/qcom_usb_vbus-regulator.c
index cd94ed67621fee9f6d7a0327054db0ebab6cc7ee..3d425452a0b35b35c4b454f84eb28e87cc8ba4f8 100644
--- a/drivers/regulator/qcom_usb_vbus-regulator.c
+++ b/drivers/regulator/qcom_usb_vbus-regulator.c
@@ -20,10 +20,35 @@
 #define OTG_CFG				0x53
 #define OTG_EN_SRC_CFG			BIT(1)
 
+#define PM4125_CMD_OTG			0x50
+#define PM4125_VBOOST_CFG		0x52
+#define PM4125_VBOOST_CFG_MASK		GENMASK(1, 0)
+#define PM4125_OTG_CFG			0x56
+#define PM4125_OTG_EN_SRC_CFG          BIT(0)
+
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
 
+static const unsigned int pm4125_vboost_table[] = {
+	4250000, 4500000, 4750000, 5000000,
+};
+
 static const struct regulator_ops qcom_usb_vbus_reg_ops = {
 	.enable = regulator_enable_regmap,
 	.disable = regulator_disable_regmap,
@@ -32,19 +57,43 @@ static const struct regulator_ops qcom_usb_vbus_reg_ops = {
 	.set_current_limit = regulator_set_current_limit_regmap,
 };
 
-static struct regulator_desc qcom_usb_vbus_rdesc = {
-	.name = "usb_vbus",
-	.ops = &qcom_usb_vbus_reg_ops,
-	.owner = THIS_MODULE,
-	.type = REGULATOR_VOLTAGE,
+static const struct regulator_ops qcom_usb_vbus_pm4125_reg_ops = {
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.list_voltage = regulator_list_voltage_table,
+};
+
+static const struct qcom_usb_vbus_reg_data pm8150b_data = {
+	.cmd_otg = CMD_OTG,
+	.otg_cfg = OTG_CFG,
+	.otg_en_src_cfg = OTG_EN_SRC_CFG,
+	.csel_reg = OTG_CURRENT_LIMIT_CFG,
+	.csel_mask = OTG_CURRENT_LIMIT_MASK,
 	.curr_table = curr_table,
 	.n_current_limits = ARRAY_SIZE(curr_table),
+	.ops = &qcom_usb_vbus_reg_ops,
+};
+
+static const struct qcom_usb_vbus_reg_data pm4125_data = {
+	.cmd_otg = PM4125_CMD_OTG,
+	.otg_cfg = PM4125_OTG_CFG,
+	.otg_en_src_cfg = PM4125_OTG_EN_SRC_CFG,
+	.vsel_reg = PM4125_VBOOST_CFG,
+	.vsel_mask = PM4125_VBOOST_CFG_MASK,
+	.volt_table = pm4125_vboost_table,
+	.n_voltages = ARRAY_SIZE(pm4125_vboost_table),
+	.ops = &qcom_usb_vbus_pm4125_reg_ops,
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
@@ -57,27 +106,51 @@ static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
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
@@ -85,13 +158,14 @@ static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
 	}
 
 	/* Disable HW logic for VBUS enable */
-	regmap_update_bits(regmap, base + OTG_CFG, OTG_EN_SRC_CFG, 0);
+	regmap_update_bits(regmap, base + data->otg_cfg, data->otg_en_src_cfg, 0);
 
 	return 0;
 }
 
 static const struct of_device_id qcom_usb_vbus_regulator_match[] = {
-	{ .compatible = "qcom,pm8150b-vbus-reg" },
+	{ .compatible = "qcom,pm8150b-vbus-reg", .data = &pm8150b_data },
+	{ .compatible = "qcom,pm4125-vbus-reg", .data = &pm4125_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_usb_vbus_regulator_match);

-- 
2.34.1

