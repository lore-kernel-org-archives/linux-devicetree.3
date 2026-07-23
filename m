Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CA23ACA7E
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 18:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784830708; cv=none; b=TvuLlt1jh6dHF1UrsaBN/wZRLsX9X2S2O17JUzX0z2+5jvHZaped7ipKr7qUJBTjd6SktePP5QxffxY25VUdG1ITXW3pcNQh0nbB0EAXgs07x9qoqHsmPKLojM2R0j2/EiYseADvPGDQx4aSPzyyV3ahxMLjfnSVZMl0DtAaHis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784830708; c=relaxed/simple;
	bh=AtEUCX9Eo6PEhQ/FG6aS5rbLdI0KIdCuMLA3tvS3sGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qmdQCyB5Gk5QhBlYtSVcn5uxDvSZREfrMITGc2TbJOq0/JJsRFv2+hidat97P77pC4/FnY75MfHmPGavpi+lYc9erhuE0H/Lf67gP/zlEontkkdcq1d8s9hEZMSRC+NqYDYr2sZoQKWWYL7FKIg8VaOu004vtJl5MfxYAFDm9Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=F/odXc1E; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="F/odXc1E"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954df200ddso6010445e9.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 11:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1784830699; x=1785435499; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DR7mORtn/NXxqNSVl67bPX3M3yvTYmJkc+gzBMw4vjU=;
        b=F/odXc1ECqTxlHFFYTrnAB2hrAsal9CqhknEFqpkUAh0BTo/ngnFKtRxFdJspdG6kj
         jR0p1itqV6xuKRU91DkXFOY/2/7/7eIWUeP1BpRbaopbYIs7VIafB0/7SofgsMjFaguY
         gn4YtNQqZDAkBk4EAmHkVrVyrHkg7gUby8Q2BSZT31kVKZJebNN07Qk0MvUff1JBp+N4
         pdRBONMWedzwitdGhS8PlV0p1cmMHE+6aJAWATCYhmXyW4TSbC7dr+tVgwsH8hzla6JC
         56+r/3hEAtztqStsNI+y3b4vsOcnF9IIvQ/O/9sNpP6Qa18zBZ7fuHnHr1j69qewpRXZ
         NGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784830699; x=1785435499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DR7mORtn/NXxqNSVl67bPX3M3yvTYmJkc+gzBMw4vjU=;
        b=JWrTOJNaHqFMAl3KnVMhMzhzylZl1QLzOotWGl11188nFS6/USFqCVp6NqzJyeMmwL
         K7ZAvDgRu3LgTgLbwSJlg6qfXN+bkMrO/kjXxo9E6ZKhsKQ564afY6w52cjQBy1HqJAs
         qHQ92WAAqs8SaHbuvucanR3KWBwRPCKMXtTyg9mDZh5mgMcjKeTm/SGUVVCmDuHg8r3R
         TEsUv2DjCzQ9ANrvGzebJxJvCSAVJh5M+GhF2JYqKxmgNiyU3EYAoK9gDAqBTxFKd6Jd
         wSPDNrNf60zkAYz0GekTr7sCKLd1bNTwCLpyyletE7FlLKCvLsdQCLXCtLtE02Mm1Kyx
         lKzQ==
X-Gm-Message-State: AOJu0YwsUb3V3NhBQVbsVdydg0XFPhJflOTEozsAcbAgw8n99Wa8XJYt
	VKuMh0ZenFPUH95PrRxuTzXTKU1WzKdeWSdhhZZ1XxG0DP3qiRT51o9Trn2Dr0HIUpI=
X-Gm-Gg: AR+sD12wcnvakMEcdPXrPbdmD8EtjksauyVeiUtkPwPJVZdJlVVwucUyowZstPmBXF5
	5gsmWO4R+G1yRriztEHXUkhT8fOJWVxVqdcnUcqqlzbBMytk3ncwTtJsBelj3uVCpzeR2T9cenE
	s3ga0Xzhry2RkKEJzMQZZ1eG9rP2Cnlv1CbWcIkLbaQluzBiEjG6v88B8INUQpFAzNDw4myzhE6
	xOjrJvGfekWHG6ylo0jiqI//G1p93eQ0bcAkM8xVqJRNIO77ABDAL9DxrNRV4y5Gqdd8hqwNl3p
	cyMoqfc/wu1KL5L0QGvX9TnRT8vFVdKWAauVKqpK6emMuF0L9n9O3rfOiTSly31sfRAsCe5HtLl
	UOeCHWp/QLm9CNGaYMrUb+oEp0D0zqtcSgFpLUq1jFVF8ftt4P5H1hlx/EWOjnthfEbqZfHmGmU
	KYouqg13n/Nyn6HyXKE2DaXukfOugtUwPMOEsmJFb87vi1Ae4Nk/KzfKKZeOrFHiFV/qlgbGjBi
	DkleWoc0uHpkrzyvgO99MuIMC3NCGTCXfcFWU7gNqErIgY8NqOZWQ==
