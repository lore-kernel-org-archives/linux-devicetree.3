Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208293D5C06
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 20:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786306571; cv=none; b=QBuI8m07VRBSylawz8+vdxfShT8GJOyLxNPLCIGSvAS1zgMKt0ajupQl6nfTM5F/Vhhd0goPjBivjprhqQ1jp3vb9LSrglGKa9IFIWouMCHhF20XmJ6QZIJmburRW5KgoSQIaD8OPrJiylo7pgeyN8v2IxRvyRbm5rzUeAhmp1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786306571; c=relaxed/simple;
	bh=eWQLDpa3TqCo4a5U/agcUYC2p0tFCZgkGn1lkr3Ubro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LqVvcysVMFcNb52cGAD22ERgBd2QMZ3fl2vpLYifhTSQdvbUzPNWSVVQsizdQPlyQj6MHCvCsmuTTh9nLsX7dVfH6v4eV1enrpDVXf/h65aFmwRFZSGR8UIhKa4YrDSnaceYi9VEYluc4GDBrxKLbLe0oq8QZrGOn9NcHv1MM/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qb6CJz25; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kp6cg1ac; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qb6CJz25";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kp6cg1ac"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679JhuTC3922000
	for <devicetree@vger.kernel.org>; Sun, 9 Aug 2026 20:16:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	niNCsZBrzIAQrp1eBI5we31XmUPx78SVfLUuwrIpCKI=; b=Qb6CJz25S4FQJlTx
	833BUXomBMUMS14QDTk19YWp88mdoDpnzTB0TVxNpYXS9GClRQi03eM5u6o8rKNz
	Yg5pxNwz9n9bQbHSBFCa3jmIiSOJGDVOZTvMd1yop7i4W8dk5uaoI7J0k+SgFGXS
	RqPEHqSVKWQFl4b/y/sNqgdJOWF5Dk/Bgid4X5C+x18VIEYkUOnjmVqWr9KFOFjV
	+q1QO4cmeMmaGbmcVE1IliunDMNVdCaI+Sng0rm3EQBA2+U4FzJoJGQIJaRCuGhv
	9oeB3mZUB/KbMl3LeRC610xu6i40GjZANd6GFkT42XulsueMaCiQiEjNt0buOyVn
	J0FjEg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwv1ybhk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 20:16:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52769fc3f2eso17445771cf.0
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 13:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786306568; x=1786911368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=niNCsZBrzIAQrp1eBI5we31XmUPx78SVfLUuwrIpCKI=;
        b=kp6cg1ac47HAw/ob41/TOmAgAuEfmi41cD88S/b45qi/WnHQDYzbqWT8edSI44LbN3
         zCi+LaQHKW5ji+vBiQt1aTPbxZPHhkD07W5mtvrCrOUHCUpVlhX/nCfNATk8HVrFFKeV
         qEle9KfDC2BfxYLHJegmyk5L/Vdj+U0bpiDueWRlIM4UrpeYwyAlZW1zzSCQqI4o3MdN
         0AycpIgZsXFBemYE8q7p1kHCA88wNEMUf+4cupynsi2kf3sdBbHkrd1VXCzld1cfkvvR
         2oTWhYdE1Tl/uQ6U9G1JGjTHt9x8eP2GPaNMu826pZCeFPBBXOuzGBR9VWXD6rHFhJBW
         ItvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786306568; x=1786911368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=niNCsZBrzIAQrp1eBI5we31XmUPx78SVfLUuwrIpCKI=;
        b=kv1CFNSl9SFw0jsyLpNO20NFXk5AcvHIC8l6zQv9Otwhz2jsA0IBd8gVt8K1Bh/mbK
         TnE2c3ZR4j4ULUcnof299kT3MCKXqdQea2ME1G+gTRJ0EELfWbUFTw1hLoqzpCwaAWIJ
         X0aMrizC9JM+CXdl+2nI/Tk/G77COwh89jAaogI8mlY0M8uO3+p6HneVfShWB1+CeprF
         /kerh3OiBuXFz9RW7xOBAzeb57JKNAmiTbrUVPFLNOI/vvOaspMdHEPIjcZYKZmbLdAj
         6bibvx6GbIxwm9olL4b9w8gzl7rwpK5ZeZXnyVFq1mB5Jh/MNu7EYSG+UvpyTJiT8sY7
         DKxQ==
X-Forwarded-Encrypted: i=1; AHgh+RpjlHYSwBTLEtFChH6IB+ZcfNqjiQvzXwRLuVviXCGxr5b+G7Nb03OwN3rSEt1hkLASix+kTxjU004t@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdbfp90OeUjCZ4xqk7GfhmyHzKMpu5FVNW7bArQXifMCzv1bJs
	/s38e0huIUFEPz4/O4LeELSErpoAMznVSMjRVYeI8wYFUf7smMzWpGxEWctWyZgzBfzuEhGO87d
	dUK0hQEgPaaCoEJRwyS+c0v7O+bp1dOPXIPZ306wxTALyKoTfSFUQAZLP+hiyLBvv
