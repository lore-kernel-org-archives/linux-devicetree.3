Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B6351AEDF
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058169; cv=none; b=TcIVKs2SqlPs5szGwbWOmnJSGlqYlDauiu62PNC4Gh2Btyuu5IXtNlWDITa0ugKFfa5bsYxoNLMTUHz9x8Jc+iFfL29DJmYRb4HMzlKXiCFvuTKJ6ZyocWC8cOpsGR/LrgHb7xH0w38SaE8zoa9nqRVRtNfLjPAwE7nHO6sUpm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058169; c=relaxed/simple;
	bh=QqnyGyqGJI3ins848hnKP9SiU5N5LGOKRYQENWIDFSo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B6KnPvXT8y+1RBGCyIl3Sctyd+0E2ju1SJafB6S/T+MGwPsP8KYxMNTG8zZ56HlBn7yHH9+0o0fSz1Mkx4aQ8b6KdzcfSkOqcSB6ObHAS/Sdk+gxzzJKV29vulwbe6aEIT5+c67dLA5rvl/xcjBd0l0GzhD2WbIPqfhLxPbS8iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WGHK3e/o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N6HqYR+P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WGHK3e/o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N6HqYR+P"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jnXq3408836
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZRD/xN3TucBoLNNB/bKS0C4EK+D5ovD1+wi6B4JcpiA=; b=WGHK3e/oFJJfCbVm
	zR7C0DhEiSBbEr+Edr1kG8xyl8TcmnN2GSZiyFJkn914gZ151JRLlHkLtqdF1i2m
	tmFMoWXKH/VgoAQcNx1rFogXpLF3IOpvuoOcW6MOKbKv1pLtPq1SAcTdYQ8swfT3
	EkU0JFrrr5Fk3t4tiDXn59RkI9n/bGbIO9+6r0oXcAEzhU3GE7fO6utOqr5pRxjV
	DsELKiXj4sCktmVKAzrJ5h3uAU8C8FXGGnhbtPbXWe8hsVHZvAu5uZf8AGUQBNLR
	kyCnSQRvpBjP7bOn8WHFPdEjcGYwsZSINa5vP4JAH6kVcgeAjdm3u38OBMIhClIh
	e+oMVA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn254n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:55:55 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso9155660eec.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058155; x=1792662955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZRD/xN3TucBoLNNB/bKS0C4EK+D5ovD1+wi6B4JcpiA=;
        b=N6HqYR+PRutv/4+T2H7eKjJZYVpbR18tKUqDvlZmJULYhpcTNaOiUb8vwAPjWvj4oj
         uE6XBKQdRXfwff+hUjqbAb/dgCxPzGxdo4y2thfalKEnHtP7jAbiGrQntsSVDcvJGc9U
         td9CzXL1dQV6aeAFlsYa3BhK59EkX06P1srq59sPlsyakzY/1l85gKNQdc6V10TzaHL2
         GJ5EoEylD2iqenHA0zVoytMKLXQoaCAJw65tyq0LwzXp4s4wQ8MNHBLP7dMFWr5dLBSl
         WVyVmrAyXKnOTQv6SqSDhsSHPmE9e2CZ3kPPOZyDMdPgo0rt/C7QMsaVaIWuvxLwd2PK
         rqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058155; x=1792662955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZRD/xN3TucBoLNNB/bKS0C4EK+D5ovD1+wi6B4JcpiA=;
        b=bAEV1BYAi5pxbH3GKQLjWjEATXQy8Sk9XGP+Tf1mxBoqVPRCJwYV2jucccjCc3s8p/
         BKFvotYlPyAVzq+ns+1gaUHng9e88XE5Xc9KOoayHJ+IqHJf37aY8tBzYSSp3T2vzc8Z
         CcLmhgDbT9e9cjyB82YxTkl2e28fBxqGjNJ4vrNQvZHdnRzzcOk16Vv8jbc0FxPNM76j
         e9wm6rHlRvPGGMLGRZJWAUXIMNOK3gPkZ1v1d5mbHJAADxHtqU5CsOQtirH3tQrZqEnU
         YEKhFwN8wISq9cM8WHbTX7ysuGXSPFJAtVT7YG03BjkHVZSsMeGMXknEHDk81ApLEFCP
         wZtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzx94G3M6KraQtM2sO4vdnHV5BDNh4ugiQsl6yy3gdZus/YtxFgQl5fv9Gf6fxHD4/xZxOYqY726fIK@vger.kernel.org
X-Gm-Message-State: AFq9FYLfrX4l52vbel0kLPDToRwV2vvOJ6iBxbo2+FttpN8SmDpN1U73
	ZZMoCJhy+w3Mh5QOazzU2WjnR4Hzgr0rTtnjrh4Han1sNy6O7q351UoNdWthuWk8RHmI1j99Yq+
	F9zM3eUjdfPWQxzX++rhd45yk8ahmyXi75Z31g1Qn3X+CLbPCPQu5IlzjMTAD/Vlt
