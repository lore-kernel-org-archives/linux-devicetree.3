Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CE5405F7
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 03:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780112639; cv=none; b=JPFbIZKyyLnG0MFWOu5LfKKqsaPzKQVgGcWanKOVk5H7XF0Z+lJLEhQ6j1aebLa1u46zf7dzZtf00chHj99/Rjg5isUp9Ptjv/7EOov54SZjsMP7OO8x4nxPBViOck0T5yyfnCMzGCryXDmgqpPyHtVPeoEcCvuL9Mq3SPnSE0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780112639; c=relaxed/simple;
	bh=+xL9AKTRgVLkK40lpm/XXuNXze75ELerjiOCcCP7Cx8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VEU6H2HiR+O6wpx5xpLpjUXjUhu5bE6eYAug5PCGekJ8/NzI9dbGGEEF+VHBRGQKlA44GregHMR2lckMXzgEE7XLmz+VAgCmCZJ5mtUJevRefh22qes/eU1KMF4z1iDvfnbTtJGO96LM2IWXr+J8Hru7PYzp/S961aOHObdOGXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=njs1xJiI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="njs1xJiI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E98E71F00893;
	Sat, 30 May 2026 03:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780112638;
	bh=Bynp/7jvDBDY+rtLk074z44t6vCfEprGbXRZjnvXmS0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=njs1xJiIqdXSSIErt6Otw4Vs4vevU+3rISoRN5z3/F0QIJTfSvmQzCFThwe/figYG
	 LeLTqDJT609wSeGtgfaf/W3HaVulqZ1kINq1TKsvon3njToUT7mCntcLjdXHNMhAim
	 5Z0cwMAjhMwWzk053cZj4eQ8t4t2B/BntBmaXvow6vD/OUAzVZuGW8TM5dIXvJ06aE
	 yCBRQlVnWhN1YIWXOw+IBOZ1LVH6QBdUwNSvQBYunJzDPnL/1+Gjw75MPh04R3eRrE
	 LlfxpbH9g/QNJKDPFigqu8VC8hYGCsF4pzF3oS0+F89HfBnICBallzAF+QwDOqA2ze
	 g9jSm/6JqzOvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V9 03/11] iio: imu: inv_icm42607: Add inv_icm42607 Core
 Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260530031739.109063-4-macroalpha82@gmail.com>
References: <20260530031739.109063-4-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 03:43:57 +0000
Message-Id: <20260530034357.E98E71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Using regmap_write() instead of regmap_update_bits() in configurat=
ion functions unintentionally clobbers reserved or unhandled register field=
s.
- [Medium] Strict requirement for 'INT1' named interrupt breaks ACPI suppor=
t and simple Device Trees.
- [Low] regcache_sync() is a no-op because regcache_mark_dirty() is not cal=
led after the hardware soft reset.
--

commit fb241e98a0e4c74d0ee1e8a5eb96fc324eaf8bee
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add inv_icm42607 Core Driver
   =20
Add the core component of a new inv_icm42607 driver. This includes
a few setup functions and the full register definition in the
header file.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> new file mode 100644
> index 0000000000000..4801ece280589
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
[ ... ]
> +static int inv_icm42607_set_conf(struct inv_icm42607_state *st,
> +				 const struct inv_icm42607_conf *conf)
> +{
[ ... ]
> +	val =3D FIELD_PREP(INV_ICM42607_GYRO_CONFIG1_FILTER_MASK, conf->gyro.fi=
lter);
> +	ret =3D regmap_write(st->map, INV_ICM42607_REG_GYRO_CONFIG1, val);
> +	if (ret)
> +		return ret;
> +
> +	val =3D FIELD_PREP(INV_ICM42607_ACCEL_CONFIG1_FILTER_MASK, conf->accel.=
filter);
> +	ret =3D regmap_write(st->map, INV_ICM42607_REG_ACCEL_CONFIG1, val);

[Severity: High]
Does this regmap_write() unintentionally clobber the averaging
configuration bits (INV_ICM42607_ACCEL_CONFIG1_AVG_MASK)?

By writing the entire 8-bit register, any bits outside of the filter mask
are cleared to zero. This clobbers the averaging configuration (bits 6:4),
discarding the hardware default. Should this use regmap_update_bits()
instead to safely modify only the filter bits?

> +	if (ret)
> +		return ret;
> +
> +	st->conf =3D *conf;
> +
> +	return 0;
> +}
[ ... ]
> +static int inv_icm42607_setup(struct inv_icm42607_state *st,
> +			      inv_icm42607_bus_setup bus_setup)
> +{
[ ... ]
> +	ret =3D regmap_read_poll_timeout(st->map, INV_ICM42607_REG_INT_STATUS,
> +				       val, val & INV_ICM42607_INT_STATUS_RESET_DONE,
> +				       INV_ICM42607_RESET_TIME_MS * 100,
> +				       INV_ICM42607_RESET_TIME_MS * 10000);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "reset error, reset done bit not set\n");
> +
> +	/* Sync the regcache again after a reset. */
> +	ret =3D regcache_sync(st->map);

[Severity: Low]
Is this regcache_sync() a no-op?

It is called immediately after a software reset, but regcache_sync()
returns immediately if the map's cache_dirty flag is false. Since
regcache_mark_dirty() was never called after the hardware reset, the
cache is still considered clean.

> +	if (ret)
> +		return ret;
> +
> +	ret =3D bus_setup(st);
[ ... ]
> +int inv_icm42607_core_probe(struct regmap *regmap,
> +			    const struct inv_icm42607_hw *hw,
> +			    inv_icm42607_bus_setup bus_setup)
> +{
> +	struct device *dev =3D regmap_get_device(regmap);
> +	struct inv_icm42607_state *st;
> +	int irq;
> +	int ret;
> +
> +	irq =3D fwnode_irq_get_byname(dev_fwnode(dev), "INT1");
> +	if (irq < 0)
> +		return dev_err_probe(dev, irq, "Unable to get INT1 interrupt\n");

[Severity: Medium]
Will this strict requirement for an "INT1" named interrupt break probing on
systems with ACPI or simple single-interrupt Device Trees?

When an interrupt is provided without an "interrupt-names" property,
fwnode_irq_get_byname() fails. Would it be more compatible to fall back to
fwnode_irq_get(dev_fwnode(dev), 0) or use the irq provided by the I2C/SPI
client core before unconditionally aborting the probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530031739.1090=
63-1-macroalpha82@gmail.com?part=3D3
