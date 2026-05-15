Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30F8405C4C
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 23:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778887896; cv=none; b=VzbS9/gdvM/Hcng8vQ2O9HmsoRPbJGeuIBvNv7IgQrS2U2e4GlvkdxZNkNagJD/4qJKurtTJoJlVzzjUNU1W4PSyrWnCMgj5i656mouX2H1k96EsK1RyuL4pMPyRwF+pPsoWZdvvF2l27ee2uoPBBu0KvChPm+vg4+XkDagtJb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778887896; c=relaxed/simple;
	bh=8QXugiaz/XSCSSiDjWiAd+zQb0rx6SjLR2pobMbFGRA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GSQvGSKWK+1YpE+++p8VLxIFPu75wjN45Vsoe3hVFICEiTNNOVo5XukmwNxsKDntEIcbEQ1mmWf8XzOb8vW2Bc1yJcF6SR66z5KgEfc7fG7WsnxPj/EoRaPFjGZHN4OeCLkSpmFp8z7eu35QdOms//zH1kF7/qCUS/RWI8qpcD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qA1iueLc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qA1iueLc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0667FC2BCB0;
	Fri, 15 May 2026 23:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778887896;
	bh=8QXugiaz/XSCSSiDjWiAd+zQb0rx6SjLR2pobMbFGRA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=qA1iueLc18s1u2mUUYn6yr9kLq8oItymdqRD46Gd0Dwwb8nkaU1UtxQtRYxinGeuf
	 Sa2r/44Zx552vWKMv597mOPtNkT6zQyHAqRVxzEZ2BNe8k2Udae9UiBpA7DsKiBhcv
	 bvmAFzVR510fu8lLO0zYpVbrB9iUPelXtAF/Al3cYfp+x5FXrRn0RMZdZOxLVAhJ/8
	 WlL9LuEEaKgh+0WHTiZaE6dXfCWM9SR20K/VUKmtCwvcCFPp/aI113RCX+2LR0V/vQ
	 Kxql42oHo2qxbnwlrJZUrtfoEyl/Ki40gvg43rqH70SJKf2s0Cwkp2OPGn2rh4Wqxs
	 tEyarI5sDnYfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2 6/6] arm64: dts: rockchip: Add Anbernic RG Vita-Pro
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260515221947.299229-7-macroalpha82@gmail.com>
References: <20260515221947.299229-7-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 23:31:35 +0000
Message-Id: <20260515233136.0667FC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 12 potential issue=
(s) to consider:
- [High] Missing DTB source files for unrelated Makefile additions.
- [High] Undefined `&pmic_pins` phandle causes compilation failure.
- [High] PCIe reset GPIO polarity is incorrectly configured as active-high.
- [High] Bluetooth GPIO pins are mismatched with their pinctrl definitions.
- [High] Hardware description contradicts the commit message regarding the =
Bluetooth module.
- [High] Battery charge current is dangerously high and capacity contradict=
s the commit message.
- [Medium] SPI bus lacks a child device node, breaking userspace joystick c=
ontrol.
- [Medium] Incorrect `pinctrl` assignment for the `&sdio` controller.
- [Medium] Contradictory regulator states defined for `vdd_cpu_lit_s0` and =
`vdd_gpu_s0`.
- [Medium] Misplaced `vbus-supply` property in the Type-C Port Controller n=
ode.
- [Medium] LCD panel supply regulator is incorrectly marked as always-on.
- [Low] Undocumented enablement of HDMI components.
--

commit f6eae2256befc6eb3871393bb039d8a06e21e7b0
Author: Chris Morgan <macromorgan@hotmail.com>

arm64: dts: rockchip: Add Anbernic RG Vita-Pro

This commit adds the device tree for the Anbernic RG Vita-Pro, based on the
Rockchip RK3576. It includes support for the display, buttons, joysticks,
LEDs, eMMC, SDMMC, WiFi/Bluetooth, and battery.

>     The Anbernic RG Vita-Pro includes the following hardware:
[ ... ]
>      - RTL8852BE WiFi/Bluetooth combo

The commit message claims the device uses an RTL8852BE Wi-Fi/Bluetooth comb=
o,
which interfaces Bluetooth over USB. However, the device tree defines a
realtek,rtl8822cs-bt compatible string under a UART interface (&uart6).

Does this hardware mismatch cause the probe to fail?

>      - 5000mAH battery

The commit message specifies a 5000mAh battery, but the device tree specifi=
es
a charge-full-design-microamp-hours of 8000000 (8000mAh).

Additionally, the commit message completely omits HDMI from its detailed li=
st
of hardware, but the device tree enables HDMI components (hdmi, hdptxphy,
and hdmi-con). Is the commit message missing this hardware description, or
is this leftover code?

> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/=
rockchip/Makefile
> index cb55c6b70d0e5..78c3778eaf4e7 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
[ ... ]
> @@ -215,6 +216,8 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-coolpi-4b.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-evb1-v10.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-gameforce-ace.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-indiedroid-nova.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-indiedroid-nova-tower.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-indiedroid-nova-test.dtb

The .dts source files for these two additions are missing from the patch.
Will this cause the kernel build to fail when make dtbs is executed?

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts=
 b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
