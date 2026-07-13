Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D516A3EA955
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938380; cv=none; b=Z+8XKqlslcp2tQRAxqpv47xmbdkBop/YZxZC1Y5IlA2oz+cyE4zaS9mVjAWy5Te4ZDSe0Djlh8LjYLmM+3vndwDrtOOJbGQ4RE7ENh8ZB5zV6q8G14cAsFo2G+PrGHV/4WOtCldBlynka48PrBiR8qOhKx7aoJeOfLrt7xXlV8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938380; c=relaxed/simple;
	bh=8bsRgBVyAMOmy/SwlppHPk3z00uNAJT+Hv0VOSWqUXI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WnkcgOFm0Kn8dQ0bZZ2lvsKIMmxTRMytblq7AnaoWKLbHB9hQH8G2QmkB3RyhgseW10KBNWp4OqLyAds7KSB2X2FlRRfiN8Uc1mwNATAUeR22HhUN8vPYdNOvis1NwrQXVyA91uRHc0vLYo5muxON3zwxGfSezqLVOFbALokg6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S2eoXy2O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fAroZetO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S2eoXy2O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fAroZetO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9ugX81089817
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I4ukWEC6EkRevgK/M2ooVzj1d4/9KXAX+yGWKOo8Vog=; b=S2eoXy2O5qov9G0F
	QTziADaZuesOIkWpKdypmWmlQIN7bKXsrgohYTtJQF61aRBxndB64q49n+tgmLQA
	d3om9PYlqi0JT79f9aztQGJbqMjQHqI08U7bKm9VAeVYFtFSi7tJa9b/BnAMxdvH
	QYpfKtokwoB9tSzTMxMuYCBwwWsiPsaA5CMF0M5f7C3cZc8S77sgHBGmBbXQ9N39
	f2ctyN/eeb0oRbFFMvkvo6MH/ka8yXWhT9zx1Qwo8WZwbDixJEvDREsrlteK2agj
	4lnYYQ6HMIKpc8haRjkESbboBtQvjZz2vvEWBjK1bhc/y6DFgkV3vEv+agiNLwsM
	CO4KKA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwu4r3b3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dad28e86eso4622368a91.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 03:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783938377; x=1784543177; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I4ukWEC6EkRevgK/M2ooVzj1d4/9KXAX+yGWKOo8Vog=;
        b=fAroZetOQJ058GkFhCQYlCjaWlFuAy0aSgIA4luyKIoJbpf89xElFKupp9B419pdVv
         QImjcw1Ew5+auK4Uy120p5xNbVjfMevQ1EMjNtf/95/lrwLa6mPXmTkiTH5YDhzEFp7m
         jOIRJXeXswY9f18eI6kQEGxn7PuP8VdZlUEQPTACljhfMrMnJRTGHPInL7qfSODH18AQ
         8Y2d33ZVaRfENFaFri0AgcFkjYFxZUkZfhQxc65FXwUuafiR5My7SX5pa4gW6Rn436Qw
         ra2TA4zwjjEW7Qtkkz7SthZuDDwEeNge64PLJn7x7ubVa4jAOkp/m1iGFCrnEBeSRHZC
         9hHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938377; x=1784543177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4ukWEC6EkRevgK/M2ooVzj1d4/9KXAX+yGWKOo8Vog=;
        b=srZwdiNdCtno6wcsUWZQ9coSKLALnv3WpQCrRvUELOXm23XYuYvtoL0fExt4OVDf9M
         RnfyvKzMbutwCkZDr3Dxq1zWbNOMWnnwdGdYwIrV/o/oABY5lHarcLYzoAqy/QAMB6uH
         GSNEDZ8mF3yXwu3qfwmgxiVBj6eOl98H22wBPkE/kRKIIzL3eZ92WSWnDjVWkXaKS3DG
         R3fMtBI0UNqlXS5wF2ufUu0V5TiOXVpOgtbEMK99SSU2YZhXPndXV1Ab548ez8Y3Bjfy
         b8HzicFxnSyxKni6RmVFlYAWXgS0LOR9y8H0F/LeveXsYLxcyRgnoLLyyd6a9T9/imOR
         cASQ==
X-Forwarded-Encrypted: i=1; AHgh+RrmiSVczdti9Hfx1TN1TAyix8akIBNVgsmy/JeKp0troCbRw2udl5f61D18tLhWM3pqL/8GXs0E60ya@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5kpkbMFOLdlxLndH3T52yTa8TtrNij0c0PGrqC633N0qiIoDK
	sEv4cKRo0Ji1rJHJpz7bMA2+7ngEU6jBGqIzKEeDoMBqxhojs84PtQeDmzQPgWO8a/Zd6G6VVp5
	QNu31KiRZB9/ll58LWdU/KomMbxILA15ar6UShEo2MRwbtvbBPYtAOoV93+OpbWv1
