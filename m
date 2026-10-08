Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0AE471259
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 08:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791448942; cv=none; b=j6qyMNOq0FN64+PHEFZkIkzkrKj6o6I9U3orKg4EY77orPeGjfP/3tGutPAO2z1i4f3eRSiJquDOm3tbp5OeAiRk1IjDR/qY7YKFYB1lRl+IeI2jss0uDDGtnIz3y6Y872gkggh2NfS4r8H06Cak0rqR5HrvzoGqZgTFQ8xowOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791448942; c=relaxed/simple;
	bh=7uT54i/HzpAIYpi8DBXfEnDBE3bCF7peCaioL5CQF5Y=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=gQ/qcGogscCJQAeDcB/8mzMYOCcl0O2JjHuVT8sxsnmwBlhkiDPWKFFhyU3LWpddwUG6XsawBCvuI2deCayHWzPJ/vg+IGK/vWpkpWe/shKaueq6w/CNBzQKBZSZ9qCdlnJalia5TsjB9up30A7ZdiQ3nlTpEpFwP2XQZMji4e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R8nReuiE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R8nReuiE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E18F1F00893;
	Thu,  8 Oct 2026 08:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791448938;
	bh=E5p4bSzjzSK6baJcEom5Sau+VKOVkA3Ds/bqWXWUnEE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R8nReuiEriDIOCk6njbLzMKIUHRYL1GOPegAS4ObcS0tO9cMOeRb29254eEEzbdoH
	 KNhgK+8viiu6eoRVKomGRP7j9jNiSugVT/yZj1EC2WlpyGMdgKVU5FQDw7uSYD1OqN
	 g5LD9XbGq0aInaNfnlEMDQoULTwJULsy5jo2bJslzjqUMw3wPKtZhihzRoJTyXpQgW
	 uV3QWIgbhI0rvJsOykIRpI5TizobvQj9C3/QTKy/lVGozpHxF9AdMi7BOsSOSrw3Fw
	 8wwZOkaDIAx4CowFLStspKcsxZjIojCCi0WEqmG5A2R/2cAZZP6M7GmfFIaX4ClHkX
	 RJooXinvpESEQ==
Message-ID: <sashiko-outbox-163847@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/6] iio: imu: adis16607: Add external clock sync
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radu Sabau" <radu.sabau@analog.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261008-adis16607-v2-5-7c94df80878a@analog.com>
References: <20261008-adis16607-v2-0-7c94df80878a@analog.com>
 <20261008-adis16607-v2-5-7c94df80878a@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 08:42:18 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] iio: adis16607: hardcoded clk_freq in SCALED mode causes timesta=
mp drift
- [Medium] iio: imu: adis16607: missing USER_SYNC clear leaves stale flash =
config
--

commit c8cae2338b805eec99b0652c721e93ee18498a36
Author: Radu Sabau <radu.sabau@analog.com>

iio: imu: adis16607: Add external clock sync support

This patch adds support for an optional external clock through the "clocks"
property. It selects between SYNC_DIRECT and SYNC_SCALED modes depending on
the supplied frequency, and defaults to the internal 8 kHz clock when no
clock is provided.

> diff --git a/drivers/iio/imu/adis16607.c b/drivers/iio/imu/adis16607.c
> --- a/drivers/iio/imu/adis16607.c
> +++ b/drivers/iio/imu/adis16607.c

[ ... ]

