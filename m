Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79BC46AA97
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 10:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974029; cv=none; b=mQTBN8JXh0npg18+e1A6+UO9fUimJBN7J3C93k8U+CB8rLh9yWuxiZlLRDq1rJPLHKCHAm7EJjFGqlgvGx3uxOiAoRxK/PNX1wJSpqQehBJWO8tcbZrgHIwOg7FPLLS672yS0Fm0tlb1vRwkQl0Ech3R3+7ufA3/n1MgYatGUqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974029; c=relaxed/simple;
	bh=Je+/S3Krr5x0GVQZJtan8Mc7Lyn70k/cvzcTCsIoalU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cNwghvy7PyV016isjRsvJciCL/VSdjvjv5HrhWNreH7HZ7V8ZgdxtXN8PE2B8XyESY7HXVBQ5BOrKifhUb6pZVAtYqw7wAlI3GQK1vJpmeh/Y/fHuSBOvLzQZ3+11ZmrUFHhTJhefkBVeCP0sKW/raq8QVYWGOF/3h7qWqxkJ0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mh+j/zmu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j/ki3jNe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mh+j/zmu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j/ki3jNe"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E96xgu3000871
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 10:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8+uLJubZPXH5QAjk3jwiDYPBdU4F6iL1qIbMHVJ0SiU=; b=Mh+j/zmuRSBOzpmD
	WvogjqMi3j2j14u+Tf57AJ/W1BBLIzIWcrMtdrsIhjnfODiLAoAPtZaJClebIPdT
	h82EsK9xBMoMaRBClDUZiMlEZaD/VzITxiULmhhrmudTI+Eg5T1BkspFf5o+CaGW
	SfdjkT1WNBMy/ic3UMTnyXVbi2BVkF1Bh8RYuYad7Up4qpkLqHbf5JqtA6NbN2/r
	wEL/urT+Wjpqu5GFjyde8WSs0ZM4bi4Rt4CPa/0v29kEMMFYCjHd73L/Lp8ggK4Q
	LC0+EQQIy+EdejgHaMIbDKrQdEJJ/GwWnrfOB9bSgpqroJZRfFKPkgRraomtWpgZ
	qCK/5Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sbeugqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 10:33:46 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ccacc75a997so500519a12.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 03:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791974026; x=1792578826; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8+uLJubZPXH5QAjk3jwiDYPBdU4F6iL1qIbMHVJ0SiU=;
        b=j/ki3jNe7Dx1cxlIVMiF6QcyHdijK8Fg5epD+VihOuf4UoGosq1QE794ELvpnYEoI0
         AOPdibwsZnYlNey5iinBwwjJ9Ly3uwjXa76jyeiYN3/47pOzYDx+y29hszN34++IyFhf
         0rKS4/fpOYh1j743GhJnBIGYrVsWI/9AnY+FXE2Y7mrvunVjJnmzTOf/So4TZywIWxae
         3ibXiKrK50F3tpRRVUXMIRBCTvcpsYb6deTcSeq3xDjaZw+DCB1mKq6DcGgFZLXAeRWc
         V1Kp6A7UvXiLZO2EN2mv4Azefl314J+GOIQl2M2vToe+xXiFRyFhpgSgHCmzp7retP6H
         0zbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791974026; x=1792578826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+uLJubZPXH5QAjk3jwiDYPBdU4F6iL1qIbMHVJ0SiU=;
        b=X2OkmBDARsJzcQZA3qG/lIHl3hBB+5svcvpsfXKVvlSNlzhLg8rKTy08e/ZODU2T4W
         o1vWlusIBQ1o+HZ9drga9+OYVMnbKRiKGQzP/u+4qzs6w3ATM0DUG9hdZTGvCYY8IdAT
         W6jwzxSwhmKGjDwEZdxevz9brBisBwGxwBxo4F3JljacBYLi34hVXdaZCBXRtlwl9+Tq
         Rn8vEgwMgz3GI+H0s6ZiBUgjWRoHTNyngX3Iv/FjdJgKki6qQSp2TLp4u9GzXBMqdhOX
         0v2C6UbSaKiRaFTbcU8UiGgwXng277b3GQSFrhiUNAUtGklxRv9blgvQvDJhtObZTudg
         gGqA==
X-Forwarded-Encrypted: i=1; AKwUvByWM5H5bWQ3/vUDub1p0YuzLRwrQ9BEi6rL5ubDtiBaG7WnWXNfQsB5tl6ma1FyNWUfeovJ60De8uXQ@vger.kernel.org
X-Gm-Message-State: AFq9FYIqDWwNI120edER+K5Zovb5RlIu2MHZCrGQ9diL31xj3+J+uJMZ
	GI3Dn0t8shhjrauwxmz3JKnVMgOmSLOQKW7Uww9OiDjyHuJeRJBy2hBBzQha8V9Yu7WMU5bMbDe
	IBUJlG9LDDXf7/8lEv4+jlH1h32TpEAv4gqkbuASaR0/Z7BoDa4XPbTntJiZuoIBp