X-Gm-Gg: AYBFou3mGPDbwS12mBHGrUMEw46gpTWVSgNyB1/TSsGQPhXIvrLbPnsO2u9brtpKyJ8
	1qRBL1pQEPsZnh08gLEI2o8vCE+uk+9c1no2qM9DBvFpoHz9xfieLf9hxAVfmu2Qas3Vbi11dbi
	2ogbqURCPUZDlWEYED+eeDhSM+fpV5N9QlyaAQTm89qKa2BsziAEpYLAJ5ojt7GMmlQVe2PsCHK
	xE6xXNnfzTo5ZaQVCEKhQzUUAgoJUUgBuRLs3tadbwYKCvHHmKb/w23/A9CrR4LXR0NdQR2vtld
	toHTMiEXW5Jo7VJjgMFJr3cDz2vZ8fRlA5XmhAeLoaMzAzrzZrRo/8qSLJGODKuDz15UfNOm98r
	IF7sfzew4/+2jUrN/7+3lM7Ms4uwz
X-Received: by 2002:a05:701b:2810:b0:143:2701:9198 with SMTP id a92af1059eb24-16a610c9c0fmr23935755c88.36.1792058154513;
        Thu, 15 Oct 2026 02:55:54 -0700 (PDT)
X-Received: by 2002:a05:701b:2810:b0:143:2701:9198 with SMTP id a92af1059eb24-16a610c9c0fmr23935703c88.36.1792058153000;
        Thu, 15 Oct 2026 02:55:53 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm84476533c88.18.2026.10.15.02.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:55:52 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:25:20 +0530
Subject: [PATCH v2 4/9] irqchip/irq-qcom-mpm: Prepare common access path
 for timer and pin regs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-shikra_lpm_addition-v2-4-ac7f1a0d5638@oss.qualcomm.com>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058122; l=2879;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=QqnyGyqGJI3ins848hnKP9SiU5N5LGOKRYQENWIDFSo=;
 b=kUj4K8H+/812w8y6hk9u6q85CN/ahAHrvTJngEOXl+UOJ9VSCJDKg0/Hx4noIeGANDsRbNLYs
 riFLI3fhEWVC3QMd2zS16g5/S6w7OE8Bk4tO+5zTwdrK8UW3yAsgOde
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX0yvT6t7h8wwx
 pjDziaXTAs1WRFKQv9nQMOEltYlV1HHnb4CmbomnvyazjXjRJhCFKsd3cnpDL5gE8s96ya/EAxT
 VbFpvqwa3WzcxdfjPgMXFHkcmWZIwqt50WQW7e6FgAd7uk3wMBujv8EivUHpuIHTVSL999B2qg5
 lsRvRGLZ93sYzDNSlrJ5izUf99DqB+O3KjA6K6KG0gZd9p7AGebHMG5CVbS7eYU+2nKLSFyaDR5
 owyzfP58X7Xb3tXQfFaK78Gy3w1JNlWNF7reVyS1AmH+wlIN5pLprtc4SB/uHUG5HvyoBnMCxtz
 slLWheHf4NIZ7tLWv3wNsrgCPzqfOiAYNkuHXn3IM1QLFdgJhHP1dvwTsPvUqQu9L23cgDUziGJ
 14ZljIBbmJgskViFuAtv996t6c/CGG/JumsVqWYjFzbWGj4KBTTbVTxZrM7ulkUcu+ZEU6WvDtD
 7linEbv5UdPgd6JvXzg==
X-Proofpoint-GUID: R0Q2DbGvUvXnQgRyYc39_2uy9Z7tCuDX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX/Kr/YyupjH3j
 TzYOHuKfs0zHYrw5fEume7MvvS0gt55DsmAQwJceo2238erZqwH2KEWzvrds+sR1wHRu1LeRjix
 wGvIm4jJlTNtC7ZKUQK+iGUFeFRxi6M=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad0a32b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=lTbGvRf64-BgIYWFXWcA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: R0Q2DbGvUvXnQgRyYc39_2uy9Z7tCuDX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150039

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
 drivers/irqchip/irq-qcom-mpm.c | 39 ++++++++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mpm.c
index a37c20a20bed34d4f55fbcc950ba39ab9799b7b5..0de6ce818a506efc07913b16c479b5d5efb15108 100644
--- a/drivers/irqchip/irq-qcom-mpm.c
+++ b/drivers/irqchip/irq-qcom-mpm.c
@@ -64,11 +64,16 @@
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
@@ -90,18 +95,30 @@ struct qcom_mpm_priv {
 	atomic_t cpus_in_pm;
 };
 
-static u32 qcom_mpm_read(struct qcom_mpm_priv *priv, unsigned int reg,
-			 unsigned int index)
+static unsigned int qcom_mpm_offset(struct qcom_mpm_priv *priv, enum qcom_mpm_reg reg,
+				    unsigned int index)
+{
+	unsigned int reg_offset = 0;
+
+	if (reg != MPM_REG_TIMER) {
+		reg_offset += MPM_TIMER_REGS;
+		reg_offset += (reg - MPM_REG_ENABLE) * priv->reg_stride;
+	}
+
+	return (reg_offset + index) * sizeof(u32);
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
 
@@ -142,7 +159,7 @@ static void qcom_mpm_unmask(struct irq_data *d)
 		irq_chip_unmask_parent(d);
 }
 
-static void mpm_set_type(struct qcom_mpm_priv *priv, bool set, unsigned int reg,
+static void mpm_set_type(struct qcom_mpm_priv *priv, bool set, enum qcom_mpm_reg reg,
 			 unsigned int index, unsigned int shift)
 {
 	unsigned long flags, val;

-- 
2.34.1

