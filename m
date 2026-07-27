Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4026762809
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139127; cv=none; b=WJIrP3WPJUw5VS4ZiUsHWUJdDIpGdsF205cs7xC39XI9jMXeu8VWF+hZ0/AvEoAtjI10+PQXUr8bXP1C05yiS5uZeuPj4LAGI94T7cXOaz4Tmyp94kcXtWOcfvCbw9kyZWZtzIbsSlIEmfjal2BqmHS4XP6qvbaiHMWS6SHY9TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139127; c=relaxed/simple;
	bh=d3uwm6wk+KS09QyJgNlspLohnbLccWSpYZ3hDVAJ2lY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a7uUxGUjVB/FlzoGoJ9HSVpIaIcjmt7319XC1xtUfwFowq2Z5ZC3l0WOBQiHPaab7/+vbQgv3Hha9jao8B66lWiZLWQOsaD+cZj8NrJL3rWSB8r4yBvZfwafvNsSse7Nzz1F1vyKatszs6WHFzI3SCKjwLCql9BUCeC293KGRG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LTZpEcMm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LTZpEcMm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D301F000E9;
	Mon, 27 Jul 2026 07:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785139125;
	bh=AM/e8ZRC+ttdUTqPNpdw2kxuB/xuGWvUJnkeSW6+buc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LTZpEcMmOQaJEUou7MUmvS3yN4DaHx9WsNc1+YT1FyW17bYNHAL4MzS/PF5r1nK8s
	 Ss7ydG9bk8a6vT70KJKU2UF2jBBrsnB+7axDNGQctYjWnhhb4+ogFh9fAgajPZwVGS
	 yu3UP0RcKqcb2o4iWYZr2/R/K1DOdnOfIIFizqafyRZxKURoXN+G14Qyw6VfLjRd8P
	 6Fow5k3vODQm5dEBIVlSOB40rOId3V7lq4N2IjClRGB955t7ndrdrtf1jaaXiaRy7/
	 nyRMqRaqLlp2gyioA2KUn5ILOAaUhYQgmmkoZeN3lbiE0PGxtAkgM0qkvoA405a5d7
	 0qYy0gCne5/og==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 13/34] pinctrl: airoha: add set_direction() helper
 for gpio_chip
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727074234.3761170-14-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-14-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 07:58:45 +0000
Message-Id: <20260727075845.89D301F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Unintended modification of adjacent bits in the GPIO direction r=
egister due to incorrect mask size, violating the 'No functional changes' c=
laim.
--

--- Patch [13]: [PATCH v7 13/34] pinctrl: airoha: add set_direction() helpe=
r for gpio_chip ---
commit e729e6b2ed1ea68da146d1ea646d1135a1f27b5e
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: add set_direction() helper for gpio_chip
   =20
The patch creates a set_direction() helper for the gpio_chip abstraction and
reimplements existing direction configuration to use this helper. The commit
message claims this is purely a cosmetic patch with no functional changes.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 6a0ba54053fe7..fcf498f7720c9 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
[ ... ]
> @@ -2523,12 +2523,43 @@ static int airoha_gpio_get_direction(struct gpio_=
chip *chip, unsigned int gpio)
[ ... ]
> +static int airoha_gpio_set_direction(struct gpio_chip *chip, unsigned in=
t gpio,
> +				     bool input)
> +{
[ ... ]
> +	/* set direction */
> +	field_shift =3D 2 * (gpio % AIROHA_REG_GPIOCTRL_NUM_PIN);
> +	mask =3D GENMASK(field_shift + 1, field_shift);
> +	index =3D gpio / AIROHA_REG_GPIOCTRL_NUM_PIN;
> +
> +	return regmap_update_bits(pinctrl->regmap,
> +				  pinctrl->gpiochip.dir[index],
> +				  mask, !input ? BIT(field_shift) : 0);
> +}

[Severity: Medium]
Does this new helper introduce a functional change contrary to the commit
message?

In the removed airoha_pinmux_set_direction() code shown below, the mask
covered exactly 1 bit:

    mask =3D BIT(2 * (pin % AIROHA_REG_GPIOCTRL_NUM_PIN));

Here in the new airoha_gpio_set_direction(), the mask spans 2 bits via
GENMASK(field_shift + 1, field_shift). The regmap_update_bits() call now
explicitly clears the upper bit of this 2-bit field.

Could this zeroing of the upper bit, which was previously preserved,
alter undocumented hardware state?

[ ... ]
> @@ -2752,27 +2783,13 @@ static int airoha_pinmux_set_direction(struct pin=
ctrl_dev *pctrl_dev,
[ ... ]
> -	/* set direction */
> -	mask =3D BIT(2 * (pin % AIROHA_REG_GPIOCTRL_NUM_PIN));
> -	index =3D pin / AIROHA_REG_GPIOCTRL_NUM_PIN;
> -	return regmap_update_bits(pinctrl->regmap,
> -				  pinctrl->gpiochip.dir[index], mask,
> -				  !input ? mask : 0);
> +	return airoha_gpio_set_direction(&pinctrl->gpiochip.chip, gpio, input);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727074234.3761=
170-1-mikhail.kshevetskiy@iopsys.eu?part=3D13