X-Gm-Gg: AfdE7cnV0iSc7eDTv0U37b70OV8YElgeJU8rsZJL0xaHNEiO9EefyOb0EDlx4BBj77O
	3I/iRBgSpdm8ekN++c6AVFfV0kXw1ch3iWOLjvobGGsvluSwtPgyO8cBYqez/QJGswzcHLYsqx4
	EFAuGaSCOVNjtZhTqDeBrVAuFQvQCsvRvG6kplvT52C7zHHoafVPfQGcBkyhEmc7AxygY2pnsvy
	7C2zDZLCHN8oBUrm3QVV0pX3MqR1EIOxwNqmL7z4+dWeN0TdTHV7F4uqG2Cq/UCWYDl3YcJv2PY
	A7d40BgzffukFueeDwynFKN2GsO7J1gSQOYgW6gNJZ7XtWbFbw4IyS2p7eBLe69DgZDwSR0nPKy
	lD4Ue1BN8sZt5iwnOXqBpZ+AvVZ/NFUVm1pj/RVzm
X-Received: by 2002:a05:6a20:6a09:b0:3bf:d0c8:2a8b with SMTP id adf61e73a8af0-3c110160b71mr8725843637.20.1783938376968;
        Mon, 13 Jul 2026 03:26:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a09:b0:3bf:d0c8:2a8b with SMTP id adf61e73a8af0-3c110160b71mr8725815637.20.1783938376553;
        Mon, 13 Jul 2026 03:26:16 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b924258a2sm49010603c88.1.2026.07.13.03.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 03:26:16 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:55:43 +0530
Subject: [PATCH 3/7] irqchip/irq-qcom-mpm: Prepare common access path for
 timer and pin regs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-shikra_lpm_addition-v1-3-3d858df2cbbf@oss.qualcomm.com>
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
In-Reply-To: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783938358; l=3598;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=8bsRgBVyAMOmy/SwlppHPk3z00uNAJT+Hv0VOSWqUXI=;
 b=3T6USNmicRXSCrdUybYcQQjYxJ8w93f60KvFRy/Baiw9Y7w/pxexISbx7soZyZUFWMwnE3ht3
 EyHD11SlWgpDzvcXWsZlOJqg4u0NqsWmtUZUy7AvMRD5hbIdQNBWqSJ
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=FMErAeos c=1 sm=1 tr=0 ts=6a54bd49 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=rc4BuqHPY2vEHf5WpjwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX6AzH+0fVqGNX
 eJeiGQQVzndHExEbUUdFXhVb4cgQs7HckgxhsQ83I3Vcvi2FWy7InGHhlr3Jc2BZSUVgDSWs0in
 bVkPbg2XST00Z50uPXzKPinuHwzbh90=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfXzQonmyvd6OZD
 LVDTr1xUs9zRbwBakgtKUbMdAtbK/1SXEgw4wmgAf5c/gpbrXcIUjxssi9LcRgNCvjq7552OO+I
 NsV4S8QuCyfG1MgV9cT2P5PEpS5YLceq/cv3AQVZZqVpzkyItsuC1R6VLy++Uqk8qxS+fTixRW4
 FI2bYaQduxGq4twLZ8+96elnxPYHQUfyTnRoJRa3/W6ODeReYF/giwLMi2SNEoDPunZ6AWjJ9iG
 FhDaW96dDxitT+/ki1LnNpetmK9QnN/kbgIcHIgA/q5qTsl44UEVkTUOtGdDGMECMlSaskOgqgA
 2dQFa7e5WkRTJ0234LpdAFIdcxwutCu5IFH46oejmiA2m4th/u2bJTsJawNXErlYXf5g2xcbOUr
 N0eYkXRGgvC9+6xQeHnv70z87DnjyhKYHZBE1vjPNir+wFixKn2oaHQq48z4hSSuvrnnah4GQ1N
 II7xRID3XKhxK68OD2A==
X-Proofpoint-ORIG-GUID: Axal7heXMKbngtc18LBG5SxtEjtfcksc
X-Proofpoint-GUID: Axal7heXMKbngtc18LBG5SxtEjtfcksc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130108

