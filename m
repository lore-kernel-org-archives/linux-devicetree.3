Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795602836;
	b=JnoPJUh9qB1fGIp1FJ3a47mzJu+fziUzHinh/fnmF4z+gWI9ebOwLs9qPQUf11oOoBiV
	 rjtB0vU4i9Wj0gpoa7mIvvCcY9JvMjrWgRH3wd9+6i6m5c6PHq24k23wcH6hHcXRf/UB/
	 B01kpyRvqi/biLDIRdEf/cG+9rOtpH1n6AGPDwouMoEvmwMJPKV3rGeHMAStTcOV+ysu/
	 7687yzQus+b1KXH67uWDpW6j03Tw9nSo2DhTzhYwK5yHiaSLen+Kd/D1hLi+nO52dOwR2
	 632xllSH3BgagEjHAH73g6EncMUUBDmnjogj08X5dqg2xXsnIsoAFbNkntYOAgTiKGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602836;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kYDz4r5v/tphdF/Ao+TCT+QxjDTtHHzMc9B6pugbZ4k=;
	b=onN/c5CMN1GqKCK2xP6+vSwg9Hpq8xhPp5aPGEXRsI7uIiG4UZ23FJZKAAfKXsOay5ap
	 wL8ZsH4NMnyhY8A42cmRbTfWQgofPqjd+u34j03V/hnEtrEYu+IeMCat28yOq5tejovwI
	 Lfe6jScck8Xnmp1+0Cpu1Elj5Q7MBhI0nk49az4x3YyMxTlqu8k01ndjJAK432aGlseLD
	 CEdIPaniiNL7vI4n5KFDGvqEMUWUd8JYAt+p85DbnIBed71t3Yk9ez2y45mJp4Mrf5rZu
	 XcKwF5QUy38Zn3TB7T9QHBc5qlL2smLtQ3NBb5m+9JAluSaCl7ILNQcWPCaznVAJYfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=moSqeZ5u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FB7606A329
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=moSqeZ5u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB8371F00A19;
	Wed, 25 Nov 2026 10:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795602836;
	bh=kYDz4r5v/tphdF/Ao+TCT+QxjDTtHHzMc9B6pugbZ4k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=moSqeZ5u6saX47ZTKBEH1vto/56JpTM0KmSvuYUrhK1YfVzcqbyfwNb0xanBC2j4W
	 7OXHY2daJHOBpTE+5vUJlWhjMSHVGQuRKhgIariDwClLNiZ0glhy0vQeV0JA+664cd
	 Cd5qYGMW1jbg10dizpozyK4/D3urpjnpUreYG7QSlUW+hS8cJEiYqWLOKJ6Rvsmz+6
	 z9q7+N5W79Yk40KK5kOjtqvp3qOifbFdB3FEwPmXY/cYn6QdrDS563KkxCf8+qzNxC
	 OQjiTMhQnXQFU/aw2QUrPsznA2Lm6UxKPyLFcQJFTQUpDs4jvsPttijJVooHm8Uq9u
	 eAm/2tGpbSunw==
Message-ID: <sashiko-outbox-233129@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/6] iio: adc: ad7793: add firmware support and drop
 platform data
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125-iio-adi-legacy-platdata-v1-6-54e4c8830b57@analog.com>
References: <20261125-iio-adi-legacy-platdata-v1-0-54e4c8830b57@analog.com>
 <20261125-iio-adi-legacy-platdata-v1-6-54e4c8830b57@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 10:33:55 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] iio: adc: ad7793: unused OF match data and NULL deref in
  ad7793_probe()
--

commit dd1daa501ec1006036cacb4fca5f16bb30f78354
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

iio: adc: ad7793: add firmware support and drop platform data

This commit replaces ad7793_platform_data with firmware property parsing,
enables the AVDD/DVDD supplies, and adds an OF match table.

> diff --git a/drivers/iio/adc/ad7793.c b/drivers/iio/adc/ad7793.c
> index b0f44c144f20e..f3e3ca724ec2c 100644
> --- a/drivers/iio/adc/ad7793.c
> +++ b/drivers/iio/adc/ad7793.c

[ ... ]

> @@ -798,15 +1025,14 @@ static int ad7793_probe(struct spi_device *spi)
> =20
>  	ad_sd_init(&st->sd, indio_dev, spi, &ad7793_sigma_delta_info);
> =20
> -	if (pdata->refsel !=3D AD7793_REFSEL_INTERNAL) {
> -		ret =3D devm_regulator_get_enable_read_voltage(dev, "refin");
> -		if (ret < 0)
> -			return ret;
> +	ret =3D devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(supplies),
> +					     supplies);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable supplies\n");
> =20
> -		vref_mv =3D ret / 1000;
> -	} else {
> -		vref_mv =3D 1170; /* Built-in ref */
> -	}
> +	ret =3D ad7793_parse_fw(dev, &cfg, &vref_mv);
> +	if (ret)
> +		return ret;
> =20
>  	st->chip_info =3D
>  		&ad7793_chip_info_tbl[spi_get_device_id(spi)->driver_data];

[ ... ]

> @@ -842,9 +1068,24 @@ static const struct spi_device_id ad7793_id[] =3D {
>  };
>  MODULE_DEVICE_TABLE(spi, ad7793_id);
> =20
> +static const struct of_device_id ad7793_of_match[] =3D {
> +	{ .compatible =3D "adi,ad7785", .data =3D &ad7793_chip_info_tbl[ID_AD77=
85] },
> +	{ .compatible =3D "adi,ad7792", .data =3D &ad7793_chip_info_tbl[ID_AD77=
92] },
> +	{ .compatible =3D "adi,ad7793", .data =3D &ad7793_chip_info_tbl[ID_AD77=
93] },
> +	{ .compatible =3D "adi,ad7794", .data =3D &ad7793_chip_info_tbl[ID_AD77=
94] },
> +	{ .compatible =3D "adi,ad7795", .data =3D &ad7793_chip_info_tbl[ID_AD77=
95] },
> +	{ .compatible =3D "adi,ad7796", .data =3D &ad7793_chip_info_tbl[ID_AD77=
96] },
> +	{ .compatible =3D "adi,ad7797", .data =3D &ad7793_chip_info_tbl[ID_AD77=
97] },
> +	{ .compatible =3D "adi,ad7798", .data =3D &ad7793_chip_info_tbl[ID_AD77=
98] },
> +	{ .compatible =3D "adi,ad7799", .data =3D &ad7793_chip_info_tbl[ID_AD77=
99] },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ad7793_of_match);

[Severity: High]
Can ad7793_probe() dereference NULL when a device matches via
ad7793_of_match?

ad7793_of_match stores struct ad7793_chip_info pointers in .data, while
ad7793_id stores enum indices in .driver_data, and ad7793_probe() still
looks up st->chip_info and indio_dev->name by unconditionally
dereferencing spi_get_device_id(spi).  If a device matches through
ad7793_of_match without a matching spi->modalias in ad7793_id (such as via
ACPI PRP0001 or a fallback compatible string), spi_get_device_id(spi)
returns NULL and crashes in ad7793_probe().

Should ad7793_id also point to ad7793_chip_info_tbl entries (with the chip
name stored in struct ad7793_chip_info) so ad7793_probe() can use
spi_get_device_match_data(spi)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-iio-adi-le=
gacy-platdata-v1-0-54e4c8830b57@analog.com?part=3D6
