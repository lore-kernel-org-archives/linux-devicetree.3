Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7AA531609
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 15:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791905524; cv=none; b=JjP5OpBRC1+8lbifkxVqpUZty4oW+Doeo7eM933g5WbFsqqdJ4Qk4g/ViVOEZa/e0PSVRZCNfbVZzqjHBw7BI1ih0pwu9bRPWnZXF36lpXGZNGvXdnusLfAI7XNXII27Fmt5Xx9MOKqZvcCYdcZ2jwKExp5MZxfCsWnGbpwOZ+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791905524; c=relaxed/simple;
	bh=bha2perpetRr6MLSfFt05uCGksEfikTJmxeEmhCJyRs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ZBDa0Bq2BhjaJ44nf+/sHWVnIfeKqimclMgQ2J24GsPZOmrPn4+pPac2sFACu3bVUR8jcowpiHaiBZ4nWIYSH6hctMgTFx90FAPRD+4RkXCTj5PljMsrQY62dQuzHXdQCt301WFZ+kB5hRkRue3oDakt3Eau3NU2zp+kl91XbjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g3k39YrU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g3k39YrU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532261F000FF;
	Tue, 13 Oct 2026 15:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791905523;
	bh=XUDNfB/qok6miFp6RZ6aTf6lGaeJulaj7UKStNxBR44=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g3k39YrUpK2zbfActu4XgMaBMiSmLYkm0yHvqSl6yqVAInjduVJY20mmyh+Oodd/x
	 XZ0rUaMH85cJZoBvkg4yUsXOLM2RaCarfG5H3vODoNVV/Y7bToWVW11aKzHuO9/Au/
	 olFAEwHecHgx/wtdOSpcc78WkrOU51BDkYZRUkgUz/RrNZObI1B0hKf0NSShYh0oZa
	 hzlnOnEI/xhgoNosZ6CATGAXfhNa3lgaP662nFY2fg0KVkaoGLdMmGFHZj6wS5Bqan
	 dZ8SiUrQURqRK02ONHej8+HI92ozGNT2XYU2FbkCAiRqlv6a5RwBiXiTvvP4GUdePw
	 7tyw3KuBSbgbw==
Message-ID: <sashiko-outbox-170015@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/13] media: imx678: Rework into generic Starvis 2
 sensor driver.
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261013-media-starvis2-v2-1-3670722d250a@raspberrypi.com>
References: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
 <20261013-media-starvis2-v2-1-3670722d250a@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 15:32:02 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] kconfig: VIDEO_IMX678 selects VIDEO_SONY_STARVIS2 without inheriti=
ng GPIOLIB dependency
- [High] build: missing removal of imx678.o from Makefile causes build fail=
ure
--

commit 1c5c35700f9fe2a06860a9b3d153305723dc7e5f
Author: Dave Stevenson <dave.stevenson@raspberrypi.com>

media: imx678: Rework into generic Starvis 2 sensor driver.

The register layout and programming model for multiple of the
Sony Starvis2 sensors is identical, so prepare for supporting
those by renaming all common parts of the driver to a starvis2_
prefix, and renaming the driver.

> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -323,14 +323,11 @@ config VIDEO_IMX576
> =20
>  config VIDEO_IMX678
>  	tristate "Sony IMX678 sensor support"
> -	depends on GPIOLIB
> -	select V4L2_CCI_I2C
> +	select VIDEO_SONY_STARVIS2

[Severity: High]
Does selecting VIDEO_SONY_STARVIS2 without inheriting its GPIOLIB dependency
cause Kconfig warnings or build failures? The VIDEO_SONY_STARVIS2 symbol ad=
ded
below explicitly depends on GPIOLIB, so enabling VIDEO_IMX678 on a platform
without GPIOLIB would forcefully enable the target driver and could lead to
unmet direct dependencies.

>  	help
>  	  This is a Video4Linux2 sensor driver for the Sony
> -	  IMX678 camera.
> -
> -	  To compile this driver as a module, choose M here: the
> -	  module will be called imx678.
> +	  IMX678 camera. This sensor is now supported by the common
> +	  Sony Starvis 2 sensor driver.

[ ... ]

> @@ -879,6 +876,17 @@ config VIDEO_S5KJN5
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called s5kjn5.
> =20
> +config VIDEO_SONY_STARVIS2
> +	tristate "Sony Starvis 2 sensor support"
> +	depends on GPIOLIB
> +	select V4L2_CCI_I2C
> +	help
> +	  This is a Video4Linux2 sensor driver for the Sony Starvis
> +	  2 image sensors.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called sony-starvis2.
> +

> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -146,6 +146,7 @@ obj-$(CONFIG_VIDEO_SAA7127) +=3D saa7127.o
>  obj-$(CONFIG_VIDEO_SAA717X) +=3D saa717x.o
>  obj-$(CONFIG_VIDEO_SAA7185) +=3D saa7185.o
>  obj-$(CONFIG_VIDEO_SONY_BTF_MPX) +=3D sony-btf-mpx.o
> +obj-$(CONFIG_VIDEO_SONY_STARVIS2) +=3D sony-starvis2.o

[Severity: High]
Does omitting the removal of the obj-$(CONFIG_VIDEO_IMX678) rule cause a
build failure? Since the source file imx678.c was renamed to sony-starvis2.c
and CONFIG_VIDEO_IMX678 remains in Kconfig for backwards compatibility, Kbu=
ild
will attempt to build the non-existent imx678.o target.

>  obj-$(CONFIG_VIDEO_ST_MIPID02) +=3D st-mipid02.o
>  obj-$(CONFIG_VIDEO_T4KA3) +=3D t4ka3.o
>  obj-$(CONFIG_VIDEO_TC358743) +=3D tc358743.o

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-media-star=
vis2-v2-0-3670722d250a@raspberrypi.com?part=3D1
