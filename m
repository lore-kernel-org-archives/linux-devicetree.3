Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C26046A618
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 12:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785934588; cv=none; b=d+cbkr+7bJ1YT7GG3brqh33QR5AIPupTH4Ie9Nq/d55Tcbl25qD4JljsHrsUrmKoKuoYsmry0SHYxTI2n049uTKKTt3f1w1EsIevaOCDy/1jC3g8tu00WeNQf32/zgB4wYSDEU/ise4dSElZcotbt14EnFNmwtcrRVCSAGwUVEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785934588; c=relaxed/simple;
	bh=OUdh5dVjZwpm5GHXeCYgdIEmOcPPJcGACLaDy1yQ7Gc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hOWjHW1OfNxw+9lZl9HZccOfhQJ/Bzm6k6mXOLR/jKaFzqIPOyTFbJx9U/wvcjegqBRhTKmeasCAnbiCZ4QiE3JpHyvG0Dl2ADXsBeSNUtbDnsgvXL8fyRq8takIlVLARx261uz4IxCBVFfamm1J2YZP5Y9Xc+H0pE+gWO7ZHX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oQLbhAof; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oQLbhAof"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 099411F000E9;
	Wed,  5 Aug 2026 12:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785934587;
	bh=EHOe7D0Rqo2CKv/chct+D+I/rUKJ6bbFuhYmu2XB/IE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oQLbhAofMk8sWrWoaAvAVWwzcHNiS7CSVOfT/ly69ztBzeqW9NhXw4Uv5mQon8jF+
	 m8aG/dL93Z4G0eijFbTzoERyfnmAL8LkngyxcNRZH/e4VWpYxejcu7StAKzmU8MUXh
	 iBZ7CSf3KuUgvmj4ikrdkRptoaS2K1ie9pA2mtg6bkg9IA6Lf3Zuj6oq6kmEFCO5ZC
	 RpVEIPnBR1ZodCT5wRcXggBdTXEVoySweSct/umZtkN8fpomvxhSF0iz0i7DjRoqY8
	 OGHSmex1sXyCx6J0uY6It+UIITrv6muyJy+i9t//NfcsA50lC4QRhaEgW/z7QssERK
	 PGMzZjzMi8BJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 15/36] pinctrl: airoha: add set_direction() helper
 for gpio_chip
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260805123408.3767648-16-mikhail.kshevetskiy@iopsys.eu>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
 <20260805123408.3767648-16-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 12:56:26 +0000
Message-Id: <20260805125627.099411F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] `airoha_gpio_set_direction()` uses `gpiochip_get_data()` on an unr=
egistered `gpio_chip`, causing a NULL pointer dereference during early pinc=
trl operations (e.g., when applying pinctrl hogs).
--

--- Patch [15]: [PATCH v10 15/36] pinctrl: airoha: add set_direction() help=
er for gpio_chip ---
commit 33e55fe74353aced7ea2a88787d4738053466b24
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: add set_direction() helper for gpio_chip

This commit adds a set_direction() helper for the gpio_chip abstraction
to consolidate GPIO direction configuration. It updates several functions
to use this newly defined helper instead of duplicating the logic.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index df1694296046c..e4ccf357df892 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c

[ ... ]

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
Does this code dereference a NULL pointer during early pinctrl initializati=
on?

If airoha_pinmux_set_direction() is called while applying device tree pinct=
rl
hogs (which happens in airoha_pinctrl_probe() before the gpiochip is
registered via airoha_pinctrl_add_gpiochip()), the chip->gpiodev pointer
will be NULL. Calling gpiochip_get_data() here will unconditionally
dereference that NULL pointer.

Would it be safer to retrieve the airoha_pinctrl struct using container_of()
on the embedded gpio_chip instead?

> +	u32 mask, index;
> +	int err;
> +

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

[Severity: High]
Will this pass an unregistered gpio_chip into the new helper when applying
pinctrl hogs for output or input direction during probe?

>  }
> =20
>  static const struct pinmux_ops airoha_pmxops =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805123408.3767=
648-1-mikhail.kshevetskiy@iopsys.eu?part=3D15
