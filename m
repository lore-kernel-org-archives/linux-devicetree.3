Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1611741C2F7
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 09:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781601985; cv=none; b=Zucwa3FgPLBoNVuhSH6QYW3FYab1gqjK9hpA+spEqk3SDEnqpLRlTth+UaCr/9G8gDpC/1DT5fZNDU/0CpvMowvlHYECmj6gsWoBy22/Mq7U1AybDlXTX02LQqH0TwHIzY5IUXRfSe65GrCmSrswjr4DpFDOaF6tnIsfWcmvXBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781601985; c=relaxed/simple;
	bh=l0yvFWCjGqALYpibJwYjgc+rbMxGpbSzkybRumcJUbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IPU70Oy9UkD2THmwhzzTYwQdo2IIKSRH0z0EE6YahFFJ5MtRpBW3feldN16wc3RTnGAkseD3RmReVS9BS3RzP9X1uQF8FEQgj8mxOYoc8Nxxpj+zjqsOyqrvy+SGZbFhercObUtaIEapPgIBGbq0oGLEVBgOOVu62o5v2WQm8bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y/D7ugGP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SOnFjHmw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y/D7ugGP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SOnFjHmw"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G77QvV2383237
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 09:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NAXb5yw4TktASaT4DIdQAQD/zAZTtEP96c+FwsmHD0Y=; b=Y/D7ugGPjv9iybTU
	P4uQNU4dRPV9ztHfKO1MCjttfnHtqxITMICXOif/wPArbbgOXJQfg73sGfedGxnT
	KA07PNfEqRdFtTu+nBALstgjgb+LMYXufsWNl0vnqtOUvsttaaMUxT2ki9Twbgyp
	4H0uwTnwcO/pRPkZsYB2r0VvqZ0/BFRLBHbGxotBu0Nmg/64Ya4tNQnoV3mGrdlm
	n/wVYBuNyREAyUwA2jo+LFcUbl5D8AnJIOr0BC5jEra5CdJEjDTBDIRoMavwaWS+
	fmTuknrPLEmywe43gHwBVspzhIKqKaycM8FzKNPkZP/2/RavG3G1ZiPnTM0USu0+
	YRGmug==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu0a7s283-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 09:26:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c32f4b1bso43406315ad.2
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 02:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781601983; x=1782206783; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NAXb5yw4TktASaT4DIdQAQD/zAZTtEP96c+FwsmHD0Y=;
        b=SOnFjHmwTSk51ba1gs3bciphQp1odY58jI4DGHr6OYwWClAeXMxR1kw67IUV0tfcma
         YLQNoMRgUgJGdB6oiVj18TDe/fTNbcVYyf1VekEsj/Ba22h34z9kK03ndPFUtq3sRBOx
         /GfgMJ88m1bH3T5RaERVx27tbPtCZOE0DO2QgH1p+xNpgJSIi0xqOZDLOqGI7j9Qet5u
         k9xKrRYRisYHDIQ6i8bh9Cvg/9fiI4LofMj67rswqWNd5OcKc8LqD9iyr5oTNzhgdC1B
         PQnBrTVfoKq9843rhuqWRx7PYPdFiN8p+NaXoiJTI95kwpO47dHaPW8DWkNMBemcYb6n
         1DjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781601983; x=1782206783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NAXb5yw4TktASaT4DIdQAQD/zAZTtEP96c+FwsmHD0Y=;
        b=REZfHUl4crT/mjzWf9p46MJAixCIYfANXdZIsg3MyhChsvkvTKeiIqmGrnGpi/IRkp
         LtyOWJ7Npkz0sPEFLi9BkYTy0keJWY5pdO1FG7++IoeGkbvPhvh5PxUoqk8mIA22InnX
         OcG13oGIbD8Z/hPotvYmBjTg0I+HB2NkOfC9rJQkQrfuatnKYx5ltgmgwV9R5Bijmxy1
         0/WkVRPJM2jRIl2mNyCN/t6vldZFidHhantF1OmKReSRqJFDmQvuyZy7XQ4hFDOZG2C0
         clMFrtXH4zXpEqy6YzXimjl/DaV2gLaLPR1QAxpTNxuEeOb6FieVpQxE3s3eJku1K8Tm
         mHZA==