X-Received: by 2002:a05:600c:4ed3:b0:495:7040:c7e9 with SMTP id 5b1f17b1804b1-49573cc2f21mr45292675e9.6.1784830699622;
        Thu, 23 Jul 2026 11:18:19 -0700 (PDT)
Received: from [127.0.1.1] (host86-157-235-39.range86-157.btcentralplus.com. [86.157.235.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957af914a9sm10799055e9.15.2026.07.23.11.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 11:18:19 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Thu, 23 Jul 2026 19:18:10 +0100
Subject: [PATCH v5 4/4] arm64: dts: qcom: Add IMDT QCS8550 SBC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-imdt-qcs8550-sbc-rfc-v5-4-2fb988854623@imd-tec.com>
References: <20260723-imdt-qcs8550-sbc-rfc-v5-0-2fb988854623@imd-tec.com>
In-Reply-To: <20260723-imdt-qcs8550-sbc-rfc-v5-0-2fb988854623@imd-tec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

The IMDT QCS8550 SBC is a two-board design from IMD Technologies Ltd
built around the Qualcomm QCS8550 SoC. An IMDT QCS8550 SoM is soldered
onto the IMDT QCS8550 carrier board that supplies VPH_PWR and exposes
the off-module peripherals.

With this DTS, the board can boot to shell with a UFS rootfs with
debugging through uart7. USB is also are fully functional.

Features enabled are:
- On-board regulators
- uSD
- UART
- UFS
- PCIe0 (M.2 Key-E)
- USB
- ADSP, CDSP

Assisted-by: Claude:claude-opus-4.7
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/qcs8550-imdt-sbc.dts | 401 ++++++++++++++++++++++++++
 2 files changed, 402 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index e05414290d8e..d1980d3ba352 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -192,6 +192,7 @@ qcs8300-ride-el2-dtbs := qcs8300-ride.dtb monaco-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-imdt-sbc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-rb5gen2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcs8550-imdt-sbc.dts b/arch/arm64/boot/dts/qcom/qcs8550-imdt-sbc.dts
new file mode 100644
index 000000000000..fa8794868cf8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs8550-imdt-sbc.dts
@@ -0,0 +1,401 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 IMD Technologies Ltd
+ */
+
+/dts-v1/;
+
+#include "qcs8550-imdt-som.dtsi"
+
+/ {
+	model = "IMDT QCS8550 SBC";
+	compatible = "imdt,qcs8550-sbc", "imdt,qcs8550-som",
+		     "qcom,qcs8550", "qcom,sm8550";
+	chassis-type = "embedded";
+
+	aliases {
+		serial0 = &uart7;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	connector {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&m2e_3p3>;
+		vpcie1v8-supply = <&per_pwr>;
+		w-disable1-gpios = <&tlmm 80 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&m2e_wlan_disable>;
+		pinctrl-names = "default";
+
+		/* SDIO datapath is disabled because the SDIO lines are
+		 * routed through unpopulated resistors.
+		 * UART datapath is also disabled as the UART lines are
+		 * routed through an analogue mux which currently cannot
+		 * be described by a device tree.
+		 */
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2e_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie0_port0_ep>;
+				};
+			};
+		};
+	};
+
+	m2e_3p3: regulator-m2e-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "m2e_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		pinctrl-0 = <&m2_pd_en_default>;
+		pinctrl-names = "default";
+
+		gpio = <&tlmm 144 GPIO_ACTIVE_LOW>;
+	};
+
+	/* Enables 5V_PER, 3V3_PER and 1V8_PER rails. 5V_PER and 3V3_PER
+	 * aren't used within the DTS but are used for on board logic
+	 * level conversion and as rails for pull-ups. 1V8_PER is used
+	 * for M2 Key E.
+	 */
+	per_pwr: regulator-per-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "per_pwr";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		pinctrl-0 = <&pwr_per_en_default>;
+		pinctrl-names = "default";
+
+		gpio = <&tlmm 142 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	sdhci_2_vqmmc: regulator-sdhci-2-vqmmc {
+		compatible = "regulator-gpio";
+
+		regulator-name = "sdhci_2_vqmmc";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-type = "voltage";
+
+		pinctrl-0 = <&sd_vset_default>;
+		pinctrl-names = "default";
+
+		gpios = <&tlmm 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		gpios-states = <0>;
+		states = <3300000 0>,
+			 <1800000 1>;
+
+		startup-delay-us = <10000>;
+	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	usb_id: usb-id {
+		compatible = "linux,extcon-usb-gpio";
+		id-gpios = <&tlmm 53 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&usb_id_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sm8550/a740_zap.mbn";
+};
+
+&i2c_hub_2 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	ptn3222: redriver@43 {
+		compatible = "nxp,ptn3222";
+		reg = <0x43>;
+		#phy-cells = <0>;
+
+		vdd1v8-supply = <&vreg_l15b_1p8>;
+		vdd3v3-supply = <&vreg_l5b_3p1>;
+
+		pinctrl-0 = <&eusb2_repeater_reset_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&pm8550vs_d_gpios 4 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&i2c_master_hub_0 {
+	status = "okay";
+};
+
+&ipa {
+	qcom,gsi-loader = "self";
+	memory-region = <&ipa_fw_mem>;
+	firmware-name = "qcom/sm8550/ipa_fws.mbn";
+
+	status = "okay";
+};
+
+&iris {
+	status = "okay";
+};
+
+&pcie0 {
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l1e_0p88>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+};
+
+&pcie0_port0 {
+	/* Required for pwrctrl driver bind */
+	compatible = "pciclass,0604";
+
+	port {
+		pcie0_port0_ep: endpoint {
+			remote-endpoint = <&m2e_pcie_ep>;
+		};
+	};
+};
+
+&pm8550_gpios {
+	sd_card_detect_default: sd-card-detect-default-state {
+		pins = "gpio12";
+		function = "normal";
+		input-enable;
+		output-disable;
+		bias-disable;
+		power-source = <1>; /* 1.8 V */
+	};
+};
+
+&pm8550_rpmh_regulators {
+	vdd-bob1-supply = <&vph_pwr>;
+	vdd-bob2-supply = <&vph_pwr>;
+};
+
+&pm8550ve_rpmh_regulators {
+	vdd-s4-supply = <&vph_pwr>;
+};
+
+&pm8550vs_d_gpios {
+	eusb2_repeater_reset_default: eusb2-repeater-reset-default-state {
+		pins = "gpio4";
+		function = "normal";
+
+		input-enable;
+		output-enable;
+		bias-disable;
+
+		drive-push-pull;
+		power-source = <1>; /* 1.8V */
+		qcom,drive-strength = <3>;
+	};
+};
+
+&pm8550vs_e_rpmh_regulators {
+	vdd-s4-supply = <&vph_pwr>;
+	vdd-s5-supply = <&vph_pwr>;
+};
+
+&pm8550vs_g_rpmh_regulators {
+	vdd-s1-supply = <&vph_pwr>;
+	vdd-s2-supply = <&vph_pwr>;
+	vdd-s3-supply = <&vph_pwr>;
+	vdd-s4-supply = <&vph_pwr>;
+	vdd-s5-supply = <&vph_pwr>;
+	vdd-s6-supply = <&vph_pwr>;
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/sm8550/adsp.mbn",
+			"qcom/sm8550/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/sm8550/cdsp.mbn",
+			"qcom/sm8550/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&sdc2_default {
+	clk-pins {
+		drive-strength = <16>;
+	};
+
+	cmd-pins {
+		/delete-property/ bias-pull-up;
+		bias-disable;
+		drive-strength = <16>;
+	};
+
+	data-pins {
+		/delete-property/ bias-pull-up;
+		bias-disable;
+		drive-strength = <16>;
+	};
+};
+
+&sdhc_2 {
+	cd-gpios = <&pm8550_gpios 12 GPIO_ACTIVE_LOW>;
+
+	pinctrl-0 = <&sdc2_default>, <&sd_card_detect_default>;
+	pinctrl-1 = <&sdc2_default>, <&sd_card_detect_default>;
+	pinctrl-names = "default", "sleep";
+
+	vqmmc-supply = <&sdhci_2_vqmmc>;
+
+	bus-width = <4>;
+	no-sdio;
+	no-mmc;
+
+	status = "okay";
+};
+
+&tlmm {
+	/* Reserved I/Os for NFC */
+	gpio-reserved-ranges = <32 8>;
+
+	m2_pd_en_default: m2-pd-en-default-state {
+		pins = "gpio144";
+		function = "gpio";
+		drive-strength = <16>;
+		drive-open-drain;
+	};
+
+	m2e_wlan_disable: m2e-wlan-disable-default-state {
+		pins = "gpio80";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pwr_per_en_default: pwr-per-en-default-state {
+		pins = "gpio142";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	sd_vset_default: sd-vset-default-state {
+		pins = "gpio4";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	usb_id_default: usb-id-default-state {
+		pins = "gpio53";
+		function = "gpio";
+		bias-pull-up;
+	};
+};
+
+&uart7 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l17b_2p5>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l1g_1p2>;
+	vccq-max-microamp = <1200000>;
+	vdd-hba-supply = <&vreg_l3g_1p2>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l1d_0p88>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+};
+
+&usb_1 {
+	dr_mode = "otg";
+	extcon = <&usb_id>;
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l1e_0p88>;
+	vdda12-supply = <&vreg_l3e_1p2>;
+
+	phys = <&ptn3222>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-pll-supply = <&vreg_l3f_0p88>;
+
+	status = "okay";
+};

-- 
2.43.0

