Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76E0368287
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 19:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784230238; cv=none; b=UDsk/3p1gVpdlK0tgN/RNkhSL02YmxQCJqHzEuIQOTFL3vj4Ey4ktfGPMzyQHndOUltQMiUgr7gmJx4iCrK8TatyKqBkQzwvAHJiM9sQF/G4BlI903G2aY2LlXbDz578SF6oyiy93TUJRbsuBvXge8eAq0797uiXC9RGpA6d5fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784230238; c=relaxed/simple;
	bh=LjeG481lt5yH8iF1LajKFWk4v5kGtVoNrCGBGwjJgCw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YHjvsmyIKIhHHNKLAX2zwrIeowar+uOtiDY27+2gleNPwfRbp0KWAjlNCncztoO9KttzOwMWfVoK90puCKZnUb4GUoVb8qZWlizCkhtB6EEMkuLMKr0Ab977C0i3PreaiNnWJzzi5o2q9/Rhp81cG8BeUesGaQDMiI+Rq1NPLVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ABctzMAx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=caEr4buj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ABctzMAx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="caEr4buj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGSjgW3274903
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 19:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YOyJOosEBwgJ1sdXMHFjitmuGafFVQKwvTSIcsXnUSI=; b=ABctzMAxPA1SqT3n
	SfmWff2HV8CivQOSZ7Mxs5rBFgeDscOJqQNEMNlVxZaBCigVP5jcn5/ZJdNKOhk3
	XTnilRNire8RPCgcGs6RklTW47u1GT0ZZQAbEd3CirpIhJuMZaFHCbDm1pzK0KsL
	LCdmUYZpy44HHzvGbpR+OUNlbegIFt5DYr8vwrSm3XebWT6BBHpSZInPiWSEl2oB
	s26mGOseIlcjn6p8ttBjEdr74NN+3VTxnJfQwxauEOuT8w7WT/GS5oq0cBgAMml6
	JjLQFlnyt1pG3QSBGvm0KU0e8TwzpRD8iwMvNPIOsvHC9tp0fp+LXYjmPxxATjNh
	7AQ3EA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff2f2rwgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 19:30:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so3456861a12.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 12:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784230231; x=1784835031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YOyJOosEBwgJ1sdXMHFjitmuGafFVQKwvTSIcsXnUSI=;
        b=caEr4bujDHZ+r8vdl4Hq39FLrNTyIS8ALSqqJEGo/4DZ5qkHCtH3b+S60e5GsJNPZh
         dBRyn0+eJ9RofuVXrXtydz1ZPqOMA3WojEX3j00Wj8uLnxZwh5KU9pxBY/+tAqgSrc/N
         khEbkQHuhXElHAsx0ndTu15JaMLm4RLNbWt50VDmKxIfEZ9BuNB55Yf4LWIKO4v+IqCD
         wFuFx0M59jdpag40TbnuX3GZtFwwswzCreFMpeTYhC6xQ4yENm5Y+eTsexJORKNVULhs
         WTgOMDXI/XBkcaSWOFFC7fexPjY893cEEhD0Q7J5j6cqxdierONNCZ93aFYsA/BbxxKY
         r/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784230231; x=1784835031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YOyJOosEBwgJ1sdXMHFjitmuGafFVQKwvTSIcsXnUSI=;
        b=Ud+4MxHrQ0F3BgQxNU/ZAyX7QguDLPuwqtgbh+kNBiYxYYZFwhhyCPzN5R1uE+P7FI
         atvmE0XzLIF//2w+kGOMpJYApD6c7t0j3XYkbH+kQs4l315W/LMcnmerf3AsWRoOiHbH
         1mVoH5Tu2cM9rLz7EEi/QLpnG8i4OwnikrRV+3UCISJgrmGpOuZZFFACuNO1+L87jRBi
         9YEbhizrmTv1LUFHJFeZgYCxpFiSNb+oGuvsDT67hTCyIC6QuKUtVgoe2YDxbh3DoXF+
         pZexYjvEJ9j5xqqHpz5PJc745dIAYgIrz4WN3frl6gK22aI4bNgBlVRRFqzXCLNQiXan
         CgPQ==
X-Forwarded-Encrypted: i=1; AHgh+RpVba2UOel9qaYgfbzjVSvDIQjlhgkjiuOtqCbUz0eFzyf4UkRyRE+2k9fmgFprXQaNlpdZbSM74xEv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/wpN+J7h5kND//PwDOMo9FVvVGSiiIj/gz4lF510JM7qlOsP/
	/uVj/vFwDGNOjtlcKTG0rEO88GXTngPO+fYhiLpPtKqb6AIFRWxhh81/jrOhwgmuMmV8tUtgyLR
	G4wvgmEmroaVecjtEcDbHe9iyGwlGU46SwrpMItOE7KcqHEQr0Toi8yMJCbZEiUNf
X-Gm-Gg: AfdE7cmsWrO10HW5lyvoM+OePnxZUnR7yIXZHwd5e1SPuLC+HqvbvDcO3HFBYlJYV5s
	PGom3Q6XHoiTA6ACn/Wp8Dq6XTlPLebDS7Yk3YkkaE7S5UscIulDqh2TJtFVukn8LjonEpDBtM4
	FOgnEu6v9lMRqN6N0Mq1Kiej8OMeA+NV/NdCJ9qXsSCFTdxlzogTxbgaLftK0P+O4I7r23nGJGk
	artOANLl0aiuQOaofkKPn9sNES+U55FTACbczHdPq8mRxWymUgvPlxTRCNc9VBnwC7GwuQebw7Q
	mkTOnFUiYdr5TIxGiTZOD/XpBEOd4COkyhqsXl2lYsunR1ufVSBLdpMxxZfFjLVA82+CelV8yM0
	rhsfkXWUfSc4mCGXeSht5/I0sgw==
