Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A022DCF74
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 23:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789082248; cv=none; b=N/OTN8uusIwW74AoIUrRrM/OhSLs+DglYHZCNx39y+jYW6re96hQ/tDru+jeI4SxRHLbwdbj2fLfWyGRUPE+PaXV5HR9wV1pRgvST9Yd9+V1gvaeBTe9D3OHlGaG+9e3Aa3+x+SbGEKk+NAMWorU3AGC51L6cOo8BWwATEv7vzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789082248; c=relaxed/simple;
	bh=NgXspv7oE5GN/mFXsF88tgcSTUjca77RnWA+ANP7Lvk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gYbdoEUde5y4NNlDCBxnHjU3hUZayY+LyH2cY/7/tJQb5Lm+/sOSoEYgqRHEKH5O7uNDkXFPgYKDaNYOROa4FzYqbfmKcJn6a2TiGF9GA3OgxyjGeCIv/owGD4hZZpTwOQOwL005wVtLOeaPj76z50G0AgBvzFl5Kx7HIzdv1IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A92hqNqy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aAZ7ebTf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A92hqNqy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aAZ7ebTf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ALTfND3280027
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 23:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lOquI+3QgaT
	lkH0OjJ1CRZTtnFIVSbfJ+jtikYZ/JV0=; b=A92hqNqyB25lssOg/9/1q6j/iq/
	7enc9aL7GTtlD35lkadcm9w3dtG9ekCDaDJmIJwLE8VcJ5ohhs0VmJm6jsFddILw
	iiIuxWG5ppckX6fmWJCtiOspmV4FnUgM+l2e6m7vtqonicZ2liEr8jzOppTqFH8B
	2N7ijk2v8EKeVDA4m4GmK69lsD0WU0qxa6yC1a3AL3zoW6UTddBuED1jQlGthd8j
	PEr0JrOCuA37RN6Rr2zqj4FYe1pRjTnQOXmU3LamcQTTVzCgRFq8tWU4fi9Mf3Su
	w7dPCz7uesbjjqL/vmRW1svMFN/oPK7CWpD9i7hD4uBp1+9IqlFOl2e3R6w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkxnva1d6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 23:17:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d94f086fedso2786155ad.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 16:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789082245; x=1789687045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lOquI+3QgaTlkH0OjJ1CRZTtnFIVSbfJ+jtikYZ/JV0=;
        b=aAZ7ebTfoyySTMpTMFat683fm3AkAd1O8j93L8ZwzGFF0LmLKX8dFAWd6gJWSgyfOs
         1vFqJPWHzcciBs8C0O/h4xSbeHGdxx2htBfkvt7PJnMavJ7C3wZ6HQ7x2UFxjBEPqdLq
         pByPRC8bICKMLB3aD+m1PynGuPgnRyoPvdFubQkwiLgr6pSHcjihzfPBw8U6ZQs673L2
         KoO2oTHh4aAZuQWR/mPfc8Ix4bXO6Dbe8oelOLZ/JSPrVloiWQfrwWjQRtgIdYx0ODnH
         bkHegMvkTR90zKZqSw1/vsMPRKrB6ceqxtEDctMW4RBzD1FuN93D/MLXoz358vD2e1hc
         NBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789082245; x=1789687045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lOquI+3QgaTlkH0OjJ1CRZTtnFIVSbfJ+jtikYZ/JV0=;
        b=PyXP8VPvcT8sEq2/B/H1i0HqoYkPyJMc+w9Zykh2Ph9hEgbQsKjbMk2rUT9pZ4DMTn
         6cGw1ey7A/3LnZxiQhLhWZ/Sx01x4Z6bb00D7muzr5NgeBuvmeGHLyDk9ngeBEHOkclP
         JNjFY7UhkJ7yQoDQ5Tgkh/IBmDlGGQwScqWWSktRX4uMTMw8gdvJVAnWQTybap7I3H+P
         4GYQ3IeT1nwyDTZjCiaDa4uyC84QVXxWg9yPQADdKPuf6YQGTVkg6PPBLhu/h8m+djFv
         mnbZMYatkFJOUJcgI4ubzh2OnK3P0zUzo9wLcwjHgznGyDlIgb3sZ1tKD/HYa/kCeEy0
         0y4A==
X-Forwarded-Encrypted: i=1; AKwUvBxgw331q+5yE7A7ZWDAIpb2pMXAQXmsrar/k3u8ma0295pv7/BPePZig4CC0nucCAqv+qof4EtlkKIZ@vger.kernel.org
X-Gm-Message-State: AFuF++k/IuOh4ET9qldqCw+3inB6jV6nTAp7rx1F2rd5pRe5EnY+72a0
	LRuaMGVcVVPKUBI0wZYkEPjXm4aPT1lxuWeIKDKI1eiDJRu4bBN9FD6b4IVJDLhNuJnGJALyAcW
	uio1NIKD7FiPrkQ0FHLejLIBESMJHcOU4ZnCkfyQBA3PjC1vmsbwbmvOXBQRivKsw
