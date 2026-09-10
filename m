Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6FF4A8A3C
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 17:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789062491; cv=none; b=tNwnWG4IybyUcE8Ts+6lDiEG390bB1dWhEm2ND28Y4O9WOp+OYa2YK0rVXpVtCTUhFem/KM0LqovPWFB1lAHv4o8yixP7mn2m1Hokcug68+ClsZkh9ungu5HHz88exexbO1dLVIKsay9K2d9CU26qp4GmcCzeFTtqeLQOJw+w/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789062491; c=relaxed/simple;
	bh=bD//0WkGPVhxIPlupssabjviuS+RqqxisqEjKtqpfSA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rBbwoRlBhg6sSBo6+dOmYpQDTlbWrn4ijAqBSkPcczly31S6KrqTu+JObLTN9/akuox3nq/zyFh3JW1zn0IaKTj0Vys0vOtYNtzXMM9KIRXmP2vGQuh/itRjMFO59WeNA8y15kvOt91Oty9cSq8Ds3suWZi3Vtzpz5HaJdeAuc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FyFwOXpY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FyFwOXpY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC76C1F000FF;
	Thu, 10 Sep 2026 17:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789062483;
	bh=G6HueEuoe3zur8tf/blNF3CaqFPZ0G6OW0kXaKR8awI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FyFwOXpYkxiouoSXOi6RlemeWHwdWNjfDWw52KXG4bJDfiq9CybZnkupeoCutkoiH
	 A8WoV3GoWFab0Aw9dGHLGODIcylA5MvE+xp8YBFoz5dHTUU3iksZux9KCBKV8Cc9bH
	 KasKK5XK/SzCm+8CV+bnH0p9dV9tR4/SAcitqA5+OWTiq761My02e2mNN7jnmNpCyy
	 r4zKkyvLHZVWGieZSGIxsRfGEWXg8QcZGZpMXcmjGBac3UdosUFIbkqILtYGgRHuIA
	 9I0XaOOJzWGFPAbuZjZFkcJmU47pzkmsSBtKZ84PxgVosjMckVb8oHFUvp1/WRP3T1
	 q8iWI/LeX+9kQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 07/17] iio: adc: ad7768: Add power mode helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260910-ad7768-driver-v7-7-7f70b07627e1@analog.com>
References: <20260910-ad7768-driver-v7-0-7f70b07627e1@analog.com>
 <20260910-ad7768-driver-v7-7-7f70b07627e1@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 17:48:02 +0000
Message-Id: <20260910174802.EC76C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect register value is written to the MCLK_DIV bitfield for M=
EDIAN power mode, leading to hardware and software clock divergence.
--

commit 52c81df3b6fbeb2c9857e18cf49af9fcfe8ebeae
Author: Janani Sunil <janani.sunil@analog.com>

iio: adc: ad7768: Add power mode helper

Describe each power mode and its internal master-clock divisor in a
table. Replace the open-coded fast-mode setup with a helper that records
the active mode, preparing for dynamic mode selection.

> diff --git a/drivers/iio/adc/ad7768.c b/drivers/iio/adc/ad7768.c
> index 44ba19fb20962..be815b8c6766e 100644
> --- a/drivers/iio/adc/ad7768.c
> +++ b/drivers/iio/adc/ad7768.c
[ ... ]
> @@ -102,6 +104,17 @@ enum ad7768_clock_source {
>  	AD7768_CLOCK_SOURCE_LVDS,
>  };
> =20
> +struct ad7768_power_mode_info {
> +	unsigned int mode;
> +	unsigned int mclk_div;
> +};
> +
> +static const struct ad7768_power_mode_info ad7768_power_modes[] =3D {
> +	{ .mode =3D AD7768_POWER_MODE_POWER_MODE_LOW, .mclk_div =3D 32 },
> +	{ .mode =3D AD7768_POWER_MODE_POWER_MODE_MEDIAN, .mclk_div =3D 8 },
> +	{ .mode =3D AD7768_POWER_MODE_POWER_MODE_FAST, .mclk_div =3D 4 },
> +};
> +
[ ... ]
> @@ -330,6 +344,32 @@ static int ad7768_sync(struct ad7768_state *st)
>  			       AD7768_DATA_CONTROL_SPI_SYNC);
>  }
> =20
> +static int ad7768_set_power_mode(struct ad7768_state *st,
> +				 unsigned int mode_idx)
> +{
> +	const struct ad7768_power_mode_info *mode_info;
> +	int ret;
> +
> +	mode_info =3D &ad7768_power_modes[mode_idx];
> +	ret =3D regmap_update_bits(st->regmap, AD7768_REG_POWER_MODE,
> +				 AD7768_POWER_MODE_POWER_MODE_MSK |
> +				 AD7768_POWER_MODE_MCLK_DIV_MSK,
> +				 FIELD_PREP(AD7768_POWER_MODE_POWER_MODE_MSK,
> +					    mode_info->mode) |
> +				 FIELD_PREP(AD7768_POWER_MODE_MCLK_DIV_MSK,
> +					    mode_info->mode));

[Severity: High]
When configuring MEDIAN mode via ad7768_set_power_mode(), does this code
inadvertently configure the MCLK_DIV bitfield using the power mode
register value instead of the correct clock divider register code?

For MEDIAN power mode, mode_info->mode is 0x2. Writing 0x2 to the MCLK_DIV
bitfield sets the hardware divider to 4 (MCLK/4), instead of the expected
divider of 8 (MCLK/8, which requires register value 0x1).

Since ad7768_power_modes correctly defines mclk_div =3D 8 for MEDIAN mode, =
the
software will calculate output rates and delays based on a divider of 8, wh=
ile
the hardware runs twice as fast.

> +	if (ret)
> +		return ret;
> +
> +	ret =3D ad7768_sync(st);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-ad7768-dri=
ver-v7-0-7f70b07627e1@analog.com?part=3D7
