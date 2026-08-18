Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63614449B12
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787046937; cv=none; b=JudzNyEexf79ASYVPEal++22RqEnbWg6sDwJ0mQnXT0aoOpR1vy9cCCiZ1gzK5egFXCbyakYHrQMqWZr4euZg9Rg5xjNqCzWdA+gMtPwCdIuFk1ahhZXCOrRpiQGHUfllQD3Fp01qdcmhLV6S7T9oNXdXsqln5k5VotmNxES9yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787046937; c=relaxed/simple;
	bh=p4xkPAQVzGAAwBB9k4Sh76Ym+9B+eYxNljRfVryXJCo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q/7aEOXGOaBKHaw1lHwvo401LD/ZVKn2BNZdLIHgrLmA39AYKPDv2qgWeqhbh5EZ6U+pb4OAOVaKwUj2xUYeVKIZsVl+YvC+G+MBJ2fjlbFa7iX9lH7+jFtW78krK0mn0myM9fmdTxUIs6D2mYVjhIOk/P4M6DJPeFE3xub4psk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cJi9pOYL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fJN+YC8O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cJi9pOYL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fJN+YC8O"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BL5T3991126
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nYtWimSE2MlX9hJmExbr9SUIvf2ErU65qMlQ/1wlEjI=; b=cJi9pOYLIKE1ekE1
	IY77/a8XZemvZNlrAiRLN3nCr50Pw29VQ54Il0uEztQqGv4APF79/0t8j+vyO6Y+
	rpIfqVlCC6LJ9AZydil4UKKvBmyVt+d0W+9jsE/y8rX09vwXrx8pSHQ9AuDxSxrz
	DuqdhYd6/bsCO7L6blPfFecTokb8B5SNkDwsaqcViNw0aUt1G8higkuGv4cv/1wx
	x3yKEnT45JxpEotgzYIVaGKp0PwCaEDYk3CeYlBA/7FWiQ46/lcG8Gve+D/FVl/9
	4SYpA6ciyIS5ybiRhNb1CxIPCqCGf2YRYS3YzQMNqCMDNcWhvdVgaFyyRoI+c+St
	c2zmaQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4f5pskw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:55:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84fa3b14ed2so4082681b3a.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 02:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787046935; x=1787651735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nYtWimSE2MlX9hJmExbr9SUIvf2ErU65qMlQ/1wlEjI=;
        b=fJN+YC8ObCfmz2O+M3JSqCL931TVEdI6gekiIa5+MLbuUW80+hOYXjSQ/FTL2bwRzV
         ZEf5MGFNuK5SiL8M+tn3Z41L/bRyAWWXd+RxVvGmkpYLo5+y4t1lcH8F56vutNWqLQjc
         AkCwi20j7+Q7csVNcyWze6yaFD2y4LB+dDlqtspVdhOX3CQfNAjMj1HfLh9xSH0/PUND
         gUctzJNbWNV4Wdye2kthS1dJBmk4bVR6FYwLGNDfAfnTOP66eTIfBxgvb0r0frHLmjwv
         rRtFiAXv0wWIOCVtKIqYo5t8XefdnbLeIZBZj4ypicG/GhvW9xalJv0Xp6LJ0yJvPFqX
         /0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787046935; x=1787651735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nYtWimSE2MlX9hJmExbr9SUIvf2ErU65qMlQ/1wlEjI=;
        b=haupd+YfJKwFbYDFIXaEfZnvsO3e4c/P9ou5EMayveXvlTLqNcAQq30+Q+5kVrtZNM
         yhaTPlo8Su2mZN1HfB892kF70NzpqrGX4qRHID79wEm36xN3ya9N51RaMc/pOkjY2Er+
         /ANEy46UUwOH2MtknRxHCnPfu7gOTBgrm2lLCzlBZQ7sGnT02E4bILJSIlA2zsyHDg18
         DRvuGW89VcwOU6xE4HAgBCWRz1p4ACGmWvkdDxa2GjpueoWL30mWeqOnfQ7CUBcwUoXP
         CA4Wsrq0c7LhuOoLAOQWi5qL5LxAxlWn7dIn6+uqaz1sRphlGC13bD2zd3ZmxUetEa3Q
         QtXQ==
