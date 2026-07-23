Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0262147CC65
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784808949; cv=none; b=GhJ1tSH7gCtwLJRJ75MnKBvNbdBgSx3qMy0WP1V+W+ydzM146T6UUS4H1Qn9Zv5HrvG4ve9hakBlLdTJZGpf01VZR5CuMGcw1TsP1ZrR8vZ+l7oCChyj12Pu0WJ3fQw48R1lWTohGJ32Gkq6syCi2i9lCBMsu2c7ZUIRoK01kIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784808949; c=relaxed/simple;
	bh=9jQQywhqS7EPVvKANXCY77b3k+QTFZX0yzZxgQLUJTk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BKJ5nvoZY/g+yZ9bJOXjFJ5rx2JVnisJ3EnhLVS8RvF0QQbLBsQ/aieSSsgLUlR827beWmrCPc+gTcIMJEoy/fWxTgC/oHKd0h6qRXq3/Fg2a4d8vc2s0D70rkpWcpXPXBpKLXY77UImeU3ZpkuYmj+jdqWL34PaJ9qM1XeTp4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iXsKOg2E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NFn+HyqI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iXsKOg2E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NFn+HyqI"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qb6H3606138
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xB1GjOtR7/+
	OXNY015WVKu+ZMWJ4mK/eYvjMcyhGYF0=; b=iXsKOg2E7cvrilQJl/uLcu7moq0
	NESuPUlIKmvu+HJmM1kcBwf5Fu3wHePQFfQ5l6SuyDoGzz6W5BfAGMvoK6Rn7c37
	v13Ef2dZt42KjLAZCCkt462GCKycaA4Lx+nl69ToGH7S7La4PN9mv0ytx9JZn5z8
	EJC/oBin62ASCMtr5kRkHgMk3Sx6WfOkWM1ezynpZ60nE7/c9j5KjCwV+xKgnVEP
	JJcSkWs/IIYRCCCkxdnALnW3k2FxApQY4WbyKrDoO4nhip11oPqokImAk/tnJU0u
	pCw0FVwNquLkrDkqiDSdsmEgkZf9k0f9ojF2nazqe4ARnAre1wuGZWg3GRg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke7qh76c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:15:39 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9c26587e67so436676a12.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 05:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784808939; x=1785413739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xB1GjOtR7/+OXNY015WVKu+ZMWJ4mK/eYvjMcyhGYF0=;
        b=NFn+HyqIJo5hB1ar4rL3SG1TUdF4cVN0woQc7PCN8G1r4e0APonGsopzFkVCjOZPJr
         ujlUMkok101k3Kt+TgPxco0bflOcykq7uQMTCxcC6mW3ZeAUy2BevlhgsZ2GfXXhtJ1U
         YBgGo02YyFSY85S0A2mSS0sV8jfsT/5R6cVjKsRHXb2TkOyGCVLxqkObc/crRu78Aksm
         W0Jq8FpAg6j6yGmjNn43zgzOtkwSSnQpIYhL+8Dqn1XAQi3oWdN3tEdbNGaGbsrs9WKz
         8okVlebJhx2/+uILZQkM/EmrdksC6brvePkpZTCw3K10sQuqh+o820OyhtIqCp0k+nyz
         KT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784808939; x=1785413739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xB1GjOtR7/+OXNY015WVKu+ZMWJ4mK/eYvjMcyhGYF0=;
        b=gEC8qYkJ2ipBPkQlKQwqhE9ZmGxOmu4AUuCNyyVNau3LJ8nNIhi03sGIX3EAzwIU/N
         uWE9zuHNPlVHmHxBIC8YESSw1Qu8uitBSq/LM9qtXlG9WXJ3AB9pLe88O7BogCqJPPH9
         Ph+XbxLMjFxE5AE5lkIC1fG/DY6EREOQ4SzMe/XDFUiol8/STAkjNwS2xty/aTai7QqC
         V6pDHoibGHnCzHadVCeiBA7gSLD7OOm6R0+M39JKhefhPN44D7y4FfVpCPBqki48Xjyd
         vI52GLQ9ea05hnrEYtue8GIz19TFO6LR855zMne0RTEAgUlDrLOa9GXrBgTE+h0xjS38
         Wv9A==
