Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04FF386578
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 20:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781640912; cv=none; b=DisfKRLECjNtlycEPrqulLsbcXIEESU1c1WWamZ5mB5WK4JHFv1Y0uUHMHUCektLIiMyhfNPCzxfEsXV8kqTmz/u5/T3NZHuYn5VA3t6zb2LdXtEjtkLwPVPRJObFGoa8TUnRDc2GBdtl+isVERHKHOGOCGxYmPGLXNSu1txJ4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781640912; c=relaxed/simple;
	bh=atcpUkOzL3pSuivAPauqVR6oLoGe1mGTq4G0WtyAKLA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iac4/Q8CkDn8LICP3LkGK7W37KbzI8PfQpVPBVGk97fYLAtTKAltzq+PUOGL3Syg1EQL9EPlZ8ePloBnouRTWdnsl08aov8b6J5mSd4u4v4JcbEPPxFKFmJLNLn4wX5qlR9OrYdqZqG+a75rWf72LA+/BAw8IWLbN4ZfUrF0y2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dqVeJusj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KyF4NyBI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dqVeJusj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KyF4NyBI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIOKwi1376128
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 20:15:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OQf8N/KrF/J
	eQXzI22hbkztmwDxMXYHbsouRLwV8Hfg=; b=dqVeJusjK6i+Of17b9ZsGDAB9S/
	r2sC+vm+u1GPz2T/nMKf7yUka0SfuhiIwPbvV5DS3XBIwWF5XIl0UOoKIV39FJSR
	He3xZ6HEjhOl/tYh5wyUdZb5OOZ7MyXiSpe0kSJVCMJswZzdQl5DIOs/sTL4A0sj
	Gx2DE+8PNAjH51BX6D12TjABI70fwYCw8lgm4ERUhcxbiEkOBybbmMRZq0hGF7+/
	kOAa/iYTb2qIz2lAlEhiTOJsKvZOckS8/yCkb5tlm4CMd9lPqyf+f3auYljhxpb9
	BF0m9pPeZGj/YyK3pCNqievcwuawIlGq6MSoStQu0zDQVHR++w15J7hAsRQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu2xsbabd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 20:15:09 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c888636deaeso138067a12.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781640909; x=1782245709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQf8N/KrF/JeQXzI22hbkztmwDxMXYHbsouRLwV8Hfg=;
        b=KyF4NyBI03U1Ehz+xKOFL0v/nVrAl4fcDf8kJfH88ntHre2iXdVS2aqKtYlnHOo+K6
         GcEJxgEnAzl/m9ZDeok8peXcPVkvQTn2UML31VVy3eMKYxJrsjDp9qZokbteXoP8P/KW
         TO4ASPGL4smXqTMgsbchpwMjQcL14uv6cYHnyzLlBA6jRETEw0+cLqC+zYWBpSeiUL0p
         SKavW9Lh1Rtkp2Ki0jJY0E6gCP3CdGFr3+eZCKKiGawZ1nSkXIRWYq0H6cjXAXJEdNWI
         MVwM4gUi5j76v0HxfEnQdvkTNAWrgAk/JnuWCK21Kh9AlC0FrAulfGDfoK7Ycv6unCv2
         7z5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781640909; x=1782245709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OQf8N/KrF/JeQXzI22hbkztmwDxMXYHbsouRLwV8Hfg=;
        b=cAVSHQBr5JNXyNmm5qzLmIgTgUYkb+ztzTNcl+IhTUXvXWIeHFzlDQcNQ+3j/9wHS5
         GQFRz8fGBSU9VAFaYz9aYTg8EsK+4RwZR1OEbiEEmV33nLOtzscSuRC2JbDoNi+UjXsE
         ajZPgUxt28MBCUrSktTHULvZNIkifkt3OJjzNKM7YY5HiSpEiPp5Tfuyo/5JyqFP6xiA
         fLm9Xt4ZoF+JHpTbw+a3ZJaqK0jybU/JqrzfIoy2WxDjf1tTJreU8B4dgq3YbeEgT03V
         FsneC5tYMYQpLNTT5MIiPR9so7agd0lWonmPxQaY5E5eAcbLIzamzbx2CIrhWSvAoH1C
         xDiw==
X-Forwarded-Encrypted: i=1; AFNElJ9PqSY+W1ZY0LRBAaALB09OyKsaUwfASqD+UiCsVgDXywXDdwIbM3BuIyfET9bLxvx+gNeI9fStEqn+@vger.kernel.org
X-Gm-Message-State: AOJu0YxPN7W+0pzAeELF2yAGP5rcQOsMbr/5FObVtELaw2a0z+pvNmp8
	bsX8ziZ5mfQlxHh1+34Qaj+ysEII4SnnneIA18jOaxNrMaOOne9S6HTxly+M52Y+140sFxT1s3r
	Dskis4dUldkyZHvCuO9ttzpu6AkBItj3wl2fRU6HQLBj8Y5OgR44KhfuiyEFhx1jp
