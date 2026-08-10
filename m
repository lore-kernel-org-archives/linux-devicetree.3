Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC04C43231B
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 16:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380977; cv=none; b=QFH7yB50sHqdaIEh/xteIP46kXCrZ4iXGdrMxw6WL+4XAq3RjN/AxH/S+K9m3xoM73GPUZVAw3f9g5JsTvYrQy8iVPJATKYBXGi8iDzQVwXLaZEhmsNSDuBRgBzmVn+5dozjV16YdlWjpNT5aRGHRYDZQMwWkxewXybuig65dBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380977; c=relaxed/simple;
	bh=V5McIYuk4PHBH0micjsbYx/zMJ2p0vTV81Gse1ZpN04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HuHx0OonWPt4FkvFLqaM2Zeq9biPm11pfyAyBFRwvYf0nQ2QNxP7P6WVU5Y66oO893YdIhG6OT9lSRE4WLmLXVTxUMCXNGRVH0JvzCJMzhBC/MPW0pJjyfepu1/eG9JrO7OnLCAsTjIlFBkI5cxW0qCXwJYeacCNaOEKtWNeyRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QFVsmImh; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QFVsmImh"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954aff6088so19047045e9.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 09:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786380973; x=1786985773; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WjXCfLWhJuRt7tb9r3DBkTv8QJpoTZYCoL7P6wg5hDA=;
        b=QFVsmImhcFUhSAuFb9ofdUlL6QFIc4CF//kf3dQ06NtxU1G8W1GwMjK2d13FLz+1m/
         4VSMocizjOoe9Jj5UtYdtFyQU+28O8rVB7daVsTEkuckITLChZU0Ro3yv63sQqClGjEm
         b9SGNKzoeeCiRP+aqUMPJKBa2bED4ofQKmJglHXiKbjchF2iwlv7BPLmP8JX2XzonfIW
         ZsEiuD1P7L9XvcArfqWtCbwt2bKyqlqw5S4bnZNPWKvU2N4FY58cdkk+BYZG5IpliZF6
         oXspTeai5ikBi0XjGlDH1nR1KXjLnv55DPXv5Rw97GUpaUbmJkLlrXuDot9bm2Pmfv5b
         a99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786380973; x=1786985773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WjXCfLWhJuRt7tb9r3DBkTv8QJpoTZYCoL7P6wg5hDA=;
        b=pUefHcAjS1SeFTSTxTqdEO4cHwigRRRKPHmMECxQN5HEBBW7uCdh6IInSY8D+M9X+/
         YUk207AWI+UJGooh4ailh3omwGyzFW7zlwdz9dE1gri/fmWRCxHKxGj8GAAn6GENFRxg
         1yoyxtkj5MKUnV2eTf7pl/odxlVn6W0d4WKZcol9jBM9o/F/Rj7Bf2zDfsqE2N1LuAxU
         kiGBU//844vTh8AKiSZpJHLkEqrbAsIl/59cPiN5TNgL4SknYLbclOlo7jp5LjyVOrVP
         IOD7JYHOkD8Nz+nciIL+elM3Gw6yOgDRfSw37rGcaDHKe3F9RbMXhm7J91hE656i8Fup
         v0nw==
X-Forwarded-Encrypted: i=1; AHgh+RqpAqFxxvl442TeBciq7QBLOZfEfc7AVMk4wVX83g8uQLNUazee2wC7pt1isyG04TIkKYJEDfpn6JqV@vger.kernel.org
X-Gm-Message-State: AOJu0YzgRrK/z6MW1xS09N8I0zGNDKCR/Xd6CkmO00vo4NEZfXU+TIn2
	LQEqi0nRtchTxJE7BXc1xISr6cA0Lisbwq6ToshXAacRn6V0fxcZnmsMCKLKjf9wg2U=