X-Gm-Gg: AR+sD11KZokXbhS17Rk+4JWklnfKTnG6m/AmvSydD/gOn3FcXiwjga5ts2hb5gondgV
	8fKm9dQhuobV7HAd1J4VaMBaaU8FqTZGBPhg2gdPzoFtiOqrVfOF0SfkY16uE3uzWdZ32ANefan
	++dt6FL5dmtQq2R3xYsOAFuf4IfJAVy2KpPiLSji1MbkFLC932iK7Z38ePNNabs9I0yxd/5rR3U
	sZjqM1F3mq67uZsyAgMKByTVAqFBLSEaVfcDi1mfRl4hUQsOFYcZmRACIp2IlP6QSnqm6dE8X0E
	Ns+LCOceLq1BKvR3RsJbUDLuNcEUZ42ucwEsS2yob1xax06IXgqYcOmlRHHS20I3j3Hw5ruwqn4
	4iYr3AHnpac/54hk9z2u2TNveIvRKzS6S0dh/fdwRUnxmaMOkjBGYGDVK6WF//tjtypU2VOo1s3
	D9e451al+zEbrSiA==
X-Received: by 2002:a05:622a:345:b0:51c:73f:e3a7 with SMTP id d75a77b69052e-52ce6108188mr399320121cf.26.1786306568248;
        Sun, 09 Aug 2026 13:16:08 -0700 (PDT)
X-Received: by 2002:a05:622a:345:b0:51c:73f:e3a7 with SMTP id d75a77b69052e-52ce6108188mr399319631cf.26.1786306567794;
        Sun, 09 Aug 2026 13:16:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3cfasm1589259e87.70.2026.08.09.13.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:16:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 23:15:47 +0300
Subject: [PATCH 08/12] iommu: qcom_iommu: halt the micro-MMU while
 programming context banks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-msm8974-iommu-upstream-v1-8-87f5cd492560@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4172;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=eWQLDpa3TqCo4a5U/agcUYC2p0tFCZgkGn1lkr3Ubro=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeN/vrrz5nTKhkhA8RhmCiIASpJNOV07B733ja
 VVfkmPfjWiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanjf7wAKCRCLPIo+Aiko
 1SL5B/91QjVcyjSegd6cf/tLGXyVqJRDRnmGHZ6f//+zYHAc6FdXNDi6ba74FeoxKTtQx+MHzsD
 T33SDClz594ZGavBDNexQ9+LiBrW5qnZCC7hexo59OCPrHqt68x/pBn2s6TT3/X/11zFoeGOkSC
 nQVwW+Ad7yiUkjK/aKaiIeoQiLVeUpCzmgZOX4ofXLznfGr5XuNosJhW7OoHBVAjunRpM5R5KfT
 UN2WBxZhi2bptuWFiLuZjpJCZ2EXtDYI96iMlW0rITgaS42ZC/x8Ol8g1qiMkqeolNzZwPgkxFZ
 TpwaL9hyXttkkGoAUzmaT/tT60KE8ZGtGKXZmICIpVXdsCWm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: M78tF98Ol_yDgJ47EWWDRg4d5guIp1ur
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX0ElXTeL4aGt8
 +X3K4Oa1cbfjEGG8Ekx9zLP8IQgltKHcYHlUTU7Vld28XDUPvuE3XK1Fqiwl7sg80RNpJoqUkpH
 vnQGTxj62OJsmL91Il/brrwREKP4tWcmSM/xhPTxylSms7hiRKtIr3UBLFQ4CmbueTFmYItIsMO
 puSu4vPbW7vAKPXg72x9TVkFOQ9fSB3l8RBVk6LejkTw9UvU5vQzRYiYzE73ExeHcyKF5LxEV0m
 sQOwxMsLUMK8YQgJpkxaqXqkH1TMKwbZ5bC79JTLeaTm3eV3G7/XmtxF1ZXyEoMC4nl+8thVWh2
 YJc8TYYZnw9ksJhurECVXhE96aTn8l3h+ii39cN5yMNG1LE/2PttCNzEvhjrhQ5ES6HsZ4RqHa0
 a0EAKalLkIRhx7tbTOy0wSl/J2nhWNqdXyrnFdshvLapmpOLsnITc92w8zjVob4BIpSi1Uea9So
 dgNk6d4BzpBi6vGHs5Q==
X-Authority-Analysis: v=2.4 cv=PbrPQChd c=1 sm=1 tr=0 ts=6a78e008 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=3K1L26fHcIV91VHLagoA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX7QYdKlwtNxF/
 b2HU2H8rDww/wPJj+Z7V/dif8VJMIBSVn5RUKKnbHBWre7eMybrOV+sgShPfDcubkYBz4G1vwd5
 vGJF0u+PSPw8pjCfK/eYctQHXmYyTMs=
