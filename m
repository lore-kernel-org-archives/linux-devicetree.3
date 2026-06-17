Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E35633F5BC
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 04:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781671873; cv=none; b=iijBD8s3y2GWAW9knLMhOiGpKSqXg2HoHMuRVulO9eoYUu5yjtYGfF9ZpOIXa9KshO5LHTo/JriRY4DFNc2rVTYWKZ2QyzIv1KodZRFnna0bsKTALOE6y3PMxyU4PfyiaoZBAqbXGQGsIu2+n0D+1XQ/IfjCq9EuJkJym2ep16I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781671873; c=relaxed/simple;
	bh=6C0TD1QvcxCa7jF7QmizTETEV86OPeo6DKxWRAkr1Is=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q/56U21UEmn8oZnR7NGSiBXPD7cwQZ151lh/5vvRiS5naasUqSmTaRfX1AJkEvJWbIhhAwC2zoaQh+m0wi9nULV0yTBMg1VheqyW5xvfYnYv2Svze8NGHXsPzabyXbP0RmTQ3SgxTh9l+yckdbdDxNC65TjJiAVvQ5k96epu4BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Se0tG82A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RYXlOq0J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Se0tG82A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RYXlOq0J"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H4kuCH1768453
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 04:51:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B6v40pFQBH4BYjWCcXMn9db1MwtRUQXVc2am0DOsj+Q=; b=Se0tG82AUi08JHBv
	2YGLeytgzRMuLNdyEAfzSQ4+T9J3Fk2r257sU+mA49ue24ao0Xo10HYG2LIOaLKJ
	JKQFEPxicZeZieU7JgnOLlaHKId5YgTOn6HuVIMLK/4vujDXIHyomv3wK8HgGKfJ
	HaxZlzMuC0Ci2mKbSsLo8ciDpShzTVURSjHqyyCWFkn+BQMFnqUvRKI4C5tCX5br
	zU4EDuyfu3SjGoR0DF4pXPBt3B3VdfC6uQguz96BuMFnGGnx2CgsWKktk+ON1Zj6
	oHp4Yynb+qOPttn+3uraOcitW16qdnp72SJXAmPjPRvt/w+6ob+PHIHppco3t+XR
	Wh/p0w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euef29e80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 04:51:04 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8428384f31fso4085736b3a.3
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 21:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781671864; x=1782276664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B6v40pFQBH4BYjWCcXMn9db1MwtRUQXVc2am0DOsj+Q=;
        b=RYXlOq0JIHWBbsWYONsAlwxEKWv9hEjUdBzb948Qk/IlfcxRxXSoIVA8w7Zkct4J3f
         4pMp3DaV2XJEyhBsCRgpgIJC5olC615WY62P1TH//b7iimUoT8lztHvQrLslyEDLcEQA
         D128O2M3PTf9o2AulKqKH7x+TCyhaXrFiWnwHKFQueJtapAfEKYjlzVSqKW5tqVoPKBt
         rt8frjrtQMiQAB9ecMHmDL51vfenpYd1ezNsH06SV+fv75VdLrqpE9ahkqlBnLiiZil+
         u4tubzyS/ReoQcRc0MY34h0NQ2dQvCYbP60JbyYsPY8carX8ZDlNUfrNZ900/MWU9xT0
         8wxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781671864; x=1782276664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B6v40pFQBH4BYjWCcXMn9db1MwtRUQXVc2am0DOsj+Q=;
        b=Notmgj/a0ifEDbLeNOKGwT1MUmQXlKJwbCI6KUO9Lm06yeZi2gu47hXZ+SJP4N9qGT
         u3s4D75n9hs4393ns1c83tbKUvuU8kTKqqGyBw4c8gLHt8Kevr4UNht22VgNhM03pjMm
         ptAn2aw9D5Ms/C+x5hNhmCsUITjcev5mDPsWXko/kD0cKtE17l6BgqCXqnnUekaQfr3R
         qf55g6ne+jqj+AqaPD/dlqyQVUl2f3TTR+YAkhVfMs9wbT32jB9WriYGF1JmICFMtyKy
         JM1p4UIlonybgSW05XVBgFXeHYnKblfHrKujIKj9OF+DkxsL1OQ+WbYdEYxnIaauVK0S
         Eggg==
X-Forwarded-Encrypted: i=1; AFNElJ9I2qcGH9o7x6asLjFwv7LrnF+vUidpUNIznoW/MuQ4VCqNXEb7o8rnAAVutjd+j4wGuJBHAYbNbIxU@vger.kernel.org
X-Gm-Message-State: AOJu0YxDi9hjGIqW+T5HLiv9gJ1Rf9jVF7mfc4LK2BGND5JTY229vGoC
	ukqufEGiYEfQGMcC+FyeVOGveh4IMlTLgKrbrF0PtHnX+mgr7z72s/ei8OPeqgEJttR8lyIbN8P
	iv47NiPrsZU3lmeqKNinO9XUw51dr0sE1S5njiJCgh8+gUP2FkFbTXLwCs9wwyE9N
