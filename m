Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC332931D5
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 14:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785076376; cv=none; b=XdKP8ueBqIs+2Co+FYNdrg3PFA/TW8+Tx4dF4h4/XaPLTYJhLgHqMyFgZC7P32jUiqPTXyw2BwI//EDkGu0zfcS452UgiZzFOYoxxkT1L7lOyE2DpmdhOoiZbgGOTqcpcVEJklC6P2zm3hn8jlnLszeWskufYxopFo3WDO/rXF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785076376; c=relaxed/simple;
	bh=FUW/joDbCZDx6rfKL5Az/ImCTn9NdXPEs2esXybqVsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ebtPijG5OCcLi4BfoLYthgTVgH2n60ucmmSQPLayBhBcguTK25+OpfriS2SkLV7qHDRyh3ODqYc71MgTntgWkOeFJYLDtzRgv3C7qv9l0JO8PJDN4TmqSIEim4arlW3qIFFoMK2TdK12mXhYaj0UBfGI9ka/ThKwka+mpCVNr04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pbf7ZZsN; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pbf7ZZsN"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ce98cb8165so21430865ad.1
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 07:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785076373; x=1785681173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8R/GGjvQw32Ta1zSDferYP2xkZ8i2ieoONEUHfkzNY0=;
        b=Pbf7ZZsNBK0gfV3xnhtg8oPLb5L6x+6QhjjW7/LhEuaF8t1orHygcBS+EA9Vatnt3q
         IyplEpp+DhufovHydDMdYJZ2jhHWz+UmWRQvsABXr3bJKtTKU0vGkSJfEOpDUWYW8sm8
         R9m9bMbmvXXiWr+yVGSxeQ6pSkjKywkvmufoterlumVk/VVbu19fbQ7LxK+BYQDBqgcY
         KPqSi958ta2qtntjlbNz+t93qC0zpw8CTTqounumPNoFzADvz9o8bRFF00E2kmoWUJLp
         JdedlLh1LiVqtWhqm/M6D7XPHhtqpUFJplNJzgWrhBaknW4Loi8n2ljCsji3v/dd1B3a
         8D+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785076373; x=1785681173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8R/GGjvQw32Ta1zSDferYP2xkZ8i2ieoONEUHfkzNY0=;
        b=Af08cj2qoWw7UHbeoNuBaOFsrVWQVDE2WOBbVmOXrj4hQyxiS1Xwixcq6cmhc7H/Pj
         0QbcwCyPDPI+LEwGenOymR1zf79RJpD4cy91bCGlOdRbx/yR+/QQMoFXTBy+SZ18LKcg
         lXQhvtLP4OQFiyshxeNNp7BxHe2eZKsbosozAhAWFrdSkRNuTvLOCT0wGQ40SJOgygKC
         yyPZLfJWm+E1oLqG3gyjSHjLfM9A+QBvMjtRalcKzqIHvUo7Of+7FV9T2CXNnSmNc5AY
         vnpZAubcJkdZi6f9LySJ4RtmKLA3MUwjkTEMu2vtr5DkFeh/mll6qKpZzMbUnnWVN7hp
         4pPg==
X-Forwarded-Encrypted: i=1; AHgh+RpvMHwAq8evJIBsGDrw7hkvrlfbRp3sA0Qvx3hvanTRbriNM15XyySbB+vIJtkF9SyUEvtZC6R7uVUG@vger.kernel.org
X-Gm-Message-State: AOJu0YzkUH3rcmtmBdosf85yfgYR//Kj7IjQotQTyMpo2fwJhNQJRMhD
	pEHmIUAESEVm2yQFmWTuGxf9GHLV+72Oo6Z++EgJ8gvev9N6tBxMT140
