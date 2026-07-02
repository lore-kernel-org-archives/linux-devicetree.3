Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FC63264C7
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 22:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783030048; cv=none; b=oftNUrl0GxuuSUKzmpHSPGPo7gFc2ZsedjMg6ff5YTXxIcqm+sOwk+48BPDoEU5lsvsZLqvqhHu0bFpBflredHKqSAyE40Ud2kBJzDfmJBB/ftD984FceITWiVEAg8rZkaQvZnFeaIFxwmWXE0Bzr5pHWWbTlA7EcKQPoBEpXOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783030048; c=relaxed/simple;
	bh=+9OCUaGZcJivuzOCjtAtjbdhD7jAF28KS/+OfQOLrM0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GKVwr8q0yTkOJIBiDVSu8rMRDY5Kt4cU9+Y1E8xbqNGwfKwaYICIYGUSKUrbThAqCQuV1uUikWgR3v4stz3onxeoGMHS1jvg2VqwWgIzDvN80+K1j5gkfFrFCT7GtHcNq7g0zdutnyKPHtknRD33ExRCxWaMUoiYf+euRAFyRRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FQh3G7hb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FQh3G7hb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 718A21F000E9;
	Thu,  2 Jul 2026 22:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783030046;
	bh=GWktlLyikbg+QwZuiM/r1NBpR2wMdots36B8P6rSZHg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FQh3G7hbFDehJUazTBi0R1CFA2bWaY8hNJdXBlwJL9Xi/JFtUpQ3NL6604Zx/H6h0
	 Zrn/4NTSkmpCNdindOsi06cqCVdZTBjzZAsu4qvKENhER8Md+Go9+/xOUVrzVZdC31
	 WrF0QhwDoP83zOOU3nNBs5k0fCR7ILn2SrIAiEj/MSVpZJqnNQosQ/VqyTqTmVquZX
	 LYoDCIplgkcpXBKzEO+hE+1LPS1KgS4Krmd7O9cHnDSirEFx2wqo+mT9NrijWAdWnN
	 WA17+v5rH8jKPlZZAK1KxRIoN3lHOA1Ls99/iAzsWXVisACHqR6FdEMAQ8dic+HBMO
	 WY3INisk1HReQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/4] iio: adc: ltc2378: Enable high-speed data
 capture
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <e285c16edf2e5483effad96a852a2ae110a27899.1783028033.git.marcelo.schmitt@analog.com>
References: <cover.1783028033.git.marcelo.schmitt@analog.com>
 <e285c16edf2e5483effad96a852a2ae110a27899.1783028033.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 22:07:25 +0000
Message-Id: <20260702220726.718A21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [Critical] Access to non-existent `offset_ns` field in `struct spi_offloa=
d_trigger_periodic` causes a build failure.
- [Critical] The macro `HZ_PER_GHZ` is used but never defined anywhere in t=
he kernel, causing a build failure.
- [High] Mismatch between SPI offload transfer length and IIO channel stora=
ge bits for 16-bit devices causes buffer data corruption.
- [High] Unassigned `length` pointer in `ltc2378_read_avail` API callback l=
eaves caller variable uninitialized.
- [High] Unpredictable phase shift between two independent PWM channels ris=
ks hardware data corruption.
- [High] Forcing unsupported `bits_per_word` breaks single-shot reads on st=
andard SPI controllers.
- [Medium] `st->offload_trigger_config` is updated in-place and not rolled =
back on validation failure, corrupting driver state.
--

commit 7c29c089819a4620f86fae01e267747bb7a266ff
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ltc2378: Enable high-speed data capture

Make use of SPI transfer offloading to speed up data capture, enabling data
acquisition at faster sample rates (up to 2 MSPS).

> diff --git a/drivers/iio/adc/ltc2378.c b/drivers/iio/adc/ltc2378.c
> index b5cf2e974daca..b25602d91bbe1 100644
> --- a/drivers/iio/adc/ltc2378.c
> +++ b/drivers/iio/adc/ltc2378.c
[ ... ]
> @@ -46,10 +58,19 @@
>  #define LTC2378_UNIPOLAR_DIFF_CHANNEL(_real_bits)				\
>  	LTC2378_DIFF_CHANNEL(0, _real_bits, (((_real_bits) > 16) ? 32 : 16), 0)
> =20
> +#define LTC2378_OFFLOAD_BIPOLAR_DIFF_CHANNEL(_real_bits)			\
> +	LTC2378_DIFF_CHANNEL(1, (_real_bits), 32, 1)
> +
> +#define LTC2378_OFFLOAD_UNIPOLAR_DIFF_CHANNEL(_real_bits)			\
> +	LTC2378_DIFF_CHANNEL(0, (_real_bits), 32, 1)
> +

[Severity: High]
Does hardcoding the storagebits to 32 here mismatch with the SPI transfer
length for 16-bit devices?

