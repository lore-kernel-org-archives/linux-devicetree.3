Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BCE3D6CAA
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 20:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786306565; cv=none; b=P8ypCSlhiN3VU3cRmpR/ulAqkML9p1FJYqt7GfEj1rjOddhokJZ+0CPkpH0Pf8P5K5vQbfpjcMdy2kJ5pfI3DBVjF/WtFs8difzn3EiKCwYEtV1Tu2ESmwXGp9BMULcsyGk7F0dlQOsv1Q1bz94D1gUAcpiCJxxO6J6tUfAU+Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786306565; c=relaxed/simple;
	bh=GXiPIZglCzQ57hkuCOyXRgoYx4cKxjmC6a7IKdJwtLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cViRgqPOTEVhycDNtJJl6OSiYFnNvYD2OTD2FKH3k52nHsYpuY/8mnj0xPS5GEI3pmcKS6mZYx/FTHdZ05Gbs6m5FHXBMF0QP2oZLI69TXLg7LmU+yaZJ65kFz4IFHLpktenCjHsiu7C2yV5F87/hq1kUkZmsEM6+gXnWsOjN9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f6ifMYWn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ctOoAnSG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f6ifMYWn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ctOoAnSG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679I9T1S3477347
	for <devicetree@vger.kernel.org>; Sun, 9 Aug 2026 20:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rry4GguH7Meqgz11UcFuJ1AWrZzOU1PZecUYu+VWlPA=; b=f6ifMYWnVZIcKQF8
	TCEfTy166WQUM5RlhwY7s/HwgiDZb2UQjHtwn4kYzBKiDtK4kBjd4dpqEl4trbQk
	oBeJb6y+jkUFGu6PnNIbIGEFLxfN0FUV2mFaLk++Uedvxz7mHtH90fm6xYuOHbMD
	4FflWeAZWFkDQDj33GtU94N55zr+azKXaz1Ztr42jfvpph2nwTINTvNVIKN9sMni
	8us5SwYrw6DV6IZ5X+tlS6QvLnraNlPhAj7X3Nm+3R4+xk47V7DtKqoVndDZI1vk
	gPay5Sr1+BUCCDwMc7UhYJQtciKOyjDQWIxwT+p2ZRlq+TL+gZ9gyKD5jzW44X2+
	uJYhDA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvp1kdpn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 20:16:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ce3c7cb2eso22461631cf.3
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 13:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786306562; x=1786911362; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rry4GguH7Meqgz11UcFuJ1AWrZzOU1PZecUYu+VWlPA=;
        b=ctOoAnSGTrrPD2yxrwzZAmaXmI/HjKfTtvVPoaso4mfxR2jr6/mtUzI6mWMrFD4uTD
         7LMErEVU1nVSjDcjpftzeftn4a+JGrpS2T/UkUnecq7SN//pFIe+v4Yf7EoLV+wpdn/a
         fHFW9bTpxwRVueUS62he6cOeanvqlTL5sI9o50N4olXFmJijUMJngao/9/O21fwymcbN
         TPsk6hpqD7FvMIYZzaZE1vBntvcDKeRAFilwOUdUAu9MqInfnrOdyrAG7qzdtFF+49sn
         VCMEl4sZtiwYU6p/ESmCj6dH8Pkff3telw5rpTIJOkmu8ectAJXTMmrzxSZrTyrE3kgL
         7jRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786306562; x=1786911362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rry4GguH7Meqgz11UcFuJ1AWrZzOU1PZecUYu+VWlPA=;
        b=g/rOr1cbmUBbD0twqsjIHhKU3v6URLGwQKCjlWor9UatTEqRUHOGoAccDcsOaApH7T
         vStJTX+LZL5VESpTCJ+m7u2W3FkfG672wmZdMrdhitS9K0NfR8131iPwHbLaRDAziQtN
         eYaL1PR92ScyUuw/HwxESOYdt7ndzZE9XBfhdGP0XKdlDzFiQxKncXlaCJg1/9anCpWY
         oikpYdnMKAiB09tOU8zJuLf/vTI/SiJ6MCqHs9NNCFF1dmqCvCgOFDhvK1hV7ADybU2T
         myWexj6UT9zYibi+Sh1mYXCAeypON27yqJsKLyohJC7lbZYizFckqJMWep+ZcKDCqfAN
         g3bQ==
