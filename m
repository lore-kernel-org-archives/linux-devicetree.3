Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C02B3988E0
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 09:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416136; cv=none; b=XRLuTWvtaWsOetneU2OVSmDvD0MeNeUuyNXi3Q0kcM9vHnFdHxKNmfwqnvbtxQrhSqcuGb6Dp58R197unpt664UuZMi/QFvhrC+0roQEoZ+eDy0lUJD8GiJYjYCMK0uFwRA1mtrNaKVdLaPA8mkDpm36wGHMDEVqSbAsdUEE/Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416136; c=relaxed/simple;
	bh=D0sOlcjYWpVb4KW1woV12cTMyxTCQuYuBDIGFgr0z8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DZ8me1E3bOYdlvlbI2UF2rcam89ThJc6AmApfQgJ1zdbXFCJHrxYtRicBOADLmM7/jFA6VQ7HEQZGGVHHM/s9gIzXZEXR1kDFy25yg9Zfqo52o2sSm8AI0acmt84wS2e7K0BlTcW5J0SEYIxxL2oYct7fhpyFXwX8fXODa3kIWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eaw0Xrkr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V6Ag0dal; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eaw0Xrkr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V6Ag0dal"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678E5h03004656
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 09:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2InzJMBKoHl7JVhFO+rX+aFvUpIrUtHbvFpQlkWzNFk=; b=Eaw0XrkrHQM1IAz7
	pTYq7uvQ0D+ytlDUJz3ndv+Pau+PujnS6wZWjkQ+T1ZU1EbzzYAhhIb9f1mqK3le
	oRNzAvPOAG6XrV/AzRZUxQ0Mudjx1B58wINdCfj/XYETN/K4gAHId4EIscc1bXP3
	OX7VyGNkQQDR/g9Qj/QP11q6TrGJkR31H3fC3grgWJL+imgUTAT89BdjRZLrk5Q3
	yg8ZonPk+zM8tLhxgUFvUmfYqoN8K/nphVdSQuh8VzMd8K/mRdxOtKzSAGbDpDFy
	7LilAdO4GFrAb4DFcyB4WGhQtb8/YacVBaWk1G+QHl8wmUMgZvhxY4W51VnPKc6n
	BpxThw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8su7171w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 09:22:13 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c89704da8c7so6737340a12.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 02:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783416133; x=1784020933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2InzJMBKoHl7JVhFO+rX+aFvUpIrUtHbvFpQlkWzNFk=;
        b=V6Ag0dal0jtOskiiSUlLiTGgMeouQiNhFmL+t0U/5qstFPjchvO775N5VbrFPslqOS
         jhGc9OeYDu4tKkJ03ZQPTKfMtJdigCt9Qz7eQo1MckKVvPOEryfvRuDl0ujl1AEpTKSY
         58U4Bf/jy0wFE9jtyTqUckoJ1wvR30lW4A+QNP3vbHBd0SGnnvsraHZPL79Sp9ZL5LS6
         a6qbmAINxV1MBTepALX6biKCJ5SlYZXiCiBq7bH8v9K1M2mJbVsyS/306+oIcWMo59rS
         aX1bJevgLixNlJYrb+r4nhiBcNvzLapPQ3+KfNFEtIm4jsr0cJOv3PfWQgpmSoOnYrHL
         K7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783416133; x=1784020933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2InzJMBKoHl7JVhFO+rX+aFvUpIrUtHbvFpQlkWzNFk=;
        b=RSijHRALTmDxyBk0QnJ88+aFihLoFl1G5h8OY8ux4bo99u3OwyEGtp8Xic1UC5PD3E
         eOUoN1TCKLZQSLIbRui8A6paQ/LeTOGGBDJt8SujdzZIDuqgW6NZultE2k1xVVI3Da8J
         GwDfOfFaf5CtwsUeABZ1LE/OYl3FsbLQSaMNJlK86/IFkvOkpUKXWDU8Deiv8w6o/sku
         N1e5YR3wBbhbqKcA6kNv31ruvbnS7D/AEh2TlW/UTh+GNXibAhVqFIEXT/SpFn+TPZNR
         +WvoCsTqHHo4IGf0Jpd2pj4N94lNtm8h6d2JtDm0NMjnitV+xj8XeyNUh6FAQIfq+J1w
         X8Kg==
