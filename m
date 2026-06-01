Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86318287E
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 12:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780318140; cv=none; b=f+y2LEMem03/IcF6kV4s4lZoKjDl5F0Yqmu4b+gd6kwPr2bfRRftuE9bdvdxfI/u+ZnRoQWWX08e+C6DQSt4U9LL5E/N4aXDY2Zs45LnuARjEMiLIh4v24tSOi8kjpXqJDOOKk4j0Z+i30Hy0+00CqS1Xq8LLKxPuCR4/PkE+l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780318140; c=relaxed/simple;
	bh=Bos//kkPLqaJJxGqQzc6ii7MmkoxDRXRsCu1O63zpB8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j6TXQe6qQWiZs1/1ok17FFe5l58eGVwRDCqzFZBZjyRXqfwocNx0ZWMpbXZSHoHZsMfea7gYK61FyTLQk0VWGsyxRe3VlcKzzprkO9hd+qJPsE3mYh3kfbg5h0kHdp7gf+q67G1EPkn4LFwIjLEt4Pe37igtqU5dXqem4VFI+Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TZpE1mrt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TZpE1mrt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0009B1F00893;
	Mon,  1 Jun 2026 12:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780318139;
	bh=z9fkFBDWbhL6B4BjyoenPcpprUUKYmyj8zNZbnOrOX8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TZpE1mrttxIUcuooIwlXLJm8jBczATk4C75E6EcLuDIkWpshNo+I67J5BnHC8XLwk
	 OfDtYfmy6WRVyKG0gQYQlN4eeCoYY6ZXIBtw+Mk0Cp+CGk6wfz7aQXEhZtbclU7RK9
	 B4EC0fKzQXmMxzna0W2v/Shpid5Xj4zCE5f5AixQWIHeA1/EeZ69cgsPrmuafXmzei
	 yYcjNT4w/U0geS5RJAjMwWXOCkg1z+HvV7lo9eDRdjQIGa5U9/2wnjA7WagjaChZ7T
	 qCmHrTI429AQnVmpRmTDNSphSoZde9M3W7TLFj8S+HlQa3TcinU9CoOlF1VraME99a
	 l1NVaAb67Bejg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: add Vicharak Axon board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hrushiraj Gandhi" <hrushirajg23@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260601123603.129679-2-hrushirajg23@gmail.com>
References: <20260601123603.129679-2-hrushirajg23@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 12:48:58 +0000
Message-Id: <20260601124859.0009B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Hardware resource conflict on combphy0_ps between SATA and PCIe.
- [High] Unsupported `enable-gpios` property will leave HDMI ports unpowere=
d.
- [Medium] Voltage mismatch in the `pcie20_avdd0v85` fixed regulator.
- [Medium] Missing sound card node and disabled I2S controller for the `es8=
388` audio codec.
- [Low] Missing `vpcie3v3-supply` property in PCIe nodes.
- [Low] `enable-active-high` property used without a corresponding `gpio` p=
roperty in fixed regulators.
- [Low] Use of obsolete `regulator-compatible` property in I2C regulator no=
des.
--

commit f0c2d80408904803253db0f7fedd438665749143
Author: Hrushiraj Gandhi <hrushirajg23@gmail.com>

arm64: dts: rockchip: add Vicharak Axon board

Add initial support for the Vicharak Axon single-board computer based on
the Rockchip RK3588 SoC.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-axon.dts b/arch/arm64/bo=
ot/dts/rockchip/rk3588-axon.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-axon.dts
[ ... ]
> +	pcie20_avdd0v85: pcie20-avdd0v85-regulator {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "pcie20_avdd0v85";
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-min-microvolt =3D <850000>;
> +		regulator-max-microvolt =3D <850000>;
> +		vin-supply =3D <&vdd_0v75_s0>;

[Severity: Medium]
Will this regulator fail to satisfy constraints during probe? The min and
max microvolt are set to 850mV, but the vin-supply is linked to
vdd_0v75_s0, which provides only 750mV. Since this fixed linear regulator
cannot step up the voltage, should this reference an 850mV supply like
vdd_0v85_s0 instead?

> +	};
[ ... ]
> +	sata_vcc_5v0: sata-vcc-5v0 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "sata_vcc_5v0";
> +		startup-delay-us =3D <5000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +		enable-active-high;

