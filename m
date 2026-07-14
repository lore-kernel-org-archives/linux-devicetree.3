Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA7734E75A
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 10:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784023578; cv=none; b=ARUqH+TzkPpzZhVIIsDeD2H7z91D4tJVTFzqUb68gAX/yQm5g3oFldlT56FmkS+U3fln5z6el1yCwIfWaxZblLXDoFb1fxc9H53BoJu+r8Pn6njYZoqm/+f5FjlSEQ0DwUJmBWTh3CNnO6/dWQfaFcKGTReLPYMxjqC2XlhkBgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784023578; c=relaxed/simple;
	bh=GYBtHdAfmrTdiirah8LRW7CT3SS4Dm/ZvWHw8lcOR9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GWnUQEb/mtYLIwtir3YNbXBBx5dfusr2TBlw7hs5AeCyESBTop7x/kT7W9DvR3dzn4V6cCJVU3Il9el+lT5xYLPu+4k6tnwu9VM2/qkNtIK0wXghp49qmK5DpBEphEsetPNUEd3FZ24Me5IFQVLIJVhV8F2jGvfbVYWPC54mypg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YlQUfrF2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VkvimQZh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YlQUfrF2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VkvimQZh"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SZ124005246
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 10:06:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0+52xMxNLQjypHGjCHfpQGl3UABCxpAIWFYZGy+rwJc=; b=YlQUfrF29vid3f/2
	AmiT6GE8+d7TsIZ0NuiUUHGktyJMojP5+RsWJ62+EPneAzhjywyAQ2pci84r32zC
	LR1q0kLl2uysNGLti4M5IGCeXjIBUzxgHK0Um1Xl9ksoIfs183SZNsvEsWyKL29j
	nt6ebLBlJdeF5BVqVNtf/jBSPsCHy3gF4io7aonR2yWEweATBTvsQvODM9dSdF2v
	hrZVaE4fJRuoaQTCXWX4zh1KVqUkuRW5W8W9gMZ17J2LT+Vs45piRjzaDnbaHjch
	P9QhMneaCy+Ey2x88hqGKQdTKQtCX7igcf/ZtIWluc/fWUf/SgZnjiRsS/q2fo4o
	yIvdRw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44cu6wy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 10:06:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c354050c34so73852445ad.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 03:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784023576; x=1784628376; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0+52xMxNLQjypHGjCHfpQGl3UABCxpAIWFYZGy+rwJc=;
        b=VkvimQZhK3oMMQFR53RYN0hajD6ShZs1YmoVZzYOhQMRZwMZegTkb8k9dayXpOs7Ln
         m51ykmuYVEpx3DWLsea1phjR68FYYYiyI/qjI3Rb/mMkJEoKvHw4PeYyg/9+KMpua4Xi
         HfFX/NKK6EWnwtoEA7WJGypaR3+BP3lGX2EdfrYOU8yZfUpbb6pHIzZ37pENTt3oRgPT
         giWI3BM5ta0liiEr8QS+glRNq11ZolLf3dRhqQyY7lENZT74pYyL2sDN7WveRfg8n4WT
         1g2jibtHuSwiC0tmWVzLusR4d4Swoz7wGasIZpMxtAb0CzzVXsw+zBMJAwZgntT59npJ
         pgGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784023576; x=1784628376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0+52xMxNLQjypHGjCHfpQGl3UABCxpAIWFYZGy+rwJc=;
        b=UM9KYA6BcdFn3aoX8IqIS+wUxlQwZQC7Y/kZaHdQbOTCeOxhhspPRHrTjDgjEVgR55
         NTLOlkyl9/dE6/YJB7b276rWL51xjntws8zmSQXOnbncp/hxaMzmAKmN4VGiMiS0tz8S
         FH5FbauGrtvaMDHeXR7Gkq87VDHYXT5u7H6ErT4bC/BfjBUo+vNUdyofP+U3aKsmlJ3D
         odB1sTXxv3qa4ZcXxIrUBFxBOH76QPU8ljDjyt8dLUlg/+mLAezI1XlOFWZ7q2BBJjrT
         2RAa8uTXTOLQvzga19/rXvB0Ij31oCSmgskJ1uWpAwKWApH5WutJfNacVLTrxfzPFPCB
         5JvQ==
