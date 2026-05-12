Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3AD383323
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 02:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778552930; cv=none; b=qMBL34HKMhXsgoTxtHbezN6o8KMZ8wR9I0cqYAWasNl/BVjWn62kfkA9404Jos4Q7PLadfOnlYeuYtZ6Phj2yq8lcSRFFRNw/g/nBkzi0MHUGyhMA+qhbYwkl/s8iT1JcZVCbApBjgSuG14UsG81diyTGy9ENiNwwyZJqqJcX4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778552930; c=relaxed/simple;
	bh=O0gY84Gybsf24eNC7HOjVjCJiYGkviZ7MwkT4V+yMpE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zl1Wm/64YKth6afp3154EJ8i60nrKLxBcuTsPOL64Z+2MVeEYvjJNwXTlLLwzmyQSx8E/bbVIr+9Nh1t18F30j46i7jQh89zkrwwX/A7fSRDy0XL3HeHc0t1SpjHnZ5po4TJlm5S7ojoagpGZA69NPYsh/fqWFrrsITy4kL290c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=af6Rt6oR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="af6Rt6oR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 736EBC2BCB0;
	Tue, 12 May 2026 02:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778552928;
	bh=O0gY84Gybsf24eNC7HOjVjCJiYGkviZ7MwkT4V+yMpE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=af6Rt6oR8lgEYoqQ0ilEjACGXK8kVRwWnTiozi1dUsXP2h4xhTnptb5nCd4nFHUhE
	 6UKAtK/p4Jlg4jwwZkvQqbEs1CPgUkMHrd0l1z22r2cEeKPLjUT2a2DrdAHkPsrBC9
	 xyi53uwMzXoFNjaLUjV9w5xQK9pq108EQN08/8gK4zZ3VBIkJg4wsnG34oA/r80XV4
	 G9LFQNCBZxJEChIAWNROIHrRLqNwSoHGU7slbBUzimCR4+UrqnLL13AfMH/fJbm4y5
	 QD4bJajHZUfNLIC1GoZ5cz2m7zxVBngkLVclTh6DG6IZXV/axcnLx+3oekhOPluuNE
	 H5Kd8UIkk6qdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: renesas: add support for solidrun
 rzg2l som and hb-iiot evb
Reply-To: sashiko@lists.linux.dev
To: "Josua Mayer" <josua@solid-run.com>
Cc: devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260511-rzg2-sr-boards-v2-2-82aebbd27891@solid-run.com>
References: <20260511-rzg2-sr-boards-v2-2-82aebbd27891@solid-run.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 02:28:47 +0000
Message-Id: <20260512022848.736EBC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] USB VBUS pinmux nodes are defined but never referenced, breaking U=
SB host power.
- [High] Edge-triggered interrupt for TCAL6416 GPIO expander leads to lost =
interrupts.
- [High] Inverse polarity on `rfkill-m2-b-gnss` disable GPIO will disable t=
he GPS when it should be enabled.
- [High] Omitted `GPIO_OPEN_DRAIN` flag on I2C mux reset line forces danger=
ous push-pull drive.
- [Medium] Missing SDIO interrupt capabilities on WiFi MMC interface degrad=
es performance.
- [Medium] Pinctrl strict locking prevents documented manual RS485 toggling.
- [Medium] Contradictory regulator polarity flags in `vmmc` create ambiguou=
s regulator state.
- [Medium] Unimplemented internal pull-ups on GPIO hogs lead to floating op=
en-drain lines.
- [Low] Improper append operator `+=3D` used for multi-blob DTB definitions=
 in Makefile.
--

commit 264a692a0b295dedac1ff5214c5f24eb1c644647
Author: Josua Mayer <josua@solid-run.com>

arm64: dts: renesas: add support for solidrun rzg2l som and hb-iiot evb

This commit adds support for the SolidRun RZ/G2L SoM on Hummingboard IIoT,
including definitions for Ethernet, eMMC, DDR, and WiFi/Bluetooth.
Descriptions for eMMC, microSD, and RS485 are provided as overlays due to
their dependency on configurable mux states.

