Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2913C4B72
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 16:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778861690; cv=none; b=LYeDW5Smr6WB4xC6rZeVihHrNdb/sW2VEaqvZOseNYxxmvNVGvEkkwwh4PDMbSYIY7MxCavYdgpOze1o32ALxkxIP4f+jwX1MnzLegtOXvYd2kCDhdcEi3y09Hk0T3G0J//FnxuiFW7p7NQxrl3YXGaEROadeHscavhc1PtK4hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778861690; c=relaxed/simple;
	bh=1cnlVgV8SfRWrGdm5CdZ9tbWjawRGfYn3YkkEO4E3X4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZqCE21b2yuCfV/6OwSkDop+9T8wTkhrwuVdJlYpno/A19Si4HTLg99IS6o+7O/24aZjbgHyJjdi/vy7G93jmiPbYv80HsBfKcOYAYwZVi3Mmd1PX6/YbaEff1136pIT5yzfq73UcG6uOGZM+VYkGVKQtYROBcwoZpHnf5J+jUos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C4kNWy7w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C4kNWy7w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1610BC2BCB0;
	Fri, 15 May 2026 16:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778861690;
	bh=1cnlVgV8SfRWrGdm5CdZ9tbWjawRGfYn3YkkEO4E3X4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=C4kNWy7wKCUCtIQJXnKCgETzEI+Q9C0n0/EGcoWi9TOQJDm5THENMD+yqbuVaxxyq
	 jgdvlXjBWvdlQlwFFMd2RJ4bTnHDrFdUnV1YYJUjJArfuiuZbRC52GjCliofdUH+Ak
	 ZeQF2ZRpmcKEbHSX4O9ezCtPElZUexxc9Gbjxzi7cTo44z+WPLgj9WLSAQwYBOkHI5
	 Ar8ZNvgL1bxztX714X1tugP0Gi8uyLkQcWudgZS5P76x0AfLhKvUzGDmaeQwwkj3l5
	 AELKA2m2bFW5FY+D3s2rwTp92JoE1Dba9AQ/PMYAhkRS0HFKLlOZoozlkO//HX+bou
	 2g+mVunPFawRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 5/6] iio: adc: ad4691: add oversampling support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radu Sabau via B4 Relay" <devnull+radu.sabau.analog.com@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260515-ad4692-multichannel-sar-adc-driver-v11-5-eab27d852ac2@analog.com>
References: <20260515-ad4692-multichannel-sar-adc-driver-v11-5-eab27d852ac2@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 16:14:49 +0000
Message-Id: <20260515161450.1610BC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] UAPI Violation: `sampling_frequency` is exposed as a separate attr=
ibute but modifies shared hardware state.
- [High] Logic Error: Eager snapping of `target_osc_freq_Hz` prevents setti=
ng attributes in arbitrary order as claimed.
- [Medium] Data Race: Lockless read of `samp_freq_avail` by the IIO core ca=
n result in torn or out-of-bounds reads.
--

commit 263cf27684f7e7bf6a4d514df77024b26ca11416
Author: Radu Sabau <radu.sabau@analog.com>
Subject: iio: adc: ad4691: add oversampling support

This commit adds per-channel oversampling ratio (OSR) support for CNV
burst mode in the ad4691 driver. It introduces manual and offload channel
variations and dynamically computes available sampling frequencies based
on the channel's current OSR.

> diff --git a/drivers/iio/adc/ad4691.c b/drivers/iio/adc/ad4691.c
> index 25f7a6939b0fb..39244e0e4a2d8 100644
> --- a/drivers/iio/adc/ad4691.c
> +++ b/drivers/iio/adc/ad4691.c
[ ... ]
> @@ -127,12 +129,39 @@ struct ad4691_chip_info {
>  	const struct ad4691_channel_info *offload_info;
>  };
> =20
> +/* CNV burst mode channel =E2=80=94 exposes oversampling ratio. */
>  #define AD4691_CHANNEL(ch)						\
>  	{								\
>  		.type =3D IIO_VOLTAGE,					\
>  		.indexed =3D 1,						\
> -		.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW)		\
> -				    | BIT(IIO_CHAN_INFO_SAMP_FREQ),	\
> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |		\
> +				      BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO) | \
> +				      BIT(IIO_CHAN_INFO_SAMP_FREQ),	\

