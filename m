Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C9B3DA7DC
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 20:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786306576; cv=none; b=kNGyFe9rmZ+2B9VOvihzm2d/cKjFIqhmtw8CXS/PKDpMvdrVerEXd1676YVU+oA0tEUNYGWyyuT+IQX/UAgE9uiZ2OVxHWODvc2br0gFL8AECVENl1veo7+iDuqt7cMNQgWXu66x+rL2yEO9mxMWFOQn7XHXH/HzeEChzFa65V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786306576; c=relaxed/simple;
	bh=vdP/W44ayt3FHEa9KUaIShbYNvDrdcgmsdVGlcwUja8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uIbfAkFQ/BoVfVNOXYVHNEZVKpb8XPt1raS7RvIMExIaF+QUVe7rpzs1b/WxIKj208jzxGmgJHeBtyYQyGC4RpsFc2dqbXRxU+lfujcvr0DI+4XizH+yrgbs+bbejc21Z265pyCYjY6u8upo/2qkcUsBCKwIp01ty4kCof2WcKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=irpKRk8R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FGeXeGN3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="irpKRk8R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FGeXeGN3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679I9AcN3117364
	for <devicetree@vger.kernel.org>; Sun, 9 Aug 2026 20:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iNPk9I4Upyn1iuvNFg1ZZoqQjoBVK1nqXfEtDMUZc8A=; b=irpKRk8R9ejJ0k7F
	W7uQs76hjB+J63bTajkby5HIL0fF9bzl6ZM2AHKQKsamwZBOO2i8EOd0YF+aFUqb
	bMF9ImOINAOhJksg1AeXDa12ldb1pYp0nTZ7cRX9w9p65/hyPRGw4fNKn03wbjrQ
	4AAV5L59BOFA3k2qxmNQeyjkEkG//yJkEkhSS7J/IeLKa7vO8be9rvtJdWF0xZ5G
	P4alCOWr2dTIrH2vy7brxybAlW48CW2deVBL3z9zAjSgtiB6DNaYYI8yVzKKsknz
	KiBkzWqSBdJf8d5ZJnGlhR44/zRB/gXigIjch4kTb+KnwzrehKu1tEprK9BofpNw
	BlR9bQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fww7cud7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 20:16:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c01ff996dso17387451cf.2
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 13:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786306572; x=1786911372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNPk9I4Upyn1iuvNFg1ZZoqQjoBVK1nqXfEtDMUZc8A=;
        b=FGeXeGN3ozsBFhY1jahm+8o2jVfktxFG1C8vw9WOQQRdtM13VQXrmybbaEdHExzGvu
         X+H5Ka/dxfykN2U4mdtX0VfHKttFqe9/7UW6ZzxkyPPBe7o74SrV3R6jzPlLRs6oWTeG
         murqi18zNxDv85SPLiq+VrWwDUASpQS6rOUVF1yUEfFY9ByRynwAWRuA9upN5ghWB920
         UmgWbgQ/y4QEO296b+p8zFOGtMlvRy/qczLTV6zLVcjYsk2Wcs2BA8PJMOaUp1V58U2k
         bFjxANRIvky6zAnV+T8sllXy91k+GjMj04rrzAEn69KYibF52IyR6T5M8K6/X4NDBGGO
         M7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786306572; x=1786911372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNPk9I4Upyn1iuvNFg1ZZoqQjoBVK1nqXfEtDMUZc8A=;
        b=GQg3QzifVHSTUdcIOx0nDoC3xuKhmXeDo0b7qCG0RgFN69z9Fjx5M/kwzEQgTWC4Xd
         y4UONIEPmLI9OrT38Xam6VL7bdu3Kjy+2qyqCyylyoKucpC05lq1dgjopaH5/hvgjXm/
         qUmd6bKTaHM0VqlN8RUciX3qgR307xlviHuy0YhAXVHL9kUod0oPylqZHY529wCfPv/W
         TOw99X96Fv++yriObGRhbSVlZoxPRQRW3kZiHTy1AH8YFUj26VKNgNZit37C+3a7imu2
         UMIKt1q90BXHFiwv372qaI68D1Lol36Yv+MpMvy9YGseBb2L677jzZ8mzrQmvRSA3nI0
         2QVA==
