Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007D038D006
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779792921; cv=none; b=Rd6ND2sE0zbGjfzM2+7Sk9u7pFXaAAGkbZp2MX3pcKoD7i7QDYGVneDzDJPExhYXcCq0xUzUF9st618Ga10z6ocndwC+vTgjhzx6QrJHBDDAS/ZJ+56I1tUYxHiSi0WRimsBVb8Lpv21LoiiHNBct9g/z0RP4Ff//K8YVNo4TGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779792921; c=relaxed/simple;
	bh=6EQ6AEy/sFGbv0oRWgjY13Wwv75cbd1+f0Br4cSZjD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D0zZmy/UHRsVtmAxgdlgvuGf4TU2VobKx5UyT58IzliMpEx0Xr33l5Iw/FXE6xM4I2XkIEQesxa5wXBAcw+5XMMVTguII6RTD7fZzxmoTdmwpWmAKfKrihnJ1CCU6D3D07s8M96wYKO+YvcrBjtWVGcqCYDYMO5hKBJyUsbXgr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VZvBDMMc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VV/GxMgi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VZvBDMMc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VV/GxMgi"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QATfVx004499
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:55:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lBvxffGLGjap0F10y6akuJqbuU0quUpXU7b/5dedjVA=; b=VZvBDMMc4AlN8xWn
	A3y272eDSVznYXmeu8kVruVA/8TzLZAWQ+kmuzu3mJu+J9udLUU2l2oaqjX2cTDC
	q0J99DcuP1WwKY/5+goiLjRmtg8tg0H9tkCiV4K4coyRFunX4yawBSGpZOcI6bwT
	ajvTA7bhk/q4csUWuYjrvIWW6kkN/BKeWh64ZkMolKZjU87KFwFiMs7pVKsBX+zX
	EcS314JtCAdcTf9kRJXSsWpRbZzxGLUBgw49MhtpEMwhrAH/RpvJjrT60PMyjY6R
	HaGdH54SpTPeNyqglyYbbcDmNoNWHaIyhTaWbEOHo7lVDMbJdn1gp24UkG1dgC+s
	ZSpeYw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecsm0335e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:55:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba3245a43dso116278275ad.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 03:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779792918; x=1780397718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBvxffGLGjap0F10y6akuJqbuU0quUpXU7b/5dedjVA=;
        b=VV/GxMgi9b9KwrTEltO0KqXZqU/hIkPE/pcU7yZvQUf8bIE03IuQvWdCAmfklw0Mn+
         WO6QDXb9ly2ag8TV0uPN68WZGqkv8ucexJXLhsKrBWV7MyD/iQM5IMikJaI0RL10LtTd
         w4Oz3ScCcgrP4IA3xVhqpOKbR4ZnC1nTp7nZ2dSGoQBao02bKea+qzVrLHB1hqKTSaN7
         H788iqIfo4YWsO180MujVoRcmcoOPr0bOzUU4dpHWBP6rb07jQpaQ9Vt3OwXeEfwWehZ
         vIjl7XsjjC33b+5BfdPUWUESByxvtHfU/qgq53aNvAHoXGMCyqvUACpzXSSddiINusct
         lljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779792918; x=1780397718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lBvxffGLGjap0F10y6akuJqbuU0quUpXU7b/5dedjVA=;
        b=KwfnlZ9H5B5E933vzOvIUMn1W0kSQ8NnSJyXNX2pzLLVtHvZTqrXuIHZxRiEDAspWg
         abCYWMYPLK+kPNkK+GH5rs3TbeRxZ0wk0ggHj0cl8D9lprDkV5LubYj9A/SLAFflYbQn
         SuDYwV8Y7YF4OnuQwRVuCWcNNUbKV1hmohFlCAJ3nX/bE4UYGbd5pxKIT0PRK+zOLgRY
         DtDSq8P7wpJK46pLhjTbjE98EjKqrRtsB11TnGyqm3JbQM01kJn6W63PDsRSbx3DhNUY
         0ierdhWfXQ6p3mAsgxow7wmgFOr1dpJ57+ChGEduqOLso2PHDms1DOPiQsSHc/3YMG/C
         DpoA==
X-Forwarded-Encrypted: i=1; AFNElJ8XfZx0Zb5hEUfCIDrGtpeYYg9mekvD2HBn1g9P+wK8LqoVXXMu05D1NojnUuxm4UReOZkZty0J6uUM@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq9DQEolAhX/TgI/jiUtnjTjsz0TvW/OS6IZmNJGfOcCREANeY
	2xngnA7P9sBmJoqJlfmgUz794gPdFw2+8uVgWY56FLzSuHeEnxIkACEqtYbOKWYBLoHVjv+CGL6
	74+waEslCwsvGyTdNb5MIa98LQlqHs2pDOz46C0JrZmdXACMaOWJNZJr8MY4N+Qa01Cq7lPX5
