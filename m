Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D5D414DC9
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784797755; cv=none; b=CjogcVm1aVGw6J7exHKX8Bj6MOH3fIKxJvfOop3hiG5h6BhDs9+jP9R5V88HeH/eK8BmsJBtqLJ4fSG911YWzFFkSE4v54G7Q5oIz92/JamY/31JK698whDaqedqCJa1HSE+w95m+8GQ4CjaLKid1fRT3/vh4flqTz1huWvNBXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784797755; c=relaxed/simple;
	bh=WxcC9CHxvlkSyCu+h28PdRU9uk1E1+eYttlALzNDM60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=puAhujzT1etuckxztTvvcjamWhF1IUykNZaTP93xkeDETw7zqJ3xaSvNe7dWFDFNdR+fUXcn4EoL4ormDUL+Jko1C7bnYxndtuTeznwRdqW+4D6qd72EPnavMItmFKZd7SAuR2iY/Mo+HAxy8q3bTrjvj69z9xx/DWU/NgomDOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=guTyNKw4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hjXq6A1V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="guTyNKw4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hjXq6A1V"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qvk73392627
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mznP5zdkKPsFXHUGFhFIMjUlAhsKZEL1/zysJNyg7zs=; b=guTyNKw4Qy4f2KcX
	Ne9rAqUvr9H8Wg0SBbIOpZYI3hGL1RnOHTxYpEqJ6icvOMjKD18wC/m1FDtYBi+6
	TdglOA1OmLNQEbwdJkV6bEUXiWEz2afRRwdpmnLI51YRMPAs3WDX9PTLpZi+fKKE
	yItZI/mqG9Ww8fa5sCwdN62f1pLcug8dOIMy121of5TmhnFSMD9UZe9MyeZYjM0i
	XOrLHcusr9Iw76K6TRQF6HuaOewFMYVva2x7/5JZ63DrN751nYjIK4nl8KZwyi1V
	s53b8PAcTRLIsl7IkhHfaU0jfrnkEICO9Ieqq7UdcAeb/xQjG/edLt+LVivYrHXn
	EH/7Qg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke0krhm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:09:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381250979d5so553055a91.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784797751; x=1785402551; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mznP5zdkKPsFXHUGFhFIMjUlAhsKZEL1/zysJNyg7zs=;
        b=hjXq6A1V0gldnFqiIWC3MRBOFkPMRr+ExBSba4ztnRCWulBBUTvBtoHfqz0r4HPaEZ
         TWWSs+lvxxNdyNMWkPJcEI0ILWm87Dqcym6aJWGRzuU+SDTtxuUgzj0V/zakoOKVsQxh
         OjR8XTinBqfGtf2UDxxl8YF5R7dFsPO7vpPCuIdoBGFgoMWS1Cl7ErjX01nEh9rFYRst
         XU6Pv5tFncPASShrIMrllINzBRyK8Z0i00bMKBjvOde2IOBqf9bYhJ1PcCTuwepB7t73
         inDGEQ8zTeOOXsgk+LZlJWYhcFJGZUouSCaoWUN2SZ9xjOfc3/28w8BXXnCwV4Mx1wI+
         Mt+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784797751; x=1785402551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mznP5zdkKPsFXHUGFhFIMjUlAhsKZEL1/zysJNyg7zs=;
        b=nM4o+uN2ExhnvUGgWGMCF4lFXpU2CeNOKD2vaTlHQT2iWFFhfXn5PiRXPPjho/EJCP
         9B/6lxZreC4uh4pxeFiqeXADSV6yMpyCQLABU1ZEIHSEqIyX9cHOnEVtZfV2VW/ZOgBv
         zMeIKeSVbj2nzgQJ/GAvo5GJWPuyRNLpDnj5aAvR1jiOskbuuDSSlcrwrTuZdyB6S8R3
         DTu2NQfQ1NxeeT9AoFC9aSXMEhlzfq4SE4bn1K5LDRNEf1ciaMbGqqL+W5Ucsj28iVRZ
         BlneHhBQc/PxQNgs09ewsdKNguFs67lRw+R/hhgDYo/l4TQH6sIYS9LnR28vypR8syNS
         5Itg==
X-Forwarded-Encrypted: i=1; AHgh+RqUXK0rJum5Qe30GVXodu7cgsiIturWqa4N7n3lf+EGIQ0xSjZFcytf6ciF2mS4C0iwiIYWesXdEEOt@vger.kernel.org
X-Gm-Message-State: AOJu0YxADEk4zCf/RsGh69y1yUQ6vB1ZMnV84FcE8z6+XWYqRuY4pRPP
	h57/OSjuy85By1Nu45uy3U3ZeHWdFYhM3oS0VfLCOLZsDe4MCQwYB1PcwzPkSTfI13MFCthfRGc
	cM+9J3a78+ATVu8zhqk8aaLCQTg1NRIUG8RXhRPt9DiLxHYD1yoGTlDifI7FItmD/