When ltc2378_prepare_offload_message() configures the transfer, it sets the
length to spi_bpw_to_bytes(16), which is 2 bytes. Since the IIO subsystem
expects 4 bytes per sample based on these channel definitions, could this
cause buffer reads to be misaligned and return garbage data to userspace?

[ ... ]
> @@ -254,7 +344,136 @@ static int ltc2378_read_raw(struct iio_dev *indio_d=
ev,
>  			*val2 =3D chan->scan_type.realbits;
> =20
>  		return IIO_VAL_FRACTIONAL_LOG2;
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		*val =3D st->cnv_Hz;
> +		return IIO_VAL_INT;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int ltc2378_read_avail(struct iio_dev *indio_dev,
> +			      struct iio_chan_spec const *chan,
> +			      const int **vals, int *type, int *length, long mask)
> +{
> +	struct ltc2378_state *st =3D iio_priv(indio_dev);
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		*vals =3D st->sample_freq_range;
> +		*type =3D IIO_VAL_INT;
> +		return IIO_AVAIL_RANGE;

[Severity: High]
Should this callback also initialize the length pointer?

Since this returns IIO_AVAIL_RANGE successfully but doesn't assign *length,
callers like iio_read_channel_info_avail() in the core might use an
uninitialized stack variable for the array size. Could this lead to
out-of-bounds array reads?

> +	default:
> +		return -EINVAL;
> +	}
> +}
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
> +	config->periodic.frequency_hz =3D DIV_ROUND_UP(HZ_PER_GHZ, offload_peri=
od_ns);

[Severity: Critical]
Is HZ_PER_GHZ defined anywhere in the kernel?

Looking through the tree and include/linux/units.h, this macro doesn't appe=
ar
to exist. Won't this cause an unconditional build failure?

> +	min_read_offset =3D LTC2378_TBUSYLH_NS + st->info->tconv_ns + LTC2378_T=
DSDOBUSYL_NS;
> +	offload_offset_ns =3D min_read_offset;
> +	count =3D 100;
> +	do {
> +		config->periodic.offset_ns =3D offload_offset_ns;

[Severity: Critical]
Does struct spi_offload_trigger_periodic actually have an offset_ns field?

According to include/linux/spi/offload/types.h, struct
spi_offload_trigger_periodic only contains the frequency_hz field. This see=
ms
like it will cause a build error.

> +		ret =3D spi_offload_trigger_validate(st->offload_trigger, config);
> +		if (ret)
> +			return ret;

[Severity: Medium]
If validation fails here, does the in-place modification of the shared conf=
ig
struct get rolled back?

Since config points directly to st->offload_trigger_config, returning early
leaves the device state with rejected values. If the IIO buffer is later
enabled, could the driver use these invalid config values to start the
offload trigger?

> +		offload_offset_ns +=3D 10;
> +	} while (count-- && config->periodic.offset_ns < min_read_offset);
[ ... ]
> +static int ltc2378_offload_buffer_postenable(struct iio_dev *indio_dev)
> +{
> +	struct ltc2378_state *st =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	ret =3D pwm_set_waveform_might_sleep(st->cnv_trigger, &st->cnv_wf, true=
);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D spi_offload_trigger_enable(st->offload, st->offload_trigger,
> +					 &st->offload_trigger_config);

[Severity: High]
Does starting these two clock sources sequentially result in an unpredictab=
le
phase shift?

Since st->cnv_trigger and st->offload_trigger are independent and enabled o=
ne
after the other in software, CPU execution delays might cause an uncontroll=
ed
phase alignment. The LTC2378 datasheet forbids SCLK toggling during the
conversion phase. Could this random phase shift cause SPI transactions to
overlap with the conversion window and corrupt the sampled data?

> +	if (ret)
> +		goto out_pwm_disable;
> +
> +	return 0;
[ ... ]
> @@ -330,8 +653,53 @@ static int ltc2378_probe(struct spi_device *spi)
[ ... ]
> +		/*
> +		 * Set single-read transfer bits_per_word so the SPI subsystem
> +		 * rearanges data to CPU endianness, enabling us to reuse
> +		 * offload_chan specifications for single-shot reads.
> +		 */
> +		st->xfer.bits_per_word =3D st->info->offload_chan.scan_type.realbits;

[Severity: High]
Is it safe to force this bits_per_word on the shared transfer struct used f=
or
regular single-shot reads?

Most generic SPI host controllers only natively support standard word widths
(like 8, 16, 32). If bits_per_word is set to an arbitrary resolution like 1=
8,
won't the SPI core's __spi_validate reject the transfer with -EINVAL and br=
eak
sysfs single-shot reads?

> +	}
> =20
>  	st->xfer.rx_buf =3D &st->scan.data;
>  	st->xfer.len =3D spi_bpw_to_bytes(indio_dev->channels[0].scan_type.real=
bits);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783028033.gi=
t.marcelo.schmitt@analog.com?part=3D3
