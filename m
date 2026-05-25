Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AC4382369
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 13:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779714409; cv=none; b=XFEDNBEEhU7hSEOtQltDKZUHzmmxODDjRzykkbO3C7VoDHZvYUf9CnP5Jx9SUHakp6O8NDOxondmjaketFiqmZEERDU8PljzknxsAuT+H++1PXc6SmVl6oNR8GbBk8sxbXBVOnpPAzzLXHWrTH+DJdQZct3PfilNG2iQgb5jKM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779714409; c=relaxed/simple;
	bh=fSvaSquYhD9wixnHbnK0Qq1DNEf9nO/erGIht/JZv0o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WOwPJql8+G2wzwwPfW3ClcHlRckFCyh9ZfPL4ohP6TY+RGPdDEIGySvfRKMsIXYsZlV8qnyy/nlF/dWtLNSHIDsduy6Eb6+5d+v4VBKDoJcYcgGaIIM2BQ3+W4Ng0QHa8POGlzL9lmG9ndb8OXrImMOx17a0x6H29ES5aine9IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J1m6P7E8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J1m6P7E8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 049841F000E9;
	Mon, 25 May 2026 13:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779714408;
	bh=OtlBbs0aPcxU9AuTWd1BvgyzvEexI2YheDCE/4hLZZc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J1m6P7E81ufCAked6uFuXEryyTy3+e/N1dtkwlzuc/hdmhRTZqVb6OqyzVs65cmDe
	 PR7qILENKPWB3lsSoeNdHoIzRTm9i5ZqpiyXH2bjIdy/2tEs5ZbpluwndSGZ3i7iaN
	 AoZXZK61e6GUJ0KTh3CybZlZOdQ/Q9Re0q79ofEspdAmo2g08nT1zaznbu7A/i3VuZ
	 h9O1gyrhg3WuijDSD1ICq0LCrRL5LnAoxD9/DFTVx4OKNFgnOXajgqtPTGgocOOeoN
	 dCXKzjgN5PfdlJWZoe0sDx0JhfqzmS7aLeK205ZPUoNG1+JE+Zxsf0CcUtHRCtI/de
	 pRdj7B0Lri5Mg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 5/6] iio: adc: ad4691: add oversampling support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radu Sabau via B4 Relay" <devnull+radu.sabau.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260525-ad4692-multichannel-sar-adc-driver-v13-5-1b7626d3b35c@analog.com>
References: <20260525-ad4692-multichannel-sar-adc-driver-v13-5-1b7626d3b35c@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 13:06:47 +0000
Message-Id: <20260525130648.049841F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The oversampling ratio (OSR) is only applied to channel 0, leaving=
 all other channels unconfigured.
- [Medium] Decreasing the oversampling ratio can incorrectly fail with -EIN=
VAL, effectively trapping the device in a high OSR state.
- [Medium] Mismatch between the commit message intent (per-channel OSR) and=
 the actual implementation (device-wide shared OSR).
--

commit cb227edc48341e4c564eb44a5dcf61a6d76e273a
Author: Radu Sabau <radu.sabau@analog.com>

iio: adc: ad4691: add oversampling support
   =20
Add per-channel oversampling ratio (OSR) support for CNV burst mode.
The accumulator depth register (ACC_DEPTH_IN) is programmed with the
selected OSR at buffer enable time and before each single-shot read.

>     Add per-channel oversampling ratio (OSR) support for CNV burst mode.
>     The accumulator depth register (ACC_DEPTH_IN) is programmed with the
>     selected OSR at buffer enable time and before each single-shot read.
>    =20
>     Supported OSR values: 1, 2, 4, 8, 16, 32.
>    =20
>     Introduce AD4691_MANUAL_CHANNEL() for manual mode channels, which do
>     not expose the oversampling_ratio attribute since OSR is not applicab=
le
>     in that mode. A separate manual_channels array is added to
>     struct ad4691_channel_info and selected at probe time.
>    =20
>     in_voltageN_sampling_frequency represents the effective output rate f=
or
>     channel N, defined as osc_freq / osr[N]. The chip has one internal
>     oscillator shared by all channels; each channel independently
>     accumulates osr[N] oscillator cycles before producing a result.

[Severity: Medium]
Is the intent to support per-channel oversampling ratios as described here?

The commit message refers to osr[N], but the implementation introduces a
single global state variable st->osr, exposes the sysfs attributes as
info_mask_shared_by_all in the channel macros, and applies this shared
variable device-wide.

