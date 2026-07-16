Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CB93D5666;
	Thu, 16 Jul 2026 08:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784190198; cv=none; b=hVDSsMObDCYWKHwgteGGdrZZy3xyhLH9yVhvvUC6a+NoIIGYK2jsZsWkOv+gQPf91z8lVrFUMcdtvoSe8gDz0kxCcskLUIY3XcnCesOlqPhRonHSNJvwPacKeIgTYE4VXGJ3Z0zS1BRaM4ozRotwqx1qdsXhUekesiZSyWtnWlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784190198; c=relaxed/simple;
	bh=Yn/1Bm5HM4MPAnOrHrq8HLS6iKp1WULinIE9lJdfgNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RpK0KJTp8GQ+3LDkOp/KGsFz/FCqNM//YGD6xAayiQtESKVwozcF3NvsuROrGrcsf4Y3IAkvBrvKyEhPsJGNdAU95omfbIiYjmE4c3FDvlqIGUe5I/qiKmAy7t83cqk3ACw2gMgjPsFp97f/6ymY2GTB9y4VT6MkZ5ipHeLHO4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zn+PDKjL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zn+PDKjL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 915081F00A3A;
	Thu, 16 Jul 2026 08:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784190196;
	bh=UM9tDCaKUcQy0Gvyw92jxN5IAwo5J0uc5g7goLFX5QE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zn+PDKjLz7lxcU8ei7AmTEQptUaJqmelLKr7a7Rtk4XnUgxD35jrYIaYhTth6TWsK
	 QQW/kWv19KSGf5RzGs3xouaHuIZShXDQuxquiGpFHJqaXFg6ie4tAFcsouScQZWpBT
	 X/FrwFotZzydCfuJBo9ebteAGduXSLbrUe6ShbFrB5rgnF1trXZEziK3Cm3as5UM1T
	 hKSb2cbZ5Br+0BzvObDEnqsUTXp7pm+WArqf1YOzY/lLZeMheKz4sz2qbhg7Oeuws5
	 oz5+RSEIod53yRq6VveIBiVHgLy1PjXxZIP7Du9Bwz9ihcrbkgbZRyw2VPXeS1og+f
	 RwaEuwcLj0scA==
Date: Thu, 16 Jul 2026 10:23:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jiaxing Hu <huhuvmb88@gmail.com>
Cc: linux-rockchip@lists.infradead.org, heiko@sntech.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO
Message-ID: <20260716-practical-reindeer-of-eternity-3cbac6@quoll>
References: <20260716012838.2353939-1-huhuvmb88@gmail.com>
 <20260716012838.2353939-3-huhuvmb88@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260716012838.2353939-3-huhuvmb88@gmail.com>

On Thu, Jul 16, 2026 at 01:28:38PM +1200, Jiaxing Hu wrote:
> +/*
> + * I2C0: ES8388 audio codec @ 0x10, FUSB302 USB-C PD controller @ 0x22.
> + * Pinctrl i2c0m1 (GPIO0 PC4 SCL / GPIO0 PC5 SDA).
> + */
> +&i2c0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c0m1_xfer>;
> +
> +	es8388: es8388@10 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

> +		#sound-dai-cells = <0>;

Please order properties according to DTS coding style.

> +		compatible = "everest,es8388", "everest,es8323";
> +		reg = <0x10>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&sai1m0_mclk>;
> +		status = "disabled";
> +	};
> +
> +	usbc0: fusb302@22 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

> +		compatible = "fcs,fusb302";
> +		reg = <0x22>;
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <RK_PB4 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usbc0_int>;
> +		vbus-supply = <&vcc_5v0_typec0>;
> +		status = "okay";

Why? Who disabled it?

