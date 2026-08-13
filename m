Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2305438C427
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 17:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786642420; cv=none; b=uPDHyP1Y4+QW6OEsOKRN+h9iYsaccu9n++iMszIYJfPecfsdi8CLPBLAdxUA8+t81hi3vtz+bxS5H4Tyyx32UC6EvMHxSltKZyaunKuxvDK+JR2UAsiJqOBUcQ8Wg6J5EOdzWkDFeMcImtXmlNvmBE5Lj93/aTOWToGnrZF0XBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786642420; c=relaxed/simple;
	bh=Q16+3oz/XJnMkpZazfrAtRiGRJDZnTiYRe4D7n05tKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jzt3Q8xPVxVa5lgKOII1nGUCAL+6/oQX2Cui1IFDmNtf1JyG4Wt6NOOaFVrc8ECrkfBIWIl59OfVxdUZE9HZsQ/YU71RxvVTCXL7LHl0ZVd7Ba5+Y6oxykuSbahCaDfy3dqPKUP0bJa40r0F+5fFWlGjBXj+bisx5LQqssA8myc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WYY5p6gB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FLR0fQKG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WYY5p6gB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FLR0fQKG"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFU6dT3500758
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 17:33:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vBDncFOw6Xg6l95DTIhDhVvnK+l+GxsslsHapGcfq4M=; b=WYY5p6gBawfzF7Zv
	dyR8cLtsL4FB/s9nOc5Eb/gReZh9ZXFKJtwCk9A2McHnxdm07OegxBk10KemcMSI
	8ovkQvrc2fDhAFH75k6WBuLYrshIdbySGIEIuPQlvkTWdrzdt21URXOeFUqAql7E
	gRiz5tewttmLe8l+xRQyGTb/m2fYqE26lccoWSWjJaJF6bx3xyJn4IrXWP0dO811
	3KQuf2pLiSFAu6cBUD1FTaWsdgeu6/RfIaCrs5BQOgEipz1U9YmZ/x/IJsG6DW1K
	TqlX5bUiclzGNizB37oqW640NmYDqaa31uD/Jd7T4c6pia4XRH553aaS52fHgX4g
	ihEVvA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g181830jn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 17:33:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38105cc58e1so18417a91.3
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 10:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786642416; x=1787247216; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vBDncFOw6Xg6l95DTIhDhVvnK+l+GxsslsHapGcfq4M=;
        b=FLR0fQKG5kHRirSMNRUEU1CtT1CDYxSnQFoEtqcHmS3uiblU7mF5kYCo8gyRGYk5/L
         pUp4ecZMz2ekmTNKcCeKR2CjsXsZD617Ffoxg9qFTavFZvD6IwuHMreTttkRXF60bbtE
         /jK2g+4nDnr06q7tH/P0ikilH/69SZBnGWJbtwCNIupL7kTyQdBFmYQemGcutsKTNxPP
         SwwZFtxq8y8lXAe3wCs+tDM3+KV2xRXQDnOO6Wu6r0y4hYHkBsHOfkAXkTOwDxnImnXw
         ZNSSya9b2uZSUhdAJLykaBcDDNi4v3LWL+5rkxHM3olSQWlfAlWqCaZLCJobh+rrL0a2
         j4CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786642416; x=1787247216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vBDncFOw6Xg6l95DTIhDhVvnK+l+GxsslsHapGcfq4M=;
        b=n0iI3gkk2lLXbthtg3/7kq+HZowinvkpK9KHJVzHjNDur0xVEBTqtie9+CzonjUM5P
         oQzWyb+GXuuzakmk4NLdb6GLxM0m8kYK53AIIL5Lxtyftgkc/FiwogV7HD1xoJiJS8h/
         g2avZUjB1Zew3nty/D1/JobSfWEotAlQWKN+j5aJ9mcQ6aKJfAzp6PKbJ/y9WNTYnbSq
         ksJxWRki6HyWfrkBhWnE+LX9wUdKgu4YmtZ4TObPNjRlxJ/vRG79KDGMLnpA/vVfLRqT
         g4L97qVRhiB1XmPjFfQMAsihwGWG9PEo+798NH7x3j1pW0+Gegw0yBSPjzGCncMjffb+
         uIBw==
