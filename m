Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04673FF1CB
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787218973; cv=none; b=HhccS1qPv9cmBvLeEbcFWroV4WPFbUV6mxJe9Pznrz8LkWl7Uu5xmZKtD5+jOpRZUX8RJVwr0Ya1E+JvtdF9O7YEi4GCneypN+RJxdxIqmGCZ8fru2tNAPT36f3WDVS9+WaMGIA4ffAre3EMzBC4nfalsdPWiWm/s5+wSv4nmds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787218973; c=relaxed/simple;
	bh=+wTsJwvJtFqh8jtvmvkf/+uhS5Y+DGy7ouDjcsgyYHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GSH1ul9tgl8ML25+gn3cEcbHh/tIJiyCNVcHadwOUjYksJxPAivxu1bsgZn2HKo+NppqcnZfa4SR4dQkg/gnALfToT0PkXb/4QPhworHYmus96bhKSYPWa2//oWKiFqMdr5gH1UiXWbYrdQE5Kv/Otxx50aobE7gkiRbbpfJAeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ia+KXg11; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ia+KXg11"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47de008b020so560056f8f.1
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787218963; x=1787823763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lt8k/Dd1Z/q/hMJxt8UooInT8jJ6DAeFfFrep5RGgnA=;
        b=Ia+KXg110lOcvzaAW9lyvVjTGwk0U5r1TNLI2xy1pL5YOpdiq955whgQVPm2CN2TEv
         zala6Vxuluvr+gVJXLkOgmd4AllwWaNr6gyY29Q1KJnMDTiqe1W/Qhbm5ge89OGS3sQU
         6cW67rMkNRmXgXLM80VBo/hDrbbux9aDMmrk9QA/rnjcTPHFwoI75ADaMUbNhRTHUFYr
         QFptq3KyDRlUrdPLvQL2BGGj3mtXvAGTKNHYoURFT7vG4hrJGWiLafXTOfl6UXmaa8Hj
         RY/zfVi7EfUwZ90M3MCWfIUGccbdqi+q3nQ+RZyE2NnLEvDg38rZNmiwxjp6FFfLOLjW
         Jnzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787218963; x=1787823763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lt8k/Dd1Z/q/hMJxt8UooInT8jJ6DAeFfFrep5RGgnA=;
        b=NUg1tjiYJ6CDV5HT3WQqEFi+zyL62ECHmxvQqAplNdLO42lyoaBrTfwkQ4bM7Pk9LS
         COS7cQwvXyjSfRDIEsS7OOXE5JT/NbK7FGJPB80pYyDZ8F/tLzTnS4hbIgbW4DBI8FEB
         e7wdrYapAVMNi0peq/xdVm4YKUqmribhQ9KfKr0jdPzpdpkFGN+jyR9SwxyeBiOoDPEP
         2qWCuR5zzdi1bB0HeNxrum5gsq/5LSrPIkH3IdxwDUeBialrR9TfzSuH1drMlbQo3I2E
         PhBaVr5fq5QTPpyvd/qgIB2WsD3PxP0ceDg8uoIQqmkpFwvIDz/ZPtcFf9Fn2nSgRbgM
         xC2g==
X-Forwarded-Encrypted: i=1; AHgh+RpdbmE3bErUO8hsbfdiFeyw8w/7sKT0HoU1H8fxm3woewra8wiD5qL9R3VALAh1m/Kv4aMXfRKnP7gC@vger.kernel.org
X-Gm-Message-State: AFuF++kNq5NH3o2uhCVSzodWK73G2i0DgnH9jxbf0WVfXnW8rPAYLA0C
	XFoc+XcD3k2CQn9Cv/ZEqRlVKKRia1LZIVMUO3Vs0rTaUFiUUQ6BmHXP
