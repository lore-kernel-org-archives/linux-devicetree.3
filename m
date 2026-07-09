Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8834499AB
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 18:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622584; cv=none; b=SZWLG4ewvnIa4aHNKqzwD7ry75VhV5jrerGlFi9o9wtMCDeoJXPKURfHSbAErB4S6UM/q1FD23T/pWUHsH9yQ9LgaO31aaGAX7gjUsVVi/AJXYPnmNLsBsKDu1m+3uFKgy0YxRA3lttrjx/ZLS5e3+xyDOZqXSmDKB2+peeyX4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622584; c=relaxed/simple;
	bh=yGsij9VKWI7rB/vT0J8nK7LauF77nPjz0MJTy7VKUkY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K69Szt3RKbnNrBLDso74btJ0qSQg/v+fYv6Z7cV8YpcNE9ovuC7i/hdYSHjw0S3Eb/h0uWqgBGVHgQS4hOmDIDCK4pgqQpdCgPrQIEV/0939G+o/0hiNaORK5PMbHBzSrptulJrKLCUU3HHbxJ9PnzcMqA4XCxisHRAu6s71d5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nn93OOl8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TWlzLJFg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nn93OOl8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TWlzLJFg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HX3fx2563618
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 18:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2d5kwEQJ4zj6pWZ0cwELlzSxpmKyMsiG0qTFS7qufTg=; b=Nn93OOl8OZNvmHgX
	gvJJp5QWD8pxMtDdHmWnsdrAZYMSIBorgL7VdW313o8cyeJEFCUe+Ns5n6Pj2G1Y
	dfOfGefQdFUOLAmNfMULNJ53GMT6g8U6vVNKvnHfl+CC9+0/XY/dCIgLEz2MS0cA
	OR3ZdUxt/zV2qH3Z1FCZtTtq5dlLlWdpFcWNReTWRvGmA73ZeH4LjvjRPD5Xon8G
	vxFnXP6Fn09KMDSrgj60yrNRaPl7kLL+K4VdnTU+hW7LpwfEMqRKj5xnPZ9qC9d5
	jawDxZjcAW6rl7rDnpyK1O3+hsvoslrNdcV+kd/mtbYCgm9gY4oO4oD+iLH6TbPi
	weFEEA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeg3gx64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 18:43:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37e5ef8299fso189044a91.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 11:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783622581; x=1784227381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2d5kwEQJ4zj6pWZ0cwELlzSxpmKyMsiG0qTFS7qufTg=;
        b=TWlzLJFg80+ai6qOT30OA3iCwhcptd2kLAb5sPiOCi3sgwknfq16CtGJ4BMY6vOaw9
         gjiU4tWa3wYdyXcfD6DgdhmEg97smXPAuFygcf1p8NxDf3eAQHPpFO90sLQFQkOphHZF
         XrRm9dBBFvKxuT3BoOAvB7+HO+nQpFhHXg+phehJaahf8+7NiFJ5/TZSTrGqBjaGUbXR
         HycEkiGdMpogX+mnzma/8Jxz3R1Q8ETYaKZoj/wMat84HYUOV/5e6fzxFWVdffQSH+bi
         53TprV3uBO4ScHy9h09io9ErOa7CjnMRQuAvGidGyZ/SWCqY9XPwTCLYHvSh79q6pT+8
         vDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622581; x=1784227381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2d5kwEQJ4zj6pWZ0cwELlzSxpmKyMsiG0qTFS7qufTg=;
        b=UbJM/tlBi6oBI7ZHKdKDpPDHzRNQ3R956TR+so4uZlsIxMbsIqaVcvHeh+TMH7PtRd
         FOMDxLXFGh8whXgpshczhbYK2dba7Kjyoh7gqaYuEY8zdHaK6I4b85uHEH7Pr7XfEZQx
         QXuxjfNC4m1qxxadIgE+ywJFWs07mgQXH8cNtE+nA6PbRrVUvmFDEV+f4XHfcnwhXCj0
         wOj7aNuOhzIf64q3o4XxiXfD78rGUXtPZjob/J2rrKz8cWLHIzn2VkTzAqMDlTw2jnfZ
         eXFtzPnDjbJ2hIAxFco8VbckP+MSbkf+KJLFux87G9hbM99Qj0OkZ5zbgoGZfO5KGBns
         +WyQ==
X-Forwarded-Encrypted: i=1; AHgh+RqYMgHdCB2+W4ORZ0N18ZZ9RuEYkvl2L5+U86e1ArbZCGE+sbVuCE5SQb55VqCklb4zdxvXQ5H46aBF@vger.kernel.org
X-Gm-Message-State: AOJu0YzzIZ6t8cTn7futZZe9EBzSQClEGSdr+iCQVlX0n4HvFmnV2rU+
	/3rMHMF9pYkfS3hwoDohhlCx7A3q5X6teDRv+ZLC7ejbb4uYx+syH5/JMfzUejmMfYYL1FH0ozW
	v3ZfKs+DZIui8mUX/WEe4w/bkLv0Cg6L39wX7Ao7/J3t3GKiBV1FZEbBIrUAi2n+2