X-Gm-Gg: Acq92OHqwtFgKOVMs15K2jyTIVBACqcGvWRFsBNdKoA8WeXhvviDdQT447AKRRU9mBE
	npHt+i/Bn6QUR1Xnm9qa7aDy3fK1Mb4elP4WwHNzLWEsG2ZztEhQDYpqx6iYwuer0C1ZsmAOWsR
	9PQ9rLTTljTBnVb9H9F6hhFceBCbClN2ZE0boAshk1uYdV5A8COwi+jimapzyzXmdXO6DVpOCpc
	zFfsHquz5aF73Qtx9hnutHf3eS1X4ZMjSd3AEK7FYf6w5awOGoTH0Dopn7T0l4xQr4HgIs07/bG
	poV03wr3eHOQefeRcj8Bz9+9yS5XU8SrXcgNQX6SE6XUb58wMfkOMjtWqBW5YQ/Jc6tCK7XwgZg
	DEca2wpm2c9QsfP/9KbfiIaqxctsVFKNWyjNlEouZqca2BWgHzQ==
X-Received: by 2002:a17:902:ccca:b0:2bd:a413:6b07 with SMTP id d9443c01a7336-2beb031ad32mr196688905ad.8.1779792917664;
        Tue, 26 May 2026 03:55:17 -0700 (PDT)
X-Received: by 2002:a17:902:ccca:b0:2bd:a413:6b07 with SMTP id d9443c01a7336-2beb031ad32mr196688695ad.8.1779792917218;
        Tue, 26 May 2026 03:55:17 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f3dsm120890025ad.1.2026.05.26.03.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 03:55:16 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 26 May 2026 16:24:40 +0530
Subject: [PATCH v2 4/8] irqchip/qcom-pdc: Differentiate between direct SPI
 and GPIO as SPI
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-hamoa_pdc-v2-4-f6857af1ce91@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
In-Reply-To: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779792895; l=4359;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=6EQ6AEy/sFGbv0oRWgjY13Wwv75cbd1+f0Br4cSZjD0=;
 b=qXa0KsONgyIBH+VtaOzo+t9vZZzWxuMoVowWIB7JnogTd/zYJDqXfoiY6ZF0pLN5AsxMh/AVd
 mNRaoCvPDtlDhmCNmH1E9AQf9jV89ji3oSmMCJzr8MXdW3Lxd5rLy5d
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=CLEamxrD c=1 sm=1 tr=0 ts=6a157c16 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Fdd6IbX9gU1Ld8MhPvkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: BYLVDnKB2PU7DnBr3w7SR_56eylonVJw
X-Proofpoint-ORIG-GUID: BYLVDnKB2PU7DnBr3w7SR_56eylonVJw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5NSBTYWx0ZWRfX4yjODiN8GEBi
 PSZ/hgPNAqOYLTl65jM0skS54LLvQ0+hnWkkA3WaFCTKq07zkfwOqLpkREiZNo+sW+RKDZvWfFt
 o2pzEddTA1HGZF5jUbOit1PaYQG9tvZOiOQnr2csvkBsHdLD8i4p5SZCSZhLgvjpGfxiu6OSuqL
 pvDXUVGXLxtO9PIXUX5o1awVSBshNDw2SYJGjL2/+0/8XXbew8+LaF1mak3OG01/hWn6dma5K7A
 YuN5opZOzDfAtuSO/MAnahkkWeaCMtd9+7D1gJlaLcSAjhE+86WYVT6XQM79xtPU41ZYirxqRSP
 7y8Ivqo4LGZ/2sdKysojFa8Ma0y8AR52h5A299VHX4UjMtf9ge043RThVBZ4db0SyUQIzBgsh70
 4Zkkq3HAT260tUERScgBOVX5rp0zFm/m+M+QS2lyupVGVtW19/rh708/GAcrNWYT14w71GFvhB4
 5EeS6uqjrXDnH4OiCOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260095

Before commit 4dc70713dc24 ("irqchip/qcom-pdc: Kill non-wakeup irqdomain")
there are separate domains for direct SPIs and GPIO used as SPIs. Separate
domains can be useful in case irqchip want to differentiate both of them.
Since commit unified both the domains there is no way to differentiate.

