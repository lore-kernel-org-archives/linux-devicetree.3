Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629E53DF008
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139076; cv=none; b=OYDpCEEHb4DDoFq4a9eKztI+qIYJ2EHrHHN2ZZLSXokSBZK8o7a3ku07RnUNLD6SqbJ6YHhOoCzk6bq6wifvGaJykmdjYYKMqwzUOGzKWkm93jBKvDcN08Fb9u3yfdN9m5KYccP49gHmD+hMEo7LSHFjkCvFKacH6iVJgcwsdLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139076; c=relaxed/simple;
	bh=wVgzhUyi4HvxsVsuUgrmRfEgiTKsA+8n0FE3jWsMRkM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XAxuJexRVGjWfRjWDlXhihSCb+tSDn8rE97Qredo82rOIjG28pV+Fd5Q50gGzeZW77DNTf8YoPEgcGtG8KHNtsDFp1iHi1TmES4CMdlc8ILckKW0fP5fY1pNFoRGESSRl3+qQ8ZK4ai/AkG9sdWJut2XGzqf+5BfyFfTTdYUsJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aPJLzca0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aPJLzca0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C39FC1F000E9;
	Mon, 27 Jul 2026 07:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785139075;
	bh=5mqTSeIWnAjfnJqddqMJANJRRsUORLYMlXEFe5zZrow=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aPJLzca0r6BiBHIWR+eAEm1SLe0R7Pbd5bq46DF86N/txSe6lokgbyitGw1kJQm5X
	 y3xS0nxUXbocd4zZFdR6m3gqS6Wl3LDj6NHEOovl3beo/ZaywlFUdGMBiKjfTi63BI
	 hOVIIC0CjWOM8Q03dR7LuVEocHQCDWWW8j4OAUR9wOJBz9uRPAvr49rUHR8ltEUy5m
	 eY/2q3KORaId/38/aquw9pK/0hoyF90fFljtRCQYE4Rez2zq2VfeG2X7fOkogEkHCd
	 BGneOcQyivlShfrwS6qSBT3DeBDh2UZ1OvIaa+QG/gClWTDW4c2YVRnXaq0iz/oW3N
	 YD32fmZV5G/rA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 12/34] pinctrl: airoha: add missed get_direction()
 function for gpio_chip
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727074234.3761170-13-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-13-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 07:57:54 +0000
Message-Id: <20260727075754.C39FC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The newly added `airoha_gpio_get_direction` strictly checks a 2-bi=
t direction field, but the existing `airoha_pinmux_set_direction` only upda=
tes a 1-bit mask, causing `get_direction` to return `-EINVAL`.
--

--- Patch [12]: [PATCH v7 12/34] pinctrl: airoha: add missed get_direction(=
) function for gpio_chip ---
commit d5d33bb49ecef808432dc746e944b058a238f703
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: add missed get_direction() function for gpio_chip

This patch adds a missing get_direction function for the airoha gpio_chip.
It also updates pinconf to use this new function.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 4dae8c654f995..6a0ba54053fe7 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
[ ... ]
> @@ -2502,6 +2502,27 @@ static int airoha_gpio_get(struct gpio_chip *chip,=
 unsigned int gpio)
>  	return err ? err : !!(val & BIT(pin));
>  }
> =20
> +static int airoha_gpio_get_direction(struct gpio_chip *chip, unsigned in=
t gpio)
> +{
> +	struct airoha_pinctrl *pinctrl =3D gpiochip_get_data(chip);
> +	u32 mask, index, val;
> +	int err, field_shift;
> +
> +	field_shift =3D 2 * (gpio % AIROHA_REG_GPIOCTRL_NUM_PIN);
> +	mask =3D GENMASK(field_shift + 1, field_shift);
> +	index =3D gpio / AIROHA_REG_GPIOCTRL_NUM_PIN;
> +
> +	err =3D regmap_read(pinctrl->regmap,
> +			  pinctrl->gpiochip.dir[index], &val);
> +	if (err)
> +		return err;
> +
> +	if ((val & mask) > BIT(field_shift))
> +		return -EINVAL;

[Severity: High]
Will this strict 2-bit check cause get_direction to permanently fail for pi=
ns=20
configured with the upper bit set by the bootloader or hardware?

Looking at airoha_pinmux_set_direction() in the same file, it only uses a
1-bit mask when setting the direction:

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_pinmux_set_direction() {
    ...
    /* set direction */
    mask =3D BIT(2 * (pin % AIROHA_REG_GPIOCTRL_NUM_PIN));
    index =3D pin / AIROHA_REG_GPIOCTRL_NUM_PIN;
    return regmap_update_bits(pinctrl->regmap,
                              pinctrl->gpiochip.dir[index], mask,
                              !input ? mask : 0);
}

If the hardware or bootloader initially sets the upper direction bit for a
pin, setting the direction via airoha_pinmux_set_direction() will only
update the lower bit. When airoha_gpio_get_direction() is called later,
the upper bit will still be set. The expression (val & mask) would then be
greater than BIT(field_shift), causing it to return -EINVAL unconditionally.

Does airoha_pinmux_set_direction() need to be updated to clear the upper
bit, or should this newly added get_direction logic be more lenient?

> +
> +	return (val & mask) ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727074234.3761=
170-1-mikhail.kshevetskiy@iopsys.eu?part=3D12
