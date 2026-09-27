Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17B5394788
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 12:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790513698; cv=none; b=PsePkqPVOuJY+Z7rYQ2LCxJN8Y0JOAVw074Mq+OPj1RduXPfZ6LYLUZkAKhtt2zlKY1//EZhBH5V61gGIUd5FhD6QcssMgtxDd/PxmfrN9nmXLS3q5+UG5Qn5TR9hJQBLh5Z8bkSr+mLfST8IYdkajaXRSsJ5O2SKlUsGLKIjlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790513698; c=relaxed/simple;
	bh=yw4tQhw7o52IrBboBr5F2oZneSRtweyAtyR/r51Lmho=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sDppGXR0UFNljBbaMDige70D0av1ZPYFINVwyr7H6Er/phzUsNjZkP2sFXGtN/gOdczuqZtrYSpabT/lPfsNW1U+FhprKFm4wOxa7ruHMzArux1K1yxGRp24i8fok7XDE0oZxFG9hkCI37X/f4xZXD/iYk8vvhUCwza63Fk0D7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IcaX/6MV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IcaX/6MV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D5501F000FF;
	Sun, 27 Sep 2026 12:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790513696;
	bh=vsbjyUIfkF6TzNJIOoRevmmoaHSEY3X0YW+cBOI6Mf4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IcaX/6MV1T2oRbzvWTGvzdZpSr02hlnvQ+m0UPF46uGncHe/f00IRLoBvoP1rWEgf
	 nL0BW+4ymLV5UHhwWLgm9ES9SM8wT+rYOxa5gCLNtUP1I0lJuWwtgC37MmUOF7kJlQ
	 2mrT0+45Pf4wt9OpCgR3cc6hS+CIXnhiwkECB/sW0MzrU3X1+YEWdXdc1WFkP4O4MX
	 3eTKxE29VHxj/1OObPzLPcgnDEx79WJibQFCLhVFXtNE4dqzDrjPELm7p4pJW0AT3J
	 NzxJ0UFW0xHrmZUxZnmfeDqZR4VFgE/9qvvZ3oYYkeMjWVYJJj6uEfn9K/Lwxn/z51
	 ED2URovkiih3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2
Reply-To: sashiko-reviews@lists.linux.dev
To: BG9OXA <bg9oxa@163.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <179051262683.4055.12205303753370851498@163.com>
References: <179051260955.4055.15953866975694461812@163.com>
 <179051262683.4055.12205303753370851498@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 12:54:55 +0000
Message-Id: <20260927125456.4D5501F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] dts: copy-paste error in RK806 DVS null pin configuration
- [Medium] dts: es8388 node forces software match via incompatible schemas
- [Low] dts: outdated architectural comment contradicts USB3/Type-C impleme=
ntation
--

commit cc24bb0e57d3815603a751daab32d79cde59ecb8
Author: BG9OXA <bg9oxa@163.com>
Date:   Sun Sep 27 12:37:06 2026 +0000

    arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2

This commit adds a new device tree for the ALIENTEK QuarkPi-CA2 SBC, based =
on
the RK3588S SoC. It enables core functionalities like UART, eMMC, Ethernet,
HDMI, USB host ports, and analog audio.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts b/arch/=
arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts
> new file mode 100644
> index 0000000000000..f598af7fe2749
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts

[ ... ]

> +		rk806_dvs1_null: dvs1-null-pins {
> +			pins =3D "gpio_pwrctrl2";
> +			function =3D "pin_fun0";
> +		};
> +
> +		rk806_dvs2_null: dvs2-null-pins {
> +			pins =3D "gpio_pwrctrl2";
> +			function =3D "pin_fun0";
> +		};

[Severity: High]
Does this cause a pinmux collision during initialization? The pins property
for rk806_dvs1_null duplicates "gpio_pwrctrl2" instead of requesting
"gpio_pwrctrl1". During boot, the pinctrl subsystem will likely throw a
collision error when binding the PMIC pins, potentially leaving the system
unbootable or causing dependent regulators to defer probe indefinitely.

[ ... ]

