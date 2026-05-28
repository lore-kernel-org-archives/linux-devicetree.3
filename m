Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8C63F7ABB
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 15:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983504; cv=none; b=BpS51hsO8RJqQFckUYjinZP3qlBzfsGXwCakor/sMLOmV5NttJDgBuwaPh6vUKAm1zU9T8tieh53jZFaGN8ynRL9HcMHeGqNOBftpOUPY0BD+SOZRdFv2PQU3E+7zFKUbmYyUPu/dxu+a6nHapV8i1mC5Uxhf7dRngcSI9wbX6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983504; c=relaxed/simple;
	bh=hFwiJp2hZpeuk5//kWZ0Y83ZhY+bx3M1WEQ6VMevoIk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mOlYK6MweCC8JmhDWb3kOcs14yulquZud+r0wvhe2GJ1fU9FKvLdGSxFUJTby1lKFyQGkiR+pxdUf+wXLzHO5QTXxrmXCz8HPuSv54k6MUGuab/kotIjdBRJEayf27fa5MtXAB71H3z79ED8VW4jDfrs9XvN9AkdN6a/jKB7A1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZUU6x38l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZUU6x38l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BFFC1F000E9;
	Thu, 28 May 2026 15:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779983502;
	bh=Kou+6q2WjjVs4dn10kIWTgoA1lv01BkQLQNw+moCWnA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZUU6x38lUKTmUweIH+lcEeK/4p+xaI8ju+NS/htr0bVJbCkPy6cXHO9Gqn9E9X7p2
	 XHvidIH+zWFzIROqJ6HFjNES0J8Idh4BFPVhy5/D13g6QJSxLdfiHUHqt25M+E02bV
	 rKng4ktciwOR3LnJpvCvJ3kR0P2buqs1iorpxMkVngnJmrCFsBUHUfd76yLLJGTTSw
	 EZ4Qsm+h76V5jKdVS0mYSd28oYwQ7TZOsudyRhLbhPI4XFF2qsD/N2zeUmp75VsheW
	 Bu5ZGAl+HgN6IZKvKrscC/H6bg9Z+QypBQp2ee4Alk2ihVSiNhOF/952KBxNomp8MX
	 3+DVQJsPGTvTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] iio: adc: ltc2378: Add support for LTC2378-20
 and similar ADCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <40e1108bc9eaeba486705b54c4c94004f0e7f369.1779976379.git.marcelo.schmitt@analog.com>
References: <40e1108bc9eaeba486705b54c4c94004f0e7f369.1779976379.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 15:51:41 +0000
Message-Id: <20260528155142.2BFFC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The driver fails to right-shift >16-bit ADC data read via SPI into=
 a 32-bit word, corrupting both the raw value and its sign extension.
- [Medium] The Kconfig specifies a spurious dependency on `PWM`, which allo=
ws the driver to compile without `GPIOLIB` and silently fail to trigger ADC=
 conversions in direct mode.
- [Medium] The driver explicitly forces `bits_per_word` to 32 or 16, which =
arbitrarily restricts compatibility with many SPI controllers.
- [Low] Using the `IIO_DEV_ACQUIRE_DIRECT_MODE` cleanup macro inside a `swi=
tch` case without a block scope causes a compiler error.
--

commit ffe34f72dbe517b28d007ae50c98ce8f89d8b64c
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ltc2378: Add support for LTC2378-20 and similar ADCs

This commit adds support for the Analog Devices LTC2378-20 and similar
analog-to-digital converters to the IIO subsystem.

> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -939,6 +939,18 @@ config LTC2309
> =20
> +config LTC2378
> +	tristate "Analog Devices LTC2378 ADC driver"
> +	depends on SPI
> +	depends on GPIOLIB || PWM

[Severity: Medium]
Does this spurious dependency on PWM allow the driver to compile without
GPIOLIB?=20

If GPIOLIB is disabled, devm_gpiod_get_optional() will return NULL. When=20
ltc2378_convert_and_acquire() subsequently calls gpiod_set_value_cansleep(),
it will silently do nothing.

