Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982032;
	b=XyhsAJrA7fi+45oRwdDjKGGikZNKq3TRcXsqKMBpcCaixyvVk6aSEtFMFIQlfwITPS/W
	 FVeL/6Bd4bcxvIdXhEzBjvA8xN5iMeX5WXJD/CYMSC+6lnXz0pdpeEWmEtKG/kgGfxUBM
	 SNhYSmRkJykV/i0Gak0q6cM5tRRzZbHOSLT8U8dP3ROXEFlieXqRPEqyQqVga4SUb63sj
	 sc7veAOm0EiDb5F5lEn4Tt/u1UORpYbtCqtXw5urEF0nX2+YPj2yIvs7nXQdlQuvud4nO
	 fj1sGP305OuwQ9hQSZpMpNnoTNuO0GKuynjN258rYKnAlIzDrIPf6jSuO2k473n9yAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982032;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gW1cwmnx+UZv9BFAWitQV7byHeHaVyflC6wvXZvXB0w=;
	b=QIpRmVHO0S8HAomy0vU9blHF3gZdJJSnf31F2RBy9p09rHOVEJ0v9r6sT5c9abWtIJ/N
	 hvmRseiTLgRndUNlWWQwpLy2wuQ59X7yr+FhCzs7PNiVuSaMpDcPSiZ7H0wD+6qgjrYhK
	 UD+Zf5ibEGglEJ4m9VYFBChr4RCTI3LVruwkwXNrkDpfW+Z9JRkqV/cefgpQWfRSMluDo
	 0W0i4cNQ8anaefXybrPwCLE+BfYXqSU2q/VtsLdG8w2ir+4kCCsnNtAqdCAb3zjgQc10T
	 4pkAVtg+3tHNQtrD8HdCG32El+9dTYobXU+iFpk7t4xYNIyVARpPbAzhdNC99bUKFpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n1wkh3cs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RfpSkkjO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908AD606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 908AD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n1wkh3cs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RfpSkkjO
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uomj3371286
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:07:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gW1cwmnx+UZv9BFAWitQV7byHeHaVyflC6wvXZvXB0w=; b=n1wkh3cspR3YAudw
	jUR/+VB4/wKBtHU/RWvyUZYA/ozqzsfvR4ExHsQyNfPiHxWTi8phuYXykIhhcetf
	VZtAXS0FryCN8fhd4ZSepPR2YGXqZjFO0lJWjse126MgVVDPdyhy4+4YWWL7X5kp
	OpRb5eRNCCvYI04xnTmkKTnbvgxX8sZn12WZTvbHYXrN+I89mfNKIX1xvbgF2qjx
	mCm4Pk62gx9+HUnDfEERBo2dOOAx14bfEu3rbTl4yKDtZDQvA7Tqagx0r4EYaOV9
	ZneKGjpo4jTXP+b4Ipq7t9giwkH/MgeG1Zf4QeL8/fgujTntKMwuc0wz8cSeG3+1
	FzDGpw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8sfd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:07:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so475047a91.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982030; x=1795586830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gW1cwmnx+UZv9BFAWitQV7byHeHaVyflC6wvXZvXB0w=;
        b=RfpSkkjOxZf1DkJ1j9s8VcP+R06Zo1uPt9a1dHFztE+LQpUo7s3daMNf9Un/N/r4z3
         ffF/obWyUmLh35jWCFKq/TQxRIwzpBYcWdCpMrJOnRMqgrswE4A0xtCBLEFqlguWYiJQ
         F19To5NeA/4JiFEqZBXjpuogdAkzNJZ1DdZ9jiaqS0j6roKMxLn/7F6g6T2YTetRT1QK
         ElICBh+dRoP1bCgG+G4XgjXEeVD/wrmfr8qRZEOZnI80Oov/uei7YEic+dPkx0pTb8HV
         T2HQ7GhGeRkI9B5Lvc8bkbu+O3V6Bi+k/h9hv+gQ+MzS5vdLpuBMUYiejw8aU18PBpPW
         UbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982030; x=1795586830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gW1cwmnx+UZv9BFAWitQV7byHeHaVyflC6wvXZvXB0w=;
        b=RZk4067AXMuEX2a+4M7h34o7juZ/Lb3KxoyyyL0cJjdhGrqCtEXSkyuzs1lPWOgwfx
         rdw7eGQH5C9yKVZvdKv5xi6S4tFkiWAix9NPXOGSUtW+lLxHR1OU1ONw05CT/ah910Mp
         z7x7e2WeJgDo//wvs0h77t3L3ZU64/jarrpPqJApyp8Ypn3W0XIYfak3NNatWQ0pl0Mj
         f/Q6pKk2ZYYshT6JC/cQBzmWoXJpofKCCV+guonc1LFGJtBb94E0DAieuxKzcZ9ti2vA
         SrkbqJzko7EU6wK6Arq1ylhBG0jB7wwbXCpNvMS1A3gvZgBGid2/hCoMEyVO8gGMxfM2
         dR+g==
