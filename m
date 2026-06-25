Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2431AA797
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 16:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782404227; cv=none; b=o9CBPj7mUtE+X2RStkx9v6OQ6kU3rx81hMy+LgSKOfVymv/vOh/kBkbvLQBW5fQgG979sVploInf8TUTzhhAJOLR7jHv6Kmf5sG0q44l/5B5O/g1jhJDApL1GAvRfblQvq5UBVoT7n9xJZ0LN39iA/Nx2A9rhhwG/pvQTjtKExs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782404227; c=relaxed/simple;
	bh=rCW7cZhJReqwEYxK4wJYCEc4cm67YJxJ4EXDlg94ls8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SCvOf6ysbOvgBLBmb+3qMARa/VG0JBKMn9fI9KYxJs++nVS7OunpfKJ1c5sTxx5tE5NUo+6dndDib9v3Dn5vslsRaz97kdeBJ4DcetIfr+IhBuLQRvAUdIHoJP4iZ0PILzGNMzYpn5p78Xeu0odP0f1aHGNwrIMOnDfK/Ase9Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gcwZosO9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gcwZosO9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1436B1F000E9;
	Thu, 25 Jun 2026 16:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782404226;
	bh=JYaBrgg5R86cV/a7zRuKKZSNmILFwlIFAeYeP9cT2nM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gcwZosO9pawf6jNnAcZIGe5fGFCEuaxHLgapBA8v4PgU1gfnZwqlN3oMwqoOgabgR
	 GIPqd0TcSg1Gw2mbidIfHdD4NT6ycO9+l2J70YJomZ9N/N6r2yCDvEueDKyRJqxz0O
	 Z0St2Rid95DFnxRTmyeN99RYsvDDdo1vSG/POo8g2LLN6DTI6ytnpIrdWCZLoNNUKi
	 aK+xPzayu3PbnwC3jz+Qz5MuZT+2Wc/vdeIk53iayPr/XaGTdt5GRSZEzLAAh/hnUq
	 rVmMbAWXsiOvc5TQXHbicyJvjMyKYMx0mEWFxupZ0h/6OV9TOdk1u6nOv7lrYt6z7W
	 DeyHSbKafTxnQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: ti: Add support for the phyCORE-AM67x
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nathan Morrisson" <nmorrisson@phytec.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260625160214.4001298-2-nmorrisson@phytec.com>
References: <20260625160214.4001298-1-nmorrisson@phytec.com>
 <20260625160214.4001298-2-nmorrisson@phytec.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 16:17:05 +0000
Message-Id: <20260625161706.1436B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The PCF8574 GPIO expanders specify `IRQ_TYPE_LEVEL_LOW`, which is =
unsupported by the K3 GPIO controller and will cause probe failure.
- [Medium] The `reset-gpios` for `pcie0_rc` is specified as `GPIO_ACTIVE_HI=
GH`, which inverses the standard PCIe PERST# active-low logic.
- [Medium] Mismatch between `mcasp1` serializer configuration and its pin m=
ultiplexing: AXR2 is configured for RX but is not pinned out.
- [Medium] Button 'key-menu' connected to PCF8574 uses GPIO_ACTIVE_HIGH, ca=
using inverted logic.
- [Low] Typo in the micbias voltage property for the `tlv320aic3110` audio =
codec.
--

commit 736b51d7a471b4b2aa4f1281a1e87be6e988051c
Author: Nathan Morrisson <nmorrisson@phytec.com>

arm64: dts: ti: Add support for the phyCORE-AM67x

Add support for the PHYTEC phyCORE-AM67x SoM and the corresponding
phyBOARD-Rigel carrier board. The phyCORE-AM67x SoM uses the TI AM67x SoC
and can come with different sizes and models of DDR, eMMC, and SPI NOR
Flash.

Link: https://www.phytec.com/product/phycore-am67x/
Link: https://www.phytec.com/product/phyboard-am67x-development-kit/

