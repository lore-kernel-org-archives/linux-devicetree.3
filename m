Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4E242CB1D
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 12:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341120; cv=none; b=Vo1gLHFzigGdQhiufMFEemYokd1HnTlUD1NZIEqhAm59cEL/7WDORxhNuQLMFcbz+HhSkbREx3bIwk8Eb177rv0h2aRMI383G2dktZvDwQ+J8JIBz/Q+Pa6jmSQ1Bp8BnpiJt4+S0aNxLH7Afijla12nze082RJXMXsQ5vyTXWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341120; c=relaxed/simple;
	bh=JMTe2+JJF8T0cSsmDIrsxMfHRBmIBv9GJfZ7BMilGkY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PgpTka7VO/k1yQoB2efUhEv1fti609s56rdSzPO50OLc4Fb4smBVxMqz5ICUZJh2V6Lo251roiuCeHc6LtNXqu3dA+sSQECuiKZPxeJCPQrXMCpfzP5EqYzCuhkeC956E8NhuLI7Y36ae0eqR51Z8gYk+XU9tsHztSTaFDaukfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GJdIMBSC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DF5joZGv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GJdIMBSC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DF5joZGv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666Ax7VV245529
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 12:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A2Ljr0lImczYQDYU16aZIIUIosMUQxB2bqsohrmCamE=; b=GJdIMBSCBpnuXNfa
	u8EwtgquyUAVc1yDQzsb9YbV5GEziYPl1oYr5jW/O9N0qmogys3/ydRCWgssTTqC
	7vi5kz2eBSBJFv4y6zW7XfLtAObdHX5ByL73oiEVar1q4g/jgjAFZH9qUzLCpnDO
	OO72gHf44+X/MmZX/4wtA8tTiTLiLY/JZnpBY0mAeYui0H6zMyCBJXIFr6xPofF5
	n1vGJWn1Suz0MjdWsw4ZlyRghr0ocFN+tFTZTDAxu9pnWhNEKEj8zee/nLUObV3w
	vTVL6onKFJWHrq/Rj4Kz7z4rLSFpp7mUv2vxmSfXWa8kybuj/0tTaTtqqhXXb4m4
	9J1r1Q==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98gh30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 12:31:55 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-963d24c3886so2915672241.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 05:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341114; x=1783945914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A2Ljr0lImczYQDYU16aZIIUIosMUQxB2bqsohrmCamE=;
        b=DF5joZGvPesinqhZS9tjYo+6a9CJT14tnu8CGlgNN7rck6nkIwu2KHUWhg3PtBUISS
         C2oLelvkGhb/5dWF+jDQXW/1zxok8uf4M1LSX0FfkIacL46VB6ooRyblvoy+AW28VgvN
         VHkecPU3Nfl3q0LpCn7Sq3Z0PnI6uekbkVpL4WYdR5iuq3fChkLJWd2pu7OJXHjaNEN5
         xkeuoOBwku9FYQi2YRuDM+alYtJgl8KivW/BTdkL8LmR2qxUGTY7ZJzcqkOr3cl1khu7
         naSUfJE5yi6nEsF74K4JWIhjbZhlNoDtAvX7hh4PjTTPGFB7IcqAJIrlv3EqVIC37t0D
         DbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341114; x=1783945914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A2Ljr0lImczYQDYU16aZIIUIosMUQxB2bqsohrmCamE=;
        b=W24VfRZ7WiEBoKWdMIAwr2DiYs38BvSGezrdZwBGCz4p1gKJ0AcS+eryZJeHYIR2MQ
         ooW7u3kZWhtJX/EQ6hLj7hk+7LFwsOdT23PKMS/zMyWoteq0JZSL2j5dWQab958ZefvV
         ZROg5HDLzQFjx8RX7SDN51nmQgoqM3m/4IhwwihCpZpZO3QCaDXpCtj7ojwe/ZY7NFOb
         7QninGfPYp59SOnw6qMlbKvosABU3Ly4pYEVQ1S/g2UYpuDPAzukY8k5QjUKg26Ls3ey
         GRv2Pf5+Gz+aS/X5dZXOuG/LwVQwCADiD5TCYNrMcj6MHxB1jucola2iGguf70Q1JCbi
         iOHQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq1WXSPQS8mNeEtuuLlSq1sI239L/hSVbF6mxy5odoIbCouCoQEFuQGZ4C/jN/yMJx2mCmsdh0w9LYP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+NwMOQ/ifMjp5B+QPLqqpjuYnJxyJ3PgLRyxOBoAUmeNMeZFQ
	tGnpLyyje3ULaj4NPLWnhAxifR+vDYvwPFJDSInXLJYN0ELLfWxjmRsX6uD+TfcNVW9osro22NA
	9mImfeYxuWgoKig1h9x+K5JyZamLEzVeBbjSECLybYJxo3HSH0SASJ37ctkGSeso=