X-Forwarded-Encrypted: i=1; AHgh+RqOJ0oDlkjwApSWa6jwBupNqzJ2H5JIXLQC6HMEAd5suZEZYoI/ImGsUoLIz8Tfhbem+TqmeRT3xPYC@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/8412tj9eWEXFlhuuFf0NJUjfQ/vKG4w7BBmXPecOch/abS/M
	iyDEBY670qwfxHkK9rg19iyuqN5VLZO5EF+SBYBFbmOzn22POrk/G14YjxiZ0+U2cBcUKwO3ykN
	qlme7nD+eRm/dxYtssZ3R+VF3exh0O5HeOtDdNznCfbyxaOoxMTmOTJmaFVsbdh6q
X-Gm-Gg: AfdE7ckbpJjns4QSxybBh0IHnRYjBdmBOda2DXqeNi/l+08l3+LzK06VcX01cecNE4p
	RNjI5kapS9aHXj9M64MpvMHADYhHDx/8CV5D8OWtYx7xIDuXI+D5BP5VH/wJppFqa0RRHtX5ODZ
	Wqj1zSmn57BuOcVm/c4zi2pWodSCETtukD90vABCcFAnu4aNvlo04cno+iri/PJhp6zkgRfrYET
	knkhxUISuWXSkQTljK8Z2fRBngsZph2KyIEjgv0Ii+lEjGsjgvlUcAL8VUMAL5a+FRu9iGqvrgL
	CAXPC1RkuXMIasn2t+uSM4fUpqgll2DVB8Zs1TjHVPk777rwyMIFKO4zl+d4/58tYI8HvYkyRjv
	UFRZCa6B/SV6f95FHLf/G+6lilhCidF25rWG+WfU=
X-Received: by 2002:a05:6a21:1b85:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3c08ef051a0mr5861201637.35.1783416132726;
        Tue, 07 Jul 2026 02:22:12 -0700 (PDT)
X-Received: by 2002:a05:6a21:1b85:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3c08ef051a0mr5861153637.35.1783416132179;
        Tue, 07 Jul 2026 02:22:12 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afdb7534sm658864a12.12.2026.07.07.02.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:22:11 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 14:51:35 +0530
Subject: [PATCH v4 3/7] irqchip/qcom-pdc: Differentiate between direct SPI
 and GPIO as SPI
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-hamoa_pdc_v3-v4-3-dfd1f4a3ae89@oss.qualcomm.com>
References: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
In-Reply-To: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783416112; l=4238;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=D0sOlcjYWpVb4KW1woV12cTMyxTCQuYuBDIGFgr0z8Q=;
 b=1pX9sNDj1Pci8+qfn41oZdkQXZRGfcZizRvaXxJLxdF+NyAL7KnT9upuPoV1wdOnWugMNhjlC
 7SUuYKr16nMAnatdA8xm4avp5jkcwU14z6qcfSqQXA5nWw/lqlw7WFo
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX2it3+PX2I2by
 N631cJsdLK4IGy9SXEfT8u3q0v5M0mXyBPHGd0QE6a2RRSFcF3t+7uj+N5ALFkrB7RMhjZRfKHN
 +aya357Xknk09amgtssI02JFr4/GpNUrlkjAYZ7pegmAoWUkD3LH3LW8f9r2eDvLYsrEebnB2a7
 NHObeNsehEh8l8mKeRvnuOhsCLmIMY4hcnDvCRt0FXkGYJjAWP9DqL0qJMTpB4uPwgOGvQP3bqG
 lghFFUJbQ5o0Jh7iNHREQU1SyR0ixBNJd61n68oWmW6B0sq+IWNm4i7PdKOPid+iQpyRfo2lHjq
 adAEgacO1HZT6E7UiYgTubfiM+Af4FfUJvQVE8gzoJm+aELhbRTrSNXw453jb9YN9a6xVd3OOSY
 5n+z2dUaaD3Mzm3i4bATZDAX3FTbXrjqM+fmpuL9xxdxchE/AjM72PkSfZ+QoYB15AWfPE6+LMv
 9YEU+8FdZMw3KvSHv7w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfXyBxcKeSJoQRj
 UTIzb/BRP5EFk6HQftcNSFcs9+GX7VrPtoEF8yEynJngkDYvJIod+I9YJraiZtSPFf+wcOM+Y/N
 Sqj2s5HrCTOBvMT4JkHIyDVFRyp+KUQ=
