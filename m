Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF583E8C78
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938387; cv=none; b=N8u0QtBPUPmGQvb3i6w124jah1Bu1/oTw0Z9ySxUphoDOsZmuOqeMf5tn8qGFKlFCwixX8cbUxjXvK3GzSnD2zWuKyPY3J2NfNnPoHElVx8e6jPXIDwI1YjDUVWOs5QVyPJOMwG7rAF37U+98QLGtGxM0QegOGH8h8Pf5RYC3aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938387; c=relaxed/simple;
	bh=uLoH9ML4xoEyk+JlPNhBQ9mrs8NyNN/05IZjbXRWkjc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jMV1kDEeUhxh8O//VmjH88D1J5iTmjzTHN0E7PH73RxDhADHMDZw5/HJ7M7GfYPoTOqCiOsYEpi8CKv398jzU0TEO8O2IwU41Bt6MJ60ai7hNuEaQsIb3GPpRAeKBG3FEum/6WCFyCybBLeVt/dKOg0lDgu1KI606lHT0xJ8Qwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pTWJDTsX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XFcW/mmU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pTWJDTsX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XFcW/mmU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9dTCa952870
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JLsaqQqcvPq68co61oGckxg0SVVesE3Nua0OxWCKCZ4=; b=pTWJDTsXBaUmBHKP
	nO7qmhwSy76xQYBI2PQjJtKLfvnmHUbfQoJf6RWeBPw3Pt9yWUNjzd2BInOmSBFg
	CIxYG4bUoz7PnASysY+WUqaRDcQICSnWF3fA+OH+KDhhGkc3z9Vz2XoxHne12O6a
	GzvwHz158stXceZIBz7OXk91cUfx4me8ugJY/dAQ88ARpMoC4sgz7GKHuASOErif
	YEGl8s41Rqcac2nHjkvdQmBEvbSvGmGz8UXxUld/xYngiOq7yaDLEad92oW9ShgO
	i0TymRDwXxNGITyD0YLA//STeUCBHVem7txa8yqShJv1vdOwTwcSG7gw2cg2LYCY
	l6+/Lg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3g5fg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:22 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab048cdb3eso2551241a12.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 03:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783938381; x=1784543181; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JLsaqQqcvPq68co61oGckxg0SVVesE3Nua0OxWCKCZ4=;
        b=XFcW/mmUYr1R2B7R55CH2gsbcoRFWr2lfYvzOJ3J/k7Bdapb249zzWYkOB4gWWWVf6
         VfCcAZe4ZamzWIgrHHlUqRzlJpzmHTYEHBDfmrR53f7MGGd5z0B9lHVTptkm5wWE3kEu
         D4baeVa4MoaqoLZ2TSLXkALnH7zrR5Q6j+w2cJ7K0loLqELsSCFIVbhP3/ZV0U9VWd6z
         xf9bnzzCoHkn6PtPHjIkBh072F4f9dpHnxfRWFPkSO6FrELj1yJn7ZFCyJDxXJbR/pzH
         2W0g2Za03j+hrUkHyufh4GaMGtyfswrOjz7O4kJlmXf+Vbipm7tkITvm2R/Jy4hTDteI
         R5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938381; x=1784543181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JLsaqQqcvPq68co61oGckxg0SVVesE3Nua0OxWCKCZ4=;
        b=ZcHFyFlDHF7SQH3qERp/qxAguGLLO/7hLPxhXkITTjPlUY9X9O31dRpEg+PW2nrdJ5
         7Z8obhEirs/gY2rlnUTmcbtOcLGXYtOAXlgMhurqdRaILCnZp/gOlbdg9GyYCuFh9M5L
         21pAGAJszpk68/zpPrDcyycAIQTeBP3YTeBNXZlVx/sn1fVMq78NvfRUQk2AuG/0oLFs
         Ad2NfJNKx67qTrHwN4kKxcyf27U/CDCN103z1B0EDewUA+J4xKyqNMnHcIhdQAFAZ5Vs
         IOGPCFmuCmslrsSqLU/Ia7kJkC55ZAGJ7rLawT4pwSOu8tSlFY0Kq02TOzAwnaqHuCsg
         r2rg==