X-Forwarded-Encrypted: i=1; AL+hErFJEqRlWjrpnd/4qfSjLTFzd/KdJDYWa3k5dfYLpl0naYL9WC2+trD1fqaa1z/kSBxD0bStu7EUETyH@vger.kernel.org
X-Gm-Message-State: APuU4Z9t6eVldUMYOfKSJheCLsm9o1ZS0a+R6iJ0X/nvRYiIhhIBqliy
	JN5ZhqkUR065VZ9d6DHN21o4YuuUGGjvMPlqXfGGOYpbCG8DPg1LJrNCZXPbQbhEV4XwDlJ/hGJ
	UBhSyFu4ke7pr1fyBssAPxDybPC/kWM1a0cW3WGedSCHBm8DdAyMevwsMQC03m39G
X-Gm-Gg: AZFdTZcKWDhk1cgNKj6ploavpDtpHK/+uDrBf6TnUWdr3HoBUZeaTAPk++tU+Za/J2O
	bZMAQ6wHL7fwnEcV8gZm+Ho/DzYg4pcbDX1iAHJ1l22Vwxm56jMyf4fwvs8m0c+RnhhqWsSkG2E
	wNRYMp9pYU+vjlSdk7JfaXZkVtzPxK8pHdOL2UsFhwvT0JseHAZUJCjNaI08IrcxVk5/XQNnRPv
	c8YIGa6MFK1XHlWNX7D8G18fvTPF+lt7p9qBkABPaMhvTeVYl1yaJh4/8SBZe8W1CMypJeQ7ZhI
	ikOaZ7WtmwDoR1khzUCqAyywo8VTAeWEDbpPiZ6nurRs18pa2Jzqdd1et2wywhXTYZBJMgTiiEE
	1wk8wrYA5+ipZxzculGVozZfrOzgMv9LnIIjUS6rsiv9NROZUja8MsjGuSNgJhL0EEK7fbncGxQ
	DHGnU=
X-Received: by 2002:a17:90a:dfc8:b0:3a6:f1d2:57f8 with SMTP id 98e67ed59e1d1-3b3d06a4a99mr1641409a91.2.1794982029814;
        Tue, 17 Nov 2026 22:07:09 -0800 (PST)
X-Received: by 2002:a17:90a:dfc8:b0:3a6:f1d2:57f8 with SMTP id 98e67ed59e1d1-3b3d06a4a99mr1641388a91.2.1794982029266;
        Tue, 17 Nov 2026 22:07:09 -0800 (PST)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abb786ecsm7476382a91.2.2026.11.17.22.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:07:08 -0800 (PST)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:36:18 +0530