X-Proofpoint-GUID: PlxaO0KuoyoXrcEWvF9xgluSeKk3Svim
X-Proofpoint-ORIG-GUID: PlxaO0KuoyoXrcEWvF9xgluSeKk3Svim
X-Authority-Analysis: v=2.4 cv=HN7z0Itv c=1 sm=1 tr=0 ts=6a4cc545 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=l_4bIUA77Uey-hlc_bsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070090

Before commit 4dc70713dc24 ("irqchip/qcom-pdc: Kill non-wakeup irqdomain")
there were separate domains for direct SPIs and GPIOs used as SPIs.
Separate domains can be useful in case the irqchip wants to differentiate
both of them. Since the commit unified both the domains there is no way to
differentiate.

In preparation to add the second level interrupt controller support where
GPIO interrupts get latched at PDC (but not direct SPIs) there is a need to
differentiate between SPIs and GPIOs as SPIs. Reverting above commit does
not seem a good option which leads to waste of resources.

PDC HW have the IRQ_PARAM register telling number of direct SPIs and number
of GPIOs as SPIs. Further PDC allocates direct SPIs at the beginning and
all GPIOs as SPIs are allocated at the end. This information can be used in
driver to differentiate them.

Add the support to read this register and keep this information in
struct pdc_desc. Later change utilizes same.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 764f7965cfb8..53a477aa9765 100644
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
@@ -92,6 +99,7 @@ struct pdc_irq_cfg {
  * @base:           PDC base register for DRV2 / HLOS
  * @prev_base:      PDC DRV1 base, applicable only for x1e RTL bug.
  * @version:        PDC version
+ * @num_spis:       Total number of direct SPI interrupts
  * @region:         PDC interrupt continuous range
  * @region_cnt:     Total PDC ranges
  * @x1e_quirk:      x1e H/W Bug handling
@@ -104,6 +112,7 @@ struct pdc_desc {
 	void __iomem			*base;
 	void __iomem			*prev_base;
 	u32				version;
+	u32				num_spis;
 
 	struct pdc_pin_region		*region;
 	int				region_cnt;
@@ -120,6 +129,7 @@ struct pdc_desc {
 
 static const struct pdc_regs pdc_v3_2 = {
 	.irq_cfg_reg	= 0x110,
+	.irq_param_reg	= 0x100c,
 };
 
 static const struct pdc_irq_cfg pdc_cfg_v3_2 = {
@@ -130,6 +140,7 @@ static const struct pdc_irq_cfg pdc_cfg_v3_2 = {
 static const struct pdc_regs pdc_v3_0 = {
 	.irq_en_reg	= 0x10,
 	.irq_cfg_reg	= 0x110,
+	.irq_param_reg	= 0x100c,
 };
 
 static const struct pdc_irq_cfg pdc_cfg_v3_0 = {
@@ -139,6 +150,7 @@ static const struct pdc_irq_cfg pdc_cfg_v3_0 = {
 static const struct pdc_regs pdc_v2_7 = {
 	.irq_en_reg	= 0x10,
 	.irq_cfg_reg	= 0x110,
+	.irq_param_reg	= 0x100c,
 };
 
 static const struct pdc_irq_cfg pdc_cfg_v2_7 = {
@@ -445,6 +457,7 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 	struct device *dev = &pdev->dev;
 	resource_size_t res_size;
 	struct resource res;
+	u32 irq_param;
 	int ret;
 
 	/* compat with old sm8150 DT which had very small region for PDC */
@@ -501,6 +514,9 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 		pdc->x1e_quirk = true;
 	}
 
+	irq_param = pdc_reg_read(pdc->regs->irq_param_reg, 0);
+	pdc->num_spis = FIELD_GET(GENMASK(7, 0), irq_param);
+
 	parent_domain = irq_find_host(parent);
 	if (!parent_domain) {
 		pr_err("%pOF: unable to find PDC's parent domain\n", node);

-- 
2.43.0