Could this be a UAPI violation? The sampling_frequency is exposed with
info_mask_separate, giving each channel its own sampling frequency attribute
(e.g., in_voltage0_sampling_frequency).

However, writing to this attribute modifies st->target_osc_freq_Hz, which is
the shared base clock for all channels. If channels have different
oversampling ratios, writing to one channel's sampling frequency will
silently alter the effective sampling rate of other channels.

Should this be exposed with info_mask_shared_by_all (or shared_by_type)
instead, so userspace knows the clock is shared?

[ ... ]
> @@ -588,41 +732,65 @@ static unsigned int ad4691_samp_freq_start(const st=
ruct ad4691_chip_info *info)
>  	return (info->max_rate =3D=3D 1 * HZ_PER_MHZ) ? 0 : 1;
>  }
> =20
> -static int ad4691_get_sampling_freq(struct ad4691_state *st, int *val)
> +/*
> + * Find the largest oscillator table entry that is both <=3D needed_osc =
and
> + * evenly divisible by osr (guaranteeing an integer effective rate on
> + * read-back). Returns 0 if no such entry exists in the chip's valid ran=
ge.
> + */
> +static unsigned int ad4691_find_osc_freq(struct ad4691_state *st,
> +					 unsigned int needed_osc,
> +					 unsigned int osr)
>  {
[ ... ]
> -static int ad4691_set_sampling_freq(struct iio_dev *indio_dev, int freq)
> +static int ad4691_set_sampling_freq(struct iio_dev *indio_dev,
> +				    struct iio_chan_spec const *chan, int freq)
>  {
>  	struct ad4691_state *st =3D iio_priv(indio_dev);
> -	unsigned int start =3D ad4691_samp_freq_start(st->info);
> +	unsigned int osr, found;
> =20
>  	IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
>  	if (IIO_DEV_ACQUIRE_FAILED(claim))
>  		return -EBUSY;
> =20
> -	for (unsigned int i =3D start; i < ARRAY_SIZE(ad4691_osc_freqs_Hz); i++=
) {
> -		if (ad4691_osc_freqs_Hz[i] !=3D freq)
> -			continue;
> -		return regmap_update_bits(st->regmap, AD4691_OSC_FREQ_REG,
> -					  AD4691_OSC_FREQ_MASK, i);
> -	}
> +	/*
> +	 * Read osr under st->lock: osr[chan] and target_osc_freq_Hz are
> +	 * modified together under the lock; reading after acquiring it ensures
> +	 * we see a consistent snapshot with no concurrent write racing us.
> +	 */
> +	guard(mutex)(&st->lock);
> +	osr =3D st->osr[chan->channel];
> =20
> -	return -EINVAL;
> +	if (freq <=3D 0 || (unsigned int)freq > st->info->max_rate / osr)
> +		return -EINVAL;

Does this eager check break the ability to set attributes in any order?

The commit message states that sampling_frequency and oversampling_ratio
can be set in any order because they are deferred until buffer enable.
However, if transitioning from a high OSR (e.g. 32) to a low OSR (e.g. 1)
with a high sampling frequency, writing the frequency first will fail here
because it is evaluated against the old OSR of 32.

[ ... ]
> @@ -634,10 +802,46 @@ static int ad4691_read_avail(struct iio_dev *indio_=
dev,
>  	unsigned int start =3D ad4691_samp_freq_start(st->info);
> =20
>  	switch (mask) {
> -	case IIO_CHAN_INFO_SAMP_FREQ:
> -		*vals =3D &ad4691_osc_freqs_Hz[start];
> +	case IIO_CHAN_INFO_SAMP_FREQ: {
> +		unsigned int osr;
> +		int n =3D 0;
> +
> +		/*
> +		 * Hold the lock while reading osr[chan] and populating the
> +		 * scratch buffer: a concurrent oversampling_ratio write modifies
> +		 * both target_osc_freq_Hz and osr[] under the lock, so we must
> +		 * read osr atomically with respect to that write. The scratch
> +		 * buffer is per-channel, so concurrent reads on different
> +		 * channels do not race; concurrent reads on the same channel
> +		 * would compute identical values, but holding the lock avoids
> +		 * the formal data race.
> +		 */
> +		scoped_guard(mutex, &st->lock) {
> +			osr =3D st->osr[chan->channel];
> +
> +			/*
> +			 * Only oscillator frequencies evenly divisible by the
> +			 * channel's OSR yield an integer effective rate; expose
> +			 * those as effective rates (osc / osr) so the user works
> +			 * entirely in output-sample space.
> +			 */
> +			for (unsigned int i =3D start;
> +			     i < ARRAY_SIZE(ad4691_osc_freqs_Hz); i++) {
> +				if (ad4691_osc_freqs_Hz[i] % osr)
> +					continue;
> +				st->samp_freq_avail[chan->channel][n++] =3D
> +					ad4691_osc_freqs_Hz[i] / osr;
> +			}
> +		}
> +		*vals =3D st->samp_freq_avail[chan->channel];
>  		*type =3D IIO_VAL_INT;
> -		*length =3D ARRAY_SIZE(ad4691_osc_freqs_Hz) - start;
> +		*length =3D n;
> +		return IIO_AVAIL_LIST;

Could this lead to a data race with the IIO core?

The st->samp_freq_avail array is populated while holding st->lock, but the
lock is released before returning. The IIO core will read the array lockles=
sly
when formatting the sysfs string. If another thread writes to
oversampling_ratio concurrently, the array might be repopulated with a new
shorter length. This could cause the IIO core to read stale or uninitialized
values out of bounds of the new length.

[ ... ]
> @@ -728,9 +953,48 @@ static int ad4691_write_raw(struct iio_dev *indio_de=
v,
>  			    struct iio_chan_spec const *chan,
>  			    int val, int val2, long mask)
>  {
> +	struct ad4691_state *st =3D iio_priv(indio_dev);
> +
>  	switch (mask) {
>  	case IIO_CHAN_INFO_SAMP_FREQ:
> -		return ad4691_set_sampling_freq(indio_dev, val);
> +		return ad4691_set_sampling_freq(indio_dev, chan, val);
> +	case IIO_CHAN_INFO_OVERSAMPLING_RATIO: {
[ ... ]
> +		/*
> +		 * Hold st->lock while computing the new oscillator frequency
> +		 * and updating both target_osc_freq_Hz and osr[chan] atomically:
> +		 * read_raw for SAMP_FREQ reads both fields under the lock and
> +		 * must see a consistent pair (new osc =E2=86=94 new osr).
> +		 *
> +		 * Snap target_osc_freq_Hz to the largest table entry that is
> +		 * both <=3D old_effective * new_osr and evenly divisible by
> +		 * new_osr, preserving an integer read-back of
> +		 * in_voltageN_sampling_frequency after the OSR change.
> +		 */
> +		guard(mutex)(&st->lock);
> +		old_effective =3D st->target_osc_freq_Hz / st->osr[chan->channel];
> +		found =3D ad4691_find_osc_freq(st, old_effective * (unsigned int)val, =
val);
> +		if (!found)
> +			return -EINVAL;
> +		st->target_osc_freq_Hz =3D found;
> +		st->osr[chan->channel] =3D val;
> +		return 0;

Similarly, does this logic force a write-order trap for oversampling_ratio?

If a user writes the OSR first when transitioning between setups, this code
multiplies old_effective by the new OSR. If no valid oscillator frequency
exists below that product, this returns -EINVAL. It might also snap the base
oscillator frequency to an unpredictably low intermediate value, contradict=
ing
the commit message's claim that both attributes can be set in any order.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-ad4692-mul=
tichannel-sar-adc-driver-v11-0-eab27d852ac2@analog.com?part=3D5