X-Forwarded-Encrypted: i=1; AHgh+RqXbky1ZfuU1nYCfmWPGaiauFNh+ov9UdTfShGUDeIdgHygLSSulFpDneD12WcxWGkLxZqtAOTydOia@vger.kernel.org
X-Gm-Message-State: AOJu0YyvYFxkbppcnzbWwDqWFt8eAVI9F5DnpnjzklWKwZgFWqEBV8mG
	LvbdR/UgLyMc9q1PQj+TXtF+G8DFaDaUOcYhhsaSKUn1Z9u6i4EqTHgwibWamumaehM0FO8idD0
	6g8vEWkai0+up30xVyqz3Hmkq4A5aYliLmP7HXXR+rUqdGbpgd+44Wwdir0xQ95UZ
X-Gm-Gg: AR+sD1127ei4ePlWGXwUCF8mtKwigA7FTtl8xJXFYJso0vbFpXI7k56dQ8Mxnn2juvW
	fFLV3ML+Ks0zGqdQtnk9P0Zrn0E5B5UzbrAoB5+gWZf/y4oQzvy5Y50cSV+yCWxPs20iyBbO/lt
	LJabNA+mWjLc1UFYv7l7D8RqfgTD9cjUdLfKbGxF7zw/WV23PKWsR7/Inmx3GWjZkmQ9RkXkekJ
	w7nYvm/aysypU+0MFTET1dzVsGtlhjAoD8ws+D6TWoOUrN0c89HPsnuGBGFp8ZUco/jSId3w7IF
	39JjN6L8u6mW+q/beNjS1Otnj/6YpJ7z3BKwxZ0O6X1SdlTnANMn9I1EseJkd/fmDpLZh0nU8tb
	d8JQG+H/yI5IEUCDqBT31jeDs/xYQyni8TAHf0hhIaqMOVnQ84L/ICP1h/l4ArB3rsPlWJSMnhF
	jv5snmIgTicHWElg==
X-Received: by 2002:a05:622a:295:b0:51a:8b64:69e0 with SMTP id d75a77b69052e-52d0b04c1d4mr255757951cf.11.1786306562261;
        Sun, 09 Aug 2026 13:16:02 -0700 (PDT)
X-Received: by 2002:a05:622a:295:b0:51a:8b64:69e0 with SMTP id d75a77b69052e-52d0b04c1d4mr255757591cf.11.1786306561854;
        Sun, 09 Aug 2026 13:16:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3cfasm1589259e87.70.2026.08.09.13.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:16:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 23:15:45 +0300
Subject: [PATCH 06/12] iommu: qcom_iommu: support non-TZ-managed instances
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-msm8974-iommu-upstream-v1-6-87f5cd492560@oss.qualcomm.com>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8021;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=GXiPIZglCzQ57hkuCOyXRgoYx4cKxjmC6a7IKdJwtLo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeN/uChgqZG3WWQT+NkfhYIemGVi4SeH4M9Loa
 b8wCfB3QRaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanjf7gAKCRCLPIo+Aiko
 1SyUB/kBncagbuWWJlhIctG68KKAARV2R4j44ig3zbUgnJR6HMbSoX8P+5TMSGfD8t6XEfy0T+m
 zibX2U1bMqIdkRQzFrWkNnP1llgcnJc5oVlOASoDx4IlX0+gKGv9XSV1SYA7jByQ5w5qLfq135P
 9oyqfKrb6Tqt4+xaf9IbfK/JfOEaK94ICzEXk6oVkXuzGpJgcAG6Dpjm6pQsNq09KrWatRYMcL5
 pNJdula8C+b4jevA0ysfoRW4zBLLjgPFs2ENqkSTrGozUe9fk+/8TsP+X4qU6HYaeneGA1xBO4x
 Uq/xKbOECYLsTR4bYWNDuVH+SBlkeoAwGua1HW0i+yq7DHGv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfXxHN7aPm7JWww
 MV93y4rdAmH2pjQDelOYdous05uStkMsLyzYz5F1lCVOKQIKvcD7SOey2Sx6TRXHW0X5D50ysia
 JuMuvi9VpskvQsMXrGosKbDrWu+DbhMZt02NqdN+TKJB60z5lxkLlPuecLotNhCK6ejyX+Fen1T
 ru5JjRBLiOF/eR+ef0NBJdGZWqZNGTGaMAE9dXhkXPVAc76OaSiLAmPqLa+aIvnO3z3yWJwIlv9
 eMwsCKmaAaNlP1Gamf7hRafoc1eK5kX5UUch6fQNFAz2JaJI74rK9iJRZVlYrBQCTLDstEABf4x
 hb0ls1Sk07O5NbNhtu5lMCTYTW6Y0UByAmRdNx835TPIHe5qE26dbGAjVmUhHm/SZ4ytWVpWeUa
 7/yrG7Ps6rAYhrBieNfFee+HP8zRqOz7+6lWPcXoZs3uYGlIfEZzYkQTet8nXIF7e6NX6o+B1fT
 1F+76zPHKy5aXviOmEA==