X-Gm-Gg: AR+sD118vqA0wJB3xeGDhFYAamjV0gY9dpRfqgQ/o+afudBrOx5Vs/zWzfVSo9njEI3
	AYK//z+FfsjFumFE0hZKizEnZn0z3BPe1266VeJaQbmE0xM7uiYDy7ew6jloJHlgVIGaDMsaZ74
	qHN0XJitScjprr+j2k/WkZjxWyjpR7/oiBvjRkwZr/PHV6LWe8iZgKjk44BdZWe1pS1WK4e+ofK
	cJV2YQQC62KsSP+h6Afqd/yuHwhbg0yoWENfOzovxhSlwi+OAResZWSe3XtKK3JUv4MDclJVcRU
	m8qTDqXPJNoWJMZjJfXrjJ4z2hjx+SW0wTNfiP8O1vNxFkB56gdbewt/720XSc6+bj+isMlPF9X
	2bA+xkjyD8P3ugTtpgICvul/uDKAaXwyAxn72fWoHm56DNwMJ1j1VQx0IHzrGmRiR7eNvkBBKVM
	hwxK0b6nJF+OpeyuSvsrNvjtH6gZtz3ZWtkiuR7hwpPSoHJiYa3p6DE1/EJ/BoerdUGsGrosBiB
	xnlNFpMYUlxSf+GjpvD+YdBBpUOgqyB4hY=
X-Received: by 2002:a5d:59a4:0:b0:47f:eb38:26f9 with SMTP id ffacd0b85a97d-482b781df0amr9271387f8f.8.1787218963263;
        Thu, 20 Aug 2026 02:42:43 -0700 (PDT)
