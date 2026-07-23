Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597F930ACFB
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 01:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784771199; cv=none; b=IB6SiO3TLt6EH6mTVLXKz34Gg+AXQSmz3aLa/Bnpi8QnWpbD//pPKkC3heyE6H2J/Iyngr7SFbD3RcLxhZEDZIiYFamIlKXQwxitWxkWmFFUUzxqQsoNDx3kdAE4GUpo0kJn4HecUAhspZw7+4HnSJTYDPOkA26PiOmx48n1TU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784771199; c=relaxed/simple;
	bh=OFMSCpJyj9hVDi9h35ukEwqYzEbqQJF/Wu38RyqJHBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HItIcGi6tQUTnUw5RLJPBKH9Qv1RCAs23gT/7y2v+Ywp8fc7xbJoimZ0lVwBvEg9NHR2otvdb2gF0AxQfssEdxhgdEK5dEJ2tCIZm4R36Grb56/LfU291mZ1oIi6mqNPYgNW5x/D31+khluqztHycAjjKnjglkWvEEZLvuRy69w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=okjTP1d8; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="okjTP1d8"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6689402c7bfso61542d50.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 18:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784771196; x=1785375996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y4U8WHPBAEUwHV0l13y0REmo/n+jYVuk3FwdOcSHE4U=;
        b=okjTP1d8HgeW4T7+gF113Ctpyzj2v+3u7S9WMos3fLtPL5qraf6YTo1LCzCphFdpEj
         aT/CmkMy83UZT2GzGxcOWCbQ4hjISo53P633ayzX1A5DgMn70ZL59SDSf0GMMCzMZHEQ
         XKZKavrhm4NIkgXnFu1ZlfAHpaX0w/PHMo8URCuPmr0qKiSCA1jef9jr1CvyWyZHTpBf
         qyGqGGRJD57ON4fXjTy94Q5avMhl/ABZkOydzNtK7RN+Tp6JB0dzceyRErHD7f1Qg6hn
         SUh0KvQuo+/MvS/4EbKrBywvwnvPMYE5+/A/V+ZkGyZX8ZBYFcTwPItOXz3WjH+cJ2G3
         4P0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784771196; x=1785375996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y4U8WHPBAEUwHV0l13y0REmo/n+jYVuk3FwdOcSHE4U=;
        b=fFN8RRYi0hCbUmDPWDNv3u+AqY68zqVKqAiBXxDYYegPBKLDbhQVKjjaVFmq9I940S
         v6yRMCCn16NM0E0kccjM23GkhYaQ4NR6v2V0GB8QisxQsZfQJHZYjrLTO5bubRrxMPBh
         DPHj9TsAQHrYUpOGlGog9P63Y1tjhdzlPb0or7A8vLZN4BF28yqlu0tbreDmVKLBdsa6
         sBXwsmp2+UJsSWqgapZmmuU8CefeblxO3potm5r8wuGY0IKRMa87k5FeYHmty7gEiR9m
         4gF8KKlnMoOv9ItSoDVpwZgGYzLlBhszNsMJ2TCsUymSzkmvyw0hkkbSE51nJGas0P9+
         xK5Q==
X-Forwarded-Encrypted: i=1; AHgh+RrQnppIfUBdVEf2EypK13WTgKxMuLgijUHtQpX5woqBtklJunWtfDZzvPpYkyI4XUZDUgyMiwIvHw0v@vger.kernel.org
X-Gm-Message-State: AOJu0YwfpwPafiskbevbVhf24TOavzoqZ2fcqmX9nGBeIeyQYlB6vdf/
	PPejkp6XmhuZkXHBNOy8bVCLlZxoUbft+o0Oa0JkW+kn0AGxf55duvht
X-Gm-Gg: AR+sD10v8aDQxuVfTIsLsVgyev+R14wAEUbKcsNI0WXacXIWXuQUBcVjjFjUdt1+XQP
	G1wJC7O0g49jjHpM24qowtqAOIuQY4Lx42T0Die0/KFyXT5+CvSsi69M1lpS3Trtauowcsp+zY1
	RArpbn6FiXwZvtPZEvyKC6tQjfIqBDKg0L5m54WWWr4LrRdatV1PMKQRxpU2PsghpIGxYnbSmLD
	ZDabVdVJznuWW9yUI8rM/jNCyf8UQbaqBLG8TIwmBdz7FrBmGIactDlGiX/6i8Go3RmtbaCX7OV
	k1NAgL81S1mEEwApoSsqe71qsHW+rVugpiG+EAK8uS8XmBQFdJ9SpilZE6EVMTGseb6ygA/2sgi
	/OXEqh+d4/N19rGwMgnXx8GArNBnGHKBn+pToIMD0hyJ0aBHDzdyKG8cCAcvOg27vHGFzfVV10V
	SEtNwHKGmVawek5BlAxcEJ4wES+TwU
