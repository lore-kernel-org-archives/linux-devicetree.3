Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD9241C2F7
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 09:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781601983; cv=none; b=FWoe+h2LkohrJek1ufyuB++Hln13c0Xcys6luNm0At+Y6YAcZUXVwGLd6IDC+eKX7iVJFCWNgYScgGxj6egn8KcLRtjQSZhnJR6jU+YDOy+iUibAzMripjC8v5zOydk4Cck5WqodWTAW+Z7IuKamilQG1nscX+dj8b5bY1V3lv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781601983; c=relaxed/simple;
	bh=CSw3MXB3MdnZcW76whpqiX6ywOX1cQiyugQbEEpTRCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l5tl4o/CwO25MMrYKxIs6cL4hI4vSkB2QHvdtO8KpmBIY1UltzBCj7igyl00vCvWachGKWTnmm7YO5Idi2xY/XUqQXSbLsyYUENL0NGfN80iqj66TBH530q4y7JAAVeWieg7QEy4c15oRwHvUjgTdSF4w6cx2txlLd2HFrZzQcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OLbs50JT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYBVEFTN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OLbs50JT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LYBVEFTN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G65fo32699602
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 09:26:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WWYZBKYLsWJGMOldqyhsKHNnWOcJD8luOJTZdj5u1p4=; b=OLbs50JT3ko6lv0G
	cNWDEl/ewwvkTEts+t8LFu4H4SQKNckloOWZ2Ggw6rvXqPAXZWRmIlDaKVm+iwNE
	wi//gTfufWY/GfHGKreKaBiS3FJuGaZkutalFw362DFL1Ock8kZRJnxgV2yICd2s
	U0bOpM3+cnf+DUZq1hHv9cbvBw+bRSJ7pP2PO4Fmap7H4maY7gxZo5Zr3gfrbnDn
	PuzGslEgAgWhJ2uf6kBTvsnMaie16JPBFdz+noPx8Nyb//l+W3OpqpY9bGtczhtd
	6iebrH5vL2gpdS/BWMfmUP4YhRruDsmWRDyXsiSL0Q/fEEcuGKLR9Z0PwOH0jdh3
	UTGIbw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09k9143-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 09:26:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0bf6904a6so71526045ad.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 02:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781601978; x=1782206778; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WWYZBKYLsWJGMOldqyhsKHNnWOcJD8luOJTZdj5u1p4=;
        b=LYBVEFTNokK3dKXl8gb0eF+tvFj7HmjVT3hQo7JgS/F31eUrSPwxZVQ4hVooN1QkhS
         i254t4vCPgUEq4sjeGiiqKnklWsd9Lh/ZJBiCfWgvsyz/Rgih4TBrFBHMuhOTS/TmP8P
         m9NLyYq0x7MEPze8tRv21yldFX0awqT6sjKN2wGsCXc6sRFUqh7FxOas8OBv5YgSVLjb
         afH7uuCbnjDId7Ls2whwy7l53/Eajl4lRQVya74fpzGC1szhwuUpRoycnGSs4+KrHpMu
         U3MGkkSe6UvcyEFtsXfcUcU19qFJUzMDf3lWoz9gTetnuARMfhnx+auEhw5k6JWMwHa8
         MIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781601978; x=1782206778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WWYZBKYLsWJGMOldqyhsKHNnWOcJD8luOJTZdj5u1p4=;
        b=IutNi/BDTwvVxMuwYeHNJQjyyuoHNjsHw0oYc6z41BF0wlRcklqDZuqhuUjDMobro2
         Ek0RpOZk5clIRCr+8WwEBGe4IELE7+t5HLLhL8bp4KFUyjvqgoAX3v3xEtrPwAYnHDFJ
         FPrD2oRJk/tNWYkdQmrH0ZaXsbVeIFepzH7gzzRj3wp8ybgMz69YxSh1c1RcPWyQOsAe
         tIupoSggn6iBeixJ4sCE20y0ujGVjZUR+jNVj4hbttgZRevL0zgrTwbRNN0ARCOf0Dr7
         Pv+T6CHzXI5dKHyO16SAqAWMKHpiz9swYipuPiBqrVL2ONgzxRz7SRZPOPzd1t2zNHjr
         8mIw==
X-Forwarded-Encrypted: i=1; AFNElJ8dvOKMDV/d7WsbVDhXAlrCD58UFLRQ2vWo/L9T/yIKnW1yEuf8RVgnxFEkSezLgwxnI9pdhp5vKTlv@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1M/4tjC0wncV2D9e3du8fL3T1yIRbdEiUlUZS5iicFTlPYTGQ
	XLghZO8/m03harChmZhlaW1BKyVda4PdJM8bGwHJSmeDRAmojyQIXVyqtKOw5f+4SX/YtvQ6j4S
	ndCzehxpwPnexgQjgbxiqJRaiDFH5sc/GHFp3bM4M/nmisgHg0wNod8og2CUX4X+S
