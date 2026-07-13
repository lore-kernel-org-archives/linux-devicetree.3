Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CF935E1A4
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 20:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783974653; cv=none; b=P+c02D9jP293yWUlNT0bnuh2LJNtvt0NOSnB5TJTZT1JHGii91uzxZZqbLUEPoj7aL5FC5nk3zXhgWloTkQdnYcyhUW+ynFlfLh2lEYmK1talHOUejXHe9ofy9VhPO49Oyyl39amUnKrCv4OlUNeqigCp3nuxJxTKmolrCNgd3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783974653; c=relaxed/simple;
	bh=zYDd1VIwjG9zHV7YV5mJEvcz8Z+9ssbiTCyPwYlA1ME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W83KrmMvajLT2al1q9tkApRtUrahFmiS/JRYSEEjbUn/32wjnRmEo61bEZt805Jxij+8UoCaugFaTpspfYTRzuOY/FVl4oX7biuH7ehtZgSO+Vjr0ZYt6xjm1llwY8BBEXqcCJY9Gg/o5Phps7tygjI7oIEKZm1DlEywy21ruAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s3DNs/vC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s3DNs/vC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6FA3EC2BD05;
	Mon, 13 Jul 2026 20:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783974653;
	bh=zYDd1VIwjG9zHV7YV5mJEvcz8Z+9ssbiTCyPwYlA1ME=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=s3DNs/vC3Qc3EvkV33XFM0yIuRSkR67nlbqAfZj0b5ap7Aqmn386Yu3MTpASp+hcy
	 oX/qLgR6a8fMsdHlQ8R+W/POTN20X6O9UE8gwHPy03EubxzRFMTMVuKrWpqIo3FzLF
	 Kh44JshBVESla7goh6LhFDxogsCXcx2qcEQ5pzmRHmkCZ7SR/v/de1hQTL770OpSnl
	 ah8vvt4aEQL5+nB1rczgAIGK02Ylv5iLEsHVNjAVcExL3RH3epd8wxhltdjmWAAuFJ
	 D0rJous5BnObjNGfac7mJ0x/Zihs+k7i7BNhblxiVivkQwzbgWEKcGW0zpzHrMAtFL
	 f3eYZtC8Bkeow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 581F0C43458;
	Mon, 13 Jul 2026 20:30:53 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Mon, 13 Jul 2026 22:30:16 +0200
Subject: [PATCH v3 12/12] arm64: dts: rockchip: add support for NanoPi M6
 board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-nanopi-m6-v3-12-227567ffc5dc@gmail.com>
References: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
In-Reply-To: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783974651; l=6501;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=SjL4719aLyU18eG8vR709tUkc793I/xk1JBZuO7TxZo=;
 b=pru9ML2k6lArrHIpEVcRezD91V3T+i+Je6UcnJXp9v/LGhYn4lJp47VgiVnzbX5+l43jmyZdM
 N6wCbHb8RhtCxTMBRPwDzmzlIBz0UofdYckDJ5GyAdExydEtvx+ALhu
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

From: Joachim Eastwood <joachim.eastwood@gmail.com>

The NanoPi M6 (V1) board shares most of the features of the R6 boards.

Main differences:
* M.2 M-key slot with PCIe (Also present on R6C)
* M.2 E-key slot with PCIe and USB (from hub)
* 1 additional USB 2.0 port from an on-board USB hub
* RT5616 audio CODEC

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi | 142 +++++++++++++++++++++
 .../boot/dts/rockchip/rk3588s-nanopi-m6v1.dts      |  67 ++++++++++
 3 files changed, 210 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 761d82b4f4f2..55a1ec8309df 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -218,6 +218,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-evb1-v10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-gameforce-ace.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-indiedroid-nova.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-khadas-edge2.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-nanopi-m6v1.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-nanopi-r6s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-nanopi-r6c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-odroid-m2.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