> +
> +		port {
> +			usbc0_role_sw: endpoint {
> +				remote-endpoint = <&usb_drd0_role_switch>;
> +			};
> +		};
> +
> +		usb_con: connector {
> +			compatible = "usb-c-connector";
> +			label = "USB-C";
> +			data-role = "dual";
> +			power-role = "dual";
> +			try-power-role = "sink";
> +			op-sink-microwatt = <1000000>;
> +			sink-pdos =
> +				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
> +				 PDO_FIXED(9000, 3000, PDO_FIXED_USB_COMM)
> +				 PDO_FIXED(12000, 3000, PDO_FIXED_USB_COMM)>;
> +			source-pdos =
> +				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> +
> +			altmodes {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				altmode@0 {
> +					reg = <0>;
> +					svid = <0xff01>;
> +					vdo = <0xffffffff>;
> +				};
> +			};
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					usbc0_orien_sw: endpoint {
> +						remote-endpoint = <&usbdp_phy_orientation_switch>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					dp_altmode_mux: endpoint {
> +						remote-endpoint = <&usbdp_phy_dp_altmode_mux>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +/*
> + * PCIe 2.0 x1 M.2 slot. Reset GPIO2 PB1, power vcc_3v3_pcie (GPIO0 PC3).
> + */
> +&pcie0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie_reset>;
> +	reset-gpios = <&gpio2 RK_PB1 GPIO_ACTIVE_HIGH>;
> +	vpcie3v3-supply = <&vcc_3v3_pcie>;
> +	status = "okay";
> +};
> +
> +/* microSD card slot. */
> +&sdmmc {
> +	bus-width = <4>;
> +	cap-mmc-highspeed;
> +	cap-sd-highspeed;
> +	disable-wp;
> +	max-frequency = <200000000>;
> +	no-sdio;
> +	no-mmc;
> +	sd-uhs-sdr104;
> +	vmmc-supply = <&vcc_3v3_s3>;
> +	vqmmc-supply = <&vccio_sd_s0>;
> +	status = "okay";
> +};
> +
> +&u2phy0 {
> +	status = "okay";
> +};
> +
> +&u2phy0_otg {
> +	phy-supply = <&vcc_5v0_typec0>;
> +	status = "okay";
> +};
> +
> +&u2phy1 {
> +	status = "okay";
> +};
> +
> +&u2phy1_otg {
> +	phy-supply = <&vcc_5v0_usbhost>;
> +	status = "okay";
> +};
> +
> +/* Debug UART0 on the 40-pin header. */
> +&uart0 {
> +	pinctrl-0 = <&uart0m0_xfer>;
> +	status = "okay";
> +};
> +
> +/* USB DRD0: USB-C (USBDP SuperSpeed + USB2 HS), OTG with FUSB302 role-switch. */
> +&usb_drd0_dwc3 {
> +	dr_mode = "otg";
> +	usb-role-switch;
> +	status = "okay";
> +
> +	port {
> +		usb_drd0_role_switch: endpoint {
> +			remote-endpoint = <&usbc0_role_sw>;
> +		};
> +	};
> +};
> +
> +/* USB DRD1: USB-A ports behind the hub (combphy1 SuperSpeed + USB2 HS). */
> +&usb_drd1_dwc3 {
> +	dr_mode = "host";
> +	status = "okay";
> +};
> +
> +&usbdp_phy {
> +	status = "okay";
> +	orientation-switch;
> +	svid = <0xff01>;
> +	sbu1-dc-gpios = <&gpio4 RK_PC4 GPIO_ACTIVE_HIGH>;
> +	sbu2-dc-gpios = <&gpio4 RK_PC5 GPIO_ACTIVE_HIGH>;
> +
> +	port {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		usbdp_phy_orientation_switch: endpoint@0 {
> +			reg = <0>;
> +			remote-endpoint = <&usbc0_orien_sw>;
> +		};
> +
> +		usbdp_phy_dp_altmode_mux: endpoint@1 {
> +			reg = <1>;
> +			remote-endpoint = <&dp_altmode_mux>;
> +		};
> +	};
> +};
> +
> +&vop {
> +	status = "okay";
> +};
> +
> +&vop_mmu {
> +	status = "okay";
> +};
> +
> +&vp0 {
> +	vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
> +		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
> +		remote-endpoint = <&hdmi_in_vp0>;
> +	};
> +};
> +
> +&pinctrl {
> +	leds {
> +		/* GPIO2 PD0 - green carrier LED */
> +		led_green_en: led-green-en {
> +			rockchip,pins = <2 RK_PD0 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		/* GPIO2 PD1 - red carrier LED */
> +		led_red_en: led-red-en {
> +			rockchip,pins = <2 RK_PD1 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	pcie {
> +		/* GPIO0 PC3 - PCIe power enable */
> +		pcie_pwr_en: pcie-pwr-en {
> +			rockchip,pins = <0 RK_PC3 RK_FUNC_GPIO &pcfg_pull_down>;
> +		};
> +		/* GPIO2 PB1 - PCIe PERST# */
> +		pcie_reset: pcie-reset {
> +			rockchip,pins = <2 RK_PB1 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +
> +	usb {
> +		/* GPIO4 PB0 - USB host 5V enable */
> +		usb_host_pwren: usb-host-pwren {
> +			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +		/* GPIO2 PB6 - USB OTG / Type-C 5V enable */
> +		usb_otg0_pwren: usb-otg0-pwren {
> +			rockchip,pins = <2 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +		/* GPIO0 PB4 - FUSB302 INT# (active-low) */
> +		usbc0_int: usbc0-int {
> +			rockchip,pins = <0 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi
> new file mode 100644
> index 000000000..983b3e72c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi
> @@ -0,0 +1,576 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * ArmSoM CM5 - Rockchip RK3576 compute module (Raspberry Pi CM4 form factor).
> + *
> + * Common to all CM5 carriers. The carrier .dts includes this file, sets the
> + * board model/compatible, and adds carrier-specific peripherals.
> + *
> + * On-module devices:
> + *   - RK806 PMIC on I2C1
> + *   - HYM8563 RTC on I2C2
> + *   - eMMC (SDHCI)
> + *   - GMAC0 + MotorComm YT8531 Gigabit Ethernet PHY (RGMII)
> + *   - SYN43752 WiFi 6 + BT 5.x (SDIO + UART4)
> + *
> + * Copyright (c) 2024 ArmSoM
> + * Copyright (c) 2026 Jiaxing Hu <huhuvmb88@gmail.com>
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include "rk3576.dtsi"
> +
> +/ {
> +	compatible = "armsom,cm5", "rockchip,rk3576";
> +
> +	vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_1v1_nldo_s3";
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-min-microvolt = <1100000>;
> +		regulator-max-microvolt = <1100000>;
> +		vin-supply = <&vcc_5v0_sys>;
> +	};
> +
> +	vcc_1v2_ufs_vccq_s0: regulator-vcc-1v2-ufs-vccq-s0 {

Unused, drop

> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_1v2_ufs_vccq_s0";
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +		vin-supply = <&vcc_5v0_sys>;
> +	};
> +
> +	vcc_1v8_s0: regulator-vcc-1v8-s0 {

Also unused, drop.

Drop all unused uncontrollable stubs which are not used by devices. They
are completely redundant and pointless.

> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_1v8_s0";
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vcc_1v8_s3>;
> +	};
> +
> +	vcc_1v8_ufs_vccq2_s0: regulator-vcc-1v8-ufs-vccq2-s0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_1v8_ufs_vccq2_s0";
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vcc_1v8_s3>;
> +	};
> +
> +	vcc_2v0_pldo_s3: regulator-vcc-2v0-pldo-s3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_2v0_pldo_s3";
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-min-microvolt = <2000000>;
> +		regulator-max-microvolt = <2000000>;
> +		vin-supply = <&vcc_5v0_sys>;
> +	};
> +
> +	vcc_3v3_s0: regulator-vcc-3v3-s0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_3v3_s0";
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vcc_3v3_s3>;
> +	};
> +
> +	vcc_3v3_ufs_s0: regulator-vcc-ufs-s0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_3v3_ufs_s0";
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vcc_5v0_sys>;
> +	};
> +
> +	/*
> +	 * WiFi power sequencer for SYN43752. Reset GPIO1 PC6 active-low,
> +	 * clock from the HYM8563 RTC oscillator.
> +	 */
> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		clocks = <&hym8563>;
> +		clock-names = "ext_clock";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wifi_poweren_gpio>;
> +		reset-gpios = <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&cpu_b0 {
> +	cpu-supply = <&vdd_cpu_big_s0>;
> +};
> +
> +&cpu_b1 {
> +	cpu-supply = <&vdd_cpu_big_s0>;
> +};
> +
> +&cpu_b2 {
> +	cpu-supply = <&vdd_cpu_big_s0>;
> +};
> +
> +&cpu_b3 {
> +	cpu-supply = <&vdd_cpu_big_s0>;
> +};
> +
> +&cpu_l0 {
> +	cpu-supply = <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_l1 {
> +	cpu-supply = <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_l2 {
> +	cpu-supply = <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_l3 {
> +	cpu-supply = <&vdd_cpu_lit_s0>;
> +};
> +
> +/*
> + * GMAC0 + on-module MotorComm YT8531 in rgmii-rxid mode (MAC TX delay 0x21,
> + * PHY does RX delay). The YT8531 has NO local crystal, so it relies on the
> + * SoC 25 MHz reference: clk_mac_refout (= REFCLKO25M_GMAC0_OUT) must be listed
> + * on the gmac node - dwmac-rk only enables/routes it when named here - and the
> + * ethm0_clk0_25m_out pin routes it to the pad. PHY reset via the MAC
> + * (snps,reset) so stmmac releases it before the MDIO scan.
> + */
> +&gmac0 {
> +	phy-mode = "rgmii-rxid";
> +	clock_in_out = "output";
> +	clocks = <&cru CLK_GMAC0_125M_SRC>, <&cru CLK_GMAC0_RMII_CRU>,
> +		 <&cru PCLK_GMAC0>, <&cru ACLK_GMAC0>,
> +		 <&cru CLK_GMAC0_PTP_REF>, <&cru REFCLKO25M_GMAC0_OUT>;
> +	clock-names = "stmmaceth", "clk_mac_ref", "pclk_mac", "aclk_mac",
> +		      "ptp_ref", "clk_mac_refout";
> +	tx_delay = <0x21>;
> +	rx_delay = <0x00>;
> +	phy-handle = <&rgmii_phy0>;
> +	phy-supply = <&vcc_3v3_s3>;
> +	snps,reset-gpios = <&gpio2 RK_PB3 GPIO_ACTIVE_LOW>;
> +	snps,reset-delays-us = <0 20000 100000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&eth0m0_miim
> +		     &eth0m0_tx_bus2
> +		     &eth0m0_rx_bus2
> +		     &eth0m0_rgmii_clk
> +		     &eth0m0_rgmii_bus
> +		     &ethm0_clk0_25m_out>;
> +	status = "okay";
> +};
> +
> +&gpu {
> +	mali-supply = <&vdd_gpu_s0>;
> +	status = "okay";
> +};
> +
> +/* I2C1: RK806 PMIC @ 0x23 (interrupt on GPIO0 PA6). */
> +&i2c1 {
> +	status = "okay";
> +
> +	pmic@23 {
> +		compatible = "rockchip,rk806";
> +		reg = <0x23>;
> +
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <RK_PA6 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pmic_pins>, <&rk806_dvs1_null>,
> +			    <&rk806_dvs2_null>, <&rk806_dvs3_null>;
> +
> +		system-power-controller;
> +
> +		vcc1-supply = <&vcc_5v0_sys>;
> +		vcc2-supply = <&vcc_5v0_sys>;
> +		vcc3-supply = <&vcc_5v0_sys>;
> +		vcc4-supply = <&vcc_5v0_sys>;
> +		vcc5-supply = <&vcc_5v0_sys>;
> +		vcc6-supply = <&vcc_5v0_sys>;
> +		vcc7-supply = <&vcc_5v0_sys>;
> +		vcc8-supply = <&vcc_5v0_sys>;
> +		vcc9-supply = <&vcc_5v0_sys>;
> +		vcc10-supply = <&vcc_5v0_sys>;
> +		vcc11-supply = <&vcc_2v0_pldo_s3>;
> +		vcc12-supply = <&vcc_5v0_sys>;
> +		vcc13-supply = <&vcc_1v1_nldo_s3>;
> +		vcc14-supply = <&vcc_1v1_nldo_s3>;
> +		vcca-supply = <&vcc_5v0_sys>;

If fusb302@22 was enabled (status=okay), then why isn't this one as
well? What sort of logic drives this?


> +
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		rk806_dvs1_null: dvs1-null-pins {
> +			pins = "gpio_pwrctrl1";
> +			function = "pin_fun0";
> +		};

Best regards,
Krzysztof

