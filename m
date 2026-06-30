Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C58380FCB
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 04:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782793448; cv=none; b=S2rMjYqwVSiQEY1IiPXhiUGg1UQRIQ1kB1flu+EcxCiJRJpSBc2dbp3jpXdXeCHoaMu6jk2xlSRltOvWgPbMxhyeS1/Qjs64zqOmN9sLKi0/5dpJaZkcH75jQM9xiVHSy5RlgVh3089V85bvlL8j+INnraKZybRzidQyr8lvT2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782793448; c=relaxed/simple;
	bh=/BNVPSG0WbRSTzd0kbO/nPpIHc9BdttO+Yfj9Ivih+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UFWRbh9lzM4U4yyWfuY7vnsFJD2qjGO1FMWnky4OVcw2M3x/NXuH8H5fQFHE/0JM0/cFJ4H/0v7XbACAZSrGFTN20I+9o4fSicLshPAnArH8IHNN+t2RY9LZSpc2fBIxWFsvkHQpo/peiJxo0H7O3TBPuYnCPe9bMY0sL/ftXXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+fELgP4; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+fELgP4"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c96d2bebca3so998027a12.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 21:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782793445; x=1783398245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V6z9kgHrkzq/dULKlezqI9ISa94DVtxAwTB+jOqC+x8=;
        b=T+fELgP4hqjkf6UGc/Icwhgh6JTj22UybLirDZdRXcsFfYEQWxwrhFu7aDzahsqCsg
         P7Vo4Yh6uGnBPMJu91ECqAahp27oW9w/H2guPVLK0DcGcSmRJCax+MBSXZ0+k43lGai3
         pi0VWbH7+lJaIzDoHL/cPbs5ZkyxIXrYiQiu7UHto7D/YePahzgOSA96qMUgtVFaoSod
         G45khUiba2dLtRb1bMYbc93ZSdaOea1IRO92XqKKNhLm8TN8oW74TFSAvrCINbW66Xa4
         DJFHvnyYkfDD9ftddW5f92XzDblJ5cjBkjO9mgD3/7W48pF7G1lwmxiHjom/ihZ5z44O
         sd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782793445; x=1783398245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6z9kgHrkzq/dULKlezqI9ISa94DVtxAwTB+jOqC+x8=;
        b=TNI8tSyV/sxx64Y+bAw/YgRo1O5xxdVYJ1PDlFPem5mG3Oku1fSK0Qo4Hl3Kz97nnI
         zLxRWjTXaQwlkQ9wZftT2xL+EUlmhw6stlx6tBJ5sfUFpmAag9n8U5t2FjPzpzIa2tH3
         zDEzbBJVOdeIFuCXx8HjPaA4x3xv4mRcRnZi1PD76qNNZbPMP+9fZQKJuXbylVrFbvRu
         Yv7lzGE4GGrCqMRkN0LR8GQyG33MkkolB6jvWQxcYzwqBqs73cI6Tzpk7heWt2WsOr7u
         sDeWpbZjAIJh/WQQk+eZI85TEOw4b8Qo0MwpBNyWza0D5XKL6eOFLFctM0jEL7mE/VtW
         R1VQ==
X-Forwarded-Encrypted: i=1; AFNElJ/n/qFxHDMwxJNnWuJShDh2fAkl92gMo+8SB6uzam+I42T6u5Xu84HRrFOMPUjJ4V13imUOSOVOCyFN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzji/B3dMPvFvTDnlCBLui66Q2hY0kAaZA/jl+9WqBxP1bzwF2S
	oKrn3VX6bS5IWdeOc3NmCoMU9HgZ1vxziNr800Uu39cDNW0g1/0f31zdLV8wT3AAlZE=
X-Gm-Gg: AfdE7clhSTQEhuzieLU0wNq9NnibwDxmDN6pOXbovkOT2Q9dmiNHUOTeCis2reo3Cvs
	EN8jheskrsuWcWWuxJ/n9M6rROeoonDNuXU063tF4IrsK+07L0vCNBbWFC6ymCLmOPZ0VLz/0Kk
	sZM1MOZmJfSKcxLEyRZN2GaDa1Bn4Zn2oWo129Dseuu+pBrpnfAuDWBrrgvG3En3TFk3De/1tj1
	GAiO8ohN9TjaQe7Sv17no2ZyDPY2mPCFnf/Ajf6mCDrCK8vIFOPorPFcyRnDpmVJXXBOS/689xu
	7dJ0IeqcJtLUwV/oOZ1X97qMYNzvAsGR6NpnQoJVBwLl3ps7q6/0AqVXZTWoxqONo3rgzoZ1vxC
	jk6v8zj2SqWURVjK9SKbTafWqmTGuVOyrWcTECgEz5qLWieQ2KM1kGg2yMM5j+lp7zIN24NZCsG
	WLaN58Uj+BPCM=