X-Forwarded-Encrypted: i=1; AHgh+RpIdSjZ0Kjuvx2JLMTOAgzFwgBM4oU79raIQuNiylGIGZ2Cd3UTfZkIn4UYBueCkQX0Z8KNMvt1Lu73@vger.kernel.org
X-Gm-Message-State: AOJu0YwxZvQ/8qzcJvOwIklBEz6AdSWoNabD5ZIlinksig8yoVNICPz8
	b0qIXFSmbUZweFRyE0MiBOk8Q8S/svhN8HG08v/scglIxJ+sD+IMchiUBmptx/KGjGPIFtVi2up
	8R/N9ucB8kX+ctx01TN58JhNS3ZsbqncfzDO+e1LVC+1fg6ttwpPmTdx9/vquk0d5
X-Gm-Gg: AR+sD11JWlM3GZu2h+CXaG6+qj23TSXGnlrpR5/bpX7zASMVKQ3qKFLL2DF3CfTkErR
	v0eZbpwJi/jDRpeAsXpSgmMh94KyiulrkbUbo4F4pbpLeU4/nHzxA2DPVLvlloZ9+XAyj0Qb7C7
	tNk97GcLN29A54e65q9tsCxxiKb0tDQwGccbX06Y07bxVViHotQQ6qZqvXSKSxjv3J0MJfMbXxO
	S9gWcy+RvjfCtHZ1ixZ7ms74tsU1Gg7tbzDuD3vU4Lp8LWuYGO48+T0M1IbsBuZherlED2CtEKl
	jP6xmckYv0ezfsR/+nEm5zk6oVAUulebpPjYG2kQOtgXieUj4YcOG1zOwFWbNxH1ZUTfKSZvgtc
	iUScY23dsp8KFYU67CgBWP8nLqj9bBA==
X-Received: by 2002:a05:6a20:17a2:b0:3bf:ee42:192 with SMTP id adf61e73a8af0-3c44c95687fmr1923948637.6.1784808938436;
        Thu, 23 Jul 2026 05:15:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:17a2:b0:3bf:ee42:192 with SMTP id adf61e73a8af0-3c44c95687fmr1923899637.6.1784808937795;
        Thu, 23 Jul 2026 05:15:37 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1a8a1fsm2687005a12.26.2026.07.23.05.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:15:37 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v3 2/2] arm64: dts: qcom: eliza-cqs-evk: Enable sound card support with WSA8845 and DMIC
Date: Thu, 23 Jul 2026 17:45:16 +0530
Message-Id: <20260723121516.2341900-3-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723121516.2341900-1-ravi.hothi@oss.qualcomm.com>
References: <20260723121516.2341900-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyMCBTYWx0ZWRfX1Ar1hVoDcMUo
 hXATrwUTQhPVyhyps/6+pZm/gbaR4qDE+kvvhsgIdlAoGq0PivjjSXCiU6c75yjmZNOeZ9L+38U
 AtjmCU8iEce6HopKMfL1OjuZe0yzFOc=
