Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CD355D877
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 22:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790115125; cv=none; b=YRTSiX4+vKqDA2hbWJ8ETzIeI2HO75UmWW44Y6QlVoNxDa3HBR8bpfzXRQBNQIwVIVNhJDeql+u87L2HoxWUMVedHJeh6vqK3TrmT1r6fNgXYD3Galopl6xQ7a29yjst9OQB+Lty7wZnf4pW1Flf/Oeb5vD/4H5ZXqC/nKSmKsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790115125; c=relaxed/simple;
	bh=G20bLRtZKjZD2gjlpedYLN1aTkmMG76Xtt8Gm5aTPNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mgfOKp7POBsqmvyzPT40Q7+2oqG0Gy3ivl8eiCUf1qg8INIudF3LhUZcspnBNSUPJ8ZqF5F8GrvfSulk/faNJmIMqeqvSEdRGsZ/rp1XgYH0hF/M8BEjsS94H5qenuWaTFbuTWCeEn4X3wDHhN74/ezNfWzcKUxepKB3bFNrQbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hr0Fjgb+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ba3n/Ljk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hr0Fjgb+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ba3n/Ljk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJBmQv3897644
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 22:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DxeEMBKh6Jf
	FzQG0KNCNPMJyIHazGV3M+AfgG8Vt8gc=; b=hr0Fjgb+O4Q/UYbgYBAQmfiokt9
	JAKe3ABDbWwobsWxbI3keaqT3w3Nd7oY9WkrEIAwsRH7q9fORGgWZ4rrdIaGDLFb
	44DNfoqCUVy+GsJc+Dv35q0tyP2NPCUcAL7jX+rkmI9h2xe5MDf+CFMER/6d+N5f
	Hx1pGncKFZsf/iL93xO6EkEvQ1rr0r/TuiWsqEPxf8R6zmOzbK3Jp7FghVviV4lV
	kHq2L1dHlZChx8yK1ON9bYjdju/mmOcade2Mzs8gD8+0/e1DL/Oh4e2eq/Co5Zo/
	DqAoyDya/JXMyXxGJbNrCtZ8Dx4jEzUHi5OMozS0QaRNkZ8XmdTB/8SHssw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma0tp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 22:11:52 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7a532e31dadso373501137.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790115112; x=1790719912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DxeEMBKh6JfFzQG0KNCNPMJyIHazGV3M+AfgG8Vt8gc=;
        b=Ba3n/LjkfqO0KLjgrMxHLx6zUFHGK8PFGMBH+ae/6IltNtTtmqdtybiYhvguiL4rGg
         VYZ6UGyetUmwpF+u20hTiU7brmtclf3Q0GzRZ82fS56boLqLr9ntVYnVZzdoN1ZrlLym
         HN//fBYBRC4gdKhNy9SRBsNrivQAZa0eGxBFdeHapmACYyBEmP7p2cPjIMwkzZEDvI9s
         wgqywFRsvXLGRm+BWKneIjSiG64R9+EBGovL+NyhpE6eeGahjtSGuQ+w5n8XJwzBg5LS
         2SgRes2fFfNvgpnnlEhP5ts7vXR6ToJYumyQ0DFYdTgf0jRKwd5m8ArKzyoZ2wFPrnwo
         v8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790115112; x=1790719912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DxeEMBKh6JfFzQG0KNCNPMJyIHazGV3M+AfgG8Vt8gc=;
        b=WW+VpARGnaxrBvh8iT8/spoYQHysNTkfGyWqsd6jN3Mwtz2qFAtGg5O2169dxJJ+MD
         OkFWXBD0cahXFy4fQGzdHypOGOGaXJE22L8VbdmMxcxAMGyj+uWm4suc4EZtDuqfczOL
         VYPixF1GeAZWONcw3TV20NnKUjLyNdDSZy8Ph5SV2CIpLS4vh3Kt676346JS1muWalIM
         bELZQKZSHT32MSGNfjXdfbTWyAjwQJcG7+O5LS09kQ0+9nv+NkCRcT3q/SWgV7Q+QNtF
         OTV8xSj8B4SJxmASzHCf2/ADs+RwP2YmAldP+8fiWRNpfhiZ2CImP7yc1VCndRuz8/LN
         uEXg==
