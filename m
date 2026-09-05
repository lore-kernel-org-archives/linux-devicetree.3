Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEC22EA75E
	for <devicetree@vger.kernel.org>; Sat,  5 Sep 2026 01:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788571852; cv=none; b=T5UUR4z8ymjDmmAF+yvx0hiQSoW8AAKIem+FXsAjSwuddVf9A9nq7CthJrqUzr83saa0osSM69HC/UzBVAyl+ksEyn8qHEYkfqal4wZx/k6oe/enHakYM5pYZob/MIaSJcxZTLbWpBTBMsZpza2O573SXxsgbh3OUvtMWW4sxFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788571852; c=relaxed/simple;
	bh=lp5GSr6dro/MHpnWBR/CKVwMj1uEeL7tJ18Z/HaXDW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qjNPgTIEX7mEFEdm1XcgtMnuQDMo/NyKtkGDfdBM3guQgOHb/9n6TOsCm1cV3GPzzIPnOc9jgXBUqHmZUvCWyv7AX7YooSFnUEcN9CHpTTbBGx6mi8UiesRCVbiDCbmADyA1h7Bi38SoI9Vj+ouTmJ/lxiuHKkpiqITF4WfBO9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H1ZZTPcM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=arBgqUfP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H1ZZTPcM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="arBgqUfP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6850vTPj334337
	for <devicetree@vger.kernel.org>; Sat, 5 Sep 2026 01:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b732Qrl/cyt7vxGomUN8jM9ZetTs7fQWQIIlc8LO3qU=; b=H1ZZTPcM48Vv0rPp
	FcauIBrMBMWfpDprsa/jK7mNpskLk+MBbl4aDHvhxJI6WYVSAIVummKbrddi0Miu
	eIR3cVEeKUw4VRMYqplSaXzBaV57OkwjmL2DWkMtB+NTCPsULHSgBjBdMEUCd2Yd
	f5rOkT9ElJUWzTNNqCyjLaGBNetRhaad1e3GgkXMnfy9HMdeN3gLolfwvgWVfLFe
	NL263kaUxnnBikAq9b5y2hmLTnnOgzWtLIa7t+s/OGeEXkcskwlkI9T39ifLKpPj
	pdxxFCs28a+SpMXoCkb91llLdkw+FGSZk4IREheEWHRc5yYPab170EVehQE9q/gg
	RztwtQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp1fn2fx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 05 Sep 2026 01:30:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ddc70b9d5so306145a91.3
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 18:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788571839; x=1789176639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b732Qrl/cyt7vxGomUN8jM9ZetTs7fQWQIIlc8LO3qU=;
        b=arBgqUfP99ZofWApPEgZJpnB6G3D1uJrUvQca42CduWuTyHdDnAwI+2iXlqg3OpNDw
         xBQi+SPcvw4k6fVKwHvLsnZjz4dF00K7P6LuDY3sqn3Ux39BqcYumJf9+ysIEtxaY+8j
         x9qP7m2/N9Su3M7eBEfCknuT5qh8FO/pUnhRXtWsQ7JUKC0KzUbYm3RdVaICd7OUGqnL
         Ic7WG+WeckL01F32d14KoJfS3UtD2k9eSykVwQ0NmzqHOzR8LVxf9XG4Qg3WLbhXTL1V
         3sKfC0FqWpzB6u9mWfjNBDZuvGdwYkSAD4enKE4bbK5ZwAnQO/i3AVFNVZ96xHjs+zrL
         lZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788571839; x=1789176639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b732Qrl/cyt7vxGomUN8jM9ZetTs7fQWQIIlc8LO3qU=;
        b=aDbR76KRlEaPqijC5Qr3xoJXBPicNVlo9Pcu9/J+NhxlsYsgQkdNG8cYTPQJxVmeWY
         F939I5tPUCL212gdysE298jb7FA751pnZg7yz12Nis+tO85JeAyczhqcsnqfwrQUQB6M
         Wol75lqT2jheyE8eg4I6DOksrd7BSbOb8Y0RN5hwC954JOj5ISOrNEAjDX57SbdsCaG8
         mRgCZxu77lUQ2yF9D6zh+fFuBTpu0HP2C4tmpXHo1KzCs5qDOh927RkRhKMM7JQOMCTd
         86u1VDCKVWdtsvfUwle65Cy/QjqJVX0OIf1B59tmhPPtbHEwdH7tfiCRyb6cYKm9I2Xs
         csXA==