X-Forwarded-Encrypted: i=1; AHgh+Roa6Gl2TAcHwBsIwyguXiUV4EcRNk3W7UOXpUJchMRYaeDzgwIbioUqb8/f64wA60PUEsB04BAbP8SG@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7BG31vH6pCVO8/AP1Xk7OtSSY7bUuhZI20fciJRqfv639+YEx
	j/wS2n9uw9Qwxw7quIy/KO8EfjmU5TT2cX+ONbRUxOSVuS/Mj+IxqNODKXI4Uf+Jnq+J2ey9EH7
	ykJELeS6DsxzTLTUV41/7t56tpdkIAqLVtsD2by+ONiBpUO4KW9MFblPzp7A0Rk8p
X-Gm-Gg: AfdE7ckR7ZNlFswfodDMkKE3CNplfWkLIGzHx/ZkXvpAD9z4jAExv93junOsbm61ZzU
	Nl99kj1B2BedkKekOBFyBF/2pQlDPbN23hDIrjgFLXmGS5bkUe92PRry+idkNafAun803MPWwmU
	bZVlhJKtfCQxufPOsoe49Y/xbx4cPptH0k8xoOQ+YhGfBUf1rebzKgbsL1UiFaIcAMoeP2y9UZ6
	z/jSR0OAhK8ep9ndjLEZ9lAYFFSGSJjtZAUmyiI/AzBArdLOttmYlaK59w0GUNYxuF2stzthFmQ
	VTVH70MuBGES5XP6UhjJ6R4SwBfD148uCd/h373KMIsdjlFgZzQYs7h74uTCT87EP35om2o91gL
	Kh9c2zhQ0Dc/ya5Tvkr/BtCKdEwlzMMiCssRoPpq+
X-Received: by 2002:a05:6a20:4322:b0:398:9379:d04d with SMTP id adf61e73a8af0-3c110a6e39fmr8192405637.24.1783938381334;
        Mon, 13 Jul 2026 03:26:21 -0700 (PDT)
X-Received: by 2002:a05:6a20:4322:b0:398:9379:d04d with SMTP id adf61e73a8af0-3c110a6e39fmr8192384637.24.1783938380883;
        Mon, 13 Jul 2026 03:26:20 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b924258a2sm49010603c88.1.2026.07.13.03.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 03:26:20 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:55:44 +0530
Subject: [PATCH 4/7] irqchip/irq-qcom-mpm: Program wakeup timer when CPU
 cluster goes to LPM
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-shikra_lpm_addition-v1-4-3d858df2cbbf@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783938358; l=3481;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=uLoH9ML4xoEyk+JlPNhBQ9mrs8NyNN/05IZjbXRWkjc=;
 b=sMuO9mLhY6GWDBg0jOsCEGp4lJzp0Gt2hYLVHKK8o8qkVXXyHhzXns+RDLbWWjMxgEqgBHo+1
 qLDerscoz30CvPE7o930ilYxc/14C6UDYRDRpCencsnuWAdVQZiShkq
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-ORIG-GUID: 81a_dDiry4G1djE6ruh5NSXy86CaOEft
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfXxiUNlFAx93cz
 mFRpS976+LIxfD6k4U8GgQcVoSqBlfQcpguPkZvVcIfI5jv+gDvvsZoPdJtkPeaSgaj2b/WqTSt
 eEyNkdDE9jRBsnbv0Jx+jYa0Av1lNXg=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a54bd4e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=LbuWhw6SlANFRBx-Z0gA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX7Q38e3UN57lW
 v9WVSETYRhiWtheON2imWyZb7tD8jqevrIumwt5CqlkA+57uUvp8sdaRvUS0HkNbg8bqwV/JulF
 v8Iv1larFl44xDsjuhmrpoU7BpJ2EplMf/5o5kX8EverMMchX60FO4/578Yqw8OfnVFnTgDxdT/
 D+ro8THNyNwZ0GyS6FWOIx2WK1TRwuTi21/JkXoSZ/ryDfhjeIS92m5ynkMrRYIvBIdOqqa/wzG
 ir19XoRYIeHDs32lvw4pcmsI16f0Lj7nguv2g80IYGsxdovF/2+2RDJzbnhcQQB3ux8iBlBR2RP
 0hno6Ry1Su1dfytnw1MXMKolVMw8/v60/NIl1caqTpuCox1SRCW+pCwuvB7PoSchfVZosGWIrjJ
 0gYHrdClbPdw9iQD45GeJTxJblpEpe2Q36ejqZosR4T1ePS+v9XJORLc84ulC9AfeAkv3cd1Bm+
 I1eavv9LL+nOAGAhnkA==
