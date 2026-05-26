Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CB43DE45B
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779792916; cv=none; b=jkEHR40G+m1NNH6mhKIfN68DInDjTmvN5In5u9y7S/PPedTHoSTxGl9e6Di0wbaMteAE5zghFBlVFBZ5JRtfXuq7JHAEn2HDMYERyZSFol4xvH9M3kk3q5ehMY0QKuV0kn16I9tPT385JY/OuUOl7xpDeXtaFJyLyFwVKJwi4iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779792916; c=relaxed/simple;
	bh=oPVVerd8VwkRL0dCsp2to4ylu4kTf3679RMzqtne6Qw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UWXfg0MprLrpvSBDTyi+rbGJxljQAs5UWZZrh+w997iEY+PyARdROyUKkwM+MbJoLoazfYC7n81fkFPD6pZ0TjYOYDsFIvooXI+yOMKCbGW5xWyC9K1nxbkr0QD31Z20jj3rcFSekxI+rwynhbEHTNf0XT5h953NeEv+M3SA1Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n90L1ha7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LE2qierw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n90L1ha7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LE2qierw"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q8Kpen3603895
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NMDjZhVwWUDdO7pyrj0PM44BL0c/yKjHT0Nw2YFXwXE=; b=n90L1ha7YGe6UtDL
	BnOhO90eLVl77DhUz+tsk2gArTDxqA/WKM4xXAjbRMtBMNZ5ENBeuvLRPLQVzgIA
	/DDV2Oz20jIvipth6gZo+0Ewua+hN8XPSdc45krkNXGFAeQNNhAiBkcnxjnpTRP0
	pRMOrEt4yJl1O+ZUWRZW7GNiJxICm3aJ4sN5VoSx2WPKpMKi50Y24zZTihadL1z0
	7rIeBw9ZCCwu+jr2sJ3RpTbEckxzU0hgTHZOe8Sq1lWx6scHOKjfpOwoygnRztNk
	J3bHUdF64jAApnsOTuNEKFLTwjcYcyPftHIVOWrS7tmdWDvOu4APa7Kw5FdGW1TR
	yrhU+A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpyqknjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:55:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba224c3ffdso240463935ad.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 03:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779792913; x=1780397713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NMDjZhVwWUDdO7pyrj0PM44BL0c/yKjHT0Nw2YFXwXE=;
        b=LE2qierw2FN6i1xaL2uI5ryKi+N/RtMe1x7aVD59p3Oj/cK8tWaSG26CkmIFNHCH3y
         9TU2c04I4lk/+aeloGvVR+r+OAslIxp2me7kigjmkezIyqwhCzQwrlQ45rgcznqajCgG
         5NWqEqPsJUlp4Hjb8DQj74amm3/CZcfBUmm4ShOPKwNpGXLDdob8iM+qQBQ1w10h9ah1
         1RaWW2ZYkJ3gUoD66dYBuw7mLJCptxaIksXeeDqHJAuTZlqs7gs91B4+16mUwbp5DaWr
         Ja3jy1+f5QoQB0NUZ12k2lPn37VbVT0nasETR2maLaK8qsp4jGLS9FsQxLG0EvZqtKQs
         bbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779792913; x=1780397713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NMDjZhVwWUDdO7pyrj0PM44BL0c/yKjHT0Nw2YFXwXE=;
        b=n0aGHtydO9/XvEz12PzuyREPR29OtWmfBqNFY9qSfjtoyCxNly2Q77RTRhaBomzEPw
         kHneaiUh4zHuAYKleHtyUR3WmyUK/XX8hUid/tzNA+txokxccZCwYMSvsaYXqFjxyeJU
         1hSOgNmkBATgZ0lcwyTITMSilLR5gwVDPSLkz4vYQVMELUoaN0GqPAug+M5/FSvItm4m
         X5UkM2TQptXJbdDl0/nJjOzC1aM8/rOKQitCZcSGc3it+I/duLt3wYM15XBC2igZueVC
         ghU2sOutGUJQIq+iOvIaqlFI4kjd7b9v+W/0ZIxIrpUrko02n0gXX6qtqR03/Y650lne
         jIDw==
X-Forwarded-Encrypted: i=1; AFNElJ/NsLC/W7DRIr6joxw294XXf8WfLxZJyo9yvRO7gY8209R6c16ZjHHxF63FpeotnLLlxoqBGILsoUXs@vger.kernel.org
X-Gm-Message-State: AOJu0YwSQlFEq8mHhY4ROMiJeGypFbR2OLQyMfy5JNG9uWnBc4txKwEa
	d9EGIXCdqe4FmjYOpR2SD8tytIp78ukuEXSBzCIzoiK0jkgIxA8JOXozNN9ajum8WT5czRL25xO
	WnntiHkWVlEWOzdnFnFdjSMw/baBJ8XCi+PR6a/k2WSIQNY3z33vG6wFt3ZYM7EVdh/bCjfDr
X-Gm-Gg: Acq92OGEiaxWJTFqOJ1uQILQ0W/B9AYO8pFi9f3Njy3plI7Fkl+5p071sBuoAsWlOYK
	18zHQprOL4EhwnYVpoLxuBbIv6xnAg0DPsfublyGcONlqRElh+Zv3M41ESGvmtDANXirOLjfg2S
	ejM8K0bghZEkeh11lXx0PVZYi6mhDw9v5PZRvEeNKenDt2PP9YcPEfV+gH7AOZxPrynHYcZvJt5
	5gUOutKA6ZJ4VHsGDv8MoNIsfIPkTxSD0fOLeO1hy0Dz9iWK4NKyD22rttqiXiaXjDjwu/1+bwt
	v5ClMRAMkPkrdVby82aN0+Vwp3RMP1J1WoPW2Zc/RLzCCocc+zIHrIzRgg7HtQv6uSLjbevD3mv
	mS0pa3iFcAqqVRv4vGBF+iJJd5qTcacg7VIIfbdA5CLxukxXxWw==