X-Proofpoint-ORIG-GUID: M78tF98Ol_yDgJ47EWWDRg4d5guIp1ur
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090183

The context bank registers are reprogrammed underneath a live translation
front-end. This happens at attach time, and again on every runtime resume
for instances that have to replay their context bank state after power
collapse. Rewriting SCTLR, TTBR0, TCR and the MAIRs while the micro-MMU
keeps accepting client transactions races the in-flight traffic against
the new configuration.

The hardware provides a handshake for exactly this: setting HALT_REQ in
MICRO_MMU_CTRL, at the start of the implementation-defined register
space, stops new transactions from being accepted and reports IDLE once
the outstanding ones have retired. Downstream drives it through a
qcom,iommu-enable-halt property.

Add the handshake, under a per-instance flag as the handshake is not
wanted on every instance, and bound the wait rather than spinning
forever, so that an unresponsive front-end degrades to a diagnostic
instead of a hang.

The halt is confined to context bank programming. Applying it around the
global reset as well resets the SoC before the console comes up,
reproducibly, on an APQ8074 DragonBoard.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 44 +++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 8e9488c47d5c..f27f8722ee64 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -37,6 +37,14 @@
 /* GR1 sits one 4K page above GR0 on the msm8974 QSMMU */
 #define QCOM_IOMMU_GR1			0x1000
 
+/* The implementation-defined space sits two 4K pages above GR0 */
+#define QCOM_IOMMU_IMPL_DEF		0x2000
+
+/* Micro-MMU control, at the start of the implementation-defined space */
+#define QCOM_IOMMU_MICRO_MMU_CTRL	(QCOM_IOMMU_IMPL_DEF + 0x000)
+#define MICRO_MMU_CTRL_HALT_REQ		BIT(2)
+#define MICRO_MMU_CTRL_IDLE		BIT(3)
+
 /* Redirect all cacheable requests to the L2 slave port */
 #define QCOM_IOMMU_ACTLR_BPRC		(BIT(28) | BIT(29) | BIT(30))
 
@@ -66,6 +74,8 @@ struct qcom_iommu_cfg {
 	bool				 no_afe;
 	/* context banks lose their state over GDSC power collapse */
 	bool				 ctx_restore;
+	/* the micro-MMU must be halted while its registers are programmed */
+	bool				 halt;
 	const struct qcom_iommu_sid	*sids;	/* one SMR slot per entry */
 	unsigned int			 num_sids;
 };
@@ -339,9 +349,41 @@ static int qcom_iommu_reset_ns(struct qcom_iommu_dev *qcom_iommu)
 	return 0;
 }
 
+/*
+ * Halting the micro-MMU quiesces the translation front-end: it stops new
+ * client transactions being accepted and waits for the outstanding ones to
+ * retire, so that the context bank registers can be reprogrammed without
+ * in-flight traffic racing the change.
+ */
+static void qcom_iommu_halt(struct qcom_iommu_dev *qcom_iommu)
+{
+	void __iomem *reg = qcom_iommu->global_base + QCOM_IOMMU_MICRO_MMU_CTRL;
+	u32 val;
+
+	if (!qcom_iommu->cfg || !qcom_iommu->cfg->halt)
+		return;
+
+	writel_relaxed(readl_relaxed(reg) | MICRO_MMU_CTRL_HALT_REQ, reg);
+
+	if (readl_poll_timeout(reg, val, val & MICRO_MMU_CTRL_IDLE, 0, 100000))
+		dev_err(qcom_iommu->dev, "timeout waiting for micro-MMU halt\n");
+}
+
+static void qcom_iommu_unhalt(struct qcom_iommu_dev *qcom_iommu)
+{
+	void __iomem *reg = qcom_iommu->global_base + QCOM_IOMMU_MICRO_MMU_CTRL;
+
+	if (!qcom_iommu->cfg || !qcom_iommu->cfg->halt)
+		return;
+
+	writel_relaxed(readl_relaxed(reg) & ~MICRO_MMU_CTRL_HALT_REQ, reg);
+}
+
 static void qcom_iommu_program_ctx(struct qcom_iommu_dev *qcom_iommu,
 				   struct qcom_iommu_ctx *ctx)
 {
+	qcom_iommu_halt(qcom_iommu);
+
 	/* Disable context bank before programming */
 	iommu_writel(ctx, ARM_SMMU_CB_SCTLR, 0);
 
@@ -369,6 +411,8 @@ static void qcom_iommu_program_ctx(struct qcom_iommu_dev *qcom_iommu,
 
 	/* SCTLR */
 	iommu_writel(ctx, ARM_SMMU_CB_SCTLR, ctx->sctlr);
+
+	qcom_iommu_unhalt(qcom_iommu);
 }
 
 static int qcom_iommu_init_domain(struct iommu_domain *domain,

-- 
2.47.3