Subject: [PATCH v4 1/2] irqchip: irq-qcom-mpm: Register MPM with cpu_pm for
 RPM notification
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-b4-shikra_lpm_addition-v4-1-46ee87e22576@oss.qualcomm.com>
References: <20261118-b4-shikra_lpm_addition-v4-0-46ee87e22576@oss.qualcomm.com>
In-Reply-To: <20261118-b4-shikra_lpm_addition-v4-0-46ee87e22576@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794982017; l=6532;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=1nPE6pBBUxkFLJ0rhvjZWQHDg5ZiwkVhjD+deyj8UWU=;
 b=hwgPZPuAZgl2DF7fKHIkmt6id3bmx16Wu9LKenTevW3RXeWswtcnPol5i9kwpqH5fRq15dE2p
 A7kvyvyjE09AKi1OZml0aQiUULB11nsqDaRyz0d6w5Syr5lgUI4gAyJ
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd408e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8 a=EUspDBNiAAAA:8 a=lt-0Ylhkz4Il63NEeiEA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: qBHpBP9rPPVB-X3aIUAM6NnJL6vUbyzx
X-Proofpoint-ORIG-GUID: qBHpBP9rPPVB-X3aIUAM6NnJL6vUbyzx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX9o4rlwOdte9w
 8WMwtpjPh4WU1ypvPigxJkIy4dp2lw3dWAQ4sJlijrMKLu31JSYf1gBW6oKVC5wUdHysmPeR71W
 Q66kTmQ+CXHwa74q6eeXTwJhZiJbsQs7HG1FGiUQF4DClR+3ow4a9Ap3o+7UYmnLMcUolwkHwvZ
 mX41AM9FKPRVbOm+l3DVVWh4GaPbGYnJAFnD2GgM+4A7Fu6cKNz0PFMXSSI8/vd1Whe4p7eSKaW
 01NyJGQlP3XRxiOuEeEB6+FSJ/gJbtJHjJgTw9XlWsX3wQLwFVln2HIbhkm0xfXdeHBUTruO0aL
 GltGDr77eNZfu2F8WsDjshgBAZp3+tPplJqqQeGY+JEQiLw2ZaQzWO7lQy6p1CqZ4Nh/jp+QiG5
 Kj/beRBabG/CXL+mR4IRE20KBfP2wzubp4qSlskktTEcZSLECgEW70XhM5B6GW0zGMMkXMW55Dp
 R98lAg5dl6tl6dqaEug==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX/croWZn9V65X
 6uabqACu/TlQer/lDrZUvetyexDiWjG3gdaYxfEsi8xlxsN5U8ZPJVqdIwozdRm/pS5EEedZ9xj
 1GpZ0WxxMcERRHM8kWpSzFLPd7k9GAA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180024

MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
the latest wake up capable interrupts when the CPU cluster is entering the
deepest idle state. This is done by sending IPC interrupt to RPM and is
implemented as .power_off() callback by registering MPM as parent power
domain to CPU cluster.

Such implementation earlier introduced a hard probe dependency between MPM
irqchip and CPU cluster power domains. That is MPM irqchip needs to finish
probe before PSCI power domains are probed.

