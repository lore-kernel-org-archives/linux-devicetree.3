Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC47768EA
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 04:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619907; cv=none; b=JN5Qw8Gwaa2Ct54O7CY1eeDflC3eltAsE3zw1woZHFfWItqqHqmJS+8kq5w+i/2T0E2i1Nh2rjRgG94INpQA3W4Wv5EEWPzE/LrGRkOFIWRCeDsbx9g6gSFZ5gutA3gJxztrBJhpZuTh+kz1l1pwBlNop+xocgMZkC9ID7PpvhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619907; c=relaxed/simple;
	bh=5cpmYTndZ/T5fEiU1HJMYUbSpdTK/ip6e+2SPQvfXOw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PhzMaqtIV1xF7DCzsA0zJwsjsNy+1TTjYo/x8O5S7HS/ZxNmpTHS3E0GTXb5J1GaaK7OEkEMG94KXrZDywO9J6BR8kQXO12RqEfV95hkeLefZFe4Q6u9Va2s/GgwP1G1ad6G2JSRE2bz9b6NzujDyqhieXzX7CzaknMAV6BwYao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kv04nuLW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LjWkdF4W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kv04nuLW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LjWkdF4W"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H2GriB1239354
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 04:38:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rjcPssVl/NJmCtFy10Y7OQ7c4gWY51RRLlKdvghgp54=; b=kv04nuLW+dgRfW5Y
	8/uxIZAHH4enDrE1yAyJNxWx0aoxw9jwAYC9aTyz6xeGnft2rVPIKc1gOBpbF1eb
	e9PC7Dj9Vzg/Q+9TP32L760nXbkyW3rDMnUI2tkniisNK5qKvnl5k0RbNH/sKMfJ
	t1WZ00O8fzYSauEfSexSgFANYw8vMY9+yNHQnnFOPDoosGxhx8EkuyUb1eeocl3Y
	1XNL8UvFeI19o3+gfoZvwMGtU5XJ4YSikwzBf8vZaqT6llj9Nv9Hw23Y1vdyew/+
	WCV9H+JY0PhPRK85/EjkoVu3UGAwQU+UzTJH6sWBmZ32WI1+GbPoIQGMaHRGUgNo
	S/DERw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr79m0f8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 04:38:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d63bad3d09so6776635ad.3
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 21:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789619902; x=1790224702; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rjcPssVl/NJmCtFy10Y7OQ7c4gWY51RRLlKdvghgp54=;
        b=LjWkdF4WwGx+yS0pRPGQ1lgZz6k9hRUmrJo6YYhfphKKXXaZEerwE90iD4khvOWE+h
         DXKfDYxzBiXyf27zDAz5Ql2gQhxc7Q4wr7N7dkMqt0smfn0DL7M/J+ou1+4nPNjg89S7
         FMGO5JB+rjVcY09bdWp1zzNoPl9SoiVFuNE3tK2/ZKBV9QYEF/qJJcRO7BRuzF5p2wRt
         /RAnjeNTj7LORmSNffgP3uwHXpjJtkwMY0dwKHClPY17VpnwxtgtXVZWUn83C9prMGvc
         zO5p6IxnPHQZ9ELnoWD0BaAbzbCPTFZz9qf33pi6RLAGWCrmZrBPV+E4SQRBU74STwe0
         X8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789619902; x=1790224702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rjcPssVl/NJmCtFy10Y7OQ7c4gWY51RRLlKdvghgp54=;
        b=REDrAMnAWbSB1TmS4c7hFZP0AtebPxiI8lLP0VFdpMCxFJvw9PgxHIp56JMkK8kHWd
         F58IlgVZ1v6bpJZc6H3IG712q/y8PmtaFQ4q3czfraGORc5GH0gBH7LBqdqo0o/uyhpb
         1/m7845XrjZTNE53weIG+iF6c9mUrgYTrNQaeiANtYW/T9qtFquzf1ySbgse7kO4vnRk
         lwXCTs0qUwhIzjxZb0bvLAYLYC58N4TwY7jnwKUX5ZC2587KiVya+/uZPGfeNkwI8+Tm
         D1YDHxcM5V5dc7ENairB8qq6RShc6lcMQovMku6JR8LgZerRbG4ipsRF3mtn/4qRM/Iv
         2VoA==
X-Forwarded-Encrypted: i=1; AKwUvBzc/DwnKmm5C0hhzGsnO4AO0sE88LdHS2ZIU6w2CO7OzkU2mJ0wDNKAZwWU6ymFxa9oLHUWpZwC7CF1@vger.kernel.org
X-Gm-Message-State: AFuF++mOnly6pxn+tXvX9dXczH12cwoJvOIyHQlEC9yv2woZkC6kVn3z
	wDoXfet5mLDhq6msj8jG3oFPDDWFgay/dLFceZfozhtMMjcOk+vmV5HGB3LI1vCk9cCQaBIvhF3
	e1dlZl9uQk0xuFYHXG1fMi9ljWCGgfB2mqGdB4gT4BJyXYplWALEUCIAlRmS6PvoM