X-Forwarded-Encrypted: i=1; AKwUvBxu97LT+jWJkwKdC9AX7i2e7kNxxDCxB/P84V0jcklwHEtdOHuIJF3+JAhXH1+JPpfMfQfVYT51OMzr@vger.kernel.org
X-Gm-Message-State: AFuF++nT7OLho1ww9DoQ5iNcr7UDmLtgmqKRdpTqPar46Ziw2rIP4Y2F
	5+Fd/PAwDtx1kAYSBmxMjjj+mbpXP9yzTPRxJTjB4yh5w20+i2EbiMym8Q70J10HHV5YYru1M+v
	pqP9xoTMgM7rPpQf9Qyv5a4KO2Gv4HfeIi6sbR7HjuehWCfzDoP+KOD9ZobbPiaeK
X-Gm-Gg: AYBFou2tjMxvonCqLTZP27uvOenm6CCqAiBROqNlyevCubEyk+IlbRNIwIHdQyxh0uA
	pbuMuI/JBCCuNwgDW0iT+lHZ8oVomvetVpDWyUSCCsql4oDqKjVTsT6+aoL8cQ4+5kflhTEE5ZY
	2EJ43L+at/zD/5oJVt/8+tXdbcaPKYXYUZ6uX44j8syf8HYF8jtj0OSNXLXUn83x/68Z8QRsUhp
	Je8TBCr6BEX6+ccnlq+5Vy6aMadrqFDyBGGjbtS3iNegKZZY/BTGzsn9I/6JorrpDtnqpkJVqea
	v/lOgLadyicwQbhL6nRSo79IcMalxRWMrRys6akTj2ayMCmArh/RL4+qzP5v+HUW4MFDetLLwq9
	sMGKRoRs3LWzLA/Vi0v0r0x9O9yOPYIK+49lmT4GbEEyebumoNBU+Uv1521loE8sBGItKsUQIwC
	4=
X-Received: by 2002:a05:6102:292c:b0:7a2:2068:6e37 with SMTP id ada2fe7eead31-7ac1bb2edaamr967142137.15.1790115111543;
        Tue, 22 Sep 2026 15:11:51 -0700 (PDT)
X-Received: by 2002:a05:6102:292c:b0:7a2:2068:6e37 with SMTP id ada2fe7eead31-7ac1bb2edaamr967121137.15.1790115111130;
        Tue, 22 Sep 2026 15:11:51 -0700 (PDT)
Received: from debian (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488688856f0sm1400270f8f.30.2026.09.22.15.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:11:50 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 4/5] arm64: dts: arduino-imola: add support for sound
Date: Tue, 22 Sep 2026 23:11:26 +0100
Message-ID: <ca8cfb43cdc08851db1283df2108e77b22fedc6e.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _yA31FBOufRmC0ZcBE5AVtwwtn_vBXMR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfX1xzT6tpe3YEQ
 hqx2iHvCU58yFH429YzvCix3HVam69luuKeUzi9XucIrcGYWpprDbztELNINSX8aMGmwnoxpk+t
 L1MYlLSnQlps1EjCaDIUMJqN5Wv2b2U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfX5raJ5jzFrCKC
 YPBpHr5KhREtfCMKEctAKFuATnVEtIFCv4ggTQ1zbfNjlyjh4xdMTbaFthgGi0a5EnleEIynJxl
 KlkXqEw/IavFHLQe09Vr8V/j+SJHRb3hd3ooSINwVXW4OwfYWq37o2/U4OFNlo4GvPBLOl1qF+b
 F/NFogWvleDKMRJN+JruGp+DrkpWKqMhTA3NRClfoDTOd8VoAobHBmUOG5ZoFAzhgB1nZo3lWY2
 HSx1C86fvUEiA6e1riF0YTs6G6tb6wlgQqpMkcnH1M7CuwEcW9eENG9TYT1dVMsBeEo82TL/iNV
 MAezo0gSPSlnhgUKzq6IfF14Uff+34rGIWnJiI4RX2Z3mlu2kr3aQcBbrcP1i0fNrRMovoEhpRS
 UQdxsSh7nDQIaC4sYMTePMjco4jRXnjyB4jqVXWbXnZpKJGH7GY8r40InKRl4J1P8HS5Aq6aGiP
 q6u0/T1oMEkCWkGeTVQ==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab2fd28 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=Hji71o54RgNgZYqDgtlrhw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=mtT030_wRxJr2dZJK4YA:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: _yA31FBOufRmC0ZcBE5AVtwwtn_vBXMR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220301

