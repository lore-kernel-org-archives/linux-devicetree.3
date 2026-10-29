Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793311341;
	b=fz3feLJ2Lb9idS8/OKa5jwi/wziwBX1Wg7missXi4f1c3fUxy1JWdGJhj2Eg40Qn9qkd
	 HIcq3h5q5hhxcxM159HstJuwPNsC8f2yDS8w6s3dOZJON5SdsVIJphYAJG/a1w1LRw38f
	 fvnVPOGaugdzY7YB6OTIhtThepzHy62+PXgJMQCAXx6VmUqQWlfEawTclhAoH/pcGNdGj
	 tRwGcYcRIZBILi2spKc8nwGs/DJJ7LlVzZDUnURB88LAme0UCRqg78jkeMbXeBwB7QbHF
	 KNpdo2QsQEdex6uA0p8UXGyBGwaAxKaRLttZfOj3Tu5BvWytcLkUTYPOd5dJOiGZvxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311341;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qljvFPemPcSgPuRu4Yu91ErhbUMEhZKYtTMBaEOWON8=;
	b=H/Bx8Ra664GOjZ9pGSfokwKzf0OuDUcOS++X4nFnNXd1BmUPx5HUfIe4KJqAzMefUlYe
	 L5EK8ZUkdh+6lh/jHIWPL7NWsqU1G6Ff8javdtlEuz8jtkAspOKwyhDqD8aQhA5kB1Jk+
	 fk58ICu0R4XFwxpNbNe9oculwWJ+4rj7p9cOfSgbLjmBPjwkFwO79CMst/VJoOzKw8J0E
	 t6OTW6VY2gKoKh283T6+nE7mESJLTI1oB7R4+qJ7cwhI1rPfH0O7crpigPK/1mcLUd5Jb
	 Vx5/ZFsTxY1trJhysPJ33SV/wWKoQ+3F3Zt3X7c8T7/CkHqzMtFeXG7JOG+qKomHygA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B6NIXo9V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1B9606A31A
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 22:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B6NIXo9V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 077701F01816;
	Thu, 29 Oct 2026 22:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793311341;
	bh=qljvFPemPcSgPuRu4Yu91ErhbUMEhZKYtTMBaEOWON8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B6NIXo9Vd6gjYjUZIIX36ZgY9yfol9WegFJxuou6ju//liv5j0RHJ8sBXQ+cty1HM
	 65bXVpjiJ1E+lLmOGTVFsXdIfKdLRbbZpDukaesHGLdmrJ2XRz8F5EFtuLe8ADdmZ7
	 72Kv1mR1Cj8v0Ai216PbLupfiM2YnTi7Th2qhx1CWN3BTh8D3HGSyTgTBCXq7luhLZ
	 RLYvnACvMvA8ikfwbx7eqxtA++3Tpdj5yPlp/VPfr/9gbWULkMapR5H09KeHG0C9zz
	 NEtTEJRP7MD0L7lYzS58ISINdDJs73vBK9N2OWxdPXTH4lXVg/BlBm/c7nGp9Ardil
	 GEMnU8IrePE/w==
Message-ID: <sashiko-outbox-190035@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: stratix10: define the i2c1 pins for
 pinctrl
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dinh Nguyen" <dinguyen@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261029213201.718625-3-dinguyen@kernel.org>
References: <20261029213201.718625-1-dinguyen@kernel.org>
 <20261029213201.718625-3-dinguyen@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 22:02:19 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] arm64: dts: stratix10: wrong I2C1_SCL pinmux offset in nand GPIO s=
tate
- [High] arm64: dts: stratix10: i2c1 pinmux nodes attached to i2c2 controll=
er
- [Medium] arm64: dts: stratix10: missing scl-gpios and sda-gpios for I2C r=
ecovery
--

commit 6b60cc5dbb08c4ec389238c564d8da6f01a7cc28
Author: Dinh Nguyen <dinguyen@kernel.org>

arm64: dts: stratix10: define the i2c1 pins for pinctrl

This commit adds I2C1 pinctrl pin definitions and recovery states to the
Stratix10 SoCDK eMMC and NAND daughter card device trees to support I2C bus
recovery.

> diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_emmc.dts =
b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_emmc.dts
> index b2a3449638dd3..743a4db0423d8 100644
> --- a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_emmc.dts
> +++ b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_emmc.dts
> @@ -12,6 +12,22 @@ / {
>  			"altr,socfpga-stratix10";
>  };
> =20
> +&pinctrl0 {
> +	i2c1_pmx_func: i2c1-pmx-func-pins {
> +		pinctrl-single,pins =3D <
> +			0x78   0x4   /* I2C1_SDA (IO6) PIN30SEL) */
> +			0x7c   0x4   /* I2C1_SCL (IO7) PIN31SEL */
> +		>;
> +	};
> +
> +	i2c1_pmx_func_gpio: i2c1-pmx-func-gpio-pins {
> +		pinctrl-single,pins =3D <
> +			0x78   0x8   /* I2C1_SDA (IO6) PIN30SEL) */
> +			0x7c   0x8   /* I2C1_SCL (IO7) PIN31SEL */
> +		>;
> +	};
> +};
> +
>  &gmac2 {
>  	status =3D "okay";
>  	/* PHY delays is configured via skew properties */
> @@ -57,6 +73,10 @@ &i2c2 {
>  	i2c-sda-falling-time-ns =3D <890>;  /* hcnt */
>  	i2c-scl-falling-time-ns =3D <890>;  /* lcnt */
> =20
> +	pinctrl-names =3D "default", "gpio";
> +	pinctrl-0 =3D <&i2c1_pmx_func>;
> +	pinctrl-1 =3D <&i2c1_pmx_func_gpio>;

[Severity: High]
Are the i2c1_pmx_func and i2c1_pmx_func_gpio pinctrl states attached to the
right I2C controller node here and in socfpga_stratix10_socdk_nand.dts?

In arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi, i2c1 is i2c@ffc02900
and i2c2 is i2c@ffc02a00. In socfpga_stratix10_socdk.dts, i2c1_pmx_func and
i2c1_pmx_func_gpio configure PIN30SEL (0x78, I2C1_SDA) and PIN31SEL (0x7c,
I2C1_SCL) and are attached to &i2c1.

Here (and in socfpga_stratix10_socdk_nand.dts), those I2C1 pinmux states are
attached to &i2c2 instead of &i2c1, so when &i2c2 probes via
really_probe() -> pinctrl_bind_pins(), it muxes the I2C1 pins rather than
configuring pins for i2c2 or using the &i2c1 controller.

[ ... ]

> diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts =
b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts
> index 7951ce46ae1f6..21d25a10e472a 100644
> --- a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts
> +++ b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts
> @@ -56,6 +56,22 @@ &gpio1 {
>  	status =3D "okay";
>  };
> =20
> +&pinctrl0 {
> +	i2c1_pmx_func: i2c1-pmx-func-pins {
> +		pinctrl-single,pins =3D <
> +			0x78   0x4   /* I2C1_SDA (IO6) PIN30SEL) */
> +			0x7c   0x4   /* I2C1_SCL (IO7) PIN31SEL */
> +		>;
> +	};
> +
> +	i2c1_pmx_func_gpio: i2c1-pmx-func-gpio-pins {
> +		pinctrl-single,pins =3D <
> +			0x78   0x8   /* I2C1_SDA (IO6) PIN30SEL) */
> +			0x1c   0x8   /* I2C1_SCL (IO7) PIN31SEL */

[Severity: High]
Should the register offset for I2C1_SCL (PIN31SEL) in i2c1_pmx_func_gpio be
0x7c instead of 0x1c?

In i2c1_pmx_func right above (and in socfpga_stratix10_socdk_emmc.dts),
PIN31SEL is at offset 0x7c. Using 0x1c in i2c1_pmx_func_gpio writes 0x8 to
PIN7SEL when the "gpio" pinctrl state is selected via pinctrl_select_state(=
),
leaving I2C1_SCL (PIN31SEL) in I2C mode and leaving PIN7SEL overwritten even
after switching back to the "default" state.

> +		>;
> +	};
> +};
> +
>  &gmac2 {
>  	status =3D "okay";
>  	phy-mode =3D "rgmii";
> @@ -130,6 +146,10 @@ &i2c2 {
>  	i2c-sda-falling-time-ns =3D <890>;  /* hcnt */
>  	i2c-scl-falling-time-ns =3D <890>;  /* lcnt */
> =20
> +	pinctrl-names =3D "default", "gpio";
> +	pinctrl-0 =3D <&i2c1_pmx_func>;
> +	pinctrl-1 =3D <&i2c1_pmx_func_gpio>;

[Severity: Medium]
Can DesignWare I2C bus recovery initialize without scl-gpios and sda-gpios
defined in the I2C node in both socfpga_stratix10_socdk_emmc.dts and
socfpga_stratix10_socdk_nand.dts?

When the controller probes via i2c_dw_probe_master() ->
i2c_dw_init_recovery_info() in drivers/i2c/busses/i2c-designware-master.c, =
it
checks for the "scl" GPIO first:

	gpio =3D devm_gpiod_get_optional(dev->dev, "scl", GPIOD_OUT_HIGH);
	if (IS_ERR_OR_NULL(gpio))
		return PTR_ERR_OR_ZERO(gpio);

Without scl-gpios (and sda-gpios, as present in socfpga_stratix10_socdk.dts:

	scl-gpios =3D <&portb 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
	sda-gpios =3D <&portb 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;

), i2c_dw_init_recovery_info() returns early before calling
devm_pinctrl_get() or setting adap->bus_recovery_info, so i2c_init_recovery=
()
never sets up GPIO bus recovery.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029213201.7186=
25-1-dinguyen@kernel.org?part=3D3
