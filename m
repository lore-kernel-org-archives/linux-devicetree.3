Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB381D61BC
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 12:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784204830; cv=none; b=lhCwtf1h8z6dabd8w6S1hHMFOxqrCTm/n0lauDAVhWbI/lY3t3Tg51tdlOoEZvqSS7WWx3KE4F2CDAAqXcdg0hh+PDMHSHIjjopTvAWOC840oSqLcCRUNr1jQis1RE6CmhXa5jn69E0OR5b+Khc5sDhpi9O9IXyBltnt4jEp5rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784204830; c=relaxed/simple;
	bh=PGvxFPEAufXamjJIxOd7WSWOx3Om9+J2gX4ngxM6yQs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RTZoShAgtEqlWeFZ9HT8FMERH5J0S+lLvvb5j2T7eXyCn4Xu3AFg6K3OtFKkLqF74rN7fPIHw04UGufBMhadHJE3EWnujUozdWjXllLXFwS+QDUyvR4xDy6K9CU5pJTfXSI7NmpH9ffAnWSk4EyhCs0m/WIA6iADHHLKIhcJPlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z8oVggR8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z8oVggR8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0085A1F000E9;
	Thu, 16 Jul 2026 12:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784204829;
	bh=KQHbzWY+jaQp3Mv3jlIgie8d+NzCoyhhVLWqyPnOjOk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z8oVggR8N2DBqLRWo1fb4B20VhI3KCrimd1MBgWcjUf2v7ai3qXEQ+Pmk0t+jWf6/
	 e7IAYpI9b/rlFWYvZq/wNyLasnegsdDarK57XYSfVOSRwo9ZtodMudUmQdnqO2XGQK
	 wA1RJ0yY+9/U5Gz+mo4FHQTMI3pDQ198XnDIHsPd7LlRqvFUsedA223znWeuNLiMUg
	 McoK46kl4izznKY0czDG0w1jdBHYUlP7yYrkkOg0+H0lafTNUMaWwU3O/6FzyCmNJ2
	 e0+Q8XpkJc0yUfhGsjYyJjxTFP3MJz8d0yCL/QQt7v5bU0ItoiYSXFSsxpK4wRJXJs
	 zB6eRDMizMBBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/8] iio: dac: ad5686: missing NULL check on match
 data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar" <rodrigo.alencar@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260716-ad5686-new-features-v8-2-ebb0051af5e5@analog.com>
References: <20260716-ad5686-new-features-v8-0-ebb0051af5e5@analog.com>
 <20260716-ad5686-new-features-v8-2-ebb0051af5e5@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 12:27:08 +0000
Message-Id: <20260716122709.0085A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] I2C and SPI transfer buffers physically overlap or share the same =
cacheline, leading to potential data corruption during concurrent DMA mappi=
ng.
--

--- Patch [2]: [PATCH v8 2/8] iio: dac: ad5686: missing NULL check on match=
 data ---
commit ab85ded3e88725bf58719fd51bdcdcb05af5fa48
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: dac: ad5686: missing NULL check on match data

This commit adds a missing NULL check for the chip_info pointer in
ad5686_probe() to prevent a crash when binding via driver_override with an
unknown device name.

Fixes: 0eb1728461a1 ("iio: dac: ad5686: drop enum id")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/all/20260710113149.53EC51F000E9@smtp.kernel=
.org/

> diff --git a/drivers/iio/dac/ad5686.c b/drivers/iio/dac/ad5686.c
> index 713fe71ad1e7b..d34250647aa47 100644
> --- a/drivers/iio/dac/ad5686.c
> +++ b/drivers/iio/dac/ad5686.c
> @@ -479,6 +479,9 @@ int ad5686_probe(struct device *dev,
>  	struct iio_dev *indio_dev;
>  	int ret, i;
> =20
> +	if (!chip_info)
> +		return -ENODEV;
> +
>  	indio_dev =3D devm_iio_device_alloc(dev, sizeof(*st));
>  	if (indio_dev =3D=3D NULL)
>  		return  -ENOMEM;

[Severity: High]
This is a pre-existing issue, but I noticed a potential DMA cacheline shari=
ng
and overlap problem with the transfer buffers used in this driver.

In drivers/iio/dac/ad5686.h:struct ad5686_state, the data array is defined =
as:

	union {
		__be32 d32;
		__be16 d16;
		u8 d8[4];
	} data[3] __aligned(IIO_DMA_MINALIGN);

The __aligned attribute applies to the start of the array, but individual
elements (data[1], data[2]) still share the same cacheline.

In drivers/iio/dac/ad5686-spi.c:ad5686_spi_read(), the SPI transfer sets up
simultaneous TX and RX using these elements:

		}, {
			.tx_buf =3D &st->data[1].d8[1],
			.rx_buf =3D &st->data[2].d8[1],
			.len =3D 3,
		},

Can this lead to data corruption on non-cache-coherent architectures? If the
SPI master uses DMA, mapping memory regions that share a cacheline for both
DMA_TO_DEVICE and DMA_FROM_DEVICE might violate DMA API constraints, as cac=
he
invalidation for the RX buffer could corrupt the TX buffer data.

Similarly, in drivers/iio/dac/ad5696-i2c.c:ad5686_i2c_read(), the I2C trans=
fer
uses physically overlapping memory regions for TX and RX:

	struct i2c_msg msg[2] =3D {
		{
			.addr =3D i2c->addr,
			.flags =3D i2c->flags,
			.len =3D 3,
			.buf =3D &st->data[0].d8[1],
		},
		{
			.addr =3D i2c->addr,
			.flags =3D i2c->flags | I2C_M_RD,
			.len =3D 2,
			.buf =3D (char *)&st->data[0].d16,
		},
	};

Could this overlapping buffer setup cause similar DMA data corruption issues
when reading from the I2C bus?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-ad5686-new=
-features-v8-0-ebb0051af5e5@analog.com?part=3D2
