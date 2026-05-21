Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605BF3EAC65
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369516; cv=none; b=otFpm9CF3Kj4b0qSeHZdD3FGjt7nn1MV0pw3NMML7syrqyYS3cESwWUVA2fJo06w4Klczs1utbgWuufTSxBB5XptWl6nf6cjlDh/qdqv907cH0qqkeTRhVbqJodUyPjwmAWUxiN2br2HDLjwJMzLbHr6gjBwqZxUrEdONsbSW2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369516; c=relaxed/simple;
	bh=71QGoKw4hlhoAusTkKJ02qxBM0g2iiqJRMAT3ERYG2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TS3d5Tnmq7QNeS0fokIKKttoMnBkyI06O/uP12z4/FkXwKvMSrV5i+2u54YOQ2ucc/n1PzNsvvEzC5qRVQf7tp5wd+xJh524Q7adloQ38lgU4r8ZndWKR1OGVjqpTVyfVExQmA5OqIG3SheLdt2x8hVg9D1tlnLbv0ur0mJMHsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=naYUHffm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZYXFwAKZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="naYUHffm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZYXFwAKZ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9AM8C3556071
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jig0qKN5FrrmSyaV7bk3ZY31KsQ3KF1EZdnYMtpttkM=; b=naYUHffm4Tq45TaC
	zZSmti0/U7/OiREEX3cqHTN7WwgffEsI4VknxwYQzQrjFaddD1RCsjGlPzrj2kgg
	EhqQ62UcB2pulapliQONr7P01A1xWzf68wOUo9HcOXrltG0Xn2EGWjc2IOOqPzMm
	nJ9S4tFgNGfiVtHSS+zA+LzCLo8rJMHuPtyJGH9l3DqXHP1HXZFLl3W9y8gw7CsU
	l86YmARZ7e/Cmu7NrTQLu3J13BKR2vFb/fxpj1Ymrzr2z+zF9zntx2HFFfO8CHBC
	ymx84TYz0ByZE6hVEQm1EkiGXkKQwwF+z5kNw3GtEaZz31dUXqXZ7a4eeH39TkWt
	lr0CFA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6mnpa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:18:34 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa2165c3eso3877294b3a.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779369514; x=1779974314; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jig0qKN5FrrmSyaV7bk3ZY31KsQ3KF1EZdnYMtpttkM=;
        b=ZYXFwAKZTVLelbD7OgMl6fjZqIpi88c2E5XnIYzHE/M0UUgZb79bo/A0lPI7bOZE64
         lMmm80tzzkUTFgEWAyLvZBnK7Sx5qliUWLMue6LdmSmL5EuC8tWqE2kiWXDWy81aBroy
         Kfgs1qtlHUhXs9iXYTBzoZ1zSMG8N0KCyhBgpAQNLK8aAr59fgSQtfnax3oLWoIbDhQ1
         4FxV+xTXCTy3DekLzEvQM+hOsjwJSo43EObWpiD52K5CrnPhC+ncF3wWms5LfVH70KPB
         bIUPazjsADaBSa+o4MqJmUdmbJjZWCGRzGiP3JoWxONMHEEDrzQ2t9W1VUEfg3TSh6hx
         COeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779369514; x=1779974314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jig0qKN5FrrmSyaV7bk3ZY31KsQ3KF1EZdnYMtpttkM=;
        b=fi3ArcWhcAuLjMA3KjYTfHEKnaEzlrLNFL9qd88SDlhx5VxSbumGljn4x5PII+WSmy
         RybximyXhjqIHOx6H5bh8oDSeoNinQSkR4vY+HLjlBWcwaV+MWUCEr5kBGGBqmTmR5cK
         tQvzzO1n+0vbFwfldA7Q1GTV5fcQBKZ9IbJs1wklgnyAT8750GCK0hpZKV15AdRJNpIc
         1QhmG2FRvfxFWMktV/s/dP90dPJatpxYbn8dsQLnCAypp5W5R8wHZOX423p1vRsWVvJ2
         z4YtRa37JlxXw6rzwNPKzIB8L8a7PyG1y8FIc2wxqjFNKhaRluJ3toRCKJUOqWjIE6qf
         AMmA==
X-Forwarded-Encrypted: i=1; AFNElJ9YHxGMtMDe5oOkPU+kfHsvhE9R6rwqLrnUbBx299UDLHaHU1DyvndPvtpgwwQICzDBqduJ0HmSPl2K@vger.kernel.org
X-Gm-Message-State: AOJu0YwlXG0jTT651whRQpLGWI9n/S2OyLNL1g/QJSyd6h/ZMw+ROSns
	ICy6uCZiQbKwjjSrb1q9VM28vIfNIxS753/ZoZo4Rb5EyxRUsZhR0dOLofJdkQo0ezKoRxC25cc
	mTm0MNHHYdc6kew1HQRmFlCRKBA+S375J/8q9SCatYXJkL8qMNQvePALlWBAmZD/L