[1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-=
g2l-som/
[2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hum=
mingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/

> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/r=
enesas/Makefile
> index ca45d2857ea7f..37cfefe66a308 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -169,6 +169,19 @@ dtb-$(CONFIG_ARCH_R9A07G044) +=3D r9a07g044c2-smarc-=
cru-csi-ov5645.dtbo
>  r9a07g044c2-smarc-cru-csi-ov5645-dtbs :=3D r9a07g044c2-smarc.dtb r9a07g0=
44c2-smarc-cru-csi-ov5645.dtbo
>  dtb-$(CONFIG_ARCH_R9A07G044) +=3D r9a07g044c2-smarc-cru-csi-ov5645.dtb
> =20
> +dtb-$(CONFIG_ARCH_R9A07G044) +=3D r9a07g044l2-hummingboard-iiot.dtb
> +dtb-$(CONFIG_ARCH_R9A07G044) +=3D rzg2l-sr-som-emmc.dtbo
> +r9a07g044l2-hummingboard-iiot-emmc-dtbs +=3D r9a07g044l2-hummingboard-ii=
ot.dtb rzg2l-sr-som-emmc.dtbo

Is it safer to use the exact assignment operator :=3D instead of the append
operator +=3D for composite device tree blobs? Standard Kbuild convention
dictates using :=3D for <target>-dtbs to ensure immediate evaluation and av=
oid
any risk of build pollution from inherited environment variables.

[ ... ]
> diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-common.d=
tsi b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-common.dtsi
> new file mode 100644
> index 0000000000000..ff2c42bcffe2f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-common.dtsi
[ ... ]
> +	vmmc: regulator-mmc {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vmmc";
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-min-microvolt =3D <3300000>;
> +		startup-delay-us =3D <250>;
> +		vin-supply =3D <&v_3_3>;
> +		gpio =3D <&pinctrl RZG2L_GPIO(4, 1) GPIO_ACTIVE_LOW>;
> +		enable-active-high;
> +	};

Mixing enable-active-high and GPIO_ACTIVE_LOW creates an ambiguous
configuration. The fixed regulator driver interprets enable-active-high as a
physical active-high requirement, but modern gpiolib automatically handles
the GPIO_ACTIVE_LOW inversion at the descriptor level.

Could this conflicting double-inversion cause the regulator to be driven to
the wrong physical state and fail to power the eMMC module?

[ ... ]
> +	rfkill-m2-b-gnss {
> +		compatible =3D "rfkill-gpio";
> +		/* rfkill-gpio inverts internally */
> +		shutdown-gpios =3D <&tca6416_u20 10 GPIO_ACTIVE_HIGH>;
> +		label =3D "m2-b gnss";
> +		radio-type =3D "gps";
> +	};

The rfkill-gpio driver asserts shutdown_gpios (drives a logical 1) when the
radio is turned on. With GPIO_ACTIVE_HIGH, a logical 1 maps to a physical
HIGH signal.=20

Since the pin is an active-low enable (GPS_EN#), driving it physically HIGH
will disable the GPS. Does this cause the kernel to disable the GPS radio
when it attempts to enable it? Should the polarity be GPIO_ACTIVE_LOW?

[ ... ]
> +	tca6416_u21: gpio@21 {
> +		compatible =3D "ti,tcal6416";
> +		reg =3D <0x21>;
> +		#interrupt-cells =3D <2>;
> +		interrupt-controller;
> +		#gpio-cells =3D <2>;
> +		gpio-controller;
> +		gpio-line-names =3D "TCA_SPI_TPM/EXT", "TCA_TPM_RST#",
> +				  "TCA_I2C_RST", "TCA_RS232_SHTD#",
> +				  "TCA_LCD_I2C_RST", "TCA_DIG_OUT1",
> +				  "TCA_bDIG_IN1", "TCA_SENS_INT",
> +				  "TCA_ALERT#", "TCA_TPM_PIRQ#",
> +				  "TCA_RTC_INT", "TCA_M.2M_WAKW_ON_LAN",
> +				  "TCA_M.2M_CLKREQ#", "TCA_LVDS_INT#",
> +				  "", "TCA_POE_AT";
> +		interrupts-extended =3D <&pinctrl RZG2L_GPIO(4, 0) IRQ_TYPE_EDGE_FALLI=
NG>;

The hardware INT pin for the TCAL6416 GPIO expander is an active-low
level-sensitive output that remains low as long as unread state changes
exist.=20

If this is configured as IRQ_TYPE_EDGE_FALLING, could the kernel miss
subsequent interrupts if a second GPIO state change occurs before the first
is cleared, since the line will remain low without generating a new falling
edge? Should this be IRQ_TYPE_LEVEL_LOW instead?

> +
> +		lcd-i2c-reset-hog {
> +			gpios =3D <4 (GPIO_ACTIVE_LOW|GPIO_PULL_UP|GPIO_OPEN_DRAIN)>;

The ti,tcal6416 chip is driven by gpio-pca953x, which does not implement the
.set_config callback for this specific IC because it lacks the PCA_PCAL
hardware flag.=20

Will gpiolib silently ignore the GPIO_PULL_UP flag? For open-drain lines
like the lcd reset and the TPM interrupt below, could this leave the lines
floating and lead to spurious interrupts or unstable hardware states if
there are no external board-level pull-ups?

[ ... ]
> +	i2c-mux@70 {
> +		compatible =3D "nxp,pca9546";
> +		reg =3D <0x70>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		/*
> +		 * This reset is open drain,
> +		 * but reset core does not support GPIO_OPEN_DRAIN flag.
> +		 */
> +		reset-gpios =3D <&tca6416_u21 2 GPIO_ACTIVE_LOW>;

The comment mentions that the reset core does not support the
GPIO_OPEN_DRAIN flag, but the i2c-mux-pca954x driver requests the GPIO using
devm_gpiod_get_optional(), which fully supports device tree flags.

By omitting the flag, does the GPIO controller get forced to drive the pin
in push-pull mode? Could actively driving a hard-wired open-drain line high
cause short circuits or component damage?

[ ... ]
> diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-rs485-a.=
dtso b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-rs485-a.dtso
> new file mode 100644
> index 0000000000000..886f4d4ecd67f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-rs485-a.dtso
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright 2025 Josua Mayer <josua@solid-run.com>
> + *
> + * Overlay for enabling HummingBoard IIoT on-board RS485 Port A on conne=
ctor J5004.
> + *
> + * Because Renesas uart driver does not support rs485,
> + * users must manually toggle P41_1 between RX & TX.

The overlay below adds <&scif1_rts_pins> to the pinctrl-0 property of the
UART controllers. Since the Renesas RZ/G2L pinctrl driver operates in strict
mode, it will exclusively claim these RTS pins.

Will this prevent userspace from subsequently requesting these pins as GPIOs
for the documented manual toggling, causing requests to be rejected with
-EBUSY?

> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&scif1 {
> +	pinctrl-0 =3D <&scif1_pins>, <&scif1_rts_pins>;
> +};
[ ... ]
> diff --git a/arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi b/arch/arm64/b=
oot/dts/renesas/rzg2l-sr-som.dtsi
> new file mode 100644
> index 0000000000000..1d52530dcf43c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi
[ ... ]
> +&sdhi1 {
> +	/* Murata 1MW max rate is 50MHz */
> +	max-frequency =3D <50000000>;
> +	bus-width =3D <4>;
> +	mmc-pwrseq =3D <&sdhi1_pwrseq>;
> +	non-removable;
> +	no-1-8-v;
> +	no-sd;
> +	pinctrl-0 =3D <&sdhi1_pins>;
> +	pinctrl-names =3D "default";
> +	vmmc-supply =3D <&reg_pmic_buck4>;
> +	/*
> +	 * Host controller IO voltage is provided from reg_pmic_ldo2,
> +	 * WiFi module IO voltage from reg_pmic_buck4.
> +	 * Neither is configurable at run-time so either can be set here.
> +	 */
> +	vqmmc-supply =3D <&reg_pmic_ldo2>;
> +	status =3D "okay";
> +};

The sdhi1 node is designated for an on-board WiFi module but omits the
cap-sdio-irq property and lacks a child node defining an out-of-band
interrupt.=20

Will the MMC core fall back to SDIO polling without this capability
declared, and could this degrade I/O performance and inflate CPU utilizatio=
n?

> +
> +&usb2_phy0 {
> +	vbus-supply =3D <&usb0_vbus_otg>;
> +	status =3D "okay";
> +};
> +
> +&usb2_phy1 {
> +	status =3D "okay";
> +};

The usb0_vbus_pins and usb1_vbus_pins nodes are defined in the pinctrl
section earlier in this file to configure the USB VBUS enable pins, but
neither &usb2_phy0 nor &usb2_phy1 appears to reference them via a pinctrl-0
property.

Without being multiplexed, will the USB host controllers be able to drive
VBUS power to connected devices?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-rzg2-sr-bo=
ards-v2-0-82aebbd27891@solid-run.com?part=3D2
