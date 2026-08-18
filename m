Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F0D44998E
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787046942; cv=none; b=B3Aj948b+RYp9DOXfR15eFbP0y87cGxIw2n5VF6nP1t3qpLXBFUdxo4ATL3DODsollBIJDRxeSCCEHHXDdhVFDfHjK7SQg5+PrCWWunguP18jJrMTLZP1SSbfjkZh7khY0oaTxwpqtUYT3KlAE2SKT1KE/F4uSwuo17U4L85KeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787046942; c=relaxed/simple;
	bh=jFZeAy6k4Tc/4GWpGftWKEze6TbcLMEhL2vAKl+h6I4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=amNmmStdieFCWL0UEnFEGWgVcijPEIwXL/F2dcGPErbYyNM7AkAAveJRywdiWyq2wP47TowpFUzYzlzZACI2soaWQMGtWxW9iqWkgEsbtJ1GkakXvn24DsZNTey6eGnXmbZVEt1CdXLkPmxYOO0ezgF+jrK4hV1tHaOxW3Fs6s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HLPihdTz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iwjw4YS7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HLPihdTz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iwjw4YS7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BGl0747688
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NaP44mn9LjQtYF6yhgmujwupN5z2cghaNrhmNk13cU0=; b=HLPihdTzVcgwSLO3
	iulKkMR6zesNfpDLHrJsBCEoMH0GjD5c7QZd8sxspkb8+P+x39eoeLojHi2UR22g
	OMPyU3ca9oOnCclQtLM30sHxuv00jZ5+Xd8vl0YMzoy4FahzxHBCEil80qCgz2Qw
	KSmqk/dZmhMT+iHZuYFI6JnP7m7z0raZySfnxpjEKJ4LfETERA5VCYUNsC5Ynw2/
	M1jQlkEWNbskpF1wmyzb9MouotE5g2egXKzG37HMtuvL12jvfMMPRRQgb6whS2wW
	2NXe8FySU4o3YX82jNRvoIHBDJmoixC2HQhfrb0g11ACBNdqBNr3iyyCefqHQ0IT
	YKPuKA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g48q0u34g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:55:39 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84f0d3ab2f4so3381061b3a.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 02:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787046938; x=1787651738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NaP44mn9LjQtYF6yhgmujwupN5z2cghaNrhmNk13cU0=;
        b=Iwjw4YS7YA+bua9tTcMmRTiqSD3RnFjCHBUT2SgQFbe83439E2gl4aVy21L3Z2uxgY
         9+bYXTA3G8T4OJRN75xYSP443Vc/Q5c0JMPP9UlbIBv9RNCxZUyWrJFlS1nZiuWM+ONT
         vyqWA+qsocYg2V4ZVncMaRn60UCPorz7u0kg94xUyTSUMCDQrsYGI4TNgzpv41c7CTZy
         wRcxROtOfiAJu3/AtpBqVQtR+DKyd89o/xS1a5aHcXdk5mLsY9JIZHaWXYc0FeabgsBS
         XQOOge1d5a1nL0s54RcLwQzUVF6VjwJkRfqy9u60EcbrAjp0Z7UjjZO7w5c3vTaHWD7k
         l5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787046938; x=1787651738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NaP44mn9LjQtYF6yhgmujwupN5z2cghaNrhmNk13cU0=;
        b=HYS7aTq+/SHRWC6hPJrmhSuzr7o05Le+D69kSNKRw35+ITufTb+XfxvS6hgJ06hyxZ
         Vz9Itd+hrLpL7Lk74ib6DZAJGKil31lozVc1sYa5b5MzjSqtk+J+uLCoLhX5Y9F/9w5E
         K1unM/fz6cODuwOlhJl5p+GlTONUYuuW/2sGWuOObHNq5/VVniaEd46pvyiwj5GXYvH3
         tNcFaYrBB23tFn7Eu3792Hz0QTjauSNoFRSETOs2WvbZcbK58Gw+YVcfnoaPpqHMbDAk
         EcriMAQLBdm1vDvFJ8wLbaM4IvRnjaAd0hI61sNdtVwMSoe0HVeyanVM1HUcSbO2ZYd3
         IAAQ==
X-Forwarded-Encrypted: i=1; AHgh+RrtJcX7HTk4OTXePa48SwgGBNjvY+8DOJ9kRBKvw/zJVQyCp5C12tFDbCsmBTdL4Y+ePkK6ljG+NM82@vger.kernel.org
X-Gm-Message-State: AOJu0YyGzfw5GLOpPodHaP5d8I805Q+BOqRVbIIkfoA7BoD7XVzq+v1B
	NldfOXTCoLVvacEXs6I8WaURrLPR0i/Y86I287dR9R7fi1OInj3v72muBrI2wyPZke8GeEGzeth
	gn0EbeUwYh6wspow3zMLsuRipjmao8uOQmiFBrxOt3Xcm5lJrbxCDykivr1WBy2+h
