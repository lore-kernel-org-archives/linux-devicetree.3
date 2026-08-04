Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E214746B0
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 16:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860771; cv=none; b=p7plxdv2iTNweYEGkq1BPADyN3+LhwZbO7R9axDaXbzfmVqZXnj0TUmdfQuKVEjJ681dasUlNeoQTCvSGp9vDvZcOvHClhoYE1xdEavZ6TJMVxQkHFm/7VKXa2gXVAznH4YPHKqgAhDy0Np3xwFEzmT6Zbi+U0LqSYkpn8CBk50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860771; c=relaxed/simple;
	bh=Z7D0bx34ARn7eH+czW8Tp784xdwMgCSwY0CbRYxu2co=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gkYiiIBti+Iw509rL6y7K76Apph39PtuJVuzu4tx9eB4LMrZt3R9cdS6dWQUapH3ReVa7LDM9fz06gi1RIhEueHa0KTXRgMm6IOa19h5D+IXp0n5IeKPnM8KRQH2a3ClTmrwsA+HB++Sw/gbRkL4mfbM3w0mJ3aSvCq09QkFSyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y1sBNOKS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y1sBNOKS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83F571F000E9;
	Tue,  4 Aug 2026 16:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785860769;
	bh=ZUHlBBYkfs0VJQ2HCT/UB1yxSnDvkLiRaAyhkC2iFUE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y1sBNOKSBXTvL6Bf8xT63wlvLy1nLiS7ehSoJf3M+HyNV/jvPUWOBSTx2GRgvOTiY
	 9sdnFhmBPHuCaeyt2FfOkzAwZoP8co/1Ku0fzWw4qA2xlrpHqvRSksjIE5vUbsm5z4
	 LotiS3R6vT4HsDvyGLSWzf8dY2frI0xd7mN4Rottd0OU9Wk7zNF5YH5NnO3mJ1bEPQ
	 S8ud7f7djVTfXtxTdb/f0z5PLiN5eY2feUPRTCp1iI09KoLl1gP1CH4yzrGlOZGwwS
	 zFD51D24ymVPjRTCdn9FgZ41fdlE4d0E8rBcwsX4ZnmhBgqaTFSTt1z0HxO6bJrHXU
	 Dj9WXAH+RmGhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 15/36] pinctrl: airoha: add set_direction() helper
 for gpio_chip
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260804160419.3592327-16-mikhail.kshevetskiy@iopsys.eu>
References: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
 <20260804160419.3592327-16-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 16:26:08 +0000
Message-Id: <20260804162609.83F571F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Delegating to `airoha_gpio_set_direction()` and `airoha_gpio_get_d=
irection()` from pinmux/pinconf callbacks introduces a NULL pointer derefer=
ence during early pin controller initialization (e.g., processing device tr=
ee pin hogs).
--

--- Patch [15]: [PATCH v9 15/36] pinctrl: airoha: add set_direction() helpe=
r for gpio_chip ---
commit 284bb5b3beca75443ce82d7e07932f3712cf6811
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: add set_direction() helper for gpio_chip

The patch creates set_direction() helper for gpio_chip abstraction.
It also implements/reimplements some function using newly defined
helper.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index df1694296046c..e4ccf357df892 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -2539,12 +2539,42 @@ static int airoha_gpio_get_direction(struct gpio_=
chip *chip, unsigned int gpio)
>  	return val & mask ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
>  }
> =20
> +static int airoha_gpio_set_direction(struct gpio_chip *chip, unsigned in=
t gpio,
> +				     bool input)
> +{
> +	struct airoha_pinctrl *pinctrl =3D gpiochip_get_data(chip);

[Severity: High]
Does this code introduce a NULL pointer dereference during early pin contro=
ller
initialization?

During airoha_pinctrl_probe(), pinctrl processing of device tree pin hogs c=
an
occur before the GPIO chip is fully initialized. If a pin hog specifies
direction configurations, the pinctrl core will ultimately invoke
airoha_pinmux_set_direction().

That function now passes the uninitialized &pinctrl->gpiochip.chip into
airoha_gpio_set_direction(). When gpiochip_get_data(chip) is called here, it
dereferences chip->gpiodev, causing a panic since it is not initialized unt=
il
devm_gpiochip_add_data() runs later.

[ ... ]

> @@ -2761,27 +2791,13 @@ static int airoha_pinmux_set_direction(struct pin=
ctrl_dev *pctrl_dev,
>  					unsigned int p, bool input)
>  {
>  	struct airoha_pinctrl *pinctrl =3D pinctrl_dev_get_drvdata(pctrl_dev);
> -	u32 mask, index;
> -	int err, pin;
> +	int pin;
> =20
>  	pin =3D airoha_convert_pin_to_reg_offset(pctrl_dev, range, p);
>  	if (pin < 0)
>  		return pin;
> =20
> -	/* set output enable */
> -	mask =3D BIT(pin % AIROHA_PIN_BANK_SIZE);
> -	index =3D pin / AIROHA_PIN_BANK_SIZE;
> -	err =3D regmap_update_bits(pinctrl->regmap, pinctrl->gpiochip.out[index=
],
> -				 mask, !input ? mask : 0);
> -	if (err)
> -		return err;
> -
> -	/* set direction */
> -	mask =3D BIT(2 * (pin % AIROHA_REG_GPIOCTRL_NUM_PIN));
> -	index =3D pin / AIROHA_REG_GPIOCTRL_NUM_PIN;
> -	return regmap_update_bits(pinctrl->regmap,
> -				  pinctrl->gpiochip.dir[index], mask,
> -				  !input ? mask : 0);
> +	return airoha_gpio_set_direction(&pinctrl->gpiochip.chip, pin, input);
>  }
> =20
>  static const struct pinmux_ops airoha_pmxops =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804160419.3592=
327-1-mikhail.kshevetskiy@iopsys.eu?part=3D15
