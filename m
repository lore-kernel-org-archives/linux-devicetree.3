Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F73399354
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 12:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787314759; cv=none; b=hN+c7DlGdW33aYFjxqTZu+0O9dLqDyK84mhmikfw0SKKxosEc66DVF+VqXYgtjLnbNUzCTpWhxL28dq/BQ8qLOcj6rhYvtToQMcwMFqZkEud9ZoLfyAk/K7alhgxrOPXXR3gginVbYNgjtRR/voeP+IRTxygykim85k8tRMlx8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787314759; c=relaxed/simple;
	bh=+aOgRLwCUqqKFF7jvQTCyWmlC8U2NVG2cGaUIFuShRs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YSZTAczT9e/c3ufg+GYLaB3Fu3ZVnT3u6ikK2QzWLe57PR1NxYffSrafCMxpl4FzENabngaAdNEbHr48Y0QNjzI8tBXnGKZtIzbJLC1I24YN7XPYKykVdvRz97iBlSC0oksM3GSAO1QeLP16e01vJt9R1GRAfy9zEdKVt3LJlts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W43j4Gr+; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W43j4Gr+"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2022323c37so152292266b.0
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 05:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787314751; x=1787919551; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gluNXEzE0jrXofmeuDnGwFvyAFsJsHqbSE36bnVnRh4=;
        b=W43j4Gr+vuOdMhP+3SslFSYL0L+Y3P4932DefmZvwF+f2pwJUkQ+zvmQkTo7d9Pt1F
         0MwxnnNr8+kYWPUPHjRg8Ra1KIh8bDKoXfA55yugEM12GGg6FhNgF5f9iKVFdTc2Ycrj
         JRYq2QPbrcYD4DlZWWd7BIpw5B21vKyzZLhLf5lFzoocRrTMRj8BvOYSd4rphTngMv4B
         P/XYimZHPpCpoEhcbnnBZVodfs0DNE7meOTRB/K/3P63C0OI3IDCQ1X4X8esHbG/SPYf
         Ry0JMZB7jIMHyxq9VtOM9cdLVA2Yzdb2K6j2wuQcYx/W0SqP+Qua3cc1jvOaYmFCxeYj
         bT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787314751; x=1787919551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gluNXEzE0jrXofmeuDnGwFvyAFsJsHqbSE36bnVnRh4=;
        b=S3iwNIsKwXU3L/z6upi1SGWKkZTxZIuxoAddJhujio5CXkdcJj/aPMvWTzQ4fSWGzT
         VFtbI7pnMK7a3BFfuw2bFP7eG35wYGG4b5O4dK5JuDlplzPZSWYz4REVluucicGULpcH
         hq1IW2tS0L7wSB6QGwM5O2t6x7M+CKVdjewWLBfZkogqL/Yq4HJJYLdg+TfBj7JZ6Kha
         aEBTVS3vk8y6ktw1rOKsR04DH0SljEYfwZsDu2s13BSE8JvoNxr11JL/BPPwxIa4X+4q
         K7zNMpGzo/zahloj2vHTUltEzGNVsr8CJ5AVy6h38D7wTPTTqne/3ysdn61s5s/4v3Sk
         VMqg==
X-Forwarded-Encrypted: i=1; AHgh+RpL9nDh3KAA3Fkn8klAffiJI25CerzyeUWvcW3nLlJrOHZfxye3sHAdFhgksNdcD7GMfFubwtz8N0yV@vger.kernel.org
X-Gm-Message-State: AFuF++m0JOqbc6lmOavrQLVbLlBTdUOWC1TPvbTV0KHNS3Np21/mjRIT
	AmKuo4ttDWQFs84S/3m3Op098BDo4vu8vn2KxEX+lcKngPwFZz3uu+YR8GbBng==
X-Gm-Gg: AR+sD10g5wqaij13bYog0onA0NOZEkFFaPBShYhqdamLV+0Htk1Ss3KUXFY5Dcsf0NY
	Xh3yTtdqFGRTL2HL7q0DK6veWSM7rKN6u/Tawn//mzNlNtxtW0f/yLNudehqKB2cPDuC0E+9+wJ
	+7wbDdRN939vNCb2rrYNJjrK4AqZDVqGSomXklSxK2BJaT56+av716f710WxwFnSwm8rMhJj/Hl
	I/43Ee2IigdqMzyd2OHLYf7Q3wGg+TDoTlA37r5NVChpH4nkZPqx19crj9c545B5OscniMLkCdx
	ycHoB/lFiG+UDtghIvdIQmEKJpYhizJqWNRgvJ/eqjjuD0e7A+m8VKAWf1IVijhIqTaH8DwITWY
	vfRxJQa5sO4nRL8a1YejdMgPkRUxmNYL1kX1UudN1O5/hknzkavRKIlPz61fRubNaBooyHpzNik
	c9XRycCvb6pEYJsfEqMyo1Nbb3+v5SDy23q4Md7We4iXg0U8uqKecWKjg+irOruCSc/Ai8+2wab
	x63gfNLov80e0x56V76ZkqeBXfM