The vMPM layout starts with two timer registers followed by pin register
banks (ENABLE/FALLING/RISING/POLARITY/STATUS), each with reg_stride
number of entries.

Use qcom_mpm_offset() as the common addressing helper for both timer and
pin register accesses based on that layout.

vMPM has MPM_REG_* values represented as contiguous register IDs,
hence replace the macros with enum qcom_mpm_reg and modify the accessor
helpers accordingly.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/irqchip/irq-qcom-mpm.c | 48 ++++++++++++++++++++++++++++++------------
 1 file changed, 35 insertions(+), 13 deletions(-)

diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mpm.c
index 01fd1843172aa22760d359281e39f0d9394bab6d..763eddee99dc4cdd5edab22ce54808528f9ef165 100644
--- a/drivers/irqchip/irq-qcom-mpm.c
+++ b/drivers/irqchip/irq-qcom-mpm.c
@@ -66,11 +66,16 @@
  *
  */
 
-#define MPM_REG_ENABLE		0
-#define MPM_REG_FALLING_EDGE	1
-#define MPM_REG_RISING_EDGE	2
-#define MPM_REG_POLARITY	3
-#define MPM_REG_STATUS		4
+#define MPM_TIMER_REGS	2
+
+enum qcom_mpm_reg {
+	MPM_REG_TIMER = 0,
+	MPM_REG_ENABLE,
+	MPM_REG_FALLING_EDGE,
+	MPM_REG_RISING_EDGE,
+	MPM_REG_POLARITY,
+	MPM_REG_STATUS,
+};
 
 /* MPM pin map to GIC hwirq */
 struct mpm_gic_map {
@@ -92,18 +97,36 @@ struct qcom_mpm_priv {
 	atomic_t cpus_in_pm;
 };
 
-static u32 qcom_mpm_read(struct qcom_mpm_priv *priv, unsigned int reg,
-			 unsigned int index)
+static unsigned int qcom_mpm_offset(struct qcom_mpm_priv *priv, enum qcom_mpm_reg reg,
+				    unsigned int index)
+{
+	unsigned int reg_offset;
+
+	/*
+	 * Per the vMPM register map, TIMER[0..1] starts at register index 0 and all pin-specific
+	 * registers start after the two TIMER regs. Pin-specific register IDs start at
+	 * MPM_REG_ENABLE, so subtract it to convert to a zero-based pin-register group index.
+	 */
+	if (reg == MPM_REG_TIMER)
+		reg_offset = index;
+	else
+		reg_offset = MPM_TIMER_REGS +
+			 (reg - MPM_REG_ENABLE) * priv->reg_stride + index;
+
+	return reg_offset * sizeof(u32);
+}
+
+static u32 qcom_mpm_read(struct qcom_mpm_priv *priv, enum qcom_mpm_reg reg, unsigned int index)
 {
-	unsigned int offset = (reg * priv->reg_stride + index + 2) * 4;
+	unsigned int offset = qcom_mpm_offset(priv, reg, index);
 
 	return readl_relaxed(priv->base + offset);
 }
 
-static void qcom_mpm_write(struct qcom_mpm_priv *priv, unsigned int reg,
+static void qcom_mpm_write(struct qcom_mpm_priv *priv, enum qcom_mpm_reg reg,
 			   unsigned int index, u32 val)
 {
-	unsigned int offset = (reg * priv->reg_stride + index + 2) * 4;
+	unsigned int offset = qcom_mpm_offset(priv, reg, index);
 
 	writel_relaxed(val, priv->base + offset);
 
@@ -144,7 +167,7 @@ static void qcom_mpm_unmask(struct irq_data *d)
 		irq_chip_unmask_parent(d);
 }
 
-static void mpm_set_type(struct qcom_mpm_priv *priv, bool set, unsigned int reg,
+static void mpm_set_type(struct qcom_mpm_priv *priv, bool set, enum qcom_mpm_reg reg,
 			 unsigned int index, unsigned int shift)
 {
 	unsigned long flags, val;
@@ -327,8 +350,7 @@ static int mpm_pd_power_cb(struct notifier_block *nb, unsigned long action, void
 	return NOTIFY_OK;
 }
 
-static int mpm_cpu_pm_callback(struct notifier_block *nfb,
-			       unsigned long action, void *v)
+static int mpm_cpu_pm_callback(struct notifier_block *nfb, unsigned long action, void *v)
 {
 	struct qcom_mpm_priv *priv = container_of(nfb, struct qcom_mpm_priv, mpm_pm);
 	int cpus_in_pm;

-- 
2.34.1

