Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029F03D76
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 18:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785175481; cv=none; b=i03VRwrYxDcj2clSBS02jMptFjikFo1uKFr+tGUhi1+L21uTp7FaKGyk071i9RCP03XBWiS5sVMbaoFxJunsZeen8ku1+NVaMsHgdWWyf+H5W+yTE6v2NKLxduP8sk+QIq3JU5rAUzSUubD2u7fEFZhbj6BAqkBoY6MK4G3LOgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785175481; c=relaxed/simple;
	bh=i52t9OZ2YALWWpliEELTMApZI4aNmE2NX1cd3Uhtd2U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i5nmUMTg48sjjTx9P205mXGUxWiee9ylWlC2H/RxbTgT1c1WDFQwx+LiDKFMO1YsyUADHgE2NhuyyGMs7k9c73nftdgXnnlZyXo/DAy5QZQJBo3m7cElsODZQUVYKjvngG2p3a+D4lNelQRKU68V3MFDgvgoTMbamEVcgV89GzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QIkrhaV8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QIkrhaV8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CEAE1F000E9;
	Mon, 27 Jul 2026 18:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785175479;
	bh=wCUfN18AajrnxG40ecpI3F6/ZKEL381lIGKiXvVWxcM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QIkrhaV8BUM/VAvt02Nr8Xf1fEni/OErjDViPvT+wtW5A/crosSMH3Xo5KZG4tJKT
	 dgAH+rh6e/6WfFGRUh+caoWLWVJL/EORJ07vt/jmzHFsIKnTffQg9VZQWDUtr59kK+
	 tXT/+uSuHqLFANPQshGEx4YuFK8wi7kntWhubFsvtO9xF6l4amlQG+mJKHENk+Vxjq
	 mLzB4qU9iaB1qLDZlP2XhAATaD6gad/PG+rSac5VseqQvPMgFVAc55i9bWogXSlmVO
	 C1Oz+vRNNUAsYDLT6gV51Kxc3nI+3AkmdNVAGwwzAf1nW0yYVGGhMER/6z5+paCm5a
	 C18uJrEy6oRSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 13/35] pinctrl: airoha: add missed get_direction()
 function for gpio_chip
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727174141.664933-14-mikhail.kshevetskiy@iopsys.eu>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727174141.664933-14-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 18:04:38 +0000
Message-Id: <20260727180439.5CEAE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Using `gpiochip_get_data(chip)` in `airoha_gpio_get_direction` cau=
ses a NULL pointer dereference if `pin_config_get` is called before the GPI=
O chip is fully registered.
--

--- Patch [13]: [PATCH v8 13/35] pinctrl: airoha: add missed get_direction(=
) function for gpio_chip ---
commit 59145c1b1a08d456d92de5071ceaad70dfc29dea
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: add missed get_direction() function for gpio_chip

This patch adds missed get_direction() function for gpio_chip.
Also it reimplements pinconf's get_direction() function using
newly defined function.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index b7a234ce77558..40b1e4b110c2e 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -2503,6 +2503,22 @@ static int airoha_gpio_get(struct gpio_chip *chip,=
 unsigned int gpio)
>  	return err ? err : !!(val & BIT(pin));
>  }
> =20
> +static int airoha_gpio_get_direction(struct gpio_chip *chip, unsigned in=
t gpio)
> +{
> +	struct airoha_pinctrl *pinctrl =3D gpiochip_get_data(chip);
> +	u32 val, mask;
> +	u8 index;
> +	int err;
> +
> +	index =3D gpio / AIROHA_REG_GPIOCTRL_NUM_PIN;
> +	err =3D regmap_read(pinctrl->regmap, pinctrl->gpiochip.dir[index], &val=
);
> +	if (err)
> +		return err;
> +
> +	mask =3D BIT(2 * (gpio % AIROHA_REG_GPIOCTRL_NUM_PIN));
> +	return val & mask ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
> +}
> +
>  static int airoha_gpio_direction_output(struct gpio_chip *chip,
>  					unsigned int gpio, int value)
>  {

[ ... ]

> @@ -2858,21 +2875,18 @@ static int airoha_pinctrl_set_conf(struct airoha_=
pinctrl *pinctrl,
>  static int airoha_pinconf_get_direction(struct pinctrl_dev *pctrl_dev, u=
32 p)
>  {
>  	struct airoha_pinctrl *pinctrl =3D pinctrl_dev_get_drvdata(pctrl_dev);
> -	u32 val, mask;
> -	int err, pin;
> -	u8 index;
> +	int ret, pin;
> =20
>  	pin =3D airoha_convert_pin_to_reg_offset(pctrl_dev, NULL, p);
>  	if (pin < 0)
>  		return pin;
> =20
> -	index =3D pin / AIROHA_REG_GPIOCTRL_NUM_PIN;
> -	err =3D regmap_read(pinctrl->regmap, pinctrl->gpiochip.dir[index], &val=
);
> -	if (err)
> -		return err;
> +	ret =3D airoha_gpio_get_direction(&pinctrl->gpiochip.chip, pin);

[Severity: High]
Can delegating to the GPIO chip callback here cause a NULL pointer derefere=
nce?

During airoha_pinctrl_probe(), pinctrl_enable() is called before the
gpio_chip is registered via airoha_pinctrl_add_gpiochip(). This means
pinctrl debugfs entries are created and accessible while the gpio_chip
is still unregistered.

If a user reads /sys/kernel/debug/pinctrl/*/pinconf-pins during this window,
pinconf_generic_dump_one() will eventually call
airoha_pinconf_get_direction().

By calling airoha_gpio_get_direction() here, the code executes:

    struct airoha_pinctrl *pinctrl =3D gpiochip_get_data(chip);

gpiochip_get_data() accesses chip->gpiodev->data. Since the gpio_chip isn't
registered yet, chip->gpiodev is NULL, resulting in an immediate crash.
The previous implementation safely obtained the context via
pinctrl_dev_get_drvdata().

> +	if (ret < 0)
> +		return ret;
> =20
> -	mask =3D BIT(2 * (pin % AIROHA_REG_GPIOCTRL_NUM_PIN));
> -	return val & mask ? PIN_CONFIG_OUTPUT_ENABLE : PIN_CONFIG_INPUT_ENABLE;
> +	return ret =3D=3D GPIO_LINE_DIRECTION_OUT ?
> +	       PIN_CONFIG_OUTPUT_ENABLE : PIN_CONFIG_INPUT_ENABLE;
>  }
> =20
>  static int airoha_pinconf_get(struct pinctrl_dev *pctrl_dev,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727174141.6649=
33-1-mikhail.kshevetskiy@iopsys.eu?part=3D13
