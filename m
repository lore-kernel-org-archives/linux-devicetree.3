Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643BD492196
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 12:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791377041; cv=none; b=AkMBEc43PO/wRvHYBADc6Xzl73YZbweMTX3YEX8EWFwyL9hYYz5xim0EM1v6+mfOCa709u+wYWMtecgu+iVwODQ/2/ajSCiRC2clohULNpr/+QAMduXO9teYnr3EQw4jrYXNvQ8RgKg1AkgujtMH8+5vv6an5oG8IXLv/ISgOwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791377041; c=relaxed/simple;
	bh=w8s2+jwZCldmMKf5kr4Gkug5jm4WLxr/4uF9DbQ5NDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VkCGW1OnZV41hBdECRiMa5d4g1I0G8f7ouvJALn1HwiKpSyPJ/Xi5hjJnEQaPmjoniZcwxg01GlXdeKPgE+Q4wNHzG2G4/h9n7s9rcrNTmMrlHYb0LnyqoNVG+xWYSy+IRGGOX715WQDRNqDeiQEAkQhHiAG6MBw7xbSkOpj14E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h0kINeeu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yw+0Ss8H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h0kINeeu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yw+0Ss8H"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BV3gT3687169
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 12:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1FuLwnH71QH2KhF3jgLD+4m0KIwfYrSL4u9dV4MeGCQ=; b=h0kINeeu1qnyTev/
	y4/Xg4uXqitgJyBqDTLdO039nlx0hS2utJPtSRq8RUXHda8j3u3nQmycs7hwcH/K
	6mKlrAfqBZJuWRJqoMxEHgf2j8m4cszm0lcSp53wCV47cpWL2kTyYTpiVAAOnh0R
	R1r0KRQ8U5BZlSbPp2N9JhYWOEuOtcgNq2OzRzcBFeUcvNdwV0qNnhpMjd0p0XgV
	MebGZdS6QnGyepEvQxYZzcQSbJxUaUMDL1gKQpuZIZ9eSvPLQvK4JvSBRiBCzLFo
	80L7F0r0GoI2R8ULD6Cc8qVrWDoMcZXGTA3HL5LRaEI653I6uYaJBXp6vQND1R6t
	jRQNlw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5mgr8e7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 12:43:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d7443e0f0bso65487585ad.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 05:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791377028; x=1791981828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1FuLwnH71QH2KhF3jgLD+4m0KIwfYrSL4u9dV4MeGCQ=;
        b=Yw+0Ss8H5A6rucr2TYtexMv0YalY19rbK/heGIURFwP1EdZHv2AWLAUzbyhY6tW6lW
         KOxKM5ix8dS/SIFsxFiaJZvpVt7AzSlOESKaOEYWb5KeLSQRj1u6COb9irNHVGPQ7Mlk
         7X710Katil1rCleDW/klZUIQTJApNVl/3jnYemJLm68zQD53FBwv1VBtsmJWxerQXdgO
         zfmDnbjn3INvof9zpgZi2YgRLMPEt7MJVh3zHI1rgsfhRjBRbhKHoZzoLwZxNAZqtzEW
         a/QTtI0cSZPYka0bTF3Xi88LwWvMD3guAR4+eVTJLdyGUbhptaIojoARBrq0TuWu9skb
         zXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791377028; x=1791981828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1FuLwnH71QH2KhF3jgLD+4m0KIwfYrSL4u9dV4MeGCQ=;
        b=Hf33OXQcbP5ouSpGvVyzhspAzbcms9DoytYTFurOVkMS/cohP3djqQsOVyjm+2e1BR
         1H6dk9eXcUON5fWHbs0ba0uz/qeDronpYVjmQdnC7ICnDiC9srn68BjZC5Vji6V5+3Do
         R/GH1kMzazJqTacXBv9ncRK2cFN3akjT2O/Vc5E26Op2YIwsDKO59p73EIFsUhcsxw3G
         QH+r5E6xOyY1um7YyWzzTHKs1AJQRweGNSfsLgKe6e59ok0BPOZ8nCek2k2+jST3LAYG
         68K8pXLk5/dtZ1UsQcF1QmF1FOgQcUrANQQkdmZI/Hw6eqczK/KzSRxNwpHGNluVATsR
         9l7g==
