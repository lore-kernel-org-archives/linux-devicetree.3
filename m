Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790BA3803D7
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 21:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778621193; cv=none; b=LZlK4yOJ8qHeC75xzLIi6TzWbNkK9YasUlBrwnoA0neCNSx7AHwck632pIKdsMcCPLuq3sJ7mjG7VMMmqxh9r7V5xGiDCMdQqu8+7fRsH1CeQxdKEX7Kgp9X/pkItbTBjk2GatEZq4xgtAt+sy0P2hG2NuYaMrQA8m/j9s5/rHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778621193; c=relaxed/simple;
	bh=YvVtz8657Y4DmLvUbKwflFDFpUltJJd8qQYHvLVAuGE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RecBt1Y9nNTt56/aLGAQFbufNtdtRhlReZ/u+aztGjP8xaaj0SoJy7FxjTIVvtApAkHWBny27qkiVuqJ2wI/vkY4qfokYuy1Fz5OE0+BI67ksxTojKqXZybT4bc8wRvB4yK4jtzVRr19NRIQVpkFTh9AmTmpzuAJDDYf1cb8B3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TZm547Xm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TZm547Xm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D449CC2BCB0;
	Tue, 12 May 2026 21:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778621193;
	bh=YvVtz8657Y4DmLvUbKwflFDFpUltJJd8qQYHvLVAuGE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=TZm547XmD7kbEZybZTjWU+zCBxYiAIYHIdat88fjRTeCbKFfa0mjm+r+OAlhaN0pk
	 mY8ToFPAQ70mr0Il+uWEvuOY3SEPO8fbd0TioSkigmmu44K9mvbGXoLDcd2daI7xY9
	 rWalQEBrz1MlCw9ISxvy4nfqIaR5pj2s+OiiTybyaDQ5+DeQbz5w8O91jxLlOJHnmK
	 YQY+xRFjZCnUw6INC7DfsPh8+ZarFnizL45cbdcJT2FJUPear9xAPRTDFlxourg/NP
	 LH3nFZpIbGWIDj7ZPEGuP7NfSZktcgcXTyM58cJF59f673+7lQg5mPVrAIlrKAsbxE
	 dSDQWtVBKNYPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 5/6] iio: adc: ad4691: add oversampling support
Reply-To: sashiko@lists.linux.dev
To: "Radu Sabau via B4 Relay" <devnull+radu.sabau.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260511-ad4692-multichannel-sar-adc-driver-v10-5-e1fbb1744e38@analog.com>
References: <20260511-ad4692-multichannel-sar-adc-driver-v10-5-e1fbb1744e38@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 21:26:32 +0000
Message-Id: <20260512212632.D449CC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Buffer pre-enable loops iterate over the soft timestamp channel, c=
ausing an out-of-bounds array read and overwriting the GPIO configuration r=
egister.
- [High] Missing `.endianness =3D IIO_BE` in `AD4691_MANUAL_CHANNEL` macro.
- [Medium] Time-of-Check to Time-of-Use (TOCTOU) race in `ad4691_set_sampli=
ng_freq`.
- [Medium] Data race and unprotected shared state in `ad4691_read_avail`.
- [Medium] Unlocked reads in `ad4691_read_raw` lead to torn state reads.
- [Medium] Writing `oversampling_ratio` silently modifies the global oscill=
ator frequency, contradicting the commit message.
--

commit 52e8aead1e278f9a7f54f1b813184c36fb2a964a
Author: Radu Sabau <radu.sabau@analog.com>

iio: adc: ad4691: add oversampling support

This commit adds per-channel oversampling ratio (OSR) support for CNV
burst mode on the AD4691. It introduces attributes for sampling frequency
and OSR, and splits channel specifications to handle manual mode where OSR
is not applicable.

