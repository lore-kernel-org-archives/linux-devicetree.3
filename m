Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3FC4418DC
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778841605; cv=none; b=LbD6T7U3snwl4ChdUtBuyexWMPakmkB9asGrsnHLBE/FEd9AoWi3pEGd8gPe+HMYNkRBlJdgOjvAMWOlow1oRMuIGztQNuEALNmzV9lpjIDCL1JTV40mOJza7CjPMNf1bSZ1f3w+BRnZ4XoyhGfYBwR4XRGgeY9XklsmgUgZQ6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778841605; c=relaxed/simple;
	bh=eKi2qKHubFaDvuYqRnsNNKsUyuKz+oUbjhpEEMSKM3Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RH+sgpDqpAPEjngUCQCSXUL0s7fRlmi91annMaY7EFPey77+3Io6b00HNBGgIxe0aR5oiJwrUyJ/Bwlhif8XobVg899ZPEzVPc1a/DGxU5CgRcnuINsvfrD6nEw58Cl2Mo1zS4RCrlqA/WFt9+Kd5uc604TDyTsWZ6CJ+dtAsvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h2+nLt3S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h2+nLt3S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA92CC2BCB0;
	Fri, 15 May 2026 10:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778841604;
	bh=eKi2qKHubFaDvuYqRnsNNKsUyuKz+oUbjhpEEMSKM3Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=h2+nLt3SAYg4AHh9abgyRHqAHfO1fZ7AysELtAgwOA47cDHjGENaqWUbOl+xBZqXa
	 10UdzkCOOxK2bJDxTu81j8cM4dpAT4OqnifzdKxZfGTKhmZKAanJs9USrwlkVPfPXj
	 CCF0+DNBCVpPPE4+l1gAl5guj+yu3LP/c7NxUSCYb/6sn6tMwtM2t5Vn0iqDDhiwsX
	 L4+jFwqZj4dgC6gbQnmRk3BQGIn7cYo73X4qvUbLpjmHLQXJmQrSu+9Y5a+OU42/97
	 fw7q0+s8wgk6JGpT6McopfmPiw3khHx2GpC7yRGcQ6tFkV/YtZgZWsA3JODKhCYHHF
	 BlO7mpNiK1MZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] pinctrl: aspeed: Add AST2700 SoC1 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Billy Tsai" <billy_tsai@aspeedtech.com>
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515-pinctrl-single-bit-v3-3-e97da4312104@aspeedtech.com>
References: <20260515-pinctrl-single-bit-v3-3-e97da4312104@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 10:40:04 +0000
Message-Id: <20260515104004.BA92CC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Calling `devm_pinctrl_register()` before adding groups and functio=
ns breaks device tree pin hogs and exposes an initialization race.
- [High] The SGMII0 pin register offset and shift calculations are corrupte=
d by preceding virtual pins in the enum.
- [High] `ASPEED_G7_SOC1_MUX_FUNC_MASK` is defined as 0x7 instead of 0xF, l=
eaving the highest bit of the 4-bit mux field uncleared.
- [Medium] `aspeed_g7_soc1_pin_config_get()` violates the generic pinconf A=
PI by failing to return `-EINVAL` for inactive boolean parameters.
--

commit d166d24632d04188131a95c43f87c2fa9c723d2e
Author: Billy Tsai <billy_tsai@aspeedtech.com>

pinctrl: aspeed: Add AST2700 SoC1 support

This patch implements pin multiplexing and configuration for the AST2700
SoC1 SCU pinctrl block. It describes the packed-field register layout direc=
tly
in driver data and accesses the controller registers via regmap.

> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c b/drivers/pi=
nctrl/aspeed/pinctrl-aspeed-g7-soc1.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c

[ ... ]

> +#define ASPEED_G7_SOC1_MUX_FUNC_MASK 0x7
> +#define ASPEED_G7_SOC1_MUX_BITS_PER_PIN 4

Should this mask be 0xF to cover all 4 bits?

Since ASPEED_G7_SOC1_MUX_BITS_PER_PIN is 4, using 0x7 will only clear the
lower 3 bits when regmap_update_bits() is called. If the bootloader leaves
the 4th bit set, will it remain set and corrupt the pin multiplexing behavi=
or?

[ ... ]

> +	AC25,
> +	AB25,
> +	AC24,
> +	PCIERC2_PERST,
> +	PORTC_MODE,
> +	PORTD_MODE,
> +	SGMII0,
> +};

Since SGMII0 is placed after the virtual pins in this enum, its index becom=
es
219 instead of 216.=20

When aspeed_g7_soc1_pinmux_field_from_pin() calculates the shift using
(pin % 8) * 4, will this inflated offset skip 3 pin slots (12 bits) and
configure the wrong hardware bits for SGMII0? Would it be safer to move the
virtual pins to the end of the enum?

[ ... ]

> +static int aspeed_g7_soc1_pin_config_get(struct pinctrl_dev *pctldev,
> +					 unsigned int pin,
> +					 unsigned long *config)
> +{

[ ... ]

> +	val =3D (val_raw & (field.mask << field.shift)) >> field.shift;
> +	if (param =3D=3D PIN_CONFIG_DRIVE_STRENGTH)
> +		val =3D (val + ASPEED_G7_SOC1_DRV_STRENGTH_HW_BASE) *
> +		      ASPEED_G7_SOC1_DRV_STRENGTH_STEP_MA;
> +	else if (param !=3D PIN_CONFIG_BIAS_DISABLE)
> +		val =3D !val;
> +
> +	*config =3D pinconf_to_config_packed(param, val);
> +
> +	return 0;
> +}

Does this unconditionally return 0 (success) even if the queried boolean
parameter is not currently active?

The generic pinconf subsystem expects -EINVAL if a parameter like
PIN_CONFIG_BIAS_PULL_UP or PIN_CONFIG_BIAS_DISABLE is queried but not active
on the pin. Will returning 0 cause tools like debugfs to report mutually
exclusive states as active simultaneously?

[ ... ]

> +static int aspeed_g7_soc1_pinctrl_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	pctl->pctl =3D devm_pinctrl_register(dev, &aspeed_g7_soc1_desc, pctl);
> +	if (IS_ERR(pctl->pctl)) {
> +		dev_err(dev, "Failed to register pinctrl\n");
> +		return PTR_ERR(pctl->pctl);
> +	}
> +
> +	for (i =3D 0; i < ARRAY_SIZE(aspeed_g7_soc1_groups); i++) {
> +		const struct pingroup *grp =3D &aspeed_g7_soc1_groups[i];
> +
> +		ret =3D pinctrl_generic_add_group(pctl->pctl, grp->name, (unsigned int=
 *)grp->pins,
> +						grp->npins, pctl);

Is it safe to call devm_pinctrl_register() before the groups and functions
are added to the radix trees?

devm_pinctrl_register() immediately exposes the device and parses device tr=
ee
pin hogs via pinctrl_enable(). Will any DT hogs defined for this controller
fail to apply because the internal radix trees are still empty?=20

Should this use devm_pinctrl_register_and_init() instead, followed by an
explicit pinctrl_enable() after populating the groups and functions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-pinctrl-si=
ngle-bit-v3-0-e97da4312104@aspeedtech.com?part=3D3
