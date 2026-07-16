Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F248037AA78
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 07:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784185574; cv=none; b=QBx1l8qDVN1fliT3BgkkvbzVHg4ucAZHUN7Ua9KKFu53Qj1+2f7/L+pia+9T4N+YBihfxyTtOyNI9/1jQfvUojJJZ8/tfuICEUE+GjJDlI2mtcJ02+LdRl9gaA7RY87AZ+ZxUroJR1uyHjrfggVc51sKP2owHt9wm7zBMVCwpfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784185574; c=relaxed/simple;
	bh=DHbeBBoWF63nDs+Kj86fZ9znS4t4G7P+1Y1seAQtmPE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qL3wTTvPV8HNOtZXcqE2Wq/BTQzNwczWgl4X6uHryL7fVx1AIw0rvQftWVwI3lsR/2PHxmG6RH/r0WXvW8iwRjUEGU7LAjRx4FTiEHjt/CZDZ5ZZFAc99jzybgV0Jloy/Li+SPv9sBbXZIKY+PPI7bvj8Lede5/gS7qzJy4hAl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nV81pXkr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nV81pXkr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A70DF1F00A3A;
	Thu, 16 Jul 2026 07:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784185570;
	bh=ybgprzuaFoH1F40LA3cnuSmEEi5c2IxaRujzKllW428=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nV81pXkrJTvDkiDLTDT0PkDKvBeAuJRqRg3y+9m10IL6YKS5P3yyTzKolvOMS9zMm
	 gcl243YGlRXW5R0vFdwBtSZumYe4Y+VotbfxZk7VM7PTSpkoQLcHbpdt+Cd19ne5CE
	 2+2zDaFehuYXZEFXmfvqVkHr+yLszQbF1llVj14VUYZHEg8siK1wE47IkLDnfsLhgS
	 GOeCxlj7b+LCUsbB39uvF2kZByVH3syisFQYAElK+8hDMUkEZ7hh3/zDd7x4gpgWWn
	 ombREO76UomBjJoJ+lCFMycp4zKIZt6J8v84lwEwocu+1NELuiMmgm+NxRlu7bId7d
	 r+XeA1/MGBnLg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <b86032a8-42a9-4deb-a9ec-b1ff6c1935d6@smtp-relay.sendinblue.com>
References: <20260716065548.2466198-1-gahing@gahingwoo.com>
 <b86032a8-42a9-4deb-a9ec-b1ff6c1935d6@smtp-relay.sendinblue.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 07:06:10 +0000
Message-Id: <20260716070610.A70DF1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] Contradictory suspend state configuration for `vdd_cpu_lit_s0` a=
nd `vdd_gpu_s0` regulators.
- [Medium] `full-pwr-cycle-in-suspend` specified for eMMC without a `vmmc-s=
upply`.
- [Low] Missing ES8388 audio codec device node on I2C0 bus.
- [Low] Use of deprecated `gpio` property instead of `gpios` in `vcc_3v3_pc=
ie` fixed regulator.
--

--- Patch [2]: [PATCH v2 2/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-=
IO ---
commit cd4f511d2817d5912abf4ba85345906a62079b4e
Author: Jiaxing Hu <gahing@gahingwoo.com>

arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO

Add the ArmSoM CM5, an RK3576 compute module (rk3576-armsom-cm5.dtsi),
and its CM5-IO carrier (rk3576-armsom-cm5-io.dts). The module has the
RK806 PMIC, HYM8563 RTC, eMMC, GMAC0 with an on-module MotorComm YT8531
PHY, and the SDIO bus for the on-module WiFi.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts b/arch=
/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
> new file mode 100644
> index 0000000000000..79a903585197c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
> @@ -0,0 +1,401 @@

[ ... ]

> +	/* PCIe 3.3 V for the M.2 slot, gated by GPIO0 PC3. */
> +	vcc_3v3_pcie: regulator-vcc-3v3-pcie {
> +		compatible =3D "regulator-fixed";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pcie_pwr_en>;
> +		regulator-name =3D "vcc_3v3_pcie";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		enable-active-high;
> +		gpio =3D <&gpio0 RK_PC3 GPIO_ACTIVE_HIGH>;

[Severity: Low]
Does this regulator intentionally use the deprecated gpio property instead
of gpios? Using gpios here would match standard devicetree bindings and
the style used by other regulators in this file.

> +		startup-delay-us =3D <5000>;
> +		vin-supply =3D <&vcc_5v0_sys>;
> +	};

[ ... ]

> +/*
> + * I2C0: ES8388 audio codec @ 0x10, FUSB302 USB-C PD controller @ 0x22.
> + * Pinctrl i2c0m1 (GPIO0 PC4 SCL / GPIO0 PC5 SDA).
> + */
> +&i2c0 {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c0m1_xfer>;
> +
> +	usbc0: usb-typec@22 {

[Severity: Low]
The comment above mentions the ES8388 audio codec at 0x10, but is the device
node for it missing here in &i2c0?

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi b/arch/a=
rm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi
> new file mode 100644
> index 0000000000000..4612b7e1d6e8a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi
> @@ -0,0 +1,564 @@

[ ... ]

> +			vdd_cpu_lit_s0: dcdc-reg3 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <550000>;
> +				regulator-max-microvolt =3D <950000>;
> +				regulator-ramp-delay =3D <12500>;
> +				regulator-name =3D "vdd_cpu_lit_s0";
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-suspend-microvolt =3D <750000>;

[Severity: Medium]
Can a regulator be simultaneously turned off and maintain a specific suspend
voltage? Specifying both regulator-off-in-suspend and
regulator-suspend-microvolt appears contradictory and may cause unexpected
behavior during suspend.

> +				};
> +			};

[ ... ]

> +			vdd_gpu_s0: dcdc-reg5 {
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <550000>;
> +				regulator-max-microvolt =3D <900000>;
> +				regulator-ramp-delay =3D <12500>;
> +				regulator-name =3D "vdd_gpu_s0";
> +				regulator-enable-ramp-delay =3D <400>;
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-suspend-microvolt =3D <850000>;

[Severity: Medium]
Similar to vdd_cpu_lit_s0, is it correct to include both
regulator-off-in-suspend and regulator-suspend-microvolt here for the GPU
regulator?

> +				};
> +			};

[ ... ]

> +/* eMMC: on-module, HS400 200 MHz with enhanced strobe. */
> +&sdhci {
> +	bus-width =3D <8>;
> +	full-pwr-cycle-in-suspend;
> +	max-frequency =3D <200000000>;
> +	mmc-hs400-1_8v;
> +	mmc-hs400-enhanced-strobe;
> +	no-sdio;
> +	no-sd;
> +	non-removable;
> +	/delete-property/ supports-cqe;
> +	status =3D "okay";
> +};

[Severity: Medium]
Will full-pwr-cycle-in-suspend have any effect if vmmc-supply is not
specified? Without a vmmc-supply to control the power, the MMC core may not
be able to actually fully power down the device, potentially leading to sta=
te
mismatches on resume.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716065548.2466=
198-1-gahing@gahingwoo.com?part=3D2