> diff --git a/arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dts b/arch/a=
rm64/boot/dts/ti/k3-am6754-phyboard-rigel.dts
> new file mode 100644
> index 0000000000000..7853d4f5d3b95
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dts
[ ... ]
> +	keys {
> +		compatible =3D "gpio-keys";
> +		autorepeat;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&gpio_keys_pins_default>;
[ ... ]
> +		key-menu {
> +			label =3D "menu";
> +			linux,code =3D <KEY_MENU>;
> +			gpios =3D <&gpio_exp1 4 GPIO_ACTIVE_HIGH>;

[Severity: Medium]
Does this configuration cause the button to register as permanently pressed?

The key-menu button is connected to gpio_exp1, which is a PCF8574 expander.=
=20
These pins have internal weak pull-ups, meaning their default resting state=
=20
is HIGH, and buttons typically pull them to GND (LOW). Specifying=20
GPIO_ACTIVE_HIGH inverses the logical state unless a strong external=20
pull-down resistor is present.

> +		};
> +	};
[ ... ]
> +&main_pmx0 {
[ ... ]
> +	main_mcasp1_pins_default: main-mcasp1-default-pins {
> +		pinctrl-single,pins =3D <
> +			J722S_IOPAD(0x0090, PIN_INPUT, 2)	/* (P27) GPMC0_BE0n_CLE.MCASP1_ACLK=
X */
> +			J722S_IOPAD(0x0098, PIN_INPUT, 2)	/* (V21) GPMC0_WAIT0.MCASP1_AFSX */
> +			J722S_IOPAD(0x008c, PIN_OUTPUT, 2)	/* (N23) GPMC0_WEn.MCASP1_AXR0 */
> +		>;
> +	};

[Severity: Medium]
Will audio capture on the mcasp1 interface fail here because the data pin
is not connected?

The mcasp1 node below configures serial-dir index 2 to RX, enabling
MCASP1_AXR2. However, the corresponding pin configuration for MCASP1_AXR2
is missing from main_mcasp1_pins_default. The pin remains in its default
state, meaning the controller receives no data.

[ ... ]
> +&main_i2c1 {
[ ... ]
> +	audio_codec: audio-codec@18 {
> +		compatible =3D "ti,tlv320aic3110";
> +		reg =3D <0x18>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&audio_ext_refclk1_pins_default>;
> +		#sound-dai-cells =3D <0>;
> +		ai3xx-micbias-vg =3D <2>;

[Severity: Low]
Is there a typo in the micbias voltage property name?

The ti,tlv320aic3110 codec driver expects the property ai31xx-micbias-vg.
Using ai3xx-micbias-vg causes the driver to ignore this configuration and
fall back to the default 2.0V bias, which could cause incorrect microphone
gain or distortion.

> +		reset-gpios =3D <&gpio_exp1 7 GPIO_ACTIVE_LOW>;
[ ... ]
> +	gpio_exp0: gpio@20 {
> +		compatible =3D "nxp,pcf8574";
> +		reg =3D <0x20>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&gpio_exp0_int_pins_default>;
> +		interrupt-parent =3D <&main_gpio0>;
> +		interrupts =3D <21 IRQ_TYPE_LEVEL_LOW>;

[Severity: High]
Will this expander fail to probe due to an unsupported interrupt type?

The K3 GPIO controller driver (gpio-davinci.c) strictly supports only
edge-triggered interrupts and returns -EINVAL for level types in its
irq_set_type callback. This would prevent the expanders and all attached
devices from probing.

> +		gpio-line-names =3D "CSI3_STROBE", "CSI3_TRIGGER",
[ ... ]
> +&pcie0_rc {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&main_pcie_pins_default>;
> +	num-lanes =3D <1>;
> +	phys =3D <&serdes1_pcie_link>;
> +	phy-names =3D "pcie-phy";
> +	reset-gpios =3D <&main_gpio0 31 GPIO_ACTIVE_HIGH>;

[Severity: Medium]
Could this cause the PCIe endpoint to fail enumeration by keeping the
reset line asserted?

The standard PCIe PERST# signal is active-low. Specifying GPIO_ACTIVE_HIGH
causes the host controller to invert this logic, driving the line high when
it intends to assert reset, and low when it releases it. Unless the board
has a physical inverter on this line, the endpoint will remain in reset.

> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625160214.4001=
298-1-nmorrisson@phytec.com?part=3D2