X-Gm-Gg: AYBFou2vQYM9ZXgHGpMp336Pr8+ZF8BG9YmZ0afhy6ut8rB2tW/QvTvL3MmtjYzCUh0
	TEVt+E1EF7lzUCGScPjKiF/YUPidCZAsixz2uvOR7/GwCTmNYP4HrU1Pq8eCfd65BPbpSD+RW9o
	Vld0Kdbr2iMyc0Tci/Dk6IlU8qW39So1RbhILYjbRrxBsFW+XDqqc6Cgr8SrCsfJnzeDuHn75Fr
	3P9r11dXudJHVZ6YhHQt3sludisYZIaTZjwxse3QRCaxzogjw5zYsyoKaj3A6MJ12lOdeZ7JrFl
	mzoHvIDBdi28BY4kFP7ZVEF0G3rJhAk7ptpXURr/HajDiRdVYox5epQeeY2JBamWLx+ZFkfMgCO
	My2+i8AFqIUHAQ58fz/gsPP9JaUxENZgh7dBi
X-Received: by 2002:a17:903:4b24:b0:2db:3b35:1ac6 with SMTP id d9443c01a7336-2dd8dc03865mr117006355ad.5.1789619901530;
        Wed, 16 Sep 2026 21:38:21 -0700 (PDT)
X-Received: by 2002:a17:903:4b24:b0:2db:3b35:1ac6 with SMTP id d9443c01a7336-2dd8dc03865mr117005945ad.5.1789619901074;
        Wed, 16 Sep 2026 21:38:21 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a9fd38sm12357376eec.13.2026.09.16.21.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 21:38:20 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:07:35 +0530
Subject: [PATCH v3 6/8] arm64: dts: qcom: shikra-cqs-evk: Enable sound card
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-shikra_audio_dts-v3-6-9a49e1ca6370@oss.qualcomm.com>
References: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
In-Reply-To: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789619867; l=5931;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=5cpmYTndZ/T5fEiU1HJMYUbSpdTK/ip6e+2SPQvfXOw=;
 b=BRysGiZHJHz99X7IhLzZV0RKoJbo0/Fd4qSzZii9MdLEcZlB878x93iW4HyBkzWs5cF6M3zrr
 egQ5B45kXpOB8j4FZ9+NcSLAmAxbH/9OUnFlTk37J9KrrPOPKpoKFqO
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=Qf7zLcbv c=1 sm=1 tr=0 ts=6aab6ebe cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FQklFWhNs-w8jNMOVjIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 1CqkoHoQgnUG4mqvJrkei2qm8yO4_kRd
X-Proofpoint-ORIG-GUID: 1CqkoHoQgnUG4mqvJrkei2qm8yO4_kRd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA1NiBTYWx0ZWRfX2twSCefhal3X
 q3D94FlBsLO39In0LXB5KEkgwqdiAyv3xUpH5WUwKT4+Ck8X8m1nq0amBTGiraDqJLJj1hBSajR
 1N6Keyk95Zy4j/vdoRZj2h9XdqnhTKCifW1rRUDWqVDw/fQ8Laj6U9mCegE7YXPp8nErdCxu1E+
 zbfBkisxAoI1uygvSjk5aqKJ46ps9N8kp7/GZ8iMpn9y4Ym0HkItnITttc2t/HePj+6nHP0P3BK
 aJZrynjtT5igq5iu+oLG5lgW2p/JgjsClZX7RSsnHPsunfdkU4m1N6VPab/QHfHYn8kikXXZjkH
 KKqe4ydi4WqYS2NL4SNB7Gr8PIFf7Zm11C9YFBFeDdMKyhC27kwmv/+CtktHv9euuC+3ASDhmG6
 sLyHqJQJEBg8/JuvXqcivQuCThNyh4Vw6DjfqIUQSefYex8RhJhfY8zn65qJyVtkklyCO4oHd4q
 GwP1WeL4iKJU61R14Cw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA1NiBTYWx0ZWRfX+0OZsgrepmVY
 PyXyFPQUsO0l0bjPcnN4uJhye9Dw1/Vgy8w7AL65xO0SDc2T8mJrNvFmYV9XNSADO5JWytIRKYF
 Zlzty6s8GbEZZ8fKLFbsk3gDUPg7UrM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170056

Enable the sound card on the shikra-cqs-evk platform,  including
the PM4125 (Rouleur) headset codec, WSA885x speaker amp.

Also enable the required LPASS macro and SoundWire nodes, along with
the necessary pinctrl configurations for DMIC and I2S interfaces.

Also enable the required LPASS macro along with the necessary
pinctrl configurations for DMIC and I2S interfaces.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 219 ++++++++++++++++++++++++++++
 1 file changed, 219 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 01400612d147..4225543ba564 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -21,6 +21,121 @@ aliases {
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
+				"VA SWR_ADC0", "ADC1_OUTPUT",
+				"VA SWR_ADC1", "ADC2_OUTPUT",
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
 };
 
 &pm4125_hs_in {
@@ -31,6 +146,16 @@ &pm4125_ss_in {
 	remote-endpoint = <&usb_qmpphy_out>;
 };
 
+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	dai@40 {
+		reg = <SECONDARY_TDM_RX_0>;
+		clocks = <&q6prmcc LPASS_CLK_ID_QAIF_IF2_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -50,6 +175,18 @@ &remoteproc_mpss {
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
@@ -100,3 +237,85 @@ &usb_2_hsphy {
 
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
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
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

