Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B446A481A83
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 09:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450886; cv=none; b=rlg9OnqBW7BKo2yJGnTrzwI67ZhP+amq5wepG7qJ0H52rub0pPTdbdx5fMaUlOP9oE6uMq84+wsbkKYRGUhzB7lW8VoGhB+6/is/lvsjO8SYt052Z9fC4g3cl1VK+Db3A6q1uW2jS3ulxDUk36wBxvKpbtdg6ByiCujlVGgxfFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450886; c=relaxed/simple;
	bh=VJkOMgSvENtsVUuoX10x2tl2qZs36xWv5Kq9wNEnqig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SKbbygl26nshSmHqF6tDal7K91gLtqWNLD9wMIbXkvQOdw3dprD+BiajS4g5HEcNdoF8uBFP5cvQBR3JekdfOuu1MC1aGhc/ySloUVGkZGNTJ1bhT1BlkTpA80uEtJmtZ+03c6A1Rv4gg8Sv7CcroQA5DY7ti9CKWR0FTDplxmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dAW6tgRf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gw24P/7w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dAW6tgRf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gw24P/7w"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KAX91574584
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 09:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hrOrjwOiQxRx2keZSTxuc1gBVtJzKWyzLp+jbXaNpOk=; b=dAW6tgRfLgMbi2Fc
	dVZaVXDz4TvYGXZ/qrMRoiuTrVRd3eSgG3XmaCo+ycgcMxf8siPXYMxRuOjGmz6Y
	NgFPmOlNZKx6lJmqdEIqpD+Pj6O6Mxna38q2LZQ8Wy3s03JwHoKBFuijP4eCKhtV
	fE5JqB1nGe4duCJwE+UqBSoVAj5NNZ+Rm4towOSRZkNjHcx4FAbvd0gxEgDsK+o9
	3r9u4XM3bVNNserCj6ZGx4cY3RzUoIGkRuplStfNrWxBjBKPnGakDXAOzAp8k/DN
	Io2ujZGZJCxRh3dLtdBumnzrYW/cwZaSvmbxI309RWcvLkVqUHAEymKuSKDFSoJv
	T9osXw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe524vj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 09:14:41 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34d49d8dee1so5344848eec.0
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 02:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791450881; x=1792055681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hrOrjwOiQxRx2keZSTxuc1gBVtJzKWyzLp+jbXaNpOk=;
        b=Gw24P/7wWZOYFRDJrqAt/u+2QUbiQS4/BzfIoDnoOQIdRTHwRX293b67WiiqUmrhYu
         C8obHG1UI5ShsAxofIr12sdRMt1w5YHwnCAK/9GUeFDSeiPJifGlNAAvizxM7siAYcLK
         5/j6EjoSvpGBcGzvR39JNYrFjCWao2mvYci9oSCveNyAOhAH8R7P0+D06DkzEoKrRIkR
         HLBRtMWAAFL1gm1ZMwCnde/lCVpB2HLs8/dfchDrjr45xeGeHBTFlYFALtkajSoc01mc
         2mX7IbLjATJ3dmqityPuKrTFQoy8OmOwlWINN+uu223x73FhXn7GoRHnW//EH6uJCQ+A
         z2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450881; x=1792055681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hrOrjwOiQxRx2keZSTxuc1gBVtJzKWyzLp+jbXaNpOk=;
        b=vTJQnp1mRcwjDXhqR2Xr2D8THBBOA9csZjMmzSdPxQu5X1qPaaFnP3HY3RVXCWuMGS
         t/jIkg4kwj4zNz+Cr1q0wc+MTc5Mejh5xcKyREAugdYwpevCjyHZsQ13g9BOMK85ATxm
         4Z8ZGPeIe3gSPyPaM+iW99ublw25D7pCdHS4b1UKgLBX1ok+L9cFkVUiCLuwvpC5txGa
         K8ELub+DGZhF36popjkv/OX3u5dFqLU8ypL8S58Xjgv+XiGsjzuzdu3GyttpHlrkSIzQ
         a+eeAHB3fCy9iWBkPQFMX9qfpPh9NOWMTg7lGypcZ1CTRYb+JFWpK8HWLrH5I8fOoEQw
         XqoA==
X-Forwarded-Encrypted: i=1; AKwUvBxH10KcFPvGfmNeluNXxGzNAYQ5jqGL3DpezyQgaCrjtk8Qzh0OhdEhLf3BnG0m12pNOgIRbjSA5jhv@vger.kernel.org
X-Gm-Message-State: AFuF++mfuoQ2TTuh10LnhjwJfNMrbzSgKdKiCrbIgB7qEiLNA2f7ynDh
	FxknMXHg9n7fH8il0dk1Zq6rHOSIb2ExzpkAYawVSMYOMS4eDwGbxqUu6fo2OLkjhJz5iwp+cUp
	5hvgDhpAxtP/tH20R/S9vWCTlgrxGaLPEvyNxQP9MeyVh6hpwki9/BYu8xEiptWzv
X-Gm-Gg: AYBFou3IOEU36FEvK/asXawekr63VKGw4ze8dHOOgDYCx3983wxUuaG/TKCJ0Dy+7qS
	FAAq/T3523cDcTxDaDNbOnN2Hevke+CP49W9RixoNqD52zAJU0VuwCCWv71jsd68CDp3rZhhI3s
	UAagU5dtMiH9VGOax30jZw0P/Q4sVyEpehkuBdAhepuNBslfoxpWhsdtnYkP5lXOu6NN924kEYd
	JKxrnZIaiiKyQwDydUnP+z+mMy73fZ6lhH/WyeAerZUZOAqs4mkdubH9w/KScXMR68y2Qd2/n0h
	o5MWfUW8ix08LV7LIl0M68Dmide/uhryS+quKsOMM3xTbe54FyJibb4y9y2kaEkY7ezyFcw/l87
	MKDsqzKlnqEAlFEszHzmiYifaOv+nKJDskiAAFx8ifaff4nPxtI6E7NnyGRobLBpKVkukDpGK07
	QEn4qX8l+1GrLQN3ouQjrqmCeZCKaS