Received: from [127.0.1.1] (83.31.75.144.ipv4.supernova.orange.pl. [83.31.75.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b144173csm11788090f8f.6.2026.08.20.02.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:42:42 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Thu, 20 Aug 2026 11:42:26 +0200
Subject: [PATCH v2 3/7] arm64: dts: qcom: Add Motorola One
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-next-patches-v2-3-7130d68183d9@gmail.com>
References: <20260820-next-patches-v2-0-7130d68183d9@gmail.com>
In-Reply-To: <20260820-next-patches-v2-0-7130d68183d9@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Adam Skladowski <a39.skl@gmail.com>
X-Mailer: b4 0.15.2

Add a devicetree for the Motorola One smartphone, which is based
on the Jacala/MSM8953 SoC.

Supported functionality as of this initial submission:
* I2C peripherals (Touchscreen,NFC)
* Power Button, Volume Keys
* Regulators (PM8953)
* Remoteprocs (ADSP, MPSS, WCNSS)
* USB

Device tree also contains supply maps to other subsystems like MDSS
but due to missing dependencies like panel those are disabled.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 arch/arm64/boot/dts/qcom/msm8953-motorola-deen.dts | 460 +++++++++++++++++++++
 2 files changed, 461 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c86e7e98f55..11e953657691 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -120,6 +120,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-sony-xperia-kanuti-tulip.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-wingtech-wt82918.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-wingtech-wt82918hd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-flipkart-rimob.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-motorola-deen.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-motorola-potter.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-xiaomi-daisy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-xiaomi-mido.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8953-motorola-deen.dts b/arch/arm64/boot/dts/qcom/msm8953-motorola-deen.dts
new file mode 100644
index 000000000000..acb0b61b8f94
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8953-motorola-deen.dts
@@ -0,0 +1,460 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2026 Adam Skladowski <a39skl@gmail.com>
+ */
+
+/dts-v1/;
+#include <dt-bindings/usb/pd.h>
+#include "msm8953.dtsi"
+#include "pm8953.dtsi"
+#include "pmi8950.dtsi"
+
+/delete-node/ &cont_splash_mem;
+/delete-node/ &qseecom_mem;
+
+/ {
+	model = "Motorola One";
+	compatible = "motorola,deen", "qcom,msm8953";
+	chassis-type = "handset";
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&gpio_key_default>;
+		pinctrl-names = "default";
+
+		key-volume-up {
+			label = "Volume Up";
+			gpios = <&tlmm 85 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
+
+	reserved-memory {
+		qseecom_mem: qseecom@84300000 {
+			reg = <0x0 0x84300000 0x0 0x2000000>;
+			no-map;
+		};
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	/* Fake VBUS 5V supply till we wire pmi8950 one */
+	fusb302_vbus: otg-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "otg-vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&hsusb_phy {
+	vdd-supply = <&pm8953_l3>;
+	vdda-phy-dpdm-supply = <&pm8953_l13>;
+	vdda-pll-supply = <&pm8953_l7>;
+
+	status = "okay";
+};
+
+&i2c_1 {
+	status = "okay";
+
+	typec-portc@22 {
+		compatible = "fcs,fusb302";
+		reg = <0x22>;
+		interrupts-extended = <&tlmm 9 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&fusb302_int_default>;
+
+		usb-role-switch = <&usb3>;
+		vbus-supply = <&fusb302_vbus>;
+
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+			typec-power-opmode = "default";
+			source-pdos = <PDO_FIXED(5000, 500,
+						 PDO_FIXED_DUAL_ROLE |
+						 PDO_FIXED_DATA_SWAP |
+						 PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000,
+					       PDO_FIXED_DUAL_ROLE |
+					       PDO_FIXED_DATA_SWAP |
+					       PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <2000000>;
+
+			port {
+				fusb302: endpoint {
+					remote-endpoint = <&usb_dwc3_hs>;
+				};
+			};
+		};
+	};
+};
+
+&i2c_2 {
+	status = "okay";
+};
+
+&i2c_3 {
+	status = "okay";
+
+	touchscreen@62 {
+		compatible = "novatek,nt36672a-ts";
+		reg = <0x62>;
+		interrupts-extended = <&tlmm 65 IRQ_TYPE_EDGE_RISING>;
+
+		reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
+		iovcc-supply = <&pm8953_l6>;
+		/* vcc-supply should follow lab from panel */
+
+		pinctrl-0 = <&ts_reset_default &ts_int_default>;
+		pinctrl-1 = <&ts_reset_sleep &ts_int_sleep>;
+		pinctrl-names = "default", "sleep";
+
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1520>;
+
+		status = "disabled";
+	};
+};
+
+&i2c_5 {
+	status = "okay";
+
+	pn553: nfc@28 {
+		compatible = "nxp,pn553", "nxp,nxp-nci-i2c";
+		reg = <0x28>;
+		interrupts-extended = <&tlmm 17 IRQ_TYPE_LEVEL_HIGH>;
+
+		enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
+		firmware-gpios = <&tlmm 62 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&nfc_firm_default &nfc_irq_default &nfc_pwr_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&ibb {
+	qcom,discharge-resistor-kohms = <32>;
+};
+
+&lpass {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm8953_s3>;
+	vddio-supply = <&pm8953_l6>;
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vcca-supply = <&pm8953_l3>;
+};
+
+&mpss {
+	pll-supply = <&pm8953_l7>;
+
+	status = "okay";
+};
+
+&pm8953_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&pmi8950_wled {
+	qcom,current-limit-microamp = <25000>;
+	qcom,num-strings = <2>;
+
+	qcom,cabc;
+	qcom,external-pfet;
+};
+
+&q6afedai {
+	dai@22 {
+		reg = <QUATERNARY_MI2S_RX>;
+		qcom,sd-lines = <0>;
+	};
+
+	dai@127 {
+		reg = <QUINARY_MI2S_RX>;
+		qcom,sd-lines = <1>;
+	};
+};
+
+&rpm_requests {
+	regulators {
+		compatible = "qcom,rpm-pm8953-regulators";
+		vdd_s1-supply = <&vph_pwr>;
+		vdd_s2-supply = <&vph_pwr>;
+		vdd_s3-supply = <&vph_pwr>;
+		vdd_s4-supply = <&vph_pwr>;
+		vdd_s5-supply = <&vph_pwr>;
+		vdd_s6-supply = <&vph_pwr>;
+		vdd_s7-supply = <&vph_pwr>;
+		vdd_l1-supply = <&pm8953_s3>;
+		vdd_l2_l3-supply = <&pm8953_s3>;
+		vdd_l4_l5_l6_l7_l16_l19-supply = <&pm8953_s4>;
+		vdd_l8_l11_l12_l13_l14_l15-supply = <&vph_pwr>;
+		vdd_l9_l10_l17_l18_l22-supply = <&vph_pwr>;
+		vdd_l23-supply = <&pm8953_s3>;
+
+		pm8953_s1: s1 {
+			regulator-min-microvolt = <863000>;
+			regulator-max-microvolt = <1152000>;
+		};
+
+		pm8953_s3: s3 {
+			regulator-min-microvolt = <1224000>;
+			regulator-max-microvolt = <1224000>;
+		};
+
+		pm8953_s4: s4 {
+			regulator-min-microvolt = <1896000>;
+			regulator-max-microvolt = <2048000>;
+		};
+
+		pm8953_l1: l1 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1100000>;
+		};
+
+		pm8953_l2: l2 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8953_l3: l3 {
+			regulator-min-microvolt = <925000>;
+			regulator-max-microvolt = <925000>;
+			regulator-allow-set-load;
+		};
+
+		pm8953_l5: l5 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8953_l6: l6 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-always-on;
+		};
+
+		pm8953_l7: l7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+		};
+
+		pm8953_l8: l8 {
+			regulator-min-microvolt = <2900000>;
+			regulator-max-microvolt = <2900000>;
+		};
+
+		pm8953_l9: l9 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8953_l10: l10 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2850000>;
+		};
+
+		pm8953_l11: l11 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-allow-set-load;
+			regulator-system-load = <200000>;
+		};
+
+		pm8953_l12: l12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3000000>;
+		};
+
+		pm8953_l13: l13 {
+			regulator-min-microvolt = <3075000>;
+			regulator-max-microvolt = <3125000>;
+		};
+
+		pm8953_l15: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8953_l16: l16 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8953_l17: l17 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2850000>;
+		};
+
+		pm8953_l19: l19 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1350000>;
+		};
+
+		pm8953_l22: l22 {
+			regulator-min-microvolt = <2900000>;
+			regulator-max-microvolt = <2900000>;
+		};
+
+		pm8953_l23: l23 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+	};
+};
+
+&sdhc_1 {
+	vmmc-supply = <&pm8953_l8>;
+	vqmmc-supply = <&pm8953_l5>;
+
+	status = "okay";
+};
+
+&sdhc_2 {
+	cd-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
+
+	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_off>;
+	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
+	pinctrl-names = "default", "sleep";
+
+	vmmc-supply = <&pm8953_l11>;
+	vqmmc-supply = <&pm8953_l12>;
+
+	status = "okay";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <96 4>; /* Fingerprint SPI */
+
+	disp_reset_n_active: disp-reset-n-active-state {
+		pins = "gpio61";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp_reset_n_sleep: disp-reset-n-sleep-state {
+		pins = "gpio61";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	fusb302_int_default: fusb302-int-default-state {
+		pins = "gpio9";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	mi2s_sec_act: mi2s-quat-active-state {
+		pins = "gpio135", "gpio136", "gpio137", "gpio138";
+		function = "sec_mi2s";
+		drive-strength = <8>;
+	};
+
+	mi2s_sec_sus: mi2s-quat-sleep-state {
+		pins = "gpio135", "gpio136", "gpio137", "gpio138";
+		function = "sec_mi2s";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	nfc_firm_default: nfc-firm-state {
+		pins = "gpio62";
+		function = "gpio";
+		bias-pull-down;
+		output-low;
+		drive-strength = <2>;
+	};
+
+	nfc_irq_default: nfc-irq-state {
+		pins = "gpio17";
+		function = "gpio";
+		bias-pull-down;
+		drive-strength = <2>;
+	};
+
+	nfc_pwr_default: nfc-pwr-state {
+		pins = "gpio16";
+		function = "gpio";
+		bias-pull-down;
+		output-low;
+		drive-strength = <2>;
+	};
+
+	ts_int_default: ts-int-default-state {
+		pins = "gpio65";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
+	ts_int_sleep: ts-int-sleep-state {
+		pins = "gpio65";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	ts_reset_default: ts-reset-default-state {
+		pins = "gpio64";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
+	ts_reset_sleep: ts-reset-sleep-state {
+		pins = "gpio64";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};
+
+&usb3 {
+	status = "okay";
+};
+
+&usb_dwc3_hs {
+	remote-endpoint = <&fusb302>;
+};
+
+&wcnss {
+	vddpx-supply = <&pm8953_l5>;
+
+	status = "okay";
+};
+
+&wcnss_iris {
+	compatible = "qcom,wcn3660b";
+
+	vdddig-supply = <&pm8953_l5>;
+	vddpa-supply = <&pm8953_l9>;
+	vddrfa-supply = <&pm8953_l19>;
+	vddxo-supply = <&pm8953_l7>;
+};

-- 
2.55.0

