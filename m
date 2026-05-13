Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B54642A9D
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 04:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778644919; cv=none; b=bXEjZXAfZQ7afa740pRGOGG346nwlNHbGLSBNErS3am0C5QSLW36hD/m3VLbAXpH5vBRXmyj41H/EbfwUeXaIPob/MIuRoBGi1YetK9TCcBnQlGKvr4/o39Ql7k4BYrTXu/alhtqx3NYB3IDiQ82yzYujkDQc5PuAWEe3i6aLeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778644919; c=relaxed/simple;
	bh=c93f1lQnhEZlfRmvCATQf2Vy38aX1NSPAQaib4v7f1g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gqV/QNtAJYAqNQ/bCqxqmtedbRySe6OdOzZbjpmMZ8WBlVd77KFEO6sZpzmesC10rMNqUbEyJ4xd9PjNqP3nONCWXhreiyONVj7MoKrhqTociWCZXMmAx+/+xtghGVs7SB/yHAthSY44wlzeRWz4/j7f7a6MhsNYYCPFX7DeuE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IqNgOL4f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IqNgOL4f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0574C2BCC7;
	Wed, 13 May 2026 04:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778644918;
	bh=c93f1lQnhEZlfRmvCATQf2Vy38aX1NSPAQaib4v7f1g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=IqNgOL4faHvBMnLYwJlANnsCcj+qhGpzw7/V7nmweoZK9VND4m8KCe2oiHT/zhHWp
	 MXheG6otCyU4JPl40pTbBXro9+w8q3124+JKQLqKvXSixcXNxwAVmat0rhuZ3qZZ/w
	 hEd0sevpDYv7vf19sDeXgk/muNfe0psHeG6/SGd9UUxwoaoCrtYcb2s8En6mYwpFxz
	 M1rVdOigKMFTh0JLVe74guQvzMzp1RNRBmYbBsiMSmEB8LStUq/vGjiy07vFcHdmq+
	 3h1gwuvRNgNErPaEPw0JkVnn9jr9oUIgCgNfq/PBmp/tzoHDL+8R/DCYX36adPtFC8
	 4anxpXGBEhSQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/7] gpio: regmap: Add gpio_regmap_operation and
 write-enable support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260512033317.1602537-4-eleanor.lin@realtek.com>
References: <20260512033317.1602537-4-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 04:01:58 +0000
Message-Id: <20260513040158.B0574C2BCC7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] gpio_regmap_get() incorrectly uses the physical GPIO data leve=
l to determine its direction.
- [High] The new direction check in gpio_regmap_get() spoils the regmap cac=
he with volatile input values.
- [High] The write-enable (WREN) implementation overwrites the register poi=
nter and corrupts hardware registers if WREN and data registers differ.
--

commit aa0f1e735514010e24fe4769039de6cdc0302e5d
Author: Yu-Chun Lin <eleanor.lin@realtek.com>

gpio: regmap: Add gpio_regmap_operation and write-enable support

This commit extends the reg_mask_xlate callback with an operation type
parameter to allow different register and mask combinations per GPIO
operation. It also introduces a write-enable mechanism for hardware
requiring a protection bit before modifying control registers.

> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
[ ... ]
> @@ -78,10 +89,24 @@ static int gpio_regmap_get(struct gpio_chip *chip, un=
signed int offset)
>  	else
>  		base =3D gpio_regmap_addr(gpio->reg_set_base);
> =20
> -	ret =3D gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
> +	ret =3D gpio->reg_mask_xlate(gpio, GPIO_REGMAP_GET_OP, base, offset, &r=
eg, &dir_mask);
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D regmap_read(gpio->regmap, reg, &val);

Could this read operation spoil the regmap cache with volatile input values?

The comment further down in this function mentions bypassing the cache to
avoid spoiling it with pin input values, but calling regmap_read() here
appears to cache the state.

> +	if (ret)
> +		return ret;
> +
> +	if (val & dir_mask) {

Will this incorrectly evaluate the physical GPIO data level as the directio=
n?

Since base is set to the data register base earlier in the function, it
looks like this checks if the data bit is high or low rather than querying
a separate direction register. Would this cause an input pin driven high
to be treated as an output?

> +		ret =3D gpio->reg_mask_xlate(gpio, GPIO_REGMAP_OUT, base, offset, &reg=
, &mask);
> +		if (ret)
> +			return ret;
> +	} else {
> +		ret =3D gpio->reg_mask_xlate(gpio, GPIO_REGMAP_IN, base, offset, &reg,=
 &mask);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	/* ensure we don't spoil any register cache with pin input values */
>  	if (gpio->reg_dat_base =3D=3D gpio->reg_set_base)
>  		ret =3D regmap_read_bypassed(gpio->regmap, reg, &val);
[ ... ]
> @@ -98,10 +123,14 @@ static int gpio_regmap_set(struct gpio_chip *chip, u=
nsigned int offset,
>  {
>  	struct gpio_regmap *gpio =3D gpiochip_get_data(chip);
>  	unsigned int base =3D gpio_regmap_addr(gpio->reg_set_base);
> -	unsigned int reg, mask, mask_val;
> +	unsigned int reg, mask, mask_val, wren_mask;
>  	int ret;
> =20
> -	ret =3D gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
> +	ret =3D gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_WREN_OP, base, offse=
t, &reg, &wren_mask);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_OP, base, offset, &r=
eg, &mask);
>  	if (ret)
>  		return ret;

Is it possible for the second reg_mask_xlate() call to overwrite the
register pointer if the write-enable register is different from the data
register? Both calls pass the same reg pointer, which might result in the
first queried address being lost.

> =20
> @@ -112,9 +141,9 @@ static int gpio_regmap_set(struct gpio_chip *chip, un=
signed int offset,
> =20
>  	/* ignore input values which shadow the old output value */
>  	if (gpio->reg_dat_base =3D=3D gpio->reg_set_base)
> -		ret =3D regmap_write_bits(gpio->regmap, reg, mask, mask_val);
> +		ret =3D regmap_write_bits(gpio->regmap, reg, mask | wren_mask, mask_va=
l | wren_mask);
>  	else
> -		ret =3D regmap_update_bits(gpio->regmap, reg, mask, mask_val);
> +		ret =3D regmap_update_bits(gpio->regmap, reg, mask | wren_mask, mask_v=
al | wren_mask);
> =20
>  	return ret;
>  }

Does applying both masks at the same time contradict the mechanism described
in the commit message?

The message states the hardware requires setting the write-enable bit before
modifying GPIO control registers, but this writes both bits simultaneously.
Additionally, if the write-enable mask was intended for a different registe=
r,
could this bitwise OR apply the combined masks to the wrong register?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512033317.1602=
537-1-eleanor.lin@realtek.com?part=3D3