X-Proofpoint-GUID: 81a_dDiry4G1djE6ruh5NSXy86CaOEft
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130108

The next wakeup timer value needs to be set in MPM timer as the arch timer
interrupt can not wakeup the SoC if after the deepest CPUidle states the
SoC also enters deepest low power state.

To wakeup the SoC in such scenarios the earliest wakeup time is set in MPM
timer and the Resource Power Manager (RPM processor) takes care of setting
the timer in HW.

Add MPM timer programming when CPU cluster enters power collapse.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/irqchip/irq-qcom-mpm.c | 44 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mpm.c
index 763eddee99dc4cdd5edab22ce54808528f9ef165..f43c4a1c35f78b6cdae194dc7ae88c5c307ada94 100644
--- a/drivers/irqchip/irq-qcom-mpm.c
+++ b/drivers/irqchip/irq-qcom-mpm.c
@@ -13,6 +13,7 @@
 #include <linux/io.h>
 #include <linux/irqchip.h>
 #include <linux/irqdomain.h>
+#include <linux/ktime.h>
 #include <linux/mailbox_client.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -25,6 +26,8 @@
 #include <linux/soc/qcom/irq.h>
 #include <linux/spinlock.h>
 
+#include <clocksource/arm_arch_timer.h>
+
 /*
  * This is the driver for Qualcomm MPM (MSM Power Manager) interrupt controller,
  * which is commonly found on Qualcomm SoCs built on the RPM architecture.
@@ -77,6 +80,13 @@ enum qcom_mpm_reg {
 	MPM_REG_STATUS,
 };
 
+#define USECS_TO_CYCLES(time_usecs)	xloops_to_cycles((time_usecs) * 0x10C7UL)
+
+static inline unsigned long xloops_to_cycles(u64 xloops)
+{
+	return (xloops * loops_per_jiffy * HZ) >> 32;
+}
+
 /* MPM pin map to GIC hwirq */
 struct mpm_gic_map {
 	int pin;
@@ -84,6 +94,7 @@ struct mpm_gic_map {
 };
 
 struct qcom_mpm_priv {
+	struct device *dev;
 	void __iomem *base;
 	raw_spinlock_t lock;
 	struct mbox_client mbox_client;
@@ -320,6 +331,36 @@ static irqreturn_t qcom_mpm_handler(int irq, void *dev_id)
 	return ret;
 }
 
+static void mpm_write_next_wakeup(struct qcom_mpm_priv *priv)
+{
+	ktime_t now, wakeup = KTIME_MAX;
+	u64 wakeup_us, wakeup_cycles = ~0;
+	u32 lo, hi;
+
+	/* Set highest time when system (timekeeping) is suspended */
+	if (system_state == SYSTEM_SUSPEND)
+		goto exit;
+
+	/* Find the relative wakeup in kernel time scale */
+	wakeup = dev_pm_genpd_get_next_hrtimer(priv->dev);
+
+	/* Find the relative wakeup in kernel time scale */
+	now = ktime_get();
+	wakeup = ktime_sub(wakeup, now);
+	wakeup_us = ktime_to_us(wakeup);
+
+	/* Convert the wakeup to arch timer scale */
+	wakeup_cycles = USECS_TO_CYCLES(wakeup_us);
+	wakeup_cycles += arch_timer_read_counter();
+
+exit:
+	lo = wakeup_cycles;
+	hi = wakeup_cycles >> 32;
+
+	qcom_mpm_write(priv, MPM_REG_TIMER, 0, lo);
+	qcom_mpm_write(priv, MPM_REG_TIMER, 1, hi);
+}
+
 static int handle_rpm_notification(struct qcom_mpm_priv *priv)
 {
 	int i, ret;
@@ -332,6 +373,7 @@ static int handle_rpm_notification(struct qcom_mpm_priv *priv)
 	if (ret < 0)
 		return ret;
 
+	mpm_write_next_wakeup(priv);
 	mbox_client_txdone(priv->mbox_chan, 0);
 	return 0;
 }
@@ -412,6 +454,8 @@ static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *pare
 	if (!priv)
 		return -ENOMEM;
 
+	priv->dev = &pdev->dev;
+
 	ret = of_property_read_u32(np, "qcom,mpm-pin-count", &pin_cnt);
 	if (ret) {
 		dev_err(dev, "failed to read qcom,mpm-pin-count: %d\n", ret);

-- 
2.34.1

