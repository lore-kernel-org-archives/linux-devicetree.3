Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795025659;
	b=Qd3HQSW/GvBbD6O8sYDvzykmEygyc5OAD3ZIlfSedZq/udJAqv7/tLdSme7GgrXzdGD2
	 YKeTBtiXz6xfZdgr+UwDzy38nQjDD4wlUAX/ZA9iMsidbUymD/5hZZI372ux2rdoPVN43
	 HTnEwX1bWRVbapJDfG+xarip/LBISsb8w722IoEN2JaH6wwaEPsM9FtwuNzapVH0ySTI3
	 964/1lpkIAif8lTLLt8W4kmVknCgz95pKdfoYOCgv48fzcKqxxWC8StW3xnyk+jPeYo8n
	 uSXA9rkTuhBAzRwt9r5h3neysaSjhUXuGeDCtnwKjfYHrZes0IZVrqv4bxdzXNBRvNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025659;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LJyytQxdN2UgNHpdtkVV4Zb0OXAU15FOuQ59b9I6/7U=;
	b=E7LZ+SSPI0av+9SvKnSNEyhE3kOodGngQtBgR4GcD6X9XFEYLaR8ZvqEzkBe0cZhbwva
	 CFPBPwBpdsUNmOItqmB80SrB+/UxQ+2pzaLL4bkNT/2m0EDtzYPvZriHt5jQ5jPFeMsgI
	 l/KxOx0hir0xXhaxTtNebpxj00eLesA4HDgiNQOBxPPRpTi2AeB+QANQZFVU1fTfht/V4
	 3W+crZmNDfWEMMgpJw8mq/8Rd1c+ZVPFy+5965lPBICoeII7y/16zeocl9DFZA/8vPVfu
	 iV1AFjbX2a9LIYjumo/xfWTHyZlWJe1WGSYAJ65GnhePeYmheaD5RIDHD2jQOJGUauw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dbOP9uXA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1976606A320
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 18:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dbOP9uXA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6DF1F000C4;
	Wed, 18 Nov 2026 18:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795025659;
	bh=LJyytQxdN2UgNHpdtkVV4Zb0OXAU15FOuQ59b9I6/7U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dbOP9uXAvvXjModjCZzFKwFniYK2GDbYAVD1cM3C+McGTgI9YZjiQagi4z2DUEECe
	 wlVHz3Y1EcrZAx/MMmx8YbP1sLBAzNebWIhgesBPfHJu39CJz0/5LKLHLi7zYqEGb6
	 MfUdc+ypREDJuXf4kso9CHLH01di9Ob9xSy4VjDv5N3Tvrj5ijXABj0lhEsfAjxndB
	 fxPBJsK5BlLLyLe91OWZSLcvre+iwHa+0+nvbp4TV1gawmQUjwsxtnOz7wtzMlfQQH
	 B39sJzPAtieHLsG/RmPXhNUEWzgFHAOqzUYcAaUggTbrT/IsP0xH/ZQX/ErIpnu7tC
	 9BXLzEYXsa5AA==
Message-ID: <sashiko-outbox-221733@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] ARM: dts: ti/omap: am335x: add kamstrup emperor
 platforms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bruno Thomsen" <bruno.thomsen@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118175209.20829-2-bruno.thomsen@gmail.com>
References: <20261118175209.20829-1-bruno.thomsen@gmail.com>
 <20261118175209.20829-2-bruno.thomsen@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 18:14:18 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 7 potential
issues to consider:
- [High] ARM: dts: am335x-emperor: swapped mmc1 and mmc2 nodes and
  pinmux
- [Medium] ARM: dts: am335x-emperor: legacy CPSW nodes break ethernet0
  alias
- [Medium] ARM: dts: am335x-emperor: RADIO_GPIO5 mapped to eMMC clk
  gpio1[30]
- [Medium] ARM: dts: am335x-emperor: output GPIOs led-5 and
  eeprom-wp-hog pulldown
- [Low] ARM: dts: am335x-emperor: 32 MB SPI flash comment vs 16 MB
  partitions
- [Low] ARM: dts: am335x-emperor: invalid ti,no-init property on rtc
  node
- [Low] ARM: dts: am335x-emperor-mini: undocumented channel nodes on
  tmp431
