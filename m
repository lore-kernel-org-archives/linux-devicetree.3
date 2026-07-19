Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867EF3BCD33
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 18:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784484332; cv=none; b=StHibh5kbSOoHXTcJSsMgBouHizP0ud2/w5HE4n25Ru96upvmnirbsojLNtCn3dxsN5H7uZh8ZHSsKO32PezjUq4Fvc73Kt7THTeAWlKealC1//C9KOKEQuNTgIUNNqEGJDgBHE4cO+k4N8ZCdpCabyjXxpUKoNXz0t9PuYexbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784484332; c=relaxed/simple;
	bh=c4BfvEiogAmpMS2bxwbZRqjBBSdu83TzIkCqis4DYYI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m4LXOqckzwWpsFHWdKg71OODzd0RGEGXLmDqzZ80Hqqmbn4MY3eqn/7NZshNw8MRO0uSLW7yCfM7mjPiw4P3y5E1dUAsAQPIkxOr1IvDWv2+cTsFlHYE0yQJfHxuNlIYnWZKro4dk/bwI+c3+0amAIiS0y/A41llpAiakwtCN54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GD4fAqMH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dBn6LwUt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GD4fAqMH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dBn6LwUt"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JHIRTo033658
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 18:05:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wnDRNKLrDdQxOJM7XVBSaVCjH3jAMofFbsyzLrpTL7s=; b=GD4fAqMHdnojhKuI
	S+oiGpZ2sk6opWhuQ9dmUe1hGy8TS8kcWy5MXmTYgMiu8h9s/WLzcquvpOurQoqA
	0QStR9YNDy+UWDTZDC3xnyGdFID/jq7uQ7Ju19x0G5tP91SQZ2qrFQVZ2kydIzei
	BGhEWhH2PsZMA7kQ9xScRCppeuvlQa9lEBBvyj+fthFIgra8lG3hDOB3vLFpk315
	xNjAKYM0QNs6s91Qn4aAQPBN3f/HnIOBoa3GEQJJoSVDavHWCAMhr749vHkA6voY
	kagEPYB5WTX3icHpGHuQivfwlU5jU9dxxriYvOZA9j3g8ChXl3/sVgtAJEMkp2VG
	mtE2Jw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2dc38re-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 18:05:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-387087245e4so2699829a91.0
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 11:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784484325; x=1785089125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wnDRNKLrDdQxOJM7XVBSaVCjH3jAMofFbsyzLrpTL7s=;
        b=dBn6LwUtu9rph95v/repANV9CgQvEmyT1wiY2leYQjW6ZLSqnC9zP/Wux0wCqfU0lY
         kct3XlgwB05N63IfD8Gaezst9eJ62ZEul7qS3ALfmj8eiQLU0lY876cnfDVp/6YwOrnF
         bIIXvVv91g32EeV/wzD9v7GM4XwUCuqUUm4XHFwEScWkEB04pPiSGtzJ2BS2r3pvO5Pc
         G+xHfaHTQjV1rOAGjvAcb+3hKoyN41wX3SajL9+2RsKEyRUTeB77Xsy66rUlFpjndZgk
         x1pu1BDnWfW3JvScgCLN1Io2dIo4LHTk9As8E5lk9oOn5n2G7JM13ZNiEe4LMjJOrlG6
         vrLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784484325; x=1785089125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wnDRNKLrDdQxOJM7XVBSaVCjH3jAMofFbsyzLrpTL7s=;
        b=Hq2SpkP8HBmrLT7IlH1arOPFH40cdQWycCHjRxd2gi8DS+BtWHCjd3k67qmZ7bqgim
         uFjKYlQXNn7qW5+bORigTgeotTKRlmTfNhtu91R+dcyhI4a0MpzcRZVA6W4OMS7D8ivC
         Eh5TuKefAaHyFUEVp2Oa31om0/4nMRfqyuD6P3EI1GEYklnPJkI4bg2hpxygWZ6h4XBE
         7dBkl8CM+QDn7nZ0kx2/Eq/Rn+VRZEHk2StxnkP10+9SqKvDSgW1Szf1YaSwAcPkeAHT
         XzRzZ+eORFK30t4KL71LNP9Vh8IbPM2DzVWC7GetPfNJ+6/CZtylYPF40z5JzZa71vDA
         MuMA==