X-Proofpoint-GUID: 9Dc9DojdIy_4FS9_tMHkz194_sdH9B9W
X-Proofpoint-ORIG-GUID: 9Dc9DojdIy_4FS9_tMHkz194_sdH9B9W
X-Authority-Analysis: v=2.4 cv=ebgNubEH c=1 sm=1 tr=0 ts=6a78e003 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=9TCwowKhpjj2XBowZ20A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX3sRvCwFpLF3N
 JOzuWMDm8vltIYf+jZw6A2Oj8IXKopqXLYAWhq8Gs+Rq7kJaFNWv0InvuuDd8/LwH5tZDFjwPv8
 2elfg+YQrTv5lEnr7LkzmxyYRhXN648=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090183

The GPU on MSM8974 has never been usable upstream because its IOMMU
cannot be driven: unlike the MSM8916-style instances this driver
supports, where the secure world owns the SMMU global register space
and the OS programs just the context banks after a restore_sec_cfg SCM
call, the MSM8974 GPU IOMMU is not managed by TZ at all. Nobody sets
up its stream mapping, so attaching a domain leaves every transaction
unmatched and the GPU faults on its first memory access. Verified on
the APQ8074 dragonboard: restore_sec_cfg is only accepted for the
secured instances, while the GPU instance exposes its ID registers to
the OS (IDR0 0x78034404 / IDR1 0x10000003).

