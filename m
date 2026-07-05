Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C728352014
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 08:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783238476; cv=none; b=TBh2haFMfLQXmZu9+vcefxPBZTCDuUll6Wqbv1+zuhJLUzskm/kxUwzmDCoLjYcJKA1IHCVnHTYo4C/hbvmDhbGdXHkJ6+Aj9BHdNjmn89FGayc64aSD3uk4SWRMQL4ciZdo5+aKRPWeG3dTh9UxcbcbPqQf/4k1C8/7TgElJUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783238476; c=relaxed/simple;
	bh=OI1UXEhAa5SC5DZklOc1fijHPDyOfJ0YDvWOJSX5GAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PoJBoVev54nuFp4+QF586xmkDLZYHnknXWr5496Xvv7ay+c7rDZC9SXsMtO7in2KgfiCRVX4Y/pwnMyT+FldeFVsQYIYr0QOuZwQ6Gvu4gLTE0EBRmClQWhZoGmb8yXtoHEY2geoDqjxKHj/qF2R2iMR+fJelBQAcwlY0JRLAFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F8GfDW9B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UtIKl9/j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F8GfDW9B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UtIKl9/j"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664NbHg94191791
	for <devicetree@vger.kernel.org>; Sun, 5 Jul 2026 08:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	StFTKdXZGdZFi7CbJzvKqi8zQb82h4UxLwN1tS4qKbU=; b=F8GfDW9B4t3o2Ow7
	mSFrZM8hZj1xH486Ik8lcZU3sm2KfRxIrl+rQEv7RzYxBCgIxJ+n34qiA6D/rQvF
	xzEVZamXH8bwZ/zTSKtDygn++pp4JQy8svP6OwYl41aJ3nIZA7SS4qo9fazTtq2z
	N+wQZyf/FGtAOEDILB9L5Vv0njN3slMLQ19gkGitGsVq5Pb9aRLCA3PbSzxpuT9X
	88rrgTDM28pUD0QkGPwyq/7tS0ZkEuPVDx66hN0rf5QIPGWjUhxRU4PQBgcHlfgd
	YLO+NNb/WDMLXeU/dip7rvBAa5XDpIjaAOKSkMp5+b7esCZuR/VV+7Xm4eNAtbI0
	FpkaZw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6uf825sh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 08:01:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88aab7c1d4so1524934a12.3
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 01:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783238474; x=1783843274; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=StFTKdXZGdZFi7CbJzvKqi8zQb82h4UxLwN1tS4qKbU=;
        b=UtIKl9/j3zBBGgG3glrDrwIdG8A2mQXxkzXnZwnoBJPBcPYX56luMdjAAJS1831rzr
         6ZCehSmFKXWcuJMv2MeCqn3VQHKvznjP8w/YhVE5mTYtg9D6QyAD9xYp/FeJeJBoBPp1
         8QJcvaGG8YlyeTI72pYMz5NA5H7dR1eY2uUOtX89iUhPDd9IM/bk4czKYHn5mhoGdCCW
         dD1PY2Gopu4DXhjZM0S+zsudWq45G10dUl5uE2hG9OtcKbiPG3sHfidcmK2BmB7Vlg4k
         DaKe5l+LpcPmCGxG1ui1YRh0RpjjLbJPrbom3OLFRNF4K5VqENNFR6iIfV3AWwOqtefb
         4U2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783238474; x=1783843274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=StFTKdXZGdZFi7CbJzvKqi8zQb82h4UxLwN1tS4qKbU=;
        b=be+e5zvLxw51Lf3qAEGMzfXUr/0Of2sbdUHQeoPlJcHOC+5H0SQRIcV1J1ZPXULj2y
         FqlJ6toyETKrPZu8GcKs1clgq9uQ6oPmZr821SRaVWkMqO29WoUOKQR5FDpQRAGT27sE
         QEtiGrXLT5zo6+pceEjdSUa2nMt+FHuWLfFL6ak8o/UJfPUiOA4lJyp0q/DfkkqhNW0h
         9It1aYU3aUTIr8GB02yTUWEZeTQHN1B6VVGtQy5FBvB9rIu8kch09aSPMGIMlIACeGHI
         u/MGbNXaKvGZEzzi4pU5tVqJHYOZDLIr2/XaYzyQMlyKY3hmBwL4IYKsnX3woHMbkdzy
         68hw==
X-Forwarded-Encrypted: i=1; AHgh+RqEXu5KU4m+aMioRPJQRvBFjzzXPIK3mTNm8iquyUXkU2sRmeucWKD0BhP3l+e1Z6vFlH/BufCjOqCf@vger.kernel.org
X-Gm-Message-State: AOJu0YzYUVVme+S3tZ9gFVrKgwq17LpcGteGxcDDBqez258Ktr+ca4gf
	gUCVP50Lf/O8pbVU/JgIJ//7iQE7BavFXoikpV+ZyG5vZuYpTqJz7bZhVaB6qDPi2i74rbvTm4b
	YbJOVjHcMTEEpGmZ4MXo8mIWtRFqzuOAuPx/TrCYsfoQF0ECp1eaTSTj3udsNKRQQ