> new file mode 100644
> index 0000000000000..e0a90719bdcaf
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
[ ... ]
> +	battery: battery {
> +		compatible =3D "simple-battery";
> +		charge-full-design-microamp-hours =3D <8000000>;
> +		charge-term-current-microamp =3D <300000>;
> +		constant-charge-current-max-microamp =3D <10000000>;

The constant-charge-current-max-microamp is set to 10 Amps (10000000). Does
this exceed the physical limits of the hardware and pose a safety risk for a
handheld single-cell battery?

[ ... ]
> +	vdd_lcd: regulator-vdd-lcd {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vdd_lcd";
> +		regulator-always-on;

By marking this regulator as always-on, the panel's power rail cannot be sh=
ut
down by the DRM/panel driver framework during screen blanking or system
suspend. Does this result in continuous unnecessary battery drain?

[ ... ]
> +	pmic@23 {
> +		compatible =3D "rockchip,rk806";
> +		reg =3D <0x23>;
> +		#gpio-cells =3D <2>;
> +		gpio-controller;
> +		interrupt-parent =3D <&gpio0>;
> +		interrupts =3D <RK_PA6 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pmic_pins
> +			     &rk806_dvs1_null

This pinctrl-0 property references &pmic_pins, but this node does not appear
to be defined in the .dts file. Will this missing definition cause a fatal
device tree compilation error?

[ ... ]
> +			vdd_cpu_lit_s0: dcdc-reg3 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <550000>;
> +				regulator-max-microvolt =3D <950000>;
> +				regulator-name =3D "vdd_cpu_lit_s0";
> +				regulator-ramp-delay =3D <12500>;
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-suspend-microvolt =3D <750000>;
> +				};
> +			};

Is it semantically valid to request a specific voltage level
(regulator-suspend-microvolt) during suspend for a regulator that is explic=
itly
commanded to shut off (regulator-off-in-suspend)? Can this lead to undefined
behavior in the PMIC framework?

[ ... ]
> +			vdd_gpu_s0: dcdc-reg5 {
> +				regulator-boot-on;
> +				regulator-enable-ramp-delay =3D <400>;
> +				regulator-min-microvolt =3D <550000>;
> +				regulator-max-microvolt =3D <900000>;
> +				regulator-name =3D "vdd_gpu_s0";
> +				regulator-ramp-delay =3D <12500>;
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-suspend-microvolt =3D <850000>;
> +				};
> +			};

Similarly, could this combination of regulator-off-in-suspend and
regulator-suspend-microvolt for the GPU regulator cause issues during suspe=
nd?

[ ... ]
> +	husb311: typec-portc@4e {
> +		compatible =3D "hynetek,husb311", "richtek,rt1711h";
> +		reg =3D <0x4e>;
> +		interrupt-parent =3D <&gpio0>;
> +		interrupts =3D <RK_PD1 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-0 =3D <&usbc_int>;
> +		pinctrl-names =3D "default";
> +		status =3D "okay";
> +		vbus-supply =3D <&vbus5v0_typec>;
> +
> +		connector {

According to standard USB Type-C bindings, shouldn't the vbus-supply proper=
ty
reside inside the connector child node? Will the TCPM framework fail to find
the VBUS regulator if it is placed in the root of the husb311 node, prevent=
ing
the device from supplying power in OTG mode?

[ ... ]
> +&pcie0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pcie0_perstn>;
> +	reset-gpios =3D <&gpio2 RK_PB4 GPIO_ACTIVE_HIGH>;

The PCIe specification dictates that the PERST# reset signal is active-low,
which is supported by the pcie0_perstn pin name. By configuring it as
active-high, will the PCIe controller invert the reset logic and permanently
hold the Wi-Fi card in reset, causing link training to fail?

[ ... ]
> +&sdio {
> +	bus-width =3D <4>;
> +	cap-mmc-highspeed;
> +	cap-sd-highspeed;
> +	disable-wp;
> +	max-frequency =3D <150000000>;
> +	no-mmc;
> +	no-sdio;
> +	pinctrl-0 =3D <&sdmmc1m0_bus4>, <&sdmmc1m0_clk>,
> +		    <&sdmmc1m0_cmd>, <&sdmmc1m0_det>;

The &sdio node configures its pins using sdmmc1m0 properties. Since the SDIO
controller is a distinct IP block from SDMMC1, does routing the SDIO block
through pins intended for another controller disconnect it from the physical
SD card slot?

[ ... ]
> +&spi1 {
> +	num-cs =3D <1>;
> +	pinctrl-0 =3D <&spi1m2_pins>, <&spi1m2_csn0>;
> +	status =3D "okay";
> +
> +	/* SPI controlled MCU for joystick and joystick LEDs. */
> +};

The &spi1 bus is enabled for userspace-controlled analog joysticks, but no
child device node (such as spidev or a dedicated driver compatible) is defi=
ned.
Since the Linux SPI core will not instantiate any devices on an empty bus, =
does
this completely prevent userspace from communicating with the microcontroll=
er?

[ ... ]
> +&uart6 {
> +	pinctrl-0 =3D <&uart6m1_xfer>, <&uart6m1_ctsn>, <&uart6m1_rtsn>;
> +	pinctrl-names =3D "default";
> +	uart-has-rtscts;
> +	status =3D "okay";
> +
> +	bluetooth {
> +		compatible =3D "realtek,rtl8822cs-bt";
> +		device-wake-gpios =3D <&gpio2 RK_PB6 GPIO_ACTIVE_HIGH>;
> +		enable-gpios =3D <&gpio2 RK_PB5 GPIO_ACTIVE_HIGH>;
> +		host-wake-gpios =3D <&gpio2 RK_PC1 GPIO_ACTIVE_HIGH>;

The enable-gpios is assigned to RK_PB5 and device-wake-gpios to RK_PB6.
However, the corresponding pinctrl configurations map RK_PB5 to bt_wake_gpio
and RK_PB6 to bt_reset_gpio.

Does this logical swap mean the driver will toggle the wake line when it
intends to reset the device, causing Bluetooth initialization to fail?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515221947.2992=
29-1-macroalpha82@gmail.com?part=3D6
