Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E8F145FE0
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 18:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779474114; cv=none; b=Cx3oELY5W0Q70Ap08pAKjh6MqsxnGoB3CREhdXU1Wj7lYnfTnqHt7gPeSjzUw1P6xo8gvjqr1nqTXaplngKu2k7GkccE7gqnZ8FXTYaiH6vMNHl5A5SDKbr4Q8/qxM8C31rSdlXcV1w0lW9WM1hWetthYOUzdDFDVnHD8rAaVZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779474114; c=relaxed/simple;
	bh=/zgVXFVQtLEI5FgdvVM3HhXUqqrr5myYynZfn1rcdmk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uVJ6psDYODg5/+8B+xweyeuMQ1xCWJpCyWjXFop+XnhO0EPOjwUutIp0YpP0gEQn+BHBFzTSyNY24VdROuuFoVUY6iaA64I4rGq8HR6mNyqBoWjttUwQaiTR4pGRwwgfY7+y0WKMbG40EGtqBiogJNx0qOJT3XU2ITJuw5qa/EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1SoPVoF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1SoPVoF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EF4E1F000E9;
	Fri, 22 May 2026 18:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779474113;
	bh=gahpAeHuP0lNzeIpdWIszwmL1pQPKJZNimDJJL+tM/I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c1SoPVoF6YyaSygbdPIV5E/milRo7OyTKD8r4lEasoAyJrUeRNKrzlmOIX+WMF7Ex
	 zTkuDvSD2L4VM/WFxPnILKVOn8ix0QPxYcV7ZWPeGWXt4zKH24L0RyGyNUd5jSfQYn
	 iz0gydiflAHI0epbbFx4/HBY0FynC0/ohlKx0z+BS8FBhCgp6/+KaB7MmYHd1nCHLT
	 A2ZIvK1SnwGRSyNzwhudZMk+J3u+gHEnTvBG8z0xqx/KqTYKnWRBAjJKprFUVjXDAT
	 ZFlcA8GoCnd7J1cd28gpcdlnkfB6z0Qv5GZMKwH6oYReTnP+maIwXzHuJnS/KCmFQd
	 UrKg+3tZEdgvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add Axelera AI metis-sbc
Reply-To: sashiko-reviews@lists.linux.dev
To: "Patrick Barsanti" <patrick.barsanti@amarulasolutions.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260522174918.61523-4-patrick.barsanti@amarulasolutions.com>
References: <20260522174918.61523-4-patrick.barsanti@amarulasolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 18:21:52 +0000
Message-Id: <20260522182153.0EF4E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The `&hdmi0` node mixes HDMI M0 and M1 pinmux groups for its pins,=
 which will cause the HDMI controller to miss Hot-Plug Detection (HPD) sign=
als.
- [Medium] The `&sdhci` (eMMC) node specifies `full-pwr-cycle-in-suspend` b=
ut lacks the required `vmmc-supply` and `vqmmc-supply` regulator assignment=
s, and the underlying PMIC supplies are not configured to turn off in suspe=
nd.
- [Medium] The `pmic@0` (RK806) node lacks a `pinctrl` assignment for its i=
nterrupt pin.
- [Medium] The `vcc3v3_hubreset` regulator is used as a hack to release a U=
SB hub reset GPIO, and is incorrectly passed as the `phy-supply` to `&usbdp=
_phy1` while being marked as `regulator-always-on` and `regulator-boot-on`.
- [Low] The `vbus5v0_typec` and `vcc_3v3_sd_s0` regulators are defined but =
never referenced by any consumer node in the device tree, and lack the `reg=
ulator-always-on` property.
--

commit 4aee50a229d0828f7f68b373236eeefdfcd2b1b8
Author: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>

arm64: dts: rockchip: Add Axelera AI metis-sbc

Add minimal device tree for the Axelera AI Metis Compute Board
(rk3588-metis-sbc).

