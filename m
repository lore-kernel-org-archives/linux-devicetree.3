Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686515;
	b=Y2z0/qs5Fpu1Pqso5W4qqgQfgmM/lzMqnt9GNv+nKmvAoVecg9jqqpHCaGMbjtVkNY2P
	 JgpTYFrSq74rESYekyfxoenZAP0goMSuZ8RPzjRd3e8DBV3Nv8ZWchB5zga0AJkEHj29R
	 3CjpYjoKxtrnfRBfiZ7GU7UKOWVCd0MFjdp2lnctn81AjaWjdIC3z7hcZIVwm3yUTwURb
	 kKhBwvqQdL18Rd3YKIalvABLd+PQ/hsGJRI607RKElFR1b50DhcJaAu5UNRIPGcxrZSe5
	 Wvmg3u9UQwQoHxyvlo5GNvO5gY4p3ZXM64j7FXpIkTbnSnlhbbsKBKVnpCD5PWZcGWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4RuOezCTiPR0FTEoEAmu21z1fNJ+1LXmToUWt9vTo+o=;
	b=Mt6UYKx2eRq5chVUhQVfa1xc2Wtaz8TRTYK0YZajB1NbXAePRH5Pqfv0ZcajkdiPUz6B
	 hC1a6bMXRH3VwwcxzQvTQppGq4h4aTgQRkm+LR6a/xrRsv92dEFYiU5dG+HU81uwOHqRX
	 KQcQFhxaacHLSlEqwzbU11qurtM6uvPaCpITYXhV6/IaHnDLXdJNALWgNwk2l3W+scS1W
	 MqTFZkzyN1YzUQhIBGvY01DlpO70iJc3QHezYFB5aH9zmGjMn6TwYmE9qZkABAF82xGwX
	 A4w7NfS4j1dT/KWP42z5+VSpmy6JnuPY6tAh2D8mmltWzJ9+aXRkyaEOgMXOFEwieEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h6ISPLun;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E48C606A323
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:48:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E48C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h6ISPLun
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b563e32936so2690191c88.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 01:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795686514; x=1796291314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4RuOezCTiPR0FTEoEAmu21z1fNJ+1LXmToUWt9vTo+o=;
        b=h6ISPLunHgIe7VZ3sTF9JU1x2WKoBLgzTzWykajJRbCrTL054PIOaioOtpbtfPHkfQ
         ZUO+nY9ewcpa6KDQO0NTn+7oeLV5UhAchRQzkX0uAVch/0kD9FwdSC6o5oBLPqAnFuV7
         Au3Kh+qb2ecnLFTAWKIyJPXCvJlqxiLwQIr1lDrr8nZjUmgyx3oTI2otVRWCDov6DpwV
         liG7IRQfZm7DvZnkhZA0KdqXVlBqrlBGY25a8kFXXQOO3KIDce8eZIwZoi6loYc4SFLv
         5B73dZ8PtbxIawucR4j5r1dCMyvWkde+RNyGlTy8Y6pworMK1ssZTSx1vZLsNvSfhTv1
         v99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686514; x=1796291314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4RuOezCTiPR0FTEoEAmu21z1fNJ+1LXmToUWt9vTo+o=;
        b=RQ3RefSNcgukIW5FdKBQTC5ktnGXZjfkY/lU1rOu42FaaHCAEZKy8Q+QlxuEl7aO5b
         3h2J/8z7DHYjdKCF92k1r80rHTwvgadnboUwz92q24gQoaeGGQFUPSN8EbTpVxqUds+k
         e1Az462XqyNBMZz5+9JGEwdCXit8U2Br/iBdKmOwJMBGabSJdxmQczNEkGQSPA1BmFsS
         mvAEduqMHXKboK4LXDq8P14om9JKmT9H0AJfEnqBCiAEbR9hRPXR13Pr5xcD9HdNzHBV
         QE4vWmZCupPRHv8ChU5YC9FBC28l31nIkkmZAS/B4wC4W9JOl+GnJx2F2q3YDyYeH/Bm
         ALRw==
X-Forwarded-Encrypted: i=1; AL+hErGn3eip+OcAwVJ/zWPP1EGGMCDkmJbSjNfA4+5ZlEOvVqfVeHFINUEJjzrYTRwey/nt4rMw2zotkt3g@vger.kernel.org
X-Gm-Message-State: APuU4Z+APIv5rBd9OZTSa2SlmkPpMtjw7w/h5a7A2mVqSguM1SVygfcK
	DjaHujSVb06OoKtPb8RFgFZMQP78K18KxYaFpOEWzz3GsLHdr9UY9vKc
