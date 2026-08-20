Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30F63C7DE8
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 07:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787210638; cv=none; b=BhFK2OFSrY8urlwWKft8mkfvPYOAFO3VusplUQGS9PfgTuAY8I2u0hn5c4SC21ge1/tA5NmCCCjj3qelgK10p85jN2DaBeO1FwW0XHFnCo+ZvohfXpfkU2KSDm/9NEWdTN/m4cWWnsjZUzv8tbBQfNsAi7foGjVtcmFpLyEpCIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787210638; c=relaxed/simple;
	bh=oDkd2uiiuAVJt2go73ZD5CdO/haQ0yzzTlllfIKkkDE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ckw29V7PFl7lubSvFkrzTRq5h2Via9aL1h0ZZKvZuHsa7OGnQALRyxTokJBqKp8c9Y3ljL/94S3Lfe9QRtzC5AWncXJnw73QENuy/OSx/xup0vKYoQIKEscH2AloJahfvQAPWEN9VokY46JBzv2StefKYTuQ2rvCUMqP8Vrf1II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hA6u+fl+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hA6u+fl+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC1041F00ACA;
	Thu, 20 Aug 2026 07:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787210629;
	bh=H2blQ9+7Qrkb9cTaW7HFySXDxeFmme7DYyu+lSKfBac=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hA6u+fl+h81ISnY0FeKvUA7j9LAkhd7+Q48fg0epncjYh+b1gsWDjGHV9wCvTpQ2u
	 flsp0EjzIeLGiNzS0CoPkJeWNAtUT7zCswLdTQGpMXcMgPaFR9wPoEMEkhZ3yk+HsU
	 CJwULBrrSlikrmZsxJLHaBnlB5/JKikyWTw9rLorgYif43mXWXd+007MOhDEwK+HyI
	 ASwhU7UaGIWU9ssiz82/W19d2mZ1NGTkKJJaALz1TKP76KVVpZWHS0yBPbkdz3YlzO
	 XDCnlTUEo7UUcXQHFYYQuIlGArmYslFCXPf1P8vPqv3iNI53TQ2UROLUWfbJCwmd2q
	 I7iLxGD2EKfPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 3/3] iio: dac: Add AD5529R DAC driver support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260820-ad5529r-driver-v9-3-ba62e0b2a816@analog.com>
References: <20260820-ad5529r-driver-v9-0-ba62e0b2a816@analog.com>
 <20260820-ad5529r-driver-v9-3-ba62e0b2a816@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 07:23:48 +0000
Message-Id: <20260820072348.BC1041F00ACA@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The AD5529R Kconfig symbol selects `REGMAP_SPI` but incorrectly de=
pends on `SPI_MASTER` (a boolean) instead of `SPI` (a tristate), which can =
cause unmet direct dependency warnings and linker errors.
- [Medium] The driver enables the `vref` regulator but does not query its v=
oltage, using hardcoded scaling values that assume a 4.096V reference.
--

--- Patch [3]: [PATCH v9 3/3] iio: dac: Add AD5529R DAC driver support ---
commit 93be93e4756accead91864ac70303ad8ccc9e4da
Author: Janani Sunil <janani.sunil@analog.com>

iio: dac: Add AD5529R DAC driver support

Add support for AD5529R 16-channel, 12/16 bit Digital to Analog Converter
from Analog Devices.

> diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
> index 657c68e75542e..6a7109f42f2a3 100644
> --- a/drivers/iio/dac/Kconfig
> +++ b/drivers/iio/dac/Kconfig
> @@ -134,6 +134,22 @@ config AD5449
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called ad5449.
> =20
> +config AD5529R
> +	tristate "Analog Devices AD5529R High Voltage DAC driver"
> +	depends on SPI_MASTER
> +	select REGMAP_SPI

[Severity: High]
Should this depend on SPI rather than SPI_MASTER?

If SPI is built as a module (=3Dm), SPI_MASTER evaluates to y. This allows
AD5529R to be configured as built-in (=3Dy), which forces REGMAP_SPI to y
through the select statement.

Since REGMAP_SPI depends on SPI, this can produce a Kconfig unmet direct
dependency warning and cause linker errors for SPI core functions during
randconfig testing.

[ ... ]

> diff --git a/drivers/iio/dac/ad5529r.c b/drivers/iio/dac/ad5529r.c
> new file mode 100644
> index 0000000000000..6982840232681
> --- /dev/null
> +++ b/drivers/iio/dac/ad5529r.c

[ ... ]

> +static int ad5529r_read_raw(struct iio_dev *indio_dev,
> +			    struct iio_chan_spec const *chan,
> +			    int *val, int *val2, long mask)
> +{

[ ... ]

> +	case IIO_CHAN_INFO_SCALE:
> +		range_idx =3D st->output_range_idx[chan->channel];
> +
> +		/*
> +		 * The datasheet specifies a 4.096 V external reference,
> +		 * matching the nominal output voltage of the internal
> +		 * reference.
> +		 */
> +		span_mv =3D ad5529r_output_ranges_mV[range_idx][1] -
> +			  ad5529r_output_ranges_mV[range_idx][0];
> +		*val =3D span_mv;

[ ... ]

> +static int ad5529r_probe(struct spi_device *spi)
> +{

[ ... ]

> +	ret =3D devm_regulator_get_enable_optional(dev, "vref");

[Severity: Medium]
Is it possible to query the actual regulator voltage here rather than using
devm_regulator_get_enable_optional()?

Since this helper doesn't return the regulator pointer, the driver cannot r=
ead
the actually supplied voltage. Looking at ad5529r_read_raw() above, the IIO
scale is calculated using hardcoded millivolt arrays that assume the extern=
al
reference is exactly 4.096V.

If a board provides a different reference voltage, will the IIO scaling
metadata exposed to userspace be incorrect?

> +	if (ret =3D=3D -ENODEV)
> +		external_vref =3D false;
> +	else if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to get and enable vref regulator\n");
> +	else
> +		external_vref =3D true;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-ad5529r-dr=
iver-v9-0-ba62e0b2a816@analog.com?part=3D3