X-Forwarded-Encrypted: i=1; AFNElJ9I++30tmcc+U5HvIhFFc/8kKV8n5G1owgJC5zOR7sohg+kmuwDHPLCwHv5V8WY3e46UmGttHAZET+W@vger.kernel.org
X-Gm-Message-State: AOJu0YxoyJS/sK4EzHvPcV2gKwlsp+r1rPnk81ZdbDi+e+hSiL+Nt977
	rwviu/FC4nemVvA9bRc7H3ep5CV3TjPd9udCIk1yQrdb78ErWhrP3KSwuXmZ5rOQD/AHU6NWwB4
	iFeNGNM65WlZlUWxzlEgLj4tbroQf3RyOpA18bXkeDF0M0HKx8dsCShDcG1rS1+YLu0G99Snp
X-Gm-Gg: Acq92OEQfnC0jJV2Z6cvUNz8lLAGNsPaq+uZYfeVZV5ijD8xYlbKetxVop9KiLSnPod
	OCuLEQIBDY6Xh2SdCUO/RDDSU+nKDkgeP+p9LN9CyUkS7gDD0jJjNttFENed5IxsLBLhS9WWzPx
	YbYDclYxzv/zU2CWJYj0+VD/kEKx5I7nN+NEmMoJwSwKLrTfgFHKOsk8qyzvVBOrwdMlupKMDs2
	N0uWCWm06AMakCSESWaSsWekPgwBCHiprUKmmBbSZs+UpmhnikmfyjqPD8jZbmvQsr75L+BwPsy
	tizbXSeiKl40groNUbFPDSJlI/QLdt7Ql0kkBd0CebrCmpeYwfbKNYyfV0KxlWbblrTThk19hbi
	+W2hba+RHqz2doACOaudzlSlqoRBihwQA+Rg4m4Q6B3fLNOwl+Q==
X-Received: by 2002:a17:903:1b43:b0:2bf:23ad:8595 with SMTP id d9443c01a7336-2c66414887cmr157520255ad.4.1781601982595;
        Tue, 16 Jun 2026 02:26:22 -0700 (PDT)
X-Received: by 2002:a17:903:1b43:b0:2bf:23ad:8595 with SMTP id d9443c01a7336-2c66414887cmr157519965ad.4.1781601982122;
        Tue, 16 Jun 2026 02:26:22 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e586bsm130042025ad.12.2026.06.16.02.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 02:26:21 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:55:54 +0530
Subject: [PATCH v3 4/8] irqchip/qcom-pdc: Differentiate between direct SPI
 and GPIO as SPI
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-hamoa_pdc_v3-v3-4-4d8e1504ea75@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
In-Reply-To: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781601959; l=4386;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=l0yvFWCjGqALYpibJwYjgc+rbMxGpbSzkybRumcJUbA=;
 b=7z/PfdFzn0Z2mVeQg6VszqurdrtfvdA77vqiVY0xFhHQc551CE2kd9GB72v4jpDGHsanN7C3M
 sgE4calTATJClaY7EXUKR86+lap8JkQeDta5mcqpvV8b7WTTYKWNhQ6
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA5NCBTYWx0ZWRfX3YbNkksGupyD
 D3bVstm1JEZMxBoZu+Fy2pnd9qLzyCPnYVd8g7ifG4EwmR+RqUB6TAwQmMT5+weYkVJJ2nomIP8
 BMgHbQc76N4Wrfz3pQlW9zyn7lYlp1TK17cjEsvptWPu2+6csxWfy041p96HIM1aL2mbLM5suVw
 P6RVyoV8GA7t9DgHEg1+q7Q8WpQHR1hz6v4s7E+G7SYgh3w1SY1wkcQ7qeU5XRZj7ttaunlI/LH
 i02xUduSSvJ0ESEc0xzy796Kf5sil0lRBWvn83aEv5korq8ioiTSuMJV0E30WFzYsB76XFslsAB
 TIcQVBVOxXhEsZlI1Pzuvw/EEs/0YTzlNbjpQGTMOHbjJapVMrBQgWBbZOCAWeM/jG2UKXRKTPF
 81IE5ranHNZGEo6GrccjDsQYAEiU1MDp/fGxV0KTg+VnO8Z7BMiHSbixg4KZZ1ZYG6zhBySnmzj
 n9mLWRY8kDU6Lb7m9Fw==