Add support for sound on Arduino UNO Q board, which includes
- Headset playback and record.
- Lineout

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm4125.dtsi          |   7 +
 .../boot/dts/qcom/qrb2210-arduino-imola.dts   | 134 ++++++++++++++++++
 2 files changed, 141 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
index 3dc8d667d091..85da78aec578 100644
--- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
@@ -81,6 +81,13 @@ pm4125_gpios: gpio@c000 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		pmic4125_codec: audio-codec@f000 {
+			compatible = "qcom,pm4125-codec";
+			reg = <0xf000>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
 	};
 
 	pmic@1 {
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index c472e13fceca..e99d2a56dc28 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -110,6 +110,102 @@ multi-led {
 		leds = <&ledr>, <&ledg>, <&ledb>;
 	};
 
+	sound {
+		compatible = "qcom,qrb2210-sndcard";
+		model = "Arduino-Imola-HPH-LOUT";
+		audio-routing =	"IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT",
+				"AMIC2", "MIC BIAS2";
+
+		ear-playback-dai-link {
+			link-name = "Ear Out Playback";
+
+			codec {
+				sound-dai = <&pmic4125_codec 0>, <&swr1 0>, <&rxmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai RX_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
+
+		hph-capture-dai-link {
+			link-name = "Headphones Capture";
+
+			codec {
+				sound-dai = <&pmic4125_codec 1>, <&swr0 0>, <&txmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai TX_CODEC_DMA_TX_3>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
+
+		hph-playback-dai-link {
+			link-name = "Headphones Playback";
+
+			codec {
+				sound-dai = <&pmic4125_codec 0>, <&swr1 0>, <&rxmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai RX_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
+
+		lo-playback-dai-link {
+			link-name = "Line Out Playback";
+
+			codec {
+				sound-dai = <&pmic4125_codec 0>, <&swr1 0>, <&rxmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai RX_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
+
+		mm1-dai-link {
+			link-name = "MultiMedia1";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+			};
+		};
+
+		mm2-dai-link {
+			link-name = "MultiMedia2";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
+			};
+		};
+
+		mm3-dai-link {
+			link-name = "MultiMedia3";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA3>;
+			};
+		};
+	};
+
 	vreg_anx_30: regulator-anx-30 {
 		compatible = "regulator-fixed";
 		regulator-name = "anx30";
@@ -421,6 +517,44 @@ mcu@0 {
 	};
 };
 
+&pmic4125_codec {
+	vdd-io-supply = <&pm4125_l15>;
+	vdd-cp-supply = <&pm4125_s4>;
+	vdd-pa-vpos-supply = <&pm4125_s4>;
+	vdd-mic-bias-supply = <&pm4125_l22>;
+
+	qcom,micbias1-microvolt = <1800000>;
+	qcom,micbias2-microvolt = <1800000>;
+	qcom,micbias3-microvolt = <1800000>;
+
+	qcom,rx-device = <&pm4125_rx>;
+	qcom,tx-device = <&pm4125_tx>;
+
+	status = "okay";
+};
+
+&swr0 {
+	pinctrl-0 = <&lpass_tx_swr_active>;
+	pinctrl-names = "default";
+
+	pm4125_tx: codec@0,3 {
+		compatible = "sdw20217010c00";
+		reg = <0 3>;
+		qcom,tx-port-mapping = <1 1 2 3>;
+	};
+};
+
+&swr1 {
+	pinctrl-0 = <&lpass_rx_swr_active>;
+	pinctrl-names = "default";
+
+	pm4125_rx: codec@0,4 {
+		compatible = "sdw20217010c00";
+		reg = <0 4>;
+		qcom,rx-port-mapping = <1 2 3 4 5>;
+	};
+};
+
 &tlmm {
 	jmisc_gpio18: jmisc-gpio18-state {
 		pins = "gpio18";
-- 
2.53.0

