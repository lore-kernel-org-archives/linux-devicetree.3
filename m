Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383D543D502
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 08:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768877; cv=none; b=kr7qvKdxX2Fz4FwSvj28nxfrvCXgZR96DjfantuAc2GTNgsfgBv8w+nNtzE8p7Op/bQqEgNEcgy5i1WxGAo9n8MLTC2lMhLIVD2nRAZp6bgmDuMRH6u03n39gucfZBrrXMxKtOxrkTeIVlJba5QT0S0wL+xImu5DTkR2K1AU/cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768877; c=relaxed/simple;
	bh=Dj3faPYhzpsmeQuuhKQfLj+ZrTkkoq2/RcUoKXkAEUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p+PMJtqhD4f5BAhsmSUFPuc1bIs3GLopXmvcA806sh6PqBM8y7q0rVfheUJdQERKuBhw57md7mp/sslOxjSYgy6z+aVO3dxmMl7JXqh35iAjQH22wFVIdvGoNn/AA+TXJ8cvxsG55/roQH9uYaAT0SzS2N3l3gAKGp5dlqemFIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oymA8yZB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fwM9HLlo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oymA8yZB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fwM9HLlo"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6877orTX3657407
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 08:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MxZtWLIDm7ldSkRHItWGY+C+A/qmFG+JKSeortVNEa0=; b=oymA8yZB7khJG8b4
	qLQSA93jpeaay0ZVwI7iRidkkJ0H2+N7pRIGfQ0/vrlHbhg53kfnyXaC/d8ub75s
	Ef943+5o028GhD1R+iYog5uIqZMFessn1Bi2dRaUnVRgkM+kYWLP6tbkRuZhETQI
	DAVwTbcbmlLAjGmCP060rP6nsoZGFrHq6jvCzWeak0IBa+ElT3NV6N5BE8Kom02H
	yLthIqsRgeBA5wbtu0yP1ymBOsomUrhG/sdtZV1l+lDthMq07w8T2R1STTpE99+D
	z3h0aUqKg091BUF6CxbaS/ICvfl+dGlyA1fj5RQeoCp9Eg5t35vj0KcIW3uyz84M
	OUe5RQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghs86r39g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 08:14:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6f73d0f89so43022385ad.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 01:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788768873; x=1789373673; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MxZtWLIDm7ldSkRHItWGY+C+A/qmFG+JKSeortVNEa0=;
        b=fwM9HLlonw8TU9Px0HOv0tjne0FAVXfVK6K8n/aadAjzDMZ07ma/gk74U+EozOw03i
         kApMazlcd+vzuhcfiF50BuUtVGIQBPa0ZWcoHAHeOnj5EHs4TNc/LCAl97f1Pd+8qFfb
         rgc5Hw2jd32EEjZwI3724evAcjR+T7IXAGcJrVaulEZgBAtPDH4lEkwR5pKumRHz1bbZ
         OciCHPLvcOLZZpTPOAA37SC1T84JYI1SaPo3FDdJ8JLrTgU/ZNQizDdOnznDeNuD8EqS
         q+VLkJfqjnvuofXumnC+c6w/xjj/7wekwSg0eNj9U4Tei/i0gIuLPbS2lZRfDYRycjf5
         v0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788768873; x=1789373673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MxZtWLIDm7ldSkRHItWGY+C+A/qmFG+JKSeortVNEa0=;
        b=dJOAHSwcjqS6vyOEwFsq0RqxNgoB6DHaCFk1xCLlKEQ+JzDaYJzN9zwA91j/Te3lYn
         jeJbV1ZYzgGQ9U4Mw/LykkZ12jfCHad70yWEQHhq+O2WRAe2f/DNo7jtlAKBuon422A2
         F4Qu/AOAFtbkNghrTNQi2e+MA3rKoCvSH2r4MEmB710ee0SVr33Vpx4F0u3QWe/kEXNu
         Lglc+T9erkS1XVko6WRfiEDvFa2i6Z/Jfeqc3Y5t09cBx3PRiJtjqB3+cOYT7qDUvRuN
         cET4vyBNpyiGZRf74+irKxJc6aT9e8MsWLenHBWnmYF4WKLSyIcMPhPq9vhmJmmHjWp+
         x8KQ==
X-Forwarded-Encrypted: i=1; AKwUvByn9oB+/3SxVTVbOYBjSkbhNFRjEtNn5E8xM23gi7k7stpXzS+GX52Rgs1Zfkyl+uds/efXKc0HouzU@vger.kernel.org
X-Gm-Message-State: AFuF++lXJDYWo19PapR4sE9JdW6BoXPkCjE1PAcxN1O7+Xaj0qJIU0OX
	kX5RgjrWBD9Lirwfo9GPSazInUABVfR0FsPKCx3jSCnBPbrTcet2ipsVyRKnXgCLoBN5ZdHkmKK
	PY2rr94n1ICfmQIWFkzRlLm5xwZAOr1BK8G8R3gghI87471y0RQjJOuyPy7Vjebpv