X-Gm-Gg: AZFdTZcpR/sOALVF+LS89OFHNt2bMG68f3w8B8v0OXK1dCD9PldMHuFrRp+HLI+CZyd
	StAxvUzcsoY00fCz98jlb/7wM6/X1SK2LzSBJQFGgPxgLs3zgvH5ZFqkr0cAJlkJjOQq7ZyS0wY
	h8WGNT6IFBBS8TbZPAzA8zPP5fE4neRruveDKYBmXmMjLwjkVmEjayhzHBZTSmUDvDKdioSzhjm
	i0SPh5Z4TJv3BcpzJjdOkNUAz0h1LIoveqN+nOTp+1x3wmCI5NYLEP5eX8ZCX5NuDxKMfjcezzk
	K1VgRssknazRCRzkWI2hcT4JxLS0Mro5t+CxvLPjT3zdR+PDsWFvuyiVnIYj9RYOikbo/g5oO2a
	Sd/PS8K5o+Xmew3dJmbNMg22wCPcWkbYEc2fd6cxC53vANULnakNJFFcnsKIH8YiFklFE2H583P
	/B8mX/EXTAjoWLDjUPo+9vor4JQ0mbHrUP1UpgeydCQzRDdfqoGM1o3psdJBAdMCBjmx1HHOJWP
	zmcxE2XYmygqDr/TBwnMvzTe/p8+soTqgmw/xdsXiSS0OL9zqehuy+syfklHLq+N/KFgRdAHYoD
	/l6BMMg9dNDWAXAUUWGgVd43WO/mYW7rmH3S/TGZUk6PumP5TL4l
X-Received: by 2002:a05:7022:f907:b0:1b5:1005:682b with SMTP id a92af1059eb24-1b55689f5f1mr18396451c88.7.1795686514227;
        Thu, 26 Nov 2026 01:48:34 -0800 (PST)
Received: from 192.168.1.36 ([2402:a00:163:2ce9:ad38:eaaf:b00d:c452])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm71781172c88.14.2026.11.26.01.48.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 01:48:33 -0800 (PST)
From: Ajit Singh <blfizzyy@gmail.com>
To: andersson@kernel.org
Cc: konradybcio@kernel.org,
	abelvesa@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v4 1/1] arm64: dts: qcom: lemans: Add Vicharak Axon Pro
Date: Thu, 26 Nov 2026 15:18:18 +0530
Message-ID: <20261126094818.77473-2-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261126094818.77473-1-blfizzyy@gmail.com>
References: <20261126094818.77473-1-blfizzyy@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial device tree support for the Vicharak Axon Pro SBC based on
the Qualcomm QCS9075 SoC.

Enable the debug UART, UFS, USB 2.0 host, PCIe1 (NVMe), GPIO LEDs, GPU
and DSPs.

Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/lemans-vicharak-axon-pro.dts     | 517 ++++++++++++++++++
 2 files changed, 518 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-vicharak-axon-pro.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 19310879349d..6c38f753f06a 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -79,6 +79,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
 lemans-evk-ifp-mezzanine-dtbs	:= lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-ifp-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-sa8255p-ride.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-vicharak-axon-pro.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-lenovo-thinkpad-t14s-gen7-lcd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-qcb.dtb