Add a non-secure programming mode, derived from the downstream
msm_iommu-v1.c driver. When qcom,iommu-secure-id is absent, reset and
program the global space at runtime resume instead of calling into TZ:
clear sACR/sCR2 and the global fault state, invalidate the TLB and all
SMRs, install the per-instance stream mapping (SMR/S2CR/CBAR, with the
downstream MEMATTR/NSCFG/VMID/IRPTNDX values) and enable the SMMU with
fault reporting enabled and stalling disabled (sCR0.STALLD, matching
the downstream terminate model). The stream ID map is per-instance
configuration data since it is not discoverable from the hardware; the
SMR index allocation keeps ASID == context bank index, which this
hardware requires (downstream msm-3.10 commit 4d92ea10aac3 ("iommu:
msm: Use CB index as ASID")). Also set CB_ACTLR to redirect cacheable
requests to the L2 slave port, as the downstream driver does for every
context on this IP generation - on MSM8916 TZ owns CB_ACTLR, so the
driver never needed to touch it before.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 107 ++++++++++++++++++++++++++++++--
 1 file changed, 101 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 428b18697244..3b07c4cf23fe 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -37,6 +37,9 @@
 /* GR1 sits one 4K page above GR0 on the msm8974 QSMMU */
 #define QCOM_IOMMU_GR1			0x1000
 
+/* Redirect all cacheable requests to the L2 slave port */
+#define QCOM_IOMMU_ACTLR_BPRC		(BIT(28) | BIT(29) | BIT(30))
+
 enum qcom_iommu_clk {
 	CLK_IFACE,
 	CLK_BUS,
@@ -46,11 +49,23 @@ enum qcom_iommu_clk {
 
 struct qcom_iommu_ctx;
 
-/* Per-instance configuration, absent on msm8916-style instances */
+struct qcom_iommu_sid {
+	u8			 cbndx;
+	u8			 sid;
+};
+
+/*
+ * Per-instance configuration for instances whose global register space
+ * is at least partially OS-managed (reg points at the global space and
+ * SMMU_INTR_SEL_NS must not be written). The stream ID map is only used
+ * on non-secured instances.
+ */
 struct qcom_iommu_cfg {
 	enum io_pgtable_fmt		 fmt;
 	/* the walker faults on the AF bit despite it being set */
 	bool				 no_afe;
+	const struct qcom_iommu_sid	*sids;	/* one SMR slot per entry */
+	unsigned int			 num_sids;
 };
 
 struct qcom_iommu_dev {
@@ -62,6 +77,7 @@ struct qcom_iommu_dev {
 	void __iomem		*local_base;
 	void __iomem		*global_base;
 	u32			 sec_id;
+	bool			 non_secure;
 	u8			 max_asid;
 	struct qcom_iommu_ctx	*ctxs[];   /* indexed by asid */
 };
@@ -256,6 +272,71 @@ static irqreturn_t qcom_iommu_fault(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
+/*
+ * Reset and configure the global register space of an instance the
+ * secure world does not manage: global fault state, TLB, stream
+ * mapping (SMR/S2CR/CBAR) and the global configuration register.
+ */
+static int qcom_iommu_reset_ns(struct qcom_iommu_dev *qcom_iommu)
+{
+	const struct qcom_iommu_cfg *cfg = qcom_iommu->cfg;
+	unsigned int i, num_smr;
+	u32 reg;
+	int ret;
+
+	qcom_iommu_gr0_write(qcom_iommu, ARM_SMMU_GR0_sACR, 0);
+	qcom_iommu_gr0_write(qcom_iommu, ARM_SMMU_GR0_sCR2, 0);
+	qcom_iommu_gr0_write(qcom_iommu, ARM_SMMU_GR0_sGFAR, 0);
+	qcom_iommu_gr0_write(qcom_iommu, ARM_SMMU_GR0_sGFAR + 4, 0);
+	qcom_iommu_gr0_write(qcom_iommu, ARM_SMMU_GR0_sGFSRRESTORE, 0);
+
+	qcom_iommu_gr0_write(qcom_iommu, ARM_SMMU_GR0_TLBIALLNSNH, 0);
+	qcom_iommu_gr0_write(qcom_iommu, ARM_SMMU_GR0_sTLBGSYNC, 0);
+	ret = read_poll_timeout(qcom_iommu_gr0_read, reg,
+				!(reg & ARM_SMMU_sTLBGSTATUS_GSACTIVE),
+				0, 5000000, false,
+				qcom_iommu, ARM_SMMU_GR0_sTLBGSTATUS);
+	if (ret) {
+		dev_err(qcom_iommu->dev,
+			"timeout waiting for global TLB SYNC\n");
+		return ret;
+	}
+
+	num_smr = FIELD_GET(ARM_SMMU_ID0_NUMSMRG,
+			    qcom_iommu_gr0_read(qcom_iommu, ARM_SMMU_GR0_ID0));
+	for (i = 0; i < num_smr; i++)
+		qcom_iommu_gr0_write(qcom_iommu, ARM_SMMU_GR0_SMR(i), 0);
+
+	for (i = 0; i < cfg->num_sids; i++) {
+		const struct qcom_iommu_sid *sid = &cfg->sids[i];
+
+		qcom_iommu_gr0_write(qcom_iommu, ARM_SMMU_GR0_SMR(i),
+				      ARM_SMMU_SMR_VALID |
+				      FIELD_PREP(ARM_SMMU_SMR_ID, sid->sid));
+		qcom_iommu_gr0_write(qcom_iommu, ARM_SMMU_GR0_S2CR(i),
+				      FIELD_PREP(ARM_SMMU_S2CR_TYPE, S2CR_TYPE_TRANS) |
+				      FIELD_PREP(ARM_SMMU_S2CR_CBNDX, sid->cbndx) |
+				      FIELD_PREP(ARM_SMMU_S2CR_MEMATTR, 0xa) |
+				      FIELD_PREP(ARM_SMMU_S2CR_NSCFG, 3));
+		qcom_iommu_gr1_write(qcom_iommu,
+				      ARM_SMMU_GR1_CBAR(sid->cbndx),
+				      FIELD_PREP(ARM_SMMU_CBAR_TYPE,
+						 CBAR_TYPE_S1_TRANS_S2_BYPASS) |
+				      FIELD_PREP(ARM_SMMU_CBAR_IRPTNDX, 1) |
+				      FIELD_PREP(ARM_SMMU_CBAR_VMID, 3) |
+				      FIELD_PREP(ARM_SMMU_CBAR_S1_BPSHCFG, 2) |
+				      FIELD_PREP(ARM_SMMU_CBAR_S1_MEMATTR, 0xa));
+	}
+
+	qcom_iommu_gr0_write(qcom_iommu, ARM_SMMU_GR0_sCR0,
+			      ARM_SMMU_sCR0_SMCFCFG | ARM_SMMU_sCR0_USFCFG |
+			      ARM_SMMU_sCR0_STALLD | ARM_SMMU_sCR0_GCFGFIE |
+			      ARM_SMMU_sCR0_GCFGFRE | ARM_SMMU_sCR0_GFIE |
+			      ARM_SMMU_sCR0_GFRE);
+
+	return 0;
+}
+
 static void qcom_iommu_program_ctx(struct qcom_iommu_dev *qcom_iommu,
 				   struct qcom_iommu_ctx *ctx)
 {
@@ -266,6 +347,9 @@ static void qcom_iommu_program_ctx(struct qcom_iommu_dev *qcom_iommu,
 	iommu_writel(ctx, ARM_SMMU_CB_FAR, 0);
 	iommu_writel(ctx, ARM_SMMU_CB_FSR, ARM_SMMU_CB_FSR_FAULT);
 
+	if (qcom_iommu->cfg)
+		iommu_writel(ctx, ARM_SMMU_CB_ACTLR, QCOM_IOMMU_ACTLR_BPRC);
+
 	/* TTBRs */
 	iommu_writeq(ctx, ARM_SMMU_CB_TTBR0, ctx->ttbr0);
 	iommu_writeq(ctx, ARM_SMMU_CB_TTBR1, 0);
@@ -327,7 +411,7 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 	for (i = 0; i < fwspec->num_ids; i++) {
 		struct qcom_iommu_ctx *ctx = to_ctx(qcom_domain, fwspec->ids[i]);
 
-		if (!ctx->secure_init) {
+		if (!qcom_iommu->non_secure && !ctx->secure_init) {
 			ret = qcom_scm_restore_sec_cfg(qcom_iommu->sec_id, ctx->asid);
 			if (ret) {
 				dev_err(qcom_iommu->dev, "secure init failed: %d\n", ret);
@@ -907,8 +991,12 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 
 	if (of_property_read_u32(dev->of_node, "qcom,iommu-secure-id",
 				 &qcom_iommu->sec_id)) {
-		dev_err(dev, "missing qcom,iommu-secure-id property\n");
-		return -ENODEV;
+		if (!qcom_iommu->cfg) {
+			dev_err(dev, "missing qcom,iommu-secure-id property\n");
+			return -ENODEV;
+		}
+		/* The secure world does not manage this instance at all */
+		qcom_iommu->non_secure = true;
 	}
 
 	if (qcom_iommu_has_secure_context(qcom_iommu)) {
@@ -981,8 +1069,15 @@ static int __maybe_unused qcom_iommu_resume(struct device *dev)
 	if (ret < 0)
 		return ret;
 
-	if (dev->pm_domain)
-		return qcom_scm_restore_sec_cfg(qcom_iommu->sec_id, 0);
+	if (qcom_iommu->non_secure) {
+		ret = qcom_iommu_reset_ns(qcom_iommu);
+		if (ret)
+			return ret;
+	} else if (dev->pm_domain) {
+		ret = qcom_scm_restore_sec_cfg(qcom_iommu->sec_id, 0);
+		if (ret)
+			return ret;
+	}
 
 	return ret;
 }

-- 
2.47.3

