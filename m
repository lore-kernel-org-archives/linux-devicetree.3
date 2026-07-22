Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933882C2363
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 21:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784757324; cv=none; b=Uj/kn8amwm0PggCRT0aZYgEo1Nm6B43QE5w8SQtAIB8ibhDywarxX3HYIQAqQeWQ+mKa75KiFwPE3TVqbrFnx7XlEkgctpJE4Vop1xlvFYZwxIJqzmtGcN0x3RZXR1rhyaoyGDGdnsx8K/JuVCjaSSV3aF5pzJ+JbgVB4LGMn5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784757324; c=relaxed/simple;
	bh=Ht6Ycywe28Bh2ZuBZ+3emGUTMuROdCuJ2B0pnAuxrCQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HfnNDIc0shxSqOs28JJX72MO8Z6K0vzwW2WLGNyH1K41p66ViIaVQEhlTE63vQeFbV10Y1JU+Z0/6pMBCgbP+vhipwzAIJgvcG3nGx9Wd7OvAbuqXF0Mxay25RSQ9WAHN5eOvT+Pa3VKs6Ah5bZvN9bjfmjsSKoG53aKiZdTMM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3l5rd2K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3l5rd2K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED99D1F000E9;
	Wed, 22 Jul 2026 21:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784757323;
	bh=5ZzBVdG+9e1fmFd7uouKFp/J6aCA68HuyxV4jaSex34=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b3l5rd2KYn4rpBvIBMLYm+tHQiBHwbzYM9E4zfZqClhtLVOQe7Ips89/qia/nLXwQ
	 ipQ1QMH+k3VGLfqHCAdBGdYITtMlVTSoIw5EFEHM3O8eu8KKTjP5up6rJ/e2v56upH
	 C1w+HjgvcrTv9IOxjhYQGBDxl7ZSThO6C80phpnxHUkqwYLQhk7b8DCg+CSLQWY1nd
	 41FczPvP/UlhwATLuCIClBogqVduouAGLPj8TsGiTV0hlj3+WVEjsnpAmF5z0umTiR
	 DsPkyFEdO/HNmo4allRWofq++KzFdAEQzW7q6ZNZO5ZxR7ezuuRJ7f6S3CEpJj1NLn
	 krBn62rhfqh6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: ti: Add support for the phyCORE-AM62Px
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Ma" <jma@phytec.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260722214052.1962414-2-jma@phytec.com>
References: <20260722214052.1962414-1-jma@phytec.com>
 <20260722214052.1962414-2-jma@phytec.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 21:55:22 +0000
Message-Id: <20260722215522.ED99D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Medium] Unresolved phandle and broken regulator dependency for `serial_f=
lash`.
- [Medium] Missing `bootph-all` or `bootph-pre-ram` property on `wkup_i2c0`.
- [Low] Invalid combined compatible strings for `usb0_connector` causing sc=
hema violations.
- [Low] Usage of deprecated `ti,fifo-depth` property in Ethernet PHY.
- [Low] Incomplete implementation of the `leds` node on the carrier board.
--

--- Patch [2]: [PATCH 2/2] arm64: dts: ti: Add support for the phyCORE-AM62=
Px ---
commit e5a41f1d4a35eca9058d8d88df8b8b23cefecfd1
Author: John Ma <jma@phytec.com>

arm64: dts: ti: Add support for the phyCORE-AM62Px

Add support for the PHYTEC phyCORE-AM62Px SoM and the
corresponding phyBOARD-Lynx carrier board.

Link: https://www.phytec.com/product/phycore-am62px/
Link: https://www.phytec.com/product/phyboard-am62px-development-kit/

> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-phycore-som.dtsi b/arch/arm6=
4/boot/dts/ti/k3-am62p-phycore-som.dtsi
> new file mode 100644
> index 0000000000000..434dd81a611da
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-phycore-som.dtsi

[ ... ]

