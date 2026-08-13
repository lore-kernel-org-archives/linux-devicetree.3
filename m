Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6383738BF8D
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 17:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786642416; cv=none; b=U8YvUw28XZf9EC08DvS9XmMR8uHYr2Jlz9nEAUqGLxcnxQcVPiYPMhD6z6zmGjG3UOVqbpy6qDG1Okh6cCow2s8RGL6eaHFS4wIQU0BuNNVaKapjdHuLxirD7mcnuhqlg5S+Uy/uPx9DhXee4a0K9bMhUAZIbxi8RLyQ1ZTmSJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786642416; c=relaxed/simple;
	bh=+b2Qv7TsPr0QPkPzfZcMt6mWQqnjFcj1F1SWfZ0D0DY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rfnlEYssEc2kVk04fLIyx6ytNBJdMKYJUXZzXIv0iSkOpgCiQfPXfglPwG2Z8o1KjxkLXlcJtstLpgDzGSSLibzsFekri4Hb47cHpfC1lmCj5NxIYjVRsV5/CRV+G+j8WCqINJNdut/NH7ZAFdq9xUNQ0Z5U2MEduk5XMYQ/wS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OrNxcRgj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BVzBDN+d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OrNxcRgj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BVzBDN+d"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFTjF23049629
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 17:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BLSEQYkuBtNgAuv8F0WsSM3Pbaw6W7M0c61hCBzAcVg=; b=OrNxcRgjiMwPU8NB
	TKAYpOINp+6XPnJ93EsURm3Zb9k++nsLZ7LGE8tNlbHS1duMB/prj7FulcBXaG4b
	wd+Y8K9h6htqQ9O00FUYlQQqJ+2HiSu5KqyAxe2M2clm6L/lvIyoPELvEshfMiZj
	AWM3IIpxmcbghk0DxuCMTIG/x7y9aB9i51cBShk8SOh+0Y9YdqHUNUa5jEfXzzgw
	yr1fCBM2OstGyHTUZyKcZhAg2yxpJLMdYuoSJHVUk/wvhpSwnd0XvJMozqMZLwZ0
	YFXJbEJyp31+zR5UM5fKHOseQGvVL2RB+whGmuiyfKEVN55HaQqJDIjT2I7BuJbR
	i8lRBw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1fg3s0fh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 17:33:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dc0eee75dso20723a91.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 10:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786642412; x=1787247212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BLSEQYkuBtNgAuv8F0WsSM3Pbaw6W7M0c61hCBzAcVg=;
        b=BVzBDN+d+1/3Ika9TJgfKSL8ISJ9wAevO4njEEWfH5bmPQuPCYL1eZR3h87ml709TM
         /sGEe3cmZ/8ycsOuiyKpuj0tVZ6SV2gD84U5iTBHF6V2MpjaFpNeDGXVHCsFsmKqrG0l
         hoiXSeO3LnaUC/uZwriVBWKnFpx0U0kLwDxWiakzUwtxN/BOPvWXq/b1FVVDHoj7IkVF
         rhZd3KvI1P/LXZRNWEXgZykGFmH5/BCPoUthtYtAmhDOa3lN1vX6pSJWqnKB91Ss5MgE
         T8q7Yck9MPHE6TIp7dl3ufJASaHzuNkt0wVfJBTo+d/yD0E4Wt5PaAJyw8DQssGieP5G
         p7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786642412; x=1787247212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BLSEQYkuBtNgAuv8F0WsSM3Pbaw6W7M0c61hCBzAcVg=;
        b=dSu5ON7jrPK7ClGZIPJe8ceko7Sk4Cg+MSjq78p6Woyu/QJhyjnku2RUJKsgGDRcys
         VPvA+bHlLxKWGwhnjJX2V0AJr6q2OUZbMtsrhoHv4Mn1TgoC80pHmhAt2GAfKw9Oe6/z
         ZGdMc2laWjn/lg7Zl9bH+BRfUk7npJ5bul8ToqpM9XJAAHl+hC6W9jfoZCH8zWdnvpFO
         xM1PhDFKMA4z5QAsp2vdtzsfIvNmcNtzVysp/32UBcVp4BincM+iT6q8EH2Ks3t/qp3P
         Kxy53dziLUrcrCJSZZoPpQSWoj++sKBSkqPnq+kZ+xiqiaQ8DL7wR4DFJY0mb7Xwub29
         vbUA==