X-Received: by 2002:a05:701b:2096:20b0:166:9e0d:3b50 with SMTP id a92af1059eb24-1669e0d3b70mr1388370c88.42.1791450880709;
        Thu, 08 Oct 2026 02:14:40 -0700 (PDT)
X-Received: by 2002:a05:701b:2096:20b0:166:9e0d:3b50 with SMTP id a92af1059eb24-1669e0d3b70mr1388349c88.42.1791450880031;
        Thu, 08 Oct 2026 02:14:40 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm24456045c88.2.2026.10.08.02.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:14:39 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:44:22 +0530
Subject: [PATCH v6 02/11] arm64: dts: qcom: ipq5210: Introduce RDP504
 common DT file
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-08-dts-v6-2-f9c4ec8664d8@oss.qualcomm.com>
References: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
In-Reply-To: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: dLbv5Iwe-yVKSUVqUxuKTA8Mp3JddyEy
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac75f01 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=sBhH8NEu279NYU_71NoA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfXwYXyiYiUcPd9
 bnKciYkE6akHN/x6szZrpb8LrqqrWkxzJi47WGJkLmR8vsh+f9rpIVYTpvo1kSa9xA2mmE2Rdp/
 UISdoKcofznkxILtWEb7KHPhCdYvH18=
X-Proofpoint-GUID: dLbv5Iwe-yVKSUVqUxuKTA8Mp3JddyEy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX1oLTlcl1JGl3
 BrzWpjkIa2ayYUE6ypbztCOE/jGnxS4gINQcoCTdY56bsduSZaJAu5Bd2SfrZTd4ktKgY/ZKYjY
 /sty5MbzzoQEjl3rA/4OMNRWrl06a75wvnKRTtFNnlHJxpE3YpE6tjdGgb8VXMRKf9dQ7K1ZVhd
 j8I6E/6yRdEEzkgyAKxnAp+8n5TSJPs/003ZaPpePoUd3E9g9kK1LxcGqLBAPGz9RzS7cWui8yw
 j9XyRy88ufv9450ObhhIREzfVG5lV8gT+waCGDWDxIbpSnwkWHyP60zeq3T9I53iWWpmJxcKZuh
 IDKPH+ocxqMF2ItQrsYYpivi4VblziJh9RYU71PjqjT7u+2Qgn9Q3sAkWycf9m2ewwBBGXS1ihn
 CqPHaAaFkMXt1KmyeKyrREwuYCqcxbRFoDVekuZ1YJqPlSxWlKJPsQNL/WbPXiMyeyp4bOKejrW
 u/rZ0IeJsjzb/cwBePA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080036

RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
share the GPIOs. The board has to be reworked to change from EMMC
to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
and include it in variant specific DTS file.

Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 209 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  66 +------
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              |  14 +-
 3 files changed, 218 insertions(+), 71 deletions(-)

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
index 941f866ecfe9..e5f2f9217f3b 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -5,75 +5,13 @@
 
 /dts-v1/;
 
-#include "ipq5210.dtsi"
+#include "ipq5210-rdp504-common.dtsi"
 
 / {
-	model = "Qualcomm Technologies, Inc. IPQ5210 RDP504";
+	model = "Qualcomm Technologies, Inc. IPQ5210 RDP504 (eMMC)";
 	compatible = "qcom,ipq5210-rdp504", "qcom,ipq5210";
-
-	aliases {
-		serial0 = &uart1;
-	};
-
-	chosen {
-		stdout-path = "serial0";
-	};
 };
 
 &sdhc {
-	max-frequency = <192000000>;
-	bus-width = <4>;
-	mmc-ddr-1_8v;
-	mmc-hs200-1_8v;
-	pinctrl-0 = <&sdhc_default_state>;
-	pinctrl-names = "default";
-
 	status = "okay";
 };
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
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 161b5bb5a7f7..3183182d1cc7 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -823,7 +823,7 @@ ethphy-thermal {
 
 			trips {
 				ethphy-critical {
-					temperature = <125000>;
+					temperature = <120000>;
 					hysteresis = <9000>;
 					type = "critical";
 				};
@@ -835,7 +835,7 @@ pon-uniphy-thermal {
 
 			trips {
 				pon-uniphy-critical {
-					temperature = <125000>;
+					temperature = <120000>;
 					hysteresis = <9000>;
 					type = "critical";
 				};
@@ -847,7 +847,7 @@ nss-top-thermal {
 
 			trips {
 				nss-top-critical {
-					temperature = <125000>;
+					temperature = <120000>;
 					hysteresis = <9000>;
 					type = "critical";
 				};
@@ -859,13 +859,13 @@ cpu0-thermal {
 
 			trips {
 				cpu-critical {
-					temperature = <120000>;
+					temperature = <115000>;
 					hysteresis = <9000>;
 					type = "critical";
 				};
 
 				cpu0_thermal_alert: cpu-passive {
-					temperature = <110000>;
+					temperature = <100000>;
 					hysteresis = <9000>;
 					type = "passive";
 				};
@@ -888,13 +888,13 @@ cpu1-thermal {
 
 			trips {
 				cpu-critical {
-					temperature = <120000>;
+					temperature = <115000>;
 					hysteresis = <9000>;
 					type = "critical";
 				};
 
 				cpu-passive {
-					temperature = <110000>;
+					temperature = <100000>;
 					hysteresis = <9000>;
 					type = "passive";
 				};

-- 
2.34.1