X-Gm-Gg: Acq92OFtDTzRRUJD4+aAgKBpibApOP4FX4bCC/4vNSnMs6mVd8L9SxkV0hJacX3+fim
	tsMjHyW1kPhllfrA4E4ZAFASoTB/lbOYxLNLkvCfofeUmEDQrODoY4XqabHIraSACNMxJfXNTAQ
	BvqVFVIr9UzSHepsMLBwVfwyIO83fy1mmecsh/MC2x3v6gwihaSwyWWSEtUMiZFlUzQ8ZkxCn49
	58RhCB8iJFXJTrNlYA84bJVIG/dvcJk+wJuDd/wl7inx4Tfqu8uKil9GPx+0qz/Sm87jLZDaasg
	1dbCaa2W+sdAOUF1z+V214WvxyIWsBuXYeHVobSzI007D7DF8ExOopd07UNi9/FTlQp5ycoC0Sw
	c5McNSeX4c9YRv2ydLGqHs1tZNwXTwX3FDhxG4GkZZjlgRD6Wyw==
X-Received: by 2002:a17:903:3b86:b0:2bf:114b:924 with SMTP id d9443c01a7336-2c69a1c83ddmr25910265ad.34.1781601978179;
        Tue, 16 Jun 2026 02:26:18 -0700 (PDT)
X-Received: by 2002:a17:903:3b86:b0:2bf:114b:924 with SMTP id d9443c01a7336-2c69a1c83ddmr25910045ad.34.1781601977753;
        Tue, 16 Jun 2026 02:26:17 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e586bsm130042025ad.12.2026.06.16.02.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 02:26:17 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:55:53 +0530
Subject: [PATCH v3 3/8] irqchip/qcom-pdc: Remove pdc_enable_intr() wrapper
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-hamoa_pdc_v3-v3-3-4d8e1504ea75@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781601959; l=1793;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=CSw3MXB3MdnZcW76whpqiX6ywOX1cQiyugQbEEpTRCs=;
 b=cbX7XyT/u8DvjLrvqyg2PFWay5po2rFtAxTJAE4ImX9XjlYmS/pMdjkJGSYdIFFDkJZ4Wu9YD
 uq1tZIvOopCBnZQU8wPq/tuEBMFk3+ZhorAC7VmLEDFwGAkcuJFRUwh
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA5NCBTYWx0ZWRfX6qacb88Dzfpc
 HpipJke0OK9wpq7qnKIV81OxZMPb+j4eUeJ6vQAqb9UufMbcbrrwU7N8qnvv56IpAONSUv4Gy/w
 7zSVMStMJfqvZHCevp1noJsYNbnosv8=
X-Proofpoint-GUID: L3lsXXVo67WTN1j95K7mYDLt8Y3bLO3X
X-Authority-Analysis: v=2.4 cv=DoZmPm/+ c=1 sm=1 tr=0 ts=6a3116bb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=X0Te3_zP_kP_59l6vBQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: L3lsXXVo67WTN1j95K7mYDLt8Y3bLO3X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA5NCBTYWx0ZWRfXypuxUJj3Vuoj
 PQ/EbJt2wb/wKmAJ+R0KwDLJPPKlhWCHS9H+ptAB8i0F7xmcKuyd8kbFcvWFwZzPS4pZYla3aUr
 HAAHIUe3ZWJTkPcNTB+fXG5v5klKe1zAwMPsNAw8VrQYlKETzkfEEsZshoNyNqgXzk3XKqshXXz
 Hbboqz+ZyEA4olyVyjhw3t+vyppBPtVJckU70TOLkYbrx3izoZ+cUtGrI/r0ociTFB+dvsAhH2C
 PlcxcxK+QjlNVQ+IFD4/UPlcYnBBsfpL6uAMBv3ikHPRwdSFDhh4p53yaveub9/m/jMEzxwY0ex
 Rkjkhb7ckGTW4ixVkURVzTaBKqjAY8cfiqZplKk59plE40HM/XEM1apzMsX4/nPbJRbSPMKOYD2
 EBL4fbS+Gw8SBjp2YAyqBiQ8KYOv8XFl+szz/nUH38XAE4sM842XmJ4Q627LZjdYi3OHxGwPrky
 rLLCVYfOuneBueMQ5KA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160094

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
 drivers/irqchip/qcom-pdc.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index b9acb0f25c9c..6c556464d37c 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -206,6 +206,8 @@ static void pdc_enable_intr_bank(int pin_out, bool on)
 	index = FIELD_GET(IRQ_ENABLE_BANK_INDEX_MASK, pin_out);
 	mask = FIELD_GET(IRQ_ENABLE_BANK_BIT_MASK, pin_out);
 
+	guard(raw_spinlock)(&pdc->lock);
+
 	enable = pdc_reg_read(pdc->regs->irq_en_reg, index);
 	__assign_bit(mask, &enable, on);
 
@@ -223,22 +225,15 @@ static void pdc_enable_intr_cfg(int pin_out, bool on)
 	pdc_reg_write(pdc->regs->irq_cfg_reg, pin_out, enable);
 }
 
-static void pdc_enable_intr(struct irq_data *d, bool on)
-{
-	guard(raw_spinlock)(&pdc->lock);
-
-	pdc->enable_intr(d->hwirq, on);
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

