Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C023DABE3
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 20:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786306577; cv=none; b=tMLssxx7C5DCkyoehQHY2E0QHkZe6PMr1ChAPZMn3tFoXSDVzk1fbaSViw2c40M1VMYarwZTmuQy0hMN+OyXfTORxmNFXCyJh5RPTrE/zN8p1QDqPZu6UqZFLkFG1QdGQhuUmC1ZvzBPTCq7DWKp2Dalhw/ZkstHBFdnU9L2Ado=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786306577; c=relaxed/simple;
	bh=7mTJcw8HBthTXbxYIDu/Mf6KA/iBjN8RO8P1CCTFwMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mO2JV4SLbpvsKQUfSkiYN5ygB63BmHZU1F4aLO/tl7uaF49NAjQpmooUCekOb9iHLV3N0vu+wtHYJuy0KliszEMwHKbIgHcu3m4z8NF7JWH6+wL3BLHLyDzorf70WW9bBlvw1m38HGMI3fd+/gYlAh6hAS58wW3LaUkRRIeKQoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZHXdN1Vp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WdETlqOo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZHXdN1Vp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WdETlqOo"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679IA6Bv3372010
	for <devicetree@vger.kernel.org>; Sun, 9 Aug 2026 20:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yk+KYV00feoHEnqEQdIlOr21cfjXAHPNBDwYtv89cDM=; b=ZHXdN1VpDKl+ZNUo
	ODEaQ2l8XHyiBPxTgyi5JmJf7quskfA6a+2oEsWpaXjcf/TwORC9I4Yjfr6rsM5C
	g5qiSKcTK78i34yeMKC/0/AMFu0lvDQy4llT3+dGXjnEfEK7yOHVo2OdMDzKdQUO
	ST3rwaLxP41exMd8U3iOwA1zQVPvrdqXS/cEpbBzljptJTMBO2NSH+GS3lczTrzS
	KzIoKi9luQ0npfbNSnr6zDlNjQB2VoDofL3XN2FMVXZRT5Bw+ba6Mu7uO770gNAz
	RZcIxt5zBo4HX+or/9qFQoYHP5r6nWVwRuRCdVOC9kJvGx2xcUEtg77AodrNv+u0
	ubo4Pw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwush3hkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 20:16:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1a97644aso13452091cf.2
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 13:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786306574; x=1786911374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yk+KYV00feoHEnqEQdIlOr21cfjXAHPNBDwYtv89cDM=;
        b=WdETlqOoZBK/gUwFoFDMU3wEStfHycQ7g8NPXGMEdPRCzakH9aAf5ZkcGa47ou3ZvZ
         1ol4jbXPMJHOeN0eDFFCN1CAIBYduVOL/wv6O23JGp38wOuokwJlGJbhO+CrcXHv3MYh
         GEFGCIYxGErGJz62E0ktdut0+S9IoHLkj4D+lE5iyWXta89YRW8zVKv+/iYig/P8Zq7t
         SoaznifjBaWypDZ/Fgnlt9Mhgxyrpmnz88RrOY8ONLAKI9PRq0BZf/QC1LItEwOD2z5F
         ed+3E6ypMlbzeXGjrpuo79CdzVLokIAEBEFDiN6aZcHJuofnV+5eAN0ijxO9pADO9lcl
         5kfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786306574; x=1786911374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yk+KYV00feoHEnqEQdIlOr21cfjXAHPNBDwYtv89cDM=;
        b=WRTkoTf7GpAXGqByPO800DKeKVqwB/HgA/gXU9raxoy90IQbN+QVBAprmcFdjRWaAT
         L6/HZlhQA+b4Syo2HJSdjIE8slQkkBKihy8pJ7/0Lbx2FDwr+kJTYcglnPI7Da9U+LZX
         tH1Kgxx1tPlioqWMwl1crfB9s59geD9W1mz40Dus8Ze3BJqylJweEMWSvIQlF7kvFHak
         W+E6OueAkT+7SGPowyo9kFsprK0F7UTafxXa/801F1/AZYPmVrk3QOhZ2kyg9tEfnpIW
         oCLqNLMfqZ5jTBVt1Hynzp7OaAAu2gW38idC0q/CdOBraCvg6uhfEDMWQdH31r3wQ9Hy
         VV7Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro+7hOkI+Ko7aXn89CQfI9+8oRibp8uH6YibBG+UTejh3dRPILC6RAoUsvofJKKYl1+FvsYK3FoC9Yu@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz9I5pEYlrsue2GkZWkSTPTZSYSTogFzckML3sLCRSZxTj2LwJ
	RDqW2l0HuAtQkJ4olLXlR1q/RVzIWuphG2VXSf4Pj/zHrx0gp8Q0LLaLMfN7AAiBf7kPmPu7MIa
	R0fWBmqNC9Nej8r3NWhCwVkD1yAqQE5jaQ1JKap/OTbL9TGmA4rXVYxBkJUtYDM2L
