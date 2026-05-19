Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932E4376A0D
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 15:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203465; cv=none; b=FK1YwFC6kCTe/VWsNMPgpPj+rPBO7lX70k3/wgvSYm3oehObEg37iNuDoAizOBOf1z/wUsjWmymDlwidJwy2vQXr270PBmCuu8qCh4on3VsvlM+lTI2/07Fm2hNQILwn/Pq7VbAb4Xgy/mmSOtR0F9HlmImEvT6Cc0STpzjtbFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203465; c=relaxed/simple;
	bh=yaxFl4Jyj8v0aT5rIOxuw5C60KjdzFHeOMBK1Y6fqT4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q9HUXRAZp9fvtgUdfowP51dEOtdI3sLcRY+8/qgjxVfHFqaejZbhE6OxHDOejr1oaEtO4UnpABa5mBixDTg7vOf+xbVY/EdoUUJ2JjAhsVyBOzfk1NFFQ+6+uYYDs1AbqXNhx2voBeYHlQ1pOmXEC1uzYUuOduXE6h2bZLWgLQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rhW/PY2a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rhW/PY2a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4343C2BCB3;
	Tue, 19 May 2026 15:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779203464;
	bh=yaxFl4Jyj8v0aT5rIOxuw5C60KjdzFHeOMBK1Y6fqT4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=rhW/PY2afTh/xsujZFu0+ZnoY1BdKygBncsJkFgNHvqWfmehzp0wtxOoqOPYaXMpX
	 PKGMZvwc3kUwk63gJZsNQfauAPvWWian4T6c44t/DGOeoTGLgvvaoEaq16/UHFLMnh
	 yNuNrLQyPxKwiZdXoUxOd+SqXo9z2HCN/JcMgmcXPIX+f5nF74PKLOo9H4oE12BbU2
	 yJ5wmiMxEtG9eeCDQmV76KW229hM7FopIjjsjzv9HVeVzNzYai3T+EK6V4weZ6QJes
	 CpZdFoF1x9/31nOsmoA5juRxK2EQz/K0i7TTu2752y+P6y3wra5C665TFlHYhKhB+R
	 nFi8RqkOmZ8CA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 5/6] iio: adc: ad4691: add oversampling support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radu Sabau via B4 Relay" <devnull+radu.sabau.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260519-ad4692-multichannel-sar-adc-driver-v12-5-5b335162aa51@analog.com>
References: <20260519-ad4692-multichannel-sar-adc-driver-v12-5-5b335162aa51@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 15:11:03 +0000
Message-Id: <20260519151103.D4343C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Iterating over the soft timestamp channel without filtering causes=
 out-of-bounds array access and hardware register corruption.
- [Medium] Strict OSR snapping logic traps users in a configuration deadloc=
k by rejecting valid decreases to the oversampling ratio.
- [Medium] Silent cross-channel side effects and ABI violation due to scali=
ng a shared global oscillator via separate channel attributes.
--

commit 10a3a93f43ae70bcffb83a40ef3293e3287f7275
Author: Radu Sabau <radu.sabau@analog.com>

iio: adc: ad4691: add oversampling support

This patch adds oversampling ratio (OSR) support to the AD4691 driver for
CNV burst mode. It exposes oversampling_ratio and sampling_frequency
attributes and automatically scales the internal hardware oscillator to
support the requested rates.

> diff --git a/drivers/iio/adc/ad4691.c b/drivers/iio/adc/ad4691.c
> index a6588292f3c18..4b32f50d2176f 100644
> --- a/drivers/iio/adc/ad4691.c
> +++ b/drivers/iio/adc/ad4691.c
> @@ -131,12 +132,39 @@ struct ad4691_chip_info {
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

Could exposing SAMP_FREQ and OVERSAMPLING_RATIO as separate per-channel
attributes cause unexpected side effects?

Writing to either attribute recalculates and modifies st->target_osc_freq_H=
z,
which is a global internal oscillator shared by all channels. This means
changing the OSR on one channel will instantly and silently alter the
effective sampling rate of all other active channels.

Since the hardware clock is shared, should these attributes use
info_mask_shared_by_all or info_mask_shared_by_type to conform to the IIO A=
BI
and ensure userspace expects the cross-channel impacts?

[ ... ]

> @@ -729,7 +971,40 @@ static int ad4691_write_raw(struct iio_dev *indio_de=
v,
> =20
>  	switch (mask) {
>  	case IIO_CHAN_INFO_SAMP_FREQ:
> -		return ad4691_set_sampling_freq(st, val);
> +		return ad4691_set_sampling_freq(st, chan, val);
> +	case IIO_CHAN_INFO_OVERSAMPLING_RATIO: {
> +		unsigned int old_effective, found;
> +		bool valid =3D false;
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

Can this strict OSR snapping logic trap users in a configuration deadlock?

If the device is currently running at a low effective frequency and the user
attempts to decrease the OSR, the product old_effective * val may be smaller
than the minimum hardware oscillator frequency available.

When this happens, ad4691_find_osc_freq() will return 0, causing this to fa=
il
with -EINVAL. This locks the user out from lowering the OSR unless they
manually increase the channel's sampling_frequency first.

Should the snapping logic gracefully clamp to the lowest available hardware
frequency instead of rejecting valid decreases to the oversampling ratio?

> +		st->target_osc_freq_Hz =3D found;
> +		st->osr[chan->channel] =3D val;
> +		return 0;
> +	}

[ ... ]

> @@ -943,6 +1222,12 @@ static int ad4691_cnv_burst_buffer_preenable(struct=
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

Does iterating over active channels without filtering cause out-of-bounds
array access and hardware register corruption if the soft timestamp channel
is enabled?

The iio_for_each_active_channel() macro iterates over all set bits in
active_scan_mask, which includes the IIO soft timestamp channel (scan
index 16).

If i =3D=3D 16, this triggers an out-of-bounds read of st->osr[16], since t=
he
array is sized to AD4691_MAX_CHANNELS (16).

Furthermore, AD4691_ACC_DEPTH_IN(16) evaluates to 0x186 + 16 =3D 0x196, whi=
ch is
AD4691_GPIO_MODE1_REG. This would overwrite the GPIO configuration with gar=
bage,
potentially breaking the DATA_READY interrupt and halting conversions.

Additionally, could this same issue cause a buffer overflow later in this
function? If all 16 voltage channels plus the timestamp are enabled, the
existing loop increments k to 17. The code then appends a final state-reset
transfer at st->scan_xfers[2 * k] (index 34), which exceeds the fixed size
of the scan_xfers[34] array.

>  	ret =3D ad4691_enter_conversion_mode(st);
>  	if (ret)
>  		goto err_unoptimize;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-ad4692-mul=
tichannel-sar-adc-driver-v12-0-5b335162aa51@analog.com?part=3D5
