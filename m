Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BBC3AD524
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 20:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782937093; cv=none; b=sPwcF1hZERCiRZ8Ka+LACGjp2L73L7Yr0nrJOtHfrlauOseyKzX57hLKlSZJLfYURXUwF+I7Kd1f9n/1em7lmGxZcdR8c7EG6HfyNfiu2gKC6i+EUJ8BEVYK8uOmDhIkLoOXoWdnuUaAg+p4cJTNTOpKtgGWl+4/sBnD615cooY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782937093; c=relaxed/simple;
	bh=e+VbQpfDYnB7JL1Lhq0maA2ZtMLt156FOqYWsbF9Js4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PJtgI6ITOq+G1CEsHzHe9ztmHY6jwv0q+N1HTaeUmYyAs9mHxNufcc93yTwtsFeKAP3LR+z8QZQw9wbjm4Mtcv8Bzqr8gPmnoUdw1eohq0BYsOZK0dNb1dX8zp5eeq8NdEBXSCQqCy4G3tzR8tIVodKRSQfIxOPbEH38m67Aktw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LereSESi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RXC0VBbD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LereSESi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RXC0VBbD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661GmXJa1710562
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 20:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X+Nfpts9UfwfrC/VeFUnTh6LInzlakfP8YWFjpqBzAk=; b=LereSESiC4G0zUwM
	Fkm9wU4JZoCLFKZmYDBzTHC4+Px+zGA/hVWCh6Do4Br3SzrfRYIf3NN5MpmHsX6W
	49l47Cig6Sq7fch9OjQAHLMehBQCveiQ9hqjSkYz/cl6/fypwUOLYkwiGraB2Z0v
	YdkoR2oXrqyGh1zJCOu/86C0Io/KkgFRJtNYlrpah0wu7+9rX23U6x01caaUE/mt
	yOXjSpifjglbc+IQIn46jioejS6xeg5Uca4baU1kYchE6NNMMIrR6rvO8PRYtP3V
	A5URS2+FFLgzWl5oyjqIfZ9xfpVxvb78lQTk3vZBGknxSz9eiGrQUXwa6kFr4vNY
	D1DU+g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f56gprw6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 20:18:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso1234899a91.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 13:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782937091; x=1783541891; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+Nfpts9UfwfrC/VeFUnTh6LInzlakfP8YWFjpqBzAk=;
        b=RXC0VBbDoD5LXVi4hD9mvsRQuoRl9ZOsnV8JCYco74DIzM62pCtdumx/BAyxWuiTnR
         Dc/cCbn9qKNHdgIeR3G0eLarUt65DEOfQGLaZkMXC5Dzix2GBUrjLFuCerwUzdwRbGYs
         LJC63ZkAHvhn7H4Ud5FWol+y4sr/i68t3fr4fEB/eIx2JOZ7VMazdIZWpyx+rHcEWOvU
         dwIiQvC6+sRsmTAsXOBpk/tOYhFoo+68GKMXg0QeofC6NMmdsXVPqhopHSHzCuZCg3Vi
         VL/ZR1Upx2afpTZVgPHs3vDBzTcbRPG61udM6u+OZw5hbe2zK8LjB4wOSI899WYfFoce
         XDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782937091; x=1783541891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X+Nfpts9UfwfrC/VeFUnTh6LInzlakfP8YWFjpqBzAk=;
        b=DG/crb2wLavFt7rBPLLe2K4qKaWL4+luWzOjFI6ZsDTJhscjskd+MxWkv9ruGFqOj2
         sR0FBVwHonifclt5b4YvdZqwT7pkJz4AJPzvubyiLkKz+N8IQBxK1aB5JVb2J4/y7uVu
         GT61lxev+Pk3iC+Jay8sH7895YTv0V8AK0sYBKNyw1X1QbeSAWGl3bAWP15sc4WffaV3
         S/lazh99c7/cFYWdW+3chxwJpWaCMyMpCshv1on3HWERQO16ID9yNPormkMgN6FqlC+x
         7qfjI/DSf9p9nXtDu34xCYE8567UeJFBuv+f//Bw3jyN6aN8owSQWsP4xf/GPn8lN3ob
         aVSA==