X-Gm-Gg: AfdE7clZ0uZKc4wFqMZhfNAIrKe60mhUGUQWDb2YLZ6NgKdlMO9o0qjK9wEk/LAG6TO
	mAAB1WFXje3i7AxKvxW6kpKCm5lb4sY14EnXXTNLXjFu4a5buRF2Zyw0ARgNMzge7MKoMVoTRsP
	15mNxl2xC3BZGki0U4ZL7J8jw/NcVfIOLURDPhKlpNKh+ankW5rozeZd9fupbC1gdLi+X2nH/AE
	HQ9Ijy1hUU/vTqjJYbYJfyQdeqDctP2d5u90QKrZ4CBVQA7kGuZ6kKrxka99IkV4sdT9mXRRSNw
	n2mis1hlDrasIbf/dZawczZkoPdtv5aUCc0yrIxJUWc+tOGqQxEuDq63pa3S49xDShIy1QgljA/
	3IOfVV73CrP0UOA04++j4P/JjE1ri0yv3tYACkxMfZl4khWamh8RDTmkPEQ==
X-Received: by 2002:a17:903:19f0:b0:2c0:d94f:50c7 with SMTP id d9443c01a7336-2c6bcfbb7a1mr1395725ad.7.1781640909086;
        Tue, 16 Jun 2026 13:15:09 -0700 (PDT)
X-Received: by 2002:a17:903:19f0:b0:2c0:d94f:50c7 with SMTP id d9443c01a7336-2c6bcfbb7a1mr1395345ad.7.1781640908590;
        Tue, 16 Jun 2026 13:15:08 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328abe7bsm136385985ad.49.2026.06.16.13.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:15:08 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/8] arm64: dts: qcom: shikra-cqm-evk: Enable sound card support
Date: Wed, 17 Jun 2026 01:43:12 +0530
Message-Id: <20260616201315.2565115-6-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ZgoeSQfqabEQbV0kG447iJdzK989Lsq8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX2t5NnfgC9tFi
 d8s2L7eSrqT8f9HrXwUROOyhlTpUYsvjKL8o1LhSNAyOxl54PlyLdvXRCg46UFC/Nn+CmS7U7tX
 MOdVeyLUUapy47x9Hw6pOBkGrkFtY0Q8TFV0jnEHT8YXLFkyRAD+DsyBbIpSAyN6IeiXyYvHpNP
 5qMIVxUBCmw5iyX8iWV07c58n0z2ayMhB5eYPokMk3TF4hx57RCW6hmHiTiKIqfeDnIbo3ubVd5
 clKLEumhD70/n19dc4J2sl0H3bC0jZUSgaZr1t2X6boWFQXkQzxnonI9qtIOxmoT+CuznqDkz2I
 eedbptu0OYN73nlOgAL8fE8wxbUqirbsu6x24pGxGczlJ4Ny8EMtj7gY411FOkjzjAInn+oMi79
 Q86MDFo4uQrUkYmm8clR7+giZNM4W/OwPkLBHyfoIhnt8CgaZfKGQ0oE7BWoyJkIohQmcQt6701
 ojyMVTISpdLe2j9ssvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX8YMN0vnj+bJB
 OzdglrI3xPGSThJ4vT6aYqk/3a6lmZHr6Zo7DOd0u3mIKXnGdSZ7TtuAIV71ssFBAbS2iGSFPpK
 /pvaqNnVyNM+fecO2R05bniEfi3q5pI=
X-Authority-Analysis: v=2.4 cv=MdJcfZ/f c=1 sm=1 tr=0 ts=6a31aecd cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=sP5GYvF3oMY1wlZ0skYA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: ZgoeSQfqabEQbV0kG447iJdzK989Lsq8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160205

Enable the sound card on the shikra-cqm-evk platform, including
the PM4125 (Rouleur) headset codec, WSA885x external speaker path,
and QAIF backend links.

Also enable the required LPASS macro and SoundWire nodes, along with
the necessary pinctrl configurations for DMIC and I2S interfaces.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts  | 222 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi |   5 +
 2 files changed, 227 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index b88652703fb8..b68d196b9d04 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/sound/qcom,qaif.h>
 #include "shikra-cqm-som.dtsi"
 #include "shikra-evk.dtsi"
 