X-Forwarded-Encrypted: i=1; AHgh+RpAfZFP1/83AKXy7yDDbyFczBlebMqx8wN0b2/j7ODn5VVILYmcU0EEyhOdH8ksyEVTmlTNIno9doHx@vger.kernel.org
X-Gm-Message-State: AOJu0YxoNtlydAh/tBoGw3JqEuio0Tsi/hWFrQ517cAVWZZnZbTvqVLN
	E8vu+M6TVztsuSxflB8zNu4bPtxufkdTGlPoQOs85/MrUr0nXz4Da4pxTCR1kS4jeo3wjXp1OoF
	dOmZ/UWIzId+6/2GRDBjemdUy/clgrpasWgRlriy1eBe24qLGdnR5n2ZsjzrMyOHL
X-Gm-Gg: AfdE7cnlirVbQ4MF0tsk+TXW10JKz6UF0dq782RESLgcF61XYmTX+s2kDDRShjLFdfy
	SpoPqL5WXnh05xm1xuQHf74B9e4CQ5Ire2zUoYO4ab2pY4b2yaEhOBN9YWP/MSu1ZhcrKBlgqTo
	v7mi7zPU9v48C748kiHAEoYxXBGf7EtyeVbVU10EgUtDdWq82gjlvXga9cNA09SjYobZaAW/squ
	zGzcmhziP6wtPfbxM5vnwp5oTI0zVpT/9EsPJaK0tfcbWxtLXFRc0bsBF1z5L1SmLVLQCW8k2mQ
	iKz8WWYCnD5ZZIOYCcAG4Q+zQdOSObbkMdhTOROe5T4ian+y4SK4DsqJaq18IGR8cN6Wxd1PIey
	LQMNYXFoqM4SQzaAyxMP8KZgYgxg+/+uD6eV+rN/nz1OU
X-Received: by 2002:a17:902:c94d:b0:2c9:b8b7:5d27 with SMTP id d9443c01a7336-2ce9e7aa114mr133557495ad.1.1784023575894;
        Tue, 14 Jul 2026 03:06:15 -0700 (PDT)
X-Received: by 2002:a17:902:c94d:b0:2c9:b8b7:5d27 with SMTP id d9443c01a7336-2ce9e7aa114mr133557185ad.1.1784023575445;
        Tue, 14 Jul 2026 03:06:15 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf737bsm112653485ad.19.2026.07.14.03.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 03:06:15 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 15:35:17 +0530
Subject: [PATCH v4 6/6] arm64: dts: qcom: shikra: Add ICE, TRNG and QCE
 nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-b4-shikra_crypto_changse-v4-6-06a4ea97c209@oss.qualcomm.com>
References: <20260714-b4-shikra_crypto_changse-v4-0-06a4ea97c209@oss.qualcomm.com>
In-Reply-To: <20260714-b4-shikra_crypto_changse-v4-0-06a4ea97c209@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: LIGYtwMFzNDrwJpQ0DdlVJv0ZfFswvA8
X-Proofpoint-ORIG-GUID: LIGYtwMFzNDrwJpQ0DdlVJv0ZfFswvA8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEwNSBTYWx0ZWRfX6AGEkblxjelF
 CUhFuArDAXU7AkOPeCn+oFrTVa9Kini49swboGYvITB4w/ZAcOe63kxydMFu+MUrHtxRMznL0Bz
 CSkGMD/mHu1f2/Eq4LhwkEUQX3DgVY4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEwNSBTYWx0ZWRfXwtdu6ZoXokmP
 F28asIwcDo62ndB2gGhEhitQSwSc1TIWyQ+aCmv6MXHxcXd4U6WF1AdWS3uXAtGzAltWjOIGyp6
 Ej0pY9tlQ2hwpvZpLvbXf7NneOpaM/22jPdgFI/GJIj8ZJdkZmIWE22qvyAf++HMjFV67NVQ65d
 37cfDBi0kRbr3ESuiazjpN3+8aLkdePwh2i1YovMjX5WGC+6UoxzNFg6cBs2BepKE09/hq/aNub
 MrA4XlT71BZIJ68fBZD4M3lYw92JYx/CJN7tKsdTtr9AzW3IWDxU6i/+o2WMtLL6DYNP1SuwgsK
 lcnSrQ+EEH9GFnVIs+017IHG0sXhUuIGYqAqWc8TH+u0O9XT3qQBmWrqGnPubIZ3KJIFtRJnguF
 kmC5W2q0MTjqs39PZ9gEzkUFzSQUGWK7JCPf7Skzl5Ig5b/dkmsRuSc1DVnuxPoBJNipablDKjQ
 3BkaLbcXELHxtLkPJzg==