X-Forwarded-Encrypted: i=1; AHgh+RoryvfaiabQ0OeFc+Z9Gb3h/qa3Yxw1mnNkaS6GdVWO0r12Dg5gil+U2IF12WM17jFh0uTqXtc2hoZv@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjpecr3idAKaFe52eow13LGzUQ+Gw2KekjjSidgyY6fMDE5WB9
	zByJH7GSOftLTcqkk9peaX9U6LMHQ5CYJWjPCWcLgD/E2iQozIt/JuVo4xSOMw3bXH4IT36h6Sm
	Ico6/iYwyUkF9t+f67OtWHtXud0usubmSuu0Ti4IwiJXljzKWdmRqHEn1TDjTOoGB
X-Gm-Gg: AR+sD10FM/ClDcHXywA3F3rNRtPauLabf9+WqlWcKnFMngdDtMOLa7Gr5orLot95V4M
	QBlyxjVt1+AsPZkbrC2y5lGWHsRvsyBq/dvcd7NQimIysvc8EHcHXoXqaxONyy8bhdrJf16gaGC
	pEiS4T6UScPUJ+eYLx3pbj6alZILLu/LmIaH9QgUno2bIfBahQVtjDSQxFewO+C6TFwrp5jyKDa
	wyckCuVVrNV6yM4JAxBa7gGRyP1wlk/NCEaJimxeTT6PMZcdk2zZ9k3Tg9S5rD36J5KyfgROhDS
	PjYC2NHDiJkgxrOAusCtfsGXzsa5szp/81srL8M+6MXGL3pzmF2aoeJDyQ4DE2oRxKJN7uPPr+W
	o61GXfJAwJtRCgbpxK9BskfD2DP5sKLu1
X-Received: by 2002:a05:6a00:9085:b0:851:8baf:5b29 with SMTP id d2e1a72fcca58-851b87d919amr9944875b3a.10.1787046934780;
        Tue, 18 Aug 2026 02:55:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:9085:b0:851:8baf:5b29 with SMTP id d2e1a72fcca58-851b87d919amr9944799b3a.10.1787046934204;
        Tue, 18 Aug 2026 02:55:34 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc13c03d7c1sm1828956a12.29.2026.08.18.02.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 02:55:33 -0700 (PDT)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 15:25:25 +0530
Subject: [PATCH v2 1/2] arm64: dts: qcom: hamoa-iot-evk: Add eDP display
 overlay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-edp_overlay_for-next-v2-1-bd811d378fb7@oss.qualcomm.com>