Link: https://axelera.ai/evaluation-systems/metis-compute-board

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-metis-sbc.dts b/arch/arm=
64/boot/dts/rockchip/rk3588-metis-sbc.dts
> new file mode 100644
> index 0000000000000..56d734f9f25bc
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-metis-sbc.dts
> @@ -0,0 +1,840 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include <dt-bindings/soc/rockchip,vop2.h>
> +#include "rk3588.dtsi"
> +
> +/ {
> +	model =3D "Axelera AI Metis Compute Board";
> +	compatible =3D "axelera,metis-sbc", "rockchip,rk3588";

[ ... ]

> +	vbus5v0_typec: vbus5v0-typec {
> +		compatible =3D "regulator-fixed";
> +		enable-active-high;
> +		gpio =3D <&gpio4 RK_PB4 GPIO_ACTIVE_HIGH>; /* TYPEC5V_PWREN */
> +		pinctrl-0 =3D <&typec5v_pwren>;
> +		pinctrl-names =3D "default";
> +		regulator-name =3D "usbc_ss_vbus";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		vin-supply =3D <&vcc5v0_sus>;
> +	};

[Severity: Low]
Are this regulator and vcc_3v3_sd_s0 actually used anywhere?

They lack the regulator-always-on property and are never referenced by any
consumer node in the device tree, which means the regulator framework will
never enable them.

[ ... ]

> +	vcc_3v3_sd_s0: vcc-3v3-sd-s0 {
> +		compatible =3D "regulator-fixed";
> +		enable-active-high;
> +		gpio =3D <&gpio0 RK_PC5 GPIO_ACTIVE_HIGH>; /* SDMMC_PWREN */
> +		pinctrl-0 =3D <&sdmmc_pwren>;
> +		pinctrl-names =3D "default";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-name =3D "vsd_3v3";
> +		startup-delay-us =3D <1000000>;
> +		vin-supply =3D <&vcc_3v3_s3>;
> +	};

[Severity: Low]
Similar to vbus5v0_typec, is this regulator actually utilized?

It appears to be unreferenced dead code since it is not marked as always
on and is not linked to any consumer node.

[ ... ]

> +	vcc3v3_hubreset: vcc3v3-hubreset {
> +		compatible =3D "regulator-fixed";
> +		enable-active-high;
> +		gpio =3D <&gpio3 RK_PB2 GPIO_ACTIVE_HIGH>; /* USB_HUB_RST_N */
> +		pinctrl-0 =3D <&usb_hub_rst_n>;
> +		pinctrl-names =3D "default";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-name =3D "vcc3v3_hubreset";
> +		vin-supply =3D <&vcc_3v3_s3>;
> +	};

[Severity: Medium]
Does marking this regulator with regulator-always-on and regulator-boot-on
defeat the intended reset sequencing mechanism?

It looks like this regulator is used to control a reset line for the
downstream hub and is later referenced as phy-supply in &usbdp_phy1 to allow
the PHY driver to sequence the reset. However, keeping it always on forces
the reset line to be de-asserted immediately at boot before the PHY driver
is ready, which can cause the hub to fail enumeration.

[ ... ]

> +&hdmi0 {
> +	pinctrl-0 =3D <&hdmim0_tx0_cec &hdmim0_tx0_hpd_sbc &hdmim0_tx0_scl &hdm=
im0_tx0_sda>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +};

[ ... ]

> +	hdmi {
> +		hdmim0_tx0_hpd_sbc: hdmim0-tx0-hpd-sbc {
> +			rockchip,pins =3D <3 RK_PD4 3 &pcfg_pull_none>;
> +		};
> +	};

[Severity: High]
Does mixing HDMI M0 and M1 pinmux groups break display hot-plug detection?

The hdmi0 node uses the M0 hardware pinmux group for CEC, SCL, and SDA, but
hdmim0_tx0_hpd_sbc is mapped to 3 RK_PD4 3, which corresponds to the M1 gro=
up.

Since Rockchip SoCs configure IOMUX routing globally for a peripheral via G=
RF,
and the controller is routed to the M0 group for CEC/I2C, won't the M1 HPD =
pin
be electrically ignored?

[ ... ]

> +&sdhci {
> +	bus-width =3D <8>;
> +	max-frequency =3D <200000000>;
> +	mmc-hs400-1_8v;
> +	mmc-hs400-enhanced-strobe;
> +	no-sd;
> +	no-sdio;
> +	non-removable;
> +	full-pwr-cycle-in-suspend;
> +	status =3D "okay";
> +};

[Severity: Medium]
Without explicit vmmc-supply and vqmmc-supply regulator assignments, can th=
is
full-pwr-cycle-in-suspend property cause eMMC resume failures?

Because the underlying vcc_3v3_s3 regulator is configured with
regulator-on-in-suspend, power will not actually be removed during suspend.
Upon resume, the MMC core will attempt a full re-initialization expecting t=
he
card to be idle, but since the card never lost power, the re-initialization
might fail.

[ ... ]

> +&spi2 {
> +	assigned-clock-rates =3D <200000000>;
> +	assigned-clocks =3D <&cru CLK_SPI2>;
> +	num-cs =3D <1>;
> +	pinctrl-0 =3D <&spi2m2_cs0 &spi2m2_pins>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +
> +	pmic@0 {
> +		compatible =3D "rockchip,rk806";
> +		reg =3D <0x0>;
> +		interrupt-parent =3D <&gpio0>;
> +		interrupts =3D <RK_PA7 IRQ_TYPE_LEVEL_LOW>; /* PMIC_INT_L */
> +		spi-max-frequency =3D <1000000>;
> +		system-power-controller;

[Severity: Medium]
Should there be a pinctrl assignment for the PMIC interrupt pin?

Relying entirely on the bootloader's default pin configuration could result
in the pin being left floating or misconfigured as an output, which can lead
to missed or spurious PMIC interrupts and power management failures.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522174918.6152=
3-1-patrick.barsanti@amarulasolutions.com?part=3D3