X-Authority-Analysis: v=2.4 cv=P84KQCAu c=1 sm=1 tr=0 ts=6a560a18 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=UqF9ul3sJ95V4vUiljcA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140105

Add device tree nodes describing the crypto hardware blocks present
on the Qualcomm Shikra platform:

- BAM DMA controller used by the Qualcomm crypto engine
- QCE (crypto) engine with DMA support
- TRNG hardware random number generator
- Inline crypto engine (ICE)

Also connect the SDHC controller to ICE via "qcom,ice" property to
support inline encryption.

On Shikra, different BAM pipe pairs (for example 0x84/0x94 and
0x86/0x96) may still resolve to the same resulting SID due SMMU-side
optimization. They are still distinct pipe pairs and therefore require
separate DT IOMMU entries.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 52 ++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8e..a95e2140416c 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -482,6 +482,41 @@ config_noc: interconnect@1900000 {
 			#interconnect-cells = <2>;
 		};
 
+		cryptobam: dma-controller@1b04000 {
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
+			reg = <0x0 0x01b04000 0x0 0x24000>;
+			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH 0>;
+			#dma-cells = <1>;
+			iommus = <&apps_smmu 0x84 0x0011>,
+				 <&apps_smmu 0x86 0x0011>,
+				 <&apps_smmu 0x92 0x0>,
+				 <&apps_smmu 0x94 0x0011>,
+				 <&apps_smmu 0x96 0x0011>,
+				 <&apps_smmu 0x98 0x0001>,
+				 <&apps_smmu 0x9f 0x0>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			num-channels = <16>;
+			qcom,num-ees = <4>;
+		};
+
+		crypto: crypto@1b3a000 {
+			compatible = "qcom,shikra-qce", "qcom,sm8150-qce", "qcom,qce";
+			reg = <0x0 0x01b3a000 0x0 0x6000>;
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0x84 0x0011>,
+				 <&apps_smmu 0x86 0x0011>,
+				 <&apps_smmu 0x92 0x0>,
+				 <&apps_smmu 0x94 0x0011>,
+				 <&apps_smmu 0x96 0x0011>,
+				 <&apps_smmu 0x98 0x0001>,
+				 <&apps_smmu 0x9f 0x0>;
+			interconnects = <&system_noc MASTER_CRYPTO_CORE0 0
+					 &mc_virt SLAVE_EBI_CH0 0>;
+			interconnect-names = "memory";
+		};
+
 		qfprom: efuse@1b44000 {
 			compatible = "qcom,shikra-qfprom", "qcom,qfprom";
 			reg = <0x0 0x01b44000 0x0 0x3000>;
@@ -521,6 +556,11 @@ spmi_bus: spmi@1c40000 {
 			qcom,ee = <0>;
 		};
 
+		rng: rng@4454000 {
+			compatible = "qcom,shikra-trng", "qcom,trng";
+			reg = <0x0 0x04454000 0x0 0x1000>;
+		};
+
 		rpm_msg_ram: sram@45f0000 {
 			compatible = "qcom,rpm-msg-ram", "mmio-sram";
 			reg = <0x0 0x045f0000 0x0 0x7000>;
@@ -582,6 +622,7 @@ &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
 			mmc-hs400-enhanced-strobe;
 
 			resets = <&gcc GCC_SDCC1_BCR>;
+			qcom,ice = <&sdhc_ice>;
 
 			status = "disabled";
 
@@ -604,6 +645,17 @@ opp-384000000 {
 			};
 		};
 
+		sdhc_ice: crypto@4748000 {
+			compatible = "qcom,shikra-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x04748000 0x0 0x18000>;
+			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
+				 <&gcc GCC_SDCC1_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&rpmpd RPMHPD_CX>;
+		};
+
 		qupv3_0: geniqup@4ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x04ac0000 0x0 0x2000>;

-- 
2.34.1