X-Gm-Gg: AR+sD10Oj1fYUglvsg+bSOH3mKe0sSjqCc33jO23CGksh1x/D4Z08ajVz8te8/w7guV
	zBQmsNmoWEox+kkELWorny+2MS6MO7Kd4ZvBzzQC/PiBS620Ns3v/FwPL6RZBZenumznhmSi2pS
	wdu5bzwkDCz2G2GfkDDZo8SRh6nKLrbTKLlmn3wXcw2YfoaWzlg2MBEXhFGYjWTwStTDVlnEM59
	FHmDRh00x96ciiAaHHke+ekg6LtUuZIldkcYjpOED1o/zVGpIuWtIl+oZ2bL+0jgPHNg+852ryd
	2ApZikqhZX5Jol2PELYBH369Pk+a5AUaha6wEbTaorVM/vV51IvihlQhes8JfJ/UbmTBn0vRIO1
	xlQWljiK1XoVmV01PuHTHJV2z7ScyQHr7
X-Received: by 2002:a05:6a00:1818:b0:848:46a0:3d74 with SMTP id d2e1a72fcca58-84fde3ccf6amr32576158b3a.9.1787046938357;
        Tue, 18 Aug 2026 02:55:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:1818:b0:848:46a0:3d74 with SMTP id d2e1a72fcca58-84fde3ccf6amr32576085b3a.9.1787046937872;
        Tue, 18 Aug 2026 02:55:37 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc13c03d7c1sm1828956a12.29.2026.08.18.02.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 02:55:37 -0700 (PDT)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 15:25:26 +0530
Subject: [PATCH v2 2/2] arm64: dts: qcom: purwa-iot-evk: Add eDP display
 overlay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-edp_overlay_for-next-v2-2-bd811d378fb7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787046927; l=7770;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=jFZeAy6k4Tc/4GWpGftWKEze6TbcLMEhL2vAKl+h6I4=;
 b=YpkmCabRekg2hsPXWVH9Z9htknarUR45cX2uBhGT4PcobHu3Al8mIHj1NRNtBCnJLe++ek1Kk
 UpFW2ftL48xBUkMZwjQ9lvrTc1ilY95GDlmiX4k/m51vxth6Uy+oYPj
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3MiBTYWx0ZWRfX6J9FBOK/xzye
 tRKBCCDHGYrXtIusfzXV53qrUVRmRnBOzRlZN6VcpBr9Wn9uVbDTGUgx4KGzQNvLmKN/d/ZzVR9
 l6LdxLsIysLnbOD4AHsdYoCh6fxjyUU=
X-Authority-Analysis: v=2.4 cv=VuITxe2n c=1 sm=1 tr=0 ts=6a842c1b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=fX3ZoPcK7U9-Bz4LDg8A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 5dlG7ySW1370-5MWvdrsxp2p-GPA6dMo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3MiBTYWx0ZWRfX2N7VsLxZ3Hyg
 edfIeNoCGpEeAyMcnbRbP3O8PqSmJ7PszNiL4Jx7wUIqOCU7uudbv3lCTlGCPJTqgcuw1MT/24/
 Pu9DakUFanxFax9amDLHXffxkq1B/qddiWltVsD/40StO5MuhmSZZarS0G34RYrHTk1L9aBqQlJ
 4hZP8rVW+m0giml8rswBvNvQETv3UMyz8jHH19+0FikEMk/GvxU8zNe7AvkcKdsOyIhL7iNAWML
 syb7IbYuiDFNRl3fxi+65c2ZGfInqyttOcXZsijZAKlEPpnqIl7dPKPzgLGiuCPbVhLgRWAt71V
 iB1NMBjML4EA9oeCsfFjvrTE1Mv4Gn46+0OGYy0v8+LbgZVdjAeyx+9XfRgcb1LhO/l9BWFhw9y
 VxoXeo/az/2F2Oh41+hGm/4p1q0rsLzAtBZD9dT1HQlYNAZcpQRsdIaYxPavkJAwOd7Q3jjLylG
 Ybf1aL4rG9q5Php3vEg==
X-Proofpoint-ORIG-GUID: 5dlG7ySW1370-5MWvdrsxp2p-GPA6dMo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180072

Purwa IoT EVK variants are available with and without an eDP panel.
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
 arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtso | 124 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts      | 107 --------------------
 3 files changed, 127 insertions(+), 107 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index bb0da34983c8..fc954da58402 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -165,6 +165,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-poplar.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-xiaomi-sagit.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk.dtb
 
+purwa-iot-evk-edp-dtbs	:= purwa-iot-evk.dtb purwa-iot-evk-edp.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk-edp.dtb
+
 purwa-iot-evk-el2-dtbs	:= purwa-iot-evk.dtb x1-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtso b/arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtso
new file mode 100644
index 000000000000..0929fc0358eb
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtso
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
diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index ad503beec1d3..f78420930bc2 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
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
 	wcd938x: audio-codec {
 		compatible = "qcom,wcd9385-codec";
 
@@ -205,38 +195,6 @@ pmic_glink_ss2_con_sbu_in: endpoint {
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
 
@@ -964,40 +922,6 @@ &mdss_dp2_out {
 
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
@@ -1128,19 +1052,6 @@ led@2 {
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
@@ -1169,17 +1080,6 @@ usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
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
 
@@ -1326,13 +1226,6 @@ right_tweeter: speaker@0,1 {
 };
 
 &tlmm {
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

