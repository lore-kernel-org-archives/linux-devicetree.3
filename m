Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568250;
	b=33LzYIksSDJfx0Qhd4ven295DvYd+HEGYlk/WY9kJUmIXWzYVkDaZognnMWYYl1P+ODW
	 dumwQ1xZXQ2MDGFMo7S3Dh17SXe2SPHpS/yyuL6sP47LZcsHllQ6tri2lUUcJATdLWnxf
	 H+JLYwiK5A4ceDgLL4qpsH0CFsOSRJNlV1+K4krMeWnKCls8JxmifiK0BjJswf402AKlC
	 dM+N4wBLRO4+5kiJOMZRh3T1diq5pLETb3Rd2Dn85y8gdzIHz3lpMpkmZwNhb2wB8nRYl
	 gTMt0hJxto7enPvQMxRupmf3nleUyx58gsJ6299v/559j4NbKKunagVprtZh5m6IiLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568250;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IMy6Ev1Iqy7o5vhaentmWFPLH1WBrPlgezDbmf9nqJ8=;
	b=nY6Has/huIaKQu+LlMnRaCsDHLHqPBBzQf/EkUD/oTSaBXf7xGBq46sxqPCCfDDEqPi5
	 8KW5mrG8JbTqPdDUr0dH/t8tqieR/ety4XEYMo6rQzcMnvTiT/+5vxpgnurgoDRx81QRF
	 LsfkpS+i9U8RX8Yh+ZWUkyYEAFGIK5S9VNh1cvbLWSirZYywblg/jJJdggOt+tgjKOdTU
	 0G2Puq7sDhpswmDpNUTGKjFdZ/I91kXtoS6b+HjoLy0bwtXRROwYgIdCp/VaM7spna0fN
	 AlTCHCKbOuzcZ2vZCiRYSaWbJc4V3JNAKQiFqDJ7L+QxXAi1+0uMkZNcH4UFfNbkL7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QPeATwSD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KZywAMDH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D78A606A336
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D78A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QPeATwSD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KZywAMDH
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jMcC2848656
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:37:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IMy6Ev1Iqy7
	o5vhaentmWFPLH1WBrPlgezDbmf9nqJ8=; b=QPeATwSDRWOgzsrvE8gFroN1/n0
	rG9FgOouFSxiEjpVN+sx+9TrOHcYnIlOsNCC873KdHCxxYF2ccut/24bfQ10WeZ6
	o9dePkOYOqm9ZkFnXioLF2/uUOF+3uGcg3oapT0bt7h0VdSIa3fcit8as27avs6n
	f3lMFXKpLVfu4SOWl9wTmCXmENshkk61boe1kLSWb4X9Fb/VyXCX3IGmCN6XiEAP
	j7STghWpPmltExaRa8QBHQIhWSWL+ph8NCGPto6eARzsi2Qrjce792uimqgZsyBf
	g92oWx0cwLHkM0FDoEzpXdpj42+FftUaaoXBACrslnnT8u0y+EbBFKK12aQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb9ackb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:37:29 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-18ab3ee4935so344191c88.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 00:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792568248; x=1793173048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IMy6Ev1Iqy7o5vhaentmWFPLH1WBrPlgezDbmf9nqJ8=;
        b=KZywAMDH5EmL34wKPMV0Up60h8wTjz2R7ORey/P3APyhDFXV86qbKZFoEtGFL+DaEq
         BZAbDicHgUlP9AcyvHBQeTxHA6I+umUYDlOikGiShmmOFNqFSa6+TMBkCza80yF3+kU0
         QGCNBUrCfFnlSXmr+ixND2qonP3cIsJjkfVbA4zmbqj69GrV1MUY45INbRUSyECDKXF3
         TsbjtIs4leIhqNJzUtetoTb2FDGVe1N+zhxbdmbVAWNmHwLeUTibWtV6JR7GhhnjZEAs
         LQTkVrCN3BL5raF9rzqSw9qCRHjsh72MzvCZ7p6HdScjKgbpIAn5xB0+h3LBO0exQ5Ee
         br/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792568248; x=1793173048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IMy6Ev1Iqy7o5vhaentmWFPLH1WBrPlgezDbmf9nqJ8=;
        b=spT0l4gh4v92KDUJgKjwLb31TozvkrBVqfrFbMNJGzxNQs3bD8ZotYuWeEnC/DqfSt
         2ySOxSJ4Ot75BhbPth2Gae6CTb/9lObcCM+jOtZRggf0Dz1D5zwngtAmukrLl19ickpK
         VwWzQHDoNJ0oXlVesyu+dlqoIL13KcaHcTM8+g1uqAVfkN1Wskh9PUYvpONYaA9su7Q8
         nvh6eaLpXtWo1fNTnxBavndIfKekRPxg2azaABeU4WwL0QBGg6CIfkKkYlCp7UJMOLEq
         WRAaeEckjTL5uxQg3hOc43qAM3ijOEEvTLlhA2VCIQZ/lmRAmwzi7tJhrDGrqNWK3XJ9
         FCzw==
