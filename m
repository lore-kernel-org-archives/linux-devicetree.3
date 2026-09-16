Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D723B3E5EDA
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 15:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574167; cv=none; b=tkcebBf8Ga1jlckO5EjjDB+yGApAiFDOzzLnEGcE+lCD2sjUJJ2aboKcoOxl8mE9qTeGCjsZQY3UyJuh3WE6CvQ1bP3QqL9IGoSRDHtGM/Ut0iZf/dskckPPB2+H88mpDS8UfKt9J05zLz5E9lANQeTxMoZXhgs7P85QtztJ/o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574167; c=relaxed/simple;
	bh=1L+CGmF+jh1dVDPMtm6ap+Rk+9/ahUtbAdogoIAgS5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uTXv8DUiv9+HLHYl0B9Mt0QYsPlJDQ62p58SADnsw+DacHkZu3JmuxOqwxVecN8IVEmihcVUa47OIjsMi7Hs3rybPZTRLZgJ4hDZU7HZ/r7I/DyPU2GseBHPZ9t0Xm71sXrkMp2Nvfwfgrks02iOYzk6gQaS3PAneeI6iMfQo5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MuXQjadV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U8lN5IQQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MuXQjadV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U8lN5IQQ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFe2aK2430472
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 15:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NNmVp1b+0xC4UWGutgIpijbh8RUmcwgCzdiLIlZM8Lk=; b=MuXQjadValdyuRzE
	WBXhiBoZXZhiUuNXVRsyBoEf4lzo23+v4fwB0nfq3Uz3J29NPX8TKlLeTHGRb8uX
	uhAgP2TZeMk6v+SqMTt5Gq8mhY3SRuFBnR4YYgEaihd3ngFXb1qNuB8kXz6tsRRg
	RNvjyrBd+GiAH169xyNKAw3IPFqpV5avHi3Y+aAuG7H/uRqPm1s/DR5hVZmBtZaI
	u1+4NV5egnfUrZzfK39qNnusMjV/NtPI43xp2/3TSzatQSYzo46BH3J+zeLiFHKE
	1Iw4MsQJwjdiGNDiJPVvN8jGeyo9Hw8eTWqHugcg3z2F8VvYEgpxYvuA/QD5S6C4
	xIwL8Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqthns2vy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 15:55:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93903622880so445102985a.0
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 08:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789574152; x=1790178952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NNmVp1b+0xC4UWGutgIpijbh8RUmcwgCzdiLIlZM8Lk=;
        b=U8lN5IQQM5IU2pWfpW/rmbabPelTRZPFOEGduFOM87naCKBVcuqFFjZYxzoNEHnVPZ
         Q6amxSfYMgLKgy8E5hSmn98uTGmQwZ3O1f7Mk6JY/huPS8kO3wYoI5LLgElVZLg8dDPN
         bBucnF/vnBGe6TXJscEVsKDMrXo+BrHcmzTHIVS6cCbpZ6EitnB6jGaKxipklrYBIJ0e
         qkEznxrxknZlB9PprNi9Y6aJeM30aRBjBnoEsZnlSP/954IOucK+n8G+ZOMC9IeruNrK
         TXBAuRGkQ5FI159S+iPZEv23yp2hfZ+EY0xoGT7bWcw8baXkLDKjMXYretyN2+1GU5X5
         Tecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789574152; x=1790178952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NNmVp1b+0xC4UWGutgIpijbh8RUmcwgCzdiLIlZM8Lk=;
        b=xEqYA3EzOZzwfD5PT38QU8Iz2t1WSjtVoP62veUIQlAYcKDzOUVkM+tfqLuB82i6di
         R/Q48hDotWQfhDTHY6n7a0b2W+6XT8yyFiRVEFedrpNb5bIoX+7blyj8wav9ygEp08bz
         sb+4uKUTrtstyjH3A5xFnCEnlvv87fBrgPF9ZZP/3BlVT57vDt4qvDH++P+z9Ejcu5VO
         QRUFinDRi93sgIXrm4yqp030fP1TdYK9onQTEC+xbMFvZLdTJcQ7HNbb4L2bM+XxQApO
         JToUI3ALCsMYT0PLkH/RvR6RhL5nfC7ElWEwTVW8A8w5MG+Jc0QJ9RCwEH9xX/G/ZQPN
         dbWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyjKpwwcHcO1Zhv3wIvyE7SUwXCssl7paB4B7iAjEY0eyYlxCJ3hBQWMqg4asxTl+sLOXIqJaSTzUD@vger.kernel.org