X-Forwarded-Encrypted: i=1; AHgh+RqHmje4UvzFaH3V+ktzGnzizS/6MXYqQYW96sN0a18PexsOsbDhSrEq9BESZ/UOPEZNsopsy/yMTv5g@vger.kernel.org
X-Gm-Message-State: AOJu0YxPk5LglIjjQhEkckphgkzxYtOeicU6Tpd6Ok240yZuKIBET0H6
	WGJ1lZKNR3A2EjGSJENy28QrO8xRwS8goRQl7GzdfEBDRO/udNX4WkKvSzfw3cdI2lcWhVUjSOE
	jfkLh6xjHslfYVUcnCsB7zoZl+Cu4WZU/B40+y5xbmfdkm6W9+QqzWoZJScOmB+yw
X-Gm-Gg: AR+sD11oW37KbWURxLOxcb1tQL8aUIAy6P5D9RKHPHdcAWHyQ26CPITi+0M4v7FCsop
	ZfXMfNpKFnzaiaevK5qWL4sikgShbIQOij0qcoyxCbVAkEtYbWoPl+toHTu2Gf8SOgVCUjMt/9N
	4BFOvxJlKdsxIo6p2S8EY/Sq3u74QNv09jMM8OmlRmDAuX6/2dRnBS5s7O0mk6Wo/9VoThsBO94
	rK5Ls/0l1MFFPWwfxOIYVoInkGtANFEsdfShthTbaXBaWthYC+WjQKtuA7uih0d3IZr2LpbI2OR
	f5No0v7SI75iRx0tpjhhs42UHoG96rekzIOKSG41JHsH+/nCTEBq7SwhD1///MMdBKa4gJ7CaGB
	rSgX4EXWH8k6vIvmgeI2nHQmQPOMiNo/Kmk4vJuTMNVov8Yguvaw34O+MtjiCYQ1On10kpMHOet
	6DW6mmoBte/FsgVyrPm6aL
X-Received: by 2002:a17:90b:5107:b0:381:2788:a437 with SMTP id 98e67ed59e1d1-3931e03ddbdmr6438145a91.1.1786642415691;
        Thu, 13 Aug 2026 10:33:35 -0700 (PDT)
X-Received: by 2002:a17:90b:5107:b0:381:2788:a437 with SMTP id 98e67ed59e1d1-3931e03ddbdmr6438088a91.1.1786642415065;
        Thu, 13 Aug 2026 10:33:35 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931cd46309sm4300696a91.5.2026.08.13.10.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 10:33:34 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 23:03:21 +0530
Subject: [PATCH v2 2/3] arm64: dts: qcom: monaco-evk: Add LVDS display
 overlay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-lvds-support-v2-2-6b11035e8ab0@oss.qualcomm.com>
