Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E08F3C9896
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 16:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778861981; cv=none; b=Re+QapRH6sY4CGTGNGBhvQ9x31NnMZKO2dmuMdN56N9ksOqiCgylW8J3+3u/7TktVHTNuWf8jHuhHGXL7ImQLF9/PDmpU/S8fXVO5+RyxTf3UZt9AmQ6gsXSHSglL52Y7jYYsd7N50Gl4ZYKHZMalAO/PVA5VVzkmnekaZTG7Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778861981; c=relaxed/simple;
	bh=dTreoN9oL4nDHFAxeUaAumjFltacC1kiVykxqLug7UU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lTX4AmamW+QHj4OI/N8sQnQ1AsiZGzJUBbjHP3XDveY8XxYByRusbpNrk46VdET3XxZZVgd5DO5ID/tluKuuiIGQYeiBJsDUWm/9BDYsy08es0I4LcD5bTokz8ZR25LBcd85nlcyVd3DybnI0msoM6/YqDJzSwNW2cLgq1nhaI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P9o2Rk+i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P9o2Rk+i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4EC2C2BCC7;
	Fri, 15 May 2026 16:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778861981;
	bh=dTreoN9oL4nDHFAxeUaAumjFltacC1kiVykxqLug7UU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=P9o2Rk+icWZ98kSrPVbfo5zSnVqrDC7SgZ7oDJrkHe2dOR2PNN602iNrFtnRWJXP9
	 EQfu/zsLnP4lWG/ARN6asZJtMFPLcIAJ8FkaRTWDO4SIkTIvBvbCECD4TlLcCIAGyP
	 2Z6xLenP5fuv2qFF/AMLlEjeLqhSaPAN2g5uK39FhkOxAZIJx/2SY++JQBX0iWUS+u
	 OZwcgNiivaDen/HgqBGCfHffNBnZS2dqZUOu8Jt37eDbzUIK2Xdu299OEB9fKtPROK
	 KTyN4DTK3Z25LkZm8IB1jcMhTTvBmtjVHO6V21oSLAALRMa4cOjMLBNOoVuRuxoLls
	 OpIXCy+c6FJuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] arm64: dts: ti: Add k3-am62l3-beaglebadge
Reply-To: sashiko-reviews@lists.linux.dev
To: "Judith Mendez" <jm@ti.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260515153541.294698-3-jm@ti.com>
References: <20260515153541.294698-3-jm@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 16:19:40 +0000
Message-Id: <20260515161940.E4EC2C2BCC7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Unmanaged Board Control GPIOs (Missing GPIO Hogs / Regulators) for=
 `BOOST_5V_ENA` and `USB_HUB_RST`.
- [High] Driver/DTB Interface Violation: `microchip,spi-present-mask` lengt=
h mismatch.
- [High] Missing `bootph-all` property on referenced pinctrl nodes will cau=
se U-Boot SPL probe failures.
- [Medium] Misplaced Consumer Pinctrl Configurations on the `&gpio0` provid=
er node.
- [Low] Deprecated `gpio` property used instead of `gpios` in `regulator-fi=
xed` nodes.
--

commit 535e2cddc8d18ba0025f3f27f6e67f150156d239
Author: Judith Mendez <jm@ti.com>
arm64: dts: ti: Add k3-am62l3-beaglebadge

This patch introduces the device tree for the BeagleBoard.org BeagleBadge,
a compact single board computer based on the TI AM62L3 SoC. It provides
the initial hardware description including regulators, GPIOs, pinmux
configurations, and basic peripherals.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts b/arch/arm6=
4/boot/dts/ti/k3-am62l3-beaglebadge.dts
> new file mode 100644
> index 0000000000000..30fc9c83b1f44
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts

[ ... ]