References: <20260818-edp_overlay_for-next-v2-0-bd811d378fb7@oss.qualcomm.com>
In-Reply-To: <20260818-edp_overlay_for-next-v2-0-bd811d378fb7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787046927; l=7784;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=p4xkPAQVzGAAwBB9k4Sh76Ym+9B+eYxNljRfVryXJCo=;
 b=oiA0nSTxs8QxdxxOwb43eQKjc6ONrjHN2pUbNSDRRMtRWpgd9GSxtc40oVaqrhMQS9IGHvdrA
 pFFIza90N5OCT2gi9dHXkN4tHsEXsPlrRUWlpnBCm/yaOFQYyD7hmW0
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Authority-Analysis: v=2.4 cv=S+/pBosP c=1 sm=1 tr=0 ts=6a842c17 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=fX3ZoPcK7U9-Bz4LDg8A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: S0El1ae-u8d1RnWz3mjlLgAnb_os8roi
X-Proofpoint-ORIG-GUID: S0El1ae-u8d1RnWz3mjlLgAnb_os8roi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3MiBTYWx0ZWRfXzwTIp8W3jR60
 1pGiCNDIyL+nlP7kCXY2oY1E4G+lQI07ud6e5DfDrXXpMoUvbmYFD+u/gtXocjeJ1eWQ892+PMo
 0AMlLPyT3caBuRKkYfbOQb+YlgGTarpJ7q8MfpopKwD+ngUa/Wh2jzwmlqoO5VnYk39rdAaaWpj
 1eaQOU1Z2NQZypIccbQ6GfW5htf/5w4/PG/IflM6qhjNiosfaaEmj//vUM+WHHQ0AL7n7C7sqD+
 iG3WOCY1TW8hcG+pTe/3SlwEkERTIlRxO4Jvr7Zp4W4vsU1PkfO4hxclivmR4E0iruEtsm7NWhS
 jk4aPHMqFB/SuqrnnydOMYGaRSHohBopXc+bww3gmlcXbiUDcMZDb7zZJplitxRro0FW+m9Zlrg
 r9kSQ2K8XUP67Ok7lb4TaFRBP3P128Xg4VbSWZSMYM8jSWkIJfZQCDnssiNOsgfSoPdYqyUVi7a
 1y9kdlHdfoEfESto4Sg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3MiBTYWx0ZWRfX8/EG93ZRGMud
 /eOksx850UseknZo+uVqgkNn5VHQKh2lWpkVZB7IgirbyiwFbJEA/BospNmI4/R9/SRobl2+YrF
 qJdRfqn68Z0IeizW6ziJkGxY059KgOA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180072

Hamoa IoT EVK variants are available with and without an eDP panel.
When the panel is not connected, DP3 is unused, but the base
DTS still describes the eDP panel and display path.

This causes the eDP-panel driver to probe an unavailable panel, resulting
in AUX probe timeouts and missing display modes. Userspace then attempts
display commits through the eDP connector, causing repeated DPU vblank,
frame-done, and IRQ timeout errors.

Move the DP3 and eDP panel specific nodes into an overlay so the base
DTB describes the configuration without the panel, while the overlay
enables eDP panel for boards with the panel connected.

DT overlays cannot remove properties from a node defined in the base
DTB, so keeping the /delete-property/ of #sound-dai-cells in base DTS
where it takes effect.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile               |   3 +
 arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso | 124 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts      | 107 --------------------
 3 files changed, 127 insertions(+), 107 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c86e7e98f55..bb0da34983c8 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -20,6 +20,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
 
+hamoa-iot-evk-edp-dtbs	:= hamoa-iot-evk.dtb hamoa-iot-evk-edp.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-edp.dtb
+
 hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso b/arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso
new file mode 100644
index 000000000000..0929fc0358eb
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso
@@ -0,0 +1,124 @@
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
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pmk8550_pwm 0 5000000>;
+		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
+		power-supply = <&vreg_edp_bl>;
+
+		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
+		pinctrl-names = "default";
+	};
+
+	vreg_edp_3p3: regulator-edp-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_EDP_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_edp_bl: regulator-edp-bl {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VBL9";
+		regulator-min-microvolt = <3600000>;
+		regulator-max-microvolt = <3600000>;
+
+		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_bl_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+};
+
+&mdss_dp3 {
+	pinctrl-0 = <&edp0_hpd_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	aux-bus {
+		panel {
+			compatible = "edp-panel";
+
+			backlight = <&backlight>;
+			power-supply = <&vreg_edp_3p3>;
+
+			port {
+				edp_panel_in: endpoint {
+					remote-endpoint = <&mdss_dp3_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dp3_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
+	remote-endpoint = <&edp_panel_in>;
+};
+
+&mdss_dp3_phy {
+	vdda-phy-supply = <&vreg_l3j_0p8>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
+
+	status = "okay";
+};
+
+&pmc8380_3_gpios {
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio4";
+		function = "normal";
+		power-source = <1>;
+		input-disable;
+		output-enable;
+	};
+
+	edp_bl_reg_en: edp-bl-reg-en-state {
+		pins = "gpio10";
+		function = "normal";
+	};
+};
+
+&pmk8550_gpios {
+	edp_bl_pwm: edp-bl-pwm-state {
+		pins = "gpio5";
+		function = "func3";
+	};
+};
+
+&pmk8550_pwm {
+	status = "okay";
+};
+
+&tlmm {
+	edp_reg_en: edp-reg-en-state {
+		pins = "gpio70";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 9fa86bb6438e..51a3f684585e 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -19,16 +19,6 @@ aliases {
 		serial1 = &uart14;
 	};
 
-	backlight: backlight {
-		compatible = "pwm-backlight";
-		pwms = <&pmk8550_pwm 0 5000000>;
-		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
-		power-supply = <&vreg_edp_bl>;
-
-		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
-		pinctrl-names = "default";
-	};
-
 	clocks {
 		mcp2518fd_osc: clock-40000000 {
 			compatible = "fixed-clock";
@@ -213,38 +203,6 @@ pmic_glink_ss2_con_sbu_in: endpoint {
 		};
 	};
 
-	vreg_edp_3p3: regulator-edp-3p3 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_EDP_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&edp_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_edp_bl: regulator-edp-bl {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VBL9";
-		regulator-min-microvolt = <3600000>;
-		regulator-max-microvolt = <3600000>;
-
-		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&edp_bl_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
 	vreg_nvme: regulator-nvme {
 		compatible = "regulator-fixed";
 
@@ -976,40 +934,6 @@ &mdss_dp2_out {
 
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
-
-	pinctrl-0 = <&edp0_hpd_default>;
-	pinctrl-names = "default";
-
-	status = "okay";
-
-	aux-bus {
-		panel {
-			compatible = "edp-panel";
-
-			backlight = <&backlight>;
-			power-supply = <&vreg_edp_3p3>;
-
-			port {
-				edp_panel_in: endpoint {
-					remote-endpoint = <&mdss_dp3_out>;
-				};
-			};
-		};
-	};
-};
-
-&mdss_dp3_out {
-	data-lanes = <0 1 2 3>;
-	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
-
-	remote-endpoint = <&edp_panel_in>;
-};
-
-&mdss_dp3_phy {
-	vdda-phy-supply = <&vreg_l3j_0p8>;
-	vdda-pll-supply = <&vreg_l2j_1p2>;
-
-	status = "okay";
 };
 
 &pcie3_port0 {
@@ -1140,19 +1064,6 @@ led@2 {
 };
 
 &pmc8380_3_gpios {
-	edp_bl_en: edp-bl-en-state {
-		pins = "gpio4";
-		function = "normal";
-		power-source = <1>;
-		input-disable;
-		output-enable;
-	};
-
-	edp_bl_reg_en: edp-bl-reg-en-state {
-		pins = "gpio10";
-		function = "normal";
-	};
-
 	pm_sde7_aux_3p3_en: pcie-aux-3p3-default-state {
 		pins = "gpio8";
 		function = "normal";
@@ -1181,17 +1092,6 @@ usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
 	};
 };
 
-&pmk8550_gpios {
-	edp_bl_pwm: edp-bl-pwm-state {
-		pins = "gpio5";
-		function = "func3";
-	};
-};
-
-&pmk8550_pwm {
-	status = "okay";
-};
-
 &sdhc_2 {
 	cd-gpios = <&tlmm 71 GPIO_ACTIVE_LOW>;
 
@@ -1357,13 +1257,6 @@ ec_int_n_default: ec-int-n-state {
 		bias-disable;
 	};
 
-	edp_reg_en: edp-reg-en-state {
-		pins = "gpio70";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-	};
-
 	eusb3_reset_n: eusb3-reset-n-state {
 		pins = "gpio6";
 		function = "gpio";

-- 
2.54.0