X-Gm-Gg: AYBFou1iyCRT+Zs/63Zs/wmP96GWRV9j+aqYUlMrFfRjpFHMsDW0CWtqKUNmBqai03n
	l5f5xpXP7eHb5yUjj1PUBL+5W4nl+5eYqwmtaTOMCppZs70N5dKv6btrOdh91c4oFA/7eTwD0EW
	ZiWAZ+xuSFAZDGwbXfozoOWxjjSvrXI6NfGFIo/sjivGvQRdLlKEtNN0XgsK+kOHwgFV9GCGhFK
	2P9Ac6HUunYf/IfXKBPHkGxp8gk5pzzjhSEv7FbPEjERDzMaI8EpvjjEo4MIh75vCnFOGLQf+7o
	YsCCfYYt0EGjjOcHUncJ9HMlfTSOWSCDvpJZxkxmH03MdsiUi4SOjFsa8a7hsn3X8VZWEa1x4oD
	2rtNHTdbeHzj7pJmx4N48IY4bBOO0MAA=
X-Received: by 2002:a17:90b:4fca:b0:38e:5b59:c2ff with SMTP id 98e67ed59e1d1-39b260dd278mr32332677a91.3.1788768873026;
        Mon, 07 Sep 2026 01:14:33 -0700 (PDT)
X-Received: by 2002:a17:90b:4fca:b0:38e:5b59:c2ff with SMTP id 98e67ed59e1d1-39b260dd278mr32332577a91.3.1788768872372;
        Mon, 07 Sep 2026 01:14:32 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm21724220c88.6.2026.09.07.01.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:14:32 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 13:43:41 +0530
Subject: [PATCH v2 5/6] mfd: qcom-pm8008: Add support for PM8010 PMIC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-glymur_camss-v2-5-75f7982dc983@oss.qualcomm.com>
References: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
In-Reply-To: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788768826; l=7418;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=0Gi/ylANHIiBcnYUiyLavUhDki5MHfyeqAZtbpfGAho=;
 b=sKlg1f2Qdmw9O7qLug0a1qsJ7UI93rmZ+ttvVhckyl66TatEbs7SRCGoYUQconlouOUZAaNc/
 IW+E3SsF9TWCWb5X0d4JrO7ACGpCuVYNjxDHcD7eJ81drW9Lv+87tug
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: -jQ49SlS7UvAXfqSSgScGVTy1137ou62
X-Proofpoint-ORIG-GUID: -jQ49SlS7UvAXfqSSgScGVTy1137ou62
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfX6HQX2h9649Jc
 MIk9cOriDPwtvp9ZdwSsAQNtM2L6GFAI22aOFUNAQONr3SlFtau0SXZaV6TWPTsjxnvd1NUvBFq
 iLO7XmeKqcUIkPchahTh7Egr5UhVhOs=
X-Authority-Analysis: v=2.4 cv=LseiDHdc c=1 sm=1 tr=0 ts=6a9e726a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=A6So869mJGH3nWG3DMgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfX5zUZQ9FuR1f7
 1k9HVXFDKy1ilPhhCYGWVFq2Lfq42hL2XucEC6chpbuz5xv21uNz+vIiq0QDADd6m6LYaRmYIHB
 0MyyXS76Qfz+JOzhATXxJUj5iylIChX6EavqloYFq6r3ZnGQQstsT2NfDkc8VHeJyHn92/2BpeA
 fMxVtnux/ORnvxP7kjdFFHduUfpjxIHJ2B9t0wvyhfncqWWtuRlElEeDVpSMsWxTH8HDugoh9QN
 sh2yFqXectbI1dqEicXVl4sbXa6kYfaAF8Ooujg5QaJ214yPy1HC/zzO4dHxrjxsj9X3TTMHrUn
 taRXa6rA501X8p6RiSwXY+oV9IYPsWTq2fkP5Lg7Nr+We5O0T/mH+5gG0tgEw5HB73RslsTpCvx
 TIfRpzC7AdQVHaoqFIEVBY2oy0CHoOYlYfMiKkLJUfh1bIztq5FTeZoFO+y+3Nq7p1/FajKpx9P
 ADQ1lshD9lE4il/koMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070088

From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

