Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B41C43E073
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 11:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346845; cv=none; b=Ob7OBfjkKmDKtRTXKq+Bi3LgE+Y4qYlY7MT2GZcmsiBgTmG7RqM/YHUAO7k1B6b996u96yFFfn/tSWnVZSf78c0CXgI4Cjlzvd5MKpl43hiQ/ea3Y+P/UYXFPFUryx+O2+ysefy/Zt1vC9gXIBko0xu1/xSwbxgU54tCE8lO6pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346845; c=relaxed/simple;
	bh=iSt6F35OQqWAFUR3uKHVZjA2iWsmFWcFbYfphO7gaeU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ntaODSzCf9QkVEFaQ2/l2maSq0iKg14PouQUcYmwY86FBBRvR9/aZT0ak0egxrFkh8A2Cht9uoM+lvwlE0bsSgcdDYI+qD6Eip+tRjPqRQCXYdUWGvh1rvgV8/BQHQoJNdCJFgVwf5dKs7ES4/GveY4xiNkCTQLDUn45Srt5QIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NH2idxNP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NH2idxNP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FD1A1F00A3A;
	Wed,  2 Sep 2026 11:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788346839;
	bh=L89Mde9IYDKeMjn0JpPsjLkpgX2QRW9tE3o09AlJyRY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NH2idxNPd+NL0IV3iGwGNtpNzziehQccr4KjMYFQWXaJEpvwuI5HNTcIFfRmcgY+W
	 z8bdK/Vw98V1ymYyduneVTj0e+oSYAmU5t6npIkTFiwJxf/ggdwDlPDKddwvUQMu5O
	 4HuRWmsVrUtWqXuEikspWZDLU/zznk7qwO6/pjhIM0NFHddEBs0TWChYL9rMocdg8V
	 4CnvWnePvNg3sYQrsMvySPMZDOs+Gz7CvKYMLOUacpvDxUkI7RpIqekwYVN2AZJn91
	 +5/MZeE4aExwmi9/p4Db9TUltBcKS/mwd42EGThw3TyJcUecEwqbepEqto1OyadxZ5
	 jgFsszNd35uxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm: sunplus: add Tibbo LTPP3G2 board support;
 update defconfig
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrew Gaylard" <ag@ffroot.co.za>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260902104545.67794-3-ag@ffroot.co.za>
References: <20260902104545.67794-1-ag@ffroot.co.za>
 <20260902104545.67794-3-ag@ffroot.co.za>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 11:00:39 +0000
Message-Id: <20260902110039.6FD1A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [Medium] The `rtc` node uses a non-existent `charging-mode` property that=
 is unsupported by the driver and violates device tree bindings.
- [Medium] The EEPROM node uses an invalid compatible string `at,24c16` ins=
tead of `atmel,24c16`.
- [Medium] The `CONFIG_I2C_GPIO` option is not enabled in `sp7021_defconfig=
`, which is required for the `i2c_tps` bus to function.
- [Medium] The board DTS creates a new root `led` node rather than overridi=
ng the SoC's `&leds` node, leading to duplicate `gpio-leds` instances.
- [Low] Invalid properties `spi-cpha` and `spi-cpol` applied directly to SP=
I controller nodes.
- [Low] The `i2c_tps` node uses deprecated properties `gpios`, `i2c-gpio,sc=
l-open-drain`, and `i2c-gpio,sda-open-drain`, violating the `i2c-gpio` sche=
ma.
- [Low] The `led@2` node uses a unit address in its name but lacks a `reg` =
property.
--

commit 21c4fb2cd185ac71c6b0d8d79e82b451794aa5c2
Author: Andrew Gaylard <ag@ffroot.co.za>

arm: sunplus: add Tibbo LTPP3G2 board support; update defconfig

This commit adds a device tree source for the Tibbo LTPP3G2 board based on
the SP7021 SoC. It includes node configurations for various peripherals like
I2C, SPI, RTC, and Ethernet. It also updates the defconfig to enable the
necessary options for the board to boot correctly.

> diff --git a/arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts b/arch/=
arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts
> new file mode 100644
> index 0000000000000..c42e6f779ce36
> --- /dev/null
> +++ b/arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts
> @@ -0,0 +1,301 @@

[ ... ]

