Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E382F290B
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 08:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784189551; cv=none; b=jzgabx75QGpoMufY9Bp1+Ci1ezlcjFNBM2CJFnyjt04lR84XC4uiJqgkUodHJ4U653BeKGSnD3zu8njOgayJbXZbTLUdiRveyenE1p1fc6WHmRF/Hj1Ex8phnWKsqBKnF4VBIt9gAm9orzuHwMUeWMD6106DRlVHi+TKQ5LctPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784189551; c=relaxed/simple;
	bh=2+44lmWK9sBg0XccBXr2cyg6rQAMrdv4RdwzYGJ5FgA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oAyWAKNqqQH/1QozXzUmBIshHYs6hEBXgTQjejiDU0UQM9sPf7AFSUfl0IXec7p9VtpOtMDW6fF8Lo0BsjPJMEsdKCDpodM/jIBTuMKcY9HR7BU8p1HNuHGiUQwjCdbkavegq1YppJgEgPPBhQVabbEtg/7xMvEMpxgCxzgPUz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JC8hd/uQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JC8hd/uQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 079AF1F000E9;
	Thu, 16 Jul 2026 08:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784189549;
	bh=/h9zdnP2OWr/4UwmfdnWI84JhDqv9X2/irba2z6cc/A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JC8hd/uQec+i0feOdeqtbCa8wb803CIIH/PeV3aPE9zd5ED3+kyBUFp2toSUQy0vD
	 nMtkSfxXNDu4nx4QHGILKSY0BtDnv2g8HPolra3UVLTJp3Q3jttsBjDLaYPqkpPoR5
	 tm0NWl9xAbQqScjiuT+tWQqPUXVuLvlN2MXDEZItphQF7CdzYNV81EOxZ4ofJDTDhO
	 0XumlKIXCzff3srLwHXTKH0I83e18rD7e0J5KaEg+6KZy4G9w/L6b77O4HAnvfJji7
	 rhZxU5oTkrbjNk0NqitV9HExb+2sX9dbEu0CqZH6BUYXf8F7CbPf0Xw/mXMJEljixQ
	 i7XW4NVyOOLvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] iio: dac: ad5710r: Add driver for AD5710R and
 AD5711R
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kim Seer Paller" <kimseer.paller@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260716-iio-ad5710r-upstream-v1-3-e848a4bb701f@analog.com>
References: <20260716-iio-ad5710r-upstream-v1-0-e848a4bb701f@analog.com>
 <20260716-iio-ad5710r-upstream-v1-3-e848a4bb701f@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 08:12:28 +0000
Message-Id: <20260716081229.079AF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Potential NULL pointer dereference of `st->chip_info`.
- [Medium] The return value of reset_control_assert() is ignored, masking p=
otential reset failures.
--

--- Patch [3]: [PATCH 3/3] iio: dac: ad5710r: Add driver for AD5710R and AD=
5711R ---
commit b76ab75f312950575e4dba88d63f7b40e599ffe4
Author: Kim Seer Paller <kimseer.paller@analog.com>

iio: dac: ad5710r: Add driver for AD5710R and AD5711R

This commit adds a new driver for the AD5710R and AD5711R DACs.
The devices are 8-channel, low-power, configurable current/voltage
output DACs.

> diff --git a/drivers/iio/dac/ad5710r.c b/drivers/iio/dac/ad5710r.c
> new file mode 100644
> index 0000000000000..05bdada0bb6eb
> --- /dev/null
> +++ b/drivers/iio/dac/ad5710r.c

[ ... ]

> +static int ad5710r_setup(struct ad5710r_state *st, int external_vref_uV,=
 u8 *num_channels)
> +{

[ ... ]

> +	if (reset) {
> +		/* Hold RESET low; tRESET pulse width is 160 ns min (Table 4) */
> +		reset_control_assert(reset);

[Severity: Medium]
Could this reset assertion fail? The return value of reset_control_assert()=
 is
ignored here, which might leave the device in an unknown state if the reset
controller (e.g., over I2C) returns an error.

> +		fsleep(1);
> +		ret =3D reset_control_deassert(reset);
> +		if (ret)
> +			return ret;
> +	} else {

[ ... ]

> +static int ad5710r_probe(struct spi_device *spi)
> +{

[ ... ]

> +	st->regmap =3D devm_regmap_init_spi(spi, &ad5710r_regmap_config);
> +	if (IS_ERR(st->regmap))
> +		return dev_err_probe(dev, PTR_ERR(st->regmap),
> +				     "Failed to init regmap\n");
> +
> +	st->chip_info =3D spi_get_device_match_data(spi);

[ ... ]

> +	ret =3D ad5710r_setup(st, external_vref_uV, &num_channels);
> +	if (ret)
> +		return ret;
> +
> +	indio_dev->name =3D st->chip_info->name;

[Severity: High]
Is it possible for st->chip_info to be NULL here? If the device is bound via
fallback mechanisms like writing to the driver_override sysfs attribute,
spi_get_device_match_data() might return NULL, leading to a NULL pointer
dereference when accessing st->chip_info->name.

> +	indio_dev->info =3D &ad5710r_info;
> +	indio_dev->modes =3D INDIO_DIRECT_MODE;
> +	indio_dev->channels =3D st->iio_channels;
> +	indio_dev->num_channels =3D num_channels;
> +
> +	return devm_iio_device_register(&spi->dev, indio_dev);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-iio-ad5710=
r-upstream-v1-0-e848a4bb701f@analog.com?part=3D3
