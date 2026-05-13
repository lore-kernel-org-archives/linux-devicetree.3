Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D0C2848BA
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 21:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707904; cv=none; b=D0CmH1SjJUYmlu5kjCCxIamZ2/AO4tcAvGesp7snwEL5GJBvcCS7B9RYesQF27g2Tbw0kM1YUuFpkBfuuDtZDuFn13qPzpmMfJ1f8LqEJdgtH9PLGXpoizqZjMJameFfQjhx3gMTXHe4foKHdcXev1e6J1azK4MYvWKnfH1cCDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707904; c=relaxed/simple;
	bh=TRZhlhbQoPgILtiv/7Rok5ubk/Hreccb9Tupnbe/FZA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q/1ZCiyb3XFEjRfMHKZTrti3l6a+KBMFxxvKkDNo6eFeesGyM8+o3t31nCi7BbMg4eatWf180ChGjVxdsA+WUXk24ew0STvIDbVfuxAdkJkjG+QJyxd9BBawRTpr1+hn5RdbZjpi7RZ07zDLbFlB9Fj6n4qS8FFCIUF4KFssgpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D/I5TeEX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D/I5TeEX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910F5C19425;
	Wed, 13 May 2026 21:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778707903;
	bh=TRZhlhbQoPgILtiv/7Rok5ubk/Hreccb9Tupnbe/FZA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=D/I5TeEXO6j23VJ3yPrIgR6IOu8VGj9JzfYIKlOxm6wDsqQClq9iPxhaCrBkwUa4P
	 THcsMGXOwu+KpqSfbkaHwIyuk0UV6uNlxwDqbpwSv0S8Sr8AQVGBtF/Qcd448JRg+M
	 Zg0+1ArrIwZLdpAORqDLhuLHvTetJrCQ7ExnccsAY5zU1WEvc1SGlEnrbEG8SIeDns
	 lktKC3S962J8KGIGSiDbyo1+Oavv2x9GVf1pHwrcoCoqX3tpcgmlx8pIFvG/HQWAWv
	 NI5HYQyXsCab2T9ps0OXXSTqlWoUQWrFKOYxyXb8CxDX+ENgcI+3raT9G6Ze4BGfWV
	 TkFV+2zIyf3fQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] arm64: dts: renesas: add support for solidrun
 rzg2l som and hb-iiot evb
Reply-To: sashiko-reviews@lists.linux.dev
To: "Josua Mayer" <josua@solid-run.com>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260512-rzg2-sr-boards-v3-2-f033fc96c906@solid-run.com>
References: <20260512-rzg2-sr-boards-v3-2-f033fc96c906@solid-run.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 21:31:43 +0000
Message-Id: <20260513213143.910F5C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Out-of-bounds `reserved-memory` regions relative to the defined `m=
emory` node.
- [High] Shared edge-triggered interrupt configuration causes lost interrup=
ts.
- [Medium] Invalid USB hub topology and swapped compatible strings under th=
e `ehci1` controller.
- [Medium] Redundant and semantically invalid `gpio-hog` nodes for interrup=
t inputs.
- [Low] Use of deprecated `gpio` property in fixed regulators.
- [Low] Copy-paste error in multiplexer channel comment.
--

commit 9b7832f1338d358b2387c66c4a4775d9ab744d4b
Author: Josua Mayer <josua@solid-run.com>

arm64: dts: renesas: add support for solidrun rzg2l som and hb-iiot evb

This commit adds support for the SolidRun RZ/G2L SoM on Hummingboard IIoT.
It defines device tree configurations for ethernet, eMMC, DDR, and WiFi/BT,
with overlays for configurable mux states.

Link: https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/r=
z-g2l-som/
Link: https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/h=
ummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/

> diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-common.d=
tsi b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-common.dtsi
> new file mode 100644
> index 0000000000000..fbf2e7c393bf3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-common.dtsi

[ ... ]

> +	/* power for USB-A J27 behind USB Hub Port 3 */
> +	regulator-vbus-2 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vbus2";
> +		regulator-always-on;
> +		regulator-max-microvolt =3D <5000000>;
> +		regulator-min-microvolt =3D <5000000>;
> +		gpio =3D <&tca6416_u20 12 GPIO_ACTIVE_HIGH>;

Should this be gpios instead of gpio? Modern device tree schemas require the
plural gpios property for regulator-fixed bindings. The singular gpio prope=
rty
is deprecated.

> +		enable-active-high;
> +	};
> +
> +	/* power for USB-A J27 behind USB Hub Port 4 */
> +	regulator-vbus-3 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vbus3";
> +		regulator-always-on;
> +		regulator-max-microvolt =3D <5000000>;
> +		regulator-min-microvolt =3D <5000000>;
> +		gpio =3D <&tca6416_u20 13 GPIO_ACTIVE_HIGH>;

Should this also be updated to gpios?

[ ... ]

> +	vmmc: regulator-mmc {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vmmc";
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-min-microvolt =3D <3300000>;
> +		startup-delay-us =3D <250>;
> +		vin-supply =3D <&v_3_3>;
> +		gpio =3D <&pinctrl RZG2L_GPIO(4, 1) GPIO_ACTIVE_HIGH>;

Does this regulator also need the plural gpios property?

> +		enable-active-high;
> +	};
> +
> +	/* power for USB-A J5003 */
> +	vbus1: regulator-vbus-1 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vbus1";
> +		regulator-max-microvolt =3D <5000000>;
> +		regulator-min-microvolt =3D <5000000>;
> +		gpio =3D <&tca6416_u20 14 GPIO_ACTIVE_HIGH>;

Should this use the gpios property as well?

[ ... ]

