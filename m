Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B503D9DA9
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 08:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785487219; cv=none; b=cmq7AVM/zZoywmxlOv/DjqI4Qdi5hbe087a0aMH88qqkT+ebxpDkpIzGW3kEWg4nG0R1U+tE8Wr9M+aBwcDbYWH/MA3NqVSZfECxdmBacGbWSHPKX9xcyxAucZ9JHsjckWWqwxm3w1Cv1Wjwir6zkwoZwGJVm2LGTL3kKrmn2pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785487219; c=relaxed/simple;
	bh=BdOQz0w0HdBLYj0vNH6yh80LWTqDHjQgn37v2KX1NUg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qcJy0InoAWdvIRTp8gkXt8Wd1xwQd2kGxCKLgMXBglRooyGKQFqqUBzMDLzQdd3MU6QzTGnecAMnYHTWifzgCEIpWyxttwYgL/4fLYLzS3QWRz8oV9wD2k2i7LIcpgWTbMOJVeJezJAwQeQuqG2ePr307zy0JUdRsW8qPM+gEU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VeWYkEg5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VeWYkEg5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94EA01F000E9;
	Fri, 31 Jul 2026 08:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785487211;
	bh=HvR39Knim82FGJDGuxK1gzFQxYzq+Ppof+kxpNd7je0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VeWYkEg5BkZaeEnZ4ZV3k4vbkiDxpjNSFKGKCMR32esoGtIiK0hs0VdAl85aX0iW1
	 /v3vKRIQCfjzvOgjW2HJ8Rzq7mBrjYXR7e0+veMpaO7cb7QU3FIDgQemThh3v8sDys
	 xpqlz2YcmahT2QswYw/Otxs05GKPBeb51LfYe4MKiXNt3x8dVNRjX2C8GaPCL+bK2W
	 B+e9fzsUPpMLMPetDjd1iJY2lkRXm2TzLp4QXb6jsyj0m2ajUv9lMeBJlLuLXXfKVc
	 MWuDcy2WRdn4nfvhKOvM0I0TUkpLdUWi/FAIit/eAnB9y7I8STRKWcXrT2FlY1oJ9L
	 U4fbaiCGA7uEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] iio: adc: ade9000: introduce chip_info structure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Antoniu Miclaus" <antoniu.miclaus@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260731082951.1228-2-antoniu.miclaus@analog.com>
References: <20260731082951.1228-1-antoniu.miclaus@analog.com>
 <20260731082951.1228-2-antoniu.miclaus@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 08:40:11 +0000
Message-Id: <20260731084011.94EA01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardware interrupts are requested before the device is powered up =
and reset.
--

--- Patch [1]: [PATCH v2 1/4] iio: adc: ade9000: introduce chip_info struct=
ure ---
commit 00acfaee941c3f163617be410fa26e35179f3ffc
Author: Antoniu Miclaus <antoniu.miclaus@analog.com>

iio: adc: ade9000: introduce chip_info structure

The driver currently hardcodes the device name and the full-scale ADC codes
used to derive the IIO scale attributes. In preparation for supporting
additional parts of the ADE9000 family, move these part-specific values
into a new struct ade9000_chip_info and retrieve it via
spi_get_device_match_data() at probe time.

> diff --git a/drivers/iio/adc/ade9000.c b/drivers/iio/adc/ade9000.c
> index c6c3ea953feae..030bb9109ab6a 100644
> --- a/drivers/iio/adc/ade9000.c
> +++ b/drivers/iio/adc/ade9000.c
[ ... ]
> @@ -1726,7 +1757,7 @@ static int ade9000_probe(struct spi_device *spi)
>  	if (ret)
>  		return ret;
> =20
> -	indio_dev->name =3D "ade9000";
> +	indio_dev->name =3D st->info->name;
>  	indio_dev->info =3D &ade9000_info;
>  	indio_dev->modes =3D INDIO_DIRECT_MODE;
>  	indio_dev->setup_ops =3D &ade9000_buffer_ops;
> @@ -1736,8 +1767,8 @@ static int ade9000_probe(struct spi_device *spi)

[Severity: High]
This is a pre-existing issue, but could we look at the interrupt
initialization ordering here?

Hardware interrupts are requested via devm_request_threaded_irq() without
IRQF_NO_AUTOEN earlier in ade9000_probe(), before this vdd regulator is
enabled.

If an interrupt line is active (for example, pulled low by the unpowered
chip or floating) at boot time, wouldn't the unmasked handler like
ade9000_irq1_thread() run immediately?

If that happens, the handler might attempt SPI register accesses while the
chip is still unpowered. Could this lead to SPI bus errors, controller
timeouts, or reading garbage data?

If that garbage data happens to have the ADE9000_ST1_RSTDONE_BIT set, could
it prematurely complete the reset process and lead to driver initialization
failure?

>  		return dev_err_probe(&spi->dev, ret,
>  				     "Failed to get and enable vdd regulator\n");
> =20
> -	indio_dev->channels =3D ade9000_channels;
> -	indio_dev->num_channels =3D ARRAY_SIZE(ade9000_channels);
> +	indio_dev->channels =3D st->info->channels;
> +	indio_dev->num_channels =3D st->info->num_channels;
> =20
>  	ret =3D devm_iio_kfifo_buffer_setup(dev, indio_dev,
>  					  &ade9000_buffer_ops);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731082951.1228=
-1-antoniu.miclaus@analog.com?part=3D1