X-Authority-Analysis: v=2.4 cv=JKALdcKb c=1 sm=1 tr=0 ts=6a3116bf cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=_ArkcH_OKHg-bdOJ338A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Q8lJy9JBG5pFEw1xE1U9HvtrYDcVk9Ya
X-Proofpoint-GUID: Q8lJy9JBG5pFEw1xE1U9HvtrYDcVk9Ya
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA5NCBTYWx0ZWRfXzMREMEuUu3K6
 48PfN+7xnkTo9sgIrbkibC/MpEbv9ty08mIX/fm+mSJC0wXBB3t2QxaZifl657ZAmcCvWb86gGM
 +6KGbBmwcwEj4c46oWcgjQnx7DA/QzM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160094

Before commit 4dc70713dc24 ("irqchip/qcom-pdc: Kill non-wakeup irqdomain")
there are separate domains for direct SPIs and GPIO used as SPIs. Separate
domains can be useful in case irqchip want to differentiate both of them.
Since commit unified both the domains there is no way to differentiate.

In preparation to add the second level interrupt controller support where
GPIO interrupts get latched at PDC (but not direct SPIs) there is a need to
differentiate between SPIs and GPIOs as SPIs. Reverting above commit do not
seem a good option either which leads to waste of resources.

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
index 6c556464d37c..1aa6be42307c 100644
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
@@ -92,6 +99,8 @@ struct pdc_irq_cfg {
  * @base:           PDC base register for DRV2 / HLOS
  * @prev_base:      PDC DRV1 base, applicable only for x1e RTL bug.
  * @version:        PDC version
+ * @num_spis:       Total number of direct SPI interrupts
+ * @num_gpios:      Total number of GPIOs forwarded as SPI interrupts
  * @region:         PDC interrupt continuous range
  * @region_cnt:     Total PDC ranges
  * @x1e_quirk:      x1e H/W Bug handling
@@ -104,6 +113,8 @@ struct pdc_desc {
 	void __iomem			*base;
 	void __iomem			*prev_base;
 	u32				version;
+	u32				num_spis;
+	u32				num_gpios;
 
 	struct pdc_pin_region		*region;
 	int				region_cnt;
@@ -120,6 +131,7 @@ struct pdc_desc {
 
 static const struct pdc_regs pdc_v3_2 = {
 	.irq_cfg_reg	= 0x110,
+	.irq_param_reg	= 0x100c,
 };
 
 static const struct pdc_irq_cfg pdc_cfg_v3_2 = {
@@ -130,6 +142,7 @@ static const struct pdc_irq_cfg pdc_cfg_v3_2 = {
 static const struct pdc_regs pdc_v3_0 = {
 	.irq_en_reg	= 0x10,
 	.irq_cfg_reg	= 0x110,
+	.irq_param_reg	= 0x100c,
 };
 
 static const struct pdc_irq_cfg pdc_cfg_v3_0 = {
@@ -139,6 +152,7 @@ static const struct pdc_irq_cfg pdc_cfg_v3_0 = {
 static const struct pdc_regs pdc_v2_7 = {
 	.irq_en_reg	= 0x10,
 	.irq_cfg_reg	= 0x110,
+	.irq_param_reg	= 0x100c,
 };
 
 static const struct pdc_irq_cfg pdc_cfg_v2_7 = {
@@ -449,6 +463,7 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 	struct device *dev = &pdev->dev;
 	resource_size_t res_size;
 	struct resource res;
+	u32 irq_param;
 	int ret;
 
 	/* compat with old sm8150 DT which had very small region for PDC */
@@ -505,6 +520,10 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
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