--

commit 90cccbd7e5a8919fd05823f58d75b5f677a542c9
Author: Bruno Thomsen <bruno.thomsen@gmail.com>

ARM: dts: ti/omap: am335x: add kamstrup emperor platforms

This commit adds device tree files and common configuration for the
Kamstrup READy Concentrator 1M/2M/2C and connectIQ IoT Gateway 500
AM335x-based platforms.

> diff --git a/arch/arm/boot/dts/ti/omap/am335x-emperor-common.dtsi b/arch/=
arm/boot/dts/ti/omap/am335x-emperor-common.dtsi
> new file mode 100644
> index 0000000000000..2e4c1e3728c13
> --- /dev/null
> +++ b/arch/arm/boot/dts/ti/omap/am335x-emperor-common.dtsi
> @@ -0,0 +1,414 @@

[ ... ]

> +	leds_pins_default: leds-pins {
> +		pinctrl-single,pins =3D <
> +			AM33XX_PADCONF(AM335X_PIN_LCD_VSYNC, PIN_OUTPUT, MUX_MODE7) /* (U5) l=
cd_vsync.gpio2[22] */
> +			AM33XX_PADCONF(AM335X_PIN_LCD_HSYNC, PIN_OUTPUT, MUX_MODE7) /* (R5) l=
cd_hsync.gpio2[23] */
> +			AM33XX_PADCONF(AM335X_PIN_LCD_PCLK, PIN_OUTPUT, MUX_MODE7) /* (V5) lc=
d_pclk.gpio2[24] */
> +			AM33XX_PADCONF(AM335X_PIN_LCD_AC_BIAS_EN, PIN_OUTPUT, MUX_MODE7) /* (=
R6) lcd_ac_bias_en.gpio2[25] */
> +			/* led-5 on emperor-mini, NC on emperor */
> +			AM33XX_PADCONF(AM335X_PIN_GPMC_AD12, PIN_INPUT_PULLDOWN, MUX_MODE7) /=
* (T12) gpmc_ad12.gpio1[12] */
> +		>;
> +	};

[Severity: Medium]
Should AM335X_PIN_GPMC_AD12 be configured as PIN_OUTPUT on
am335x-emperor-mini instead of PIN_INPUT_PULLDOWN?

am335x-emperor-mini defines led-5 on <&gpio1 12 GPIO_ACTIVE_HIGH> as an
output LED without overriding this pad configuration, leaving the input
receiver and internal pull-down resistor enabled against the high output
drive when led-5 is turned on.

[ ... ]

> +		/* Radio flash is 32 MBytes in size.
> +		 * 64 KB blocks of configurations are located in the
> +		 * last part of the storage.
> +		 */
> +		partitions {
> +			compatible =3D "fixed-partitions";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			partition@0 {
> +				reg =3D <0x0 0xfe0000>;
> +				label =3D "radio-program";
> +			};
> +			partition@fe0000 {
> +				reg =3D <0xfe0000 0x10000>;
> +				label =3D "radio-config";
> +			};
> +			partition@ff0000 {
> +				reg =3D <0xff0000 0x10000>;
> +				label =3D "baseband-config";
> +			};
> +		};

[Severity: Low]
Does the partition table match the flash size described in the comment?

The partitions span 0x1000000 bytes (16 MiB), whereas the comment says the
flash is 32 MBytes with the 64 KB configuration blocks in the last part of
storage (which would be 0x1fe0000 and 0x1ff0000 on a 32 MiB flash).

[ ... ]

> +&cpsw_emac0 {
> +	phy-mode =3D "mii";
> +	phy-handle =3D <&ethernetphy7>;
> +};
> +
> +&mac {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mii1_pins_default>;
> +	status =3D "okay";
> +	slaves =3D <1>;
> +};
> +
> +&davinci_mdio {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mdio_pins_default>;
> +	status =3D "okay";
> +
> +	ethernetphy7: ethernet-phy@7 {
> +		reg =3D <7>;
> +		smsc,disable-energy-detect;
> +	};
> +};

[Severity: Medium]
Should this enable &mac_sw, &cpsw_port1, and &davinci_mdio_sw (with
&cpsw_port2 disabled) instead of the deprecated legacy &mac, &cpsw_emac0,
and &davinci_mdio nodes?