X-Received: by 2002:a17:907:9628:b0:c16:13e7:fd63 with SMTP id a640c23a62f3a-c2469f94a1bmr619758066b.0.1787314751107;
        Fri, 21 Aug 2026 05:19:11 -0700 (PDT)
Received: from [127.0.1.1] (83.24.178.112.ipv4.supernova.orange.pl. [83.24.178.112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589d9df9sm447823866b.1.2026.08.21.05.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:19:10 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Fri, 21 Aug 2026 14:19:04 +0200
Subject: [PATCH v4 5/7] arm64: dts: qcom: Add LeEco Le2
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-next-patches-v4-5-7ab02c0d4eb9@gmail.com>
References: <20260821-next-patches-v4-0-7ab02c0d4eb9@gmail.com>
In-Reply-To: <20260821-next-patches-v4-0-7ab02c0d4eb9@gmail.com>
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

Add a devicetree for the LeEco Le2 smartphone, which is based
on the Eldarion/MSM8976 SoC.

Supported functionality as of this initial submission:
* I2C peripherals (Touchscreen,Audio amp, Haptics, Extcon, Led)
* Power Button, Volume Keys
* Regulators (PM8950)
* WLED (PMI8950)
* Remoteprocs (WCNSS)
* GPU

Device tree also contains supply maps to other subsystems like MDSS
but due to missing dependencies like panel those are disabled.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/msm8976-leeco-s2.dts | 442 ++++++++++++++++++++++++++
 2 files changed, 443 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 11e953657691..1487f2beff3d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -128,6 +128,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-xiaomi-tissot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-xiaomi-vince.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8956-sony-xperia-loire-kugo.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8956-sony-xperia-loire-suzu.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8976-leeco-s2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8976-longcheer-l9360.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-lg-bullhead-rev-10.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-lg-bullhead-rev-101.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8976-leeco-s2.dts b/arch/arm64/boot/dts/qcom/msm8976-leeco-s2.dts
new file mode 100644
index 000000000000..e64335162c34
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8976-leeco-s2.dts
@@ -0,0 +1,442 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2026 Adam Skladowski <a39skl@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "msm8976.dtsi"
+#include "pm8950.dtsi"
+#include "pm8004.dtsi"
+#include "pmi8950.dtsi"
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/input/ti-drv260x.h>
+
+/ {
+	model = "Leeco Le S2";
+	compatible = "leeco,s2", "qcom,msm8976";
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
+			gpios = <&tlmm 113 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
+
+	reserved-memory {
+		/delete-node/ ext-region@85b00000;
+
+		 ext_region: memory@84a00000 {
+			reg = <0x0 0x84a00000 0x0 0x1900000>;
+			no-map;
+		};
+	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&adreno_gpu {
+	status = "okay";
+};
+
+&blsp1_i2c4 {
+	status = "okay";
+
+	touchscreen@4b {
+		compatible = "syna,rmi4-i2c";
+		reg = <0x4b>;
+		interrupts-extended = <&tlmm 65 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&touch_default_state>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&pm8950_l17>;
+		vio-supply = <&pm8950_l6>;
+
+		syna,reset-delay-ms = <100>;
+		syna,startup-delay-ms = <500>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		rmi4-f01@1 {
+			reg = <0x01>;
+			syna,nosleep-mode = <1>;
+		};
+
+		rmi4-f12@12 {
+			reg = <0x12>;
+			syna,sensor-type = <1>;
+			syna,clip-x-low = <0>;
+			syna,clip-x-high = <1080>;
+			syna,clip-y-low = <0>;
+			syna,clip-y-high = <1920>;
+		};
+	};
+};
+
+&blsp2_i2c2 {
+	status = "okay";
+
+	haptics: haptics@5a {
+		compatible = "ti,drv2604";
+		reg = <0x5a>;
+		enable-gpios = <&tlmm 109 GPIO_ACTIVE_HIGH>;
+		mode = <DRV260X_LRA_MODE>;
+		library-sel = <DRV260X_LIB_LRA>;
+	};
+
+	tiusb320: typec@47 {
+		compatible = "ti,tusb320";
+		reg = <0x47>;
+		interrupts-extended = <&tlmm 21 IRQ_TYPE_EDGE_RISING>;
+
+		pinctrl-0 = <&tusb320_int_active>;
+		pinctrl-names = "default";
+	};
+};
+
+&blsp2_i2c4 {
+	status = "okay";
+
+	led-controller@45 {
+		compatible = "awinic,aw2013";
+		reg = <0x45>;
+		vcc-supply = <&pm8950_l10>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			led-max-microamp = <5000>;
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led@1 {
+			reg = <1>;
+			led-max-microamp = <5000>;
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led@2 {
+			reg = <2>;
+			led-max-microamp = <5000>;
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+	};
+
+	speaker_codec: audio-codec@34 {
+		compatible = "nxp,tfa9890";
+		reg = <0x34>;
+		vddd-supply = <&pm8950_l5>;
+		sound-name-prefix = "Speaker";
+		#sound-dai-cells = <0>;
+	};
+};
+
+&gcc {
+	vdd_gfx-supply = <&pm8004_s5>;
+};
+
+&mdss_dsi0 {
+	vdd-supply = <&pm8950_l17>;
+	vdda-supply = <&pm8950_l1>;
+	vddio-supply = <&pm8950_l6>;
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vddio-supply = <&pm8950_l6>;
+};
+
+&otg {
+	extcon = <&tiusb320>;
+};
+
+&pm8004_lsid5 {
+	status = "okay";
+};
+
+&pm8004_spmi_regulators {
+	vdd_s2-supply = <&vph_pwr>;
+	vdd_s5-supply = <&vph_pwr>;
+
+	status = "okay";
+
+	/* Cluster 1 supply */
+	pm8004_s2: s2 {
+		regulator-name = "VDD_APC1";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <1165000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	pm8004_s5: s5 {
+		regulator-name = "VDD_GFX";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <1165000>;
+		regulator-enable-ramp-delay = <500>;
+		regulator-always-on;
+	};
+};
+
+&pm8950_spmi_regulators {
+	vdd_s5-supply = <&vph_pwr>;
+
+	/* Cluster 0 supply */
+	pm8950_spmi_s5: s5 {
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <1165000>;
+		regulator-name = "VDD_APC0";
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&pm8950_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&pmi8950_wled {
+	qcom,current-limit-microamp = <20000>;
+	qcom,enabled-strings = <0 1>;
+	qcom,ovp-millivolt = <29500>;
+};
+
+&rpm_requests {
+	regulators {
+		compatible = "qcom,rpm-pm8950-regulators";
+
+		vdd_s1-supply = <&vph_pwr>;
+		vdd_s2-supply = <&vph_pwr>;
+		vdd_s3-supply = <&vph_pwr>;
+		vdd_s4-supply = <&vph_pwr>;
+		vdd_s6-supply = <&vph_pwr>;
+		vdd_l1_l19-supply = <&pm8950_s3>;
+		vdd_l2_l23-supply = <&pm8950_s3>;
+		vdd_l3-supply = <&pm8950_s3>;
+		vdd_l5_l6_l7_l16-supply = <&pm8950_s4>;
+		vdd_l8_l11_l12_l17_l22-supply = <&vph_pwr>;
+		vdd_l9_l10_l13_l14_l15_l18 = <&vph_pwr>;
+
+		pm8950_s3: s3 {
+			regulator-min-microvolt = <1325000>;
+			regulator-max-microvolt = <1325000>;
+		};
+
+		pm8950_s4: s4 {
+			regulator-min-microvolt = <2050000>;
+			regulator-max-microvolt = <2050000>;
+		};
+
+		pm8950_l1: l1 {
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1300000>;
+		};
+
+		pm8950_l2: l2 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8950_l3: l3 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1100000>;
+		};
+
+		pm8950_l5: l5 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8950_l6: l6 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8950_l7: l7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+		};
+
+		pm8950_l8: l8 {
+			regulator-min-microvolt = <2900000>;
+			regulator-max-microvolt = <2900000>;
+		};
+
+		pm8950_l9: l9 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8950_l10: l10 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2850000>;
+		};
+
+		pm8950_l11: l11 {
+		/* TUSB320 power supply */
+			regulator-always-on;
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		pm8950_l12: l12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		pm8950_l13: l13 {
+			regulator-min-microvolt = <3075000>;
+			regulator-max-microvolt = <3075000>;
+		};
+
+		pm8950_l14: l14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8950_l15: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8950_l16: l16 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8950_l17: l17 {
+			regulator-min-microvolt = <2500000>;
+			regulator-max-microvolt = <2900000>;
+		};
+
+		pm8950_l19: l19 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1350000>;
+		};
+
+		pm8950_l22: l22 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+		};
+
+		pm8950_l23: l23 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+	};
+};
+
+&sdhc_1 {
+	vmmc-supply = <&pm8950_l8>;
+	vqmmc-supply = <&pm8950_l5>;
+
+	status = "okay";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <0 4>, /* Unknown */
+			       <8 4>; /* Fingerprint SPI */
+
+	disp_reset_n_active: disp-reset-n-active-state {
+		pins = "gpio25";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp_reset_n_sleep: disp-reset-n-sleep-state {
+		pins = "gpio25";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	disp_te_default: disp-te-default-state {
+		pins = "gpio24";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	gpio_key_default: gpio-key-default-state {
+		pins = "gpio113";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	touch_default_state: touch-default-state {
+		irq-pins {
+			pins = "gpio65";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		reset-pins {
+			pins = "gpio64";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+	};
+
+	tusb320_int_active: tusb320-int-active-state {
+		pins = "gpio21";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&wcnss {
+	vddpx-supply = <&pm8950_l5>;
+
+	status = "okay";
+};
+
+&wcnss_iris {
+	compatible = "qcom,wcn3680";
+
+	vddxo-supply = <&pm8950_l7>;
+	vddrfa-supply = <&pm8950_l19>;
+	vddpa-supply = <&pm8950_l9>;
+	vdddig-supply = <&pm8950_l5>;
+};
+
+&xo_board {
+	clock-frequency = <19200000>;
+};
+

-- 
2.55.0