X-Gm-Gg: AfdE7cnXRrRXHlSBp5d1KJDi5127GWR3Wk0hICkIJuvXjzgwuuyaQnyOFQ6fhs/6gXD
	0LWBJNJ7LQa4zgJKGE1ESDAURO5R+hAl1PGQiki9suHZGVHzgNO+8tRddrDpxgJer/AGRyUTHwA
	KM3vmh+33hvmw0FQMOy8hZvjR142xRHN8fL7NolXWTGFbo0wh8ZryTCIstI07bxfGc819uYBY31
	ag9dUbHZ894v8Jb0WHyMHqALUuc9gQY+19j+WAtgxalo44DnPLBgf49K5cvBlt34nv39l1qW2Mq
	ZaZoY0Ja/qv4hMAo0waCOVwt1VnGjTRzi/Z/ku+a3DdECCMJheDljJcnwROsgAoP9KkOUmJonjl
	MAqyIH8+egzbzYdOKnK6v//RX60EXEnnvtdE=
X-Received: by 2002:a17:90b:4b06:b0:368:ed26:15b2 with SMTP id 98e67ed59e1d1-382807af3c4mr6120309a91.8.1783238473295;
        Sun, 05 Jul 2026 01:01:13 -0700 (PDT)
X-Received: by 2002:a17:90b:4b06:b0:368:ed26:15b2 with SMTP id 98e67ed59e1d1-382807af3c4mr6120271a91.8.1783238472790;
        Sun, 05 Jul 2026 01:01:12 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3113c88041fsm7759179eec.15.2026.07.05.01.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:01:12 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:30:07 +0530
Subject: [PATCH v2 3/8] arm64: dts: qcom: kaanapali: add the GPU SMMU node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-kaana-gpu-dt-v2-3-6ac53de56314@oss.qualcomm.com>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
In-Reply-To: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Qingqing Zhou <quic_qqzhou@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783238440; l=2414;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=2J3wxVNsY4ppAiRVvLGUwPpm/Kmj8pqOhBbdF4kY2vw=;
 b=k578A5/54ikUDp8kLnqQMv2fOTlVQ7Xm5nrGCJ4mzGkT7xA6MAy/zLB9vcpg4v5kTvgvtBoGk
 96g1g8ZDfYUBT5FeUIfmS4ddkZABbHayBtPZcgQ7p3K7fwb6+/tGgcM
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: dAdDn3eJHjb1Ee4Ki-2VMv3bUUzvRaxv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfXz0xmmlq+cagp
 1s26iVng85Eq6LWWyJn0ymp8gkmZ5b702QHMscRXlg/oj9+1vxFL3bSswMo0UxnJEkoTdGV7KrX
 4NX/KKoFscrTVEXZqNQgXdiZPe+Cezg=
X-Authority-Analysis: v=2.4 cv=Z4Tc2nRA c=1 sm=1 tr=0 ts=6a4a0f4a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=XZrIUYhEBg08vmH-lqUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dAdDn3eJHjb1Ee4Ki-2VMv3bUUzvRaxv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfXxSiYOL5XMC0w
 FMc9ukaBBlrDNAvwZfXWkUSG3Ube4x6giNonKTT76+7SDR2dtY7vWDh4mPt8CUVnsw0hY9HkraY
 4efd99D8Ry60wt3wji6lVsrk8Vitl2dEjCPUpFr46ZPonhJ//4iqOnVp8tPaWtdSwIUpLABACdM
 4cAc8DcXtuwS1DN+3bHSm6sikWmx7aMQrde3mWTOA9B1zXYyjVWAozamHlUhyj0TScJ4Dfa71r8
 zaMUWxTlDEJJsaI3+vVsntztsSmrnzY3nUBcN7YLrhhDr+ddeKcjz4BOK4Rxw3p3JeJgKAGvSKn
 gDEsDGMhSYRMo1dgSM6qx+rOZpb4PA7HVaAxNxkSH8XGQduqhxvHzyUT5VxW0vSechycSLMgVpm
 gLnhkjJ4lF4LtAEOvR5IQxW6qPRvJE9gKBrblmiU2zeoK15nlCUkJocfO9N/+/1qR9+jbUX7IAQ
 Faxv3zEYTFd3VY5e2BQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050081

From: Qingqing Zhou <quic_qqzhou@quicinc.com>

Add the Adreno GPU SMMU node for kaanapali platform.

Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 43 +++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7aa9653bd456..19eceecc2a19 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2601,6 +2601,49 @@ gpucc: clock-controller@3d90000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@3da0000 {
+			compatible = "qcom,kaanapali-smmu-500",
+				     "qcom,adreno-smmu",
+				     "qcom,smmu-500",
+				     "arm,mmu-500";
+			reg = <0x0 0x03da0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			dma-coherent;
+
+			power-domains = <&gpucc GPU_CC_CX_GDSC>;
+
+			clocks = <&gpucc GPU_CC_GPU_SMMU_VOTE_CLK>;
+			clock-names = "hlos";
+
+			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 667 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 670 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		remoteproc_adsp: remoteproc@6800000 {
 			compatible = "qcom,kaanapali-adsp-pas", "qcom,sm8550-adsp-pas";
 			reg = <0x0 0x06800000 0x0 0x10000>;

-- 
2.54.0