X-Gm-Gg: AfdE7cmbWbXegWKCawAPVzto+Djxw35zDt0uSU3wYM0VLhKBAGBIN+X2+BotuyXrcS3
	GGTYFA+DD+y+xMLYr+9z9tKSfNsIr+AWIZXZjUqZDYuV9wcKf00xhoJeCHdYxwGhBTuTmvd6G+w
	7POf3NJ/pFOFydZEVkxPMd4dlPrnU5MKFkl+4ZqqVEL3LgowA/tFiRiQlrW3NO1RGCzhKMLN2Gc
	RXsq1EnMQ/tMEK8vWJ92u2dOYaD+hAkZndw+WeIxJoZrtHKLBuSUu2lqpb79vq3gHyFT+6juv7+
	2jb1uYP3a8nqLMQf7ewht5JUckutut/2gF9x5nszYszV27fI5g0rBiNgRLkott4rqz4IjEbSxcJ
	ftKmw7ixR2ELa8hBzRXv/v8Zy2AghH0wjIREdQMRx
X-Received: by 2002:a05:6102:3e24:b0:631:ff40:22b5 with SMTP id ada2fe7eead31-744b7f1652dmr115290137.21.1783341108502;
        Mon, 06 Jul 2026 05:31:48 -0700 (PDT)
X-Received: by 2002:a05:6102:3e24:b0:631:ff40:22b5 with SMTP id ada2fe7eead31-744b7f1652dmr115095137.21.1783341106713;
        Mon, 06 Jul 2026 05:31:46 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-969838e1980sm5252990241.7.2026.07.06.05.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:31:46 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 18:01:07 +0530
Subject: [PATCH v3 3/4] regulator: qcom_usb_vbus: add support for
 qcom,pm4125-vbus-reg
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-add_pm4125-vbus-reg-v3-3-999d78a87b81@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783341082; l=3024;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=JMTe2+JJF8T0cSsmDIrsxMfHRBmIBv9GJfZ7BMilGkY=;
 b=00zeMQwFnzcMF2i9OxkyJwfR/ZrwGLgAkioqaNyV9R9+xUiR/eHliAHSZEluZgUHQGnXN24ph
 GGY+nVahLBMC1yvykpVy1Cz64fNqasUwtnhmXy3ZWsLlD4W46xC3ojZ
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4ba03b cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=3mJ39vkoQXamFeApidoA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyNyBTYWx0ZWRfX1NKsArysfCgf
 FEbQ7UeZEBTUieq/vlv3yqqfQkB17jMNCbBFC6GPZXQguuKyzDTy49TwHEQPD4Lq9kYXSz9n9Q2
 rjMKZY6sP/r95MecqTSu5DJKlxOnvX021tT3qE0/9p4DI7TPPMq7FAiUG3ZRRUbrR37khwBR+av
 YPBu89yKiEc13d3GVJQSNMQOr8Fy07K82AuDplAUW3HUTzLxr5C9lewgd+LFg5xrwvrF8HQqlVC
 gSpt5cK0jOet3qeovviSWtF2ivNCxzHSGF1Tw4+CPoQJziwuy7lf8U15Tv+aNg3AAPx75lYP7Jv
 7OvdJshAA2StkUyaRN8HAbvVd9gegSZBb5q9A+aksf+IQNHw1W/SOGdMTq6NJRK9FF+yU3MEaC7
 irKdVdffNlOiDwxVl+/bXvPR01XjUbKp+wYjPOgJ1kUHqnsboFpaHfp5TIIvBbC6JJXBbedVFOr
 9od/p1h0ZBTuaALtrag==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyNyBTYWx0ZWRfX6kcbiRngcRuB
 SfwF4stOg2jyWBeA9Z6ECadJM3z2PRhlejKpLunGOV8ODIGlTGyE3pQQgSERKojozU2XSul8fEy
 gDr68+inmWGNUCzGfhCD6KC0KagdoUU=