> +&cpsw3g_mdio {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&main_mdio0_pins_default>;
> +	bootph-all;
> +	status =3D "okay";
> +
> +	cpsw3g_phy1: ethernet-phy@1 {
> +		reg =3D <1>;
> +		ti,rx-internal-delay =3D <DP83867_RGMIIDCTL_2_00_NS>;
> +		ti,fifo-depth =3D <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;

[Severity: Low]
Is the ti,fifo-depth property deprecated in the ti,dp83867.yaml device
tree schema? Should this be replaced with the standard tx-fifo-depth and
rx-fifo-depth properties to avoid dtbs_check warnings?

> +		ti,min-output-impedance;
> +	};
> +};

[ ... ]

> +&ospi0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&ospi0_pins_default>;
> +	status =3D "okay";
> +
> +	serial_flash: flash@0 {
> +		compatible =3D "jedec,spi-nor";
> +		reg =3D <0x0>;
> +		spi-tx-bus-width =3D <8>;
> +		spi-rx-bus-width =3D <8>;
> +		spi-max-frequency =3D <25000000>;
> +		vcc-supply =3D <&vdd_1v8>;

[Severity: Medium]
Does this vcc-supply incorrectly link the onboard SoM flash power supply
to a regulator (vdd_1v8) that only exists on the carrier board?=20

Because the flash is an on-SoM component, should it be powered by the
SoM PMIC (vdd_1v8_som) instead? Using a carrier board regulator here
could cause compilation errors if the SoM DTSI is used with a different
carrier board, and it misrepresents the hardware's power routing.

> +		cdns,tshsl-ns =3D <60>;
> +		cdns,tsd2d-ns =3D <60>;

[ ... ]

> +&wkup_i2c0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&wkup_i2c0_pins_default>;
> +	clock-frequency =3D <400000>;
> +	status =3D "okay";

[Severity: Medium]
Should the wkup_i2c0 node include the bootph-pre-ram or bootph-all
property?=20

The vdd_core regulator child node at 0x40 has bootph-pre-ram, meaning it
must be configured during U-Boot SPL. If the parent I2C bus lacks a boot
phase property, it will not be bound in SPL under the driver model,
preventing vdd_core from being initialized in early boot.

> +
> +	pmic@30 {
> +		compatible =3D "ti,tps65219";

[ ... ]

> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-phyboard-lynx.dts b/arch/ar=
m64/boot/dts/ti/k3-am62p5-phyboard-lynx.dts
> new file mode 100644
> index 0000000000000..6bc909a6944f1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-phyboard-lynx.dts

[ ... ]

> +	usb0_connector: connector {
> +		compatible =3D"gpio-usb-b-connector", "usb-c-connector";
> +		label =3D "USB-C";
> +		data-role =3D "dual";
> +
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&main_usbc_power_pins_default>;
> +
> +		id-gpios =3D <&main_gpio1 50 GPIO_ACTIVE_HIGH>;

[Severity: Low]
Are gpio-usb-b-connector and usb-c-connector mutually exclusive in the
DT schema?=20

Furthermore, does usb-c-connector prohibit the id-gpios property? Mixing
these could cause dtbs_check validation errors and implies confusion about
the physical port's topology.

> +
> +		port {
> +			usb0_con: endpoint {

[ ... ]

> +	leds {
> +		compatible =3D "gpio-leds";
> +		pinctrl-names =3D "default";
> +	};

[Severity: Low]
Is this leds node incomplete? The node is declared but left empty, even
though the gpio_exp0 GPIO expander explicitly allocates a line for
USER_LED2. Because the child LED node is not populated, the physical LED
might be inaccessible from the operating system.

> +
> +	sound {
> +		compatible =3D "simple-audio-card";

[ ... ]

> +&cpsw3g_mdio {
> +	cpsw3g_phy2: ethernet-phy@2 {
> +		reg =3D <2>;
> +		ti,rx-internal-delay =3D <DP83867_RGMIIDCTL_2_00_NS>;
> +		ti,fifo-depth =3D <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;

[Severity: Low]
Like the SoM Ethernet PHY, is the ti,fifo-depth property deprecated
here? Should it be replaced with the tx-fifo-depth and rx-fifo-depth
properties?

> +		ti,min-output-impedance;
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722214052.1962=
414-1-jma@phytec.com?part=3D2