X-Received: by 2002:a05:6a21:1b84:b0:3bf:a7d5:df38 with SMTP id adf61e73a8af0-3bfc505cd59mr1808934637.9.1782793445449;
        Mon, 29 Jun 2026 21:24:05 -0700 (PDT)
Received: from nuvole ([2408:844c:b00:2b2f:398a:8bef:b88c:653a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9bbc6da7a1sm765928a12.2.2026.06.29.21.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 21:24:04 -0700 (PDT)
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
Subject: [PATCH] arm64: dts: qcom: sc8280xp-huawei-gaokun3: Add dsi panel DT node
Date: Tue, 30 Jun 2026 12:22:29 +0800
Message-ID: <20260630042229.277799-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DSI panel driver have been added for a while, so add the DT node to
enable it. vdd{a,s}-supply for dsi, dsi_phy are blank since the DSDT
describes the wrong, no impact after manual disabling these wrong
supplies.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts | 165 ++++++++++++++++++
 1 file changed, 165 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
index f3c00be67081..658bb253394a 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
@@ -11,6 +11,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
@@ -98,6 +99,52 @@ switch-mode {
 		};
 	};
 
+	vreg_avdd_5p5: regulator-avdd-5p5 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg_avdd_5p5";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+
+		gpio = <&tlmm 53 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&avdd_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_avee_5p5: regulator-avee-5p5 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg_avee_5p5";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+
+		gpio = <&tlmm 52 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&avee_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_vddi_1p8: regulator-vddi-1p8 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg_vddi_1p8";
+
+		gpio = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&vddi_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
 	vreg_misc_3p3: regulator-misc-3p3 {
 		compatible = "regulator-fixed";
 
@@ -616,6 +663,9 @@ touchscreen@4f {
 		hid-descr-addr = <0x1>;
 		interrupts-extended = <&tlmm 175 IRQ_TYPE_LEVEL_LOW>;
 
+		/* TODO: set post-reset-deassert-delay-ms */
+		panel = <&panel>;
+
 		vdd-supply = <&vreg_misc_3p3>;
 		vddl-supply = <&vreg_s10b>;
 
@@ -738,6 +788,86 @@ &mdss0_dp1_out {
 	remote-endpoint = <&usb_1_qmpphy_dp_in>;
 };
 
+&mdss0_dsi0 {
+	/* real vdda is unknown */
+
+	qcom,dual-dsi-mode;
+	qcom,master-dsi;
+	qcom,sync-dual-dsi;
+
+	status = "okay";
+
+	panel: panel@0 {
+		compatible = "csot,ppc357db1-4", "himax,hx83121a";
+		reg = <0>;
+
+		pinctrl-0 = <&disp_reset_n>, <&mdp_vsync_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+
+		vddi-supply = <&vreg_vddi_1p8>;
+		avdd-supply = <&vreg_avdd_5p5>;
+		avee-supply = <&vreg_avee_5p5>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				panel_in_0: endpoint {
+					remote-endpoint = <&mdss0_dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				panel_in_1: endpoint {
+					remote-endpoint = <&mdss0_dsi1_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss0_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in_0>;
+};
+
+&mdss0_dsi0_phy {
+	/* real vdds is unknown */
+
+	status = "okay";
+};
+
+&mdss0_dsi1 {
+	/* real vdda is unknown */
+
+	qcom,dual-dsi-mode;
+	qcom,sync-dual-dsi;
+
+	status = "okay";
+
+	/* DSI1 is slave, so use DSI0 clocks */
+	assigned-clock-parents = <&mdss0_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss0_dsi0_phy DSI_PIXEL_PLL_CLK>;
+};
+
+&mdss0_dsi1_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in_1>;
+};
+
+&mdss0_dsi1_phy {
+	/* real vdds is unknown */
+
+	status = "okay";
+};
+
 &pcie2a {
 	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
@@ -1303,6 +1433,20 @@ &tlmm {
 
 	gpio-reserved-ranges = <70 2>, <74 6>, <83 4>, <125 2>, <128 2>, <154 4>;
 
+	avdd_reg_en: avdd-reg-en-state {
+		pins = "gpio53";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	avee_reg_en: avee-reg-en-state {
+		pins = "gpio52";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	bt_default: bt-default-state {
 		hstp-bt-en-pins {
 			pins = "gpio133";
@@ -1318,6 +1462,20 @@ hstp-sw-ctrl-pins {
 		};
 	};
 
+	disp_reset_n: disp-reset-n-state {
+		pins = "gpio38";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	mdp_vsync_default: mdp-vsync-default-state {
+		pins = "gpio8";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	i2c4_default: i2c4-default-state {
 		pins = "gpio171", "gpio172";
 		function = "qup4";
@@ -1470,6 +1628,13 @@ usb1_sbu_default: usb1-sbu-state {
 		bias-disable;
 	};
 
+	vddi_reg_en: vddi-reg-en-state {
+		pins = "gpio0";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	wcd_default: wcd-default-state {
 		reset-pins {
 			pins = "gpio106";
-- 
2.54.0

