Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D208381E9D
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 22:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783029745; cv=none; b=UsTN9xXqkbujAZ/N4MFN5FZ48KhR6by8KpIGS9oqOWb9w2In29O502zPZDz84WlpjH9weABQQgOqN+nox5VY0LQIvUaoohEa6AN3oABEVG6Bwl894pBLLSm+jKIt6JEaaBhCzBaUK39znkHkfYYEY9FU9K/V/scTJlrGsOWOOAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783029745; c=relaxed/simple;
	bh=LJpXYnMaidJoD1PICtCWH2r125k5Vn9wwi8G6fxXG0I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e6LaZw+3zW5VWpbWBenyM/+/G/uPw9lNXn3mBdMs3EMfzQIQp1D0XauNaft6uwoad9oBfHXfIlsIAJnxi42IRe+JVWlRo58xCUcEi3QnQLTOOAlirQDrpmL4Gfztt5BzJvornPAlBWsFYf8zg70bGV6yfrD4hfaG5JkFK/1CUD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kIVA940j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kIVA940j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C717E1F00A3A;
	Thu,  2 Jul 2026 22:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783029744;
	bh=YcNwIA5KirJdPQWSXlUYGKfUA6g5xz5BTUfUivNJZ3Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kIVA940j91ZMXJVXbFqyNM60Vd7m6l921gQkjmYs6JF3vpaplbWIDKVT9e4lpcz/g
	 N8+2AJQZ7ZQwAA2HWGCCrJ6IXc8BQA8lm/lRGwzsrlMFvOG7ooc7bhQg/UW3r3WiBi
	 S53Oi8+QxgEwqFgrMflY/IIInITJ6GnB6uSgVQZorPmyr0Q12/GOo4qb/uy7bQh6NK
	 fIbYVK39CME6sfp4mD8uUuRo7JngV38+tClyVV3U/TI/rEwhF24nB5c+trnYK5HlpQ
	 YNhm1ig+bQwETweMsqTmkkcXVIhAIIOaVASqY/rQ4SnNgFLJPV9NVYP7DdoGu+1gae
	 9ZrL9rDLNB7/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/4] iio: adc: ltc2378: Add support for LTC2378-20
 and similar ADCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <724f2408cb84bf4546115408fc9857777e6f2fd7.1783028033.git.marcelo.schmitt@analog.com>
References: <cover.1783028033.git.marcelo.schmitt@analog.com>
 <724f2408cb84bf4546115408fc9857777e6f2fd7.1783028033.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 22:02:23 +0000
Message-Id: <20260702220223.C717E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Hardware protocol violation: CNV is held high during SPI read
- [High] SPI bus not locked during ADC conversion phase
- [Medium] Incorrect scale calculation for LTC2338-18 and similar ADCs
- [Low] Undefined direct mode macros lead to build failure
--

commit b74b536d18af0084ea31bd1e1e8cf9454da5e29c
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ltc2378: Add support for LTC2378-20 and similar ADCs

This commit adds support for the Analog Devices LTC2378-20 and similar
analog-to-digital converters. It introduces a new IIO driver using the
SPI subsystem.

> diff --git a/drivers/iio/adc/ltc2378.c b/drivers/iio/adc/ltc2378.c
> new file mode 100644
> index 0000000000000..b5cf2e974daca
> --- /dev/null
> +++ b/drivers/iio/adc/ltc2378.c
> @@ -0,0 +1,404 @@

[ ... ]

> +static const struct ltc2378_chip_info ltc2338_18_chip_info =3D {
> +	.name =3D "ltc2338-18",
> +	.internal_ref_uV =3D 4096000,
> +	.chan =3D LTC2378_BIPOLAR_DIFF_CHANNEL(18),
> +};

[ ... ]

> +static int ltc2378_convert_and_acquire(struct ltc2378_state *st)
> +{
> +	int ret;
> +
> +	/* Cause a rising edge of CNV to initiate a new ADC conversion */
> +	gpiod_set_value_cansleep(st->cnv_gpio, 1);
> +	fsleep(4);

[Severity: High]
Can this sequence cause data corruption on a shared SPI bus?

The CNV pin is toggled and an fsleep(4) occurs before spi_sync_transfer()
locks the bus. If another SPI transaction occurs during this sleep window,
could it toggle the SCK line and prematurely clock data out of the ADC?

Should the conversion-and-read sequence be wrapped in spi_bus_lock()
and spi_bus_unlock()?

> +	ret =3D spi_sync_transfer(st->spi, &st->xfer, 1);

[Severity: High]
Does reading from the SPI bus while CNV is held high violate the hardware
protocol?

The ADC requires the CNV pin to be brought low to enable the SDO
output before clocking out data via SPI, but spi_sync_transfer() happens
before gpiod_set_value_cansleep(st->cnv_gpio, 0), which might result in
reading high-impedance garbage data.

> +	gpiod_set_value_cansleep(st->cnv_gpio, 0);
> +
> +	return ret;
> +}

[ ... ]

> +static int ltc2378_read_raw(struct iio_dev *indio_dev,
> +			    const struct iio_chan_spec *chan,
> +			    int *val, int *val2, long mask)
> +{
> +	struct ltc2378_state *st =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW: {
> +		IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
> +		if (IIO_DEV_ACQUIRE_FAILED(claim))
> +			return -EBUSY;

[Severity: Low]
Will this cause a build failure?

The macros IIO_DEV_ACQUIRE_DIRECT_MODE and IIO_DEV_ACQUIRE_FAILED appear
to be undeclared in the kernel tree.

> +
> +		ret =3D ltc2378_channel_single_read(chan, st, val);
> +		if (ret)
> +			return ret;
> +
> +		return IIO_VAL_INT;
> +	}
> +	case IIO_CHAN_INFO_SCALE:
> +		*val =3D st->ref_uV / MILLI;

[Severity: Medium]
Does this calculate an incorrect IIO scale for the LTC2338-18?

Does this miss the 2.5x input span multiplier unique to the LTC2338-18
when calculating the IIO scale here?

> +		/*
> +		 * For all LTC2378-like devices, the amount of bits that express
> +		 * voltage magnitude depend on the polarity / output code format:
> +		 * - straight binary: All precision/resolution bits are used.
> +		 * - 2's complement: One of the precision bits is used for sign.
> +		 */
> +		if (chan->scan_type.format =3D=3D IIO_SCAN_FORMAT_SIGNED_INT)
> +			*val2 =3D chan->scan_type.realbits - 1;
> +		else
> +			*val2 =3D chan->scan_type.realbits;
> +
> +		return IIO_VAL_FRACTIONAL_LOG2;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +}

[ ... ]

> +static int ltc2378_refin_setup(struct device *dev, struct ltc2378_state =
*st)
> +{
> +	int ret;
> +
> +	/*
> +	 * The internal reference buffer amplifies both the internal reference
> +	 * and REFIN by a factor of 2.
> +	 */
> +	ret =3D devm_regulator_get_enable_read_voltage(dev, "refin");
> +	if (ret =3D=3D -ENODEV) /* refin is optional */
> +		st->ref_uV =3D st->info->internal_ref_uV * 2;

[Severity: Medium]
Does this incorrectly double the internal reference voltage?

The ltc2338_18_chip_info already defines internal_ref_uV as the post-buffer
value of 4096000 (4.096V). Multiplying it by 2 here would result in an
incorrect scale value.

> +	else if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to read refin regulator\n");
> +	else
> +		st->ref_uV =3D ret * 2;
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783028033.gi=
t.marcelo.schmitt@analog.com?part=3D2