X-Received: by 2002:a17:903:2f4f:b0:2b4:5f69:715d with SMTP id d9443c01a7336-2beb05d9d8emr205687105ad.25.1779792913356;
        Tue, 26 May 2026 03:55:13 -0700 (PDT)
X-Received: by 2002:a17:903:2f4f:b0:2b4:5f69:715d with SMTP id d9443c01a7336-2beb05d9d8emr205686735ad.25.1779792912781;
        Tue, 26 May 2026 03:55:12 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f3dsm120890025ad.1.2026.05.26.03.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 03:55:12 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 26 May 2026 16:24:39 +0530
Subject: [PATCH v2 3/8] irqchip/qcom-pdc: Remove pdc_enable_intr() wrapper
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-hamoa_pdc-v2-3-f6857af1ce91@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779792895; l=2309;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=oPVVerd8VwkRL0dCsp2to4ylu4kTf3679RMzqtne6Qw=;
 b=qbSAKqDqjMJ0a6D9aC5+ljyMg6nu5adn5PXk+hld7ZUJg+IDRj4FhKZumzXP1ByhnP5AaHSTU
 Kd0M6IBlU8CDzDlBrZQcawNhozyWbC0spHHefeiLQ0pQuk/Hu+77mZB
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a157c11 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Xxqy2RvYwch7BrGjxoAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: B26UcXxzh9wtGjWKGUx6DFSuUl-9P8Wv
X-Proofpoint-ORIG-GUID: B26UcXxzh9wtGjWKGUx6DFSuUl-9P8Wv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5NSBTYWx0ZWRfX5O/wRrBZI3WO
 wjN4K536eCn3sxprWpPaGdkpRXGXxed82GCHG6jrDIpdcuU1ibxNJwzNFCuHIuRl0VPQHs7pDnh
 rmdWzB885VNJOssA2BSHtzPmuFJeJwYm/sjkM5Rfo7zBsqJ2RM+8/L5rgHds2hFrqYlcY65XgtN
 Vx94dRpG9jbxUCH5h5Z5MTcoszySoHe7l6Z6YpVynP78vqbEuhIr3dkuxHl3NTcQ+BV9Qv9IyGr
 vKF+8JVUa2i4yooI29iTXkw9TSTdwKrWVdLkkImIacLKFSW1MkXCfxlZp9uHtr1OhpDMcvxTXcI
 FWFYQXf/8CGVDFbbSd33ZPzI6i4RehZKgpIZZT2dWTV5M3IfaHdFkb+mPFnPsxMGQWfxKEdy1dM
 Wz4U/T/vTwAbJnqjzV1mBrf9WMmQz/6eE9595TYjlKdXhakDjG0iklKivHhbZrE81v7BCeBPh/W
 CHhGnmZ+rkHwSF8ItrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260095

pdc->enable_intr() function already points to respective version
specific enable function. pdc_enable_intr() now only kept as wrapper.
Remove the wrapper and invoke pdc->enable_intr() from caller.

Locking in pdc_enable_intr() applies lock to all pdc->enable_intr()
however its only required for pdc_enable_intr_bank() which uses
a shared bank across all interrupts. pdc_enable_intr_cfg() do not
required locking as IRQ_CFG registers are one per interrupt. Move
locking accordingly.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 8f7802139e4e..db76737646e1 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -201,11 +201,14 @@ static void pdc_x1e_irq_enable_write(u32 bank, u32 enable)
 static void pdc_enable_intr_bank(int pin_out, bool on)
 {
 	unsigned long enable;
+	unsigned long flags;
 	u32 index, mask;
 
 	index = FIELD_GET(GENMASK(31, 5), pin_out);
 	mask = FIELD_GET(GENMASK(4, 0), pin_out);
 
+	raw_spin_lock_irqsave(&pdc->lock, flags);
+
 	enable = pdc_reg_read(pdc->regs->irq_en_reg, index);
 	__assign_bit(mask, &enable, on);
 
@@ -213,6 +216,8 @@ static void pdc_enable_intr_bank(int pin_out, bool on)
 		pdc_x1e_irq_enable_write(index, enable);
 	else
 		pdc_reg_write(pdc->regs->irq_en_reg, index, enable);
+
+	raw_spin_unlock_irqrestore(&pdc->lock, flags);
 }
 
 static void pdc_enable_intr_cfg(int pin_out, bool on)
@@ -227,24 +232,15 @@ static void pdc_enable_intr_cfg(int pin_out, bool on)
 	pdc_reg_write(pdc->regs->irq_cfg_reg, pin_out, enable);
 }
 
-static void pdc_enable_intr(struct irq_data *d, bool on)
-{
-	unsigned long flags;
-
-	raw_spin_lock_irqsave(&pdc->lock, flags);
-	pdc->enable_intr(d->hwirq, on);
-	raw_spin_unlock_irqrestore(&pdc->lock, flags);
-}
-
 static void qcom_pdc_gic_disable(struct irq_data *d)
 {
-	pdc_enable_intr(d, false);
+	pdc->enable_intr(d->hwirq, false);
 	irq_chip_disable_parent(d);
 }
 
 static void qcom_pdc_gic_enable(struct irq_data *d)
 {
-	pdc_enable_intr(d, true);
+	pdc->enable_intr(d->hwirq, true);
 	irq_chip_enable_parent(d);
 }
 

-- 
2.43.0

