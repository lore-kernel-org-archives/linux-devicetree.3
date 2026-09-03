Received: from hqu.edu.cn (hqu.edu.cn [210.34.240.11])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE414313545
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 08:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.34.240.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425471; cv=none; b=etAORMBxoK3mSvg/c0ByEsWhV2Wub5b69vW3IabLPw7TG35scBmOyXzoKbiSx4jKHCnoQOAMw+jqrf40Wsv0VEIMBAjYt3agylX2Yk+JWKTQXAIkbhWgmKobHjL/768D9bGJNj91aqutvA33LrR6fIaYlL3aVNIbux0rPeQGk0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425471; c=relaxed/simple;
	bh=REtZ/AeA8lhZ4OXxkmAsDKynWgR6rzfHN+iwGu4Hm6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EpLGjTkSXli5n6RryE7G3F8gQd2x++O7jdn97TNIjiqPoQfCcF/GiPd93BAMZer0AhtbzpoWhlFJYhIpns9gqFUMC9GYG+K49SDPID7ZV8EdRqzbnp3zVZmchCHVBbfXRaSywltGBHYUZiM1oO3c5Tb4z/ojuCYLBZi94siSn70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stu.hqu.edu.cn; spf=pass smtp.mailfrom=stu.hqu.edu.cn; arc=none smtp.client-ip=210.34.240.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stu.hqu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.hqu.edu.cn
Received: from [127.0.1.1] (unknown [27.42.228.181])
	by cmweb (Coremail) with SMTP id C_Ai0gAnidjtNJlqIyYHAA--.14117S4;
	Thu, 03 Sep 2026 16:50:58 +0800 (CST)
From: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
Date: Thu, 03 Sep 2026 16:50:51 +0800
Subject: [PATCH v2 2/2] arm64: dts: amlogic: add Xiaomi Mi Box 4 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-mibox4-dt-v2-2-fbe7c04472a7@stu.hqu.edu.cn>
References: <20260903-mibox4-dt-v2-0-fbe7c04472a7@stu.hqu.edu.cn>
In-Reply-To: <20260903-mibox4-dt-v2-0-fbe7c04472a7@stu.hqu.edu.cn>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8605;
 i=raspberrykan@stu.hqu.edu.cn; h=from:subject:message-id;
 bh=REtZ/AeA8lhZ4OXxkmAsDKynWgR6rzfHN+iwGu4Hm6k=;
 b=owEBbQKS/ZANAwAKAZoNcluxItUHAcsmYgBqmTTuj5ghSPyfDyiGUGCQ1f2t6RdBWjDI/YLZs
 Q7w6LpvSFOJAjMEAAEKAB0WIQTDd02egjFwFlgfDD2aDXJbsSLVBwUCapk07gAKCRCaDXJbsSLV
 B88eD/9Hn2zQ8R2vBXgt0RYAVxjd7OE2cRgcZDeH72opewj8nf6qtqxuyQgNCTry/Qm5jC85Z7/
 yXRq8tF0xfI23KaxbmDAt5zbRNFZclkg5MBaBg7FqGAIYzb6nmsilT27j2mkLsrqFy5uoqkIdiN
 ftucVSpGkPUpey65X1WyfBvrgfnpP/3zT7W/2Iakt153N+ECosouvzM617hY6AE1g5Yhs2ifuIT
 R6Mbj88TdFOmbb1ZiuPv8EB6XyUcwL0hfUfrvdWb6Cj6G+fHnBFhBjRRplTNuTjT+5zk+ggv3ya
 AOdsdXQHk7I9Cvn1joBoZIVZ1i8kMstSfy1aCzedXzArUKKBKzwOWndiuPdRCmPoB7RsuyrTB7c
 h0GgHbzgMkzWQLUiTLNubq4wWqgc5y/CFJgyTVfoTwNwFk8CA6UcqQh/haAf60WJDLnLk9QRGeC
 hS/kx3+yOtO2AjF+Gv4UxJs20oxr+BRhYZWkfLJx+nG6nzCp3sIPw5trValT7Qi+8jJbBjHUPzs
 R8IU0COJsEr1sW8ZAfghSTagJ9xdBxTsLGFDBhhL9QB6t+kvpXk8YcuKp3BktlDBAF40s9Bae3m
 uSL23P2ENkLxcBPUO/ksYqeIcTH971KX6F4MhV5ggLkbB8mG4ksVK5JxMvm6dAZcW/n1mHqyXGj
 6XHQVgvXWGiAHpw==
X-Developer-Key: i=raspberrykan@stu.hqu.edu.cn; a=openpgp;
 fpr=C3774D9E82317016581F0C3D9A0D725BB122D507