X-Forwarded-Encrypted: i=1; AKwUvBzWCDz4Mxwyn+ODbblc30jp2KBjklUVKF1bVScitxlYJmxvxGqzqAetPCgv+MF9i5FhdnKU7/p+KLaz@vger.kernel.org
X-Gm-Message-State: AFq9FYJs8w3wVW+nqcX9ETM/jGdjmfqMMW+ni/P3FUUlwCFmMhAf+vfU
	dh+tyAUk16zX1kjL4UwQNp5gn9IDTpfQkg+55N8hn12cHOmNfkyCGYOp3untHGH4ZzAqKklk3Ai
	C7vCziLZFjVoCHudOVeZpFQzLOwR5G8uz9bcoTQJsx17nFfUeeSUg9GOYF0OCiR2u
X-Gm-Gg: AYBFou2c6Hh5YMKZVbcKhvzjUCmpBZ5gZY1C0T2sjH989OHYpRODt5zPheYeb1kea+5
	BiYFkA57lJjgvBxRmoUIZXC9R631of4JZhnMmhr1KS11GjG85UXV/VUojVU37sW8eDjlUhPe62w
	SCekdAwED/oLUr+WI4XiXrb9Rxvr/n9GknQb671wDAccUoWwxIHhBG3rVcQQ/V0zHIKzCXbGCxI
	9HR4K/+NPBVWY2iDEFajho/jhIYTCSxgEGjzQ49OTPZYcABCiOxH7NQf/mT/CpiX8OLnjOZQn3t
	AxGtNl8jhQohcXFFMl3E0hvHopC8QVYtPUp3b+hw3bjMWHM6JKHdgsYSXi3zJ1qR5ILJQYGJui3
	htB1C1MyTZJHk+H2dRnNzUMby
X-Received: by 2002:a17:902:d4d0:b0:2e6:dbf:c4bf with SMTP id d9443c01a7336-2e60dbfc8d3mr12530975ad.15.1791377028091;
        Wed, 07 Oct 2026 05:43:48 -0700 (PDT)
X-Received: by 2002:a17:902:d4d0:b0:2e6:dbf:c4bf with SMTP id d9443c01a7336-2e60dbfc8d3mr12530705ad.15.1791377027565;
        Wed, 07 Oct 2026 05:43:47 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e604437bb7sm9680245ad.1.2026.10.07.05.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 05:43:46 -0700 (PDT)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 18:13:26 +0530
Subject: [PATCH v4 v4 1/2] arm64: dts: qcom: shikra-iqs-evk: Add LT9611UXD
 HDMI bridge support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-master_lt9611uxd-v4-1-5eac97965ff8@oss.qualcomm.com>