X-Gm-Gg: AR+sD11pFViqBsumfgbuoeIjUljZrDFCoqS+PbM3YQQAj9UeIpO+4RcIwIMi066e4UL
	ex7u/dCKsfk8JrhBLR9DV93uXkgpTNKcw5L0Z2bzZ7t6yWAW5P79VUWmA7aCcUJ3i26x9tfLjPf
	/eo/JuPJMYmd/T6IQozZFfkWiIMo61gya3XarsAmBF23qtSr6D2lF/gy8UAKnzEXbFHki4wMrrd
	5xcnKgtMayX6StzisCdl4E6eyyhc3tIEfs0z/BhmdSBBeY3l2EaVQ0anoyvrrahNbhXgMBkEKcj
	gUWxA3Ofgsop8toj7XkblZ5yUlib7f0LinGhRsyomtslqrhjUqTQm8e2nHtfc81JzeVDnZ8Sk8z
	tzAxS6RPhbB5xFAwBH6WzYBqCzS4GLNHMyDWf0Gd2fq+PpjOi277ib4n6Q8Infr/+ri0tzi3j+L
	/nHRmdNimNqHTgawzUhu02tr0iuWMADQ==
X-Received: by 2002:a17:90b:2552:b0:38e:712a:be68 with SMTP id 98e67ed59e1d1-38ec688d5f4mr1894165a91.43.1784797751393;
        Thu, 23 Jul 2026 02:09:11 -0700 (PDT)
X-Received: by 2002:a17:90b:2552:b0:38e:712a:be68 with SMTP id 98e67ed59e1d1-38ec688d5f4mr1894136a91.43.1784797750867;
        Thu, 23 Jul 2026 02:09:10 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f42bbsm15191485c88.14.2026.07.23.02.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:09:10 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 14:38:57 +0530
Subject: [PATCH v3 2/3] arm64: dts: qcom: ipq5210: Introduce RDP504 common
 DT file
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-08-dts-v3-2-074eb131f382@oss.qualcomm.com>
References: <20260723-08-dts-v3-0-074eb131f382@oss.qualcomm.com>
In-Reply-To: <20260723-08-dts-v3-0-074eb131f382@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: SNPh43iyYeya8AxC3uU_ymvFjYbB_rfk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5MCBTYWx0ZWRfX6z04Hwp4wCb9
 SgZZ2zuZxrLicChMQyWlryhGHcMoJf7xem5j2h0HBitKUyM62vJYI8L2qo0i7ww8cHLicIcuwe7
 Fekd4O5sggxF7mQp4Hyu3zpoItxKRDs=
X-Authority-Analysis: v=2.4 cv=S7DpBosP c=1 sm=1 tr=0 ts=6a61da38 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=H1h1Rys4rTy22MHYZdwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: SNPh43iyYeya8AxC3uU_ymvFjYbB_rfk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5MCBTYWx0ZWRfX0HrUUbb6RJgV
 wFCWFVNFBTgeQp3SinbZHYZZ0t+D2I/Wg0jrqhqyeCeAbXbQohmCqwKPqv2RL81unpAiVzxVbQr
 RbqkZo+nOb9lRB7AJr4ujnnpL+gnXg+oziTWHG3GpzPWxavvEMOaorojz7WafzrrnMs9Uhdx315
 pR5bxBsakf3xmBKt0O5DbOX9TudqcgOAyEgoNiAjtbF2rBJnNuw0AXU/wbGkcH0wfcv0f0Pv8rH
 cB4iamhpJ2325wrU4VVloFIzJRsJEcwqIGZo1vH8ZBDpld3TvwHr68tNnvmwU5Si9IDGAM3Blg4
 aRXQm/LZ5KjX8Yl4kHXfIe3oCq2GTrUER0SSM397420Tv3ftARV2BaFNDFzpcRmBPqBoJK98NPN
 crsBIj6SKmfTgQKt/4PcBZslaIjji7X2PWcx1Wjqlcyn0ka1cQEXTqO3UweRWxYmPaAeLoQKP+d
 7Ue9LWTl4TNGdO/Ecyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230090

RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
share the GPIOs. The board has to be reworked to change from EMMC
to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
and include it in variant specific DTS file.

Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 209 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  79 --------
 2 files changed, 209 insertions(+), 79 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