X-Gm-Gg: Acq92OH4amoHSgfFn9ux/vuqFwvpgSauuPdZTs5sLR/ao4EbGJvatH5DbPh9QO0MOhX
	hkF5SZSttrI8tER7MW54J42ek+KceKPv8kvdpWxUd/4K9JAWSaOLnsdSy/D5YBOFmz13fygvTKM
	aMoLgo21iXHIzqYt+xSAXU7++Ya4qF57V0gSbASnFncs451mrFmgwSOGf2nNtT6l2CQCaEhzddH
	togwv+/vwLmFVQRf9aarWnjD03Mt3le5c8qAsqacOYGlXixK6H7UfSN0Q4JlWkvvjA3UpUVUytq
	D457ojW5Ve4RRWz7mGMkHTpOC69h8qKFahCGyyzLHVCPeXDSvKjNMAz4daU+xCAiPnjjkxfnmx4
	PhPKd1WjNuABwmfRmhl5FIcyTcMuFecLv2bzpk7bo4NcK7tVFUFrRQ+c=
X-Received: by 2002:a05:6a00:10d0:b0:838:af72:fb27 with SMTP id d2e1a72fcca58-8414ac6b3c1mr3011224b3a.9.1779369513928;
        Thu, 21 May 2026 06:18:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:10d0:b0:838:af72:fb27 with SMTP id d2e1a72fcca58-8414ac6b3c1mr3011167b3a.9.1779369513359;
        Thu, 21 May 2026 06:18:33 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84154e22f1esm1687731b3a.47.2026.05.21.06.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:18:32 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:47:12 +0530
Subject: [PATCH 5/5] arm64: dts: qcom: shikra: Add ICE, TRNG and QCE nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-shikra_crypto_changse-v1-5-0154cc9cc0de@oss.qualcomm.com>
References: <20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com>
In-Reply-To: <20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Andy Gross <agross@kernel.org>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0f062a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=xxl85nrD-HDipQLZo70A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: GjogMnTW7UF-BAO8XT-ky7wQHCeD-a07
X-Proofpoint-GUID: GjogMnTW7UF-BAO8XT-ky7wQHCeD-a07
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMiBTYWx0ZWRfXxxrRI6N+ao+8
 o/smylC2ToED7xVHt77qrKI7GOgYlfCDpKZA5PDIMOEZO6UzptCPHtkqA6oaR1En7kVovqJnfrt
 C24IzjK5P5p2DvkOZQcAWWCJBlf5hAZVnytQeHLHTMGgbEgR5sHFYnstAlirqf3LgursQwnG7bL
 udTmQcTtHr3+qhFPUH1TaOJjBIjGQxkjILdkpLi39JNyQaI5I37QyRJi4GGwVKQ5kPxoBdlQ5jI
 GoYX2jFkmTK1i6tyqCnPHd16L/5E/zNHlxipQyvSABMXaMTwYIOWpbphcWUiKjGfKNRw+vHTZZj
 DDBi/G+j5QOBpO1kQXmbBXoO2PF+n02Y6M/M3cJdBNhwVHac6ycZi/YYlphEgU3+LMON9M/DL2E
 r3wjwGGAC2oiL6YNC6M9+UoB9w6+qkbzlts0vMIkm5eKn6W7J43p57+JoMBtoHT7I0Q5ll3QfW0
 ZKCaPtx4EgbdaG3oihw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210132

Add device tree nodes describing the crypto hardware blocks present
on the Qualcomm Shikra platform:

- BAM DMA controller used by the Qualcomm crypto engine
- QCE (crypto) engine with DMA support
- TRNG hardware random number generator
- Inline crypto engine (ICE)

Also connect the SDHC controller to ICE via "qcom,ice" property to
support inline encryption.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 52 ++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 31d0126e5b3e..b617735650ac 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -546,6 +546,41 @@ config_noc: interconnect@1900000 {
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
@@ -585,6 +620,11 @@ spmi_bus: spmi@1c40000 {
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
@@ -646,6 +686,7 @@ &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
 			mmc-hs400-enhanced-strobe;
 
 			resets = <&gcc GCC_SDCC1_BCR>;
+			qcom,ice = <&sdhc_ice>;
 
 			status = "disabled";
 
@@ -668,6 +709,17 @@ opp-384000000 {
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