References: <20261007-master_lt9611uxd-v4-0-5eac97965ff8@oss.qualcomm.com>
In-Reply-To: <20261007-master_lt9611uxd-v4-0-5eac97965ff8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791377016; l=3599;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=w8s2+jwZCldmMKf5kr4Gkug5jm4WLxr/4uF9DbQ5NDo=;
 b=UMPPjF4ued/WTu/Fx+O6DyPKzY0uli1fPnKRGuj1z8VWeUnRdeFUktYDFyVxgJBy9Ga5w4Jcz
 Cu7JPYkuWZsC4FmHHBrIoe3+IOCYA3LNPz48lE8TIzGKx3tQ0jn6Zx1
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1MCBTYWx0ZWRfX1XF2x+qPPaz+
 5uL4aBsAy4u2Bu9xwTq1Z1jmdG7mI2+uBQmmHo9AEbPhYmSUKzVZ0hNw2NgGmVegpb4fgKiLs5h
 hGkAvmNwd51eSS44HaNF4tM2c6rSS71b3HtEyg1fs9/a0hEYp1nmgCuP/ZwBD0vQJZX6v8r1M5t
 rE6Fha/Lsq1FvR+5ZM733iYsbXnwkpfrHrmdplhkWzJRGztINzRBfugjYlIktduwn+XwN+VtsoJ
 +01TdVMDp/uMBjH4EYFJAzOEk4DQ9xKa26KnRBkm5crccahp3iRwVFlnXK6x29zd7OEzoh8oky3
 yBU9gnSHuH9SUGXN2sZZ9BKPXR+RDA7FnUlmfg6fEDpjEoDVnwJMNgR/8RWQb/6taoOEcfTTqJi
 5ICnGimJJ8Gy2nTNWaJG9q1jthTY1TWm+HrQf2jEqBVQgZmf4m2KvnnKouSNprlAxuQlLsS/hsw
 3OqbW6eqrXWv5Rf/i9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1MCBTYWx0ZWRfXxTI6Cq9w4V2a
 sBBztWsn/WVCxHY8EGh0Tk5Kr9vRkXVM7sdZyF7InW5bdxzdKigvZwKyclW4jnINgOHUy3ySoP+
 hQpJyZwGgrKMkNTKHHVJ0yUMQ2jASio=
X-Proofpoint-ORIG-GUID: FxFOSTkt9qQGaiWQDGVWiU-lGfgqaNMb
X-Proofpoint-GUID: FxFOSTkt9qQGaiWQDGVWiU-lGfgqaNMb
X-Authority-Analysis: v=2.4 cv=OYkNnRTY c=1 sm=1 tr=0 ts=6ac63e85 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Dh2IlRrSrxxA8ivr3KQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070050

Enable the Shikra MDSS display subsystem on the Qualcomm Shikra IQS
EVK board and add the Lontium LT9611UXD DSI-to-HDMI bridge node.

The LT9611UXD is connected via I2C (bus 4, address 0x41), powered by
a GPIO-controlled 3.3V regulator (PM8150 GPIO4) and an always-on 1.8V
rail. Reset is on GPIO76 and interrupt on GPIO85.

The bridge receives DSI output from MDSS and drives an HDMI-A
connector, with the link wired as: DPU -> DSI0 -> LT9611UXD -> HDMI.

Regulator and pinctrl labels use generic board-level names
(vreg_disp_3p3, bridge_irq_pin, bridge_rst_pin) to decouple them
from the bridge chip.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 109 ++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 5df30ad8211f..fee93410b2e4 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -8,6 +8,7 @@
 #include "shikra-iqs-som.dtsi"
 #include "shikra-evk.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Shikra IQS EVK";
@@ -23,6 +24,98 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	hdmi_connector: hdmi-connector {
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
+	vreg_disp_3p3: regulator-disp-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pm8150_gpios 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&lcd_bias_en>;
+		pinctrl-names = "default";
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
+		vcc-supply = <&vreg_disp_3p3>;
+		vdd-supply = <&pm8150_s4>;
+
+		pinctrl-0 = <&bridge_irq_pin &bridge_rst_pin>;
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
+	lcd_bias_en: lcd-bias-en-state {
+		pins = "gpio4";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-disable;
+	};
+};
+
+&pm8150_l11 {
+	regulator-min-microvolt = <1232000>;
+	regulator-max-microvolt = <1232000>;
+	regulator-allow-set-load;
 };
 
 &remoteproc_cdsp {
@@ -67,6 +160,22 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&tlmm {
+	bridge_irq_pin: bridge-irq-state {
+		pins = "gpio85";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	bridge_rst_pin: bridge-rst-state {
+		pins = "gpio76";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&pm8150_l4>;
 	vdda-pll-supply = <&pm8150_l12>;

-- 
2.34.1

