Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345633E4C65
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 07:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785915113; cv=none; b=TZ1OwYDCrahL7+I8dle+1aTduHjQRiKdiog7+dc957N+K/YvHppivI3r3IDci8tioXQNkdyvAMA3Ssr70cLkjI/dYRLiAyMpPq1QE/KKjM3kwUPwU7eefjUCX/XNh/CQ1tIdMYuy/b6J2TsS5irWmcsr2ROpEKWSRor7zQP6Q4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785915113; c=relaxed/simple;
	bh=iLUt0S2XIojdC0Saosmb8OFZ6vxjZa5GhA4P/2hK6pc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bvXEWZDLSEih9cOYx68i/lUiitOkJkAJJvVj+Gf3H8A9AkMB1E3OtOFaS4KRkwBv5z46TcMeMJJxzsNKpQf3W48EV2LvShJAPQ1x83iBllTb6qOUqRFQczXrH15aRFAGge/l/yCHhpLP146Oo0J+tJ1l6b00/umuTK35X+WSmRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X/5x+oPF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X/5x+oPF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DDEE1F00A3D;
	Wed,  5 Aug 2026 07:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785915111;
	bh=mUfDJzrQI5TfalwremsY4Kt6sYBzgBb9Q8Nn12nEE6Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X/5x+oPFU2756oChfbijNJgQM9cLWkhaYovOZUYrDfzBRrRh5XiSsD6fefj+90eOu
	 ymF96AdJUmGOdoVk7uqoi8MUoIQPEfCQW0vRIPo7foSh6uXLtHwlZLreKD0g1+mEdx
	 ZCU/Tq90iw9TsXLCKeHAB14DzgVn+WDlhB2ZmxqaWOGbhUYErvigPEMbRaCr1xlLSQ
	 0d2NTsDtYx/dNBn0CXlzjV9sRcPLUYSisj/Ihqtrg9YhTIfGEsusXNeHDrsR7Nvy9P
	 iu5VGYnKwtvGHDOGpet9YFb1P3rHJmGNxBwFvQfw5xYN+bDuZKY1bbNGjJ5+EQliKj
	 5BOlmLEs3NWWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/3] iio: dac: Add AD5529R DAC driver support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805-ad5529r-driver-v8-3-b41781f5632a@analog.com>
References: <20260805-ad5529r-driver-v8-0-b41781f5632a@analog.com>
 <20260805-ad5529r-driver-v8-3-b41781f5632a@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 07:31:51 +0000
Message-Id: <20260805073151.6DDEE1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Incorrect endianness configuration for 16-bit regmap value format,=
 causing byte-swapped SPI data transmission.
- [High] The driver attempts an SPI transaction (software reset) immediatel=
y after enabling power regulators, failing to account for internal Power-On=
 Reset (POR) delay.
- [Medium] External reference voltage is ignored in IIO scale and offset ca=
lculations.
- [Low] The 20 ns delay (`ndelay(20)`) used to hold the hardware reset line=
 active is too short for reliable software-controlled assertion.
--

--- Patch [3]: [PATCH v8 3/3] iio: dac: Add AD5529R DAC driver support ---
commit 2d3e31b4283b225ad0ff6048ec906544c72c44b0
Author: Janani Sunil <janani.sunil@analog.com>

iio: dac: Add AD5529R DAC driver support
   =20
Add support for AD5529R 16-channel, 12/16 bit Digital to Analog Converter
from Analog Devices. The device communicates over SPI and supports
per-channel output range configuration. An optional external 4.096V
reference can be used in place of the internal reference.

> diff --git a/drivers/iio/dac/ad5529r.c b/drivers/iio/dac/ad5529r.c
> new file mode 100644
> index 0000000000000..1ea0ddfdda994
> --- /dev/null
> +++ b/drivers/iio/dac/ad5529r.c

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
> +		/* Minimum reset low width (t_reset) is 20 ns per datasheet. */
> +		ndelay(20);

