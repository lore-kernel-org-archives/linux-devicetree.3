Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23855391E52
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 21:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788210794; cv=none; b=jdjTARCPCZ0GiyWvMJsl2A7Rqt0tVS1DHLTc94iNutbCCBWgligUswtGqgDh0858SaZQhk/mi6ft3mGG7AimbGEe9gPF+NULcMmpSEi3UOXexGPB3gyTPp0xjlmrjzo/A2zd4aAvxICUd1+25zzD2ppFmKR28OSCaU7Sncx+QxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788210794; c=relaxed/simple;
	bh=4kAdu6nrhMXrY7qC8V/p/u0A07fP7SdJzrV7qOALZoc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=axeuPuSx7cUaIarLUDnB76q1VEsLGCakrtbsTaQQnqGHnT96DVGRrqFw7PrENRGF16NBZ5tXhnvk0Qp3D9nPaGibQIKhqyznjTEVgm6nfYGy1kmDb2nYBmJfGrCzI9MA34sotR0ArBaO6NYK2yliKQP9nyzQsSLc9CmiHeBLjDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5OwpA1v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5OwpA1v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD6471F000E9;
	Mon, 31 Aug 2026 21:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788210793;
	bh=pBVMekwLrYrQb0XRB9ApNdgaqQj15uUiA9sV4PlB6is=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F5OwpA1vzKmByn7RMrXtA1fiY/6Jffj0QTrQHGKRF8HavfZ6UnErEPJffubOR3NU9
	 o8i97gf5l8UVAfLhiHcjYX6lnLwX01/NDGC+FbBDBl+6NMBW7jU+fBo1VJhAi1GX7d
	 tN7W3/zMlV67UmR5vRHi//I1AsLi8iwutWrkpSO7DpKG4JYE3+xykeZ0d6JKTMgekd
	 Ranz5DM0EJaoc6/0u6h4BVA1EmzGeLiUMLyVFA6L1Mr594SGsU0iw7gwbgQ+YGAdca
	 jkaua7vOJphs8pieT4PpqaWbMlyi3vYAG8CADw6CVOqfklcAsusLoNZ4J33Ot4CapE
	 jR+H3CXBTp9qg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] staging: iio: accel: remove adis16203, merged into
 mainline adis16201 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shehryar Ahmad" <shehryar.amd@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260831184201.34416-3-shehryar.amd@gmail.com>
References: <20260831184201.34416-1-shehryar.amd@gmail.com>
 <20260831184201.34416-3-shehryar.amd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 21:13:12 +0000
Message-Id: <20260831211312.BD6471F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] The IIO device name is incorrectly set to the combined SPI dri=
ver name ('adis16201_adis16203'), breaking userspace ABI.
- [High] Missing check for spi_get_device_match_data() returning NULL leads=
 to a crash on non-OF probes.
--

commit 4a7d80a7646bf1890c13a1b5b3c99c166b2c3898
Author: Shehryar Ahmad <shehryar.amd@gmail.com>

iio: accel: adis16201: merge adis16203 support from staging
   =20
This commit merges the ADIS16203 inclinometer driver from staging into the
mainline ADIS16201 driver. It handles chip differences using a differ_info
struct passed via of_device_id match data and keeps the channel arrays sepa=
rate.
The SPI driver name is also updated to reflect the combined driver support.

> diff --git a/drivers/iio/accel/adis16201.c b/drivers/iio/accel/adis16201.c
> index 5127e58eebc7d..293655fb00531 100644
> --- a/drivers/iio/accel/adis16201.c
> +++ b/drivers/iio/accel/adis16201.c

[ ... ]

> @@ -248,56 +301,62 @@ static const struct adis_data adis16201_data =3D {
>  	.timeouts =3D &adis16201_timeouts,
> =20
>  	.status_error_msgs =3D adis16201_status_error_msgs,
> -	.status_error_mask =3D BIT(ADIS16201_DIAG_STAT_SPI_FAIL_BIT) |
> -		BIT(ADIS16201_DIAG_STAT_FLASH_UPT_FAIL_BIT) |
> -		BIT(ADIS16201_DIAG_STAT_POWER_HIGH_BIT) |
> -		BIT(ADIS16201_DIAG_STAT_POWER_LOW_BIT),
>  };
> =20
>  static int adis16201_probe(struct spi_device *spi)
>  {
>  	struct iio_dev *indio_dev;
> -	struct adis *st;
> +	struct adis16201_state *st;
> +	struct adis_data data =3D adis16201_data;
>  	int ret;
> =20
> -	indio_dev =3D devm_iio_device_alloc(&spi->dev, sizeof(*st));
> +	indio_dev =3D devm_iio_device_alloc(&spi->dev, sizeof(struct adis16201_=
state));
>  	if (!indio_dev)
>  		return -ENOMEM;
> =20
>  	st =3D iio_priv(indio_dev);
> +	st->info =3D spi_get_device_match_data(spi);
> =20
>  	indio_dev->name =3D spi->dev.driver->name;

[Severity: Critical]
Does this code assign the combined SPI driver name "adis16201_adis16203" to
the IIO device name? The IIO name attribute is relied upon by applications
and libraries (like libiio) to identify the specific hardware part.

Since the driver name was changed from "adis16201" to "adis16201_adis16203",
the sysfs name attribute now statically exposes "adis16201_adis16203" for a=
ll
instantiated devices regardless of the actual hardware, breaking the usersp=
ace
ABI.

>  	indio_dev->info =3D &adis16201_info;
> -
> -	indio_dev->channels =3D adis16201_channels;
> -	indio_dev->num_channels =3D ARRAY_SIZE(adis16201_channels);
> +	indio_dev->channels =3D st->info->arr_chans;

[Severity: High]
Can this lead to a NULL pointer dereference during non-OF probes? If the de=
vice
is instantiated via legacy SPI board info or sysfs new_device with the driv=
er
name "adis16201_adis16203", the SPI core matches it and calls adis16201_pro=
be()
in drivers/iio/accel/adis16201.c.

Because it's not an OF/ACPI match, spi_get_device_match_data() falls back to
checking the driver's id_table. Since the id_table is missing from
adis16201_driver, spi_get_device_match_data() returns NULL, and dereferenci=
ng
it via st->info->arr_chans causes a kernel crash.

> +	indio_dev->num_channels =3D st->info->num_chans;
>  	indio_dev->modes =3D INDIO_DIRECT_MODE;
> =20
> -	ret =3D adis_init(st, indio_dev, spi, &adis16201_data);
> +	data.status_error_mask =3D st->info->diag_stat_mask;
> +	ret =3D adis_init(&st->adis, indio_dev, spi, &data);

[ ... ]

> @@ -318,10 +372,11 @@ static int adis16201_probe(struct spi_device *spi)
> =20
>  static struct spi_driver adis16201_driver =3D {
>  	.driver =3D {
> -		.name =3D "adis16201",
> +		.name =3D "adis16201_adis16203",
> +		.of_match_table =3D adis16201_of_match,
>  	},
>  	.probe =3D adis16201_probe,
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831184201.3441=
6-1-shehryar.amd@gmail.com?part=3D2