@@ -23,6 +24,74 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	sound: sound {
+		compatible = "qcom,shikra-cqm-sndcard";
+		model = "shikra-cqm-evk";
+
+		audio-routing = "IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT",
+				"AMIC2", "MIC BIAS2",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb";
+
+		pinctrl-0 = <&i2s2_default>, <&dmic_eldo_en_default>;
+		pinctrl-names = "default";
+
+		headset-capture-dai-link {
+			link-name = "Headphones Capture";
+
+			codec {
+				sound-dai = <&pmic4125_codec 1>,
+					    <&swr1 0>,
+					    <&vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&qaif_cpu QAIF_CDC_DMA_VA_TX0>;
+			};
+		};
+
+		headset-playback-dai-link {
+			link-name = "Headphones Playback";
+
+			codec {
+				sound-dai = <&pmic4125_codec 0>,
+					    <&swr0 0>,
+					    <&rxmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&qaif_cpu QAIF_CDC_DMA_RX0>;
+			};
+		};
+
+		wsa-speaker-dai-link {
+			link-name = "WSA Speaker Playback";
+
+			codec {
+				sound-dai = <&wsa885x_i2c>;
+			};
+
+			cpu {
+				sound-dai = <&qaif_cpu QAIF_MI2S_TDM_AIF2>;
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
+				sound-dai = <&qaif_cpu QAIF_CDC_DMA_VA_TX0>;
+			};
+		};
+	};
+
 	wcn3988-pmu {
 		compatible = "qcom,wcn3988-pmu";
 
@@ -60,6 +129,79 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&gpr {
+	status = "disabled";
+};
+
+&i2c3 {
+	status = "okay";
+
+	wsa885x_i2c: speaker@c {
+		compatible = "qcom,wsa885x-i2c";
+		reg = <0x0c>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wsa885x_i2c_spkr_sd_n>;
+
+		interrupt-gpios = <&tlmm 77 GPIO_ACTIVE_HIGH>;
+		powerdown-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+		vdd-1p8-supply = <&pm4125_l15>;
+		vdd-io-supply = <&pm4125_l15>;
+		qcom,battery-config = <2>;
+
+		qcom,wsa885x-init-table =
+			<0x8470 0x2
+			0x8470 0x0
+			0x8470 0x1
+			0x0004 0x1
+			0x8602 0x60
+			0x8622 0x60
+			0x8458 0x79
+			0x810B 0xD9
+			0x8111 0xD9
+			0x813C 0x08
+			0x8102 0x04
+			0x811C 0x29
+			0x811D 0x40
+			0x8129 0x40
+			0x811A 0x80
+			0x8126 0x80
+			0x8103 0x6
+			0x80CA 0x85
+			0x80CB 0xE
+			0x80CC 0xC
+			0x80D0 0x80
+			0x80BA 0xC0
+			0x841C 0x4E
+			0x8435 0x47
+			0x86CE 0x09
+			0x8667 0x34
+			0x800D 0x08>;
+		#sound-dai-cells = <0>;
+	};
+};
+
+&qaif_cpu {
+	status = "okay";
+	qaif_aif_if2: aif-interface@2 {
+		compatible = "qcom,qaif-tdm-dai";
+		reg = <QAIF_MI2S_TDM_AIF2>;
+		qcom,qaif-aif-sync-mode = <QAIF_AIF_SYNC_MODE_LONG>;
+		qcom,qaif-aif-sync-src = <QAIF_AIF_SYNC_SRC_MASTER>;
+		qcom,qaif-aif-sync-delay = <1>;
+		qcom,qaif-aif-slot-width-rx = <32>;
+		qcom,qaif-aif-slot-width-tx = <32>;
+		qcom,qaif-aif-slot-en-rx-mask = <0x3>;
+		qcom,qaif-aif-slot-en-tx-mask = <0x3>;
+		qcom,qaif-aif-ctrl-data-oe;
+		/* Lane 0: RX (mic); Lane 1: TX (speaker) */
+		qcom,qaif-aif-lane-config = <QAIF_AIF_LANE_ENABLE QAIF_AIF_LANE_DIR_RX>,
+					<QAIF_AIF_LANE_ENABLE QAIF_AIF_LANE_DIR_TX>;
+		/* frame length = slot-width (32) * bits-per-lane (2) = 64 bits */
+		qcom,qaif-aif-bits-per-lane = <2>;
+	};
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -79,6 +221,10 @@ &remoteproc_mpss {
 	status = "okay";
 };
 
+&rxmacro {
+	status = "okay";
+};
+
 &audiocorecc {
 	status = "okay";
 };
@@ -99,6 +245,74 @@ &sdhc_1 {
 	status = "okay";
 };
 
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
+		qcom,rx-port-mapping = <1 2 3 4 5>;
+	};
+};
+
+&swr1 {
+	status = "okay";
+
+	pm4125_tx: codec@0,3 {
+		compatible = "sdw20217010c00";
+		reg = <0 3>;
+		qcom,tx-port-mapping = <2 2 3 4>;
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
+		output-high;
+		bias-disable;
+	};
+
+	wsa885x_i2c_spkr_sd_n: wsa885x-i2c-spkr-sd-n-active-state {
+		pins = "gpio2";
+		function = "gpio";
+		input-disable;
+		output-enable;
+	};
+};
+
 &uart8 {
 	status = "okay";
 
@@ -110,6 +324,14 @@ bluetooth {
 	};
 };
 
+&vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>, <&tx_swr_active>;
+	pinctrl-names = "default";
+
+	qcom,dmic-sample-rate = <4800000>;
+	status = "okay";
+};
+
 &wifi {
 	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
 	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index dc3861489f64..86b323f2fa58 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -53,6 +53,11 @@ &rpm_requests {
 	regulators {
 		compatible = "qcom,rpm-pm2250-regulators";
 
+		pm4125_s1: s1 {
+			regulator-min-microvolt = <1396000>;
+			regulator-max-microvolt = <1396000>;
+		};
+
 		pm4125_s2: s2 {
 			regulator-min-microvolt = <1000000>;
 			regulator-max-microvolt = <1200000>;
-- 
2.34.1

