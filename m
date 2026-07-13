Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD1F3EB0E1
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783945125; cv=none; b=B/w/5fgd+CdecT8xxNI720uUVV69Yis25LyvboalEiQgep3vk1jqnHG2omlCEYLWCTki/5ZVzfdjFTTKcn+hkMQfwphCY7tQBfQi4uT4R/oH99Hp+GKaWsGAHfdEeqtzLYBBzXZ5iQZPQ4I3le3E+5b9mxDgCJj0wuq/7qx+7JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783945125; c=relaxed/simple;
	bh=uaTQGCsGiEk/QpyKbH+2uQSuBpGwydTLCaCHQMwIaSU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HTczhxB7ztnMBk5sNYsvqBUZEFTHjbQDH9NDYDyQBD6JNlXfDvhQ1xJ3fEEuNV3yV3Wt4beUTM5+9tGYu6Y/uMktI6CSM5Q0HrqsynUHCDlAh+kQ3bbEi1tm3lVXnBwLj5Dn+d3gJkLHvuGHhVPR8RBJ5bmOe7eGQefrGNdRTUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EHM8era9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cHHOkg+t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EHM8era9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cHHOkg+t"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDXOg1299289
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z1Lby6+bG4N
	ugi/t7oGWN3DFAk/l8m72ThKLmPpwQ8c=; b=EHM8era9vulCfox+CoPs55sv34m
	B+LpM4+GYVPwQhg44LierbzRxQI978g+4utP9T6cZdvwMLcgwfzRnbF06MKEIN1c
	zcGeDiKSROaNmPL21cxrY59FG9lBEJAEqGFUvd4+fkOaQehKoqL5M2Vw++SZRIvv
	/ZKpLImKi+Yie/QERC2smECtFU+stgPX72wp0E2oy1DMPgFXuqSXtwMWFrqgDGsP
	U8TWh1DM7TtrW733Orvf0BMsEs16xv2jRe+r0p173VTZfdn2uUxgvojvZNf+0dZ5
	thCXH+Tq3Oyy94bas8Ts9j8w8UbmV8Gk8gCxj6WmYzvFsOZ0StW5pIR6sSg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3gj76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:18:42 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84885a4fcabso2404336b3a.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 05:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783945122; x=1784549922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1Lby6+bG4Nugi/t7oGWN3DFAk/l8m72ThKLmPpwQ8c=;
        b=cHHOkg+t93OGeK+ZtH+zeW8O9xdQwU8hqOvWvzy2BvYcdW80+PmN2afFABDxyTbsJi
         IGQN8dA4g8D2bA71TMmTEhvHpulBMvKudUy/QRl7+MhYx3CWq4cpQKkW2rm7jrsb9WqP
         +DFCG29MKx486cVWlyBNB6p6ppW62j3wTDVIjwZr5K7orMUYcQwPcdBrLtbSf65WSnQQ
         1KGjfQm1++eirTTNcRAjaYervx2Nyk1J11YWAFoXKuP9p6NH2vblfVfUPrWx2fNX/+Wd
         3IcfZDtq2YbHet9VgMIbNwj3V2TW+y1ylDhiJeRvIC4U/SH4JmQqyEwo86cUWy3XEZ79
         hyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783945122; x=1784549922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z1Lby6+bG4Nugi/t7oGWN3DFAk/l8m72ThKLmPpwQ8c=;
        b=iaCgjcnMn+bCwyy32yJ7HeNUP7yb4El3ZaCaB02+ax7WMjsybGkdzSDSHBt6pZdmyk
         avaVirzPCbKnuMmLQbwRdl8qTVjET1NqXHpD1RUxPxqRPF44zRnqeSTBMzRhSykWMEub
         7cBJblY22bmsYg67CLHs41/FlO2+oH5ypl3D2hUzWASViQNTT5or868Y1Xyje9b1MnLq
         kJYGq80gqZbSqag+kFuBvhJUhoDMkmuboJ3ySq+1WNZtQ/W7qzgjtHFG4j/0Tr/ZloLD
         rQZwCrevZPZVmnOYGdKW9lLfi7lQz7j1At2fxtTyPpZ+dSH7uf0ZSlJn11xJz9E/+1RJ
         EVYA==
X-Forwarded-Encrypted: i=1; AHgh+RoV/xk5aDyrCld/yideYx06McSH4iNQCDSGr/TtDfgFF9yDeCYpaexma5eyKTYid3V4bi1AhEN563xT@vger.kernel.org
X-Gm-Message-State: AOJu0YyeJWm1y/rD+q95NE9R+b0XrunY63ZzU0aA9T0QOpjPOuzMdfaR
	5yFAWSFG4wwgZ+D5/maYzq4K3LN8fNx+CNPsAYzE0xAhfo1YIsmQFIkckvS8awfgQ7SDWeUNYlB
	MmuRzWIkRjInRY/33Rj4mbYiAgxDRQoYHSjJRABpuwk9/umDzUyGjKGsOhwfysj4Z