> @@ -1174,15 +1174,75 @@ static const struct adis16607_chip_info adis16607=
_3_chip_info =3D {
>  	.deltang_max_val =3D IIO_DEGREE_TO_RAD(2000),
>  };
> =20
> -/*
> - * No external clock sync support yet: always run on the internal clock.
> - * Default dec=3D0 after reset, so period =3D 1 / clk_freq.
> - */
>  static int adis16607_config_clk(struct adis16607 *st)
>  {
> -	st->clk_freq =3D (unsigned long)st->info->int_clk * 1000;
> +	struct device *dev =3D &st->adis.spi->dev;
> +	const struct adis16607_sync *sync_mode_data =3D NULL;
> +	unsigned long ext_clk_hz;
> +	struct clk *clk;
> +	int i;
> +
> +	clk =3D devm_clk_get_optional_enabled(dev, NULL);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	if (!clk) {
> +		st->clk_freq =3D (unsigned long)st->info->int_clk * 1000;
> +		st->sync_mode =3D ADIS16607_SYNC_DEFAULT;
> +		st->sample_period_ns =3D DIV_ROUND_CLOSEST_ULL((u64)NSEC_PER_SEC * 100=
0ULL,
> +							     st->clk_freq);
> +		return 0;
> +	}

[Severity: Medium]
If a user previously configured SCALED mode and saved it to flash, does
this early return leave stale flash sync settings active in the hardware?

Because soft resets restore non-volatile flash settings instead of clearing
them to hardware zero, returning here without explicitly clearing the sync
configuration might leave the device stuck waiting for an external clock
that no longer exists.

> +
> +	ext_clk_hz =3D clk_get_rate(clk);
> +
> +	for (i =3D 1; i < st->info->num_sync; i++) {
> +		if (ext_clk_hz >=3D st->info->sync_mode[i].min_rate &&
> +		    ext_clk_hz <=3D st->info->sync_mode[i].max_rate) {
> +			sync_mode_data =3D &st->info->sync_mode[i];
> +			break;
> +		}
> +	}
> +
> +	if (!sync_mode_data)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Clk rate: %lu not in a valid range\n",
> +				     ext_clk_hz);
> +
> +	st->sync_mode =3D sync_mode_data->sync_mode;
> +	/* DIRECT: external clock is the effective internal rate */
> +	st->clk_freq =3D ext_clk_hz * 1000;
> +
> +	/* Configure sync via USER_GPIO_CFG and USER_SYNC registers */
> +	if (st->sync_mode !=3D ADIS16607_SYNC_DEFAULT) {
> +		int ret;
> +
> +		/* Enable sync GPIO function */
> +		ret =3D adis_update_bits_base(&st->adis, ADIS16607_REG_USER_GPIO_CFG,
> +					    ADIS16607_SYNC_GPIO_MASK,
> +					    FIELD_PREP(ADIS16607_SYNC_GPIO_MASK, 1), 2);

[Severity: Medium]
In DIRECT mode, only the GPIO function is updated here. Does this rely
entirely on the prior soft reset to have cleared ADIS16607_SYNC_MODE_MASK
in the ADIS16607_REG_USER_SYNC register?

If flash settings were restored during the soft reset, the device might
still be configured for SCALED mode and operate at the wrong rate. Should
the driver explicitly overwrite ADIS16607_REG_USER_SYNC for all sync modes?

> +		if (ret)
> +			return ret;
> +
> +		/* Set sync mode in USER_SYNC register */
> +		if (st->sync_mode =3D=3D ADIS16607_SYNC_SCALED) {
> +			u16 sync_scale;
> +
> +			sync_scale =3D st->info->int_clk / ext_clk_hz;

[Severity: Medium]
Does this truncating integer division lead to inaccurate hardware sync scal=
es
when ext_clk_hz does not perfectly divide int_clk?

> +			ret =3D adis_write_reg_16(&st->adis, ADIS16607_REG_USER_SYNC,
> +						ADIS16607_SYNC_MODE_MASK | sync_scale);
> +			if (ret)
> +				return ret;
> +
> +			/* SCALED: effective rate is int_clk (ext_clk =C3=97 sync_scale =E2=
=89=88 int_clk) */
> +			st->clk_freq =3D (unsigned long)st->info->int_clk * 1000;

[Severity: Medium]
Does hardcoding the assumed clock frequency instead of dynamically computing
the true scaled frequency (ext_clk_hz * sync_scale * 1000) cause IIO
timestamps to systemically drift?

If ext_clk_hz does not perfectly divide the internal clock (e.g. ext_clk_hz
is 399 instead of 400), actual physical sampling will occur at a slightly
different rate than the hardcoded 8000 Hz.

When the trigger handler later increments timestamps using the miscalculated
st->sample_period_ns, does this introduce a systemic timestamp drift that
worsens over time?

> +		}
> +	}
> +
> +	/* Default dec=3D0 after reset: period =3D 1 / clk_freq */
>  	st->sample_period_ns =3D DIV_ROUND_CLOSEST_ULL((u64)NSEC_PER_SEC * 1000=
ULL,
> -						     st->clk_freq);
> +						      st->clk_freq);
> +
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-adis16607-=
v2-0-7c94df80878a@analog.com?part=3D5