X-Forwarded-Encrypted: i=1; AKwUvBzMJnWG/q9/Rq7KyrtZ1MlsreeTIISq3xvLXa4sIRT40aFPhk6VM+eWsdnm2TQnVU1WkBW7KGoBbVVz@vger.kernel.org
X-Gm-Message-State: AFq9FYLeUnnlIIT3l/x/umiXfvJImbBCrXkW346QCjBfymwKGMhALpfw
	OywG/kanPz1tzZkIBSdreYAwydjN6YEiUNGvgcGJ0ga9P5H3Qk6OYjbBUNkOvxY5WMIaWAfLtkt
	XyIkf6fW6LRXHBKd2mZr9bWEImqAGt9JMiX/AW2LjZp/EzzKonNLjRD/snkIn15nz
X-Gm-Gg: AYBFou3G9Dl6d37csgYJc7TYtlT/H7oJ43DMyHLMkrkNTczlOccb0c80kVT2Uh+RHRd
	d7S/c6n2XQjtT7ky8PXhYDefPVfZSxDTkhjvEtQvIL/5XEYAV9JhAQiCF9zPl/6tipVfFuzKwpZ
	t83zkVfnCZFAXEjkzGfiMPq7enSN+h9ZBDvLabKGQeJtASUbvXx2nYYVM30JZxDBsG2aFRJg+ax
	tHIufdxYYW7gg5nQMCmFSmqFEWRhb9x5+RCjF4ze8SuZTAkJQzMZbpmxcQu8bl8PXF8zvZwPzAX
	3MVHuuq/aISKnrg0sDdPGFhrdkwobV/1keugo/Ssxp/W/RiFDo7BkJffb4YWN+ELIzp0Y4uCAIf
	VmV9c7bt7Is7aFvymFsM8eQpEASLgQB5PwjYmTkxSb9b8b4bm3E1YPjxpi3k=
X-Received: by 2002:a05:701b:2097:10b0:168:6ad8:e88c with SMTP id a92af1059eb24-190a67fe090mr1853732c88.39.1792568247998;
        Wed, 21 Oct 2026 00:37:27 -0700 (PDT)
X-Received: by 2002:a05:701b:2097:10b0:168:6ad8:e88c with SMTP id a92af1059eb24-190a67fe090mr1853702c88.39.1792568247415;
        Wed, 21 Oct 2026 00:37:27 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm4042471c88.14.2026.10.21.00.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:37:27 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v2 5/5] arm64: dts: qcom: nord-rrd: Add sound support
Date: Wed, 21 Oct 2026 15:36:33 +0800
Message-ID: <20261021073633.2163128-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfXypBj+MJnLz40
 ULh//4jlMoI2fJL1rGgYCfFNuhd/BGzHieSoYyKOdk2W1bOPP2u3nFdWRFp8Fsmy5yRTKpBQNlV
 if1Jm9L615SZyApmvd9tTPgEus7UbV0=
X-Proofpoint-GUID: miiLJ-3an_-UyF3Skk3vVZIouQmGPpMw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX887oL0q5KLte
 VMDrLB12V4P/wpb9KgVqYdIt+WUG9BXiC2AqQv0VM/AJHjkpEPp0088axBz+1IulRDWqZ+aodfN
 jaorCsDl9fYQN/bz3z2FbLYoF8f60AkQX7Yqx4JNye5iW2EvobrJ8gbEo5EWRUmN5IgeFNsQUqD
 2N7DrVjen3gtD/emvg8S/NT4vQ8O8xuLl7dn/negrMcl3MrFJ6yfVDhQ8He70JWzosIB+lXMGZO
 L21hzdlPPJdUhX723cLGEZlW5KHwbva/V7poBvOI+KGyTNqng7RBSdT/JR+KHs1bO0Vs82CBLR4
 5d47s+CzySkXP0NgvglmkuuS+BMBhMNROpOnRlfF2YPAJrYNAOuL/1seafUvj8ozOb57sTuOj1+
 SNS1sOZhFbBUBD63kcebEtJFMv0Yr1Hh0uRBtx03/uo2FKSK6wo3Rn6qlKxDmlgLaVknQN4yZ/c
 1virCrGpueuD+p79qYw==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad86bb9 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ZlzAYip4OQkxlMcad5cA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: miiLJ-3an_-UyF3Skk3vVZIouQmGPpMw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210030