X-Gm-Gg: AfdE7cnjb/QNzpAdwksF8njqj5Epehrn4skViB9K/0aDJ76QEC2LDpod+ZMsJjHnSrX
	FWea3YNoAUthfyMpJe2hIPsa6aA9NWCAms/u6rahNuGN+M6h6M0G8hg3uAvH+HMPJCDfqO4g70B
	dTXKVfO12Nak2JZ2GEyuwk0xaX6iNNOyeusSGg7AtrbJ2O0P3kiEBnCTK8C5cD8KB0Zmp6CEEFL
	NsVeamZRVqwJIqQK9PiTBy2bKzsWuMjuRe11Fczn4ClO6/FOx6s8+tEN34NliOO91wOcvJ3AlDg
	VJAbJZb4DkLdNLTt+Q7cnZOCUcYjPZLWB80N6JrodkFohoayA77zv8D5u7Xeolxl2jpZ+GMA1Xz
	xutJCaRuAEFfvbeQUIkPDnlacsbzfG9t0kSw=
X-Received: by 2002:a17:90b:3b8d:b0:37f:eeeb:646b with SMTP id 98e67ed59e1d1-3893f97ccf5mr7914188a91.3.1783622581511;
        Thu, 09 Jul 2026 11:43:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3b8d:b0:37f:eeeb:646b with SMTP id 98e67ed59e1d1-3893f97ccf5mr7914153a91.3.1783622580962;
        Thu, 09 Jul 2026 11:43:00 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm34205652eec.16.2026.07.09.11.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:43:00 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 00:12:03 +0530
Subject: [PATCH v6 4/7] arm64: dts: qcom: shikra: Add Adreno SMMU node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-shikra-gpu-v6-4-b388ec5dce77@oss.qualcomm.com>
References: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
In-Reply-To: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783622535; l=1898;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=EYNcq3OFs2Ql/wREKtEM5ji0GMxwTnKnJ9RpGAjMe6E=;
 b=2hVttTTQRx5zMnrLWm1rAziEUo0KqAbW50W+2RE7kkRSP52+sN8ta7ltAR+qhxhPFdVtIsNQT
 21HAwNZOnqjA1MKkTJmHPKDYJ149gLd1W3/OoOL0yOSPJS/9mcqOXYo
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE4NSBTYWx0ZWRfXyGfn+lv9N5a3
 HL0/PWhopjqgZM4iR0BdycOorg4R2iCm3dJdwHMLIamYb+O49B4GY96538m49dhtff6N+sxRglB
 zCVEiM8ObhdFadYj4VltHKBuaxdUegGqg9HoDPTjzVCb1KO0bh1lZm/up2UhJQUUETY9ifQLmJR
 EWV7KQsZieogmChNQLeyIRWk8UOHFxegbCYGslkxaI+KcLrBm+9NVYnrc+shAWX4L80TY5JnvRf
 /ssVx3eN2DBxc9JGimagNV6LKlJZUP9+CeG5mMqp0D1hPLLOPJKtXkY//Et0tyPdX8Ba5Q2lQGE
 c+yyM6Cb6SM7KInSn0NRI6V5wchqiKjkGnHwoikVuPUBEDEtV8Yqa4l3tRuSLOAUDqEfr7obEPa
 cLkvjdLhPNMkozrqQ0TQLRqAU+mAr1PJZZPU4f9ram4rC3Cr1cQx+9AvwfanIi1MavGA2c8j+H8
 y5b+PN2Y9p3sOVWHDmw==
X-Authority-Analysis: v=2.4 cv=ZcMt8MVA c=1 sm=1 tr=0 ts=6a4febb6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=zTWU315qYGxAnKAOPQ0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE4NSBTYWx0ZWRfX4xt6rJx9Bi4G
 MdAk4FTdjIhJU6jO2sUoNcFc9VXthCLOAvpmwfMzBnEnoKMuufmIVhJy0UzYAwXCINIWMw46NJN
 qKSCSE5rHU46UdrYZZs+CD2fPjUlZ60=
X-Proofpoint-GUID: -9TnMRbfKM51G5Gg2YVWR4vs7BlCRrIy
X-Proofpoint-ORIG-GUID: -9TnMRbfKM51G5Gg2YVWR4vs7BlCRrIy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090185

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add the Adreno GPU IOMMU (adreno_smmu) node for the Shikra SoC.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index be443b362576..bb11e832d9a6 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2005,6 +2005,35 @@ gpucc: clock-controller@5990000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@59a0000 {
+			compatible = "qcom,shikra-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x059a0000 0x0 0x10000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+
+			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>;
+			clock-names = "hlos",
+				      "bus",
+				      "iface",
+				      "ahb";
+
+			power-domains = <&gpucc GPU_CX_GDSC>;
+		};
+
 		dispcc: clock-controller@5f00000 {
 			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
 			reg = <0x0 0x05f00000 0x0 0x20000>;

-- 
2.54.0

