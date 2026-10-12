Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D7141F37D
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 11:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791803535; cv=none; b=OKM2fvNVuXrJnDYrwkRCLk+klrxVAfYJ0WKag8vyyCKQoS5U5FpHPT7GHASqD5N/o156UwFkySWENOsnWDnV1zXJS4Qth9nio7/4SJIFVa+2ncDjt8SgluaDClffUCx/EL/1C+E4RlnmjSiTK9c8ZMqTAA/vx0XYwrZxN0W+egE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791803535; c=relaxed/simple;
	bh=9tKgi4nob0gWR6jL8cW6sSvoweRp2FvqFVGmLEAabvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhbwaFzoLTV+/PDl9fFk5A/UGNkHx0JH2VuMSRglsqAoDOENT3mchcKIGc1XXlzqwBdY3vGSf1ZLluJGJ2q1nILFgAhBmJFyDMKz73ySTTK+k/z2CAVi4AeRVbh9opZhkpvFtFOKR5PTvrn+JBo9ibl7hF8vnVQgdlKd0tqmSNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=eJLxshFX; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="eJLxshFX"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so12377995e9.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 04:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791803532; x=1792408332; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F75F9HJtYHpGQDNYPN6c7t7CsTnjwZyQElA+GAGdfiI=;
        b=eJLxshFXW66ujj/jUXKO15xOdtOFscSAK+pmJ2/+1NXsGcHUBQR29/z3ASxDTsccvO
         mY7d2/ZnwtDkYW12WxhQHq65i53s7v4TnjwFmYz+PAa7Djc0epEJV3Brj3UnW5r1v4LA
         hzZyVjyaO0aMEXQfdtTOsHAJSqRat0Om3IfRn6yIWy8doINC+cTJ38Rhh7nLVwM8HmIG
         CLfbIA92w+QDrS3TNTnaGKDZqMZOOavlf5Bx2mBEc/qgtWwQD/ORXoTq9MAu3953eXAk
         3LQRkmwvtK2Op6NJP95x1UtoJSc4arU+RKW43jrpEYaJlYgoMBi6f98AtldAVcWwrgvM
         uHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791803532; x=1792408332;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F75F9HJtYHpGQDNYPN6c7t7CsTnjwZyQElA+GAGdfiI=;
        b=0XlJgLZxTB3fmG+4M1BCzb8As9id42Xfbk8M5VTYxqYiKTh+BfNcLJ+HvmPkzpgyA8
         HV3w5x/zkH6S4CD8BBn/B/8W8rdb+odcURO9z0S4fbs+40wKKYh8lHVVbyZMkkr7bU/i
         uu+40X5ANQkAF3+8zfN5AmdlDK2RusrCUFZSMI1RAatWHk5kiOQyEVKJ7e6gAqgwP4jV
         0YsCcyKB+QHgGZlvvlCpSI4cyghYr0jG0yCcSY0wZLswPALWe+dygRc5PAOOMEzqVWnb
         qB1W9yW9BI+DLmzOMUnftFVPyS4wpIV/5P286AThlut4qQRz5ITKHG6LO8af6+R2JcPv
         vziA==
X-Forwarded-Encrypted: i=1; AKwUvBxEOPnveQdzw7p7O3qwGxOczgrb0UeA8tcSgKehpsPe4o7Uh9WrlEnhu+4PRwdHBcD3wmbSMVeTXVfN@vger.kernel.org
X-Gm-Message-State: AFq9FYIF2oHxK8BjRi6dAFxbL12yjgqYrUz/qeNMrf6wjr3n4zwowrPC
	rvUfZwh5ixrtBVxuFBvyII882rh3UYGsxXm9PkZEqdQkr4pjV59diA9RvtXmtUE8uKg=
X-Gm-Gg: AYBFou1O3V72g0IBtVKmjdaDIlY4VqZeS1Ei9EHWsHFCCX58kWoYJxwL62FUVPjoNJX
	QX3+LhEuRvGH53bfSdgtvfsc4hZ1gFETMuxRPb/bpSiFoiosssX9OKzfHf55kLT3kr6w7OYIhrL
	PdzbZArVNSAkkwqPifHVskqKIpv0vropNdxauy4YQpYU5tCwltqIRlrK3j0Lg/cPYYRgTOWdjbf
	X+vKJrvHAYWKGOOOjHyVLKNcqzzIXRBIYrNGmWevA6YMfW6pwthKJE53gv8iLJgXEu9PInX1jp0
	euaTGMWUvuyBWOJVzw+KlwvcxsssvJQr+ict/hI5S0ZrcsSealJyL5sJG09AfGMa/pR/WtcOesC
	ybUb/cC2QG8vJxfjayTptsSA/STZhiM4paBcCwJ5ZbrEMk6XsAe7w1wOKsM6rEV1nXFlk523s5C
	NyxFHNRbRZK0LzUKq+9yRwbUdyedh+QtCEIH2L7QK5A3VNtyywNrwsIa5APCVje5L/fp6Iroktf
	Tacl5wwac8tUh4kOLAvY1LrICK0vHc3LzOW9g3vAg4DQCRFLX1reuqg+k8JKfM=