X-Forwarded-Encrypted: i=1; AKwUvBwoTS/Fap811AhzHWO6zkF92RIjASisLUcaNPz19yOqELwTKOqDqS1n+0iaWDvDYUmjdgd4MLAbKhkg@vger.kernel.org
X-Gm-Message-State: AFuF++l2GYdfXy8Ix8FeQ6fELpHWO7AJLvV2I1GLvDmeoO/i3+yi5I6E
	H+k0UBTKWK1wMECwsDdjb3X9U64tsFBIEaWrohKf1SwD9HSFEMiIWKhO7rSNpfvNpZkrgfvPmV2
	JzSdqY2OpM9snw21mbW9Wnx7VIegXejqMt2UaJOOlnfLsTE+SfZqcgyCus4VKw5zD
X-Gm-Gg: AYBFou3zLE8nST+HjV4q/aQYLqdqrrU2P4VGhhI3gdT8wN7VIKVYMcNCfV0bMAUIrhQ
	ERjOpUsbadGib4dvoQ6N8Y0OI8P4+B8jNs8dZS0gg4WYDF+TBwPrRepF5f/5351QVLqWDj659zS
	nQR4yZryBkk1azc/PQCYIgb/UjHZqpahTFu4yzV/XgeRta3xz8PD3lpUwWmUBQI3Ff5zORqtWFU
	NwQytmFciO3NsuUzIPrXMACnuDq2i5JXk5tg2YnoqdvzQziG02L9aQ4IewsZ+bfSsxEoLIQqwiN
	IpKm51LBbJeVAwqD2MoNlxSRW6jNEYzrqRC3hVDSEJE3mqhttDjkiiL4J2Iwmfu49d0TCcuQAfx
	1lIttuK4yCZR0zklFukoj37zKF/1TVPK4oSZqsuebNOLT0NFuyYxa06XkOBVHlSlMPd0woijiqJ
	DVWKEMsvYKMdvYDWUZpUg9
X-Received: by 2002:a17:90b:384d:b0:398:bac0:238e with SMTP id 98e67ed59e1d1-39b3d8377camr2854601a91.6.1788571839116;
        Fri, 04 Sep 2026 18:30:39 -0700 (PDT)
X-Received: by 2002:a17:90b:384d:b0:398:bac0:238e with SMTP id 98e67ed59e1d1-39b3d8377camr2854565a91.6.1788571838653;
        Fri, 04 Sep 2026 18:30:38 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm10170457eec.12.2026.09.04.18.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 18:30:38 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 07:00:17 +0530
Subject: [PATCH v3 3/3] arm64: dts: qcom: qcs6490-rb3gen2: Add LVDS display
 overlay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-lvds-support-v3-3-b40a1b03f63c@oss.qualcomm.com>
References: <20260905-lvds-support-v3-0-b40a1b03f63c@oss.qualcomm.com>
In-Reply-To: <20260905-lvds-support-v3-0-b40a1b03f63c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788571821; l=4364;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=lp5GSr6dro/MHpnWBR/CKVwMj1uEeL7tJ18Z/HaXDW0=;
 b=LQB/IRje+CR1Ov0URj40aSCPy3t7eP3fgqM2OR83fm3VezT9Oq7JuV4Dz13/wtL01PnYiTd0D
 MTPVGJxOCo8B2k7Kvq7gBX9uUP66nLwduk3CI/7s0JX7wvBfLVyzEtE
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=F+xnsKhN c=1 sm=1 tr=0 ts=6a9b70c0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=So681qseQLv-PdXLquQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: m2jJDXy7tl0m6ipZBpWiGQLZ-3q2kJQT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDAxMSBTYWx0ZWRfXy4/8T+i+Afmk
 PCTPWTqg2BnDQeh1KIwQHmzW/Vcw7dU48oYr40ZSN9qxwvRRPujHR/D3omscBkPBUOiIIF8gj7O
 +b4C2UX4efZM0grQoIQNqBshUCqW9DA=