> Writing oversampling_ratio stores the new OSR for that channel;
> target_osc_freq_Hz is left unchanged. The effective rate read back via
> in_voltageN_sampling_frequency becomes target_osc_freq_Hz / new_osr
> automatically. The two attributes are orthogonal: sampling_frequency
> controls the oscillator, oversampling_ratio controls the averaging depth.

Is this description accurate?

Looking at ad4691_write_raw() for IIO_CHAN_INFO_OVERSAMPLING_RATIO, the code
actively snaps target_osc_freq_Hz to a new value to preserve the previous
effective rate. Because target_osc_freq_Hz corresponds to a single global
hardware oscillator, modifying it here silently changes the effective sampl=
ing
rate of all other active channels.

> diff --git a/drivers/iio/adc/ad4691.c b/drivers/iio/adc/ad4691.c
> index 011a3cd46da0d..842c4012801cc 100644
> --- a/drivers/iio/adc/ad4691.c
> +++ b/drivers/iio/adc/ad4691.c
[ ... ]
> @@ -127,12 +129,39 @@ struct ad4691_chip_info {
>  	const struct ad4691_channel_info *offload_info;
>  };
> =20
[ ... ]
> +/*
> + * Manual mode channel =E2=80=94 no oversampling ratio attribute. OSR is=
 not
> + * supported in manual mode; ACC_DEPTH_IN is not configured during manual
> + * buffer enable.
> + */
> +#define AD4691_MANUAL_CHANNEL(ch)					\
> +	{								\
> +		.type =3D IIO_VOLTAGE,					\
> +		.indexed =3D 1,						\
> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |		\
> +				      BIT(IIO_CHAN_INFO_SAMP_FREQ),	\
>  		.info_mask_separate_available =3D				\
>  				      BIT(IIO_CHAN_INFO_SAMP_FREQ),	\
>  		.info_mask_shared_by_all =3D BIT(IIO_CHAN_INFO_SCALE),	\
>  		.channel =3D ch,						\
>  		.scan_index =3D ch,					\
>  		.scan_type =3D {						\
>  			.sign =3D 'u',					\
>  			.realbits =3D 16,					\
>  			.storagebits =3D 16,				\
>  		},							\
>  	}

Are we missing the endianness assignment in this macro?

The regular AD4691_CHANNEL macro specifies an endianness of IIO_BE. Without
it here, the IIO core defaults to CPU endianness. Since the hardware
transmits MSB-first over SPI, userspace applications running on little-endi=
an
hosts might interpret the manual mode buffer data incorrectly.