X-Authority-Analysis: v=2.4 cv=aYxRWxot c=1 sm=1 tr=0 ts=6a6205eb cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=1oQF0sl-qdDOXL_LXBMA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: xEek6Uz4IDB11zI5lAIi5p_DXMgZg2R-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyMCBTYWx0ZWRfX/C9ShXMW1lK2
 JpXcVKgG7uM1KEIKzmPZ6q2vSCR5PxDKPA2DS0oxasoqd7z67hHiBKLWnOa+dCiEPibM6ozqboy
 NQ7b1OCTsdc2ekq/sW97H1xoMfWH3BA71CqEjb6HCgwTaPlk098dHWDketUuMZvzyfPuuui8l3k
 mLgBFud8olLS/14eT78aJ/dtBwfXDa/pqH3XPJ9tkl4mD0FS+SGqHIkHiedWMKkVaxnAUMS53I5
 AMPrPh8mULY6TP1u1nJO1QTi/94/YRNlI/3DmzVgm60Vkelu5+IneHikH7ML2vmaxZcIR2mo2ll
 AU/4nEGruOadOOO7qc7rb3IDpTl58GIc3ud/p0ZQvWFVAMXy7mGUJuQGe68sWH9XNMjpvDBjI6F
 hRwL2dOt5zk36frsKJmsdlXEjoq/HUhDSAZtBPILCKnbnzgSOHJveNmWqL2x5FIZD7RVab71dED
 mLSV74X+T1zCUQsFe2A==
X-Proofpoint-ORIG-GUID: xEek6Uz4IDB11zI5lAIi5p_DXMgZg2R-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230120

Enable the sound card on the Eliza CQS EVK platform, including the
WSA8845 external speaker path and DMIC microphone capture via VA macro.

Enable the required LPASS WSA macro, VA macro and SoundWire controller
along with the necessary pinctrl configurations for DMIC and WSA
SoundWire interfaces.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts | 147 +++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
index 43d428a4ed2d..c746d3210475 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
@@ -5,10 +5,157 @@
 
 /dts-v1/;
 
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
 #include "eliza-cqs-som.dtsi"
 #include "eliza-evk.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. Eliza CQS EVK";
 	compatible = "qcom,eliza-cqs-evk", "qcom,eliza-cqs-som", "qcom,eliza";
+
+	sound {
+		compatible = "qcom,eliza-sndcard", "qcom,sm8450-sndcard";
+		model = "eliza-cqs-evk";
+
+		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
+				"SpkrRight IN", "WSA_SPK2 OUT",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb",
+				"VA DMIC4", "vdd-micb",
+				"VA DMIC5", "vdd-micb",
+				"VA DMIC6", "vdd-micb",
+				"VA DMIC7", "vdd-micb";
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			codec {
+				sound-dai = <&left_spkr>, <&right_spkr>,
+					    <&swr0 0>, <&lpass_wsamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
+	dmic_eldo: regulator-dmic-eldo {
+		compatible = "regulator-fixed";
+		regulator-name = "dmic-eldo";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&pm7550_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vreg_bob>;
+	};
+};
+
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>,
+		    <&dmic45_default>, <&dmic67_default>;
+	pinctrl-names = "default";
+
+	vdd-micb-supply = <&dmic_eldo>;
+	qcom,dmic-sample-rate = <4800000>;
+
+	status = "okay";
+};
+
+&lpass_wsamacro {
+	status = "okay";
+};
+
+&swr0 {
+	pinctrl-0 = <&wsa_swr_active>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	/* WSA8845, Speaker Left */
+	left_spkr: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		pinctrl-0 = <&spkr_1_sd_n_active>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&tlmm 59 GPIO_ACTIVE_LOW>;
+		vdd-1p8-supply = <&vreg_l7b>;
+		vdd-io-supply = <&vreg_l7b>;
+
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 1  (SPKR_L)
+		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 2  (SPKR_L_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 3  (SPKR_L_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7  (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 10 (SPKR_L_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <1 2 3 7 10 13>;
+	};
+
+	/* WSA8845, Speaker Right */
+	right_spkr: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		pinctrl-0 = <&spkr_2_sd_n_active>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
+		vdd-1p8-supply = <&vreg_l7b>;
+		vdd-io-supply = <&vreg_l7b>;
+
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 4  (SPKR_R)
+		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 5  (SPKR_R_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 6  (SPKR_R_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7  (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 11 (SPKR_R_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <4 5 6 7 11 13>;
+	};
+};
+
+&tlmm {
+	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
+		pins = "gpio59";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	spkr_2_sd_n_active: spkr-2-sd-n-active-state {
+		pins = "gpio79";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
 };
-- 
2.34.1