X-Received: by 2002:a05:690c:6a11:b0:81e:a425:fe88 with SMTP id 00721157ae682-81f4c3a6360mr3187257b3.33.1784771196068;
        Wed, 22 Jul 2026 18:46:36 -0700 (PDT)
Received: from karli.attlocal.net ([2600:1700:7270:4eb0::19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33bf2e50sm22038487b3.10.2026.07.22.18.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:46:35 -0700 (PDT)
From: Aneesh Pradhan <aneeshpradhan2004@gmail.com>
X-Google-Original-From: Aneesh Pradhan <aneeshpradhan@acm.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Catherine Frederick <serenity@floorchan.org>,
	linux-clk@vger.kernel.org,
	Aneesh Pradhan <aneeshpradhan@acm.org>
Subject: [PATCH v2 3/3] arm64: dts: qcom: add initial Motorola Moto E4 (perry) support
Date: Wed, 22 Jul 2026 18:46:27 -0700
Message-ID: <20260723014627.63310-4-aneeshpradhan@acm.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723014627.63310-1-aneeshpradhan@acm.org>
References: <20260723012431.48499-1-aneeshpradhan@acm.org>
 <20260723014627.63310-1-aneeshpradhan@acm.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Catherine Frederick (coolguy)" <serenity@floorchan.org>

Add MSM8917 and MSM8920 board files for the Motorola Moto E4 (perry)
sharing a common dtsi, shaped against in-tree msm8917-xiaomi-wingtech /
msm8937-xiaomi-land so every referenced label exists on mainline.

Initial subset: regulators, eMMC/SD, USB OTG (gpio extcon), gpio-keys,
Synaptics RMI4 touchscreen, BMA253 via i2c-gpio, WCNSS Wi-Fi
(qcom,wcn3660b), and PMI8950 WLED.

Deferred (missing mainline SoC/PMIC nodes or drivers): DSI panel/MDSS,
IPA, QDSP6/WCD audio, PMI8950 FG/smbcharger, modem/ADSP/Venus remoteprocs.

Validated on XT1765 under postmarketOS with a fuller fork DT carry; this
is the trimmed upstream-first subset.

Signed-off-by: Catherine Frederick (coolguy) <serenity@floorchan.org>
[aneesh: rewrite against mainline msm8917/pm8937/pmi8950; drop fork-only
 nodes; keep Makefile DTB entries alphabetically sorted]
Signed-off-by: Aneesh Pradhan <aneeshpradhan@acm.org>
---
 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 .../qcom/msm8917-motorola-perry-common.dtsi   | 412 ++++++++++++++++++
 .../boot/dts/qcom/msm8917-motorola-perry.dts  |  20 +
 .../boot/dts/qcom/msm8920-motorola-perry.dts  |  20 +
 4 files changed, 454 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8917-motorola-perry-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8917-motorola-perry.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8920-motorola-perry.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index e05414290d8e..5bf8cdc12ff9 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -106,9 +106,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86518.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86528.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-yiming-uz801v3.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8917-motorola-perry.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8917-xiaomi-riva.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8917-xiaomi-rolex.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8917-xiaomi-tiare.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8920-motorola-perry.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8929-wingtech-wt82918hd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8937-xiaomi-land.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-asus-z00t.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8917-motorola-perry-common.dtsi b/arch/arm64/boot/dts/qcom/msm8917-motorola-perry-common.dtsi
new file mode 100644
index 000000000000..1870958976fb
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8917-motorola-perry-common.dtsi
@@ -0,0 +1,412 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025, Catherine Frederick <serenity@floorchan.org>
+ * Copyright (c) 2026, Aneesh Pradhan <aneeshpradhan@acm.org>
+ */
+
+#include <dt-bindings/arm/qcom,ids.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include "pm8937.dtsi"
+#include "pmi8950.dtsi"
+
+/delete-node/ &qseecom_mem;
+
+/ {
+	aliases {
+		mmc0 = &sdhc_1;
+		mmc1 = &sdhc_2;
+	};
+
+	battery: battery {
+		compatible = "simple-battery";
+
+		charge-full-design-microamp-hours = <4000000>;
+		constant-charge-current-max-microamp = <1000000>;
+		voltage-min-design-microvolt = <3400000>;
+		voltage-max-design-microvolt = <4400000>;
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* Early console deferred with MDSS; panel driver not upstream yet. */
+		stdout-path = "framebuffer0";
+
+		framebuffer0: framebuffer@90001000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0x90001000 0x0 (720 * 1280 * 3)>;
+			width = <720>;
+			height = <1280>;
+			stride = <(720 * 3)>;
+			format = "r8g8b8";
+
+			clocks = <&gcc GCC_MDSS_AHB_CLK>,
+				 <&gcc GCC_MDSS_AXI_CLK>,
+				 <&gcc GCC_MDSS_VSYNC_CLK>,
+				 <&gcc GCC_MDSS_MDP_CLK>,
+				 <&gcc GCC_MDSS_BYTE0_CLK>,
+				 <&gcc GCC_MDSS_PCLK0_CLK>,
+				 <&gcc GCC_MDSS_ESC0_CLK>;
+			power-domains = <&gcc MDSS_GDSC>;
+			status = "disabled";
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&gpio_keys_default>;
+		pinctrl-names = "default";
+
+		key-volup {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+		};
+	};
+
+	/*
+	 * Bitbang on TLMM because BLSP is TZ-protected; sensors are normally
+	 * proxied via ADSP firmware.
+	 */
+	i2c-sensors {
+		compatible = "i2c-gpio";
+		sda-gpios = <&tlmm 14 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&tlmm 15 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <2>; /* ~100 kHz */
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		imu@18 {
+			compatible = "bosch,bma253";
+			reg = <0x18>;
+
+			interrupts-extended = <&tlmm 41 IRQ_TYPE_EDGE_RISING>;
+
+			vdd-supply = <&pm8937_l10>;
+			vddio-supply = <&pm8937_l6>;
+
+			mount-matrix = "-1", "0", "0",
+					"0", "-1", "0",
+					"0", "0", "-1";
+		};
+	};
+
+	reserved-memory {
+		qseecom_mem: qseecom@84300000 {
+			reg = <0x0 0x84300000 0x0 0x2000000>;
+			no-map;
+		};
+
+		framebuffer_mem: memory@90001000 {
+			reg = <0x0 0x90001000 0x0 (720 * 1280 * 3)>;
+			no-map;
+		};
+	};
+
+	vph_pwr: vph-pwr-regulator {
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
+		id-gpios = <&tlmm 97 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&usb_id_default>;
+		pinctrl-names = "default";
+	};
+
+	vdda_touch_vreg: vdda-touch-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vdda_touch";
+		gpio = <&tlmm 59 0>;
+		startup-delay-us = <300>;
+		enable-active-high;
+	};
+};
+
+&blsp1_i2c3 {
+	status = "okay";
+
+	touchscreen@20 {
+		compatible = "syna,rmi4-i2c";
+		reg = <0x20>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <65 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-0 = <&ts_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 64 GPIO_ACTIVE_LOW>;
+
+		vdd-supply = <&vdda_touch_vreg>;
+		vio-supply = <&pm8937_l6>;
+	};
+};
+
+&gpu {
+	status = "okay";
+};
+
+/* Panel / MDSS DSI deferred until the panel driver is upstream. */
+&mdss {
+	status = "disabled";
+};
+
+&pm8937_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&pm8937_spmi_regulators {
+	/* PM8937 S5 = VDD_APC (same pattern as in-tree msm8917 nora/wingtech family). */
+	pm8937_s5: s5 {
+		regulator-min-microvolt = <1050000>;
+		regulator-max-microvolt = <1350000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&pmi8950_wled {
+	qcom,current-limit-microamp = <25000>;
+	qcom,num-strings = <2>;
+	qcom,ovp-millivolt = <29500>;
+	qcom,switching-freq = <800>;
+	qcom,cabc;
+	qcom,external-pfet;
+
+	status = "okay";
+};
+
+&rpm_requests {
+	regulators-0 {
+		compatible = "qcom,rpm-pm8937-regulators";
+
+		vdd_s1-supply = <&vph_pwr>;
+		vdd_s2-supply = <&vph_pwr>;
+		vdd_s3-supply = <&vph_pwr>;
+		vdd_s4-supply = <&vph_pwr>;
+
+		vdd_l1_l19-supply = <&pm8937_s3>;
+		vdd_l2_l23-supply = <&pm8937_s3>;
+		vdd_l3-supply = <&pm8937_s3>;
+		vdd_l4_l5_l6_l7_l16-supply = <&pm8937_s4>;
+		vdd_l8_l11_l12_l17_l22-supply = <&vph_pwr>;
+		vdd_l9_l10_l13_l14_l15_l18-supply = <&vph_pwr>;
+
+		pm8937_s1: s1 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1225000>;
+		};
+
+		pm8937_s3: s3 {
+			regulator-min-microvolt = <1300000>;
+			regulator-max-microvolt = <1300000>;
+		};
+
+		pm8937_s4: s4 {
+			regulator-min-microvolt = <2050000>;
+			regulator-max-microvolt = <2050000>;
+		};
+
+		pm8937_l2: l2 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8937_l5: l5 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8937_l6: l6 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		pm8937_l7: l7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8937_l8: l8 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2900000>;
+		};
+
+		pm8937_l9: l9 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8937_l10: l10 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		pm8937_l11: l11 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-allow-set-load;
+			regulator-system-load = <200000>;
+		};
+
+		pm8937_l12: l12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		pm8937_l13: l13 {
+			regulator-min-microvolt = <3075000>;
+			regulator-max-microvolt = <3075000>;
+		};
+
+		pm8937_l14: l14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8937_l15: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8937_l16: l16 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8937_l17: l17 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2900000>;
+			regulator-always-on;
+		};
+
+		pm8937_l18: l18 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <2700000>;
+		};
+
+		pm8937_l19: l19 {
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1350000>;
+		};
+
+		pm8937_l22: l22 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+		};
+
+		pm8937_l23: l23 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+	};
+};
+
+&sdhc_1 {
+	vmmc-supply = <&pm8937_l8>;
+	vqmmc-supply = <&pm8937_l5>;
+
+	status = "okay";
+};
+
+&sdhc_2 {
+	cd-gpios = <&tlmm 67 GPIO_ACTIVE_HIGH>;
+	vmmc-supply = <&pm8937_l11>;
+	vqmmc-supply = <&pm8937_l12>;
+	pinctrl-0 = <&sdc2_default &sdc2_cd_default>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_cd_default>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32768>;
+};
+
+&tlmm {
+	gpio-reserved-ranges = <20 4>;
+
+	gpio_keys_default: gpio-keys-default-state {
+		pins = "gpio91";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	sdc2_cd_default: sdc2-cd-default-state {
+		pins = "gpio67";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	usb_id_default: usb-id-default-state {
+		pins = "gpio97";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
+	ts_default: ts-default-state {
+		pins = "gpio64";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
+&usb {
+	extcon = <&usb_id>, <&usb_id>;
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usb_hs_phy {
+	extcon = <&usb_id>;
+	vdd-supply = <&pm8937_l2>;
+	vdda1p8-supply = <&pm8937_l7>;
+	vdda3p3-supply = <&pm8937_l13>;
+	status = "okay";
+};
+
+&wcnss {
+	vddpx-supply = <&pm8937_l5>;
+
+	status = "okay";
+};
+
+&wcnss_ctrl {
+	firmware-name = "qcom/msm8917/motorola/perry/WCNSS_qcom_wlan_nv.bin";
+};
+
+&wcnss_iris {
+	compatible = "qcom,wcn3660b";
+	vddxo-supply = <&pm8937_l7>;
+	vddrfa-supply = <&pm8937_l19>;
+	vddpa-supply = <&pm8937_l9>;
+	vdddig-supply = <&pm8937_l5>;
+};
+
+&wcnss_mem {
+	status = "okay";
+};
+
+&xo_board {
+	clock-frequency = <19200000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8917-motorola-perry.dts b/arch/arm64/boot/dts/qcom/msm8917-motorola-perry.dts
new file mode 100644
index 000000000000..190602908a3e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8917-motorola-perry.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 Val Packett
+ * Copyright (c) 2026, Aneesh Pradhan <aneeshpradhan@acm.org>
+ */
+
+/dts-v1/;
+
+#include "msm8917.dtsi"
+#include "msm8917-motorola-perry-common.dtsi"
+
+/ {
+	model = "Motorola Moto E4 (perry)";
+	compatible = "motorola,perry", "qcom,msm8917";
+	qcom,msm-id = <QCOM_ID_MSM8917 0>;
+	qcom,board-id = <0x48 0x8100>,
+			<0x48 0x80b0>,
+			<0x48 0x80a0>;
+	chassis-type = "handset";
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8920-motorola-perry.dts b/arch/arm64/boot/dts/qcom/msm8920-motorola-perry.dts
new file mode 100644
index 000000000000..4b78cf76149a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8920-motorola-perry.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 Val Packett
+ * Copyright (c) 2026, Aneesh Pradhan <aneeshpradhan@acm.org>
+ */
+
+/dts-v1/;
+
+#include "msm8920.dtsi"
+#include "msm8917-motorola-perry-common.dtsi"
+
+/ {
+	model = "Motorola Moto E4 (perry)";
+	compatible = "motorola,perry", "qcom,msm8920";
+	qcom,msm-id = <QCOM_ID_MSM8920 0>;
+	qcom,board-id = <0x48 0x8100>,
+			<0x48 0x80b0>,
+			<0x48 0x80a0>;
+	chassis-type = "handset";
+};
-- 
2.53.0