> +	led {
> +		compatible =3D "gpio-leds";

[Severity: Medium]
Does creating a new root "led" node here rather than overriding the SoC's
existing "&leds" node from sunplus-sp7021.dtsi create duplicate gpio-leds
instances? This could result in an led subsystem sysfs naming conflict and
potential issues with the SoC's default floating pin mapping, since both
nodes contain a "system-led" subnode.

> +		pinctrl-names =3D "default", "sleep";
> +		pinctrl-0 =3D <&gpio_leds_pins>;
> +		pinctrl-1 =3D <&leds_s0_slp>;
> +		system-led {
> +			label =3D "system-led";
> +			gpios =3D <&pctl 6 GPIO_ACTIVE_HIGH>;
> +			default-state =3D "off";
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +		led@2 {

[Severity: Low]
Does this node violate the Devicetree Specification by including a unit
address ("@2") without a corresponding "reg" property? This will trigger a
unit_address_vs_reg compiler warning.

> +			label =3D "SG";
> +			gpios =3D <&pctl 7 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger =3D "heartbeat";
> +			default-state =3D "off";
> +		};
> +	};
> +
> +	i2c_tps: i2c-tps { /* eeprom */
> +		compatible =3D "i2c-gpio";
> +		i2c-gpio,scl-open-drain;
> +		i2c-gpio,sda-open-drain;
> +		i2c-gpio,delay-us =3D <1>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pins_i2ctps>;
> +		gpios =3D <&pctl 2 GPIO_ACTIVE_HIGH  /* SDA */
> +			 &pctl 1 GPIO_ACTIVE_HIGH  /* SCL */
> +			>;

[Severity: Low]
Is this node using deprecated properties for the i2c-gpio binding? The
schema requires "sda-gpios" and "scl-gpios", whereas using "gpios" alongside
the boolean open-drain flags triggers dtbs_check validation errors.

> +		eeprom: eeprom@50 {
> +			compatible =3D "at,24c16";

[Severity: Medium]
Is "at,24c16" an invalid compatible string for the Atmel EEPROM? The correct
vendor prefix for Atmel is "atmel". Using this non-existent string could
prevent the at24 EEPROM driver from matching and probing, making the device
inaccessible.

> +			reg =3D <0x50>;
> +			pagesize =3D <16>;
> +		};
> +	};
> +};

[ ... ]

> +&spi_controller0 {
> +	spi-cpha;
> +	spi-cpol;

[Severity: Low]
Are these slave-specific flags incorrectly placed on the master controller
node instead of the peripheral nodes? While the SPI controller driver ignor=
es
them on the controller node, this violates device tree schemas and causes
dtbs_check validation errors.

> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pins_spi0>;
> +	status =3D "disabled";
> +};
> +
> +&spi_controller1 {
> +	spi-cpha;
> +	spi-cpol;

[Severity: Low]
Are these slave-specific flags also incorrectly placed on this master
controller node?

> +	status =3D "disabled";
> +};
> +
> +&spi_controller2 {
> +	spi-cpha;
> +	spi-cpol;

[Severity: Low]
Are these slave-specific flags also incorrectly placed on this master
controller node?

> +	status =3D "disabled";
> +};

[ ... ]

> +&rtc {
> +	charging-mode =3D <0xE>;

[Severity: Medium]
Is "charging-mode" a non-existent legacy property? This violates the schema
and is unsupported by the driver, silently failing to configure the battery
trickle charger hardware, which could prevent the RTC battery from charging.

> +	/*
> +	 *      0xE     Disable
> +	 *      0x1     0.86mA (2K Ohm with diode)
> +	 *      0x5     1.81mA (250 Ohm with diode)

[ ... ]

> diff --git a/arch/arm/configs/sp7021_defconfig b/arch/arm/configs/sp7021_=
defconfig
> index ec723401b4405..e0c0692f455de 100644
> --- a/arch/arm/configs/sp7021_defconfig
> +++ b/arch/arm/configs/sp7021_defconfig

[ ... ]

> @@ -36,6 +45,25 @@ CONFIG_INPUT_EVDEV=3Dy
>  # CONFIG_LEGACY_PTYS is not set
>  # CONFIG_HW_RANDOM is not set
>  # CONFIG_HWMON is not set
> +CONFIG_SPI=3Dy
> +CONFIG_SPI_SUNPLUS_SP7021=3Dy
> +CONFIG_I2C=3Dy
> +CONFIG_I2C_CHARDEV=3Dy
> +CONFIG_EEPROM_AT24=3Dy

[Severity: Medium]
Is CONFIG_I2C_GPIO missing from this configuration? Since the board adds an
EEPROM on the i2c_tps bus using the "i2c-gpio" compatible, failing to enable
CONFIG_I2C_GPIO (which is a tristate and not selected by default) will
prevent the bus from probing and break access to the EEPROM.

> +CONFIG_MMC=3Dy
> +CONFIG_MMC_SUNPLUS=3Dy

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902104545.6779=
4-1-ag@ffroot.co.za?part=3D2
