Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B994F384245
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 14:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788532388; cv=none; b=WQgalQ6WopbkActsggTgPGMC9Fc9B9Zujp/Z4qb3bE75Q7N/2UpGDiuB2rooltGaZF0qV+WkQUcubee91hckJKs5ZklsLHDM2BWgsV+IVBo9GvviwdKgVy1t1Oup4guqInWVwrG3nsag2mdGc7xBqJE5PupYNvxbOUyFFWPYCyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788532388; c=relaxed/simple;
	bh=qTqV4icXev1xqqfRbX9CsDa0fdXUekzRl/se2xSgf0o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nlVTyimxQ4q6OhZXH9zvqBvppeuUBon8QrSa95hmsKVhx6zPDyhkwP4glxA5u48GTu6J1/7OCEjwapGSTbQBu56s4IbR43IG/1AHWBMmG/BvVUDDolS9OaC0PV86Nfzhqg/Gxon5N4aBFG1FhZcj7xP8jwUsW82JApN5dkp4LiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LQmhSwty; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LQmhSwty"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 046191F00A3D;
	Fri,  4 Sep 2026 14:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788532386;
	bh=zxb361QwtWURjkgaPjW030EIHEpOJ8YTO7VE59BdGzE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LQmhSwtyIdnj7qlRzsZQwlED7ChUk/ppiAO7V9o2ws7AhUhw4zS2hIaJot2oWfpIQ
	 WeWhwhgNjOP0Cpfosq8EQQIMSvwbYbpo6zou/B1rpUQXkhx7dtS8/hTCqrwpbGvy1X
	 4VqpofVWGDe5XyqdSwyDEtsB5XuYNSGoGemqUzjmXWwrJBjaKhVDcGuj7pyJN9xCEK
	 CfyPnyUiYQhLyUY3+Yf4Rvajt4VCyPccsMcANnrR2fI2HkwV5llwYwJgu1eLzHM4KH
	 8i8PjPsRDlfup3P9BEckqowMhNc4OrP8D7XKJ4N62x2/mnzGaD34KA2Z1CdOJ05SuC
	 iV1YH4WryeiOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 14/17] iio: adc: ad7768: Add per-channel conversion
 delay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260904-ad7768-driver-v6-14-e4378f946bfb@analog.com>
References: <20260904-ad7768-driver-v6-0-e4378f946bfb@analog.com>
 <20260904-ad7768-driver-v6-14-e4378f946bfb@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 14:33:05 +0000
Message-Id: <20260904143306.046191F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Passing 64-bit typed variables as divisors to DIV_ROUND_CLOSEST_ULL=
, which explicitly requires a 32-bit divisor.
--

commit 741d5031c79e2b3ec4d6ed7618901a8c2dcc88cd
Author: Janani Sunil <janani.sunil@analog.com>

iio: adc: ad7768: Add per-channel conversion delay

This commit exposes the per-channel synchronization phase offset through the
IIO conversion-delay attribute. It derives the delay resolution from MCLK,
power mode and decimation rate, validates the requested delay, and programs
the corresponding phase register.

> diff --git a/drivers/iio/adc/ad7768.c b/drivers/iio/adc/ad7768.c
> index 802666f7abd45..9c6bebb1857fd 100644
> --- a/drivers/iio/adc/ad7768.c
> +++ b/drivers/iio/adc/ad7768.c

[ ... ]

> @@ -665,6 +678,92 @@ static int ad7768_find_matching_mode(const bool *mod=
e_used,
>  	return -EINVAL;
>  }
> =20
> +static int ad7768_get_convdelay_params(struct ad7768_state *st, unsigned=
 int ch,
> +				       struct ad7768_convdelay_params *params)
> +{
> +	const struct ad7768_freq_config *freq_cfg;
> +	unsigned int dec_rate;
> +	unsigned int mclk_div;
> +	u64 mclk;
> +	u64 mult;

[ ... ]

> +	mclk =3D clk_get_rate(st->mclk);
> +	if (!mclk)
> +		return -EINVAL;
> +
> +	mclk_div =3D ad7768_power_modes[st->power_mode_idx].mclk_div;
> +	params->step_ps =3D
> +		DIV_ROUND_CLOSEST_ULL(mult * PSEC_PER_SEC * mclk_div, mclk);

[Severity: Low]
Is it safe to pass the 64-bit variable mclk as the divisor here?

The DIV_ROUND_CLOSEST_ULL() macro explicitly requires a 32-bit divisor.
Internally, it invokes do_div(), which casts the divisor to a 32-bit
integer.

While this might not cause a functional issue here because mclk is bounded
and fits safely within 32 bits, it violates the API contract and can
trigger static analysis warnings due to the implicit downcasting of the
u64 type.

> +
> +	return 0;
> +}
> +
> +static int ad7768_set_channel_convdelay(struct ad7768_state *st,
> +					unsigned int ch)
> +{
> +	u64 delay_ps =3D st->ch_convdelay_ps[ch];
> +	struct ad7768_convdelay_params params;
> +	u64 max_delay_ps;
> +	u64 raw;
> +	int ret;
> +
> +	ret =3D ad7768_get_convdelay_params(st, ch, &params);
> +	if (ret)
> +		return ret;
> +
> +	max_delay_ps =3D (u64)params.max_raw * params.step_ps;
> +	if (delay_ps > max_delay_ps)
> +		return -EINVAL;
> +
> +	raw =3D DIV_ROUND_CLOSEST_ULL(delay_ps, params.step_ps);

[Severity: Low]
Does this have the same type safety issue as above?

The params.step_ps struct member is declared as a u64, but is passed
to DIV_ROUND_CLOSEST_ULL() which requires a 32-bit divisor.

> +	if (raw > params.max_raw)
> +		return -EINVAL;
> +
> +	return regmap_write(st->regmap, ad7768_phase_reg(st, ch),
> +			    raw << params.shift);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-ad7768-dri=
ver-v6-0-e4378f946bfb@analog.com?part=3D14
