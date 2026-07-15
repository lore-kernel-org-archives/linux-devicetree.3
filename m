Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47518449ED6
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 11:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784116325; cv=none; b=o9QH7NxX/cwplTSqqS88vvn7IPD6LjwvPR6X9XvKYsY2aMvmapr2TF+FqZLW0du5iCyBlfpi1WD0bsCMVdHoZaXFwF9fjkaP69tIikbqg4TWQ9yx73sLFtrs8SzLomk2/jruEenlZAXtcpg7SSi8qCWsU9VwQDy/BakY6DkWIAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784116325; c=relaxed/simple;
	bh=5jg/YfJvBWz/v4QIu2sc5bR6wj0uV8G8krU0jzSkPMY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P7fN0TSgmxi231f+JrmhwiElCFkxM3uNTAbCyG6BJsGtpvKdDaCwQJAp4jUNXeecSuiO50f+IaBVi+gLQ8J442E1AQq6nVN2rbj5qGE/q0bSXh6r3aq77HnUoLDXArfwUS8/o1bh+v5VcPuDvhyFTxq3K93u5bdfWgz18t5WwK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HyyZ/mKa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HyyZ/mKa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D76D1F000E9;
	Wed, 15 Jul 2026 11:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784116323;
	bh=aIzqD/PbWySHuIn8vI8MCMXJJiAwbVdW8fUKI8WYZGQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HyyZ/mKa+U3iJkChKSOjzm2+AXrwdX0mLzPlFB0l9aNW/SGYsJaLJLtjuIq6R4rMa
	 0GJIqCjqgoCyfzXL6KeyKjJAXyjCiB3nYDH2pzM4/0m+L9g2f3sQGTd80GYBWuENFt
	 7ZWVgEcizvo1X1eLkn6kP7y8xOrkhezz7HEoZ64mhKKtifp8O5J2IgOWujhbdalU3r
	 76SBBxu3ADmIrhJ6tUWhI2DmB6x6h4Mg/xXdyPOGSyj4ono7mdn0SbEIY4b6mDyw5S
	 bmKDyzm2WEdNmKOpGY2dRuY1n8RkSUAGrA6v8nbNbZe+HOpoyD8e4LGafaAshsQP8r
	 HGJuW/t8kI6PQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/5] iio: dac: Add AD5529R DAC driver support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260715-ad5529r-driver-v6-5-cfdf8b9f5ee3@analog.com>
References: <20260715-ad5529r-driver-v6-0-cfdf8b9f5ee3@analog.com>
 <20260715-ad5529r-driver-v6-5-cfdf8b9f5ee3@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 11:52:03 +0000
Message-Id: <20260715115203.9D76D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Heap buffer overflow during device tree channel parsing
- [High] Incorrect Regmap endianness configuration corrupts SPI communicati=
on
- [Medium] Incorrect regulator presence detection when CONFIG_REGULATOR=3Dn
- [Medium] Missing timing delay between hardware reset assert and deassert
- [Medium] Potential data misalignment for 12-bit device variant
--

--- Patch [5]: [PATCH v6 5/5] iio: dac: Add AD5529R DAC driver support ---
commit e8333f8884287977f99dcd3fe867d9426fc20f71
Author: Janani Sunil <janani.sunil@analog.com>

iio: dac: Add AD5529R DAC driver support

Add support for AD5529R 16-channel, 12/16 bit Digital to Analog Converter
from Analog Devices.

> diff --git a/drivers/iio/dac/ad5529r.c b/drivers/iio/dac/ad5529r.c
> new file mode 100644
> index 0000000000000..c279dc530d688
> --- /dev/null
> +++ b/drivers/iio/dac/ad5529r.c
> @@ -0,0 +1,502 @@

[ ... ]

> +static const struct regmap_config ad5529r_regmap_16bit_config =3D {
> +	.name =3D "ad5529r-16bit",
> +	.reg_bits =3D 16,
> +	.val_bits =3D 16,
> +	.max_register =3D AD5529R_MAX_REGISTER,
> +	.read_flag_mask =3D AD5529R_SPI_READ_FLAG,
> +	.val_format_endian =3D REGMAP_ENDIAN_LITTLE,

[Severity: High]
Is this Little Endian configuration correct? Analog Devices SPI peripherals=
=20
typically use Big Endian (MSB first) for 16-bit payloads. Could this=20
byte-swap and corrupt the SPI data on transmission?

> +	.rd_table =3D &ad5529r_16bit_readable_table,
> +	.wr_table =3D &ad5529r_16bit_writeable_table,
> +	.reg_stride =3D 2,
> +};