X-Forwarded-Encrypted: i=1; AHgh+RooI7Wdqv7oTURW1pKcGPcMgzqkexYMiz7mWLvBkj0Ec0o8LGdmA6FnznZalx0WhOn8QRAHky0Lxgbh@vger.kernel.org
X-Gm-Message-State: AOJu0YzWlAVrkq7hXhSCCEdwXeoySavaHJDzQvg5PGHMxlTAHCLLiAuc
	Vg8zIcCWfVWYHG+NwnnMuJdyA8DKFuTZ2c9vSfnBHuXwMS5fxb7lpeHLwF+jDXG3Plnenlvd2FV
	TBCAIt6OyWndz2TQ7SX2GnItrLFz+ateiZ5cxywHQq4JFiIs0O5XVgMrbfFVGmQMR
X-Gm-Gg: AR+sD1328zmAQce3ZG1fU09Zd8vXZgU9Fk3gyxv8NeXMlY1GIfGaJSEG/Y9F3jgq2/Q
	NiowlGoX/1FGAmrPrsdEGjG9UkDJvIP+Zal/B2ayisoi1Y2Fg4RcGknPrQDkSFaO/ZsojYhfIYl
	k6YUj26gljPgUuop/5eE5o710aehjtQvX8tCuDRQnEjzYeq8xo0zaxOBXAnhwh+zPkWWcq2H6Rj
	PC4b6Un5KZLV2N93A8TshafejoNfM+V2CYqg5K8zPECpOJsq8vJYRGC1KmC+wgt8oB0RYb1DlWm
	y0z8TPDKTC7IR5ozAEFylHkoXDkBjOx+T/OJAK3X/BtbTLzRWBumyA1Hbj303p/xeTIUOclvITZ
	AvT7oMzC6oVNFsv9XGnul0fuDmyYl47/ycWIH43Iz4Olr2gmyVVQzeogk6umD46OBJ+N7qhIH+q
	dscJdO4aVZucM0kw==
X-Received: by 2002:ad4:5d6a:0:b0:8b3:f911:c1df with SMTP id 6a1803df08f44-908a7098dcemr230865326d6.21.1786306572115;
        Sun, 09 Aug 2026 13:16:12 -0700 (PDT)
X-Received: by 2002:ad4:5d6a:0:b0:8b3:f911:c1df with SMTP id 6a1803df08f44-908a7098dcemr230864896d6.21.1786306571669;
        Sun, 09 Aug 2026 13:16:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3cfasm1589259e87.70.2026.08.09.13.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:16:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 23:15:49 +0300