X-Gm-Gg: AYBFou1PjqsgCBOVoUs/SGdi8qdK5CLubH7T/NhpgDAakdanddmJf6kqdzUy5huVP6U
	hsjZ8rmndO4aUPK14WYwiTJSEQK7k6p2JCsBK+kmTiU14TUhwdfqYChUaH0zcQDKH5fxVmOqPX9
	+TUUNL/YwrxBLEjEe3icEfBUCkGs3f7SaCNUwQjrj3EkG2TAL3Ymm+6WgRKEhvq53q5YDIw8mxn
	JoVmHp58XpK/QLRuEwKe6jH5DPgNrdWb8PCBIiCOS4Olm1yoFMXXNtzODwETpG9Srr1hTEWOo+7
	2+OedXW10y/ekrop2TauaTDMIlbwHs4SxypnRGT2LYdwYPVU/r5BXRNB/PKxJzsfwJhDobEEQsj
	eYZWeCQZ03jI4e7Qg8fW9xpd3ixWg7qu16I5O
X-Received: by 2002:a17:90b:2641:b0:398:9bd1:3215 with SMTP id 98e67ed59e1d1-39d9c352a63mr1762013a91.22.1789082244853;
        Thu, 10 Sep 2026 16:17:24 -0700 (PDT)
X-Received: by 2002:a17:90b:2641:b0:398:9bd1:3215 with SMTP id 98e67ed59e1d1-39d9c352a63mr1761958a91.22.1789082244381;
        Thu, 10 Sep 2026 16:17:24 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f7390csm1204374eec.26.2026.09.10.16.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:17:23 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/9] arm64: dts: qcom: shikra-cqs-evk: Enable sound card support
Date: Fri, 11 Sep 2026 04:46:40 +0530
Message-Id: <20260910231642.1794948-8-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfX5yDb9au1TIDb
 m4kfTAj1fUG1ut1V8LjJiqvdIu0NGh3XOmmTyTQeLWI+Uv6SzGJdo+a+ZaHUcCs0NL1tVcf3mUw
 36m0nWBAVvIOYZ6iRigQy/K8m03uQ5EiuqYGqm4KQ5pJD2POiyLp1iyNB0gogh8z2KjP4jSRMKt
 NHRu29OlsN2K7yFpmO7t62dR630vhTYhDRDsChdkSurWMuJ4lKNnkjGSc4Cd3RwoUGHEuLOLXwL
 A8SLVma9bRMOFuPG487/ypm9nFV/Pb19oftPy/rgMk4YX3qHV/pgkeJRekSGS3Lyofyn5aMmIll
 Lwdgj2xROnW6pGS0ADe5/Rq7eh1Um+R0cBd+uqkAR6zqgT78BCz/Gvvna/U1csAfkzvbxQ1CzmB
 EJBlVewv0oHN/EbYQo5UVPZptbibDKmPj0SzmKgzBsAl21/YBh8F5SCHWr4al33pAOg4lGZjg7/
 QtalDo1fS7fewIUZQlw==
X-Authority-Analysis: v=2.4 cv=RsxQvymK c=1 sm=1 tr=0 ts=6aa33a85 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=LGjtEWlvg90eF6BY9hoA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: ZAqsz6sHHaE1gwGK3xVWe0wjp-jQFuen
X-Proofpoint-ORIG-GUID: ZAqsz6sHHaE1gwGK3xVWe0wjp-jQFuen
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfX+tWE/4lTWcnq
 UbUN4lSQwoRXejwQgfy5p7vbkXW9bbGUUyfQPGqaLhlQou1menjxjX5agBxcKUCrt2UXUYRS6LL
 DfO+A2QHpVxR0HiX2PTUOtqczzCIOyM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100293

Enable the sound card on the shikra-cqs-evk platform,  including
the PM4125 (Rouleur) headset codec, WSA885x speaker amp.

Also enable the required LPASS macro and SoundWire nodes, along with
the necessary pinctrl configurations for DMIC and I2S interfaces.