X-Gm-Gg: AR+sD12zMJf88iZ2T8ET3CJ5PuYKP2s+V2Sq7p8njP/RFY73JlOD4Z9BNmjt0cQD8BB
	3mLaMuEGTTBu2qUwFsEFZbDiQdqOgPtlVo3fx7pBiLK1PilI6kfNFVvJjjLyT+8n3Z285gBLsPm
	sxSkNBNM1asdxGokSPSQULv9BoD7jbVI2Amlokqn0RrBbga/Q/oiYXVmBrGR0FMtYV9kAF3KZC5
	LwpPUURaTei49BCK7ht6g5oxCeDTTB4UW3QllOuXJiiyX6ON86AFxRE5skOHFnFY+Qkg5/ppKU0
	/0MPho2vD+yZk5a1ikT1lsretU94jRhCzTcJxJtkhVn9OlBOvL7xGeD1DSk6eLXJIDH0ZJexH0M
	Yk+BL52ylVfEwfJqebn0EDfLzdZws3tmGjz85xYOhzxPFj7VH0OepLtD0CPkMluQ1MuoxG+tBgw
	UgHSf9grGweIR+yMnJuEoKgBjeNiF6tuqQjfCS9Svge1ST
X-Received: by 2002:a17:903:230c:b0:2ce:a6a4:451b with SMTP id d9443c01a7336-2cfd70ef9e1mr68191925ad.11.1785076373193;
        Sun, 26 Jul 2026 07:32:53 -0700 (PDT)
Received: from nuvole ([2408:8456:3213:88d5:c960:d4eb:e951:e287])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7f8e73sm20552015ad.72.2026.07.26.07.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 07:32:52 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v2 2/2] arm64: dts: qcom: sm8750: Add Lenovo Legion Y700 Gen4
Date: Sun, 26 Jul 2026 22:30:48 +0800
Message-ID: <20260726143048.130116-3-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260726143048.130116-1-mitltlatltl@gmail.com>
References: <20260726143048.130116-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an initial devicetree for the Lenovo Legion Y700 Gen4, which is
based on sm8750-qrd.

Supported features:
- Altmode
- Backlight
- Battery & Charge (Full speed)
- Buttons
- Framebuffer (Require mdss and dispcc to be disabled)
- USB (Two ports)

Downstream supported features:
- Display (8/10 bits) (Nowadays DPU driver is broken for dual dsi panel)
- GPU
- Touchscreen

Unsupported features:
- BT & WIFI
- Cameras & Flash
- Microphones & Speakers (Downstream available, pending test [1])
- Sensors (Downstream available, pending test [2])
- Vibrators (Downstream available, pending test [1])

[1]: https://github.com/GUF296/linux/commits/codex/tb321fu-full-remediation-20260715
[2]: https://github.com/linux-msm/hexagonrpc

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v2:
- Add the dsi panel node, since the panel driver is upstreamed.
- Use consistent name for fixed regulators. (Krzysztof)
---
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../boot/dts/qcom/sm8750-lenovo-elden.dts     | 1170 +++++++++++++++++
 2 files changed, 1171 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index e05414290d8e..cb93708e0415 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -405,6 +405,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk-rear-camera-card.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-lenovo-elden.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts b/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