[ ... ]
> @@ -511,36 +602,58 @@ static unsigned int ad4691_samp_freq_start(const st=
ruct ad4691_chip_info *info)
>  	return (info->max_rate =3D=3D 1 * HZ_PER_MHZ) ? 0 : 1;
>  }
> =20
[ ... ]
> -static int ad4691_set_sampling_freq(struct iio_dev *indio_dev, int freq)
> +static int ad4691_set_sampling_freq(struct iio_dev *indio_dev,
> +				    struct iio_chan_spec const *chan, int freq)
>  {
>  	struct ad4691_state *st =3D iio_priv(indio_dev);
> -	unsigned int start =3D ad4691_samp_freq_start(st->info);
> +	unsigned int osr =3D st->osr[chan->channel];
> +	unsigned int found;
> =20
>  	IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
>  	if (IIO_DEV_ACQUIRE_FAILED(claim))
>  		return -EBUSY;

Could reading the oversampling ratio before acquiring the IIO direct mode
lock lead to a race condition?

If a concurrent write to the oversampling ratio attribute occurs, this
function will block on the lock. Once it unblocks, it proceeds with the
stale osr value to calculate and set the new target oscillator frequency,
which might not be evenly divisible by the newly set oversampling ratio.

[ ... ]
> @@ -552,10 +665,30 @@ static int ad4691_read_avail(struct iio_dev *indio_=
dev,
>  	unsigned int start =3D ad4691_samp_freq_start(st->info);
> =20
>  	switch (mask) {
> -	case IIO_CHAN_INFO_SAMP_FREQ:
> -		*vals =3D &ad4691_osc_freqs_Hz[start];
> +	case IIO_CHAN_INFO_SAMP_FREQ: {
> +		unsigned int osr =3D st->osr[chan->channel];
> +		int n =3D 0;
> +
> +		/*
> +		 * Only oscillator frequencies evenly divisible by the channel's
> +		 * OSR yield an integer effective rate; expose those as effective
> +		 * rates (osc / osr) so the user works entirely in output-sample
> +		 * space.
> +		 */
> +		for (unsigned int i =3D start; i < ARRAY_SIZE(ad4691_osc_freqs_Hz); i+=
+) {
> +			if (ad4691_osc_freqs_Hz[i] % osr)
> +				continue;
> +			st->samp_freq_avail[chan->channel][n++] =3D ad4691_osc_freqs_Hz[i] / =
osr;
> +		}
> +		*vals =3D st->samp_freq_avail[chan->channel];
> +		*type =3D IIO_VAL_INT;
> +		*length =3D n;
> +		return IIO_AVAIL_LIST;

Does populating and returning the shared scratch array without locking crea=
te
a data race?

Concurrent sysfs reads of the sampling frequency available attribute for the
same channel could result in multiple threads writing to the
st->samp_freq_avail array simultaneously.

[ ... ]
> @@ -632,7 +773,10 @@ static int ad4691_read_raw(struct iio_dev *indio_dev,
>  		return ad4691_single_shot_read(indio_dev, chan, val);
>  	}
>  	case IIO_CHAN_INFO_SAMP_FREQ:
> -		return ad4691_get_sampling_freq(st, val);
> +		return ad4691_get_sampling_freq(st, st->osr[chan->channel], val);
> +	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
> +		*val =3D st->osr[chan->channel];
> +		return IIO_VAL_INT;

Should these attribute reads be protected by a lock?

Since ad4691_write_raw() modifies both target_osc_freq_Hz and the channel
OSR sequentially, a concurrent unlocked read could observe the newly updated
oscillator frequency but the old oversampling ratio, returning an incorrect
effective sampling rate.

[ ... ]
> @@ -866,6 +1045,12 @@ static int ad4691_cnv_burst_buffer_preenable(struct=
 iio_dev *indio_dev)
>  	if (ret)
>  		goto err_unoptimize;
> =20
> +	iio_for_each_active_channel(indio_dev, i) {
> +		ret =3D regmap_write(st->regmap, AD4691_ACC_DEPTH_IN(i), st->osr[i]);
> +		if (ret)
> +			goto err_unoptimize;
> +	}
> +

Can this loop iterate past the bounds of the osr array?

If the IIO soft timestamp channel is enabled, its bit is set with scan_index
16. The macro iterates over all enabled channels, causing this loop to acce=
ss
st->osr[16], which exceeds the 16-element array.

Writing this out-of-bounds value using AD4691_ACC_DEPTH_IN(16) evaluates to
register 0x196, which is AD4691_GPIO_MODE1_REG. This could inadvertently
overwrite the device's GPIO configuration.

[ ... ]
> @@ -1045,6 +1230,12 @@ static int ad4691_cnv_burst_offload_buffer_postena=
ble(struct iio_dev *indio_dev)
>  	if (ret)
>  		return ret;
> =20
> +	iio_for_each_active_channel(indio_dev, bit) {
> +		ret =3D regmap_write(st->regmap, AD4691_ACC_DEPTH_IN(bit), st->osr[bit=
]);
> +		if (ret)
> +			return ret;
> +	}
> +

Is it possible for the soft timestamp channel to be active here as well,
leading to the same out-of-bounds access on st->osr[bit]?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-ad4692-mul=
tichannel-sar-adc-driver-v10-0-e1fbb1744e38@analog.com?part=3D5