The above problem has since been resolved after bd7f488a8e5d ("cpuidle:
psci: Fix support for probe deferral by dropping the faux device") / [1].
However, it makes sense to remodel the RPM notification in MPM irqchip due
to general consistency.

MPM is not really a power domain provider, all it needs is a notification
when CPU cluster is going to power collapse to carry out the RPM
notification. We can register for CPU_PM notifications for that purpose.
This way we can avoid such unrelated dependencies.

We cannot register MPM under CPU cluster power domain and rely on
GENPD notifications here, since that way cluster low power modes will be
blocked whenever some consumer of MPM, and in turn MPM itself, are
runtime active. This will add another unnecessary dependency for CPU
cluster low power modes.

For now as first step, register with cpu_pm as a fallback to manage RPM
notification. Trigger the RPM notification when the last CPU in CPU cluster
goes to power collapse.

[1] https://lore.kernel.org/all/20260909134240.685115374@linuxfoundation.org

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/irqchip/irq-qcom-mpm.c | 106 +++++++++++++++++++++++++++++++----------
 1 file changed, 81 insertions(+), 25 deletions(-)

diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mpm.c
index 181320528a47ac1bde6cf7d2d0a9f79499990092..b837be1cce0e571de983799c4b7f2228f11d04fa 100644
--- a/drivers/irqchip/irq-qcom-mpm.c
+++ b/drivers/irqchip/irq-qcom-mpm.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2010-2020, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/cpu_pm.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -85,6 +86,8 @@ struct qcom_mpm_priv {
 	unsigned int reg_stride;
 	struct irq_domain *domain;
 	struct generic_pm_domain genpd;
+	struct notifier_block mpm_pm;
+	atomic_t cpus_in_pm;
 };
 
 static u32 qcom_mpm_read(struct qcom_mpm_priv *priv, unsigned int reg,
@@ -292,10 +295,8 @@ static irqreturn_t qcom_mpm_handler(int irq, void *dev_id)
 	return ret;
 }
 
-static int mpm_pd_power_off(struct generic_pm_domain *genpd)
+static int handle_rpm_notification(struct qcom_mpm_priv *priv)
 {
-	struct qcom_mpm_priv *priv = container_of(genpd, struct qcom_mpm_priv,
-						  genpd);
 	int i, ret;
 
 	for (i = 0; i < priv->reg_stride; i++)
@@ -311,6 +312,50 @@ static int mpm_pd_power_off(struct generic_pm_domain *genpd)
 	return 0;
 }
 
+static int mpm_pd_power_off(struct generic_pm_domain *genpd)
+{
+	struct qcom_mpm_priv *priv = container_of(genpd, struct qcom_mpm_priv, genpd);
+
+	return handle_rpm_notification(priv);
+}
+
+static int mpm_cpu_pm_callback(struct notifier_block *nfb, unsigned long action, void *v)
+{
+	struct qcom_mpm_priv *priv = container_of(nfb, struct qcom_mpm_priv, mpm_pm);
+	int cpus_in_pm;
+
+	switch (action) {
+	case CPU_PM_ENTER:
+		cpus_in_pm = atomic_inc_return(&priv->cpus_in_pm);
+		/*
+		 * NOTE: comments for num_online_cpus() point out that it's
+		 * only a snapshot so we need to be careful. It should be OK
+		 * for us to use, though.  It's important for us not to miss
+		 * if we're the last CPU going down so it would only be a
+		 * problem if a CPU went offline right after we did the check
+		 * AND that CPU was not idle AND that CPU was the last non-idle
+		 * CPU. That can't happen. CPUs would have to come out of idle
+		 * before the CPU could go offline.
+		 */
+		if (cpus_in_pm < num_online_cpus())
+			return NOTIFY_OK;
+		break;
+	case CPU_PM_ENTER_FAILED:
+	case CPU_PM_EXIT:
+		atomic_dec(&priv->cpus_in_pm);
+		return NOTIFY_OK;
+	default:
+		return NOTIFY_DONE;
+	}
+
+	if (handle_rpm_notification(priv)) {
+		atomic_dec(&priv->cpus_in_pm);
+		return NOTIFY_BAD;
+	}
+
+	return NOTIFY_OK;
+}
+
 static bool gic_hwirq_is_mapped(struct mpm_gic_map *maps, int cnt, u32 hwirq)
 {
 	int i;
@@ -415,26 +460,6 @@ static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *pare
 	if (irq < 0)
 		return irq;
 
-	genpd = &priv->genpd;
-	genpd->flags = GENPD_FLAG_IRQ_SAFE;
-	genpd->power_off = mpm_pd_power_off;
-
-	genpd->name = devm_kasprintf(dev, GFP_KERNEL, "%s", dev_name(dev));
-	if (!genpd->name)
-		return -ENOMEM;
-
-	ret = pm_genpd_init(genpd, NULL, false);
-	if (ret) {
-		dev_err(dev, "failed to init genpd: %d\n", ret);
-		return ret;
-	}
-
-	ret = of_genpd_add_provider_simple(np, genpd);
-	if (ret) {
-		dev_err(dev, "failed to add genpd provider: %d\n", ret);
-		goto remove_genpd;
-	}
-
 	priv->mbox_client.dev = dev;
 	priv->mbox_client.knows_txdone = true;
 	priv->mbox_chan = mbox_request_channel(&priv->mbox_client, 0);
@@ -469,14 +494,45 @@ static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *pare
 		goto remove_domain;
 	}
 
+	if (of_find_property(np, "#power-domain-cells", NULL)) {
+		genpd = &priv->genpd;
+		genpd->flags = GENPD_FLAG_IRQ_SAFE;
+		genpd->power_off = mpm_pd_power_off;
+
+		genpd->name = devm_kasprintf(dev, GFP_KERNEL, "%s", dev_name(dev));
+		if (!genpd->name) {
+			ret = -ENOMEM;
+			goto remove_domain;
+		}
+
+		ret = pm_genpd_init(genpd, NULL, false);
+		if (ret) {
+			dev_err(dev, "failed to init genpd: %d\n", ret);
+			goto remove_domain;
+		}
+
+		ret = of_genpd_add_provider_simple(np, genpd);
+		if (ret) {
+			dev_err(dev, "failed to add genpd provider: %d\n", ret);
+			goto remove_genpd;
+		}
+	} else {
+		priv->mpm_pm.notifier_call = mpm_cpu_pm_callback;
+		ret = cpu_pm_register_notifier(&priv->mpm_pm);
+		if (ret) {
+			dev_err(dev, "failed to register for CPU_PM notifications: %d\n", ret);
+			goto remove_domain;
+		}
+	}
+
 	return 0;
 
+remove_genpd:
+	pm_genpd_remove(genpd);
 remove_domain:
 	irq_domain_remove(priv->domain);
 free_mbox:
 	mbox_free_channel(priv->mbox_chan);
-remove_genpd:
-	pm_genpd_remove(genpd);
 	return ret;
 }
 

-- 
2.34.1