Subject: [PATCH 10/12] iommu: qcom_iommu: program BFP (prefetch) settings
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-msm8974-iommu-upstream-v1-10-87f5cd492560@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2296;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vdP/W44ayt3FHEa9KUaIShbYNvDrdcgmsdVGlcwUja8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeN/v954t+9nRfN3jnbRFtVv4Id7AvzQk1kHTv
 v+6iLVynGaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanjf7wAKCRCLPIo+Aiko
 1UhdCACM0mYcaBjCCwCd+apqi/GjzhWRRST3w8LuuiNKdjPQjAlSU6FRIgZfH7nvWcZteQboR0v
 GZXKfhZLTXVzkaVl1q3bfVJIqoYeVIZ8veIxt8pxOHPRyn2PA4xivjvRfjr8bGLOf/v5jNsxprg
 UfzI8sAwYE/9O/q2xhPGfSsZLvW/SCNi35M8yljHoviKgSAAhE6j8ZTT7x5GKN+7VceUfgzZIyk
 xIwScXlLpMSTv49jQ2YKMpkuD91i7AryZnSmbN8YmXhRVtRylDUjH+jv8Y0nkMr7qSh0xOcLFfz
 mTHR8RixAfhFsT7ca5pCr/rVWmavhaHe4HJNf8qF0dOtT/HT
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 7jS3VKbajRaUQM5yNFRXJ1JBbW3ugO4a
X-Proofpoint-ORIG-GUID: 7jS3VKbajRaUQM5yNFRXJ1JBbW3ugO4a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE4NCBTYWx0ZWRfX5CNfIoA9VnzS
 RBPtGVMgDGRy5+LQ2Sk+TRrcf8J/hinksTS3lPaorJJwQZKaYYs+v3gjNNp4cCYnZ7OAubLFUZ8
 Ldgo6ipbcfrTqbVlztXSbW6RhPm6TMMn53ZqSdwYIp9kkcB2FOWYB1g/FH2KmzcxcMvvwneVXaN
 nqV+CjceqlFTSL5RwqSI21otjyYGC+2zxC8sIc+XXSJu0uR81l4vfNV0NpU9EAqjP5sUd5HIibe
 DqjtLkEyWMW/Tv7uPPU36PSZTItGpSJg2vghJN+rvgLQsyd3EC0vQ3p0aQbgVqS94APb2mzi17U
 52kAFBa6ALHNS9grZzApanYhqvMBOwSYPNHQVM/yWcz3OYvHEYeK/U7G6s+0L/h611kzSd05enF
 QxYp+W5lWiZG7zROGECr/D03/uxCGK2qIzh2I37eBGCwFhvDQxSjEJrVw96jG0yQb/i34bkWPS0
 tN9Fo3+dWZjkg7XmAeg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE4NCBTYWx0ZWRfX4CtNnXgX95L/
 mT/JlSWdCiYrSjejuLyNYEXpY9h5pTEz+2AUO4+1ODSs59tp1rUuJofWFlolvsiSmgrdFOfJfMb
 OBCEqbSwk8oI1bIy6kSGEdsPRtxlM9E=
X-Authority-Analysis: v=2.4 cv=IPsyzAvG c=1 sm=1 tr=0 ts=6a78e00d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=jEMSmkJXngTgGiv5SFIA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090184

MSM8974 QSMMU instances require additional programming of the prefetch
settings in the instance-specific space, with the tables being specific
to a particular instance (rather than the SoC). Implement support for
programming BFB tables.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 2b2cf665c39d..9523ae95fa12 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -57,6 +57,11 @@ enum qcom_iommu_clk {
 
 struct qcom_iommu_ctx;
 
+struct qcom_iommu_bfb_reg {
+	u32			 offset;
+	u32			 value;
+};
+
 struct qcom_iommu_sid {
 	u8			 cbndx;
 	u8			 sid;
@@ -78,6 +83,8 @@ struct qcom_iommu_cfg {
 	bool				 halt;
 	/* faulting transactions must terminate rather than stall */
 	bool				 no_stall;
+	const struct qcom_iommu_bfb_reg	*bfb;
+	unsigned int			 num_bfb;
 	const struct qcom_iommu_sid	*sids;	/* one SMR slot per entry */
 	unsigned int			 num_sids;
 };
@@ -286,6 +293,25 @@ static irqreturn_t qcom_iommu_fault(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
+static void qcom_iommu_bfb_setup(struct qcom_iommu_dev *qcom_iommu)
+{
+	const struct qcom_iommu_cfg *cfg = qcom_iommu->cfg;
+	unsigned int i;
+
+	if (!cfg)
+		return;
+
+	/* The BFB registers sit in the implementation-defined space */
+	for (i = 0; i < cfg->num_bfb; i++) {
+		if (WARN_ON_ONCE(cfg->bfb[i].offset >= SZ_4K))
+			continue;
+
+		writel_relaxed(cfg->bfb[i].value,
+			       qcom_iommu->global_base + QCOM_IOMMU_IMPL_DEF +
+			       cfg->bfb[i].offset);
+	}
+}
+
 /*
  * Reset and configure the global register space of an instance the
  * secure world does not manage: global fault state, TLB, stream
@@ -1131,6 +1157,8 @@ static int __maybe_unused qcom_iommu_resume(struct device *dev)
 			return ret;
 	}
 
+	qcom_iommu_bfb_setup(qcom_iommu);
+
 	if (qcom_iommu->cfg && qcom_iommu->cfg->ctx_restore) {
 		/* Restore context banks lost over power collapse */
 		for (i = 0; i <= qcom_iommu->max_asid; i++) {

-- 
2.47.3