[Severity: Low]
While the datasheet minimum is 20 ns, is this ndelay(20) too short for
reliable software-controlled assertion?

Depending on bus latencies, PCB capacitance, and pull-up resistor values,
driving a physical line via software GPIO for such a short pulse might not
reach the logic threshold to reliably trigger a reset.

> +
> +		ret =3D reset_control_deassert(rst);
> +		if (ret)
> +			return ret;
> +	} else {
> +		ret =3D regmap_write(st->regmap_8bit, AD5529R_REG_INTERFACE_CONFIG_A,
> +				   AD5529R_INTERFACE_CONFIG_A_SW_RESET);

[Severity: High]
Will this SPI transaction fail if regulators were just enabled dynamically =
in
ad5529r_probe()?

The device requires 10 ms for digital initialization after power-up. If we
execute this software reset immediately without a preceding delay, the comm=
and
might be ignored or the device may set a NOT_READY_ERR.

> +		if (ret)
> +			return ret;
> +	}

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

[ ... ]

> +	case IIO_CHAN_INFO_SCALE:
> +		range_idx =3D st->output_range_idx[chan->channel];
> +
> +		span_mv =3D ad5529r_output_ranges_mV[range_idx][1] -
> +			  ad5529r_output_ranges_mV[range_idx][0];
> +		*val =3D span_mv;

[Severity: Medium]
Does this scale calculation report incorrect values if a non-default extern=
al
reference voltage is supplied?

This calculation strictly uses the hardcoded millivolt spans from
ad5529r_output_ranges_mV. If a user supplies an external reference of a
different voltage, scaling shouldn't be statically tied to this table (which
likely assumes a 4.096V reference).

> +		*val2 =3D st->model_data->resolution;
> +
> +		return IIO_VAL_FRACTIONAL_LOG2;

[ ... ]

> +static int ad5529r_probe(struct spi_device *spi)
> +{
> +	struct device *dev =3D &spi->dev;
> +	struct iio_dev *indio_dev;
> +	struct ad5529r_state *st;
> +	struct regmap_config regmap_8bit_cfg;
> +	struct regmap_config regmap_16bit_cfg;

[ ... ]

> +	regmap_16bit_cfg =3D (struct regmap_config) {
> +		.name =3D "ad5529r-16bit",
> +		.reg_bits =3D 16,
> +		.val_bits =3D 16,
> +		.max_register =3D AD5529R_MAX_REGISTER,
> +		.read_flag_mask =3D AD5529R_SPI_READ_FLAG,
> +		.val_format_endian =3D REGMAP_ENDIAN_LITTLE,

[Severity: High]
Can this cause hardware malfunction due to byte-swapping SPI data transmiss=
ion?

This configures the regmap to byteswap the 16-bit values into little-endian
format. Since reg_format_endian isn't explicitly defined, it defaults the
register address to REGMAP_ENDIAN_BIG. Mixed endianness across a single SPI
transaction is highly unusual for Analog Devices DACs, which typically expe=
ct
MSB-first for the entire frame.

> +		.rd_table =3D &ad5529r_16bit_readable_table,
> +		.wr_table =3D &ad5529r_16bit_writeable_table,
> +		.reg_stride =3D 2,
> +		.reg_base =3D dev_addr << AD5529R_ADDR_SHIFT,
> +	};

[ ... ]

> +	ret =3D devm_regulator_get_enable_optional(dev, "vref");

[Severity: Medium]
Should we query the voltage of the external vref regulator here via
regulator_get_voltage()?

The regulator is retrieved and enabled, but its voltage is never read, which
leads to the hardcoded span issue in ad5529r_read_raw() if the voltage diff=
ers
from the default reference.

> +	if (ret =3D=3D -ENODEV)
> +		external_vref =3D false;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-ad5529r-dr=
iver-v8-0-b41781f5632a@analog.com?part=3D3