X-Gm-Gg: AR+sD12WOTmXHRNoKpViq0GZiPKtYs/k0e57UgGLNHdV4k3wpeiUf1tW2GihNsHXvAW
	Nqa00Pnzs9/fd6wrPyTUSUDUdcy/OfseCBEnMjS9+N7wOeGB3fkhyGYNuSw0E0K2lSTUWTAAh7P
	hAiLfdWxGNlcAU9tgarwm5rqwcsETQwyFolvM14rOTIz4di80D90hMTHKRtJ86fbb5ZRCLbcOc4
	AXAwduB8IzfueiTt5WrZEgxNdlR4FDLTKpikP+sN6jHtMNv505SLCo4+sSLDaH+EvFpi4Fk5E3W
	/mjktzS5BrNRiTROx3lFbLjgzpeqwADHgDTbccyuFQ8FBfhO0ukfTvmoPNlW0YXdqWfIlFLBERh
	zRXOu/UFjFt9WwzIZLH9XFdOP8hU6lrGaDN0Y4cXkLWlrD53xVJftQ9MrJp2P9kdFbfJUTUzqfZ
	cC0BwXLF3wXn1YvQ==
X-Received: by 2002:a05:622a:13c9:b0:51b:ecca:f2e0 with SMTP id d75a77b69052e-52ce5f44c7dmr383805841cf.5.1786306573852;
        Sun, 09 Aug 2026 13:16:13 -0700 (PDT)
X-Received: by 2002:a05:622a:13c9:b0:51b:ecca:f2e0 with SMTP id d75a77b69052e-52ce5f44c7dmr383805601cf.5.1786306573440;
        Sun, 09 Aug 2026 13:16:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3cfasm1589259e87.70.2026.08.09.13.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:16:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 23:15:50 +0300
Subject: [PATCH 11/12] iommu: qcom_iommu: add the MSM8974 instances
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-msm8974-iommu-upstream-v1-11-87f5cd492560@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4519;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7mTJcw8HBthTXbxYIDu/Mf6KA/iBjN8RO8P1CCTFwMk=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGp43++hNuem12DDwajis+OwqIh9iTWMPy7MPfgSALuCYaIMO
 YkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJqeN/vAAoJEIs8ij4CKSjV8aMH/2Gs
 /ZeyCHt2uKgXo7yBo2k08/ksLkKzv4XX6EkQgXcFWdr4a2M43ghcQUcOi4hi97mOoDYxcJ2rtpZ
 3r5cM3FMU2JXbxaKfthVjEkIEaNoq1vaf5emEukCvTuRkIJJRin6FKlZX8uqQu4+2GfQOQ7TZOg
 pe6yokGZD6WNROQOQGw5r1XwNfWvjsf2TAhch8wgZX9GbMAoNKwOXaGYA09g+WaPQTLjR61p7dC
 iX451qTFBgZSuJ6s9N9oh4q5EBnI13SV65r+eZ65Zop/51irdjikPiFhFmsa8UGghQJPohmiX9a
 rTUZgI5FAFu/IgagduF7gsw8+ipPpSIgO2zAyjs=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: LiPfoat7XWRjwfpEJ7vPc4MFCgPJFXsf
