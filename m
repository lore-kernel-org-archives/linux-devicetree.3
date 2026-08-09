Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451113D9DCC
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 20:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786306573; cv=none; b=GryKpM+c4zm2VxfGFPNaX+U6f8+pw4hTsL4nagJ2K0Z1Z38iOXskT267pPlMuEaYrxgl9M/0R1f6Lp3GG42xtk3XTIr910tNZQOogWuuBj/cLeu55bxyRTDCAG0wSibUZkDkBBiJmYlzK83zJe8EqhibaE6UGIJCTcGhD9uiKwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786306573; c=relaxed/simple;
	bh=08DI3m/g8w//LYUe10gsP5FMXIEvOf1ZW68iQjd9XpE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q1BiHNZih1AKTwbE3Vy6skTiYbHgBn6C9Qyogg7l+uKpaFWivwLda7B1OfLp2f+eAUmQgyu3WS4z5PFTz+i4AxhooaiqLSK12PzUofY2eyFpO5GU2HNRzvxRyNfpkmIWqRHWwx3d1TfdgHaKeBrTd7EILog7LX5ySAKJLMJoAaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VCYWknPt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WswLBJMe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VCYWknPt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WswLBJMe"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679IxUqm3519899
	for <devicetree@vger.kernel.org>; Sun, 9 Aug 2026 20:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+hV7mbrZwx44RLk9dFycUl+f8Z+IiQ1Td63pdUanc1o=; b=VCYWknPtT+DHTuIY
	tVzaDErKqAENEmh53NdE/F6yPa9Iqqm5VFirSBYIGvRK8vIs3F3NfUyyVYvvFxe2
	RM7MAUGCrDr3M2lUOYnddzIcxBttrW+m3XswltoqI1vIBsmxFRbnm9EpvcLOpC3R
	ZBHVxkGzX07GuWc8pg+tfcGuKiqEXqJe7ccprmM8/TSo9cmFZifhv4bhzpYbqmX3
	WUuX+rLkbW4C8bAgq1XdnESY/tkOe07HZOAawNNkFKApgTbZLAQao4EfQxZocwM5
	lDtfbXLSCeoo4UfJFPjvoM4YbF3j2SE/7OuzHdGdUSidGvZxbJdci/Jqwn+gZKxs
	P55U0w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvhvbfb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 20:16:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e538afe65so130375585a.3
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 13:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786306570; x=1786911370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+hV7mbrZwx44RLk9dFycUl+f8Z+IiQ1Td63pdUanc1o=;
        b=WswLBJMekeY2Z1aqjQupOofXVU9ei0nhpoDtBTFr3wPDNBWHdo0Ocg9/XiHNVuoUoR
         U9yJqAAYv3WeLSM3jZFQc8eDj0uuWBHjy0/iB1IfIQNJKeKvxIOOKTO9GK157kJCDTwx
         AzPs+10dUaQu4WdhIKGBrJ2FsVkbI7uRsmFq79x9PZAxUnBp8k8af2lq92Y+uaLbe7Uk
         YaKY4ps3Xe3WEvXtLeb8y8eqv/IF/eYnMa2JNh9GiayZJSDh+inZu43h6YB24T/QEQ7T
         p0C4zPhU1GcBaD2ZbspxeHuooU7Cmy6tk6SDlcF/JjP3g13K3vPjeMa06XoKbeHi4oxm
         W4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786306570; x=1786911370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+hV7mbrZwx44RLk9dFycUl+f8Z+IiQ1Td63pdUanc1o=;
        b=gMZJobZx24d3fgkzLesCVxet8VS/BvfLSUaSfAxfd3HL4xtkxJ2IsafirhYw9l4Cfq
         8B7gj3UTtHMJ6MLT0BmANKkAD8K2z5mjhI0yv4cr97/klQqdS/TDRTxpgYNyBkTcGWTx
         /lkJDeYk1xVl9e+QU7l+smPf+XvMlaRjmuqMxqIhwRTXt0TZbEpNudwcT6RMtd5aF8xy
         7HUo2XjfxAbtIxL/U3i4VhHRx+CwaPjJKujia7iOyVr0a+WtVang/ezTs4E+UcB074gO
         QmaRcAMW4Liy8eqaJw6TDyilQqiAmgEtAu6WhIy/38pvPH8pn5n1xlU4HaPEY+YFKTbg
         icWQ==
