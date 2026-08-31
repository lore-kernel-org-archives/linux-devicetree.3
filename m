Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B61037C0E6
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 21:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788210041; cv=none; b=er8JpD+WlEmohQYcMG31UDm/0UCH6tBYozNCUqWcEBYlGbpJLm5J5NC66dZouqhrUzu/IAzKxPIvHenfm4/tV32LmCtuv3c0O+5hkI5xchUoD/W1RSxLloKrfymoWsxwZWrz9agB1ZZG7w9y8NjGYlOlH4Pf2Hz4swhLwIIWyvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788210041; c=relaxed/simple;
	bh=nfmdaKzp1/40RMR4i60CXP1QBg13FqMzc5/QjyB6YUM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dubM1jL8tc7v0f9zcNg0Y/6zDYJo8dzvGRdGRwJi8kStTJnk1BmHA09WOXuw8IRoDd5nsyegivdUOj1Hmm+cIYX+CuinoU9qShmhS8rQl/kMzhky/pxLp/PBdiYPVUpPfvz48UWXv9ev5qJfnL8sJJcUhfWt+odUT1uhLfatGDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=USRqlAHX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="USRqlAHX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D191F000E9;
	Mon, 31 Aug 2026 21:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788210040;
	bh=xzEsbcl02a4zTReoT9m5xiCPIPh9lIaLgP0ntGlJ/3E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=USRqlAHX7aQVLPX/rGyAlgsNYLLBiE54tyu9umRIyUGX/77mogi8Z2+uw4gP+I26S
	 2A2r6NvvmQVKsGD03lfXpCwji075guqDshA2sfiRTX+h0AxhHykbSbDggiDrWOGu1P
	 H3/ndP8NRRfHfYAami49BwLcnys1M58hGtJxkGkZPcmu4ZdJM3X/ewGvF00rYd0c2Z
	 BymRIhXyiQL3X0AH//1ty8rI+pReob2eFgWU4gqLOTKjH0uTwzQTs36z0mR98IQJmv
	 4BHhrIGw/Vu3xxhRMLVk2ZTBqYs8Whh21bURbUZPauip9zAAhqaUPMEmrDewHDengw
	 JujgUx0g1wbig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] iio: accel: adis16201: merge adis16203 support from
 staging
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shehryar Ahmad" <shehryar.amd@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260831184201.34416-2-shehryar.amd@gmail.com>
References: <20260831184201.34416-1-shehryar.amd@gmail.com>
 <20260831184201.34416-2-shehryar.amd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 21:00:39 +0000
Message-Id: <20260831210039.B9D191F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] Stack variable address is passed to persistent state, leading =
to a Use-After-Free.
- [Critical] IIO device name is set to the combined driver name, breaking u=
serspace ABI.
- [High] Missing `spi_device_id` table causes a NULL pointer dereference in=
 the SPI core when matched via fallback.
- [High] Missing NULL check on `spi_get_device_match_data()` return value l=
eads to NULL pointer dereference.
--

commit 4a7d80a7646bf1890c13a1b5b3c99c166b2c3898
Author: Shehryar Ahmad <shehryar.amd@gmail.com>

iio: accel: adis16201: merge adis16203 support from staging
   =20
This commit merges support for the ADIS16203 inclinometer into the mainline
ADIS16201 driver. It leverages of_device_id match data to handle differences
in write masks and calibration bit widths between the two chips.

> diff --git a/drivers/iio/accel/adis16201.c b/drivers/iio/accel/adis16201.c
> index 5127e58eebc7d..293655fb00531 100644
> --- a/drivers/iio/accel/adis16201.c
> +++ b/drivers/iio/accel/adis16201.c
[ ... ]
> @@ -248,56 +301,62 @@ static const struct adis_data adis16201_data =3D {
[ ... ]
>  static int adis16201_probe(struct spi_device *spi)
>  {
>  	struct iio_dev *indio_dev;
> -	struct adis *st;
> +	struct adis16201_state *st;
> +	struct adis_data data =3D adis16201_data;

[Severity: Critical]
Is it safe to allocate this struct adis_data on the stack here?

Later in this function, the address of this stack variable is passed to
adis_init(), which stores it in adis->data:

drivers/iio/imu/adis.c:adis_init() {
    ...
    adis->data =3D data;
    ...
}

Since the stack frame is destroyed when adis16201_probe() returns, won't any
subsequent device operation (such as reading raw values or trigger handler
execution) dereference adis->data and read unallocated stack memory?

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
Will this change break backward compatibility for existing userspace
applications?

Previously, spi->dev.driver->name was "adis16201". Since the driver name
is updated later in this patch to "adis16201_adis16203", the exported sysfs
name attribute will change. Any userspace applications or udev rules matchi=
ng
on the exact sensor name might fail.

>  	indio_dev->info =3D &adis16201_info;
> -
> -	indio_dev->channels =3D adis16201_channels;
> -	indio_dev->num_channels =3D ARRAY_SIZE(adis16201_channels);
> +	indio_dev->channels =3D st->info->arr_chans;

[Severity: High]
Could st->info be NULL when it is dereferenced here?

If the driver is bound without match data, for example via manual sysfs
binding or legacy board files, spi_get_device_match_data() will return NULL.
This would result in a kernel oops when accessing st->info->arr_chans.

> +	indio_dev->num_channels =3D st->info->num_chans;
>  	indio_dev->modes =3D INDIO_DIRECT_MODE;
> =20
> -	ret =3D adis_init(st, indio_dev, spi, &adis16201_data);
> +	data.status_error_mask =3D st->info->diag_stat_mask;
> +	ret =3D adis_init(&st->adis, indio_dev, spi, &data);
>  	if (ret)
>  		return ret;
[ ... ]
> +static const struct of_device_id adis16201_of_match[] =3D {
> +	{ .compatible =3D "adi,adis16201", .data =3D &adis16201_diff },
> +	{ .compatible =3D "adi,adis16203", .data =3D &adis16203_diff },
> +	{ }
> +};
> +
>  static struct spi_driver adis16201_driver =3D {
>  	.driver =3D {
> -		.name =3D "adis16201",
> +		.name =3D "adis16201_adis16203",
> +		.of_match_table =3D adis16201_of_match,
>  	},
>  	.probe =3D adis16201_probe,
>  };

[Severity: High]
Should this struct include an id_table?

If the device is instantiated without OF/ACPI (like legacy spi_board_info or
sysfs driver_override), device_get_match_data() returns NULL. When the probe
function then calls spi_get_device_match_data(), it falls back to
spi_get_device_id().

Since the id_table is missing here, spi_get_device_id() passes a NULL point=
er
to spi_match_id(), which can cause a kernel oops when it tries to access
id->name[0]. Local users with sysfs access or board initialization code cou=
ld
trigger this crash.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831184201.3441=
6-1-shehryar.amd@gmail.com?part=3D1