X-Authority-Analysis: v=2.4 cv=GvpyPE1C c=1 sm=1 tr=0 ts=6a78e00e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=T1X4G6qr_Viczm72je4A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: LiPfoat7XWRjwfpEJ7vPc4MFCgPJFXsf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE4NCBTYWx0ZWRfX+6RmnOvUGTlf
 +k9f+dtDuuRopKaZnvuKqxGC6oiRn8nhOkz1wMe5AhDl1cu2Rm4rBZ5ARCT3ZtM6WgCZOcscm8U
 ActLMxe2qaqoYurDjpI+HrhairleciKvwGCHsP68W0xQ1KpoLD9AoK4hGSbC0YZNcqHN4fEN/Vo
 k/foYRdSgoMmEgFJDQ1+lnz0EttWkIeidOqNn/G9JvjRBSvzyq8KbaR9w1j/SqUHw2T0OtBXSLz
 QdZ+hPFzcMXTm3I3tgnNgjiPi4C5mfWG0fyu5+tzD28SbYPqdNCodyUxIyJ/UhaRvx0d4hE+/Gt
 2TYj3sLNNltrAEkJ81mnF+TdNCXxD+ouHHrqTmWssIKjcfD7qT1FmBizP+zsSEOChFPdtiGY4M0
 KppUv6Qis/IzP/cU4wIZ4Uw/B2z99HyDsgiTKN3UZeHwhDojemyD1+/beM4zZOFXYIpuAaUAsZh
 lgLN8pBGLulsmnyK/Uw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE4NCBTYWx0ZWRfXwDSbZ5BW7i2y
 yHMDGsaBbwfHKzF3A63NTmPl5ORZx1ECU4oeFfsqAX5K6PMGoDXkg1AkdLbbHa2UElP/gY6VSfz
 sK8j6SNnEBoLI/WYpb4tIxiH1WjIzzQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090184

All the infrastructure for driving the MSM8974 IOMMUs is in place, but
no instance uses it yet, so the GPU, display, video codec and camera
blocks still cannot be put behind their IOMMUs.

Add the per-instance configurations for the five MSM8974 IOMMUs. MDP and
Venus are TZ-secured (SCM secure IDs 1 and 0), so only their context
banks are programmed, like on MSM8916. GPU is fully OS-managed. The
stream ID maps come from the downstream MSM8974-v2 DT. All instances use
the short-descriptor pagetable format with the AFE quirk.

All instances terminate faulting transactions rather than stalling them,
as downstream does. The display IOMMU also halts the micro-MMU while its
context banks are programmed: a hung GPU cannot drain, so halting it
during GPU recovery resets the SoC.

Verified on the APQ8074 dragonboard: kmscube on the Adreno 330
renders through the GPU IOMMU (119 frames offscreen, freedreno FD330)
and MDP5 scanout works through the MDP IOMMU.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 102 ++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 9523ae95fa12..bc7d692a2043 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -1187,9 +1187,111 @@ static const struct dev_pm_ops qcom_iommu_pm_ops = {
 				pm_runtime_force_resume)
 };
 