X-Forwarded-Encrypted: i=1; AHgh+RpbeZkLl5F5PlrPuLqbxQadEVf14aw6GMaBbznsWiPvA79tFHXeDuDFB8+ebrTHNs6MQpy+PIX8UEsg@vger.kernel.org
X-Gm-Message-State: AOJu0YyqaQ3wGk7KJCeUMdy1+GPBAsKuuyI7Cv4zMrabluzw7PkjAtPV
	gkqzSKl1mclF3p6tITHfXChp3MpRyMzgdXxroPtlW8P/hiTMjf3AGukeKjZm+ECjNhpAJ8ev6pC
	DFY2JGEp/CnW3C7En2AAOBg+8PY1aTkc9I1hNycOf3F+sI/AkugJglP0fFBfIf2hv
X-Gm-Gg: AfdE7clSKdqzbgbGIJLCumYQ9nBSWQKuwR3WKFo4VBX28RHXEYVOgpGN/Ysfgbk7bAT
	MjcbLOgxzjcpUTkDZ0TU/zA5NIG9agvtex2a9nEVTp5EfWc82hJze38Uqp737kfqylMES2dYU5s
	SqKyRPAlkYenfIMaGzYtj9CYYusLZ4+gqXJfF2ttVcd5Is8V2DMOjPxTAhqsqcS6MwIS/5WfYYi
	CTj+YWA8jBcObuagmaONeuStEdGvuCBXkqIVcu7P1PRH2LJ2T85e+qvJMiAFrgq0B1ntnkiWYWg
	e4SgX5P8KjgB+Ppga8ljvXMZDqa9nNFqbu3MlIF1tT0dRUiVBKHwOYjcTA6nqT7111qUJ06xvcN
	Z0+3NOawgLhxod57AbgEK8lV19W7nmVeJrzFH8/P9tTPv/jwUlkCnhLNTvG8GIQFonTyqvK8rze
	1ptDAfRtqo7yl/FvXTDJwY
X-Received: by 2002:a17:90b:1d04:b0:380:7688:fc06 with SMTP id 98e67ed59e1d1-38e4b5e39e3mr8226096a91.8.1784484325493;
        Sun, 19 Jul 2026 11:05:25 -0700 (PDT)
X-Received: by 2002:a17:90b:1d04:b0:380:7688:fc06 with SMTP id 98e67ed59e1d1-38e4b5e39e3mr8226072a91.8.1784484325043;
        Sun, 19 Jul 2026 11:05:25 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20b1f3sm28037681eec.26.2026.07.19.11.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 11:05:24 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Sun, 19 Jul 2026 23:35:08 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: qcs6490-rb3gen2: Add LVDS display
 overlay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-lvds-support-v1-3-1f1aca3213ba@oss.qualcomm.com>