[Severity: Low]
Does this node trigger a dtbs_check schema warning? The enable-active-high
property is used here to denote polarity, but there is no corresponding
gpio or gpios property defined. This same pattern also appears in the
vcc3v3_io_expander and vcc5v0_usb20_host regulator nodes.

> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		vin-supply =3D <&vcc12v_dcin>;
> +	};
[ ... ]
> +&hdmi0 {
> +	enable-gpios =3D <&gpio1 RK_PB0 GPIO_ACTIVE_HIGH>;

[Severity: High]
Will these HDMI ports remain unpowered? The Rockchip DesignWare HDMI driver
does not parse or support the enable-gpios property, so these GPIOs will
never be asserted.=20

If these GPIOs are required to enable power to the transmitters, should
they be modeled as regulator-fixed nodes and linked properly so the power
domains are actually enabled?

> +	status =3D "okay";
> +};
[ ... ]
> +&hdmi1 {
> +	enable-gpios =3D <&gpio1 RK_PA7 GPIO_ACTIVE_HIGH>;

[Severity: High]
Is this subject to the same enable-gpios issue as hdmi0 above?

> +	status =3D "okay";
> +};
[ ... ]
> +&i2c0 {
> +	pinctrl-0 =3D <&i2c0m2_xfer>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +
> +	vdd_cpu_big0_s0: vdd_cpu_big0_mem_s0: regulator@42 {
> +		compatible =3D "rockchip,rk8602";
> +		fcs,suspend-voltage-selector =3D <1>;
> +		reg =3D <0x42>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-compatible =3D "rk860x-reg";

[Severity: Low]
Is the regulator-compatible property needed here? This property is obsolete
and not parsed by the modern regulator driver, which relies exclusively on
the standard compatible string. Leaving it in might generate dtbs_check
warnings. This also appears in the vdd_cpu_big1_s0 node.

> +		regulator-max-microvolt =3D <1050000>;
[ ... ]
> +&i2c3 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c3m0_xfer>;
> +	status =3D "okay";
> +
> +	es8388: audio-codec@11 {
> +		compatible =3D "everest,es8388";
> +		reg =3D <0x11>;
> +		clocks =3D <&cru I2S0_8CH_MCLKOUT>;

[Severity: Medium]
Is it expected that this audio codec will be unusable? It is instantiated
on the i2c3 bus, but there is no sound card node (such as
simple-audio-card) defined, and the i2s0_8ch controller it connects to
is not enabled.=20

Will the Linux audio subsystem fail to create an audio device without
those nodes?

> +		clock-names =3D "mclk";
[ ... ]
> +&pcie2x1l0 {
> +	reset-gpios =3D <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pcie2_0_rst>;
> +	status =3D "okay";
> +};

[Severity: High]
Will this cause a hardware resource conflict with sata0? In the RK3588 SoC,
both sata0 and pcie2x1l0 are hardwired to use the combphy0_ps Combo PHY by
default.=20

Since the device tree enables both of them without remapping the PHY, and
the PHY can only be configured in one mode at a time, won't probing both
cause a failure or overwrite the PHY configuration? Should one of these use
combphy2_psu instead?

[Severity: Low]
Is the vpcie3v3-supply property missing from this PCIe controller node?
The board configures 3.3V power via the vcc3v3_pcie20_sata30 regulator, but
without the supply association, the PCIe framework might not be able to
logically manage slot power during resets or suspend/resume cycles.

[ ... ]
> +&pcie3x4 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pcie3_reset>;
> +	reset-gpios =3D <&gpio4 RK_PB6 GPIO_ACTIVE_HIGH>;
> +	status =3D "okay";
> +};

[Severity: Low]
Is this node also missing its vpcie3v3-supply property for the slot power?

[ ... ]
> +&sata0 {
> +	status =3D "okay";
> +};

[Severity: High]
Is this the SATA controller that will conflict with pcie2x1l0 over
combphy0_ps?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601123603.1296=
79-2-hrushirajg23@gmail.com?part=3D1
