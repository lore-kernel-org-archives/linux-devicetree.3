Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC58305673
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 15:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779119505; cv=none; b=j0GqLVhGKoXTYF/gnxY4ncjSeUl/CqvWescJuNe0ypyC5z123VP0QcE9qSmwPSMInABYdw35bPvUWFC4yHvYsTnho9h21/jLQfDseaukGBde3xIE702NyZxPLXzoV1mHe6gsI9kdjWLyLBwWMA4kzS5TKl7tUDZXyRg7WG7qQRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779119505; c=relaxed/simple;
	bh=VVbc7Pav5qirveuzipVkTj1TmkwtCjMM2obnF+dFJCo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iLDNsfTOlHBU3b3z0x84ULqXxMjbuNlNOmnfwt77jFh1O9DtLVftSxMy9wJ5WM7HWz6ZenXdxtTcydH7Z2BS4yFce8LGlLYFJ1gxnHlPR690S6AZLQO/BKFR4xFo7cr1LWpVhB6aKPeKMjSxO5XIOn/8drSF/gXSTWI1wztFXAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sq8dk4g0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sq8dk4g0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8B3FC2BCB7;
	Mon, 18 May 2026 15:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779119505;
	bh=VVbc7Pav5qirveuzipVkTj1TmkwtCjMM2obnF+dFJCo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=sq8dk4g04DuZyuDLiNTjvMwTIQxI/UA5lmb1dF4I7PhO0fyU5Up2oG8j6EAQ1KtU/
	 YS1G8Ex0wpwGwcAnxAI8TyYG06tP+BslwuLsOH4lsaqwLePP2UIN3WLAFCd19tOaFv
	 V2erP+5tNDpu4PlKtU9/mEhJTSlYLyidbJbvTYF/wcyGbbPEmZE/UiV3sQ35Ul6htO
	 Qxnzy+/3rplo9+TvVxKRa5TEgm8ABUAqDgjqj56ie/5s9IlvD2wJbPRhifmplel0oR
	 G2TsB8rRz8lVvBrfYKYJegAk9f3G/mJoDhbhoJUUFwxqmyzHahXSeVqIS29Wz1X85G
	 7Ic0hZcmBs2AQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/4] iio: adc: Add support for LTC2378-20 and similar
 ADCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt1@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <301e4fc7544a485b56e7a8b91c3b66f5ac98e842.1779117444.git.marcelo.schmitt1@gmail.com>
References: <301e4fc7544a485b56e7a8b91c3b66f5ac98e842.1779117444.git.marcelo.schmitt1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 15:51:44 +0000
Message-Id: <20260518155144.D8B3FC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Incorrect bit shift for 18-bit and 20-bit resolutions causes data =
corruption.
- [High] Missing wait for conversion completion before SPI read leads to ha=
rdware timing violation.
- [High] Regulator error code is overridden, breaking probe deferral.
- [Low] Un-scoped guard declaration inside switch statement causes a compil=
ation error.
--

commit fc88b83a84e435cb25c9c503a7fbeb60ddc12e79
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: Add support for LTC2378-20 and similar ADCs

Initial support for LTC2378-20 and similar analog-to-digital converters.

> diff --git a/drivers/iio/adc/ltc2378.c b/drivers/iio/adc/ltc2378.c
> new file mode 100644
> index 0000000000000..7916500c470cf
> --- /dev/null
> +++ b/drivers/iio/adc/ltc2378.c

[ ... ]

> +static int ltc2378_convert_and_acquire(struct ltc2378_state *st)
> +{
> +	int ret;
> +
> +	/* Cause a rising edge of CNV to initiate a new ADC conversion */
> +	gpiod_set_value_cansleep(st->cnv_gpio, 1);
> +	ret =3D spi_sync_transfer(st->spi, &st->xfer, 1);

The ADC requires a minimum conversion time after the rising edge of the
CNV signal before data can be clocked out.

If spi_sync_transfer() is called immediately, could the SPI controller start
clocking the SDO line while the ADC is still converting? Should there be an
explicit delay here (e.g., using ndelay()) to ensure the conversion is
complete?

[ ... ]

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

IIO_DEV_ACQUIRE_DIRECT_MODE() declares a scoped variable using the __cleanu=
p__
attribute. Because it is placed directly under the case label without an
enclosing block, its scope extends to the entire switch statement.=20

If info evaluates to IIO_CHAN_INFO_SCALE, the jump bypasses the variable
initialization. Does this cause a compilation error? Wrapping the case block
in braces would resolve this.

> +		if (IIO_DEV_ACQUIRE_FAILED(claim))
> +			return -EBUSY;
> +
> +		ret =3D ltc2378_channel_single_read(chan, st, val);

[ ... ]

> +static int ltc2378_probe(struct spi_device *spi)
> +{
> +	struct iio_chan_spec *ltc2378_chan;
> +	struct device *dev =3D &spi->dev;
> +	unsigned int num_iio_chans =3D 1;
> +	struct iio_dev *indio_dev;
> +	struct ltc2378_state *st;
> +
> +	indio_dev =3D devm_iio_device_alloc(&spi->dev, sizeof(*st));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	st =3D iio_priv(indio_dev);
> +	st->spi =3D spi;
> +
> +	st->ref_uV =3D devm_regulator_get_enable_read_voltage(dev, "ref");
> +	if (st->ref_uV < 0)
> +		return dev_err_probe(dev, -ENODEV, "failed to read ref regulator\n");

devm_regulator_get_enable_read_voltage() can return -EPROBE_DEFER if the
regulator is not yet initialized. By explicitly passing -ENODEV to
dev_err_probe() instead of propagating st->ref_uV, does this break the probe
deferral mechanism for the regulator?

> +
> +	st->info =3D spi_get_device_match_data(spi);

[ ... ]

> +	*ltc2378_chan =3D (struct iio_chan_spec) {
> +		.type =3D IIO_VOLTAGE,
> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |
> +				      BIT(IIO_CHAN_INFO_SCALE),
> +		.scan_type =3D {
> +			.format =3D st->info->out_format,
> +			.realbits =3D st->info->resolution,
> +			.storagebits =3D st->info->resolution > 16 ? 32 : 16,
> +			.shift =3D st->info->resolution > 16 ? 8 : 0,

For ADCs with >16 bits resolution, storagebits is 32 (4 bytes). Because the
ADC clocks out data MSB-first, the 18 or 20 bits of data are left-aligned in
the 32-bit word.

To properly right-align the data, shouldn't the shift be 32 - realbits
(14 for 18-bit, 12 for 20-bit) instead of a hardcoded 8? Does leaving the d=
ata
misaligned cause sign_extend32() to evaluate the wrong bit as the sign bit
later on, corrupting the sample values?

> +			.endianness =3D IIO_BE,
> +		},
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1779117444.gi=
t.marcelo.schmitt1@gmail.com?part=3D2