X-Proofpoint-GUID: 4N0esXU9-larUvtN-9F9RW5dZiQB420W
X-Proofpoint-ORIG-GUID: 4N0esXU9-larUvtN-9F9RW5dZiQB420W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060127

The PM4125 PMIC uses a different register layout for USB VBUS control
compared to PM8150B. On PM4125, CMD_OTG is at offset 0x50, OTG_CFG is
at 0x56, and offset 0x52 is a 2-bit VBOOST voltage selector rather than
a current-limit selector.

Add pm4125_data using the abstraction introduced for PM8150B, along with
dedicated voltage-selector ops and the pm4125_vboost_table covering the
four supported boost voltages: 4.25 V, 4.5 V, 4.75 V, and 5.0 V.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 drivers/regulator/qcom_usb_vbus-regulator.c | 31 +++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/regulator/qcom_usb_vbus-regulator.c b/drivers/regulator/qcom_usb_vbus-regulator.c
index 0201a3983981eec1f475d4b8cdccc9148b5e3b2e..9aea68876284e55427d03f667c9428af0ebb53d2 100644
--- a/drivers/regulator/qcom_usb_vbus-regulator.c
+++ b/drivers/regulator/qcom_usb_vbus-regulator.c
@@ -20,6 +20,12 @@
 #define OTG_CFG				0x53
 #define OTG_EN_SRC_CFG			BIT(1)
 
+#define PM4125_VBOOST_EN		0x50
+#define PM4125_VBOOST_SEL		0x52
+#define PM4125_VBOOST_CFG_MASK		GENMASK(1, 0)
+#define PM4125_VBOOST_CFG		0x56
+#define PM4125_VBOOST_EN_SRC_CFG	BIT(0)
+
 struct qcom_usb_vbus_reg_data {
 	u16 cmd_otg;
 	u16 otg_cfg;
@@ -39,6 +45,10 @@ static const unsigned int curr_table[] = {
 	500000, 1000000, 1500000, 2000000, 2500000, 3000000,
 };
 
+static const unsigned int pm4125_vboost_table[] = {
+	4250000, 4500000, 4750000, 5000000,
+};
+
 static const struct regulator_ops qcom_usb_vbus_reg_ops = {
 	.enable = regulator_enable_regmap,
 	.disable = regulator_disable_regmap,
@@ -58,6 +68,26 @@ static const struct qcom_usb_vbus_reg_data pm8150b_data = {
 	.ops = &qcom_usb_vbus_reg_ops,
 };
 
+static const struct regulator_ops qcom_usb_vbus_pm4125_reg_ops = {
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.list_voltage = regulator_list_voltage_table,
+};
+
+static const struct qcom_usb_vbus_reg_data pm4125_data = {
+	.cmd_otg = PM4125_VBOOST_EN,
+	.otg_cfg = PM4125_VBOOST_CFG,
+	.otg_en_src_cfg = PM4125_VBOOST_EN_SRC_CFG,
+	.vsel_reg = PM4125_VBOOST_SEL,
+	.vsel_mask = PM4125_VBOOST_CFG_MASK,
+	.volt_table = pm4125_vboost_table,
+	.n_voltages = ARRAY_SIZE(pm4125_vboost_table),
+	.ops = &qcom_usb_vbus_pm4125_reg_ops,
+};
+
 static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -135,6 +165,7 @@ static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_usb_vbus_regulator_match[] = {
 	{ .compatible = "qcom,pm8150b-vbus-reg", .data = &pm8150b_data },
+	{ .compatible = "qcom,pm4125-vbus-reg",  .data = &pm4125_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_usb_vbus_regulator_match);

-- 
2.34.1