The PM8010 is a variant of the PM8008 PMIC with a slightly different
IRQ layout and MFD cells. Introduce per-variant match data (IRQ chip
descriptor and MFD cells) selected via the new "qcom,pm8010-i2c"
compatible string, and support probing without an interrupt line by
falling back to a reduced set of MFD cells when the client has no IRQ
assigned.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/mfd/qcom-pm8008.c | 140 ++++++++++++++++++++++++++++++++++++----------
 1 file changed, 112 insertions(+), 28 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 60204cc9a2dc60cc1fe1b64030f5d803100e7874..28532cef7908ef3409a3dfc0779aae3b1a3885b9 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -34,6 +34,7 @@ enum {
 	PM8008_GPIO1,
 	PM8008_GPIO2,
 	PM8008_NUM_PERIPHS,
+	PM8010_NUM_PERIPHS = 2,
 };
 
 #define PM8008_PERIPH_0_BASE	0x900
@@ -55,6 +56,10 @@ enum {
 #define PM8008_IRQ_GPIO1	6
 #define PM8008_IRQ_GPIO2	7
 
+#define PM8010_IRQ_MISC_MBG_FAULT	0
+/* 1-3 are unused */
+#define PM8010_IRQ_MISC_LDO_OCP	4
+
 enum {
 	SET_TYPE_INDEX,
 	POLARITY_HI_INDEX,
@@ -88,6 +93,12 @@ static const struct regmap_irq pm8008_irqs[] = {
 	_IRQ(PM8008_IRQ_GPIO2,	      PM8008_GPIO2,	BIT(0), IRQ_TYPE_SENSE_MASK),
 };
 
+static const struct regmap_irq pm8010_irqs[] = {
+	_IRQ(PM8010_IRQ_MISC_MBG_FAULT, PM8008_MISC, BIT(0), IRQ_TYPE_EDGE_RISING),
+	_IRQ(PM8010_IRQ_MISC_LDO_OCP, PM8008_MISC, BIT(4), IRQ_TYPE_EDGE_RISING),
+	_IRQ(PM8008_IRQ_TEMP_ALARM, PM8008_TEMP_ALARM, BIT(0), IRQ_TYPE_SENSE_MASK),
+};
+
 static const unsigned int pm8008_periph_base[] = {
 	PM8008_PERIPH_0_BASE,
 	PM8008_PERIPH_1_BASE,
@@ -158,6 +169,25 @@ static const struct regmap_irq_chip pm8008_irq_chip = {
 	.get_irq_reg		= pm8008_get_irq_reg,
 };
 
+static const struct regmap_irq_chip pm8010_irq_chip = {
+	.name			= "pm8010",
+	.main_status		= I2C_INTR_STATUS_BASE,
+	.num_main_regs		= 1,
+	.irqs			= pm8010_irqs,
+	.num_irqs		= ARRAY_SIZE(pm8010_irqs),
+	.num_regs		= PM8010_NUM_PERIPHS,
+	.status_base		= INT_LATCHED_STS_OFFSET,
+	.mask_base		= INT_EN_CLR_OFFSET,
+	.unmask_base		= INT_EN_SET_OFFSET,
+	.mask_unmask_non_inverted = true,
+	.ack_base		= INT_LATCHED_CLR_OFFSET,
+	.config_base		= pm8008_config_regs,
+	.num_config_bases	= ARRAY_SIZE(pm8008_config_regs),
+	.num_config_regs	= PM8010_NUM_PERIPHS,
+	.set_type_config	= pm8008_set_type_config,
+	.get_irq_reg		= pm8008_get_irq_reg,
+};
+
 static const struct regmap_config qcom_mfd_regmap_cfg = {
 	.name		= "primary",
 	.reg_bits	= 16,
@@ -179,10 +209,32 @@ static const struct resource pm8008_temp_res[] = {
 
 static const struct mfd_cell pm8008_cells[] = {
 	MFD_CELL_NAME("pm8008-regulator"),
-	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
+	MFD_CELL_RES("spmi-temp-alarm", pm8008_temp_res),
 	MFD_CELL_NAME("pm8008-gpio"),
 };
 
+static const struct mfd_cell pm8010_cells[] = {
+	MFD_CELL_NAME("pm8010-regulator"),
+	MFD_CELL_RES("spmi-temp-alarm", pm8008_temp_res),
+	MFD_CELL_NAME("pm8008-gpio"),
+};
+
+static const struct mfd_cell pm8008_no_irq_cells[] = {
+	MFD_CELL_NAME("pm8008-regulator"),
+};
+
+static const struct mfd_cell pm8010_no_irq_cells[] = {
+	MFD_CELL_NAME("pm8010-regulator"),
+};
+
+struct pm8008_match_data {
+	const struct regmap_irq_chip *irq_chip_desc;
+	const struct mfd_cell *mfd_cells;
+	const struct mfd_cell *no_irq_mfd_cells;
+	int num_mfd_cells;
+	int no_irq_num_mfd_cells;
+};
+
 static void devm_irq_domain_fwnode_release(void *data)
 {
 	struct fwnode_handle *fwnode = data;
@@ -192,15 +244,22 @@ static void devm_irq_domain_fwnode_release(void *data)
 
 static int pm8008_probe(struct i2c_client *client)
 {
-	struct regmap_irq_chip_data *irq_data;
+	struct regmap_irq_chip_data *irq_data = NULL;
+	const struct pm8008_match_data *data;
 	struct device *dev = &client->dev;
 	struct regmap *regmap, *regmap2;
 	struct fwnode_handle *fwnode;
+	const struct mfd_cell *cells;
 	struct i2c_client *dummy;
 	struct gpio_desc *reset;
+	int num_cells;
 	char *name;
 	int ret;
 
+	data = device_get_match_data(dev);
+	if (!data)
+		return dev_err_probe(dev, -ENODATA, "Missing driver match data\n");
+
 	dummy = devm_i2c_new_dummy_device(dev, client->adapter, client->addr + 1);
 	if (IS_ERR(dummy)) {
 		ret = PTR_ERR(dummy);
@@ -231,37 +290,62 @@ static int pm8008_probe(struct i2c_client *client)
 	 */
 	usleep_range(1000, 2000);
 
-	name = devm_kasprintf(dev, GFP_KERNEL, "%pOF-internal", dev->of_node);
-	if (!name)
-		return -ENOMEM;
-
-	name = strreplace(name, '/', ':');
-
-	fwnode = irq_domain_alloc_named_fwnode(name);
-	if (!fwnode)
-		return -ENOMEM;
-
-	ret = devm_add_action_or_reset(dev, devm_irq_domain_fwnode_release, fwnode);
-	if (ret)
-		return ret;
-
-	ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
-				IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
-	if (ret) {
-		dev_err(dev, "failed to add IRQ chip: %d\n", ret);
-		return ret;
+	if (client->irq) {
+		name = devm_kasprintf(dev, GFP_KERNEL, "%pOF-internal", dev->of_node);
+		if (!name)
+			return -ENOMEM;
+
+		name = strreplace(name, '/', ':');
+
+		fwnode = irq_domain_alloc_named_fwnode(name);
+		if (!fwnode)
+			return -ENOMEM;
+
+		ret = devm_add_action_or_reset(dev, devm_irq_domain_fwnode_release, fwnode);
+		if (ret)
+			return ret;
+
+		ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
+						       IRQF_SHARED, 0, data->irq_chip_desc,
+						       &irq_data);
+		if (ret) {
+			dev_err(dev, "failed to add IRQ chip: %d\n", ret);
+			return ret;
+		}
+
+		/* Needed by GPIO driver. */
+		dev_set_drvdata(dev, regmap_irq_get_domain(irq_data));
+		cells = data->mfd_cells;
+		num_cells = data->num_mfd_cells;
+	} else {
+		cells = data->no_irq_mfd_cells;
+		num_cells = data->no_irq_num_mfd_cells;
 	}
 
-	/* Needed by GPIO driver. */
-	dev_set_drvdata(dev, regmap_irq_get_domain(irq_data));
-
-	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, pm8008_cells,
-				ARRAY_SIZE(pm8008_cells), NULL, 0,
-				regmap_irq_get_domain(irq_data));
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, cells,
+				    num_cells, NULL, 0,
+				    regmap_irq_get_domain(irq_data));
 }
 
+static const struct pm8008_match_data pm8008_data = {
+	.irq_chip_desc = &pm8008_irq_chip,
+	.mfd_cells = pm8008_cells,
+	.no_irq_mfd_cells = pm8008_no_irq_cells,
+	.num_mfd_cells = ARRAY_SIZE(pm8008_cells),
+	.no_irq_num_mfd_cells = ARRAY_SIZE(pm8008_no_irq_cells),
+};
+
+static const struct pm8008_match_data pm8010_data = {
+	.irq_chip_desc = &pm8010_irq_chip,
+	.mfd_cells = pm8010_cells,
+	.no_irq_mfd_cells = pm8010_no_irq_cells,
+	.num_mfd_cells = ARRAY_SIZE(pm8010_cells),
+	.no_irq_num_mfd_cells = ARRAY_SIZE(pm8010_no_irq_cells),
+};
+
 static const struct of_device_id pm8008_match[] = {
-	{ .compatible = "qcom,pm8008", },
+	{ .compatible = "qcom,pm8008", .data = &pm8008_data },
+	{ .compatible = "qcom,pm8010-i2c", .data = &pm8010_data },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, pm8008_match);

-- 
2.34.1