X-CM-TRANSID:C_Ai0gAnidjtNJlqIyYHAA--.14117S4
X-Coremail-Antispam: 1UD129KBjvJXoWxtw13GFW5ur4kWF1Uur1UGFg_yoW3Kr45pF
	n7Crs5GFWfZryjk345Z3yIyFs5Gw1kCFZ7CrnrWFyrCrWv9Fyqk34xtr93ZFn5Wrs7Xw43
	JrWDAry7tF1ag3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
	8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
	Ja73UjIFyTuYvjfUjpnQUUUUU
X-CM-SenderInfo: ysvskiyqsqlko6vw3hxktxhvlgxou0/1tbiAQASBGqYO2MCOAAFsC

Add initial device tree support for the Xiaomi Mi Box 4
(MDZ-21-AA), based on the Amlogic S905L SoC.

Enable the main on-board peripherals including eMMC, Wi-Fi,
HDMI, CEC, USB, IR, audio, power LED, GPU and video decoder.

Signed-off-by: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
---
 arch/arm64/boot/dts/amlogic/Makefile              |   1 +
 arch/arm64/boot/dts/amlogic/meson-gxlx-mibox4.dts | 339 ++++++++++++++++++++++
 2 files changed, 340 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 57bc440fa55c..9f357df5fc54 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -72,6 +72,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-vero4k.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxlx-s905l-p271.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxlx-mibox4.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-gt1-ultimate.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-khadas-vim2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-mecool-kiii-pro.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxlx-mibox4.dts b/arch/arm64/boot/dts/amlogic/meson-gxlx-mibox4.dts