In arch/arm/boot/dts/ti/omap/am33xx.dtsi, /aliases/ethernet0 points to
&cpsw_port1 under &mac_sw.  Leaving &mac_sw and &cpsw_port1 disabled while
enabling &mac causes bootloaders that populate mac-address via the
ethernet0 alias to patch the disabled node, and binds to the deprecated
ti,am335x-cpsw binding rather than Documentation/devicetree/bindings/net/ti=
,cpsw-switch.yaml.

> +
> +/* eMMC disk */
> +&mmc1 {
> +	status =3D "okay";
> +	bus-width =3D <8>;
> +	vmmc-supply =3D <&vmmcsd_fixed>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&emmc_pins_default>;
> +
> +	/*
> +	 * am335x doesn't support DDR, so make sure the data signal is set
> +	 * early in the clock cycle
> +	 */
> +	/delete-property/ ti,needs-special-hs-handling;
> +};
> +
> +/* microSD card, used during manufacturing */
> +&mmc2 {
> +	status =3D "okay";
> +	bus-width =3D <4>;
> +	vmmc-supply =3D <&vmmcsd_fixed>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&sdcard_pins_default>;
> +};

[Severity: High]
Are &mmc1 and &mmc2 swapped here?

In arch/arm/boot/dts/ti/omap/am33xx.dtsi and am33xx-l4.dtsi, the DT labels
are 1-indexed relative to the hardware module names: &mmc1 (0x48060000,
aliased as mmc0) is the 4-bit MMC0 controller wired to AM335X_PIN_MMC0_*
(sdcard_pins_default), while &mmc2 (0x481d8000, aliased as mmc1) is the
8-bit MMC1 controller wired to AM335X_PIN_GPMC_* (emmc_pins_default).  As
written, each controller claims the other controller's pinmux pads, the
4-bit MMC0 controller is configured with bus-width =3D <8>, and the 8-bit
MMC1 controller is restricted to bus-width =3D <4>.

Also, ti,needs-special-hs-handling is a legacy omap_hsmmc property that is
not present on the ti,am335-sdhci nodes in am33xx-l4.dtsi, so the
/delete-property/ directive is a no-op.

> +
> +&rtc {
> +	ti,no-init;
> +	status =3D "disabled";
> +};

[Severity: Low]
Is ti,no-init valid on &rtc?

ti,no-init is a ti,sysc interconnect property rather than an OMAP RTC
property, so it is not permitted by
Documentation/devicetree/bindings/rtc/ti,omap-rtc.yaml and is ignored by
the RTC driver.

[ ... ]

> diff --git a/arch/arm/boot/dts/ti/omap/am335x-emperor-mini.dts b/arch/arm=
/boot/dts/ti/omap/am335x-emperor-mini.dts
> new file mode 100644
> index 0000000000000..797b52f32a7a7
> --- /dev/null
> +++ b/arch/arm/boot/dts/ti/omap/am335x-emperor-mini.dts
> @@ -0,0 +1,408 @@

[ ... ]