new file mode 100644
index 000000000000..bb2ef1f66d2a
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+#include "rk3588s-nanopi.dtsi"
+
+/ {
+	adc-keys-1 {
+		compatible = "adc-keys";
+		io-channels = <&saradc 1>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+		poll-interval = <100>;
+
+		button-maskrom {
+			label = "Recovery";
+			linux,code = <KEY_VENDOR>;
+			press-threshold-microvolt = <1800>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		sys_led: led-0 {
+			label = "sys_led";
+			gpios = <&gpio1 RK_PA4 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			pinctrl-names = "default";
+			pinctrl-0 = <&sys_led_pin>;
+		};
+
+		user_led: led-1 {
+			label = "user_led";
+			gpios = <&gpio1 RK_PA6 GPIO_ACTIVE_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&user_led_pin>;
+		};
+	};
+
+	vcc_3v3_pcie: regulator-vcc-3v3-pcie {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio3 RK_PC6 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pcie2_2_pwren>;
+		regulator-name = "vcc_3v3_pcie";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc5v0_usb_otg0: regulator-vcc5v0-usb-otg0 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio3 RK_PD4 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&typec5v_pwren>;
+		regulator-name = "vcc5v0_usb_otg0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vdd_mpcie_3v3: regulator-vdd-mpcie-3v3 {
+		compatible = "regulator-fixed";
+		/* Controlled by EXT_EN on RK806 */
+		regulator-name = "vdd_mpcie_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+};
+
+&i2c7 {
+	clock-frequency = <200000>;
+	status = "okay";
+};
+
+&i2s0_8ch {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2s0_lrck
+		     &i2s0_mclk
+		     &i2s0_sclk
+		     &i2s0_sdi0
+		     &i2s0_sdo0>;
+	status = "okay";
+};
+
+&pcie2x1l1 { /* M.2 E-key 2230 */
+	vpcie3v3-supply = <&vdd_mpcie_3v3>;
+};
+
+&pcie2x1l2 { /* M.2 M-key 2280 */
+	pinctrl-0 = <&pcie2_2_rst>, <&pcie20x1m0_clkreqn>, <&pcie20x1m0_waken>;
+	vpcie3v3-supply = <&vcc_3v3_pcie>;
+};
+
+&pinctrl {
+	gpio-leds {
+		sys_led_pin: sys-led-pin {
+			rockchip,pins = <1 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		user_led_pin: user-led-pin {
+			rockchip,pins = <1 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	headphone {
+		hp_det: hp-det {
+			rockchip,pins = <1 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	pcie {
+		pcie2_2_pwren: pcie2-2-pwren {
+			rockchip,pins = <3 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	usb {
+		typec5v_pwren: typec5v-pwren {
+			rockchip,pins = <3 RK_PD4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&u2phy3 {
+	status = "okay";
+};
+
+&u2phy3_host {
+	phy-supply = <&vcc5v0_host_20>;
+	status = "okay";
+};
+
+&usb_host1_ehci {
+	status = "okay";
+};
+
+&usb_host1_ohci {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6v1.dts b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6v1.dts
new file mode 100644
index 000000000000..f981973c96ac
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6v1.dts
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include "rk3588s-nanopi-m6.dtsi"
+
+/ {
+	model = "FriendlyElec NanoPi M6";
+	compatible = "friendlyarm,nanopi-m6", "rockchip,rk3588s";
+
+	sound {
+		compatible = "simple-audio-card";
+		pinctrl-names = "default";
+		pinctrl-0 = <&hp_det>;
+
+		simple-audio-card,name = "realtek,rt5616-codec";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,mclk-fs = <256>;
+
+		simple-audio-card,hp-det-gpios = <&gpio1 RK_PC4 GPIO_ACTIVE_LOW>;
+
+		simple-audio-card,widgets =
+			"Headphone", "Headphones",
+			"Microphone", "Microphone Jack";
+		simple-audio-card,routing =
+			"Headphones", "HPOL",
+			"Headphones", "HPOR",
+			"MIC1", "Microphone Jack",
+			"Microphone Jack", "micbias1";
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s0_8ch>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&rt5616>;
+		};
+	};
+};
+
+&i2c7 {
+	rt5616: codec@1b {
+		compatible = "realtek,rt5616";
+		reg = <0x1b>;
+		clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
+		assigned-clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
+		assigned-clock-rates = <12288000>;
+
+		port {
+			rt5616_p0: endpoint {
+				remote-endpoint = <&i2s0_8ch_p0>;
+			};
+		};
+	};
+};
+
+&i2s0_8ch {
+	port {
+		i2s0_8ch_p0: endpoint {
+			dai-format = "i2s";
+			mclk-fs = <256>;
+			remote-endpoint = <&rt5616_p0>;
+		};
+	};
+};

-- 
2.55.0