X-Gm-Message-State: AFuF++k23RCuJqFXxXCDMBZJXUVDab0hOHDxWpVQIPy8EwUoa5LpBBqo
	THNlIxHQdu1MQoFegRf+EojujYl0anh9KyX0ZAtMunzvonrkHjdmcNcGKXws+k2HkldcgS3JS00
	PssJ7aI4RCDMuFtDq42a4MQH5kbXbipCIdGg7y9dGzkkR9q0BIHpu4549EkIcsOsH
X-Gm-Gg: AYBFou2d+VbiCkNh0mWbsT74md3BHK0Ubn+TbIDoyPG0JboPpcQWVLTTKVY4vXck5NL
	nVyu3Oymd6Q3U+168dPg7a9Xd4QiIJhbokJwh9B4yNnTbVlQvmKNgPwkOldkF3j8iYmUQ2NoL/1
	ofCjcpUoZTm47ryZdR/EL8cV1Kbf96wD/w3OCa8bBDIZsx9od5hlLCHjt08RNWT3ymIu2D2L8g+
	LRtANxKIueMrEuQd6ZvFvksulc9FuSqmPgmw2TmaXxR3LJVzoogTGP9xsLwWiZWaOvdULyjscFj
	kXxSGaSEQDHBkDCEmScMf0cLt8hd7gtLgl2AADa9Zg/siLuwGsPBQ0X/TY0uJNa5wkfApAMjVM2
	9S6yBb8XJgPlzvXGo+x4U7VfzGp4=
X-Received: by 2002:a05:620a:3711:b0:939:c7dc:8712 with SMTP id af79cd13be357-93bc62a44d2mr17522185a.15.1789574152276;
        Wed, 16 Sep 2026 08:55:52 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:939:c7dc:8712 with SMTP id af79cd13be357-93bc62a44d2mr17515685a.15.1789574151692;
        Wed, 16 Sep 2026 08:55:51 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd2160c2sm765525e9.6.2026.09.16.08.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:55:50 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 17:55:38 +0200
Subject: [PATCH 1/2] arm64: dts: qcom: nord: add GPI DMA controller nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-nord-gpi-dts-v1-1-073e3f9c19d0@oss.qualcomm.com>
References: <20260916-nord-gpi-dts-v1-0-073e3f9c19d0@oss.qualcomm.com>
In-Reply-To: <20260916-nord-gpi-dts-v1-0-073e3f9c19d0@oss.qualcomm.com>
To: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3902;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1L+CGmF+jh1dVDPMtm6ap+Rk+9/ahUtbAdogoIAgS5Q=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqqrwAK0iRViuzdsunA6M2XquWPRUXZrBXG8tHT
 6fzYfDA/E2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqq8AAAKCRAFnS7L/zaE
 w5FoEACh3qPoUeLM1NFIEmSJaIF7ACDuo1DaNUerxCj0bRaKVgLtouXP6hzckdT92mPuILN31rc
 WlaagiXrpBNc3PbjpruJWKaWzZ+XbkWU6hx92cCt9UysmKQlE4hbiwtJzD3Wrp1R/UGh9aFHbil
 sUZZNuxdAGzqgxRIw8Is4Pzr5fd8NJN/H14W8GKf7DFklySUTsBKUVVmrFPAe44kim2gCumsfI5
 5okTcfRhskL5Q/MGhLHY6Vxva5fprvqxkGMf28/PZfH+ZjjTgHtaI744UKLChFytARG5rAge1Ik
 Eg7Dk4rgzvP0xgBFbD4xMqF55xA9vhe6MFFtXp2Zx2kIZpB9athawzQ1ppabWIMrXc+Ul5bg9ey
 e01Eun1cNwsL8+f6/IyzKiwcxCs1EzBUjAEQvzbC7iWDK419HCwAifz8oxjdB7oUEOoC0DS6bLR
 V8gmd8tLPjW1aX7MQimB/wEhDDUe0O1HhIjYM2DV119K9rRau0aI+L592u5pS5gwzPnQUijDf8l
 qPz1v0+IlIBntL1DgToe95BjV59+GCDUZ9V508ezbo07OrdvQpAtJL2kF7eBMy/gAIubnKCIomC
 PWLX6P5GVuv8u1SmzscUv4FLgfYqF3TXCfXDcAqvu4YNy449JYrM1JuSod6JAlY9Nu1bIbjKtSo
 /E8kybkh5Yvrm/g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: SyJqQhx72YajlwywjFls6pBeRgIM9H1L
