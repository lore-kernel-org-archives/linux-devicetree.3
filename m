Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264762DF128
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 20:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784837599; cv=none; b=s3bgXY8IMlE5hIjGXAtY7O3PA5jDtygyq1K46KdafS2iEobOzTrBu69YGZh0quPuOQXlmO7YpObspDnNgWg0zmulm0RqfCqx61C2ZAgdKGwqWbMD2YgBOfSU9r6ib6Mns+ktc1ppxtCbMF1lyynpc2yfT75aJS53nMAyNAlDxH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784837599; c=relaxed/simple;
	bh=XIrIGe13jVQ/LDsaurxJSUGHOQL/eyvlYGaEMCfuabI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DeDF4tVdka727pH6xEWCS0rqglDC2x7J4DE7RvncoSpOtuRuNt67yOH0PIzl19ln0u+a96CfFEJ8x0/5cIS4UPx4SIqJDLAilyzSUA6iOKKtMLbneyQ3rPTomoGPLsZj+SK44ga7GNQHuzUWhx3AVAsxoK2cHGbs/WDIKAL6Apc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kP6b4xs3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kP6b4xs3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B76B21F000E9;
	Thu, 23 Jul 2026 20:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784837598;
	bh=2XcXCrxB2i8l3j1UZxlluGc/m2XXJPQ1VH9rggZ/EH8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kP6b4xs3eD36XxTHMSQoR5f3McwDvNpPB2wSrqAD+xHAix1q5MlhmigarJWjiv1uN
	 NrDajj36NWhOnTAfWX6NjejTaJGt/1t8HyL7+KiCSmyPicZRuzK4MoXdIx5ST6bHYO
	 mNV8JER2WBwiFaBa8UZzXu+zQWlhLVnMF/Q8lXzKN8XLfDp4OETripVOqmy3Wuc3ik
	 ryvI1BQXN7TsDm+8c4pcEduvnsrH+eyfMKcKvtj7xsQdhxJvb3jLWTlY8sNS9YzfHa
	 V3lMznoeJ0eQFm+Ppkn0POZS6OkjnFwFZb2C0XO5kc+urBQMvy3fNTPZMlzK2wWvRs
	 VjRuUdCr1vrGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/5] iio: adc: ltc2378: Enable high-speed data
 capture
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <c331ad2c4e4162c285a3c6c89798388ad4962036.1784835663.git.marcelo.schmitt@analog.com>
References: <cover.1784835663.git.marcelo.schmitt@analog.com>
 <c331ad2c4e4162c285a3c6c89798388ad4962036.1784835663.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 20:13:17 +0000
Message-Id: <20260723201317.B76B21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Division by zero vulnerabilities in ltc2378_update_conversion_rate=
 due to unhandled hardware rounding of period/frequency.
- [Low] Unlocked data race on st->cnv_Hz between read_raw and write_raw.
--

--- Patch [3]: [PATCH v8 3/5] iio: adc: ltc2378: Enable high-speed data cap=
ture ---
commit cad96004cef5739b24db063923b36678ea8e3617
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>
Subject: iio: adc: ltc2378: Enable high-speed data capture

Make use of SPI transfer offloading to speed up data capture, enabling data
acquisition at faster sample rates (up to 2 MSPS).

> diff --git a/drivers/iio/adc/ltc2378.c b/drivers/iio/adc/ltc2378.c
> index 107388f870626..7baee02450d39 100644
> --- a/drivers/iio/adc/ltc2378.c
> +++ b/drivers/iio/adc/ltc2378.c
> @@ -264,7 +384,137 @@ static int ltc2378_read_raw(struct iio_dev *indio_d=
ev,
>  			*val2 =3D chan->scan_type.realbits;
> =20
>  		return IIO_VAL_FRACTIONAL_LOG2;
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		*val =3D st->cnv_Hz;

[Severity: Low]
Does this lockless read of st->cnv_Hz race with concurrent updates?

While ltc2378_write_raw() acquires the IIO direct mode lock before calling
ltc2378_update_conversion_rate() to update st->cnv_Hz, this read path appea=
rs
to access it without synchronization or READ_ONCE()/WRITE_ONCE() macros.

> +		return IIO_VAL_INT;

[ ... ]

> +static int ltc2378_update_conversion_rate(struct ltc2378_state *st, int =
freq_Hz)
> +{

[ ... ]

> +	/*
> +	 * Configure SPI offload PWM trigger.
> +	 * The trigger should fire after tBUSYLH + tCONV + tDSDOBUSYL.
> +	 * Minimum time needed: TBUSYLH (13ns) + TCONV (part-specific) + TDSDOB=
USYL (5ns)
> +	 *
> +	 * Use the same period as CNV PWM to avoid timing issues.
> +	 * Convert back from period to frequency for the SPI offload API.
> +	 */
> +	offload_period_ns =3D cnv_wf.period_length_ns;
> +	config.periodic.frequency_hz =3D div_u64(HZ_PER_GHZ, offload_period_ns);

[Severity: High]
Can this result in a division by zero if offload_period_ns is 0?

If pwm_round_waveform_might_sleep() rounds the requested period down to 0,
offload_period_ns will be 0 and cause a kernel panic here.

> +	min_read_offset =3D LTC2378_TBUSYLH_NS + st->info->tconv_ns + LTC2378_T=
DSDOBUSYL_NS;

[ ... ]

> +	/* Check the minimum CNV to SCLK delay is met */
> +	if (config.periodic.offset_ns < min_read_offset)
> +		return -EDOM;
> +
> +	/* Check the PWM periods remain the same */
> +	offload_period_ns =3D div64_u64(HZ_PER_GHZ, config.periodic.frequency_h=
z);

[Severity: High]
Does this code panic if config.periodic.frequency_hz evaluates to 0?

If a user writes a very low sampling frequency, the PWM driver might round
the hardware period up to a value greater than HZ_PER_GHZ. If
offload_period_ns > HZ_PER_GHZ, the earlier calculation for
config.periodic.frequency_hz will evaluate to 0.

Additionally, if spi_offload_trigger_validate() mutates frequency_hz down
to 0, it would also result in a division by zero here.

> +	if (cnv_wf.period_length_ns !=3D offload_period_ns)
> +		return -EDOM;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1784835663.gi=
t.marcelo.schmitt@analog.com?part=3D3
