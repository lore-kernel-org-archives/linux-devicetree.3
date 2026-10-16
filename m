Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401BA3B6BE3
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 19:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792179198; cv=none; b=aU4Q9n1SPOeR4D7W+hJWshf63Ki6CjYSl2cPD51/vydrC77iHQScDr7ccduJCpfITRRAOfl29FXM+H0Nehjlv2Ho095UbzyJ99j0Kjzx/nvjNM4Cc/r61UazDge7aaerunYz0C150tQh6l6zUxGx0BtYP2PK+/D44MFMZjBA+iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792179198; c=relaxed/simple;
	bh=VZBIwscNj5mtkwVv34OSbAGg9rOIvXYDyMmBRIpCulU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=atj4Ke4kV88iz2ZnCAK77bO6XhFvjOy+iT8Ys9idrNjpLMmHag+h9NwWPIqVQaRke+t8XQZgh13Xw2U49TY74RyZlAi9zkkIm3w6u4yE2aqg0yyihcB1PfadisGadHttQbGx1Mm11+bD401jBtq0njXvegx/9fbVa6yzMVEJg+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CclZx02H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CclZx02H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 387E41F000C4;
	Fri, 16 Oct 2026 19:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792179195;
	bh=l1b2Wmf2uqkyxRRa22xz9YfVJDzpivU8nw/5EJXXAiA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CclZx02HY+2Ws0J+YMhaswBiFtKs7cOtPy3T0FhQK3uCznqBexgDB7aHSsO4GH6I1
	 c3UTvYDfVBsCTKOrIkoZxC8d27uA0yJbXutrHFDnwKBPfAx4qjlTXGXDqxDmeqWFbt
	 ZVwwuk/nlucI9frnGhTMN87zw+m+DS/d9A2uaeCyobApe1IN/eURwDIj8Vmh+ShEL2
	 5kNnot73yxmRZxW+hN44t1lenNptfQnNZY318IHjGvUJL4MLmPWQ2wmEhpGA5kKacT
	 xKnJ0bsWBXRiNyHstkDRlh8Z3plOBttnZWDh7Wl31q8BFWtb3DDXjeQtVp7hNAktD4
	 Oc9zwt5TE/M9Q==
Message-ID: <sashiko-outbox-174850@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] iio: dac: add AD5413 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bruce Tsao" <bruce.tsao@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261017-ad5413-upstream-v1-2-61f40c8fef25@analog.com>
References: <20261017-ad5413-upstream-v1-0-61f40c8fef25@analog.com>
 <20261017-ad5413-upstream-v1-2-61f40c8fef25@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 19:33:14 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] iio: dac: ad5413: missing range check in ad5413_write_raw()
- [Low] iio: dac: ad5413: unused supplies array in struct ad5413_state
--

commit bcfddef4b6cda1b4c239a6094a38aa835c2860bd
Author: Bruce Tsao <bruce.tsao@analog.com>

iio: dac: add AD5413 driver

This commit adds an IIO driver for the Analog Devices AD5413 single-channel
14-bit voltage and current output DAC over SPI.

> diff --git a/drivers/iio/dac/ad5413.c b/drivers/iio/dac/ad5413.c
> new file mode 100644
> index 0000000000000..96cce32fc640e
> --- /dev/null
> +++ b/drivers/iio/dac/ad5413.c
> @@ -0,0 +1,666 @@

[ ... ]

> +struct ad5413_state {
> +	struct spi_device *spi;
> +	struct regulator_bulk_data supplies[3];

[Severity: Low]
Is supplies[3] in struct ad5413_state needed? ad5413_probe() enables the
regulators using devm_regulator_bulk_get_enable() with ad5413_supply_names,=
 so
this array appears to be unused.

> +	struct mutex lock; /* Protects all register access via SPI */
> +	const struct ad5413_range *out_range;
> +	unsigned int slew_time;
> +	bool pwr_down;
> +	u8 crc8_tbl[CRC8_TABLE_SIZE];
> +	__be32 d32[3] __aligned(IIO_DMA_MINALIGN);
> +};

[ ... ]

> +static int ad5413_spi_reg_write(struct ad5413_state *st, unsigned int ad=
dr,
> +				unsigned int val)
> +{
> +	u8 buf[3] =3D { };
> +
> +	buf[0] =3D AD5413_WR_FLAG_MSK(addr);
> +	buf[1] =3D val >> 8;
> +	buf[2] =3D val;
> +
> +	st->d32[0] =3D cpu_to_be32((buf[0] << 24) | (buf[1] << 16) |
> +				 (buf[2] << 8) |
> +				 crc8(st->crc8_tbl, buf, sizeof(buf), 0));
> +
> +	return spi_write(st->spi, &st->d32[0], sizeof(st->d32[0]));
> +}

[ ... ]

> +static int ad5413_write_raw(struct iio_dev *indio_dev,
> +			    struct iio_chan_spec const *chan, int val, int val2,
> +			    long info)
> +{
> +	struct ad5413_state *st =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	switch (info) {
> +	case IIO_CHAN_INFO_RAW: {
> +		guard(mutex)(&st->lock);
> +		/* 14-bit DAC data is in bits [15:2] of the register. */
> +		ret =3D ad5413_spi_reg_write(st, AD5413_REG_DAC_INPUT, val << 2);
> +		return ret;
> +	}

[Severity: Medium]
Should ad5413_write_raw() validate that val is within the 14-bit range
(0 <=3D val < BIT(14)) before shifting and writing to AD5413_REG_DAC_INPUT?

When userspace writes a negative value or a value >=3D BIT(14) to the raw s=
ysfs
attribute, evaluating val << 2 on a negative signed int or a large positive
int triggers signed left-shift undefined behavior, and ad5413_spi_reg_write=
()
silently truncates the shifted value into the lower 16 bits of buf[1] and
buf[2], programming an unintended DAC output instead of returning -EINVAL.

> +	default:
> +		return -EINVAL;
> +	}
> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261017-ad5413-ups=
tream-v1-0-61f40c8fef25@analog.com?part=3D2
