Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EA735676D
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 10:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481717; cv=none; b=bNqbJePAzVsX9rCL6CvVA4lrGIEJGOlZA/a9KN/pT+e0ZZn5ipPDIuW3qGHGkzLdyUpPlR9kRWVIcKnqBcJ4xirwIPj7xVmB1CNuM7sqb7y2/3r0tHPdjPOaGNzuRBgIL4Jo1HQ8FBw07Fw6dBnio+3IQPxD+3BdeyQg/biNJ/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481717; c=relaxed/simple;
	bh=DrkEHIkLo+fxn7dThyT6+OBEj8qmL7NgrWUqPteTGFk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LV3dgJMS1WIfAnDdkSTJgiUYSQA/btXClMAGrOeSK6DvavZ//gAJ4laLV5GYuvuLXAJsTDm7CentXx06aAbPx6pM1KpXVRmDRekOjhl0zkeXLuCQRIRAhlGmBBvg0TJu7XU6a2xnmZ0HdsYtXDxfK3A9FAzReOPbSOLx0y46RpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iut4LO4o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iut4LO4o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F063B1F00893;
	Wed,  3 Jun 2026 10:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780481716;
	bh=LNtNVOCul2UTLmV5RnoTKIqDZWC2wnjFZYTvQ/Rjyik=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iut4LO4ogfYER11Nq5SiSC9yIco6zt5BQEJec8NzB5LfO6fH5iKCMQqRPrITfvOYS
	 xHH865TJLbTl+h3+L4P8ooFruHJoDr8jqT8v6ejXnO6WqN76VAQTFm9JYCVjJ+2k8d
	 CAWAgLGIMjVZrtei9/l4gWzPBEomT8/HmrHkbExAkUFVFN0UjrrHLj4aoX9zTgZDOz
	 Ogx1WcUYINJeGz1lYMl2GTojgVNpNrJW16FFoycW4Czk6cBxqjOYZe+JZqFJg0tUZ4
	 F4OTWpu/z3kR9Wf5+YUlEco5ObMDyWDtoQ9WEfbceyyS+T+322+4hqQ882B8rTjf61
	 9yFPeNT1mFC0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] ASoC: cs42xx8: Add SPI bus support for
 CS42448/CS42888 codec
Reply-To: sashiko-reviews@lists.linux.dev
To: chancel.liu@oss.nxp.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260603095041.3906558-3-chancel.liu@oss.nxp.com>
References: <20260603095041.3906558-3-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 10:15:15 +0000
Message-Id: <20260603101515.F063B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Modifying the shared cs42xx8_regmap_config structure disables bu=
lk I/O operations for the existing I2C driver, causing performance degradat=
ion.

Pre-existing issues:
- [High] Modifying the globally shared static cs42xx8_dai structure during =
probe introduces shared state corruption across multiple codecs.
--

commit e668063709eddf991f98c990850087567f6a8d52
Author: Chancel Liu <chancel.liu@nxp.com>

ASoC: cs42xx8: Add SPI bus support for CS42448/CS42888 codec
   =20
The existing cs42xx8 driver only supported I2C control interface.
Add SPI bus support for the Cirrus Logic CS42448/CS42888 Audio CODEC.

[ ... ]
> diff --git a/sound/soc/codecs/cs42xx8-spi.c b/sound/soc/codecs/cs42xx8-sp=
i.c
> new file mode 100644
> index 0000000000000..b86fe2fe771ee
> --- /dev/null
> +++ b/sound/soc/codecs/cs42xx8-spi.c
> @@ -0,0 +1,104 @@
[ ... ]
> +static int cs42xx8_spi_probe(struct spi_device *spi)
> +{
> +	struct cs42xx8_driver_data *drvdata;
> +	struct regmap_config config;
> +	int ret;
> +
> +	drvdata =3D (struct cs42xx8_driver_data *)spi_get_device_match_data(spi=
);
> +	if (!drvdata)
> +		return dev_err_probe(&spi->dev, -EINVAL,
> +				     "failed to find driver data\n");
> +
> +	config =3D cs42xx8_regmap_config;
> +	/*
> +	 * reg_bits=3D16 makes regmap send a 2-byte address field (big-endian).
> +	 * write_flag_mask/read_flag_mask are OR'd into that address field:
> +	 */
> +	config.reg_bits           =3D 16;

[Severity: Medium]
Since cs42xx8_spi_probe() already makes a local copy of the config here, co=
uld
the single read/write flags be overridden locally instead of modifying the
shared cs42xx8_regmap_config structure?

> +	config.write_flag_mask    =3D 0x9E;
> +	config.read_flag_mask     =3D 0x9F;
[ ... ]
> diff --git a/sound/soc/codecs/cs42xx8.c b/sound/soc/codecs/cs42xx8.c
> index 12fe9b3e2525e..5b689549c74ed 100644
> --- a/sound/soc/codecs/cs42xx8.c
> +++ b/sound/soc/codecs/cs42xx8.c
> @@ -478,6 +478,9 @@ const struct regmap_config cs42xx8_regmap_config =3D {
>  	.volatile_reg =3D cs42xx8_volatile_register,
>  	.writeable_reg =3D cs42xx8_writeable_register,
>  	.cache_type =3D REGCACHE_MAPLE,
> +	.reg_format_endian  =3D REGMAP_ENDIAN_BIG,
> +	.use_single_read =3D true,
> +	.use_single_write =3D true,

[Severity: Medium]
Does adding these restrictions directly to the shared config disable bulk I=
/O
operations for the existing I2C driver?

It appears the I2C driver uses this struct directly, so it is now globally
restricted to single-register reads and writes. This might force
regcache_sync() to perform a full I2C transaction for every single register
during device resume.

[Severity: High]
This isn't a bug introduced by this patch, but does modifying the globally
shared static cs42xx8_dai structure during probe introduce shared state
corruption across multiple codecs?

Looking at cs42xx8_probe():

    cs42xx8_dai.name =3D cs42xx8->drvdata->name;

    /* Each adc supports stereo input */
    cs42xx8_dai.capture.channels_max =3D cs42xx8->drvdata->num_adcs * 2;

If multiple codecs of this family are present on the same system, the probe
function of the second codec will overwrite the name and capture.channels_m=
ax
fields of the global cs42xx8_dai structure.

Because all instances share this single static struct via the pointer passed
to devm_snd_soc_register_component(), the first codec's DAI state will be
corrupted.

>  };
>  EXPORT_SYMBOL_GPL(cs42xx8_regmap_config);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603095041.3906=
558-1-chancel.liu@oss.nxp.com?part=3D2