X-Forwarded-Encrypted: i=1; AHgh+Rra5EeKVg3t9whXOveKUIjOCj0q6gwoEVXrhNmnsuO4R3vC33xe5RQol4crz8a7bLBSdc0MBUtpGuix@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2UwnUoPfCuynmxOpiBSFCc3Avop0fD5Dp8UPy0uBXtiZdEJLb
	ivPjY/h1zeRL+8BwmTu5wqxaPgvyKY5MkERVDXm9lMs80NMT4SOaVLegMP8a0yBmqm1DI0K16k+
	V82QRV4kVv5T5U1s26dmUefq5C65UBc73h98zr+I25DNzGfdAMY8sUR2tmKnKpvR0Liwg8P9z
X-Gm-Gg: AfdE7cnygCBLwlOz/KSPXPPUAeZllyDNjONX9JKdnwpX3p6Xv5zuYCwpqYJXGe8un1m
	uBjmm+m4CPOOVYunbCaipIpFlbzAeKXALOKDfP4CbPgumy8zCXwxS+zCLx4sNAD5nbFJxfWgfaT
	82Ze22ua+Lis4MzOcn2LBmhifumFrbvHXbGif7rXrQsoOnvju+IVBEGesqk8Z6HfdbLKHwoIl8w
	i4uW4ZkyABdf2lu9xNjL2wXJ8Tuqpc/PmdJeleLRgUk2XetJdgan4yh+TGB1VN5i+4dbTh+JQ9x
	ibY6pRkwT8vYi/s9Zb73eCo9YI5BtW2wDNSBgY1QUpeKFZrqR/k1TXZvau2LsXNaekNIP+2MS7B
	2hb+APXSwHOGzseVR4F7QIinbT8+O4gY+8U0Py4GJUS6V
X-Received: by 2002:a17:90b:3f8f:b0:37f:db06:2299 with SMTP id 98e67ed59e1d1-380aa1cb0f6mr2989490a91.21.1782937090760;
        Wed, 01 Jul 2026 13:18:10 -0700 (PDT)
X-Received: by 2002:a17:90b:3f8f:b0:37f:db06:2299 with SMTP id 98e67ed59e1d1-380aa1cb0f6mr2989460a91.21.1782937090306;
        Wed, 01 Jul 2026 13:18:10 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bc79231sm948685eec.31.2026.07.01.13.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 13:18:09 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 01:47:16 +0530
Subject: [PATCH v2 6/6] arm64: dts: qcom: shikra: Add ICE, TRNG and QCE
 nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-b4-shikra_crypto_changse-v2-6-66173f2f28b3@qti.qualcomm.com>
References: <20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com>
In-Reply-To: <20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com>
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
        dmaengine@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDIxNyBTYWx0ZWRfXwPAYUdp1gXsY
 2OLNIXD5wwD35ZqbjkbTVk3Ay1IS2s+X8bYxwCp49OX1OpWFp1O2tEjlBT57mXNz4y9QFJuhKhZ
 6XAhIEvf8C9dw2KyZN8GIlM9XqJdf3E=
X-Proofpoint-GUID: 8h7-OB5Hkv4rIhsQmG3vvJtNFnOeoKu3
X-Proofpoint-ORIG-GUID: 8h7-OB5Hkv4rIhsQmG3vvJtNFnOeoKu3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDIxNyBTYWx0ZWRfX7KUnIipkPmZg
 r8u6xINr9h4SHhvuhW2eGgxJfahhfsny5nuIPiTDPaccydRdYOCftJ8AkKwSuYNUke4sTcWTr7a
 Yrx+CeQ1u6qLqI+oOUEwJvb4dEIhSe6L3X8B8cv+6WsTdzBtnEw0EXxl9cunCdcVPx66s8Kfedj
 24ilNS55ai5MpNqDg77q7EeDNq7ynB/e0FcjRsULNUs7q56ScALGLgP3xJQxCf77185jexznxCL
 B86QpoQDnQhg+hKMc4rrDmPFAKMz3AwaskM/9qZZICYP8LBmRwHElMvBpKCTQhIEwcfBIT2l0IO
 H4OuzFmTWiknVuA0dX6ynSTvU9rJNXiVKNIALBkRdEnywCHGrBoaHrn7HOYiyBpfxX/nI3uwMq/
 cvbCIVHZagEJoXxG1HuXfr9WI1lG7hraVEcmGTSv24eii1TJvRe1kSxVF9UhhickT1chH6ryuLU
 PIw8QBoHN7WFpM3mr4w==
X-Authority-Analysis: v=2.4 cv=K9oS2SWI c=1 sm=1 tr=0 ts=6a457603 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=UqF9ul3sJ95V4vUiljcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010217

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

