Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458199;
	b=DwLIPT5QcSuAEpHj2xaL89mzW8IR28CIuB6/za/FGh8j0J/9lor3403XC4IJn3Tx+0ZO
	 QE8dcR9i6GV3XkK2aSsr1eXbuywoVeCFIn+lrt4ef2J6V81VoBE+7fGQwz1mw8PfYUswX
	 GuhP9BAgVxBBNqRy/K010bjFSwixdnSe3p8FNeO9m0Q9EyhlUmyr0Jyr0/O5mU7bXG8ry
	 L/kyTOlonaA5MklG6NYKU8DYiuGgP33xQgTpXpF51gFzXmeATOvW33C8yDLnhFgD7r9Od
	 trV3IwSpQzMnNAD0tbXs41Lznu8DZ4kSbjm8gbebWtRq6beti8ng/LmIN/TOdr56qOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458199;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=H0eWptuviHTuVUkbdwUfGOyXMlnjmZQuyeI/I1/RaXo=;
	b=5W+Pf1hFqkFN1DDbT6X6p+LXmTzCma1xHtYLUahl+huhMALUjbpqhl/GbrSmKIfXWbwF
	 HQINi1t5IEkaAaV276iJ3jfY+y/BKAEjR/hOYDW6x27l0yklyDM847NwXRJgD7/buRwXl
	 Oh8GS2KqIAM2rAS3v5aJVNLV1LbDTS9YtEQ3Z5hKCE+5frIFLMYD7ecsIClLX5n9lMVy+
	 702rEZT9VtnV42wZdAELgvMcj4/hdA1XldTFpAb81k4Pi9j+Y30s2vnNgGrPsYanWSgAT
	 E7whDsOUY1JwyXajmQT1baPPEmTsMHoDMVV5mP53f6z6tHw0ABJOhD3XI6xh+FNgUFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e1p18bIZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kom2oB1S;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC25606B689
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EC25606B689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e1p18bIZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kom2oB1S
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZvCV3813953
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:36:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H0eWptuviHTuVUkbdwUfGOyXMlnjmZQuyeI/I1/RaXo=; b=e1p18bIZXnvfBQgK
	KvqaXZNmW3YA/3qFkBJ8cC6ZaJ+OROf165TNNZ2riXUu4Q7EjyeTJNSgWXG5a15U
	NWgVK8pkLZWFKCA4rHj3cE6kHmdoicdv+Sg9e3xV2GSp5rPGbLzHhzPemm5ve3Ew
	f4merjafJ4XjVq+3u2O1iiBfpYfQDFvoaaguRTJnQpSX0QhA/BFy6AsAkEXksJQ4
	/IZrRoO8vlwUpuNTpeRzgr7LIUbR/7eGFmvK43EzqAebTQmlC3uwkC9vYc3aePb2
	Is9lS+YbUOKMmA11ECjTXqZ+F0g43F8TyyOE7FK2MgvqDOFXlk0SSbrb0tk8kyYI
	AWOUaw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvvw0j4dv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:36:37 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-370230d93efso1280309eec.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 20:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458196; x=1795062996; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H0eWptuviHTuVUkbdwUfGOyXMlnjmZQuyeI/I1/RaXo=;
        b=Kom2oB1S5IhX+7ZhED93QW70qu6thuWu/Dakum6gnIIBmKctKrVmX2qylU9mHZD3ZY
         wOlGVmnip6IGfRoF2/0SgFvYBqSOTYtifCKcUt6DXBNTbJPS+O4enqR7+apcd9B4JeeO
         E3NUhZz39Df407aR4H4wD9cHjoHVxwC+8TegAEQAvM57VfQ8KClHvIvg38GdYcWRDKSj
         5G3nrGsTx2Wb97MZ7/ZSV2ZzfCELpULVwKkjEt6ixVy/7LNvxAq1d+Cf96m2kSbM2urY
         Ph2SFm7bgLI1P3QPVLvlyH2FRtA+uWnO1SouW3uJGB7mw2bmnBbTfDhwfSFSFnwpEG2O
         +FFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458196; x=1795062996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H0eWptuviHTuVUkbdwUfGOyXMlnjmZQuyeI/I1/RaXo=;
        b=JFhY5nC+cobmjMmHMZxehVpOQN5iNYw4ZVechB38/JEgD6T6Q0onDPONer94D9wAL5
         2J5zOq2XvrHrHBMgI03vXHMvSs4y8LDKgHmrvGpb/wnnnX84kw7AKqM96p+2e/FhzI6+
         opAXSPnNmsBA8Kfko8iY2kxDvGcbmU0x403uFaT207cSeMX4q/K9n03FmZcbT0DRe05+
         M3tyCPgETVKQq6Ag7kBWR3vDMkv02NFYN7mJKv5V/uBkCfaGkmW0eS8CWZ64IcElfgln
         xCYc5o0Kl3dfiPtf6UzWIYivEe2QXScmrtaEjv89EE5edVhvgggSF/fAo5oRjBLvKYVg
         DAXA==