Will this prevent the ADC conversions from being initiated in direct mode,=
=20
causing the SPI transfer to silently read stale data or zeroes?

[ ... ]
> diff --git a/drivers/iio/adc/ltc2378.c b/drivers/iio/adc/ltc2378.c
> --- /dev/null
> +++ b/drivers/iio/adc/ltc2378.c
[ ... ]
> +static int ltc2378_channel_single_read(const struct iio_chan_spec *chan,
> +				       struct ltc2378_state *st, int *val)
> +{
> +	const struct iio_scan_type *scan_type =3D &chan->scan_type;
> +	u32 sample;
> +	int ret;
> +
> +	ret =3D ltc2378_convert_and_acquire(st);
> +	if (ret)
> +		return ret;
> +
> +	if (scan_type->realbits > 16)
> +		sample =3D st->scan.data.sample_buf32;
> +	else
> +		sample =3D st->scan.data.sample_buf16;
> +
> +	if (scan_type->format =3D=3D IIO_SCAN_FORMAT_SIGNED_INT)
> +		*val =3D sign_extend32(sample, scan_type->realbits - 1);

[Severity: High]
Are we missing a right-shift for >16-bit ADCs?=20

When bits_per_word is set to 32, the SPI controller clocks in 32 bits
MSB-first and stores them in CPU native endianness. The valid 18 or 20 bits
will occupy the upper bits of the 32-bit word, leaving trailing zeroes.

Doesn't passing this unshifted sample directly to sign_extend32() evaluate
the wrong bit for the sign extension, and also magnify the returned value
by a factor of 2^14?

Should we also populate scan_type.shift in the probe function so userspace
buffer consumers don't end up reading unshifted garbage?

> +	else
> +		*val =3D sample;
> +
> +	return 0;
> +}
> +
> +static int ltc2378_read_raw(struct iio_dev *indio_dev,
> +			    const struct iio_chan_spec *chan,
> +			int *val, int *val2, long info)
> +{
> +	struct ltc2378_state *st =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	switch (info) {
> +	case IIO_CHAN_INFO_RAW:
> +		IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);

[Severity: Low]
Does this missing block scope cause a compiler error?=20

The IIO_DEV_ACQUIRE_DIRECT_MODE macro expands to a cleanup variable
declaration. Because the switch case lacks an enclosing block, jumping to
case IIO_CHAN_INFO_SCALE skips the variable's initialization, which compile=
rs
like GCC reject.

While I noticed this is fixed in a later patch in the series, doesn't this
break git bisectability by causing this specific commit to fail compilation?

> +		if (IIO_DEV_ACQUIRE_FAILED(claim))
> +			return -EBUSY;
> +
> +		ret =3D ltc2378_channel_single_read(chan, st, val);
[ ... ]
> +static int ltc2378_probe(struct spi_device *spi)
> +{
[ ... ]
> +	st->chans[0].scan_type.realbits =3D st->info->resolution;
> +	st->chans[0].scan_type.storagebits =3D st->info->resolution > 16 ? 32 :=
 16;
> +
> +	st->xfer.rx_buf =3D &st->scan.data;
> +	st->xfer.len =3D BITS_TO_BYTES(st->chans[0].scan_type.storagebits);
> +	st->xfer.bits_per_word =3D st->info->resolution > 16 ? 32 : 16;

[Severity: Medium]
Does forcing bits_per_word to 32 or 16 arbitrarily restrict compatibility
with standard SPI controllers?

Some standard SPI controllers (like the bcm2835 SPI) only support 8-bit
transfers. When 32-bit or 16-bit words are requested, the SPI core's
__spi_validate() checks the controller capabilities and fails the transfer
with -EINVAL.

Would it be safer to use standard 8-bit transfers and reconstruct the word
using get_unaligned_be32()?

> +
> +	indio_dev->channels =3D st->chans;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1779976379.gi=
t.marcelo.schmitt@analog.com?part=3D2