References: <20260813-lvds-support-v2-0-6b11035e8ab0@oss.qualcomm.com>
In-Reply-To: <20260813-lvds-support-v2-0-6b11035e8ab0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786642402; l=4369;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=Q16+3oz/XJnMkpZazfrAtRiGRJDZnTiYRe4D7n05tKM=;
 b=EOpdOh6Rfit5g0OLwueveFJ3zi8zwLGMewEWj6Pk3NHeaiuxl47YKST6Fqu1uIC8js/Q2v/lg
 s/H/Ve1QUzXDKVAfC1S1UGLNwpiPOyLb2mXgT3yfyiGqZono/QZ9cTp
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEyNiBTYWx0ZWRfX3u+8T9SZ1+qU
 igzz3dp4or8kRXDJORgWz8dLQNFJhrxzpmmS05cenjkduh7f3gBhIhFo/lQ7sYsU7xC7RjrdeP/
 Y3rJofdiTNaBYi+lPvssPZkxaFxq8lM=
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a7dfff0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Jm0fHEQTX3kIzYgV1EAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 3BRdTwwGnqvXc_DywJ_NLfzEJ5PzJws6
X-Proofpoint-ORIG-GUID: 3BRdTwwGnqvXc_DywJ_NLfzEJ5PzJws6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEyNiBTYWx0ZWRfX+f8q+YKYdfjc
 4ZaICgh/q7BKqkRz189NOxdytRgkKkRSKgoK+vpLKfzdFkd13+JloUegfEknOgj33Arvssm92fs
 Eyeum0DRm8zkpXMzCTmIHRaXSuMUAnFuzL2ftEqa45zmtNIKZsPRfr6s4zy5lrZeaCms6het523
 4ENdp6C9CtPYldmg9uICGQiyhq4SVuP+v58/HIqlSUobCz5aUcwWEuoI7xLnm2J4CHFu3FYtWCV
 qxsin6fiJ1lZelolGRSX9TPiMv/0IoOPcJbZ/CW5SakvQpj4JvWvFHozeHqa0PCZjg4hPE/s3HA
 9KGxU+1StNEDdqbZmdZvrkSnswsY20KOX9Pb1ryT5UTE4lF2kTjQEtkRF85ZVFOkqdqfoi0fS4c
 sPAyOzM7gZHxWKTIH81p8dm5PAedit/9K68iz8nAPOE0QMdbbbqDu3XmVkEe8keCWuOJrUY/2SH
 qiv+BXUzjd5brYY+Fjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130126

The Monaco-EVK mezzanine supports LVDS display output using the
Lontium LT9211C DSI-to-LVDS bridge. The bridge is connected to the
DSI0 output and drives a dual-channel 1920x1080 LVDS panel in
VESA-24 mapping.

Add a DTBO overlay, monaco-evk-lvds-boe,dv215fhm-r01.dtso, that wires
up the LT9211C bridge on I2C8 (address 0x2d) with reset on GPIO66,
a panel-lvds node for the boe,dv215fhm-r01 panel (matched against the
panel-simple-lvds-dual-ports binding, which supplies the panel's size
and timing internally), and an LCD display bias regulator supplied
through the GPIO expander. DSI power is provided by vreg_l5a.

The overlay is built as a composite DTB combining the base
monaco-evk.dtb, the IFP mezzanine overlay, and this LVDS overlay.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   4 +
 .../dts/qcom/monaco-evk-lvds-boe,dv215fhm-r01.dtso | 117 +++++++++++++++++++++
 2 files changed, 121 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 2c4e7a891717..85ee28d8f109 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -73,6 +73,10 @@ monaco-evk-el2-dtbs := monaco-evk.dtb monaco-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-el2.dtb
 monaco-evk-ifp-mezzanine-dtbs	:= monaco-evk.dtb monaco-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
+
+monaco-evk-lvds-boe,dv215fhm-r01-dtbs := monaco-evk.dtb monaco-evk-ifp-mezzanine.dtbo monaco-evk-lvds-boe,dv215fhm-r01.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-lvds-boe,dv215fhm-r01.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-lvds-boe,dv215fhm-r01.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-lvds-boe,dv215fhm-r01.dtso
new file mode 100644
index 000000000000..96a53a294863
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-lvds-boe,dv215fhm-r01.dtso
@@ -0,0 +1,117 @@
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
+	model = "Qualcomm Technologies, Inc. Monaco EVK LVDS";
+
+	panel_lvds: panel-lvds {
+		compatible = "boe,dv215fhm-r01";
+		power-supply = <&lcd_disp_bias>;
+
+		status = "okay";
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
+
+	lcd_disp_bias: regulator-lcd-disp-bias {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd_disp_bias";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		gpio = <&expander3 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&i2c8 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&qup_i2c8_data_clk>;
+
+	status = "okay";
+
+	lt9211c_codec: lvds-bridge@2d {
+		compatible = "lontium,lt9211c";
+		reg = <0x2d>;
+		reset-gpios = <&tlmm 66 GPIO_ACTIVE_HIGH>;
+		vccio-supply = <&vreg_l5a>;
+
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
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&lt9211c_in>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+

-- 
2.34.1