new file mode 100644
index 000000000000..e715eae823fe
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxlx-mibox4.dts
@@ -0,0 +1,339 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+// Copyright (c) 2026 YuChia-Kan <mail@raspberrykan.dev>
+
+/dts-v1/;
+
+#include "meson-gxl-s905x.dtsi"
+
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/sound/meson-aiu.h>
+
+/ {
+	compatible = "xiaomi,mibox4", "amlogic,s905l", "amlogic,meson-gxlx";
+	model = "Xiaomi Mi Box 4 (MDZ-21-AA)";
+
+	aliases {
+		serial0 = &uart_AO;
+		mmc0 = &sd_emmc_c;
+		mmc1 = &sd_emmc_a;
+		/delete-property/ mmc2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	av_mute: analog-audio-mute {
+		compatible = "simple-audio-amplifier";
+		sound-name-prefix = "AV";
+		enable-gpios = <&gpio GPIOH_5 GPIO_ACTIVE_HIGH>;
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x80000000>;
+	};
+
+	hdmi_connector: hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_tx_tmds_out>;
+			};
+		};
+	};
+
+	cvbs_connector: cvbs-connector {
+		compatible = "composite-video-connector";
+
+		port {
+			cvbs_connector_in: endpoint {
+				remote-endpoint = <&cvbs_vdac_out>;
+			};
+		};
+	};
+
+	hdmi_usb_5v: regulator-hdmi-usb-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "HDMI_USB_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vddio_boot: regulator-vddio-boot {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_BOOT";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	vddao_3v3: regulator-vddao-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDAO_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	vddio_ao18: regulator-vddio-ao18 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_AO18";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	vcc_3v3: regulator-vcc-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	emmc_pwrseq: emmc-pwrseq {
+		compatible = "mmc-pwrseq-emmc";
+		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
+	};
+
+	wifi32k: wifi32k {
+		compatible = "pwm-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		pwms = <&pwm_ef 0 30518 0>;
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio GPIOX_9 GPIO_ACTIVE_LOW>;
+		clocks = <&wifi32k>;
+		clock-names = "ext_clock";
+		post-power-on-delay-ms = <200>;
+	};
+
+	leds: leds {
+		compatible = "gpio-leds";
+
+		power_led: power-led {
+			color = <LED_COLOR_ID_WHITE>;
+			function = LED_FUNCTION_POWER;
+			gpios = <&gpio GPIOX_6 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "Xiaomi-Mi-Box-4";
+		audio-aux-devs = <&av_mute>;
+		audio-widgets = "Line", "Lineout";
+		audio-routing = "AV INL", "ACODEC LOLN",
+				"AV INR", "ACODEC LORN",
+				"Lineout", "AV OUTL",
+				"Lineout", "AV OUTR";
+
+		clocks = <&clkc CLKID_MPLL0>,
+			 <&clkc CLKID_MPLL1>,
+			 <&clkc CLKID_MPLL2>;
+		assigned-clocks = <&clkc CLKID_MPLL0>,
+				  <&clkc CLKID_MPLL1>,
+				  <&clkc CLKID_MPLL2>;
+		assigned-clock-rates = <294912000>, <270950400>, <393216000>;
+
+		dai-link-0 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
+		};
+
+		dai-link-1 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
+			dai-format = "i2s";
+			mclk-fs = <256>;
+
+			codec-0 {
+				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
+			};
+
+			codec-1 {
+				sound-dai = <&aiu AIU_ACODEC CTRL_I2S>;
+			};
+		};
+
+		dai-link-2 {
+			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
+
+			codec-0 {
+				sound-dai = <&hdmi_tx>;
+			};
+		};
+
+		dai-link-3 {
+			sound-dai = <&aiu AIU_ACODEC CTRL_OUT>;
+
+			codec-0 {
+				sound-dai = <&acodec>;
+			};
+		};
+	};
+};
+
+&acodec {
+	AVDD-supply = <&vddio_ao18>;
+	status = "okay";
+};
+
+&aiu {
+	status = "okay";
+};
+
+&cec_AO {
+	status = "okay";
+	pinctrl-0 = <&ao_cec_pins>;
+	pinctrl-names = "default";
+	hdmi-phandle = <&hdmi_tx>;
+};
+
+&cvbs_vdac_port {
+	cvbs_vdac_out: endpoint {
+		remote-endpoint = <&cvbs_connector_in>;
+	};
+};
+
+/*
+ * The Mi Box 4 uses a custom efuse layout extracted from the
+ * original firmware.
+ */
+
+/delete-node/ &eth_mac;
+/delete-node/ &sn;
+/delete-node/ &bid;
+
+&efuse {
+	eth_mac: mac-address@0 {
+		reg = <0x00 0x06>;
+	};
+
+	bt_mac: mac-address@6 {
+		reg = <0x06 0x06>;
+	};
+
+	wifi_mac: mac-address@c {
+		reg = <0x0c 0x06>;
+	};
+
+	usid: serial-number@12 {
+		reg = <0x12 0x10>;
+	};
+};
+
+&ethmac {
+	status = "disabled";
+};
+
+&hdmi_tx {
+	status = "okay";
+	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
+	pinctrl-names = "default";
+	hdmi-supply = <&hdmi_usb_5v>;
+};
+
+&hdmi_tx_tmds_port {
+	hdmi_tx_tmds_out: endpoint {
+		remote-endpoint = <&hdmi_connector_in>;
+	};
+};
+
+&ir {
+	status = "okay";
+	pinctrl-0 = <&remote_input_ao_pins>;
+	pinctrl-names = "default";
+};
+
+&pwm_ef {
+	status = "okay";
+	pinctrl-0 = <&pwm_e_pins>;
+	pinctrl-names = "default";
+};
+
+&saradc {
+	compatible = "amlogic,meson-gxlx-saradc", "amlogic,meson-saradc";
+	status = "okay";
+	vref-supply = <&vddio_ao18>;
+};
+
+&sd_emmc_a {
+	status = "okay";
+	pinctrl-0 = <&sdio_pins>;
+	pinctrl-1 = <&sdio_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	max-frequency = <50000000>;
+	non-removable;
+	no-mmc;
+	no-sd;
+	disable-wp;
+	keep-power-in-suspend;
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	vmmc-supply = <&vddao_3v3>;
+	vqmmc-supply = <&vddio_boot>;
+
+	rtl8723ds: wifi@1 {
+		reg = <1>;
+		nvmem-cells = <&wifi_mac>;
+		nvmem-cell-names = "mac-address";
+		interrupt-parent = <&gpio_intc>;
+		interrupts = <GPIOX_7 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "host-wake";
+	};
+};
+
+&sd_emmc_b {
+	status = "disabled";
+};
+
+&sd_emmc_c {
+	status = "okay";
+	pinctrl-0 = <&emmc_pins>, <&emmc_ds_pins>;
+	pinctrl-1 = <&emmc_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	max-frequency = <100000000>;
+	non-removable;
+	disable-wp;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	mmc-pwrseq = <&emmc_pwrseq>;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vddio_boot>;
+};
+
+&uart_AO {
+	status = "okay";
+	pinctrl-0 = <&uart_ao_a_pins>;
+	pinctrl-names = "default";
+};
+
+&usb {
+	status = "okay";
+	dr_mode = "host";
+};
+
+&usb2_phy0 {
+	phy-supply = <&hdmi_usb_5v>;
+};
+
+&vdec {
+	compatible = "amlogic,gxlx-vdec", "amlogic,gx-vdec";
+};

-- 
2.53.0