X-Received: by 2002:a05:6a20:6a09:b0:3c0:9c19:65a4 with SMTP id adf61e73a8af0-3c36c465036mr9190079637.76.1784230230741;
        Thu, 16 Jul 2026 12:30:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a09:b0:3c0:9c19:65a4 with SMTP id adf61e73a8af0-3c36c465036mr9190040637.76.1784230230267;
        Thu, 16 Jul 2026 12:30:30 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6c2b17sm21468394eec.25.2026.07.16.12.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 12:30:29 -0700 (PDT)
From: mohit.dsor@oss.qualcomm.com
Date: Fri, 17 Jul 2026 01:00:13 +0530
Subject: [PATCH v2 1/2] arm64: dts: qcom: shikra-iqs-evk: Add LT9611UXD
 HDMI bridge support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-shikra-work-v2-1-86ae8552259e@oss.qualcomm.com>
References: <20260717-shikra-work-v2-0-86ae8552259e@oss.qualcomm.com>
In-Reply-To: <20260717-shikra-work-v2-0-86ae8552259e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Mohit Dsor <mdsor@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: -Zr2jT8bJ8w71xUOsvEV7rO0ZjQdnXps
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE5OSBTYWx0ZWRfX0l0XXz2Fv7DH
 EqByFlZslt9L3MorT5DiZDPdftyxXG29zp6a4QFvJR9YYBU5IDPVMxqSq63O3LVaUVIKRqlXcvH
 MAa/GIplQpx3J5tb0kfFztsYn3GOwNg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE5OSBTYWx0ZWRfXyueRRGHf/ihI
 ha7TB5mdudLtqEjVtd5iUw12eq7NVx9JfLVPsW0ejdDcLiprrJibSn0NjeFsqYZ5hz79bdAqp8O
 KehypDBBD0u/dswLNzp0AaXUYqgI7tmTjaGt6aAtcqiuSf6Z3+rkq002qu/faeyQ6pvOGM+ZoJp
 1/LLcxm2kkLpu08OAn0Q76mM81YcAjgAzOyKPttOevHqGlZ73unAVbJlFbqvz9We8hMqQMKgc0e
 eqtYnS+Goku8eomzLAGCDRh5Ymn7syKz+JibVJFfVCTEZQ2z0NFPync3f6nh8E8TZqp1z5fl5Lg
 ZWV3/6Fjzh/ROZCmZbmlRo9m17pRT/ct9i4JV+MwkvY9BTAd+WN5mKcCfRDosbrFroWGAe51Wmy
 juT+hS/CiBOHx59/ETu+uHvRDBwMToNlD9cw+PrtaQNVLkV0rtU8zdtdGyhCowGYnCnh+1g8h27
 QaBnO7qpTeahCwbd7uw==
X-Authority-Analysis: v=2.4 cv=NcTWEWD4 c=1 sm=1 tr=0 ts=6a593157 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Dh2IlRrSrxxA8ivr3KQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: -Zr2jT8bJ8w71xUOsvEV7rO0ZjQdnXps
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160199

From: Mohit Dsor <mdsor@oss.qualcomm.com>

Enable the Shikra MDSS display subsystem on the Qualcomm Shikra IQS
EVK board and add the Lontium LT9611UXD DSI-to-HDMI bridge node.

The LT9611UXD is connected via I2C (bus 4, address 0x41), powered by
a GPIO-controlled 3.3V regulator (PM8150 GPIO4) and an always-on 1.8V
rail. Reset is on GPIO76 and interrupt on GPIO85.

The bridge receives DSI output from MDSS and drives an HDMI-A
connector, with the link wired as: DPU -> DSI0 -> LT9611UXD -> HDMI.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 118 ++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 3a6962388dfd..9e602b5d4776 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -7,6 +7,8 @@
 
 #include "shikra-iqs-som.dtsi"
 #include "shikra-evk.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Shikra IQS EVK";
@@ -21,6 +23,107 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&lt9611_out>;
+			};
+		};
+	};
+
+	vreg_lt9611_vcc: regulator-lt9611-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "lt9611_vcc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pm8150_gpios 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&hdmi_reg_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_lt9611_vdd: regulator-lt9611-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "lt9611_vdd";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+};
+
+&i2c4 {
+	status = "okay";
+
+	lt9611uxd: lt9611uxd@41 {
+		compatible = "lontium,lt9611uxd";
+		reg = <0x41>;
+		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 76 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&vreg_lt9611_vcc>;
+		vdd-supply = <&vreg_lt9611_vdd>;
+
+		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9611_a: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9611_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm8150_l11>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&lt9611_a>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
+&pm8150_gpios {
+	hdmi_reg_en: hdmi-reg-en-state {
+		pins = "gpio4";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-disable;
+	};
+};
+
+&pm8150_l11 {
+	/* DSI VDDA - must be at NOM voltage for PHY PLL lock */
+	regulator-min-microvolt = <1232000>;
+	regulator-max-microvolt = <1232000>;
+	regulator-allow-set-load;
 };
 
 &remoteproc_cdsp {
@@ -64,4 +167,19 @@ &tlmm {
 			       <30 2>, /* NFC SPI */
 			       <138 1>, /* NFC Secure IO */
 			       <155 11>; /* eMMC Boot */
+
+	lt9611_irq_pin: lt9611-irq-state {
+		pins = "gpio85";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	lt9611_rst_pin: lt9611-rst-state {
+		pins = "gpio76";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
 };
+

-- 
2.34.1