diff --git a/arch/arm64/boot/dts/qcom/lemans-vicharak-axon-pro.dts b/arch/arm64/boot/dts/qcom/lemans-vicharak-axon-pro.dts
new file mode 100644
index 000000000000..430e7eb189b7
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-vicharak-axon-pro.dts
@@ -0,0 +1,517 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Vicharak Computers Pvt. Ltd.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "lemans-embedded.dtsi"
+#include "lemans-pmics.dtsi"
+
+/ {
+	model = "Vicharak Axon Pro";
+	compatible = "vicharak,axon-pro", "qcom,qcs9100", "qcom,sa8775p";
+
+	aliases {
+		serial0 = &uart10;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		pinctrl-0 = <&user_leds>;
+		pinctrl-names = "default";
+
+		led-0 {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			default-state = "keep";
+			retain-state-suspended;
+		};
+
+		led-1 {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_INDICATOR;
+			gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+			panic-indicator;
+			retain-state-suspended;
+		};
+	};
+
+	vcc_5v0_sys: regulator-vcc-5v-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_5v0_sys";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	regulator-vcc-5v0-usb2-en {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_5v0_usb2_en";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		vin-supply = <&vcc_5v0_sys>;
+
+		gpio = <&tlmm 76 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&usb2_en>;
+		pinctrl-names = "default";
+
+		regulator-always-on;
+	};
+
+	vcc_pcie1_en: regulator-vcc-pcie1-en {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_pcie1_en";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		vin-supply = <&vcc_5v0_sys>;
+
+		gpio = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&pcie1_en>;
+		pinctrl-names = "default";
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vreg_l4a: ldo4 {
+			regulator-name = "vreg_l4a";
+			regulator-min-microvolt = <788000>;
+			regulator-max-microvolt = <1050000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5a: ldo5 {
+			regulator-name = "vreg_l5a";
+			regulator-min-microvolt = <870000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6a: ldo6 {
+			regulator-name = "vreg_l6a";
+			regulator-min-microvolt = <870000>;
+			regulator-max-microvolt = <970000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a: ldo7 {
+			regulator-name = "vreg_l7a";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8a: ldo8 {
+			regulator-name = "vreg_l8a";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9a: ldo9 {
+			regulator-name = "vreg_l9a";
+			regulator-min-microvolt = <2970000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s4a: smps4 {
+			regulator-name = "vreg_s4a";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1816000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+
+			/* Powers boot/reset straps and always-active level shifters. */
+			regulator-always-on;
+		};
+
+		vreg_s5a: smps5 {
+			regulator-name = "vreg_s5a";
+			regulator-min-microvolt = <1850000>;
+			regulator-max-microvolt = <1996000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s9a: smps9 {
+			regulator-name = "vreg_s9a";
+			regulator-min-microvolt = <535000>;
+			regulator-max-microvolt = <1120000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vreg_l1c: ldo1 {
+			regulator-name = "vreg_l1c";
+			regulator-min-microvolt = <1140000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c: ldo2 {
+			regulator-name = "vreg_l2c";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3c: ldo3 {
+			regulator-name = "vreg_l3c";
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4c: ldo4 {
+			regulator-name = "vreg_l4c";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5c: ldo5 {
+			regulator-name = "vreg_l5c";
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6c: ldo6 {
+			regulator-name = "vreg_l6c";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7c: ldo7 {
+			regulator-name = "vreg_l7c";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8c: ldo8 {
+			regulator-name = "vreg_l8c";
+			regulator-min-microvolt = <2400000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9c: ldo9 {
+			regulator-name = "vreg_l9c";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <2700000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "e";
+
+		vreg_l6e: ldo6 {
+			regulator-name = "vreg_l6e";
+			regulator-min-microvolt = <1280000>;
+			regulator-max-microvolt = <1450000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8e: ldo8 {
+			regulator-name = "vreg_l8e";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s4e: smps4 {
+			regulator-name = "vreg_s4e";
+			regulator-min-microvolt = <970000>;
+			regulator-max-microvolt = <1520000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s7e: smps7 {
+			regulator-name = "vreg_s7e";
+			regulator-min-microvolt = <1010000>;
+			regulator-max-microvolt = <1170000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s9e: smps9 {
+			regulator-name = "vreg_s9e";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <570000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&gpi_dma2 {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sa8775p/a663_zap.mbn";
+};
+
+&iris {
+	firmware-name = "qcom/vpu/vpu30_p4_s6.mbn";
+
+	status = "okay";
+};
+
+&pcie1 {
+	vddpe-3v3-supply = <&vcc_pcie1_en>;
+
+	pinctrl-0 = <&pcie1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie1_phy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
+};
+
+&pmm8654au_0_pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&qupv3_id_0 {
+	firmware-name = "qcom/sa8775p/qupv3fw.elf";
+
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	firmware-name = "qcom/sa8775p/qupv3fw.elf";
+
+	status = "okay";
+};
+
+&qupv3_id_2 {
+	firmware-name = "qcom/sa8775p/qupv3fw.elf";
+
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/sa8775p/adsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp0 {
+	firmware-name = "qcom/sa8775p/cdsp0.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp1 {
+	firmware-name = "qcom/sa8775p/cdsp1.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_gpdsp0 {
+	firmware-name = "qcom/sa8775p/gpdsp0.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_gpdsp1 {
+	firmware-name = "qcom/sa8775p/gpdsp1.mbn";
+
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32768>;
+};
+
+&tlmm {
+	pcie1_default_state: pcie1-default-state {
+		clkreq-pins {
+			pins = "gpio3";
+			function = "pcie1_clkreq";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio4";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		wake-pins {
+			pins = "gpio5";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie1_en: pcie1-en-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	usb2_en: usb2-en-state {
+		pins = "gpio76";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	user_leds: user-led-state {
+		pins = "gpio16", "gpio18";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&uart10 {
+	compatible = "qcom,geni-debug-uart";
+	pinctrl-0 = <&qup_uart10_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
+	vcc-supply = <&vreg_l8a>;
+	vcc-max-microamp = <1100000>;
+	vccq-supply = <&vreg_l4c>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l4a>;
+	vdda-pll-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
+
+&usb_2 {
+	/* Routed to an onboard USB hub for two USB-A host ports. */
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l6c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
+
+&xo_board_clk {
+	clock-frequency = <38400000>;
+};
-- 
2.50.1 (Apple Git-155)