+static const struct qcom_iommu_bfb_reg msm8974_gpu_bfb[] = {
+	{ 0x04c, 0x00000003 },
+	{ 0x050, 0x00000000 },
+	{ 0x514, 0x00000004 },
+	{ 0x540, 0x00000010 },
+	{ 0x56c, 0x00000000 },
+	{ 0x0ac, 0x00000000 },
+	{ 0x15c, 0x00000000 },
+	{ 0x20c, 0x00000020 },
+	{ 0x314, 0x00000000 },
+	{ 0x394, 0x00000001 },
+	{ 0x414, 0x00000081 },
+	{ 0x008, 0x00000000 },
+};
+
+static const struct qcom_iommu_sid msm8974_gpu_sids[] = {
+	{ .cbndx = 0, .sid = 0 },	/* GFX3D_USER */
+	{ .cbndx = 1, .sid = 1 },	/* GFX3D_PRIV */
+};
+
+static const struct qcom_iommu_cfg msm8974_gpu_cfg = {
+	.no_stall = true,
+	.fmt = ARM_V7S,
+	.no_afe = true,
+	.ctx_restore = true,
+	.bfb = msm8974_gpu_bfb,
+	.num_bfb = ARRAY_SIZE(msm8974_gpu_bfb),
+	.sids = msm8974_gpu_sids,
+	.num_sids = ARRAY_SIZE(msm8974_gpu_sids),
+};
+
+static const struct qcom_iommu_bfb_reg msm8974_mdp_bfb[] = {
+	{ 0x04c, 0xffffffff },
+	{ 0x050, 0x00000000 },
+	{ 0x514, 0x00000004 },
+	{ 0x540, 0x00000010 },
+	{ 0x56c, 0x00000000 },
+	{ 0x0ac, 0x00006800 },
+	{ 0x15c, 0x00006221 },
+	{ 0x20c, 0x00016231 },
+	{ 0x314, 0x00000000 },
+	{ 0x394, 0x00000034 },
+	{ 0x414, 0x00000074 },
+	{ 0x008, 0x00000000 },
+	{ 0x00c, 0x00000000 },
+	{ 0x010, 0x00000000 },
+	{ 0x014, 0x00000000 },
+	{ 0x018, 0x00000000 },
+	{ 0x01c, 0x00000000 },
+	{ 0x020, 0x00000000 },
+};
+
+static const struct qcom_iommu_cfg msm8974_mdp_cfg = {
+	.halt = true,
+	.no_stall = true,
+	.fmt = ARM_V7S,
+	.no_afe = true,
+	.ctx_restore = true,
+	.bfb = msm8974_mdp_bfb,
+	.num_bfb = ARRAY_SIZE(msm8974_mdp_bfb),
+};
+
+static const struct qcom_iommu_bfb_reg msm8974_venus_bfb[] = {
+	{ 0x04c, 0xffffffff },
+	{ 0x050, 0xffffffff },
+	{ 0x514, 0x00000004 },
+	{ 0x540, 0x00000008 },
+	{ 0x56c, 0x00000000 },
+	{ 0x0ac, 0x00013205 },
+	{ 0x15c, 0x00004000 },
+	{ 0x20c, 0x00014020 },
+	{ 0x314, 0x00000000 },
+	{ 0x394, 0x00000094 },
+	{ 0x414, 0x00000114 },
+	{ 0x008, 0x00000000 },
+	{ 0x00c, 0x00000000 },
+	{ 0x010, 0x00000000 },
+	{ 0x014, 0x00000000 },
+	{ 0x018, 0x00000000 },
+	{ 0x01c, 0x00000000 },
+	{ 0x020, 0x00000000 },
+	{ 0x024, 0x00000000 },
+	{ 0x028, 0x00000000 },
+	{ 0x02c, 0x00000000 },
+	{ 0x030, 0x00000000 },
+	{ 0x034, 0x00000000 },
+	{ 0x038, 0x00000000 },
+};
+
+static const struct qcom_iommu_cfg msm8974_venus_cfg = {
+	.halt = true,
+	.no_stall = true,
+	.fmt = ARM_V7S,
+	.no_afe = true,
+	.ctx_restore = true,
+	.bfb = msm8974_venus_bfb,
+	.num_bfb = ARRAY_SIZE(msm8974_venus_bfb),
+};
+
 static const struct of_device_id qcom_iommu_of_match[] = {
 	{ .compatible = "qcom,msm-iommu-v1" },
 	{ .compatible = "qcom,msm-iommu-v2" },
+	{ .compatible = "qcom,msm8974-gpu-iommu", .data = &msm8974_gpu_cfg },
+	{ .compatible = "qcom,msm8974-mdp-iommu", .data = &msm8974_mdp_cfg },
+	{ .compatible = "qcom,msm8974-venus-iommu", .data = &msm8974_venus_cfg },
 	{ /* sentinel */ }
 };
 

-- 
2.47.3