X-Received: by 2002:a05:600c:3e0a:b0:4a0:1c10:1419 with SMTP id 5b1f17b1804b1-4a18e4cd667mr168009045e9.26.1791803531853;
        Mon, 12 Oct 2026 04:12:11 -0700 (PDT)
Received: from localhost (p200300f65f19a904ade4f69ba751c34c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:ade4:f69b:a751:c34c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48db94e33c7sm20513096f8f.10.2026.10.12.04.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 04:12:10 -0700 (PDT)
Date: Mon, 12 Oct 2026 13:12:09 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: radu.sabau@analog.com
Cc: Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] iio: imu: Add driver for the ADI ADIS16607
Message-ID: <aszAHLVf7MEqvht7@monoceros>
References: <20261001-adis16607-v1-0-9c89cee35d56@analog.com>
 <20261001-adis16607-v1-2-9c89cee35d56@analog.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ztwc4ffmxytpfg57"
Content-Disposition: inline
In-Reply-To: <20261001-adis16607-v1-2-9c89cee35d56@analog.com>


--ztwc4ffmxytpfg57
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] iio: imu: Add driver for the ADI ADIS16607
MIME-Version: 1.0

On Thu, Oct 01, 2026 at 12:11:50PM +0300, Radu Sabau via B4 Relay wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/spi/spi.h>

Please don't use <linux/mod_devicetable.h>. <linux/spi/spi.h> is good
enough to provide spi_device_id and of_device_id already.

> +static const struct spi_device_id adis16607_id[] =3D {
> +	{ "adis16607-2", (kernel_ulong_t)&adis16607_2_chip_info },
> +	{ "adis16607-3", (kernel_ulong_t)&adis16607_3_chip_info },
> +	{ }

Please use named initializers, i.e.

	{ .name =3D "adis16607-2", .driver_data =3D (kernel_ulong_t)&adis16607_2_c=
hip_info },

> +};
> +MODULE_DEVICE_TABLE(spi, adis16607_id);
> +
> +static const struct of_device_id adis16607_of_match[] =3D {
> +	{ .compatible =3D "adi,adis16607-2", .data =3D &adis16607_2_chip_info },
> +	{ .compatible =3D "adi,adis16607-3", .data =3D &adis16607_3_chip_info },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, adis16607_of_match);
> +
> +static struct spi_driver adis16607_driver =3D {
> +	.driver =3D {
> +		.name =3D "adis16607",
> +		.of_match_table =3D adis16607_of_match,
> +	},
> +	.probe =3D adis16607_probe,
> +	.id_table =3D adis16607_id,
> +};
> +module_spi_driver(adis16607_driver);
> +
> +MODULE_AUTHOR("Radu Sabau <radu.sabau@analog.com>");
> +MODULE_DESCRIPTION("Analog Devices ADIS16607 IMU driver");
> +MODULE_IMPORT_NS("IIO_ADISLIB");
> +MODULE_LICENSE("GPL");
>=20
> --=20
> 2.43.0
>=20
>=20

--ztwc4ffmxytpfg57
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrMwIcACgkQj4D7WH0S
/k7IjAf/aT3gFonGq9cs0V+D6m1lYBsVjBu3cKVYbQMkl+/IULwA3CPqPV1apAio
0KeyWJep0LQ92IHMvA+lIto+uTLywmqhWQSmMwaTnu3cbVr8xJa+upbV+hiJMOTm
6Q0DAv+UvHZ2D8WSGHh3LprDnR+kKGSoyJfsBnx3DSU2cW7zYf18Oq8kuCD9TBDo
U/fNRDEQeQTJSErdE+CLoGpd3cachuTxyw+slgvbjcARYreo51weR/XnnNbeORZa
tWWr3bv7LKZdpC8TS6lQrqB6AO8WTzc0fzhRSOt7BD3zs09sZPBILr2yqD52vFlF
Mo+3i15UQUp4Z8KamAPH3ZIaN+oJow==
=QDxW
-----END PGP SIGNATURE-----

--ztwc4ffmxytpfg57--