X-Forwarded-Encrypted: i=1; AHgh+RqoE5zkNThrxPN5r/Za+lU3LxwSDFjrkaflK91at8Z32X444KPZAkJbQW5STNxWfQ/Z1XgAuwJ233pz@vger.kernel.org
X-Gm-Message-State: AOJu0Yzei9tf2+0uEeYU3K9EirUOr1MOdLAxvuzGUYnae9gMjWqnbwDz
	6zMCXSa1/1kAc8XleQG7CiYlqbz+8K8PvvAgaV+MgfIKCpPYXTnWxR1QF4wy1lt2x+vYuvBn52b
	9U69EaY0eArKukRB+qOH2nclwDMKZkSPsvsTrBxpEgpEXdzUgBEX/Gye4YJuA1Jpdazie8EOy
X-Gm-Gg: AR+sD13L6HzdF/IA8+0o7FrctIDMei9L1vRnErOCpxwYR+h510pPuSf39yzucR27jnN
	uNnCfKaJMTN4KEUe3/vvc0c/cc9TifInuQb/JxLJLu7bXfIkVlqFm823glIf/zGIj95XjN/juGN
	DpT2uNkBxeEDFdIMWd/ctSN8Wi666lxnM+bCdmtl9Gq80p1f2cc1cJ6iS7HXvn+6lMI1n2PleGh
	4vmKu5lMAVgv8B0O4g1OmqCM8v0ZFVLdM4wNG/KaXTVsgwmxC3MGyWn49bzuUC65r201Y4yisDl
	IyBWnIfBqf1K5qx+ipcrU4p9w3T+3XCQLDjTDQwyOWy2d1xkLQnfsJliJ+SSzKW3K4uK5P0KpSJ
	9EXpjiHDkgSCgbQZ1Flq2pQMgkX+Satt8jdWSqwMwX2Kh96XLlTnn0uSD6oLq7MUphuNRdf3p7k
	bpvKox0BIR5jY8fw==
X-Received: by 2002:ad4:596d:0:b0:8ca:268b:13b2 with SMTP id 6a1803df08f44-908813c80aamr450316876d6.32.1786306570132;
        Sun, 09 Aug 2026 13:16:10 -0700 (PDT)
X-Received: by 2002:ad4:596d:0:b0:8ca:268b:13b2 with SMTP id 6a1803df08f44-908813c80aamr450316366d6.32.1786306569637;
        Sun, 09 Aug 2026 13:16:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3cfasm1589259e87.70.2026.08.09.13.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:16:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 23:15:48 +0300
Subject: [PATCH 09/12] iommu: qcom_iommu: allow faulting transactions to
 terminate
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-msm8974-iommu-upstream-v1-9-87f5cd492560@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1829;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=08DI3m/g8w//LYUe10gsP5FMXIEvOf1ZW68iQjd9XpE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeN/vhrwXuGhQLdAzY/l2GN/Bhk6G4tkUR0rGB
 /KpHmvM3nqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanjf7wAKCRCLPIo+Aiko
 1fwRB/9hb9z5gxrrc2rcIX+BFjYiB6RwxCiQoXWl76sM26ATHSTCxaQbuXacXM28jJeLWK9Jd6R
 XDfVZ7yWijF4iAIGOC9vZfvp7ilfem4OWuFalZguh2DSShcqwIaeuf4y45ckh7mbxq/KnGt8LvT
 8vz5KhQ7Er6Cl+yFvH4Dp3nQd+WtIjBM6frxM0UNsvnlobUVUjT8hdzTHCPXuB2Jh175Lho6LjB
 LkMTR3AgAo8SNvuEfN8hjQrt9UEb1sCxl6SBoa3zXaaiE2f4oZiQhiEad3O7XGdZEg7SphvYjfM
 uOvwfPPgZBGXz97OhCyhT1AJs0T70xm6aM2/RcJEouk3hfwB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=eqbvCIpX c=1 sm=1 tr=0 ts=6a78e00a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=9MEWnGasQQH83fMYMBYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: SiKXrI_Q_qrz082DJkqH49uSDtXejOQ1
