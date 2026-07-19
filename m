Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F9135F609
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 10:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784455237; cv=none; b=ToHc8+76bi19DreIwvJ6aOikV07cu8vRtRPL9NMUVD5zhhbu6wL25V92tm+fmJts8ZnVAbzz/GRGvN99S4jKAWg7iesD6KcA66xM2cyry8hL8sNiwymLF9f++Y2vWg3ijIkHVQkW+fQhUDP4etmq6D8JkjnnyPuDvQmd4krjj30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784455237; c=relaxed/simple;
	bh=xeokqoCig4cHf5wpJ3b+mHp1OK0HiFks8LkRFiTzX8s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HyZwMXrXVJcutn7Ac/XMy0T6UJq5bWPiRqd8PXhn6BSHEMnmGBgfjC8InmxHWyXXg5V/Gq+C+mp4srSM/iLBmeXxa9bwyrGtmaG6Tmtd1IEtU3xJlAyfieW6ZZJhO4SzGreyhsPnMmYJ3DkbOw2hDosg5oajSvOG+WxH+NhXEL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WGFw2Vdi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WGFw2Vdi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C42F1F000E9;
	Sun, 19 Jul 2026 10:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784455236;
	bh=QLVvr35KvRfXSezVKAVb9CsxPq0Nl3SHg5N/Xl8E1F0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WGFw2Vdi9nrFIwDVGUVCuh2HRSbmCxaerpyMIUlwvKn6dZidceMyZtswv4mV0OGk5
	 lZvLGIvl0juwEwX5qwxJjHLBFiJkOwAX5hgLKPr1qxkTPe/8LgTTQhlOOphdnubE8T
	 ybCRHEjV5xEj4THMysrcDmVWqSAtW6cuaOmfIYbXIAfpYvOnMLNq9MA9mT9HiFWoJa
	 2ia4CjF2HYKgKWP31AMoPNOCP87UxuBLTcS1h+kcSSHI96pptnSv9GBPF9GHt4NaKf
	 l3I6xOn73nyWJd/6i68lMkUE2spfd2FK3oPW9XCvgsb60xgvmTGIsnkAFzcKIxyfgX
	 sG6rSbyOQP0sQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] iio: dac: ad5686: update device list and file
 header comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar" <rodrigo.alencar@analog.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260719-ad5686-extend-dev-support-v1-4-841ec75cf5d8@analog.com>
References: <20260719-ad5686-extend-dev-support-v1-0-841ec75cf5d8@analog.com>
 <20260719-ad5686-extend-dev-support-v1-4-841ec75cf5d8@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 10:00:35 +0000
Message-Id: <20260719100036.2C42F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] Kconfig help text introduces typos and omits supported devices.

Pre-existing issues:
- [High] The I2C read operation uses overlapping memory in the same cacheli=
ne for concurrent DMA_TO_DEVICE and DMA_FROM_DEVICE mappings.
--

--- Patch [4]: [PATCH 4/4] iio: dac: ad5686: update device list and file he=
ader comments ---
commit 815b7c6dbcb143b832135213c1aa2cb0c1357c58
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: dac: ad5686: update device list and file header comments

Update device list entries in Kconfig and remove device description from
file headers. One can rely on the ID table(s) to check for supported
devices. Adjust comment header accordingly and update Copyright notice in
comment file headers with the current year.

> diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
> index d6d560c09e250..ba2065241af31 100644
> --- a/drivers/iio/dac/Kconfig
> +++ b/drivers/iio/dac/Kconfig
> @@ -251,9 +251,18 @@ config AD5686_SPI
>  	depends on SPI
>  	select AD5686
>  	help
> -	  Say yes here to build support for Analog Devices AD5672R, AD5674R,
> -	  AD5676, AD5676R, AD5679R, AD5684, AD5684R, AD5684R, AD5685R, AD5686,
> -	  AD5686R Voltage Output Digital to Analog Converter.
> +	  Say yes here to build support for Analog Devices Voltage Output
> +	  Digital to Analog Converters:
> +	  - Single-channel:
> +	    AD5310R, AD5681R, AD5682R, AD5683R, AD5683R

[Severity: Low]
Is AD5683R intentionally duplicated here? It looks like AD5683 might have
been intended instead, since it is supported by the driver but missing from
this list.

[ ... ]

> @@ -263,10 +272,18 @@ config AD5696_I2C
>  	depends on I2C
>  	select AD5686
>  	help
> -	  Say yes here to build support for Analog Devices AD5311R, AD5337,
> -	  AD5338R, AD5671R, AD5673R, AD5675R, AD5677R, AD5691R, AD5692R, AD5693,
> -	  AD5693R, AD5694, AD5694R, AD5695R, AD5696, and AD5696R Digital to
> -	  Analog converters.
> +	  Say yes here to build support for Analog Devices Voltage Output
> +	  Digital to Analog Converters:
> +	  - Single-channel:
> +	    AD5311R, AD5691R, AD5692R, AD5693, AD5693R
> +	  - Dual-channel:
> +	    AD5338R, AD5697R

[Severity: Low]
Does this list omit AD5337R? It appears to be present in the driver's ID
table but is missing from this updated text.

[ ... ]

> diff --git a/drivers/iio/dac/ad5696-i2c.c b/drivers/iio/dac/ad5696-i2c.c
> index 7254bb976388c..19605274e7877 100644
> --- a/drivers/iio/dac/ad5696-i2c.c
> +++ b/drivers/iio/dac/ad5696-i2c.c
> @@ -1,10 +1,8 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * AD5338R, AD5671R, AD5673R, AD5675R, AD5677R, AD5691R, AD5692R, AD5693,
> - * AD5693R, AD5694, AD5694R, AD5695R, AD5696, AD5696R
> - * Digital to analog converters driver
> + * I2C driver for AD5696 and similar Digital to Analog Converters
>   *
> - * Copyright 2018 Analog Devices Inc.
> + * Copyright 2018-2026 Analog Devices Inc.
>   */

[Severity: High]
This is a pre-existing issue, but can the I2C read operation cause data
corruption on non-coherent architectures?

Looking at ad5686_i2c_read() in this file, the I2C message array provides
overlapping buffers within the exact same union:

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

When i2c_transfer() is backed by a DMA-enabled I2C controller, both messages
are concurrently mapped for DMA (one for DMA_TO_DEVICE, one for
DMA_FROM_DEVICE). Mapping overlapping memory in the same cacheline with
conflicting DMA directions violates coherency rules, which might lead to the
RX buffer invalidation discarding the TX buffer's data.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719-ad5686-ext=
end-dev-support-v1-0-841ec75cf5d8@analog.com?part=3D4