> diff --git a/drivers/iio/adc/ad4691.c b/drivers/iio/adc/ad4691.c
> index 6563488ab8b89..64238f8428417 100644
> --- a/drivers/iio/adc/ad4691.c
> +++ b/drivers/iio/adc/ad4691.c
[ ... ]
> @@ -642,7 +856,7 @@ static int ad4691_single_shot_read(struct iio_dev *in=
dio_dev,
>  				   struct iio_chan_spec const *chan, int *val)
>  {
>  	struct ad4691_state *st =3D iio_priv(indio_dev);
> -	unsigned int reg_val, osc_idx, period_us;
> +	unsigned int reg_val, period_us;
>  	int ret;
> =20
>  	guard(mutex)(&st->lock);
> @@ -662,7 +876,11 @@ static int ad4691_single_shot_read(struct iio_dev *i=
ndio_dev,
>  	if (ret)
>  		return ret;
> =20
> -	ret =3D regmap_read(st->regmap, AD4691_OSC_FREQ_REG, &reg_val);
> +	ret =3D regmap_write(st->regmap, AD4691_ACC_DEPTH_IN(0), st->osr);

[Severity: High]
Does this apply the oversampling ratio only to channel 0?

Since AD4691_ACC_DEPTH_IN(n) targets a distinct register address per channe=
l,
hardcoding 0 here means for single-shot reads on channels other than 0,
the OSR is never configured, yet the driver waits the full oversampled
duration and expects accumulated data.

> +	if (ret)
> +		return ret;
> +
> +	ret =3D ad4691_write_osc_freq(st);
>  	if (ret)
>  		return ret;
[ ... ]
> @@ -730,6 +965,33 @@ static int ad4691_write_raw(struct iio_dev *indio_de=
v,
>  	switch (mask) {
>  	case IIO_CHAN_INFO_SAMP_FREQ:
>  		return ad4691_set_sampling_freq(st, val);
> +	case IIO_CHAN_INFO_OVERSAMPLING_RATIO: {
> +		unsigned int old_effective, found, osr_idx;
> +
> +		osr_idx =3D ad4691_osr_index(val);
> +		if (ad4691_oversampling_ratios[osr_idx] !=3D val)
> +			return -EINVAL;
> +
> +		/*
> +		 * Hold st->lock while computing the new oscillator frequency
> +		 * and updating both target_osc_freq_Hz and osr atomically:
> +		 * read_raw for SAMP_FREQ reads both fields under the lock and
> +		 * must see a consistent pair (new osc =E2=86=94 new osr).
> +		 *
> +		 * Snap target_osc_freq_Hz to the largest table entry that is
> +		 * both <=3D old_effective * new_osr and evenly divisible by
> +		 * new_osr, preserving an integer read-back of
> +		 * in_voltage_sampling_frequency after the OSR change.
> +		 */
> +		guard(mutex)(&st->lock);
> +		old_effective =3D st->target_osc_freq_Hz / st->osr;
> +		found =3D ad4691_find_osc_freq(st, old_effective * (unsigned int)val, =
val);
> +		if (!found)
> +			return -EINVAL;

[Severity: Medium]
Could this reject valid oversampling ratio changes with -EINVAL, effectively
trapping the device in a high OSR state?

If the device is currently at a high OSR (e.g., 32), the old_effective rate
is very low. Attempting to decrease the OSR directly to 1 yields a low
needed oscillator frequency (old_effective * new_osr).

Since ad4691_find_osc_freq() only returns frequencies less than or equal to
this needed oscillator rate, and the minimum supported frequency is
25,000 Hz, the search will fail and return 0 if the needed rate is less
than 25,000. This would force users to use a non-intuitive step-down
workaround to lower the OSR.

> +		st->target_osc_freq_Hz =3D found;
> +		st->osr =3D val;
> +		return 0;
> +	}
>  	default:
>  		return -EINVAL;
>  	}
[ ... ]
> @@ -943,6 +1209,10 @@ static int ad4691_cnv_burst_buffer_preenable(struct=
 iio_dev *indio_dev)
>  	if (ret)
>  		goto err_unoptimize;
> =20
> +	ret =3D regmap_write(st->regmap, AD4691_ACC_DEPTH_IN(0), st->osr);

[Severity: High]
Does this hardcoded channel 0 write leave the remaining active channels
unconfigured?

Since this doesn't iterate over the active scan mask, channels 1-15 will
always operate with the default OSR of 1 during buffered reads, causing
incorrect hardware accumulation.

> +	if (ret)
> +		goto err_unoptimize;
> +
>  	ret =3D ad4691_enter_conversion_mode(st);
>  	if (ret)
>  		goto err_unoptimize;
[ ... ]
> @@ -1122,6 +1392,10 @@ static int ad4691_cnv_burst_offload_buffer_postena=
ble(struct iio_dev *indio_dev)
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D regmap_write(st->regmap, AD4691_ACC_DEPTH_IN(0), st->osr);

[Severity: High]
As with ad4691_cnv_burst_buffer_preenable() above, this also hardcodes
channel 0. Should this iterate over the active scan mask instead?

> +	if (ret)
> +		return ret;
> +
>  	ret =3D ad4691_enter_conversion_mode(st);
>  	if (ret)
>  		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525-ad4692-mul=
tichannel-sar-adc-driver-v13-0-1b7626d3b35c@analog.com?part=3D5