X-Forwarded-Encrypted: i=1; AL+hErGsVJJW0eLtXCOdO+UAACxWS15CypoTodFxKCrMHFX/oed6Hp6nJwXuKgpTp44ellPx+NtusI5tlETq@vger.kernel.org
X-Gm-Message-State: APuU4Z9IwJ5fDhXZlwO/G+35AdpQDegxQZgLHJAW0lhYs3cq2x3CtTQv
	7Z7tpojitPEK7+L84b3RDptdB2uhzWYhpWqmo0SpERzSEMHEU9VYV357K2f0FQbHcg9/83bRg24
	owhTC+xMT8Z0embjNgwZz6SQA8JeAI312jLYyFDeEPEEUgPp3qMhPlD4mIDpSeLT3
X-Gm-Gg: AYBFou0rXv23HazBr9SQUwqdpBXw4fN7m74eqbZBlGeRYGjrvcSV3C0HOjxImyrSuap
	UjpWdsqDY/nE7phibPUPulyhlHAFsfrrCUXT2pB/qRdqjH0PCRwsr6D5w7UBa5z7mRPKvSHnXm4
	P4jknwYVuE4DN3yZ3I2MZhpQlpuRl4wY79T8Br13YzC5CzO5opsbFcwkSSOeaOexT/N0dEo+m5P
	1jul/8epyDBiNHQELLpAQulm5lrOOKO4ToHSf/D2X4LZWIA1SMS/g0QtfAI5j7FhlBDsK84EkBq
	80HyRs/1nCZ1yVRB+HuNtacJBBl7l2ZpVS7jsnpkvZEMPJJRJgJ4Ixdf4oVgg6AjRpOiSQ6gXTw
	RaFaIZ7YzzMFhjI80KQKgCkE/pMcwwpM+LB3+53myHcv7KuvB41pIK+lZRFUymgwaycP4X+iv4E
	zTSlNNAZhLTWk50LMoVL3Wyh5/xPRtv/MucPDynU91+gAHXro7RV8PhRfuk2XZjRA9Y0lwMWXSf
	5PhMSU=
X-Received: by 2002:a05:7301:678c:b0:36d:394d:e696 with SMTP id 5a478bee46e88-37685e6c8b8mr6973034eec.29.1794458196142;
        Wed, 11 Nov 2026 20:36:36 -0800 (PST)
X-Received: by 2002:a05:7301:678c:b0:36d:394d:e696 with SMTP id 5a478bee46e88-37685e6c8b8mr6972983eec.29.1794458195368;
        Wed, 11 Nov 2026 20:36:35 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm21856793eec.5.2026.11.11.20.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:36:34 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:06:21 +0530