References: <20260719-lvds-support-v1-0-1f1aca3213ba@oss.qualcomm.com>
In-Reply-To: <20260719-lvds-support-v1-0-1f1aca3213ba@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784484309; l=4395;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=c4BfvEiogAmpMS2bxwbZRqjBBSdu83TzIkCqis4DYYI=;
 b=Ksx/Bv8s/ChAMfmx791E0+O7uQBm4X69rGui02fnIUSYSZ1+wiu998Rd5iy6KyawXJVW5bf79
 iFaFJGfhYjHD4qk9U9s5iMrlszj0KuhQBzckio3pEtbiVmNyUCs+7JC
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDIwMSBTYWx0ZWRfX5wxV3qoF0NIC
 iE04hU77sKNY8NqLNg0wog20fUvAOVe+eiXpOitAbvTGVXrvHGfy4GjeJDkUx4W2C1E8vzdzPZY
 LE8FKCHDy0Fjakk9sX1TZSHXU/V9DYU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDIwMSBTYWx0ZWRfX/AdBw/qc4o3O
 Qu4M+/2MC8mxBcCjxDMbepItV1uPo4IwsB9YmuWLdoGS2HdEn9njZIV9fOmzQkurlkjuQ8PO/Lx
 NIOqUt3ngzo14JGADPnsi3U59ZPJOdTko1/jbYGBQ1h0baf17NRC/3D7VVs/DKKVWJvO7PWqQTZ
 lPy2YwbHWooWUDHt0Hjzy28ZwwI5VZKCl6MHtbb4SgDpx/GMluDq6XVoOB9Fi6WFdxnghi0SHZR
 VClG82R2N+sKj1bC43co71liMbDN3JZcdBA1C/fGgzTMIgWHKSWfLm3HG6Ev6TLF6ftBzhszIm1
 NfT5Zq5LEw3CN8YbGXGHTlDVLtIEKYJb1UMMEo4SD2D1egGyeDe20QO5uUxa7lc1au8nBINlh6/
 5qgWELK6KmJz/6cPYaO3c6ETt/SAlOYZzz2+LYqWprHEk11Y91pWNnG6iXYae6Rt9BpM3VOyK2c
 2BXrX1g+eUYBdEUWR1g==
X-Proofpoint-ORIG-GUID: BDX0iBNaRPU_S_ko5B8hYhhe6lxpuh69
X-Proofpoint-GUID: BDX0iBNaRPU_S_ko5B8hYhhe6lxpuh69
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a5d11e6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=PQGFgTbk-GvKaqAXlNQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607190201

The QCS6490 RB3 Gen2 industrial mezzanine supports LVDS display output
using the Lontium LT9211C DSI-to-LVDS bridge as an alternative to the
default HDMI output via the LT9611UXC bridge.

Add a DTBO overlay,
qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso, that
disables HDMI (hdmi-connector and lt9611_codec) and wires up the LT9211C
bridge on I2C1 (address 0x29) with reset on GPIO117. The overlay adds a
dual-channel panel-lvds node for a 1920x1080 panel with VESA-24 mapping and
148.5 MHz pixel clock.

The overlay is built as a composite DTB combining the base
qcs6490-rb3gen2.dtb, the industrial mezzanine overlay, and this LVDS
overlay.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   4 +
 ...industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso | 110 +++++++++++++++++++++
 2 files changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 85ee28d8f109..bd8db14c5acf 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -189,6 +189,10 @@ qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vis
 qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
+
+qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-minipc-g1iot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso
new file mode 100644
index 000000000000..65af68850342
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso
@@ -0,0 +1,110 @@
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
+	model = "Qualcomm Technologies, Inc. rb3gen2 industrial mezzanine lvds";
+
+	hdmi-connector {
+		status = "disabled";
+	};
+
+	panel_lvds: panel-lvds {
+		compatible = "boe,dv215fhm-r01", "panel-lvds";
+		data-mapping = "vesa-24";
+		width-mm = <476>;
+		height-mm = <268>;
+
+		status = "okay";
+
+		panel-timing {
+			clock-frequency = <148500000>;
+			hactive = <1920>;
+			vactive = <1080>;
+			hfront-porch = <88>;
+			hback-porch = <148>;
+			hsync-len = <44>;
+			vfront-porch = <4>;
+			vback-porch = <36>;
+			vsync-len = <5>;
+			de-active = <1>;
+		};
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+				panel_in_lvds_odd: endpoint {
+					remote-endpoint = <&lt9211c_out_odd>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+				panel_in_lvds_even: endpoint {
+					remote-endpoint = <&lt9211c_out_even>;
+				};
+			};
+		};
+	};
+};
+
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	lvds_bridge: lvds-bridge@29 {
+		compatible = "lontium,lt9211c";
+		reg = <0x29>;
+		reset-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+		vccio-supply = <&vreg_l1c_1p8>;
+		status = "okay";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				lt9211c_in: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				lt9211c_out_odd: endpoint {
+					remote-endpoint = <&panel_in_lvds_odd>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
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