new file mode 100644
index 000000000000..30c8560822b5
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "ipq5210.dtsi"
+
+/ {
+	aliases {
+		serial0 = &uart1;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	vreg_misc_3p3: regulator-usb-3p3 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-name = "usb_hs_vdda_3p3";
+	};
+
+	vreg_misc_1p8: regulator-usb-1p8 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-name = "vdda_1p8_usb";
+	};
+
+	vreg_misc_0p925: regulator-usb-0p925 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <925000>;
+		regulator-max-microvolt = <925000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-name = "vdd_core_usb";
+	};
+};
+
+&pcie0 {
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie0_phy {
+	status = "okay";
+};
+
+&pcie0_port0 {
+	reset-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
+};
+
+&pcie1 {
+	pinctrl-0 = <&pcie1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie1_phy {
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
+};
+
+&qpic_bam {
+	status = "okay";
+};
+
+&qpic_nand {
+	pinctrl-0 = <&qpic_snand_default_state>;
+	pinctrl-names = "default";
+
+	flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		nand-ecc-engine = <&qpic_nand>;
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+	};
+};
+
+&qusb_phy_0 {
+	vdd-supply = <&vreg_misc_0p925>;
+	vdda-pll-supply = <&vreg_misc_1p8>;
+	vdda-phy-dpdm-supply = <&vreg_misc_3p3>;
+
+	status = "okay";
+};
+
+&sdhc {
+	max-frequency = <192000000>;
+	bus-width = <4>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	pinctrl-0 = <&sdhc_default_state>;
+	pinctrl-names = "default";
+};
+
+&sleep_clk {
+	clock-frequency = <32000>;
+};
+
+&ssphy_0 {
+	vdda-pll-supply = <&vreg_misc_1p8>;
+	vdda-phy-supply = <&vreg_misc_0p925>;
+
+	status = "okay";
+};
+
+&tlmm {
+	pcie1_default_state: pcie1-default-state {
+		pins = "gpio29";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-down;
+	};
+
+	pcie0_default_state: pcie0-default-state {
+		pins = "gpio32";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-down;
+	};
+
+	qpic_snand_default_state: qpic-snand-default-state {
+		data-pins {
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+			function = "qspi_data";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio4";
+			function = "qspi_cs_n";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		clock-pins {
+			pins = "gpio5";
+			function = "qspi_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+	};
+
+	qup_uart1_default_state: qup-uart1-default-state {
+		pins = "gpio38", "gpio39";
+		function = "qup_se1";
+		drive-strength = <6>;
+		bias-pull-down;
+	};
+
+	sdhc_default_state: sdhc-default-state {
+		data-pins {
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+			function = "sdc_data";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		cmd-pins {
+			pins = "gpio4";
+			function = "sdc_cmd";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		clk-pins {
+			pins = "gpio5";
+			function = "sdc_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+	};
+};
+
+&uart1 {
+	pinctrl-0 = <&qup_uart1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&usb3 {
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&xo_board {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
deleted file mode 100644
index 941f866ecfe9..000000000000
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ /dev/null
@@ -1,79 +0,0 @@
-// SPDX-License-Identifier: BSD-3-Clause
-/*
- * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
- */
-
-/dts-v1/;
-
-#include "ipq5210.dtsi"
-
-/ {
-	model = "Qualcomm Technologies, Inc. IPQ5210 RDP504";
-	compatible = "qcom,ipq5210-rdp504", "qcom,ipq5210";
-
-	aliases {
-		serial0 = &uart1;
-	};
-
-	chosen {
-		stdout-path = "serial0";
-	};
-};
-
-&sdhc {
-	max-frequency = <192000000>;
-	bus-width = <4>;
-	mmc-ddr-1_8v;
-	mmc-hs200-1_8v;
-	pinctrl-0 = <&sdhc_default_state>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&sleep_clk {
-	clock-frequency = <32000>;
-};
-
-&tlmm {
-	qup_uart1_default_state: qup-uart1-default-state {
-		pins = "gpio38", "gpio39";
-		function = "qup_se1";
-		drive-strength = <6>;
-		bias-pull-down;
-	};
-
-	sdhc_default_state: sdhc-default-state {
-		clk-pins {
-			pins = "gpio5";
-			function = "sdc_clk";
-			drive-strength = <8>;
-			bias-disable;
-		};
-
-		cmd-pins {
-			pins = "gpio4";
-			function = "sdc_cmd";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-
-		data-pins {
-			pins = "gpio0", "gpio1", "gpio2", "gpio3";
-			function = "sdc_data";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-	};
-};
-
-&uart1 {
-	pinctrl-0 = <&qup_uart1_default_state>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&xo_board {
-	clock-frequency = <24000000>;
-};

-- 
2.34.1