X-Gm-Gg: AYBFou37lkfighuP30ZR5+TQOAyKyydTcsqSKPuOMhKev43RCibDyCRwEFGfrE4Mk6I
	RHtVBgJx7tym004WNoDAnPB28oSpJRqqcRBEPdXmNDRtV7HTpCGwNy/+Y7hMnlvVGatCMSiyngH
	sMpGYt9Au5W860tTdmQYFVrB3FIzuzj35yUOOLAvxKrROqiRONzAAsaLu8Zv6hwebESF9LVFpFr
	s+Rxw4ZKmoTA7B+LzMHjsbwbErjeAfCtxc2xwTpf7HYFMfR+jlAzGShEfCevGkmeTzhsUm1fMQs
	N+ufRVEZUKnMaqZTCHxSKRTbs2LcnKBhkjzciH/KvGvw1lRP/qjP1U0BSCIb7FDF+EEOSVPlzF8
	ZtsARaT/KFd96YoF5QR4=
X-Received: by 2002:a05:6a20:6a0e:b0:3e1:34f7:f9c2 with SMTP id adf61e73a8af0-3e16becf667mr12458818637.54.1791974026157;
        Wed, 14 Oct 2026 03:33:46 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a0e:b0:3e1:34f7:f9c2 with SMTP id adf61e73a8af0-3e16becf667mr12458790637.54.1791974025684;
        Wed, 14 Oct 2026 03:33:45 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e08905sm6822382a12.9.2026.10.14.03.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:33:44 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:02:02 +0530
Subject: [PATCH v2 5/7] mfd: qcom-pm8008: Add PM8010 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-pm8010_i2c_support-v2-5-b395d2b3f668@oss.qualcomm.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
In-Reply-To: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791973985; l=5366;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=XLE3nTQQxA/7Ri7FJFjDgMenYUnWsbuRJB0fiFu8QBM=;
 b=KujPagSFwOcZD+IFNVdHlRsEvG6rGmDBle/S+ue+ajpK5+MoL1KbhF20ZZ+DcUZcbsw2nuNDa
 hBVng9p8P+FBzAmDEsg757jKLpb5uhJp0psni2JOxXWoB7JihE9rmM6
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-ORIG-GUID: tNn9kWtQLtfDfPRVVLt9oAU-G3vRfLpE
X-Proofpoint-GUID: tNn9kWtQLtfDfPRVVLt9oAU-G3vRfLpE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfX773sTIAzeJlQ
 lHaIWFrQVO7rvV/e2zK5Q1jarkcTWdS8jFtoAitVFOMaDFRZS3Dp/O293PvLWgSjNaDpGQxoy3t
 JGWdHRtGtHcOfWdpNNDRZeF5z34cBImjGAupWEDnD4TY6jVwg3ePvLiwB8KczmhnEyYIpGA/jc8
 KUniEJAzjTaUMRLNTIfSVcR3jaMjC+lhVnK7wnEEhzaBfvwyqOWLG460sRWhehtuyWQsrIwXzZL
 ezhxH4yoNKRzbRLT/W7suv8qORJ2MMW8YvH4gxf67jqSNpEjoR6ivixGSgum2K2801IUkOJxbzu
 SUSDDkbaXsMb/OGXJ/Krs1M9IOKv0ZvIDRoOHQmsNQV7161UkOAUloOY0stR7bPkQ9fGG2xRMOX
 NkvZ3rpqPWYey82le5B7QOqNkDseZhRjX8TADc7/zEQuI8OyOjfaPbdr8hX6mlaN9/MdZxU2CV9
 GN7JlqLzNhEXu2fg3ng==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfX/9KufLjJQBV5
 cqyByj85tZiUzZm4GA95rDGgGZdCefNqN0PSoJwxIt4yQ3cVo1yPzZQEE05TBs0iQUkmvbIYeWf
 gD39gVOralnv8H6FnMclXuxe22OgB3c=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6acf5a8a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=LamtlsxKl8ZIB2y8LWQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140041

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

PM8010 is effectively the next generation of PM8008. The device is
generally designed to serve the exact same function - power camera
sensors and the associated supporting hardware.

PM8010 supports both I2C and SPMI communications. The latter case is
already handled, since it reuses the same peripherals as other PMICs.
The I2C front-end is more less the same to the one of PM8008.

Plumb in the necessary changes to support it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/mfd/qcom-pm8008.c | 69 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 65 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 2d6c01cf54f3..4179427f3891 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -34,6 +34,11 @@ enum {
 	PM8008_NUM_PERIPHS,
 };
 
+enum pm8008_chip_type {
+	TYPE_PM8008,
+	TYPE_PM8010,
+};
+
 #define PM8008_PERIPH_0_BASE	0x900
 #define PM8008_PERIPH_1_BASE	0x2400
 