X-Proofpoint-GUID: SiKXrI_Q_qrz082DJkqH49uSDtXejOQ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfXxZyBpp+I/pY4
 l1ieapUvqOQjT5a0Lq27ZcReuUv+yNUaZgMMLX5kjSQzklEBO9Whnl1nPYke3KevyD4AZ2BLWw6
 PETT+cIg3WosEAYXOg3tYwrfK4uay/0MQY1Y+hZ0mXtdGTkW1Q338QvQoh3K5svCjYlH/i1B0MX
 sm98EibnWvrLgnjfK0xM+QUUVIR1/YkaDF03ad7kZdBdzGgzLlp5BxuxXaygP6S3o/4XO3O/ZPU
 ne+8kic29z9dguLBgg60y3WVwBNtnYGldpwzUd34PmJCP9bBvAXxC5CRCIMJ9G/CAvlQyHeA6xq
 ScBY2HlW7fQS8Y2rTYE/Elu9HAqXRNkswBQB8kXvdRCr30S8Hb7RSAzp+CJBZEo0TIHKmGrZXtb
 YZAyylHIAP014vuqI+z7ulxucydzR3nJ4UVniVJB1OTMddOX0CVnOIifg15yIlYX2ArTDIwTJGr
 1rn7q5AGccBByt0OZ8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX/OV9Ipyijzs6
 LEmIGazilwVJichwk3FmwC7DJH5JlTpNb3sCFJ7aGWGLSH4RJ6ceoX4uihkquNOn/LSE0SADCKm
 tqflJn9m7q56fliYmp/TsgMe8wXoRYE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090183

Context banks are programmed with SCTLR.CFCFG, which selects the stall
model: rather than terminating, a faulting transaction is held pending a
write to CB_RESUME. Held transactions stop the micro-MMU draining, and
anything that waits for the front-end to quiesce - the halt handshake, and
TLBSYNC - waits on exactly that.

Not every instance wants the stall model, and some cannot tolerate it.
Add a per-instance no_stall flag that clears CFCFG so faults terminate
instead. CFRE and CFIE are untouched, so faults are still reported
through the existing interrupt handler; only the stall goes away, and
with it the handler's RESUME write becomes a formality.

No instance sets the flag yet.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index f27f8722ee64..2b2cf665c39d 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -76,6 +76,8 @@ struct qcom_iommu_cfg {
 	bool				 ctx_restore;
 	/* the micro-MMU must be halted while its registers are programmed */
 	bool				 halt;
+	/* faulting transactions must terminate rather than stall */
+	bool				 no_stall;
 	const struct qcom_iommu_sid	*sids;	/* one SMR slot per entry */
 	unsigned int			 num_sids;
 };
@@ -500,6 +502,9 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 		if (qcom_iommu->cfg && qcom_iommu->cfg->no_afe)
 			reg &= ~ARM_SMMU_SCTLR_AFE;
 
+		if (qcom_iommu->cfg && qcom_iommu->cfg->no_stall)
+			reg &= ~ARM_SMMU_SCTLR_CFCFG;
+
 		ctx->sctlr = reg;
 
 		qcom_iommu_program_ctx(qcom_iommu, ctx);

-- 
2.47.3