X-Gm-Gg: AR+sD12wAN1JjIamOyGwesbep0AvewzptuZO8uGMhPCydS73sqD64je/U6ef+za5PDh
	3fURa2c9boUPBy1vzuwyPQO1ZrXBmeXlhQBVy9Tjf4VUZSkiS4F+nBfvREnsZ1r1m5UvbkW6l5K
	ATMyeS/w6WRTL72TJ2T620/9drdqVAdLzGqR5g/dPBmiuOHBDevyDFhczZtBovaWc/YAiJrFO8J
	mby+8yPo8xpa5GlmSUQV46ZFidZ4m8vnSTp7/KwVmjee7p0tWDbPXHYNBAbGzkhr5TbDbACn+RM
	svjBpRF404KiZd5qCFaF4EvfDpJdDW77QvwJwn9iWZ99QT5LQEcYRfQZiBuFsP2sIniNjhDLM+7
	NjK0gpqzwxRb9khp1sn+vhOra3MwwOHPkkHHnf5XmQtLjFrOHJZvXo4a8cOOFtrpd5xBTRfgP5+
	kO9LUHVzrFNTk/2bAbLdphoDkWQMmEjtXFag5/4OaOu9E5tpnxS967s3wpnhhJoVNoDw/xm/w7X
	1GAnHeHgqkugpdUAkqjujYUsQ==
X-Received: by 2002:a05:600c:4f8c:b0:495:4b24:1b64 with SMTP id 5b1f17b1804b1-499726d57c9mr42990695e9.0.1786380972848;
        Mon, 10 Aug 2026 09:56:12 -0700 (PDT)