> +&gpio0 {
> +	gpio-line-names =3D
> +		"MDIO_DATA",
> +		"MDIO_CLK",
> +		"SPI0_CLK",
> +		"SPI0_MOSI",
> +		"SPI0_MISO",
> +		"SPI0_CS0",
> +		"POWER_FAILURE",
> +		"SPI1_CLK",
> +		"SYS_BOOT12",

[ ... ]

> +&gpio1 {
> +	gpio-line-names =3D
> +		"MMC1_DAT0",
> +		"MMC1_DAT1",
> +		"MMC1_DAT2",
> +		"MMC1_DAT3",
> +		"MMC1_DAT4",
> +		"MMC1_DAT5",
> +		"MMC1_DAT6",
> +		"MMC1_DAT7",
> +		"UART4_RX",
> +		"UART4_TX",
> +		"UART0_RX",
> +		"UART0_TX",
> +		"HMI_POWERCTRL",
> +		"PCI_W_DIS_N",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"TEST_MODE",
> +		"POE_DETECT_N",
> +		"RADIO_GPIO5",
> +		"MMC1_CMD";
> +};

[Severity: Medium]
Is RADIO_GPIO5 placed on the wrong GPIO line in both
am335x-emperor-mini.dts and am335x-emperor.dts?

In am335x-emperor-common.dtsi, sdr_radio_pins_default muxes the six radio
GPIOs on gpio2[2..5], gpio0[7] (AM335X_PIN_ECAP0_IN_PWM0_OUT), and
gpio0[19] (AM335X_PIN_XDMA_EVENT_INTR0).  Here, gpio0[7] is named
"SPI1_CLK", while "RADIO_GPIO5" is assigned to gpio1[30], which is
AM335X_PIN_GPMC_CSN1 (muxed as mmc1_clk in emmc_pins_default).  User-space
lookups for RADIO_GPIO5 by line name will resolve to the eMMC clock pin
instead of gpio0[7].

[ ... ]

> +	temperature-sensor@4c {
> +		compatible =3D "ti,tmp431";
> +		reg =3D <0x4c>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		channel@0 {
> +			reg =3D <0x0>;
> +			label =3D "baseboard";
> +		};
> +
> +		channel@1 {
> +			reg =3D <0x1>;
> +			label =3D "fpga";
> +		};
> +	};

[Severity: Low]
As noted in the patch commentary,
Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml sets
additionalProperties: false and does not yet define #address-cells,
#size-cells, or channel@[0-9]+ child nodes, so this node causes dtbs_check
validation failures until the binding change lands.

[ ... ]

> diff --git a/arch/arm/boot/dts/ti/omap/am335x-emperor.dts b/arch/arm/boot=
/dts/ti/omap/am335x-emperor.dts
> new file mode 100644
> index 0000000000000..bb5cc7dc347c6
> --- /dev/null
> +++ b/arch/arm/boot/dts/ti/omap/am335x-emperor.dts
> @@ -0,0 +1,262 @@

[ ... ]

> +&gpio3 {
> +	gpio-line-names =3D
> +		"MII1_COL",
> +		"MII1_CRS_DV",
> +		"MII1_RXERR",
> +		"MII1_TXEN",
> +		"MII1_RXDV",
> +		"I2C0_SDA",
> +		"I2C0_SCL",
> +		"NC",
> +		"NC",
> +		"MII1_TXCLK",
> +		"MII1_RXCLK",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"RTC_IRQ",
> +		"RTC_TAMPER",
> +		"RADIO_INIT_B",
> +		"RADIO_PRG_DONE",
> +		"RADIO_POWER",
> +		"RADIO_FLASH_MUX",
> +		"RADIO_RESET",
> +		"RADIO_FLASH_RESET",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"NC",
> +		"NC";
> +
> +	eeprom-wp-hog {
> +		gpio-hog;
> +		gpios =3D <13 GPIO_ACTIVE_HIGH>;
> +		output-low;
> +	};
> +};

[ ... ]

> +			AM33XX_PADCONF(AM335X_PIN_GPMC_CSN0, PIN_INPUT_PULLDOWN, MUX_MODE7) /=
* (V6) gpmc_csn0.gpio1[29] */
> +			AM33XX_PADCONF(AM335X_PIN_GPMC_CSN3, PIN_INPUT_PULLDOWN, MUX_MODE7) /=
* (T13) gpmc_csn3.gpio2[0] */
> +			AM33XX_PADCONF(AM335X_PIN_GPMC_CLK, PIN_INPUT_PULLDOWN, MUX_MODE7) /*=
 (V12) gpmc_clk.gpio2[1] */
> +			AM33XX_PADCONF(AM335X_PIN_USB1_DRVVBUS, PIN_INPUT_PULLDOWN, MUX_MODE7=
) /* (F15) USB1_DRVVBUS.gpio3[13] */
> +		>;
> +	};
> +};

[Severity: Medium]
Should AM335X_PIN_USB1_DRVVBUS (gpio3[13]) be configured as PIN_OUTPUT and
named in &gpio3 gpio-line-names instead of being listed under unused GPIO
pins as PIN_INPUT_PULLDOWN and "NC"?

eeprom-wp-hog hogs gpio3[13] as an output driven low, so configuring the
pad as PIN_INPUT_PULLDOWN leaves the input receiver and pull-down enabled
on an output line.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118175209.2082=
9-1-bruno.thomsen@gmail.com?part=3D2