X-Forwarded-Encrypted: i=1; AHgh+RrqAESbiMST4Pkl/MqFuDEssQhfIVlMjAOvmRQ4B/nid7gmwIetRG1ZY53YZuDA7YU83d88bqeiGzg3@vger.kernel.org
X-Gm-Message-State: AOJu0YznpH6xEFj2VLxROImDS2wNz+/DaGVUWHJjO+n1xj+fSIXeFP7f
	yoUiuags2WxlidTd9jvoPn0Bduz74tlwVfly9rNRViFFuZILolHvJ4g/5l7Y0m6jVNdUZmE3//J
	E/ukhMGw3vzFE7VzCtSE3zggI+kE9DdpnILhync/8FsjGfIEyuppnsJ9YYXlpIFas
X-Gm-Gg: AR+sD12HCyKpFNbuDnXLb25Y71xeYDc9nX3u+QbmfptiN/FVLfGO3u514wuHPS3Ukqe
	yC8GFC5t7PhzP+WBybf83zFLYmcV1sjLGxSVakXoeX/CrWDsuN4MKRb4v/HsQLYpOkkpE9eToYA
	i4eH9CkkDMy+EgQ/gNhfF3rDUC60paFmRrYLnIOwavyISYnAzQ+kz9tzbPoSSfe4MCC3DCf5Tar
	/pPVi1eeigHFs5IVEYkQAb5lVztg1U76LJ+gs4Z0MCFMJcUXH4FCHM9L3niqhK0Cx/fmApD0ZSm
	rj6JFS1FXXHJMHNAvZI081oc0BrpXPOvJecbKgwHO3W6+WYkO/wVh5sRQHilWHxvAGmTuV1dwoS
	6+FrDWhXm9PtT8k+th1Fc43K5UwuL93Zj4woB7lxsXrHlBKL3Ro7h494dIa0YeQPyXf+YfIvdCo
	t8iZO8D0GZSyX2jxt/2+Tn
X-Received: by 2002:a17:90b:5807:b0:381:bcfb:e710 with SMTP id 98e67ed59e1d1-3931e2aa828mr6262919a91.3.1786642411726;
        Thu, 13 Aug 2026 10:33:31 -0700 (PDT)
X-Received: by 2002:a17:90b:5807:b0:381:bcfb:e710 with SMTP id 98e67ed59e1d1-3931e2aa828mr6262865a91.3.1786642411016;
        Thu, 13 Aug 2026 10:33:31 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931cd46309sm4300696a91.5.2026.08.13.10.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 10:33:30 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 23:03:20 +0530