new file mode 100644
index 000000000000..c64a1d8c65c1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
@@ -0,0 +1,1170 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025-2026 Pengyu Luo <mitltlatltl@gmail.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/phy/phy.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "sm8750.dtsi"
+#include "pm8550.dtsi"
+#define PMK8550VE_SID 8
+#include "pm8550ve.dtsi"
+#include "pmih0108.dtsi"
+#include "pmk8550.dtsi"
+#include "sm8750-pmics.dtsi"
+
+/ {
+	model = "Lenovo Legion Y700 Gen4";
+	compatible = "lenovo,elden", "qcom,sm8750";
+	chassis-type = "tablet";
+
+	aliases {
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
+		i2c9 = &i2c9;
+		i2c10 = &i2c10;
+		serial1 = &uart14;
+	};
+
+	/* mandatory, ABL requires the chosen node (not the fb) to boot */
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer: framebuffer@fc800000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0xfc800000 0x0 0x2b00000>;
+			width = <1904>;
+			height = <3040>;
+			stride = <(1904 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <76800000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+			#clock-cells = <0>;
+		};
+
+		bi_tcxo_div2: bi-tcxo-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+
+		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&volume_up_n>;
+		pinctrl-names = "default";
+
+		key-volume-up {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&pm8550_gpios 6 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
+
+	pmic-glink {
+		compatible = "qcom,sm8750-pmic-glink",
+			     "qcom,sm8550-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		orientation-gpios = <&tlmm 61 GPIO_ACTIVE_HIGH>;
+
+		/* Long edge */
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_dp_qmpphy_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_sbu: endpoint {
+						remote-endpoint = <&fsa4480_sbu_mux>;
+					};
+				};
+			};
+		};
+
+		/* Short edge */
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_c2_in: endpoint {
+						remote-endpoint = <&usb_dwc3_hs2>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_hs_sbu: endpoint {
+						remote-endpoint = <&fsa4480_hs_sbu_mux>;
+					};
+				};
+			};
+		};
+	};
+
+	reserved-memory {
+		/*
+		 * Use this to tell the BL to initialize the display related
+		 * resources, so we can use efifb. Please 's/-/_/'
+		 */
+		splash-region@fc800000 {
+			reg = <0 0xfc800000 0 0x2b00000>;
+			no-map;
+		};
+	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_1v8_vddio: regulator-1v8-vddio {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg_1v8_vddio";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 161 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&vddio_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_6v1_vsp: regulator-6v1-vsp {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg_6v1_vsp";
+		regulator-min-microvolt = <6100000>;
+		regulator-max-microvolt = <6100000>;
+
+		gpio = <&tlmm 72 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&vsp_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_5v8_vsn: regulator-5v8-vsn {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg_5v8_vsn";
+		regulator-min-microvolt = <5800000>;
+		regulator-max-microvolt = <5800000>;
+
+		gpio = <&tlmm 73 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&vsn_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm8550-rpmh-regulators";
+
+		vdd-bob1-supply = <&vph_pwr>;
+		vdd-bob2-supply = <&vph_pwr>;
+		vdd-l1-l4-l10-supply = <&vreg_s3g_1p8>;
+		vdd-l2-l13-l14-supply = <&vreg_bob1>;
+		vdd-l3-supply = <&vreg_s7i_1p2>;
+		vdd-l5-l16-supply = <&vreg_bob1>;
+		vdd-l6-l7-supply = <&vreg_bob1>;
+		vdd-l8-l9-supply = <&vreg_bob1>;
+		vdd-l11-supply = <&vreg_s7i_1p2>;
+		vdd-l12-supply = <&vreg_s3g_1p8>;
+		vdd-l15-supply = <&vreg_s3g_1p8>;
+		vdd-l17-supply = <&vreg_bob2>;
+
+		qcom,pmic-id = "b";
+
+		vreg_bob1: bob1 {
+			regulator-name = "vreg_bob1";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <4000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob2: bob2 {
+			regulator-name = "vreg_bob2";
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1b_1p8: ldo1 {
+			regulator-name = "vreg_l1b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2b_3p0: ldo2 {
+			regulator-name = "vreg_l2b_3p0";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3048000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4b_1p8: ldo4 {
+			regulator-name = "vreg_l4b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5b_3p1: ldo5 {
+			regulator-name = "vreg_l5b_3p1";
+			regulator-min-microvolt = <3100000>;
+			regulator-max-microvolt = <3148000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6b_1p8: ldo6 {
+			regulator-name = "vreg_l6b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7b_1p8: ldo7 {
+			regulator-name = "vreg_l7b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8b_1p8: ldo8 {
+			regulator-name = "vreg_l8b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9b_2p9: ldo9 {
+			regulator-name = "vreg_l9b_2p9";
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10b_1p8: ldo10 {
+			regulator-name = "vreg_l10b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14b_3p2: ldo14 {
+			regulator-name = "vreg_l14b_3p2";
+			regulator-min-microvolt = <3200000>;
+			regulator-max-microvolt = <3200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b_1p8: ldo15 {
+			regulator-name = "vreg_l15b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16b_2p8: ldo16 {
+			regulator-name = "vreg_l16b_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17b_2p5: ldo17 {
+			regulator-name = "vreg_l17b_2p5";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s7i_1p2>;
+		vdd-l2-supply = <&vreg_s1d_0p97>;
+		vdd-l3-supply = <&vreg_s1d_0p97>;
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+
+		qcom,pmic-id = "d";
+
+		vreg_s1d_0p97: smps1 {
+			regulator-name = "vreg_s1d_0p97";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s3d_1p2: smps3 {
+			regulator-name = "vreg_s3d_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s4d_0p85: smps4 {
+			regulator-name = "vreg_s4d_0p85";
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <1036000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1d_1p2: ldo1 {
+			regulator-name = "vreg_l1d_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2d_0p88: ldo2 {
+			regulator-name = "vreg_l2d_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3d_0p88: ldo3 {
+			regulator-name = "vreg_l3d_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s1d_0p97>;
+		vdd-l2-supply = <&vreg_s7i_1p2>;
+		vdd-l3-supply = <&vreg_s3g_1p8>;
+		vdd-s5-supply = <&vph_pwr>;
+
+		qcom,pmic-id = "f";
+
+		vreg_s5f_0p5: smps5 {
+			regulator-name = "vreg_s5f_0p5";
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <1000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1f_0p88: ldo1 {
+			regulator-name = "vreg_l1f_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2f_1p2: ldo2 {
+			regulator-name = "vreg_l2f_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3f_1p8: ldo3 {
+			regulator-name = "vreg_l3f_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+	};
+
+	regulators-3 {
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s1d_0p97>;
+		vdd-l2-supply = <&vreg_s3g_1p8>;
+		vdd-l3-supply = <&vreg_s7i_1p2>;
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+
+		qcom,pmic-id = "g";
+
+		vreg_s1g_0p5: smps1 {
+			regulator-name = "vreg_s1g_0p5";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <700000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s3g_1p8: smps3 {
+			regulator-name = "vreg_s3g_1p8";
+			regulator-min-microvolt = <1856000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s4g_0p75: smps4 {
+			regulator-name = "vreg_s4g_0p75";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1g_0p91: ldo1 {
+			regulator-name = "vreg_l1g_0p91";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <936000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2g_1p8: ldo2 {
+			regulator-name = "vreg_l2g_1p8";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1860000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3g_1p2: ldo3 {
+			regulator-name = "vreg_l3g_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1256000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-4 {
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s7i_1p2>;
+		vdd-l2-supply = <&vreg_s7i_1p2>;
+		vdd-l3-supply = <&vreg_s1d_0p97>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-s8-supply = <&vph_pwr>;
+
+		qcom,pmic-id = "i";
+
+		vreg_s7i_1p2: smps7 {
+			regulator-name = "vreg_s7i_1p2";
+			regulator-min-microvolt = <1224000>;
+			regulator-max-microvolt = <1340000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s8i_0p9: smps8 {
+			regulator-name = "vreg_s8i_0p9";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <972000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1i_1p2: ldo1 {
+			regulator-name = "vreg_l1i_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2i_1p2: ldo2 {
+			regulator-name = "vreg_l2i_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3i_0p88: ldo3 {
+			regulator-name = "vreg_l3i_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-5 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s1d_0p97>;
+		vdd-l2-supply = <&vreg_s7i_1p2>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+
+		qcom,pmic-id = "j";
+
+		vreg_s2j_1p1: smps2 {
+			regulator-name = "vreg_s2j_1p1";
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s3j_1p1: smps3 {
+			regulator-name = "vreg_s3j_1p1";
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1j_0p91: ldo1 {
+			regulator-name = "vreg_l1j_0p91";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2j_1p2: ldo2 {
+			regulator-name = "vreg_l2j_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
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
+&i2c5 {
+	status = "okay";
+
+	typec-mux@42 {
+		compatible = "fcs,fsa4480";
+		reg = <0x42>;
+
+		vcc-supply = <&vreg_bob1>;
+
+		mode-switch;
+		orientation-switch;
+
+		port {
+			fsa4480_hs_sbu_mux: endpoint {
+				remote-endpoint = <&pmic_glink_hs_sbu>;
+			};
+		};
+	};
+
+	typec-mux@43 {
+		compatible = "fcs,fsa4480";
+		reg = <0x43>;
+
+		vcc-supply = <&vreg_bob1>;
+
+		mode-switch;
+		orientation-switch;
+
+		port {
+			fsa4480_sbu_mux: endpoint {
+				remote-endpoint = <&pmic_glink_sbu>;
+			};
+		};
+	};
+
+	eusb_repeater: redriver@4f {
+		compatible = "nxp,ptn3222"; /* PTN3222DUK */
+		reg = <0x4f>;
+		#phy-cells = <0>;
+
+		vdd3v3-supply = <&vreg_l5b_3p1>;
+		vdd1v8-supply = <&vreg_l15b_1p8>;
+
+		reset-gpios = <&pm8550ve_gpios 6 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&eusb_reset_n>, <&eusb_mux_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&i2c6 {
+	status = "okay";
+
+	/* haptic_hv_l@5a haptic_hv_r@5b */
+};
+
+&i2c9 {
+	status = "okay";
+
+	/* aw882xx_smartpa@34 @37 */
+};
+
+&i2c10 {
+	status = "okay";
+
+	/* i2c_wl2868c@2F */
+
+	/*
+	 * bias@3e, as9702 or aw37504
+	 *
+	 * gpio72/gpio73: enable pin for OUTP/OUTN
+	 * In practical, register programming is not required for as9702
+	 *
+	 * as9702: (REG02H[7:0]=0xf1)
+	 * reg: 0x00 0x01 0x03
+	 * val: 0x15 0x12 0x73
+	 *
+	 * aw37504: (REG04H[1:0]=0x01)
+	 * reg: 0x00 0x01 0x03 0x04
+	 * val: 0x15 0x12 0x43 0x09
+	 */
+
+	backlight: backlight@76 {
+		compatible = "awinic,aw99706";
+		reg = <0x76>;
+
+		enable-gpio = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&aw99706_bl_active>;
+		pinctrl-names = "default";
+
+		default-brightness = <511>;
+		max-brightness = <4095>;
+
+		awinic,dim-mode = <1>;
+		awinic,sw-freq-hz = <750000>;
+		awinic,sw-ilmt-microamp = <3000000>;
+		awinic,uvlo-thres-microvolt = <2200000>;
+		awinic,iled-max-microamp = <30000>;
+		awinic,ramp-ctl = <3>;
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l3g_1p2>;
+
+	qcom,dual-dsi-mode;
+	qcom,sync-dual-dsi;
+	qcom,master-dsi;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "csot,pp8807hb1-1", "novatek,nt36536";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 98 GPIO_ACTIVE_LOW>;
+
+		vddio-supply = <&vreg_1v8_vddio>;
+		vsp-supply = <&vreg_6v1_vsp>;
+		vsn-supply = <&vreg_5v8_vsn>;
+
+		pinctrl-0 = <&disp0_reset_n_active>, <&mdp_vsync_active>;
+		pinctrl-1 = <&disp0_reset_n_suspend>, <&mdp_vsync_suspend>;
+		pinctrl-names = "default", "sleep";
+
+		backlight = <&backlight>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				panel_in_0: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				panel_in_1: endpoint {
+					remote-endpoint = <&mdss_dsi1_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in_0>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l3i_0p88>;
+	phy-type = <PHY_TYPE_CPHY>;
+
+	status = "okay";
+};
+
+&mdss_dsi1 {
+	/* Bonded DSI, source to dsi0_phy PLL */
+	clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
+		 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
+		 <&dispcc DISP_CC_MDSS_PCLK1_CLK>,
+		 <&dispcc DISP_CC_MDSS_ESC1_CLK>,
+		 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+		 <&gcc GCC_DISP_HF_AXI_CLK>,
+		 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+		 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+		 <&dispcc DISP_CC_ESYNC1_CLK>,
+		 <&dispcc DISP_CC_OSC_CLK>,
+		 <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
+		 <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+
+	vdda-supply = <&vreg_l3g_1p2>;
+
+	qcom,dual-dsi-mode;
+	qcom,sync-dual-dsi;
+
+	status = "okay";
+};
+
+&mdss_dsi1_out {
+	remote-endpoint = <&panel_in_1>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi1_phy {
+	vdds-supply = <&vreg_l3i_0p88>;
+	phy-type = <PHY_TYPE_CPHY>;
+
+	status = "okay";
+};
+
+&pcie0 {
+	vdda-supply = <&vreg_l1f_0p88>;
+	vddpe-3v3-supply = <&vreg_l3g_1p2>;
+
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l1f_0p88>;
+	vdda-pll-supply = <&vreg_l3g_1p2>;
+
+	status = "okay";
+};
+
+&pcieport0 {
+	wake-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
+	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+
+	/* WCN7861, id: pci17cb,110e */
+};
+
+&pm8550_gpios {
+	volume_up_n: volume-up-n-state {
+		pins = "gpio6";
+		function = "normal";
+		bias-pull-up;
+		input-enable;
+		power-source = <1>;
+	};
+};
+
+&pm8550ve_gpios {
+	eusb_reset_n: eusb-reset-n-state {
+		pins = "gpio6";
+		function = "normal";
+		bias-disable;
+		power-source = <1>;
+		qcom,drive-strength = <2>;
+	};
+};
+
+&pmih0108_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_1p8>;
+	vdd3-supply = <&vreg_l5b_3p1>;
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
+&qupv3_1 {
+	status = "okay";
+};
+
+&qupv3_2 {
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/sm8750/LENOVO/elden/adsp.mbn",
+			"qcom/sm8750/LENOVO/elden/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/sm8750/LENOVO/elden/cdsp.mbn",
+			"qcom/sm8750/LENOVO/elden/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&spi4 {
+	status = "okay";
+
+	/* novatek@0 */
+};
+
+&sdhc_2 {
+	cd-gpios = <&tlmm 55 GPIO_ACTIVE_HIGH>;
+
+	vmmc-supply = <&vreg_l9b_2p9>;
+	vqmmc-supply = <&vreg_l8b_1p8>;
+
+	no-sdio;
+	no-mmc;
+
+	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
+&tlmm {
+	/* For CDT: <32 3> <37 2> <77 1>; */
+	/* reserved for secure world */
+	gpio-reserved-ranges = <39 1>, <74 1>;
+
+	aw99706_bl_active: aw99706-bl-active-state {
+		pins = "gpio88";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp0_reset_n_active: disp0-reset-n-active-state {
+		pins = "gpio98";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp0_reset_n_suspend: disp0-reset-n-suspend-state {
+		pins = "gpio98";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	eusb_mux_default: eusb-mux-default-state {
+		pins = "gpio29";
+		function = "gpio";
+		drive-strength = <2>;
+		output-high; /* Unconditionally enable */
+		bias-pull-down;
+	};
+
+	vddio_reg_en: vddio-reg-en-state {
+		pins = "gpio161";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
+	mdp_vsync_active: mdp-vsync-active-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdp_vsync_suspend: mdp-vsync-suspend-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	sdc2_card_det_n: sd-card-det-n-state {
+		pins = "gpio55";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	vsp_reg_en: vsp-reg-en-state {
+		pins = "gpio72";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-up;
+	};
+
+	vsn_reg_en: vsn-reg-en-state {
+		pins = "gpio73";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-up;
+	};
+};
+
+&uart14 {
+	status = "okay";
+
+	/* WCN7861-BT */
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l1j_0p91>;
+	vdda-pll-supply = <&vreg_l3g_1p2>;
+
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 215 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l17b_2p5>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l1d_1p2>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&usb {
+	dr_mode = "otg";
+	maximum-speed = "super-speed-plus-gen2x1";
+
+	status = "okay";
+
+	ports {
+		/*
+		 * USB2.0 is shared for two ports, set pinctrl eusb_mux_default
+		 * to select the repeter. Plugging out one of them will reset
+		 * the DWC3, which causes both of them to be disconnected.
+		 */
+		port@0 {
+			reg = <0>;
+
+			usb_dwc3_hs: endpoint {
+				remote-endpoint = <&pmic_glink_hs_in>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			usb_dwc3_hs2: endpoint {
+				remote-endpoint = <&pmic_glink_hs_c2_in>;
+			};
+		};
+	};
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3g_1p2>;
+	vdda-pll-supply = <&vreg_l2d_0p88>;
+
+	mode-switch;
+	orientation-switch;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy_dp_in {
+	remote-endpoint = <&mdss_dp0_out>;
+};
+
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
+&usb_hsphy {
+	vdd-supply = <&vreg_l2d_0p88>;
+	vdda12-supply = <&vreg_l3g_1p2>;
+
+	phys = <&eusb_repeater>;
+
+	status = "okay";
+};
-- 
2.54.0