Enable audio on the nord-rrd board. Add a soundcard node using
the qcom,nord-sndcard compatible.

Add PCM1681/ADAU1979 codec nodes on I2C18, with the PCM1681 system
clock supplied via MCLK0.

Describe DAC_ENABLE as the enable of two regulator-fixed supplies
(3.3V and 5V load switches) feeding the PCM1681, and the two MAX9892
click-and-pop suppressors as one simple-audio-amplifier on
CLICK_POP_MUTE_N, routed after VOUT1..4, so DAPM controls the mute.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 153 ++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..b0abee05a8ba 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
 
 #include "nord-embedded.dtsi"
 #include "pmau0102-nord.dtsi"
@@ -53,6 +54,106 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	/*
+	 * MAX9892 click-and-pop suppressors on the PCM1681 line outputs. Both
+	 * parts are muted by a single CLICK_POP_MUTE_N line, so describe them
+	 * as one amplifier.
+	 */
+	lineout_amp: amplifier {
+		compatible = "simple-audio-amplifier";
+		sound-name-prefix = "LineOut";
+		enable-gpios = <&tlmm 42 GPIO_ACTIVE_HIGH>;
+		VCC-supply = <&vreg_per_3p3>;
+	};
+
+	sound {
+		compatible = "qcom,nord-sndcard";
+		model = "NORD-RRD";
+
+		aux-devs = <&lineout_amp>;
+		audio-routing = "LineOut INL", "VOUT1",
+				"LineOut INR", "VOUT2",
+				"LineOut INL", "VOUT3",
+				"LineOut INR", "VOUT4";
+
+		pinctrl-0 = <&aud_intfc8_mi2s_active>;
+		pinctrl-names = "default";
+
+		aud-intfc8-tdm-playback-dai-link {
+			link-name = "PCM1681 Playback";
+
+			codec {
+				dai-tdm-slot-num = <8>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-rx-mask = <1 1 1 1>;
+				sound-dai = <&pcm1681>;
+			};
+
+			cpu {
+				dai-tdm-slot-num = <8>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-tx-mask = <1 1 1 1>;
+				sound-dai = <&q6apmbedai AIF_TDM_RX_8>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		aud-intfc8-tdm-capture-dai-link {
+			link-name = "ADAU1979 Capture";
+
+			codec {
+				dai-tdm-slot-num = <8>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-rx-mask = <1 1 1 1>;
+				sound-dai = <&adau1979>;
+			};
+
+			cpu {
+				dai-tdm-slot-num = <8>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-rx-mask = <1 1 1 1>;
+				sound-dai = <&q6apmbedai AIF_TDM_TX_8>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
+	/*
+	 * DAC_ENABLE gates two load switches feeding the PCM1681, one for the
+	 * analog and one for the digital supply.
+	 */
+	vreg_3p3_dac: regulator-3p3-dac {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_3p3_dac";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&tlmm 41 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_5p0_dac: regulator-5p0-dac {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_5p0_dac";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&tlmm 41 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_per_3p3: regulator-per-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_per_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 };
 
 &apps_rsc {
@@ -377,6 +478,58 @@ rtc@32 {
 	};
 };
 
+&i2c18 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	/* ADI ADAU1979 - 4-channel 24-bit ADC */
+	adau1979: adau1979@31 {
+		compatible = "adi,adau1979";
+		reg = <0x31>;
+
+		AVDD-supply = <&vreg_per_3p3>;
+		#sound-dai-cells = <0>;
+	};
+
+	/* PCM1681 DAC */
+	pcm1681: pcm1681@4c {
+		compatible = "ti,pcm1681";
+		reg = <0x4c>;
+
+		pinctrl-0 = <&aud_mclk0_mira_active>;
+		pinctrl-names = "default";
+
+		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "sck";
+		assigned-clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		assigned-clock-rates = <12288000>;
+
+		VCC1-supply = <&vreg_5p0_dac>;
+		VCC2-supply = <&vreg_5p0_dac>;
+		VDD-supply = <&vreg_3p3_dac>;
+
+		#sound-dai-cells = <0>;
+	};
+};
+
+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dai@195 {
+		reg = <AIF_TDM_RX_8>;
+		clocks = <&q6prmcc LPASS_CLK_ID_QAIF_IF8_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
+
+	dai@196 {
+		reg = <AIF_TDM_TX_8>;
+		clocks = <&q6prmcc LPASS_CLK_ID_QAIF_IF8_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

