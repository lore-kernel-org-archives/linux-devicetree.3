Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9AD332917
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 07:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787817043; cv=none; b=KQZqC+/76G2vmYWPEmAcQhZDSJgcYK+Y6Z0epLlaYR5zCEiKMcy++jG+8mTF0bN9amaH72osmOk7f8a/WSdM1KeyPDYv17a5hJbGHveFq7JpholITI8qVNKOt/Y2/Y30zoC+TXn0swr9tYJT0tb050DQ3PJEiJcPd3lPR9DU0WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787817043; c=relaxed/simple;
	bh=7T3nOs1nFqJVq4wQ3c//m8+SBVX3pyU1plkutgp8JMw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y1CG8MKWpZ0o3SQmioTk3U7D9swEJ6zSwKllA7YHUEWdTZjeAe8/7Tzw4tRr9dOy+7dWQC66DJQyEVxsqbUEzo3Yw6UDJqZ2OLnWpHQliiLxrlSpvCaDF9zoQikEGKr9hFlMt1IGzZETXSZZXyhhFnyzwby+xQFzQRRJKBFkY1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lMpE5cDG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lMpE5cDG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0721F00A3A;
	Thu, 27 Aug 2026 07:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787817042;
	bh=guVaGtpomdpmIPIEXl4GPdrSgzspHTk3cp+l4/7VMT8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lMpE5cDGBsNo+ziZJgKCHgIp2u8Gxa3B2Grq58sHrnq34ErV7FbwAfUccxHNKYNVP
	 V4ulQuy+C4m6t3SBOQVmZggE41j8O7Ej+QW+yOswwQ+LSu+5iv6sX2pv1bfcwlRfCz
	 S3jXdoFUc2G2Gm1UFPbZjdBrJX9jP5yflB4hTWKlf5JlFzqfHSZhs+qCfJ776x1ZXg
	 0dXLC2zpSAfe0Vf++OVCe+F96vQ92lLT6G42mSsmiNVP97vPEJ/j4/Rmh4M7gSYQXS
	 8afgtcODxZlRPJv099WpwGKTI1Mah688rhFRhHwkGm0MFNZ+fS5t/+ztidpL11sF8s
	 uBcg47DYXR0kw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 3/3] iio: dac: Add AD5529R DAC driver support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260827-ad5529r-driver-v10-3-38f2be07b824@analog.com>
References: <20260827-ad5529r-driver-v10-0-38f2be07b824@analog.com>
 <20260827-ad5529r-driver-v10-3-38f2be07b824@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 07:50:41 +0000
Message-Id: <20260827075041.DE0721F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Inconsistent and incorrect endianness configuration in 16-bit regm=
ap.
- [High] Missing bit shift for 12-bit data variant.
--

commit 30ecf6c6be9fe7d7d56ed009cc4fbd27ef838d98
Author: Janani Sunil <janani.sunil@analog.com>

iio: dac: Add AD5529R DAC driver support

Add support for AD5529R 16-channel, 12/16 bit Digital to Analog Converter
from Analog Devices. The device communicates over SPI and supports
per-channel output range configuration.

> diff --git a/drivers/iio/dac/ad5529r.c b/drivers/iio/dac/ad5529r.c
> new file mode 100644
> index 0000000000000..52601cbf28d5e
> --- /dev/null
> +++ b/drivers/iio/dac/ad5529r.c
[ ... ]
> +static int ad5529r_read_raw(struct iio_dev *indio_dev,
> +			    struct iio_chan_spec const *chan,
> +			    int *val, int *val2, long mask)
> +{
> +	struct ad5529r_state *st =3D iio_priv(indio_dev);
> +	unsigned int reg_addr, reg_val_h;
> +	int ret, range_idx, span_mV;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		/*
> +		 * Read from DAC_INPUT_A register rather than DAC_DATA_READBACK.
> +		 * The DAC operates in transparent mode and directly reflects
> +		 * whatever value is written to the INPUT_A register.
> +		 */
> +		reg_addr =3D AD5529R_REG_DAC_INPUT_A(chan->channel);
> +		ret =3D regmap_read(st->regmap_16bit, reg_addr, &reg_val_h);
> +		if (ret)
> +			return ret;
> +
> +		*val =3D reg_val_h;

[Severity: High]
Does this read of reg_val_h need a bit shift for the 12-bit variant of the
device?

Since 12-bit and 16-bit variants typically share a 16-bit register format,
the 12-bit variant often expects its data to be left-justified. By returning
the 16-bit register value directly without right-shifting, will this read
report a value 16 times higher than the actual scale for 12-bit models?

> +
> +		return IIO_VAL_INT;
[ ... ]
> +static int ad5529r_write_raw(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan,
> +			     int val, int val2, long mask)
> +{
> +	struct ad5529r_state *st =3D iio_priv(indio_dev);
> +	unsigned int reg_addr;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		if (val < 0 || val > GENMASK(st->model_data->resolution - 1, 0))
> +			return -EINVAL;
> +
> +		reg_addr =3D AD5529R_REG_DAC_INPUT_A(chan->channel);
> +
> +		return regmap_write(st->regmap_16bit, reg_addr, val);

[Severity: High]
Similarly, will writing the raw 12-bit value directly to the 16-bit register
without left-justification alignment cause the 12-bit variant to output
voltages significantly lower than intended?

> +	default:
> +		return -EINVAL;
> +	}
> +}
[ ... ]
> +static int ad5529r_probe(struct spi_device *spi)
> +{
> +	struct regmap_config regmap_16bit_cfg;
> +	struct regmap_config regmap_8bit_cfg;
[ ... ]
> +	regmap_16bit_cfg =3D (struct regmap_config) {
> +		.name =3D "ad5529r-16bit",
> +		.reg_bits =3D 16,
> +		.val_bits =3D 16,
> +		.max_register =3D AD5529R_MAX_REGISTER,
> +		.read_flag_mask =3D AD5529R_SPI_READ_FLAG,
> +		.val_format_endian =3D REGMAP_ENDIAN_LITTLE,

[Severity: High]
Will this little-endian configuration break the standard SPI MSB-first
protocol for 16-bit register values?

Standard SPI DACs usually expect big-endian ordering. Since the register
address defaults to big-endian, using REGMAP_ENDIAN_LITTLE for the values
could cause mixed endianness in the SPI transaction, which might result in
completely incorrect 16-bit register reads and writes over the bus.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827-ad5529r-dr=
iver-v10-0-38f2be07b824@analog.com?part=3D3