Also enable the required LPASS macro along with the necessary
pinctrl configurations for DMIC and I2S interfaces.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 220 ++++++++++++++++++++
 1 file changed, 220 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index e62ba5aef71f..52c7284e53f2 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -21,6 +21,132 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	sound {
+		compatible = "qcom,shikra-cqs-sndcard";
+		model = "shikra-cqs-evk";
+
+		pinctrl-0 = <&i2s2_default>, <&dmic_eldo_en_default>;
+		pinctrl-names = "default";
+
+		audio-routing = "VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb",
+				"VA SWR_INPUT0", "ADC1_OUTPUT",
+				"VA SWR_INPUT1", "ADC2_OUTPUT",
+				"AMIC1", "MIC BIAS1",
+				"AMIC2", "MIC BIAS2",
+				"AMIC3", "MIC BIAS3",
+				"IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT";
+
+		wcd-playback-dai-link {
+			link-name = "Headphones Playback";
+
+			codec {
+				sound-dai = <&pmic4125_codec 0>,
+					<&swr0 0>,
+					<&rxmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_1>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wcd-capture-dai-link {
+			link-name = "Headphones capture";
+
+			codec {
+				sound-dai = <&pmic4125_codec 1>,
+					<&swr1 0>,
+					<&vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_1>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		va-dmic-dai-link {
+			link-name = "VA DMIC Capture";
+
+			codec {
+				sound-dai = <&vamacro 0>;
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
+		wsa-playback-dai-link {
+			link-name = "WSA Playback";
+
+			codec {
+				sound-dai = <&wsa8855>;
+				dai-tdm-slot-num = <2>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-rx-mask = <1 1>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai SECONDARY_TDM_RX_0>;
+				dai-tdm-slot-num = <2>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-rx-mask = <1 1>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
+};
+
+&i2c3 {
+	status = "okay";
+
+	wsa8855: speaker@c {
+		compatible = "qcom,wsa8855";
+		reg = <0x0c>;
+
+		pinctrl-0 = <&wsa8855_spkr_sd_n>;
+		pinctrl-names = "default";
+
+		powerdown-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <77 IRQ_TYPE_EDGE_FALLING>;
+		vdd-1p8-supply = <&pm4125_l15>;
+		vdd-io-supply = <&pm4125_l15>;
+		qcom,battery-config = "1s";
+
+		#sound-dai-cells = <0>;
+	};
+};
+
+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	dai@40 {
+		reg = <SECONDARY_TDM_RX_0>;
+		clocks = <&q6prmcc LPASS_CLK_ID_QAIF_IF2_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
 };
 
 &remoteproc_cdsp {
@@ -42,6 +168,18 @@ &remoteproc_mpss {
 	status = "okay";
 };
 
+&rxmacro {
+	clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_CLK_ID_RX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&vamacro>;
+
+	clock-names = "mclk",
+		      "npl",
+		      "fsgen";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
@@ -57,3 +195,85 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&spmi_bus {
+	pmic@0 {
+		pmic4125_codec: audio-codec@f000 {
+			compatible = "qcom,pm4125-codec";
+			reg = <0xf000>;
+			vdd-io-supply = <&pm4125_l15>;
+			vdd-cp-supply = <&pm4125_s1>;
+			vdd-pa-vpos-supply = <&pm4125_s1>;
+
+			vdd-mic-bias-supply = <&pm4125_l22>;
+			qcom,micbias1-microvolt = <1800000>;
+			qcom,micbias2-microvolt = <1800000>;
+			qcom,micbias3-microvolt = <1800000>;
+
+			qcom,rx-device = <&pm4125_rx>;
+			qcom,tx-device = <&pm4125_tx>;
+			#sound-dai-cells = <1>;
+
+			status = "okay";
+		};
+	};
+};
+
+&swr0 {
+	status = "okay";
+
+	pm4125_rx: codec@0,4 {
+		compatible = "sdw20217010c00";
+		reg = <0 4>;
+		qcom,rx-port-mapping = <1 2 3 4 5 >;
+	};
+};
+
+&swr1 {
+	status = "okay";
+
+	pm4125_tx: codec@0,3 {
+		compatible = "sdw20217010c00";
+		reg = <0 3>;
+		qcom,tx-port-mapping = <2 3>;
+	};
+};
+
+&tlmm {
+	dmic_eldo_en_default: dmic-eldo-default-active-state {
+		pins = "gpio71";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+		output-high;
+	};
+
+	i2s2_default: i2s2-default-active-state {
+		pins = "gpio100", "gpio101", "gpio102", "gpio103";
+		function = "i2s2";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	wsa8855_spkr_sd_n: wsa8855-spkr-sd-n-active-state {
+		pins = "gpio2";
+		function = "gpio";
+		drive-strength = <8>;
+		input-disable;
+		output-enable;
+	};
+};
+
+&vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>, <&tx_swr_active>;
+	pinctrl-names = "default";
+
+	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	clock-names = "mclk",
+		      "npl";
+
+	qcom,dmic-sample-rate = <4800000>;
+	status = "okay";
+};
+
-- 
2.34.1

