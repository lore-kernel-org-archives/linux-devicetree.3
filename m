Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7B5335555
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779708865; cv=none; b=RSUmKRMAsHUynNkbKK2Ed6BB00WkGWid8GvZnTYBc6dY3em01nYZKUhWWAt/x/VdLxvQ7buW2RKMGn0Akp+hthqHuqUKQcegyJ7R8WH5QUXsUUq7C8wN0G/hRBRnDF1/Hvn1zkGkydypK1Zy1jKdVpVJyocC9ReiJVbS0mMuF8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779708865; c=relaxed/simple;
	bh=0uV/xlFQ3ELaCy8NvwhVKsYJkihCJOjrrbXB07qf37Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CLZ/amH/M3iVeULgRK1MAWJ5468ctmFYkF6fvuUUEfehyQ0XqM7ThLb9YuDFotE/Z9LzTuJifmlaQRPiDgsC5tT7D1cF/YOxmAnNsoP7Rj2pnv6D3GPiE292qVsrXJZWFImdirDRb3iNix1iLZr6t9PVhaURIC2uugxaL4qrLRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SVadT4NP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SVadT4NP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C321F000E9;
	Mon, 25 May 2026 11:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779708864;
	bh=9wM66xIKiy9sIRGs0USzjiz818DI4nZ2JG1x8Hvty6M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SVadT4NPY58paz9kpGi1UGQe5D0YCiZU42b9Ptn3V4MtrI8RrazmEvvBhFGF3FtlU
	 ZrKNTBr9A8XeAA/JXavR0GpotTMAG48aEzO/T/hShtYBTKnJBDcCHLuc+wHRMXmhez
	 C+qJusBgo82Dwm14hrP5W7YHlJRi9zxtmyL9pF4W8qlp3WZwVaRVzblNRj0+U8CN6H
	 R868S/d5zaULjT1QPgGMreNuVSD7LVUYUImmbTZ8oetJ4/BWKlVQLHFGMKp+gdByjt
	 jxzjtOSu3+wRD5Iq4IYtP6brMNjtPVFYJD2bI7tqEmV36csDbg3X5ysjKO4J4gGNr3
	 +/ID+yv28EMBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 06/11] iio: adc: hx711: introduce hx711_chip_info
 structure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Piyush Patle" <piyushpatle228@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260525105127.180156-7-piyushpatle228@gmail.com>
References: <20260525105127.180156-7-piyushpatle228@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 11:34:23 +0000
Message-Id: <20260525113424.48C321F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Probing fails unconditionally with `-ENODEV` for devices bound b=
y platform name instead of Device Tree or ACPI.
- [Low] Use of undeclared macro `__counted_by_ptr` causes an immediate comp=
ilation error.
--

commit 2560eb8cf3b905048ac157fc1d9dd7c2068b2f2d
Author: Piyush Patle <piyushpatle228@gmail.com>

iio: adc: hx711: introduce hx711_chip_info structure

This patch introduces a per-variant static configuration structure for the=
=20
hx711 driver. It populates IIO device fields from this structure at probe t=
ime
to prepare for supporting additional hardware variants.

> diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
> index 823fd74f9cf95..062d6860da7d6 100644
> --- a/drivers/iio/adc/hx711.c
> +++ b/drivers/iio/adc/hx711.c
[ ... ]
> @@ -74,6 +76,20 @@ static int hx711_get_scale_to_gain(const int *gain_sca=
le, int scale)
>  	return -EINVAL;
>  }
> =20
> +/**
> + * struct hx711_chip_info - per-variant static configuration
> + * @name: IIO device name
> + * @channels: channel specification array
> + * @num_channels: number of entries in @channels
> + * @iio_info: IIO info ops for this variant
> + */
> +struct hx711_chip_info {
> +	const char			*name;
> +	const struct iio_chan_spec	*channels __counted_by_ptr(num_channels);

[Severity: Low]
Does __counted_by_ptr exist in the kernel headers?

The kernel supports __counted_by for flexible array members, but it looks
like __counted_by_ptr is undefined. Using an undeclared macro here might
cause an immediate compilation error.

> +	unsigned int			num_channels;
> +	const struct iio_info		*iio_info;
> +};
> +
[ ... ]
> @@ -473,6 +498,12 @@ static int hx711_probe(struct platform_device *pdev)
> =20
>  	mutex_init(&hx711_data->lock);
> =20
> +	chip_info =3D device_get_match_data(dev);
> +	if (!chip_info)
> +		return dev_err_probe(dev, -ENODEV, "missing driver data\n");

[Severity: Medium]
Will this unconditionally fail for devices bound by platform name instead
of Device Tree or ACPI?

For traditional platform devices instantiated manually,
device_get_match_data() returns NULL because the device lacks a firmware
node and the driver lacks an id_table. platform_match() will fall back to
name matching, but this new probe check will now reject the bind with
-ENODEV.

Would it be better to fall back to the default hx711_chip configuration
or provide an id_table to prevent breaking backward compatibility for
non-DT/ACPI users?

> +
> +	hx711_data->chip_info =3D chip_info;
> +
>  	/*
>  	 * PD_SCK stands for power down and serial clock input of HX711
>  	 * in the driver it is an output

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525105127.1801=
56-1-piyushpatle228@gmail.com?part=3D6
