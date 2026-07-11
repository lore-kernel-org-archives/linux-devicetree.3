Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56255175A81
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 19:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783797103; cv=none; b=H/FNxojRUYhqD31aaTsRthAxCyI/Uky9+ALpnBHsNrlK90IZfhCYEhl5R4W+P8DoPHQqE71e96tCtHcn0YQg8k1e3Mko1ky7t/szIBnHPDCxwh4Wn1Bi8q8r/xlPmLSiwIlOGBQQRpJArEL4m6zvT/SbF0b7OJdiYSp6stmsze8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783797103; c=relaxed/simple;
	bh=P7gu7HnGX3EJTnq3fBQl+ad8Nc2Q1pMw+hfYVrELEo4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S41petVByamSdNDmzvysy/s9eqTq480yozW1jb2jpskZCRBQXnqDpjn2LKLAEr6hx6t+WehRKqWW2UMt8NqSh//Fn4uwMhUaKPC7WxmY8V10O+P+j0RIU7lYZews1g4asg78XqvEJqn+z5+jBFBvNyq3SW4yZUoOKZ4Dj+7727g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJW9sbRH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJW9sbRH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96ABF1F000E9;
	Sat, 11 Jul 2026 19:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783797101;
	bh=rpSoOlaSiblbhhL3GDj7o5VA95TJcOpZzV8/5LtV5Mo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HJW9sbRHzsQYz0vVG3B8dR1/47xK5KN0XVr9W3LLLdP9a4FGZmTeXRpuQgpAREHr/
	 XtZxUttaS9MbmOIhc2Xfe5JytbysJdo5dAh+SB9aYj9/5QVF30m7Z1t/liBGtZQc4q
	 3ixJeLVG65L4CRM3Dc8WxtFBzu83sEfPyhmL9N7bjFsqv4/2rzzOWdy6w1zcZ5Y3tk
	 9CwwireIV1G3khtnrK9YbufRVpoA5y7Ty09cPuS+KWwoP441IxA2OmcBiPjeN1xl3L
	 Z/zAbQZiQrozd8zpD2SfLc2l7Mz+lBPzwka9i9wEH5P3mMCxkkRRHJujof+h6YA4v3
	 m95L/1Itf2Rdg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add Xiaomi 11 Lite 5G NE
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleksii Onchul" <oleksiionchul@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260711184934.55701-3-oleksiionchul@gmail.com>
References: <20260711184934.55701-1-oleksiionchul@gmail.com>
 <20260711184934.55701-3-oleksiionchul@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 19:11:41 +0000
Message-Id: <20260711191141.96ABF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing 'cd-gpios' property for the SD card interface (&sdhc_2),=
 preventing reliable card insertion/removal detection.
- [Medium] Missing pinctrl configurations for the touchscreen and FSA4480 i=
nterrupt/reset GPIOs.
--

--- Patch [2]: [PATCH 2/2] arm64: dts: qcom: Add Xiaomi 11 Lite 5G NE ---
commit 22346a2ae0ab638635553e09fe60d37d9c64aa00
Author: Oleksii Onchul <oleksiionchul@gmail.com>

arm64: dts: qcom: Add Xiaomi 11 Lite 5G NE

Add initial support for the Xiaomi 11 Lite 5G NE, codenamed lisa.

> diff --git a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-lisa.dts b/arch/arm64=
/boot/dts/qcom/sm7325-xiaomi-lisa.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-lisa.dts

[ ... ]

> +	/* awinic,aw210xx_led @ 20 */
> +
> +	fsa4480: typec-mux@42 {
> +		compatible =3D "fcs,fsa4480";
> +		reg =3D <0x42>;
> +
> +		interrupts-extended =3D <&tlmm 2 IRQ_TYPE_LEVEL_LOW>;
> +
> +		vcc-supply =3D <&vreg_bob>;

[Severity: Medium]
Does the fsa4480 node need a pinctrl state to configure the pull-up for the
interrupt GPIO?

The FSA4480 interrupt pin is open-drain and typically requires a pull-up to
VDD. If the bootloader leaves this pin floating, could it cause an interrupt
storm or missed interrupts since no pinctrl-0 property is provided?

[ ... ]

> +&sdc2_data {
> +	drive-strength =3D <10>;
> +	bias-pull-up;
> +};
> +
> +&sdhc_2 {
> +	vmmc-supply =3D <&vreg_l7b_2p96>;
> +	vqmmc-supply =3D <&vreg_l19b_1p8>;
> +
> +	pinctrl-0 =3D <&sdc2_clk>, <&sdc2_cmd>, <&sdc2_data>;

[Severity: Medium]
Is a cd-gpios property missing from the &sdhc_2 node?

The commit message states that the SD card is supported, but without a card
detect GPIO, the MMC core might fall back to software polling (typically 1 =
Hz).
Could this polling prevent the SoC from entering deep sleep, causing a batt=
ery
drain on the device?

> +	pinctrl-1 =3D <&sdc2_clk_sleep>, <&sdc2_cmd_sleep>, <&sdc2_data_sleep>;
> +
> +	status =3D "okay";
> +};
> +
> +&spi13 {
> +	status =3D "okay";
> +
> +	touchscreen@0 {
> +		compatible =3D "goodix,gt9897";
> +		reg =3D <0>;
> +		spi-max-frequency =3D <6000000>;
> +
> +		interrupt-parent =3D <&tlmm>;
> +		interrupts =3D <81 IRQ_TYPE_LEVEL_LOW>;
> +
> +		reset-gpios =3D <&tlmm 105 GPIO_ACTIVE_LOW>;

[Severity: Medium]
Are pinctrl configurations needed here for the touchscreen interrupt and re=
set
GPIOs?

This node declares an interrupt on tlmm 81 and a reset on tlmm 105, but it
does not specify a pinctrl-0 to configure the pinmux state and biases of
these pins. Relying on the bootloader's default pin state for active
interrupts and resets might lead to unexpected behavior or power leakage.

> +
> +		avdd-supply =3D <&vreg_l7c_3p0>;
> +		vddio-supply =3D <&vreg_l2c_1p8>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711184934.5570=
1-1-oleksiionchul@gmail.com?part=3D2
