Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957880;
	b=MR5qXVcjYobpXYLuDf0JsO+Qrc5BABRDfK6Uc6jdha1gHwaML3IlSzYa4BSn+kMoFYzy
	 Jn6rne0llSgfp79JG27j+CJM//DjeuY2m/9H1Rnk/I/3pSs3p1eDyr85gLjr8XN6e+5Y3
	 KSCx/Mn2XW6r5F9m+A7M+9DfNssWECmFQlWI+exM5YMlWhP2bPd3UAgssUynqSV8pcuDn
	 KMLJ6q2H7Qt3xruyhbPM5ijB2pMWBMu4K59qXTEmRNHc7Tb0NBzkuNs3teAykeHvcymaa
	 sFxayF/E2b9lbyjKi6av5CuyuMuKZm9h+S+hZEvWO75vjBqYCIUy5cx+TnH/iCIRwFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957880;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Xr/jJtBfPAJzlJhLsUfQz3gGAXvosQRo0cZ1Dl72SQs=;
	b=qNzN0mED5PVcF8z0dzjRiienZVDrXYaJAgvkgL2TUuLMMTTjwWahjrCGaRWOdNHQfA6W
	 22XBNmgXKnea+Z/10mOfCimWq1LLSvMH+FcXtwbdtXVJbnFeuPTftC6xEeNU5WPd5PIp+
	 BdbR0sQ7TmG3TG2JccaRacjeH4A2edaN60al308HY8CXjMBLjcJUyTuTIoK+SMUMmYiLd
	 WWIPPQIqzfJKgVWzpTNDD3ac4dYQO1m49c5RAjqT+ySiGhh0sZ73yWEaOqk6VGciBuFqa
	 aqOHMXnQlUbahX/L0ynJ/dbCR2jaL3rTUR044pnbkrp4zs+K3+G9aHCv9/14FrjxUHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="WOYoPT/I";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A06E606A331
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 09:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WOYoPT/I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B18E11F0089F;
	Fri,  6 Nov 2026 09:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793957880;
	bh=Xr/jJtBfPAJzlJhLsUfQz3gGAXvosQRo0cZ1Dl72SQs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WOYoPT/Ia8ANzGVpPMIl+NMuQVSKZeVU2tOuTFj/y3Zw6uE3t8BuBu9wsSBfuDcpd
	 H2zNHvY8JVLnwv6YCBp7OBGHM5yyXhGvwkKaHGPqlpfMY6gAg2RSr7GSs5JzlzpwCd
	 jM41ONaONwWLfL022cpelhv45zYVxXPU8+vVtR/Xn9blSCAIVHqEas0JbnkwIhirTv
	 J/gB+KLw/RP/9lsn1lgSsl4WvTDcAJ20IVAwJceDmZujxZ/Jlgn89Z1PBdf/xQlhb5
	 l/hp9tOUJaiU9p/BK7SeXJ3SjBnZX+KTZKJw5ffC/okT2ECgcv6JnwMcXTg4dZ8VOL
	 WkwvXAduVY02w==
Message-ID: <sashiko-outbox-201134@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] iio: light: ltr501: Switch to modern match
 mechanism
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106091943.35783-3-clamor95@gmail.com>
References: <20261106091943.35783-1-clamor95@gmail.com>
 <20261106091943.35783-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 09:37:59 +0000
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
- [Medium] iio: light: ltr501: unintended sysfs name change in
  ltr501_probe()
--

commit 1e03d9253f6f315d8f95ed562a39ab7edc44ec2b
Author: Svyatoslav Ryhel <clamor95@gmail.com>

iio: light: ltr501: Switch to modern match mechanism

This commit replaces the chip enum and array with per-chip info structs
retrieved via i2c_get_match_data().

> diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
> index cc5d7af44d77c..d5ce6468a229b 100644
> --- a/drivers/iio/light/ltr501.c
> +++ b/drivers/iio/light/ltr501.c

[ ... ]

> @@ -1480,18 +1471,10 @@ static int ltr501_probe(struct i2c_client *client)
>  	if (ret < 0)
>  		return ret;
> =20
> -	if (id) {
> -		name =3D id->name;
> -		chip_idx =3D id->driver_data;
> -	} else {
> -		name =3D iio_get_acpi_device_name_and_data(&client->dev, &ddata);
> -		chip_idx =3D (intptr_t)ddata;
> -	}
> -	if (!name)
> +	data->chip_info =3D i2c_get_match_data(client);
> +	if (!data->chip_info)
>  		return -ENODEV;
> =20
> -	data->chip_info =3D &ltr501_chip_info_tbl[chip_idx];
> -
>  	if ((partid >> 4) !=3D data->chip_info->partid)
>  		return -ENODEV;
> =20
> @@ -1502,7 +1485,7 @@ static int ltr501_probe(struct i2c_client *client)
>  	indio_dev->info =3D &ltr501_info;
>  	indio_dev->channels =3D data->chip_info->channels;
>  	indio_dev->num_channels =3D data->chip_info->no_channels;
> -	indio_dev->name =3D name;
> +	indio_dev->name =3D client->name;
>  	indio_dev->modes =3D INDIO_DIRECT_MODE;

[Severity: Medium]
Does assigning client->name to indio_dev->name change the exported IIO
sysfs device name on ACPI systems?

Previously, iio_get_acpi_device_name_and_data() returned
dev_name(&client->dev), which is "i2c-LTER0301:00" or "i2c-LTER0303:00".
For ACPI-enumerated I2C clients, i2c_acpi_get_info() populates
client->name from the ACPI device name without the "i2c-" prefix
("LTER0301:00" / "LTER0303:00"), altering the user-visible
/sys/bus/iio/devices/iio:deviceX/name attribute (neither preserving the
legacy ACPI name nor using the canonical chip name from chip_info).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106091943.3578=
3-1-clamor95@gmail.com?part=3D2