Received: from [127.0.1.1] (83.31.73.193.ipv4.supernova.orange.pl. [83.31.73.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c69c8ffsm238472635e9.2.2026.08.10.09.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 09:56:11 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Mon, 10 Aug 2026 18:55:40 +0200
Subject: [PATCH 7/7] arm64: dts: qcom: Add Xiaomi Redmi 9T
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-next-patches-v1-7-79a779d76173@gmail.com>
References: <20260810-next-patches-v1-0-79a779d76173@gmail.com>
In-Reply-To: <20260810-next-patches-v1-0-79a779d76173@gmail.com>
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

Add a devicetree for the Xiaomi Redmi 9T smartphone, which is based
on the Bengal/SM6115 SoC.

Supported functionality as of this initial submission:

* Display via SimpleFB/SimpleDRM
* GPU
* I2C peripherals (Backlight)
* Power Button, Volume Keys
* Regulators
* Remoteprocs (ADSP, CDSP, MPSS)
* UFS/SDCARD
* USB

Device tree also contains supply maps to other subsystems like MDSS
but due to missing dependencies like panel those are disabled.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile                |   1 +
 arch/arm64/boot/dts/qcom/sm6115-xiaomi-lemon.dts | 440 +++++++++++++++++++++++
 2 files changed, 441 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1487f2beff3d..6dee0a99fdc6 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -345,6 +345,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115p-lenovo-j606f.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-xiaomi-lemon.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6125-sony-xperia-seine-pdx201.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6125-xiaomi-ginkgo.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6125-xiaomi-laurel-sprout.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm6115-xiaomi-lemon.dts b/arch/arm64/boot/dts/qcom/sm6115-xiaomi-lemon.dts
new file mode 100644
index 000000000000..f33b8e2859ef
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm6115-xiaomi-lemon.dts
@@ -0,0 +1,440 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2026 Adam Skladowski <a39skl@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "sm6115.dtsi"
+#include "pm6125.dtsi"
+#include <dt-bindings/leds/common.h>
+
+/delete-node/ &pil_ipa_fw_mem;
+/delete-node/ &pil_ipa_gsi_mem;
+/delete-node/ &pil_gpu_mem;
+/delete-node/ &pil_adsp_mem;
+/ {
+	model = "Xiaomi Redmi 9T";
+	compatible = "xiaomi,lemon", "qcom,sm6115";
+	chassis-type = "handset";
+
+	aliases {
+		mmc0 = &sdhc_2;
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		framebuffer0: framebuffer@5c000000 {
+			compatible = "simple-framebuffer";
+			reg = <0 0x5c000000 0 (2340 * 1080 * 4)>;
+			width = <1080>;
+			height = <2340>;
+			stride = <(1080 * 4)>;
+			format = "a8r8g8b8";
+			clocks = <&gcc GCC_DISP_HF_AXI_CLK>;
+		};
+	};
+
+	backlight_dsi: backlight-dsi {
+		compatible = "led-backlight";
+		leds = <&led_backlight>;
+		brightness-levels = <255>;
+		default-brightness-level = <190>;
+		/* Backlight controllers can differ between panel variants */
+		status = "disabled";
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&vol_up_n>;
+
+		key-volume-up {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&pm6125_gpios 5 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
+
+	reserved-memory {
+
+		pil_cdsp_mem: memory@51a00000 {
+			reg = <0x0 0x51a00000 0x0 0xa00000>;
+			no-map;
+		};
+
+		pil_adsp_mem: memory@53400000 {
+			reg = <0x0 0x53400000 0x0 0x2600000>;
+			no-map;
+		};
+
+		pil_ipa_fw_mem: memory@55a00000 {
+			reg = <0x0 0x55a00000 0x0 0x10000>;
+			no-map;
+		};
+
+		pil_ipa_gsi_mem: memory@55a10000 {
+			reg = <0x0 0x55a10000 0x0 0x5000>;
+			no-map;
+		};
+
+		pil_gpu_mem: memory@fa400000 {
+			reg = <0x0 0xfa400000 0x0 0x2000>;
+			no-map;
+		};
+
+		ramoops@64000000 {
+			compatible = "ramoops";
+			no-map;
+			reg = <0x0 0x64000000 0x0 0x400000>;
+			record-size = <0x100000>;
+			console-size = <0x100000>;
+			pmsg-size = <0x200000>;
+			ecc-size = <16>;
+		};
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&dispcc {
+	/* Prevent simplefb from dying until we wire panel driver */
+	status = "disabled";
+};
+
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+
+	lm36923_bl: led-controller@36 {
+		compatible = "ti,lm36923";
+		reg = <0x36>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&lm3692x_bl_active>;
+
+		enable-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+		ti,ovp-microvolt = <29000000>;
+		/* Backlight controllers can differ between panel variants */
+		status = "disabled";
+
+		led_backlight: led@0 {
+			reg = <0>;
+			function = LED_FUNCTION_BACKLIGHT;
+			color = <LED_COLOR_ID_WHITE>;
+			label = ":backlight";
+			linux,default-trigger = "backlight";
+			led-max-microamp = <25000>;
+		};
+	};
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm6125_l18>;
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+};
+
+&pm6125_gpios {
+	vol_up_n: vol-up-n-state {
+		pins = "gpio5";
+		function = "normal";
+		power-source = <0>;
+		bias-pull-up;
+		input-enable;
+	};
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	status = "okay";
+};
+
+&rpm_requests {
+	regulators-0 {
+		compatible = "qcom,rpm-pm6125-regulators";
+
+		pm6125_s6: s6 {
+			regulator-min-microvolt = <304000>;
+			regulator-max-microvolt = <1456000>;
+		};
+
+		pm6125_s7: s7 {
+			regulator-min-microvolt = <1280000>;
+			regulator-max-microvolt = <2080000>;
+		};
+
+		pm6125_s8: s8 {
+			regulator-min-microvolt = <1064000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm6125_l1: l1 {
+			regulator-min-microvolt = <952000>;
+			regulator-max-microvolt = <1152000>;
+		};
+
+		pm6125_l4: l4 {
+			regulator-min-microvolt = <488000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm6125_l5: l5 {
+			regulator-min-microvolt = <1648000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-allow-set-load;
+
+			regulator-always-on;
+		};
+
+		pm6125_l6: l6 {
+			regulator-min-microvolt = <576000>;
+			regulator-max-microvolt = <656000>;
+		};
+
+		pm6125_l7: l7 {
+			/* sdhci2 vdd-io-bias supply */
+			regulator-min-microvolt = <1256000>;
+			regulator-max-microvolt = <1256000>;
+
+			regulator-always-on;
+		};
+
+		pm6125_l8: l8 {
+			regulator-min-microvolt = <400000>;
+			regulator-max-microvolt = <728000>;
+		};
+
+		pm6125_l9: l9 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2000000>;
+		};
+
+		pm6125_l10: l10 {
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <1904000>;
+		};
+
+		pm6125_l11: l11 {
+			regulator-min-microvolt = <1768000>;
+			regulator-max-microvolt = <1952000>;
+		};
+
+		pm6125_l12: l12 {
+			regulator-min-microvolt = <1624000>;
+			regulator-max-microvolt = <1984000>;
+		};
+
+		pm6125_l13: l13 {
+			regulator-min-microvolt = <1504000>;
+			regulator-max-microvolt = <1952000>;
+		};
+
+		pm6125_l14: l14 {
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <1904000>;
+		};
+
+		pm6125_l15: l15 {
+			regulator-min-microvolt = <2920000>;
+			regulator-max-microvolt = <3232000>;
+		};
+
+		pm6125_l16: l16 {
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <1904000>;
+		};
+
+		pm6125_l17: l17 {
+			regulator-min-microvolt = <1152000>;
+			regulator-max-microvolt = <1384000>;
+		};
+
+		pm6125_l18: l18 {
+			regulator-min-microvolt = <1232000>;
+			regulator-max-microvolt = <1232000>;
+		};
+
+		pm6125_l19: l19 {
+			regulator-min-microvolt = <1624000>;
+			regulator-max-microvolt = <3304000>;
+		};
+
+		pm6125_l20: l20 {
+			regulator-min-microvolt = <1624000>;
+			regulator-max-microvolt = <3304000>;
+		};
+
+		pm6125_l21: l21 {
+			regulator-min-microvolt = <2400000>;
+			regulator-max-microvolt = <3600000>;
+		};
+
+		pm6125_l22: l22 {
+			regulator-min-microvolt = <2952000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-allow-set-load;
+
+			regulator-always-on;
+		};
+
+		pm6125_l23: l23 {
+			regulator-min-microvolt = <3200000>;
+			regulator-max-microvolt = <3400000>;
+		};
+
+		pm6125_l24: l24 {
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <3600000>;
+		};
+	};
+};
+
+&sdhc_2 {
+	cd-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_state_on>, <&sdc2_cd_on>;
+	pinctrl-1 = <&sdc2_state_off>, <&sdc2_cd_off>;
+	vmmc-supply = <&pm6125_l22>;
+	vqmmc-supply = <&pm6125_l5>;
+	/* No binding for vdd-io-bias on L7*/
+	no-sdio;
+	no-mmc;
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32764>;
+};
+
+&spi2 {
+	status = "okay";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <0 4>,<14 4>;
+
+	sdc2_cd_on: sdc2-cd-on-state {
+		pins = "gpio88";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	sdc2_cd_off: sdc2-cd-off-state	{
+		pins = "gpio88";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	lm3692x_bl_active: lm3692x-active-state {
+		pins = "gpio99";
+		function = "gpio";
+		drive-strength = <0x02>;
+		bias-pull-up;
+	};
+
+	mdss_dsi_active: mdss-dsi-active-state {
+		pins = "gpio85";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	te_active: te-active-state {
+		pins = "gpio81";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};
+
+&ufs_mem_hc {
+	vcc-supply = <&pm6125_l24>;
+	vcc-max-microamp = <600000>;
+	vccq2-supply = <&pm6125_l11>;
+	vccq2-max-microamp = <600000>;
+	vdd-hba-supply = <&pm6125_l18>;
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&pm6125_l4>;
+	vdda-pll-supply = <&pm6125_l12>;
+	status = "okay";
+};
+
+&usb {
+	qcom,select-utmi-as-pipe-clk;
+	status = "okay";
+};
+
+&usb_dwc3 {
+	maximum-speed = "high-speed";
+	dr_mode = "peripheral";
+	/delete-property/ usb-role-switch;
+	phys = <&usb_hsphy>;
+	phy-names = "usb2-phy";
+	ports {
+		/delete-node/ port@1;
+	};
+};
+
+&usb_hsphy {
+	vdd-supply = <&pm6125_l4>;
+	vdda-pll-supply = <&pm6125_l12>;
+	vdda-phy-dpdm-supply = <&pm6125_l15>;
+	status = "okay";
+};
+
+/delete-node/ &usb_qmpphy;
+
+&xo_board {
+	clock-frequency = <19200000>;
+};

-- 
2.55.0