Subject: [PATCH v9 02/11] arm64: dts: qcom: ipq5210: Introduce RDP504
 common DT file
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-08-dts-v9-2-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
In-Reply-To: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: E9zUAGHNoiOfSKOY6EZYHpGw5ltGxAHz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX2wWVQtTBPPYp
 Dmw+IHV2GTodRoLlpPTLVP6yfYnEkXYbuszt7BL9yssrrSMsYuNpyVzeoySKngMv48QQhv3asE/
 fiiVMHlRnTRHjZofWhmz/obgrgp+4K3mUIs11A6iYPJ0tP2/kXAUtWwJwH8H5Ml5g8vhiX0haoj
 QzepfSSkc6zQpSCAEkwcjFkOhJYLlSejpXIsacbZsd/1w79QKRaDBQqfJBLamrUrOTjbCQ5bI1D
 ibvigEPuLU2lmpAywtAo+A3ZMg4QgpaGduZYAOMxyRPfpWS/Rpvd/JecXG4tVjZRN407KidJIxi
 iGHV/XJg4r+lSkC85+ol7BkmmoaNCEn2GVSamJFPv88zE17DPE3sReG0XXRIUeRiKXzn0JmeFxs
 /Dw98wu4SSiubGYdTRHcqyZvhiQMQo7q7R95MXRdMnpC1tq+AmQAFb/XwOP/HCbKcuchpszAV5f
 p3/noMrfqBFWwnXclqA==
X-Proofpoint-ORIG-GUID: E9zUAGHNoiOfSKOY6EZYHpGw5ltGxAHz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX1KrUvkkhHJut
 zyLv9rVE84SzLk9KiWLjkHGcNN5rJMqul4+ag+CdSmUC847EltYxfWiy+wYnkmyEij/VG/0V1pe
 bkhS845+3HELKm8iN2yGr6qe7J6g0lQ=
X-Authority-Analysis: v=2.4 cv=ct8OAF4i c=1 sm=1 tr=0 ts=6af54255 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=sBhH8NEu279NYU_71NoA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120018

RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
share the GPIOs. The board has to be reworked to change from EMMC
to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
and include it in variant specific DTS file.

Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 225 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  79 +-------
 2 files changed, 227 insertions(+), 77 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
new file mode 100644
index 000000000000..6fb8666ffbfd
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -0,0 +1,225 @@
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
+/*
+ * The bootstrap pins for the board select the XO clock frequency that
+ * supports 48 MHz, 96 MHz or 192 MHz. This setting automatically
+ * enables the right dividers, to ensure the reference clock output
+ * from WiFi to the CMN PLL is 48 MHz.
+ */
+&ref_48mhz_clk {
+	clock-div = <1>;
+	clock-mult = <1>;
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
+/*
+ * The frequency of xo_board is fixed to 24 MHz, which is routed
+ * from WiFi output clock 48 MHz divided by 2.
+ */
+&xo_board {
+	clock-div = <2>;
+	clock-mult = <1>;
+};
+
+&xo_clk {
+	clock-frequency = <48000000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 519307c6b61e..43cdb981a4ba 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -5,30 +5,11 @@
 
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
-};
-
-/*
- * The bootstrap pins for the board select the XO clock frequency that
- * supports 48 MHz, 96 MHz or 192 MHz. This setting automatically
- * enables the right dividers, to ensure the reference clock output
- * from WiFi to the CMN PLL is 48 MHz.
- */
-&ref_48mhz_clk {
-	clock-div = <1>;
-	clock-mult = <1>;
 };
 
 &sdhc {
@@ -41,59 +22,3 @@ &sdhc {
 
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
-/*
- * The frequency of xo_board is fixed to 24 MHz, which is routed
- * from WiFi output clock 48 MHz divided by 2.
- */
-&xo_board {
-	clock-div = <2>;
-	clock-mult = <1>;
-};
-
-&xo_clk {
-	clock-frequency = <48000000>;
-};

-- 
2.34.1