> +	vdd_3v3_sd: regulator-3 {
> +		/* TPS22918DBVR */
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VDD_3V3_SD";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		vin-supply =3D <&vdd_3v3>;
> +		regulator-boot-on;
> +		enable-active-high;
> +		gpio =3D <&gpio0 16 GPIO_ACTIVE_HIGH>;

This isn't a bug, but could the gpios property be used here instead of the
deprecated gpio property? The wlan_en node later in this file correctly uses
the plural form.

> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&vdd_3v3_sd_ena_pins_default>;
> +		bootph-all;
> +	};
> +
> +	sensor_3v3: regulator-4 {
> +		/* TPS22918DBVR */
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "Sensor_3V3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		vin-supply =3D <&vdd_3v3>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +		enable-active-high;
> +		gpio =3D <&wkup_gpio0 1 GPIO_ACTIVE_HIGH>;

Could this also be updated to use the gpios property?

[ ... ]

> +	usr_button_pins_default: usr-button-default-pins {
> +		pinctrl-single,pins =3D <
> +			AM62LX_IOPAD(0x00a4, PIN_INPUT, 7) /* (H18) GPMC0_AD11.GPIO0_26 */
> +			AM62LX_IOPAD(0x01e4, PIN_INPUT, 7) /* (D16) EXT_REFCLK1.GPIO0_104 */
> +			AM62LX_IOPAD(0x00c0, PIN_INPUT, 7) /* (N19) GPMC0_ADVn_ALE.GPIO0_32 */
> +			AM62LX_IOPAD(0x00e8, PIN_INPUT, 7) /* (L19) GPMC0_CSn1.GPIO0_42 */
> +			AM62LX_IOPAD(0x00b8, PIN_INPUT, 7) /* (L21) GPMC0_CLK.GPIO0_31 */
> +			AM62LX_IOPAD(0x01c0, PIN_INPUT, 7) /* (B13) UART0_RTSn.GPIO0_95 */
> +		>;
> +	};

Because the gpio0 node later in the file includes the bootph-all property a=
nd
references this node, does this node also need bootph-all? Without it,
U-Boot's fdtgrep might strip this node, leaving a dangling phandle and
causing probe failures in SPL.

[ ... ]

> +	sensor_3v3_ena_pins_default: sensor-3v3-ena-default-pins {
> +		pinctrl-single,pins =3D <
> +			AM62LX_IOPAD(0x004, PIN_OUTPUT, 7) /* (AA23) WKUP_UART0_TXD.WKUP_GPIO=
0_1 */
> +		>;
> +	};

Does this node also need the bootph-all property? The sensor_3v3 regulator
node uses this pinctrl configuration and has bootph-all.

[ ... ]

> +	lora_control_pins_default: lora-control-default-pins {
> +		pinctrl-single,pins =3D <
> +			AM62LX_IOPAD(0x00c8, PIN_OUTPUT, 7) /* (M19) GPMC0_WEn.GPIO0_34 */
> +			AM62LX_IOPAD(0x00e4, PIN_OUTPUT, 7) /* (L20) GPMC0_CSn0.GPIO0_41 */
> +			AM62LX_IOPAD(0x01a4, PIN_INPUT, 7) /* (D11) SPI0_CS1.GPIO0_88 */
> +			AM62LX_IOPAD(0x01bc, PIN_INPUT, 7) /* (B14) UART0_CTSn.GPIO0_94 */
> +		>;
> +	};

Same question here regarding the bootph-all property since this is referenc=
ed
by the gpio0 node.

> +
> +	gpio0_pins_default: gpio0-default-pins {
> +		pinctrl-single,pins =3D <
> +			AM62LX_IOPAD(0x0078, PIN_OUTPUT, 7) /* (L22) GPMC0_AD0.GPIO0_15 */
> +			AM62LX_IOPAD(0x00e0, PIN_INPUT, 7) /* (M21) GPMC0_DIR.GPIO0_40 */
> +			AM62LX_IOPAD(0x00ec, PIN_OUTPUT, 7) /* (M23) GPMC0_CSn2.GPIO0_43 */
> +			AM62LX_IOPAD(0x00f0, PIN_INPUT, 7) /* (M22) GPMC0_CSn3.GPIO0_44 */
> +			AM62LX_IOPAD(0x0194, PIN_OUTPUT, 7) /* (B11) MCASP0_AFSX.GPIO0_84 */
> +		>;
> +	};

Does this node also need bootph-all to match the gpio0 node?

Also, I noticed that GPIO0_15 (BOOST_5V_ENA) and GPIO0_43 (USB_HUB_RST)
are configured as PIN_OUTPUT here. Because configuring PIN_OUTPUT in pinctrl
only sets the pad multiplexing and does not actively drive a logic level on
the GPIO controller, will these pins remain floating?

Should there be a gpio-hog or consumer regulator node to manage the directi=
on
and logic level for these control pins?

[ ... ]

> +&gpio0 {
> +	gpio-line-names =3D"","","","","","","","","","",									/* 0-9 */
> +			 "","","","","","BOOST_5V_ENA","VDD_3V3_SD_ENA","","","",					/* 10-1=
9 */
> +			 "","","","","","MCP23S18_RESET","BTN_SELECT","","","",						/* 20-29=
 */
> +			 "","BTN_LEFT","BTN_UP","","LORA_RESET","","","","","",						/* 30-39=
 */
> +			 "FUEL_GAUGE_BATLOW","LORA_RFSW","BTN_DOWN","USB_HUB_RST","MIKROBUS_I=
NT","","","","","",	/* 40-49 */
> +			 "","WLAN_EN","","","","","","","","",								/* 50-59 */
> +			 "","","","","","","","","","",									/* 60-69 */
> +			 "","","","","","","","","","",									/* 70-79 */
> +			 "","","","","MIKROBUS_RST","","","","LORA_BUSY","",						/* 80-89 */
> +			 "","","","","LORA_DIO","BTN_RIGHT","","","","",						/* 90-99 */
> +			 "","","","","BTN_BACK","","","","","",								/* 100-109 */
> +			 "","","","","","","","","","",									/* 110-119 */
> +			 "","","SD_CD","","","";									/* 120-125 */
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&gpio0_pins_default>, <&usr_button_pins_default>, <&lora=
_control_pins_default>;

Is it expected to place the pinctrl configurations for consumer devices
(usr_button_pins_default and lora_control_pins_default) on the gpio0
provider node?

This causes the pins to be claimed when the GPIO controller probes. Could
these be moved to the respective consumer device nodes instead?

[ ... ]

> +	mcp23s18: gpio@0 {
> +		compatible =3D "microchip,mcp23s18";
> +		reg =3D <0>;
> +		spi-max-frequency =3D <10000000>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		reset-gpios =3D <&gpio0 25 GPIO_ACTIVE_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&mcp23s18_reset_pins_default>;
> +		microchip,spi-present-mask =3D /bits/ 8 <0x01>;

Will this cause a probe failure in the pinctrl-mcp23s08_spi driver?

The driver uses device_property_read_u32() to parse the
microchip,spi-present-mask property. Because the property is defined here
as an 8-bit value, the property read API will see a length mismatch and
might return -EOVERFLOW.

Could this be specified as a standard 32-bit cell (i.e., <0x01>)?

> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515153541.2946=
98-1-jm@ti.com?part=3D2