[ ... ]

> +static int ad5529r_reset(struct ad5529r_state *st)
> +{
> +	struct reset_control *rst;
> +	int ret;
> +
> +	rst =3D devm_reset_control_get_optional_exclusive(&st->spi->dev, NULL);
> +	if (IS_ERR(rst))
> +		return PTR_ERR(rst);
> +
> +	if (rst) {
> +		ret =3D reset_control_assert(rst);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D reset_control_deassert(rst);

[Severity: Medium]
Does the hardware require a minimum reset pulse width? Calling=20
reset_control_assert() and reset_control_deassert() sequentially without a=
=20
delay usually generates a sub-microsecond pulse that might be too short=20
for the device to properly initialize.

> +		if (ret)
> +			return ret;
> +	} else {

[ ... ]

> +static int ad5529r_read_raw(struct iio_dev *indio_dev,
> +			    struct iio_chan_spec const *chan,
> +			    int *val, int *val2, long mask)
> +{
> +	struct ad5529r_state *st =3D iio_priv(indio_dev);
> +	unsigned int reg_addr, reg_val_h;
> +	int ret, range_idx, span_mv;
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

[Severity: Medium]
Does the 12-bit variant of this chip expect left-aligned data in the 16-bit=
=20
register? If so, reading the unshifted register value could return incorrec=
t=20
scale data for the 12-bit device.

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

[Severity: Medium]
Similar to the read path, if the 12-bit payload needs to be left-aligned,=20
writing it directly here without shifting could cause the hardware to=20
interpret it as a much smaller value. Should this value be shifted based on=
=20
the device resolution?

> +	default:
> +		return -EINVAL;
> +	}
> +}

[ ... ]

> +static int ad5529r_parse_channel_ranges(struct device *dev,
> +					struct ad5529r_state *st)
> +{
> +	s32 vals[2];
> +	int ret, range_idx;
> +	u32 ch;
> +
> +	device_for_each_child_node_scoped(dev, child) {
> +		ret =3D fwnode_property_read_u32(child, "reg", &ch);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "Missing reg property in channel node\n");
> +
> +		if (ch >=3D 16)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "Channel %u exceeds maximum 15\n",
> +					     ch);

[ ... ]

> +		st->output_range_idx[ch] =3D range_idx;
> +		ret =3D regmap_write(st->regmap_16bit,
> +				   AD5529R_REG_OUT_RANGE(ch), range_idx);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "Failed to configure range for ch %u\n",
> +					     ch);
> +
> +		st->channels[st->num_channels++] =3D AD5529R_DAC_CHANNEL(ch);

[Severity: High]
Could this overflow the channels array? While there is a check for ch >=3D =
16=20
above, there doesn't seem to be a check on the total number of child nodes.=
=20
If a malformed device tree provides more than 16 child nodes (for instance,=
=20
by duplicating reg properties), st->num_channels could exceed 15 and write=
=20
out of bounds.

> +	}
> +
> +	return 0;
> +}

[ ... ]

> +static int ad5529r_probe(struct spi_device *spi)
> +{

[ ... ]

> +	ret =3D devm_regulator_get_enable_optional(dev, "vref");
> +	if (ret =3D=3D -ENODEV)
> +		external_vref =3D false;
> +	else if (!ret)
> +		external_vref =3D true;

[Severity: Medium]
Can this result in incorrect regulator configuration if CONFIG_REGULATOR is=
=20
disabled? The dummy implementation of devm_regulator_get_enable_optional()=
=20
returns 0 in that case, which would cause this to set external_vref =3D tru=
e=20
and disable the internal reference even if no external reference exists on=
=20
the board.

> +	else
> +		return dev_err_probe(dev, ret,
> +				     "Failed to get and enable vref regulator\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-ad5529r-dr=
iver-v6-0-cfdf8b9f5ee3@analog.com?part=3D5