X-Gm-Gg: AfdE7ckmimAv87Hf8v1usGbKBT3go1dEUIKEtJHVcUPIXehZt+tO62KPVu0b/N1yBuY
	gP3SHZ913inqUY0lOIgMFvMTWwmrxmcu5vIsAsjkInUD5W6Zj9ToHUubU4pqSk7It1MdMxpxY0M
	+lxLCvf3FKb/J4nx7Gq9K0zN9BqtY+ikjEit43CSGqIIM0fg+cIgm/0XIjChbc3ZPLNbk0fwvq+
	JqLXkPa4R/kCQ5uStgkpzU7SwmH87sSL7ss5fvqhh8E9UWv3Muk4VXvOCX2lummDb5NBMhDOVpF
	kxeXZvstiBaZcHAWEHPGYpN8O6LVMy2FGSloKuczb+R/xuYYxTPHEUkQ1FT80w3NlBYdjbPv0fi
	iHX3EaoIM2TqqTaTsraYesG+4XAz6gbRYFQJC67a2
X-Received: by 2002:a05:6a00:13a6:b0:848:2a2c:8528 with SMTP id d2e1a72fcca58-848896bb053mr8408972b3a.44.1783945122227;
        Mon, 13 Jul 2026 05:18:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:13a6:b0:848:2a2c:8528 with SMTP id d2e1a72fcca58-848896bb053mr8408916b3a.44.1783945121731;
        Mon, 13 Jul 2026 05:18:41 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84880a4abf1sm4375340b3a.16.2026.07.13.05.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:18:40 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2 2/2] arm64: dts: qcom: eliza-cqs-evk: Enable sound card support with WSA8845 and DMIC
Date: Mon, 13 Jul 2026 17:48:16 +0530
Message-Id: <20260713121816.2728888-3-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713121816.2728888-1-ravi.hothi@oss.qualcomm.com>
References: <20260713121816.2728888-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oW3Cc1QUycJvQF5yoxEqCRHYMhxJ_hda
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX1e3+jNTcKW2N
 aOHxHLsCMm9VgGRISGMyQj4vTsrrZsHt7nLogeuJA/nErHIhzHXZt426Y1/TV/igycvV/rptSBt
 eUNWQqtTWlfdFJ/yJuop/XoE8fIcQx0=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a54d7a2 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=RpnahtGIwcQnnQdoyywA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX0VwLwIbxfey+
 WF2VXb1e5ZSQb/a5gQF54e3nhGZuvSZIxwrJy8dbRSG9aFwSN3332ob92p4ojDrkhUzLS9VjKH8
 0RhW0bOYD7kZzkQ+eDjB8OfloRIljngA8N1oKDDyqoVS28gttB72gfq7KQRBjb+mh8Dmy3dRa99
 WtpVJsuvLVKKaL0kJa7ocfX1+SoSH5qBuRGOKN0UV47zV5ROBULUk8W2PPRlLIWk2hA/06Bxa5i
 h0j0cMGlsxcSwcCtJzRwpLMTdA/gPJLPA6m/7W0skQvM5HGOIWUsU3SVLOgSXPRsO54WLc7e/t6
 21FY75BH6GaKG/P/QG3I3sMv+r7ojN8fMxruhA2DXdPpisZ1qgOFd2+fcft+KNwdpVt1w10JMdh
 MAhpwY9t7KPUtIYwdqbIUdly6ZFH3zHSrtEUZn8eIOos/mxZwaNwr/6uTaUmrbebnrU5d3WXdUV
 KYUnwaauwn0V7pHTY7A==
X-Proofpoint-GUID: oW3Cc1QUycJvQF5yoxEqCRHYMhxJ_hda
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130128

Enable the sound card on the Eliza CQS EVK platform, including the
WSA8845 external speaker path and DMIC microphone capture via VA macro.

Enable the required LPASS WSA macro, VA macro and SoundWire controller
along with the necessary pinctrl configurations for DMIC and WSA
SoundWire interfaces.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts | 150 +++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
index 43d428a4ed2d..74d8c860f970 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
@@ -5,10 +5,160 @@
 
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
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
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
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&left_spkr>, <&right_spkr>,
+					    <&swr0 0>, <&lpass_wsamacro 0>;
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
+		regulator-boot-on;
+	};
+};
+
+&tlmm {
+	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
+		pins = "gpio59";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+
+	spkr_2_sd_n_active: spkr-2-sd-n-active-state {
+		pins = "gpio79";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
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
 };
-- 
2.34.1