X-Proofpoint-GUID: m2jJDXy7tl0m6ipZBpWiGQLZ-3q2kJQT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDAxMSBTYWx0ZWRfX6+ASbVq4KOa+
 B/bVNR12ocaJ1IarBOSzQUQz5ZO7zwRbI4V9VqoPx6l5JpXOfB5/G/e7hDbL5SGi0NF4ZYFlxG2
 XBWe2hOCGqxKPjLjndYMacusy60Vt4ePEDYl4yVL1GzS/+tPOsDy65PLdTJ5m1HvBmFxJ31hsZq
 wWzPZiNsGYLIJvXjAWyJuYpR++K0o01g1J1mITAY6cSKXPharX3HHmPr8RnVJQs5MC83eoFNnds
 UxjYL/27pQRCl5OflgGwC5g/DxhD3VK9pdu2STS+ddRh22FcgC0o50eoEqAbkdP6jscnkS8kmnY
 XyThQ+vTTQGL9fWIQij1OO+YqOnbsezmLAE7ZDqKtHZX7UiD0NoHW3zCP7Fwxt57ZOdOdMlDHnt
 /RUNTUXYUFulIeDljFytrJd7Y9CmVRTBJDLldLN+gIIWrVacT2tRah6Aq7WX+p0mnQQd5GSvy6h
 BFS9yjDitPr4oVVL+Bg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609050011

The QCS6490 RB3 Gen2 industrial mezzanine supports LVDS display output
using the Lontium LT9211C DSI-to-LVDS bridge as an alternative to the
default HDMI output via the LT9611UXC bridge.

Add a DTBO overlay,
qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso, that
disables HDMI (hdmi-connector and lt9611_codec) and wires up the LT9211C
bridge on I2C1 (address 0x29) with reset on GPIO117. The overlay adds a
dual-channel panel-lvds node for the boe,dv215fhm-r01 panel, matched
against the panel-simple-lvds-dual-ports binding which supplies the
panel's size and timing internally.

The overlay is built as a composite DTB combining the base
qcs6490-rb3gen2.dtb, the industrial mezzanine overlay, and this LVDS
overlay.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   6 ++
 ...industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso | 106 +++++++++++++++++++++
 2 files changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 8cf82e7067e2..d3c09bb4d1a9 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -196,6 +196,12 @@ qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vis
 qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
+
+qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01-dtbs := \
+	qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo \
+	qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-minipc-g1iot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso
new file mode 100644
index 000000000000..5501ea09f43b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	model = "Qualcomm Technologies, Inc. Industrial RB3gen2 LVDS";
+
+	hdmi-connector {
+		status = "disabled";
+	};
+
+	panel_lvds: panel-lvds {
+		compatible = "boe,dv215fhm-r01";
+		power-supply = <&lcd_disp_bias>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+
+				panel_in_lvds_odd: endpoint {
+					remote-endpoint = <&lt9211c_out_odd>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+
+				panel_in_lvds_even: endpoint {
+					remote-endpoint = <&lt9211c_out_even>;
+				};
+			};
+		};
+	};
+
+	lcd_disp_bias: regulator-lcd-disp-bias {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd_disp_bias";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		vin-supply = <&vreg_l18b_1p8>;
+        };
+};
+
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	lvds_bridge: lvds-bridge@29 {
+		compatible = "lontium,lt9211c";
+		reg = <0x29>;
+		reset-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+		vccio-supply = <&vreg_l18b_1p8>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9211c_in: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9211c_out_odd: endpoint {
+					remote-endpoint = <&panel_in_lvds_odd>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				lt9211c_out_even: endpoint {
+					remote-endpoint = <&panel_in_lvds_even>;
+				};
+			};
+		};
+	};
+};
+
+&lt9611_codec {
+	status = "disabled";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&lt9211c_in>;
+};
+

-- 
2.34.1