> +/*
> + * USB3 =E2=80=94=E2=80=94 Type-C =E5=8F=A3=EF=BC=88=E8=B5=B0 usbdp_phy0=
 + u2phy0=EF=BC=89
> + *
> + * =E4=B8=BB=E7=BA=BF=E6=B2=A1=E6=9C=89 HUSB311=EF=BC=88TCPC=EF=BC=89=E9=
=A9=B1=E5=8A=A8=EF=BC=8CType-C =E7=9A=84=E6=8F=92=E5=85=A5=E6=96=B9=E5=90=
=91/=E8=A7=92=E8=89=B2=E5=88=87=E6=8D=A2=EF=BC=88CC =E6=A3=80=E6=B5=8B=EF=
=BC=89=E6=8B=BF=E4=B8=8D=E5=88=B0=EF=BC=8C
> + * =E6=95=85=E6=8C=89 rock-5c =E7=9A=84=E5=86=99=E6=B3=95=E5=9B=BA=E5=AE=
=9A=E6=88=90 host =E6=A8=A1=E5=BC=8F=EF=BC=8C=E4=B8=8D=E5=81=9A OTG/DP altm=
ode=E3=80=82
> + * VBUS =E7=94=B1 vbus5v0_typec =E6=8E=A7=E5=88=B6=EF=BC=88GPIO =3D gpio=
1 PC5=EF=BC=8C=E5=8E=82=E5=95=86 dtb =E5=AE=9E=E6=B5=8B=E5=80=BC=EF=BC=89=
=E3=80=82
> + */
> +&u2phy0 {

[Severity: Low]
Is this comment accurate for the current state of the device tree? It claims
no TCPC driver is available and no DP altmode is configured, but this direc=
tly
contradicts the husb311@4e node and dp0 configuration implemented elsewhere
in this file.

[ ... ]

> +	es8388: audio-codec@11 {
> +		/* =E2=AD=90=E2=AD=90=E2=AD=90 2026-09-26 =E5=85=B3=E9=94=AE=E4=BF=AE=
=E6=AD=A3=EF=BC=9A=E6=8A=8A everest,es8323 =E6=94=BE=E5=9C=A8**=E7=AC=AC=E4=
=B8=80=E4=BD=8D**=E3=80=82
> +		 *   =E5=8E=9F=E5=9B=A0=EF=BC=88=E8=AF=BB=E9=A9=B1=E5=8A=A8=E6=BA=90=
=E7=A0=81 + =E6=9D=BF=E4=B8=8A=E6=A8=A1=E5=9D=97=E5=AE=9E=E8=AF=81=EF=BC=89=
=EF=BC=9A
> +		 *   - =E4=B8=BB=E7=BA=BF es8328.c =E6=98=AF**=E7=AE=80=E5=8C=96=E7=89=
=88**=EF=BC=88888 =E8=A1=8C=EF=BC=89=EF=BC=8Ces8323.c =E6=98=AF**=E5=AE=8C=
=E6=95=B4=E7=89=88**=EF=BC=88791 =E8=A1=8C=EF=BC=8C
> +		 *     =E6=9C=89 set_dai_fmt / set_dai_sysclk / pcm_hw_params + coeff_=
div =E7=B3=BB=E6=95=B0=E8=A1=A8=EF=BC=89=E3=80=82
> +		 *   - compatible =E5=88=97=E8=A1=A8**=E6=8C=89=E9=A1=BA=E5=BA=8F=E5=
=8C=B9=E9=85=8D**=EF=BC=9A'everest,es8388' =E6=8E=92=E5=89=8D=E9=9D=A2=E4=
=BC=9A=E8=A2=AB es8328 =E6=8A=A2=E8=B5=B0=EF=BC=8C
> +		 *     =E6=89=80=E4=BB=A5=E5=BF=85=E9=A1=BB=E6=8A=8A es8323 =E6=8F=90=
=E5=88=B0=E7=AC=AC=E4=B8=80=E4=BD=8D=E6=89=8D=E8=83=BD=E8=AE=A9=E5=AE=8C=E6=
=95=B4=E7=89=88=E9=A9=B1=E5=8A=A8=E7=BB=91=E5=AE=9A=E3=80=82

[ ... ]

> +		 */
> +		compatible =3D "everest,es8323", "everest,es8388";
> +		reg =3D <0x11>;

[ ... ]

> +		AVDD-supply =3D <&vcc_3v3_s0>;
> +		DVDD-supply =3D <&vcc_1v8_s0>;
> +		HPVDD-supply =3D <&vcc_3v3_s0>;
> +		PVDD-supply =3D <&vcc_3v3_s0>;
> +		#sound-dai-cells =3D <0>;
> +	};

[Severity: Medium]
Will this cause device tree schema validation (dtbs_check) to fail? By plac=
ing
"everest,es8323" first to intentionally trick the kernel into loading a
different software driver, the tooling will map this node to es8316.yaml. T=
hat
schema strictly rejects capitalized properties like AVDD-supply, resulting =
in
schema errors.

Could we avoid overriding the exact hardware match string here, as device t=
rees
are meant to describe hardware rather than configure specific driver behavi=
or?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179051262312.4055.1=
1698105707712320261@163.com?part=3D2