X-Gm-Gg: Acq92OG1n464t0QzZMgt9xrZzFUjiDhzXOXSrQ7xcWfY46oXtjtQLzY6GxczXvB3igl
	xUzkax0wXh2G4O+hAtT8q2Cl0R2SBQ4bX0fghtqzaWfxYW7EzUblqZPPpH5zQNRiNIYuHVdq/4t
	8X0G1fd18Pu6DlcMDNfYL1melYt1ILRWIhdLlYdLhnJKWxTCUBzR+R1pilQKzcNSkcNg2nXdK/0
	Z++Jl8AAztkIlND/LmClNLrn0UX1JKuhWwhshb7/XfFepSDZeepAKw3n/YThIu+o23VyTytOSC8
	1F5ITkqiTNB7wQlr1ML9JCXesvsQT65k2i+pERJLwp9O8NNMHRP1sSi6KiMOG08mXH6vMsiEICw
	/JvpSwndN+ramORg9pNJh6tpqXihJxXWiL0stnusWZ4Jb
X-Received: by 2002:a05:6a00:9285:b0:82f:390a:69df with SMTP id d2e1a72fcca58-84524595987mr2100538b3a.35.1781671863820;
        Tue, 16 Jun 2026 21:51:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:9285:b0:82f:390a:69df with SMTP id d2e1a72fcca58-84524595987mr2100492b3a.35.1781671863212;
        Tue, 16 Jun 2026 21:51:03 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9c016sm14721127b3a.8.2026.06.16.21.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 21:51:02 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 10:20:19 +0530
Subject: [PATCH v7 5/6] i2c: qcom-geni: Store of_device_id data in driver
 private struct
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-enable-i2c-on-sa8255p-v7-5-ad736dbeab57@oss.qualcomm.com>
References: <20260617-enable-i2c-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com>
In-Reply-To: <20260617-enable-i2c-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        prasad.sodagudi@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781671828; l=4444;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=6C0TD1QvcxCa7jF7QmizTETEV86OPeo6DKxWRAkr1Is=;
 b=aP8magEXnCd/pXP5dnCRJaN3Ja6oeSUNCz9z8SIiANalVyxBU4Z2S2zN3MoGVGv5XQxRcsW3z
 Agruywkfu8UDrbfJtpAkxefu1G9vsAWrSkY6te/rcrabuv6x3x8QJ2l
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=F8hnsKhN c=1 sm=1 tr=0 ts=6a3227b8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=L-JS82rCYefCJmJZhRoA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA0MSBTYWx0ZWRfXwdXyMu6KhmXr
 WbXYgeCuNWMJzv7jJAS0Sj2wIh7oTgbFqAyB1U7LY+CYy1i/2rdQpPfc8OW2uv0HOsnjyL1j8kX
 ehuGnkQhewO+9Jmvh6kflEW91hdNiYI=
X-Proofpoint-GUID: BzKg8EydvadCK8ecXvU0DsYeZHZ0ZX_7
X-Proofpoint-ORIG-GUID: BzKg8EydvadCK8ecXvU0DsYeZHZ0ZX_7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA0MSBTYWx0ZWRfX9DJSrCqcZf4/
 eqR9RFYYdQZuvkodmJOBQTemrrlMebd+EXWQoCu4mGu08WBqMefgRWutpX9ojRh0I/145UeZhYN
 NYH9CJjM+oIcSUzzCLX4JoJb601mG/2qlmoNFXueQ6CwMtyT/7EfsxBLvYBf0oHXGh1y7/6fvlR
 Awx2PTKLVq0zNPnzZpyow3luY9qVbwCGS1jqty4z1QkvlYPJ3ZiCHbxv1ZU67ZsaWwAiIPmpU6/
 iBZjj7RetVS7gIsUmuJMSXKNHRDoPTfWQ8+kbwjag1iCQUN1jr2SAULVubEDruA/NRAAk+wAMeH
 Hs3hIcwNScQTNQTArgKaLx0TK+zndZeG2oB74EehOqFyGf/pUu5KI9A3I62XXc3I9luUJEiDZX3
 bL0toWkT84qKLPmzbZaxXW13/RO4fy9yCScYcq0H/QCc3Kpz2CQHZHc1uzsy+07+KV/AG8P54Mo
 PEqdb6AzgiBlwWVc8yQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170041

To avoid repeatedly fetching and checking platform data across various
functions, store the struct of_device_id data directly in the i2c
private structure. This change enhances code maintainability and reduces
redundancy.

Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v6->v7
- Added Reviewed-by from konrad.