> +&ehci1 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	hub_2_0: hub@1 {
> +		compatible =3D "usb4b4,6502", "usb4b4,6506";

Are these compatible strings swapped with hub_3_0? The string usb4b4,6506
represents a USB 3.0 hub, but this node seems intended for the USB 2.0
portion.

> +		reg =3D <1>;
> +		peer-hub =3D <&hub_3_0>;
> +		reset-gpios =3D <&tca6416_u20 11 GPIO_ACTIVE_LOW>;
> +		vdd2-supply =3D <&v_3_3>;
> +		vdd-supply =3D <&v_1_2>;
> +	};
> +
> +	/* this device is not visible because host supports 2.0 only */
> +	hub_3_0: hub@2 {
> +		compatible =3D "usb4b4,6500", "usb4b4,6504";

The string usb4b4,6504 typically represents the USB 2.0 hub portion.

Also, does placing this USB 3.0 hub under an EHCI controller violate USB
hardware topology rules? EHCI is strictly a USB 2.0 controller.

Will claiming the same reset-gpios block lead to a resource conflict if both
hubs attempt to probe? Since the USB 3.0 portion is physically unconnected
to the SoC, should the hub_3_0 node and peer-hub references be removed?

> +		reg =3D <2>;
> +		peer-hub =3D <&hub_2_0>;
> +		reset-gpios =3D <&tca6416_u20 11 GPIO_ACTIVE_LOW>;
> +		vdd2-supply =3D <&v_3_3>;
> +		vdd-supply =3D <&v_1_2>;
> +	};
> +};

[ ... ]

> +		lvds-irq-hog {
> +			gpios =3D <13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP | GPIO_OPEN_DRAIN)>;

Is the GPIO_OPEN_DRAIN flag valid on an input pin? It is typically an output
driver flag.

Additionally, hogging an interrupt line can logically conflict with its IRQ
usage. Consumer drivers natively request the interrupt which configures the
line as an input. Could this trigger resource request failures?

> +			gpio-hog;
> +			input;
> +			line-name =3D "lvds-irq";
> +		};

[ ... ]

> +		sensor-irq-hog {
> +			gpios =3D <7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP | GPIO_OPEN_DRAIN)>;

Does this sensor interrupt also incorrectly use output driver flags on an
input pin, and logically conflict with the IRQ framework?

> +			gpio-hog;
> +			input;
> +			line-name =3D "sensor-irq";
> +		};
> +
> +		tpm-irq-hog {
> +			gpios =3D <9 (GPIO_ACTIVE_LOW | GPIO_PULL_UP | GPIO_OPEN_DRAIN)>;

Is this another instance where an interrupt line is redundantly hogged as an
input with invalid flags?

> +			gpio-hog;
> +			input;
> +			line-name =3D "tpm-irq";
> +		};
> +	};

[ ... ]

> +	light-sensor@44 {
> +		compatible =3D "isil,isl29023";
> +		reg =3D <0x44>;
> +		/* IRQ shared between accelerometer, light-sensor and Tamper input (J5=
007) */
> +		interrupts-extended =3D <&tca6416_u21 7 IRQ_TYPE_EDGE_FALLING>;
> +	};
> +
> +	accelerometer@53 {
> +		compatible =3D "adi,adxl345";
> +		reg =3D <0x53>;
> +		interrupts-extended =3D <&tca6416_u21 7 IRQ_TYPE_EDGE_FALLING>;

Will configuring shared physical lines as edge-triggered cause lost interru=
pts?
If one device pulls the line low and the second device asserts its interrupt
before the first releases it, no falling edge will be generated for the
second device. Should shared physical lines be configured as level-sensitive
instead?

> +		/* IRQ shared between accelerometer, light-sensor and Tamper input (J5=
007) */
> +		interrupt-names =3D "INT1";
> +	};

[ ... ]

> +		/* channel 2 routed to mipi-dsi connector (J25) */
> +		i2c_dsi: i2c@2 {
> +			reg =3D <2>;

[ ... ]

> +		/* channel 2 routed to lvds connector (J24) */
> +		i2c_lvds: i2c@3 {

This isn't a bug, but there's a copy-paste error in the comment. Should it =
say
channel 3 instead of channel 2?

> +			reg =3D <3>;

[ ... ]

> diff --git a/arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi b/arch/arm64/b=
oot/dts/renesas/rzg2l-sr-som.dtsi
> new file mode 100644
> index 0000000000000..297256299e7a8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi

[ ... ]

> +	reserved-memory {
> +		ranges;
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +
> +		mmp_reserved: linux,multimedia@68000000 {
> +			compatible =3D "shared-dma-pool";
> +			reg =3D <0x0 0x68000000 0x0 0x8000000>;
> +			reusable;
> +		};
> +
> +		global_cma: linux,cma@58000000 {
> +			compatible =3D "shared-dma-pool";
> +			reg =3D <0x0 0x58000000 0x0 0x10000000>;
> +			reusable;
> +			linux,cma-default;
> +		};
> +	};

[ ... ]

> +	memory@40000000 {
> +		reg =3D <0x0 0x40000000 0x0 0x20000000>;
> +		device_type =3D "memory";
> +	};

Will these reserved-memory regions cause early boot crashes if the bootload=
er
fails to dynamically patch the memory node size at runtime?

The memory@40000000 node hardcodes the RAM size to 512MB (0x20000000), which
means the memory map ends at 0x60000000. The global_cma region is placed at
0x58000000 extending to 0x68000000, and mmp_reserved is placed at 0x6800000=
0.
This places them largely or completely outside the explicitly defined 512MB
RAM boundaries.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-rzg2-sr-bo=
ards-v3-0-f033fc96c906@solid-run.com?part=3D2