@@ -47,6 +52,9 @@ enum {
 #define PM8008_IRQ_MISC_LDO_OCP	4
 #define PM8008_IRQ_TEMP_ALARM	5
 
+#define PM8010_IRQ_MISC_MBG_FAULT	0
+#define PM8010_IRQ_MISC_LDO_OCP		4
+
 enum {
 	SET_TYPE_INDEX,
 	POLARITY_HI_INDEX,
@@ -78,6 +86,12 @@ static const struct regmap_irq pm8008_irqs[] = {
 	_IRQ(PM8008_IRQ_TEMP_ALARM,   PM8008_TEMP_ALARM,BIT(0), IRQ_TYPE_SENSE_MASK),
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
@@ -146,6 +160,25 @@ static const struct regmap_irq_chip pm8008_irq_chip = {
 	.get_irq_reg		= pm8008_get_irq_reg,
 };
 
+static const struct regmap_irq_chip pm8010_irq_chip = {
+	.name			= "pm8010",
+	.main_status		= I2C_INTR_STATUS_BASE,
+	.num_main_regs		= 1,
+	.irqs			= pm8010_irqs,
+	.num_irqs		= ARRAY_SIZE(pm8010_irqs),
+	.num_regs		= PM8008_NUM_PERIPHS,
+	.status_base		= INT_LATCHED_STS_OFFSET,
+	.mask_base		= INT_EN_CLR_OFFSET,
+	.unmask_base		= INT_EN_SET_OFFSET,
+	.mask_unmask_non_inverted = true,
+	.ack_base		= INT_LATCHED_CLR_OFFSET,
+	.config_base		= pm8008_config_regs,
+	.num_config_bases	= ARRAY_SIZE(pm8008_config_regs),
+	.num_config_regs	= PM8008_NUM_PERIPHS,
+	.set_type_config	= pm8008_set_type_config,
+	.get_irq_reg		= pm8008_get_irq_reg,
+};
+
 static const struct regmap_config qcom_mfd_regmap_cfg = {
 	.name		= "primary",
 	.reg_bits	= 16,
@@ -170,6 +203,11 @@ static const struct mfd_cell pm8008_cells[] = {
 	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
 };
 
+static const struct mfd_cell pm8010_cells[] = {
+	MFD_CELL_NAME("pm8010-regulator"),
+	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
+};
+
 static void devm_irq_domain_fwnode_release(void *data)
 {
 	struct fwnode_handle *fwnode = data;
@@ -180,14 +218,36 @@ static void devm_irq_domain_fwnode_release(void *data)
 static int pm8008_probe(struct i2c_client *client)
 {
 	struct regmap_irq_chip_data *irq_data;
+	const struct regmap_irq_chip *irq_chip_desc;
 	struct device *dev = &client->dev;
+	const struct mfd_cell *mfd_cells;
 	struct regmap *regmap, *regmap2;
 	struct fwnode_handle *fwnode;
 	struct i2c_client *dummy;
 	struct gpio_desc *reset;
+	unsigned long pmic_type;
+	int num_mfd_cells;
 	char *name;
 	int ret;
 
+	pmic_type = (unsigned long)of_device_get_match_data(dev);
+
+	switch (pmic_type) {
+	case TYPE_PM8008:
+		irq_chip_desc = &pm8008_irq_chip;
+		mfd_cells = pm8008_cells;
+		num_mfd_cells = ARRAY_SIZE(pm8008_cells);
+		break;
+	case TYPE_PM8010:
+		irq_chip_desc = &pm8010_irq_chip;
+		mfd_cells = pm8010_cells;
+		num_mfd_cells = ARRAY_SIZE(pm8010_cells);
+		break;
+	default:
+		dev_err(dev, "Unknown device type: %lu\n", pmic_type);
+		return -EINVAL;
+	}
+
 	dummy = devm_i2c_new_dummy_device(dev, client->adapter, client->addr + 1);
 	if (IS_ERR(dummy)) {
 		ret = PTR_ERR(dummy);
@@ -233,19 +293,20 @@ static int pm8008_probe(struct i2c_client *client)
 		return ret;
 
 	ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
-				IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
+				IRQF_SHARED, 0, irq_chip_desc, &irq_data);
 	if (ret) {
 		dev_err(dev, "failed to add IRQ chip: %d\n", ret);
 		return ret;
 	}
 
-	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, pm8008_cells,
-				ARRAY_SIZE(pm8008_cells), NULL, 0,
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, mfd_cells,
+				num_mfd_cells, NULL, 0,
 				regmap_irq_get_domain(irq_data));
 }
 
 static const struct of_device_id pm8008_match[] = {
-	{ .compatible = "qcom,pm8008", },
+	{ .compatible = "qcom,pm8008", .data = (void *)TYPE_PM8008, },
+	{ .compatible = "qcom,pm8010-i2c", .data = (void *)TYPE_PM8010, },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, pm8008_match);

-- 
2.43.0