Subject: [PATCH v2 1/3] arm64: dts: qcom: lemans-evk: Add LVDS display
 overlay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-lvds-support-v2-1-6b11035e8ab0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786642402; l=4358;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=+b2Qv7TsPr0QPkPzfZcMt6mWQqnjFcj1F1SWfZ0D0DY=;
 b=bV6pnfEn2vmNBhIhKpz8I2MGDhr5BBsqqrqwhVo7NrQOEo9rTwhZ+mH88MI7tBqFQE0qefGrY
 Ot73GPM+OcVAlNr/6ex46zBvWZLPx/FYHXiBuDdmDvXWr7eTvg3NM7G
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=NsfhtcdJ c=1 sm=1 tr=0 ts=6a7dffed cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=XDEuxvGYp64Eb9E-atsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEyNiBTYWx0ZWRfXzedKmLLXdAv3
 0YCsX+Noa/Q+6DpltAC9kN1nIIZuLDxb962/eS+ZxFpcbKkswyZsvZ0eGb7SPNo6eU7YXqfohhs
 JCdqUoxXUZNy81XAHiB1IAauFAh2bMfH7cyw1qD/e5HSUlESDbZVZMZE6vgb6EmtzDtBsHzbNTA
 7J1VamHbyLZYy5E7VtJaGsu1g9RXwQRMJQ1wm1hN+t7WOfWjP59+Bkw+DoNZvy58WHjmOBMn/iP
 J43un89n2CqGbX6lpCGtdo3XnFpyo1pvquEUq/mFQb/aMMiaK9n+pbDTx4eMF/ldSuLBR8ce+Bc
 JcvFye84lintAXwLDNnVkJH5GiHFJEJbMn/MCTOboFyoGt224mLaibHsPKD+5D3tb9XESKvcP2i
 iAHl9Bkz7P0ARVvhBS34n5RBsFwqgI0qCNhCvjWMQg3XQc7Bk5ZKGFt3mpB5or+NBSVZVqbqXE/
 gf1qG+XpM8wL7xC3UVA==
X-Proofpoint-ORIG-GUID: 9ymyNyX-yjR8QE-_r7t4kt-u4OwyA7VW
X-Proofpoint-GUID: 9ymyNyX-yjR8QE-_r7t4kt-u4OwyA7VW
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEyNiBTYWx0ZWRfX2O3ua2kA3Rey
 YcPtE7KoL9eJSH5Asjdi6zapo7PD9duwt+vGDi0wRYN47Oen6bh7sZ7K0SEGJIBozl6ifNK4AgX
 ItRNisEdg0tXT1m1FIxagZpOO9WHado=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130126

The Lemans EVK IFP mezzanine supports LVDS display output using the
Lontium LT9211C DSI-to-LVDS bridge. The bridge is connected to the
DSI0 output and drives a dual-channel 1920x1080 LVDS panel in
VESA-24 mapping.

Add a DTBO overlay, lemans-evk-lvds-boe,dv215fhm-r01.dtso, that wires
up the LT9211C bridge on I2C1 (address 0x2d) with reset on GPIO37,
a panel-lvds node for the boe,dv215fhm-r01 panel (matched against the
panel-simple-lvds-dual-ports binding, which supplies the panel's size
and timing internally), and an LCD display bias regulator supplied
through the GPIO expander. DSI power is provided by vreg_s4a.

The overlay is built as a composite DTB combining the base
lemans-evk.dtb, the IFP mezzanine overlay, and this LVDS overlay.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   4 +
 .../dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso | 116 +++++++++++++++++++++
 2 files changed, 120 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5a1c56cf98f6..2c4e7a891717 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -55,6 +55,10 @@ lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
 lemans-evk-ifp-mezzanine-dtbs	:= lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-ifp-mezzanine.dtb
+
+lemans-evk-lvds-boe,dv215fhm-r01-dtbs := lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo lemans-evk-lvds-boe,dv215fhm-r01.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-lvds-boe,dv215fhm-r01.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-nothing-asteroids.dtb
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso
new file mode 100644
index 000000000000..82b6eeddbb8b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso
@@ -0,0 +1,116 @@
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
+	model = "Qualcomm Technologies, Inc. Lemans EVK LVDS";
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
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&qup_i2c1_default>;
+
+	status = "okay";
+
+	lt9211c_codec: lvds-bridge@2d {
+		compatible = "lontium,lt9211c";
+		reg = <0x2d>;
+		reset-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+		vccio-supply = <&vreg_s4a>;
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
+					remote-endpoint = <&mdss0_dsi0_out>;
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
+&mdss0 {
+	status = "okay";
+};
+
+&mdss0_dsi0 {
+	vdda-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
+
+&mdss0_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&lt9211c_in>;
+};
+
+&mdss0_dsi0_phy {
+	vdds-supply = <&vreg_l4a>;
+
+	status = "okay";
+};

-- 
2.34.1

