Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4E54189D8
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 11:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783337566; cv=none; b=m0acsnD4iloLviuquJKwuzUR22xieA1GqdZBht4E6IAh7BBVU2iG4q6f7EuaWnVAx6EHf5mZ+C3V/Eh4IrBaYe9mg+rfY8YQibHvcOdECw1/sYrbm0NOEP5g2zxbbg1BhWXlopCorQ3fC+aTzRb3PR8jBxayzRkhiJrt9v82Qkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783337566; c=relaxed/simple;
	bh=GYBtHdAfmrTdiirah8LRW7CT3SS4Dm/ZvWHw8lcOR9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uojPGRjcLm1rS9PhbWv/jzVJi+bFtneS1IupWvb+DlpNz/Ys6eMUyPE+TypLIORNxgMYeGf+gTCe1QxVr7Rvv+m4BjhhGY1m9WYoz2N01vvxCAP1AFah6E+SABJTCQSA3pgiqTWt8IlqijVLGQNtPU6EY0rWgRJ/Yk9YHnCgnGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NZmmDXSm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KpxD1iTK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NZmmDXSm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KpxD1iTK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxKm6316483
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 11:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0+52xMxNLQjypHGjCHfpQGl3UABCxpAIWFYZGy+rwJc=; b=NZmmDXSmzrivJIPd
	ZyZ0MVwKD/gP6BFrJxyqG5n4FwkftO9QAGxtEdYaNcL6y+aAcDvwRaHBnM+zOpfD
	Xg2A/tN512eMRk27ltjDJ51g5/7gVrlKUZXaAW43w8fG+TPa4zi4wSCr49zj30BM
	SePssU1S9FOZ/L45S7Bx2PSDEBF9Q6tINSmNy/Z/lp4ZhR50WnIgoxmZBOTho+3B
	C/6dQeIrIwUvPcz+Bw/rnni24NlhXzjbghVpiYsUoguG7FT8zj9ZgvC9bbnAyUsb
	/nCYYL1XDEk0vZC8+1gKcr+s1qPUfOsMDO0v+MZ41fRReIvmaVg1VURJUqUGtH9C
	vIKGZQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7h0rh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 11:32:44 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-845e3ede1f9so3261520b3a.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 04:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783337563; x=1783942363; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0+52xMxNLQjypHGjCHfpQGl3UABCxpAIWFYZGy+rwJc=;
        b=KpxD1iTKtDkA3avPgQnpDNkhZKnDCb6Rl4TPkuIlSF5MVi528Sr8i6Z3+/iJD2HWIg
         QGMu7M7Uf0zM3ZayBpVmhVwzootIz8GZjabaEPpWWkGTLbl+S60/rCEht6/RglPNahBt
         lzRifZxVce5zfLPMeBaVosxRSktgtgcep3rfZri25sh/zmgHSjTJNTyIgKOatkEzVz0H
         r4o00BiUvn/ALScLIPU9mAB0IbnAv4yho+mVy//OR0pMdWqvs8LW6pQjixLBefSBsY8o
         SSz+n8Bs6758XohO3ICFGTS6cGo6QBhGYzICziDkee0TiLg5cXC/9fGAXKqYEs7o9jiT
         L2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783337563; x=1783942363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0+52xMxNLQjypHGjCHfpQGl3UABCxpAIWFYZGy+rwJc=;
        b=nQm7hqT+JWLCCzeOJUsNYd7ZgRF0l+YFA3nPeVvwSiE0Me1jLNTqjfOx7CqjouUFzd
         /JHTjPS5BJAomFXPKFF/KOoM5RgYOHNZ/8++31I+flfgViDDZBu2TUeZNoSiZM5LbrHt
         wXyhx4Tom2RREbT2sMlD17JoqRxQ9dSWAHqy4F3LeyXuYUwqn80jjfhx+lF6J87GBngA
         oOOQa57TVMOjZuyOVWJ+otgpeguZJJvuyUm//9ImfFSiy5cAnyIFbVris4Gf05svLm3s
         rpJ9/X2HAictT+Hy0raBdY8KQ+NaMZYqrRpOuPfS+cQ9mEA23vX7nS85zsKNUM402Kgg
         X1AQ==