In preparation to add the second level interrupt controller support where
GPIO interrupts get lateched at PDC (but not direct SPIs) there is a need
to differentiate between SPIs and GPIOs as SPIs. Reverting above commit do
not seem a good option either which leads to waste of resources.

PDC HW have the IRQ_PARAM register telling number of direct SPIs and number
of GPIOs as SPIs. Further PDC allocates direct SPIs at the beginning and
all GPIOs as SPIs are allocated at the end. This information can be used in
driver to differentiate them.

Add the support to read this register and keep this information in
struct pdc_desc. Later change utilizes same.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index db76737646e1..86379dddc5be 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -61,6 +61,11 @@
  * |                   |    [4] GPIO_STATUS|    [4] GPIO_MASK      |
  * |   [31:3] Unused   |    [3] GPIO_MASK  |    [3] IRQ_ENABLE     |
  * |    [0:2] Type     |  [0:2] Type       |  [0:2] Type           |
+ * |---------------------------------------------------------------|
+ * |   IRQ_PARAM       | IRQ_PARAM         | IRQ_PARAM             |
+ * |                   |                                           |
+ * |   [15:8] NUM_GPIO | [15:8] NUM_GPIO   | [15:8] NUM_GPIO       |
+ * |    [7:0] NUM_SPI  |  [7:0] NUM_SPI    |  [7:0] NUM_SPI        |
  * +---------------------------------------------------------------+
  */
 
@@ -69,10 +74,12 @@
  *
  * @irq_en_reg:     IRQ_ENABLE_BANK register location
  * @irq_cfg_reg:    IRQ_CFG register location
+ * @irq_param_reg:  IRQ_PARAM register location
  */
 struct pdc_regs {
 	u32 irq_en_reg;
 	u32 irq_cfg_reg;
+	u32 irq_param_reg;
 };
 
 /**
@@ -92,6 +99,8 @@ struct pdc_cfg {
  * @base:           PDC base register for DRV2 / HLOS
  * @prev_base:      PDC DRV1 base, applicable only for x1e RTL bug.
  * @version:        PDC version
+ * @num_spis:       Total number of direct SPI interrupts
+ * @num_gpios:      Total number of GPIOs forwarded as SPI interrupts
  * @region:         PDC interrupt continuous range
  * @region_cnt:     Total PDC ranges
  * @x1e_quirk:      x1e H/W Bug handling
@@ -104,6 +113,8 @@ struct pdc_desc {
 	void __iomem *base;
 	void __iomem *prev_base;
 	u32 version;
+	u32 num_spis;
+	u32 num_gpios;
 
 	struct pdc_pin_region *region;
 	int region_cnt;
@@ -120,6 +131,7 @@ struct pdc_desc {
 
 static const struct pdc_regs pdc_v3_2 = {
 	.irq_cfg_reg = 0x110,
+	.irq_param_reg = 0x100c,
 };
 
 static const struct pdc_cfg pdc_cfg_v3_2 = {
@@ -130,6 +142,7 @@ static const struct pdc_cfg pdc_cfg_v3_2 = {
 static const struct pdc_regs pdc_v3_0 = {
 	.irq_en_reg = 0x10,
 	.irq_cfg_reg = 0x110,
+	.irq_param_reg = 0x100c,
 };
 
 static const struct pdc_cfg pdc_cfg_v3_0 = {
@@ -139,6 +152,7 @@ static const struct pdc_cfg pdc_cfg_v3_0 = {
 static const struct pdc_regs pdc_v2_7 = {
 	.irq_en_reg = 0x10,
 	.irq_cfg_reg = 0x110,
+	.irq_param_reg = 0x100c,
 };
 
 static const struct pdc_cfg pdc_cfg_v2_7 = {
@@ -457,6 +471,7 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 	struct device_node *node = pdev->dev.of_node;
 	resource_size_t res_size;
 	struct resource res;
+	u32 irq_param;
 	int ret;
 
 	/* compat with old sm8150 DT which had very small region for PDC */
@@ -515,6 +530,10 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 		pdc->x1e_quirk = true;
 	}
 
+	irq_param = pdc_reg_read(pdc->regs->irq_param_reg, 0);
+	pdc->num_spis = FIELD_GET(GENMASK(7, 0), irq_param);
+	pdc->num_gpios = FIELD_GET(GENMASK(15, 8), irq_param);
+
 	parent_domain = irq_find_host(parent);
 	if (!parent_domain) {
 		pr_err("%pOF: unable to find PDC's parent domain\n", node);

-- 
2.43.0