X-Authority-Analysis: v=2.4 cv=IsKL47/g c=1 sm=1 tr=0 ts=6aaabc09 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=5TetioHNO0Q85TPnjQEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIxNyBTYWx0ZWRfXyT6JB/MnzLuD
 xCFiiT43r9cjERBOaVzFx2Bgvka+xl4U1TpQ9jf9/Q4SUsBp9nDA9bYiHTQBfFBqZeXfSLWZvv+
 bsOrzjhy6iBbhysycyReo39cXe4SgQAty8cs4JmZZB3XJcLKQBTtjj7DnDq3hB07A+ZTvl1xPvs
 QFoIeJXpfrEFOtE/ja19oj74fxItwyQwPvdGQoQkPf4EqijtQVuprxoYuTn2Q/4qR8Fi8teT/kf
 0QCzDFVZX/FMuIzA/mzStSaS6gZOsDpVZYibkPzCKDpjQncVkgxREy4vQlZbXWng7kHGagc3H5o
 SlL3Rll5A3LWCSEPvFY5eS9bfTGmXCpIbCAVPQk/Ctdwv364QOFWG5m48xxbBYtDqzBHFaMplYq
 xnIB1r68eRMX0MtKxrPBA9es3C/ga/CE041SMoZ9PM0oRh3qj5Kv4cxppHfnKpEsdBVHt54Lm3+
 liK9wauUcEe/gHB6S4A==
X-Proofpoint-GUID: SyJqQhx72YajlwywjFls6pBeRgIM9H1L
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIxNyBTYWx0ZWRfX2nY8vB3bnn+V
 A5EHAXs747JBY2xz6OoIZ+OE9czJIPltTDCq+rFVobfoK4IZLmK6jmjlaz3trugKzh1sX0xaHJ4
 sJlNmzKykpnnnfuMXqqqN6YgL63mA6k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160217

Add GPI DMA controller nodes for all three QUPv3 engines.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 67 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 22c026c32fb5..870033a106db 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/soc/qcom,gpr.h>
@@ -1062,6 +1063,28 @@ soc: soc@0 {
 		dma-ranges = <0 0 0 0 0x10 0>;
 		ranges = <0 0 0 0 0x10 0>;
 
+		gpi_dma2: dma-controller@800000 {
+			compatible = "qcom,nord-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0x0 0x00800000 0x0 0x60000>;
+			#dma-cells = <3>;
+			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <12>;
+			dma-channel-mask = <0xfff>;
+			iommus = <&apps_smmu_0 0x15b6 0x0>;
+			status = "disabled";
+		};
+
 		qupv3_2: geniqup@8c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x008c0000 0x0 0x2000>;
@@ -1260,6 +1283,28 @@ uart20: serial@898000 {
 			};
 		};
 
+		gpi_dma0: dma-controller@900000 {
+			compatible = "qcom,nord-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0x0 0x00900000 0x0 0x60000>;
+			#dma-cells = <3>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <12>;
+			dma-channel-mask = <0xfff>;
+			iommus = <&apps_smmu_2 0x1016 0x0>;
+			status = "disabled";
+		};
+
 		qupv3_0: geniqup@9c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x009c0000 0x0 0x2000>;
@@ -1431,6 +1476,28 @@ uart5: serial@994000 {
 			};
 		};
 
+		gpi_dma1: dma-controller@a00000 {
+			compatible = "qcom,nord-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0x0 0x00a00000 0x0 0x60000>;
+			#dma-cells = <3>;
+			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <12>;
+			dma-channel-mask = <0xfff>;
+			iommus = <&apps_smmu_2 0x1056 0x0>;
+			status = "disabled";
+		};
+
 		qupv3_1: geniqup@ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x00ac0000 0x0 0x2000>;

-- 
2.47.3