v5->v6
Konrad
- Updated in geni_i2c_acpi_match() as suggested
- Moved geni_i2c_acpi_match below to avoid errors of geni-i2c

v4->v5
Konrad
- Added a null check after platform data struct.

v3->v4
- Added Acked-by tag.

Konrad
- Removed icc_ddr from platfrom data struct
---
 drivers/i2c/busses/i2c-qcom-geni.c | 46 ++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 8f8b74c4e88a..92cccb1cce69 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -77,6 +77,11 @@ enum geni_i2c_err_code {
 #define XFER_TIMEOUT		HZ
 #define RST_TIMEOUT		HZ
 
+struct geni_i2c_desc {
+	bool no_dma_support;
+	unsigned int tx_fifo_depth;
+};
+
 #define QCOM_I2C_MIN_NUM_OF_MSGS_MULTI_DESC	2
 
 /**
@@ -120,11 +125,7 @@ struct geni_i2c_dev {
 	bool is_tx_multi_desc_xfer;
 	u32 num_msgs;
 	struct geni_i2c_gpi_multi_desc_xfer i2c_multi_desc_config;
-};
-
-struct geni_i2c_desc {
-	bool no_dma_support;
-	unsigned int tx_fifo_depth;
+	const struct geni_i2c_desc *dev_data;
 };
 
 struct geni_i2c_err_log {
@@ -941,15 +942,6 @@ static const struct i2c_algorithm geni_i2c_algo = {
 	.functionality = geni_i2c_func,
 };
 
-#ifdef CONFIG_ACPI
-static const struct acpi_device_id geni_i2c_acpi_match[] = {
-	{ "QCOM0220"},
-	{ "QCOM0411" },
-	{ }
-};
-MODULE_DEVICE_TABLE(acpi, geni_i2c_acpi_match);
-#endif
-
 static void release_gpi_dma(struct geni_i2c_dev *gi2c)
 {
 	if (gi2c->rx_c)
@@ -989,7 +981,6 @@ static int setup_gpi_dma(struct geni_i2c_dev *gi2c)
 
 static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 {
-	const struct geni_i2c_desc *desc = NULL;
 	u32 proto, tx_depth;
 	bool fifo_disable;
 	int ret;
@@ -1012,8 +1003,7 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 		goto err;
 	}
 
-	desc = device_get_match_data(gi2c->se.dev);
-	if (desc && desc->no_dma_support) {
+	if (gi2c->dev_data->no_dma_support) {
 		fifo_disable = false;
 		gi2c->no_dma = true;
 	} else {
@@ -1033,8 +1023,8 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
 
 		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
-		if (!tx_depth && desc)
-			tx_depth = desc->tx_fifo_depth;
+		if (!tx_depth && gi2c->se.core_clk)
+			tx_depth = gi2c->dev_data->tx_fifo_depth;
 
 		if (!tx_depth) {
 			ret = dev_err_probe(gi2c->se.dev, -EINVAL,
@@ -1077,7 +1067,6 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	struct geni_i2c_dev *gi2c;
 	int ret;
 	struct device *dev = &pdev->dev;
-	const struct geni_i2c_desc *desc = NULL;
 
 	gi2c = devm_kzalloc(dev, sizeof(*gi2c), GFP_KERNEL);
 	if (!gi2c)
@@ -1089,7 +1078,9 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(gi2c->se.base))
 		return PTR_ERR(gi2c->se.base);
 
-	desc = device_get_match_data(&pdev->dev);
+	gi2c->dev_data = device_get_match_data(&pdev->dev);
+	if (!gi2c->dev_data)
+		return -EINVAL;
 
 	ret = device_property_read_u32(dev, "clock-frequency",
 				       &gi2c->clk_freq_out);
@@ -1229,13 +1220,24 @@ static const struct dev_pm_ops geni_i2c_pm_ops = {
 									NULL)
 };
 
+static const struct geni_i2c_desc geni_i2c = {};
+
 static const struct geni_i2c_desc i2c_master_hub = {
 	.no_dma_support = true,
 	.tx_fifo_depth = 16,
 };
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id geni_i2c_acpi_match[] = {
+	{ "QCOM0220", (kernel_ulong_t)&geni_i2c},
+	{ "QCOM0411", (kernel_ulong_t)&geni_i2c},
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, geni_i2c_acpi_match);
+#endif
+
 static const struct of_device_id geni_i2c_dt_match[] = {
-	{ .compatible = "qcom,geni-i2c" },
+	{ .compatible = "qcom,geni-i2c", .data = &geni_i2c },
 	{ .compatible = "qcom,geni-i2c-master-hub", .data = &i2c_master_hub },
 	{}
 };

-- 
2.34.1

