Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA08372EEA
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 17:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788371386; cv=none; b=KdyW3CQy5TDuMc+nAKtQby2mA5ih20tBcfga//Tl8uZ0CqSPeAtyHnD4r6KYb/6PlJRKQdeimYzLKpkj/Bh2R6n8X5wc9az8nmTF5jm/5Zxl7gGVFzkzr1k+d7BP3dGSppAy7u/Q703SyzKL9pk2r5iT3l2MnX6yb0Ali8GQ0DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788371386; c=relaxed/simple;
	bh=y8RsXoLHm9rlScyTgdA0HTTR4bFPlY6R2YePixanJfY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t84ZCbmGJdApQnCF/ctaGwXBouBfTah/2eArhk/hRvdoEf9LDwgrKcbn/HbMh/2lJwMrvbpmQEdvPpq/fi5WP4I1kwH67RH+NuuVwxHbzWkQdhg1Z8GVUxMzVjS+/Bf09dpR0xGBsmOolIdGONp4buytOuS0Khcj0VQcTp679yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d0qW5P3s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d0qW5P3s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 286BC1F000E9;
	Wed,  2 Sep 2026 17:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788371384;
	bh=RzPw6yv06lXHy0tRDrMauCZ/qkxFcIpZyZpeixH6ecg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d0qW5P3sWjtyvFj9OtTTGigI/Ih8lnmb0TotIULym8VPeVygklDQhMF9hHFyVt72b
	 9s1qmwDlU4i4/7FDuve/j5Ju2boRRySgckoabmfhkUkggQPY2vMjDz3aKSH/+BrTj6
	 rlNNnaNFWzHmNlLJiZYlzAZd2hrpg1PL+sjU9yxGT+4WAed0CD2xyc9xDjfp7OMufa
	 VgJo48wHO5wz+zyh3G63EjJjBhcxMtcjpUY01z/Lg9jfi0Bv1ypCwnxI2yUlB/JmQM
	 RkloEiM+QiZsnMq+LNZ5RPWNEFMX7s+BIuYJ0I/B+uSuFGg/9B0JwFOVuZ2X22isnz
	 EGTu2gPgr2/6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 12/13] iio: adc: ad4134: Support high-speed data
 capture
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <53d79eed25795db5076d7c591f6dd8cf4feedfec.1788368334.git.marcelo.schmitt@analog.com>
References: <cover.1788368334.git.marcelo.schmitt@analog.com>
 <53d79eed25795db5076d7c591f6dd8cf4feedfec.1788368334.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 17:49:43 +0000
Message-Id: <20260902174944.286BC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] Buffer overflow in `ad4134_trigger_handler` when iterating ove=
r the scan mask length.
- [High] NULL pointer dereference in `ad4134_offload_buffer_postenable` err=
or path for AD4134_SPI_MODE_NO_CS.
- [High] Incorrect SPI transfer length in 1-lane offload mode causes buffer=
 format mismatch and data corruption.
- [High] Hardware PWM resource leak on driver unbind due to missing disable=
 action.
- [Medium] Data race on `st->odr_hz` in `ad4134_read_raw` due to missing lo=
ck.
--

commit d7cbe54fc38bde7020274d75b09e6803ffb16fca
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ad4134: Support high-speed data capture

This commit adds support for SPI transfer offloading to speed up data
capture, enabling data acquisition at faster sample rates up to 1.496 MSPS.

> diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> index 8453b44ef368f..cf84d2b24417d 100644
> --- a/drivers/iio/adc/ad4134.c
> +++ b/drivers/iio/adc/ad4134.c
[ ... ]
> @@ -454,6 +509,90 @@ static const struct regmap_config ad4134_regmap_conf=
ig =3D {
>  	.max_register =3D AD4134_CH_VREG(ARRAY_SIZE(ad4134_chan_set)),
>  };
> =20
> +static int ad4134_update_conversion_rate(struct ad4134_state *st,
> +					 unsigned int freq_Hz)
> +{
[ ... ]
> +	ret =3D pwm_set_waveform_might_sleep(st->odr_pwm, &odr_wf, false);

[Severity: High]
This starts the ODR PWM hardware, but is there a corresponding cleanup
action or devm callback registered to stop it on driver unbind? Does this
leave the hardware toggling indefinitely if the driver is unbound or if an
error occurs during probe?

> +	if (ret)
> +		return ret;
> +
> +	st->offload_trigger_config =3D config;
> +	st->odr_wf =3D odr_wf;
> +	st->odr_hz =3D DIV_ROUND_UP_ULL(NSEC_PER_SEC, odr_wf.period_length_ns);
> +
> +	return 0;
> +}
[ ... ]
> @@ -537,6 +676,42 @@ static int ad4134_read_raw(struct iio_dev *indio_dev,
>  		*val2 =3D AD4134_CHAN_PRECISION_BITS - 1;
> =20
>  		return IIO_VAL_FRACTIONAL_LOG2;
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		*val =3D st->odr_hz;
> +		return IIO_VAL_INT;

[Severity: Medium]
Is it safe to read st->odr_hz locklessly here? Concurrent writes via
ad4134_write_raw() hold st->lock while modifying this value, which could
lead to a data race if userspace concurrently reads and writes the
sampling frequency sysfs attribute.

> +	default:
> +		return -EINVAL;
> +	}
> +}
[ ... ]
> @@ -588,6 +763,176 @@ static const struct iio_info ad4134_info =3D {
>  	.debugfs_reg_access =3D ad4134_debugfs_reg_access,
>  };
> =20
> +static const struct iio_info ad4134_offload_info =3D {
[ ... ]
> +static void ad4134_prepare_offload_msg(struct iio_dev *indio_dev)
> +{
> +	struct ad4134_state *st =3D iio_priv(indio_dev);
> +	unsigned int base_len =3D roundup_pow_of_two(BITS_TO_BYTES(AD4134_CHAN_=
PRECISION_BITS));
> +	unsigned int bpw =3D AD4134_CHAN_PRECISION_BITS;
> +
> +	st->xfers.cs_off =3D 1;
> +	st->xfers.bits_per_word =3D bpw;
> +	st->xfers.len =3D base_len * st->spi->num_rx_lanes;

[Severity: High]
Since ad4134_scan_masks statically requires all 4 channels to be present
via GENMASK(3, 0), meaning 16 bytes per trigger are required, will this
length calculation of just 4 bytes in 1-lane mode cause the DMA to push
incomplete frames and corrupt the IIO buffer?

> +	if (st->spi->num_rx_lanes > 1)
> +		st->xfers.multi_lane_mode =3D SPI_MULTI_LANE_MODE_STRIPE;
> +
> +	st->xfers.offload_flags =3D SPI_OFFLOAD_XFER_RX_STREAM;
> +
> +	spi_message_init_with_transfers(&st->msg, &st->xfers, 1);
> +}
> +
> +static int ad4134_offload_buffer_postenable(struct iio_dev *indio_dev)
> +{
[ ... ]
> +	ret =3D spi_offload_trigger_enable(st->offload, st->offload_trigger,
> +					 &st->offload_trigger_config);
> +	if (ret)
> +		goto out_unoptimize;
> +
> +	return 0;
> +
> +out_unoptimize:
> +	spi_unoptimize_message(&st->msg);
> +
> +out_set_register_input:
> +	ret2 =3D ad4134_set_register_access(st);

[Severity: High]
If the SPI mode is AD4134_SPI_MODE_NO_CS, the mux control pointer
st->mux_st[AD4134_DOUT0_INPUT] is never initialized. When jumping to
out_set_register_input on an error path, will ad4134_set_register_access()
blindly dereference the NULL mux state when calling
mux_state_deselect(st->mux_st[AD4134_DOUT0_INPUT]), crashing the kernel?

> +	if (ret2)
> +		dev_err(&st->spi->dev, "reg input select error: %d\n", ret2);
> +
> +	return ret;
> +}
[ ... ]
> @@ -747,12 +1089,30 @@ static int ad4134_probe(struct spi_device *spi)
>  		indio_dev->setup_ops =3D &ad4134_buffer_setup_ops;
>  	}
> =20
> -	ret =3D devm_iio_triggered_buffer_setup(dev, indio_dev,
> -					      iio_pollfunc_store_time,
> -					      ad4134_trigger_handler,
> -					      NULL);
> -	if (ret)
> -		return ret;
> +	st->offload =3D devm_spi_offload_get(dev, spi, &ad4134_offload_config);
> +	ret =3D PTR_ERR_OR_ZERO(st->offload);
> +	/* Fall back to low speed usage when no SPI offload is available. */
> +	if (ret =3D=3D -ENODEV) {
> +		indio_dev->info =3D &ad4134_info;
> +		indio_dev->channels =3D ad4134_chan_set;
> +		indio_dev->num_channels =3D ARRAY_SIZE(ad4134_chan_set);
> +		ret =3D devm_iio_triggered_buffer_setup(dev, indio_dev,
> +						      iio_pollfunc_store_time,
> +						      ad4134_trigger_handler,
> +						      NULL);

[Severity: Critical]
When falling back to low speed usage, ad4134_chan_set configures 5 channels
total (4 data channels plus IIO_CHAN_SOFT_TIMESTAMP). Inside
ad4134_trigger_handler(), the code loops up to iio_get_masklength() which
will be 5:

for (unsigned int ch =3D 0; ch < iio_get_masklength(indio_dev); ch++) {
        ret =3D spi_write_then_read(st->spi, NULL, 0, &st->scan[ch], ...);

But st->scan is only sized for AD4134_NUM_CHANNELS (4 elements). Does this
cause an out-of-bounds write for the 5th channel, corrupting memory?

> +		if (ret)
> +			return ret;
> +	} else if (ret) {
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788368334.gi=
t.marcelo.schmitt@analog.com?part=3D12
