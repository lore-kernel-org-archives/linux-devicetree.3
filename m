Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8764302ED
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 22:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786055301; cv=none; b=JyE59DND15p5InhkdOqqnpnN37C3xV1oKN7quCn33NJ7u/dMPh5c3ix0YT+/mbuh40hR8hNkdWI2WcTNtryKe6pm8HOI9TSzbQ+dvt+v/8SWACJNq8l4zaOBMw5OOYSGCWfzYH/ld0nti3HvTdJfy4nRsGjIeu3c6mbWCnyEj+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786055301; c=relaxed/simple;
	bh=35mC7czCe20CoA+gBCU/gYTcl9LEXvpJ65V654kPGEY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kFoW5ZpoAcwMWjBYF+ptUqFMflZLlgvOeu6zeTgtQ7pGC0LugGcQfIwt0PVPPYkpFBQtNjsf3roH2u2icpURuxhBH64pMvkPA0HXE3KWPspdT1H8uQxbgSZXOXbTy8HwTviPE6M42zGIiqZ+XmX/GrtnDYeWi9vTud7OyqthRPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AN5GwtWk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AN5GwtWk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 815161F00A3A;
	Thu,  6 Aug 2026 22:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786055293;
	bh=euoKcPr/UtJdyIvhSIb4Hb4OQTZPTDktea3kyaMMmfQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AN5GwtWk3s+aIDS5zcFSpHPfmCuo4chh3/T07heyEBxBXb+a0OeZDJESKujgrm5lJ
	 xYrCTVuZ2hcZftwBFd6IQeb5f/URbwCPYzR23FEcDO3SDYkcgZQS+4y3mrIG9JV9Oz
	 gKJH6jU83OFxoqQT5n6YejxMeYr8IKJQ1Ls1ulCo9WeP+XnR8EVo2fzwzbU3SdcU7b
	 SPiL8vqd/nia0GDkel9j2glELICueuRnLI2Gy+I/8SICMD/WrVwZDZwxawBtKMoTJz
	 R6fAGWLYi7Tb94K5A4dScafkAnMKITc499L93hXh2vwm5wVf3zTnCZoo2mbrKHCxbx
	 a6xXcOHFjkBJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 16/37] pinctrl: airoha: add set_direction() helper
 for gpio_chip
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806220615.4078303-17-mikhail.kshevetskiy@iopsys.eu>
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
 <20260806220615.4078303-17-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 22:28:12 +0000
Message-Id: <20260806222813.815161F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The newly added `airoha_gpio_get_direction` and `airoha_gpio_set_d=
irection` helpers introduce a fatal NULL pointer dereference if pin configu=
rations are applied during `pinctrl_enable`.
--

--- Patch [16]: [PATCH v11 16/37] pinctrl: airoha: add set_direction() help=
er for gpio_chip ---
commit e29fc714c63ce8cf69a2d201c9cfc30258714834
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: add set_direction() helper for gpio_chip

This patch adds a set_direction() helper for the gpio_chip abstraction and
refactors existing functions to use it, intending no functional changes.

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
Will this result in a NULL pointer dereference during device probe if pinct=
rl
hogs are defined?

If the device tree defines hogs, they are applied when pinctrl_enable() is
called during probe. Looking at airoha_pinctrl_probe():

airoha_pinctrl_probe() {
	...
	err =3D pinctrl_enable(pinctrl->ctrl);
	...
	return airoha_pinctrl_add_gpiochip(pinctrl, pdev);
}

When pinctrl_enable() executes, it ends up calling the newly modified
airoha_pinmux_set_direction(), which delegates to airoha_gpio_set_direction=
().

At this stage, airoha_pinctrl_add_gpiochip() has not yet run, meaning
devm_gpiochip_add_data() hasn't been called, and chip->gpiodev is still NUL=
L.

Because gpiochip_get_data() dereferences chip->gpiodev->data, can this lead
to a crash on boot? Could the pinctrl context be derived using container_of=
()
instead, or perhaps the gpiochip could be registered before enabling pinctr=
l?

> +	u32 mask, index;
> +	int err;

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

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806220615.4078=
303-1-mikhail.kshevetskiy@iopsys.eu?part=3D16