X-Forwarded-Encrypted: i=1; AHgh+RqLGJM1ujDOVOXpc8RHKXNWLgXz/WGzkS7WrHRsb+F6p6QgxvEk+at91H7+4ob4a4Wy5bg9R5NhUXLZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyBHc4RKeQZpUf/tLfC36woAUqebYVDaUMny7jcxrcdN39sEqpj
	Z+YPAQarSkcbiOTIcqwjYxdneBW4iRlIAFn9vyyZP9EZxgvvzIrEnaMdehCy7k/Yfl7cIK9VYie
	Q8t3/76zAol215ukW2QMziuNHdqnCSSTCktP6MfJQ5jJnUbjMaXMMHOhd4TeYhSyq
X-Gm-Gg: AfdE7ckNTYl1EipwkrbI4UlrcQweBfz9DfgFVUGlWrKsLDG1hT7z5ftXwZxhSawbJ+n
	qdBkXfLWBx8NwF8nG65AbD2Smj9L4kbUVeGdeArLmlXyrvHS48aiqwtIvJdCU1eEqWnE2xqI8wQ
	ymN22TT2JfrKzK6seVKFPwMFZfGzu9YYWz2+7cQLVeCBP5eRNKkpgb8ZKCLmgiNsY6atBO9jn+2
	ytjBkNq/a1dsMlrMojVK+dp0GTNy2kKw/FbzQURTlkp5Yq/sTDpBF9o4WfvkqX1TfZt9pp/yyht
	A8PhpCPD36cUnTxpwSajgVmFkoarGAebAMW5z0gLuiFmcB25CzbtYAZ4K8/12PCGh2CXEyEDtJg
	mFt/o+bfLT52P31Qbp4al5Ark6p5J8ppfOqpA2/jPpQvM
X-Received: by 2002:a05:6a00:f8d:b0:845:44ec:a648 with SMTP id d2e1a72fcca58-84826c0e777mr151323b3a.21.1783337562893;
        Mon, 06 Jul 2026 04:32:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:f8d:b0:845:44ec:a648 with SMTP id d2e1a72fcca58-84826c0e777mr151295b3a.21.1783337562368;
        Mon, 06 Jul 2026 04:32:42 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6dbdc8dsm3576621b3a.55.2026.07.06.04.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 04:32:42 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 17:01:34 +0530
Subject: [PATCH v3 6/6] arm64: dts: qcom: shikra: Add ICE, TRNG and QCE
 nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-b4-shikra_crypto_changse-v3-6-23b4c2054227@oss.qualcomm.com>
References: <20260706-b4-shikra_crypto_changse-v3-0-23b4c2054227@oss.qualcomm.com>
In-Reply-To: <20260706-b4-shikra_crypto_changse-v3-0-23b4c2054227@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExNiBTYWx0ZWRfXxtPPKow3XBJb
 jVbTmGgmafvD7wc1Tw2m+kA9PEKD4IIGPh4jWmHYaEFQ1Q4b0CY6n+M3isw9mDTtU8YSekcCXX0
 IQKL0sBmlzWjCBpK1ZhaT31KC0hQWeT+wTYDKSviFFV2QHxFyq1s+1Rw3utzbCCotoqVu3Hv7HP
 rXthd0o0grAkqY+BrdBw53C4apA5YVypuvM0zaccrIx6OS/xQXa5/PWrJhmK/UbO6CwSZxoKm8z
 wXBvyBy0Z/FvoHyHJaFC3n3JtJzDiwkIvVMwnVwlS6B6dp3qpYbPgJPr/uGR8VSzM5V9fRPvG+q
 hIr4+h/H7YPKksuWPASj365cvnccHf/kVKYMIhUnAGEWWKMs8zZHvQKmjyx+2coFYi5i5yZOTLn
 2l8/3idPMmmEyKb6hiyio/R0uzq0+vZ8ZCBfanA9ryyl8grBxvc5SXG7nMlAE97uPJQU5HqlTXc
 Uae9HPGsZrbhWhzRGLA==
X-Proofpoint-ORIG-GUID: ZAUal88xvNVREWAGg2cVXTf4BjiJUSQo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExNiBTYWx0ZWRfXyqt6Y+9LSl+M
 EvWkKatSDsxfNKcrqnGn9uJ0ZyS+jFKnkI9LuPX+/DLAmMUwFSaIjtjx3dz6/6U0GnXRfrarnaQ
 6byQWl3nuY6ACujAe8NOIltDmhwJwvc=
X-Proofpoint-GUID: ZAUal88xvNVREWAGg2cVXTf4BjiJUSQo
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4b925c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=UqF9ul3sJ95V4vUiljcA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060116

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

