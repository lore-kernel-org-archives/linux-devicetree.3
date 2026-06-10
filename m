Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76FA348C70
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 18:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781115905; cv=none; b=XSNF+UFwEwJHTmcflk3XOrCdLdTGtdfpIIwKWaA+OgA6rpYbYhvGWu+tBzSc4FZHRtRKVqn3ojCnTroIi0zzh5EmuedarBFMhT3Of1zyy9164wZGk2SIQfgQHo4YSAtPecmvuGGAgHKj9fkJo/m4UetGQ6+24g/VWNYWcAcyXZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781115905; c=relaxed/simple;
	bh=M6v2m8FKX7LBijBCnQz6iIPkYTF2ctUIGGH026VjGXY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TyLdwlzIjmIc8iX3hzcluqIFsLNNBT0bwSpFEgS4GwUHyrNHGDj5ibqkCGuXZUbi46ihPu8l7GXZnbs1lGbgTB60rrtJ0ewXSDC2EOXxv0LkFBa1UPhqPYlOZZvRsd7vzhxXNzhs5rtomvVW/09QZmSfdKgO3iyFamPx2tr6jh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oV2yQ7TX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oV2yQ7TX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631801F00893;
	Wed, 10 Jun 2026 18:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781115904;
	bh=V/xwx4CCatY4jnNaOBYJxAgwxD3F5VUKWRWwlJ4y1wo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oV2yQ7TXVPKBv4ehpbb4C9fBNLdBshEPMQDhCJHpUpVerbn11ADIODBAkWVDACK8Q
	 PzbvChWDNnLg0WtQhVt0buODbwC9Y28SW3Y1t6ZnkSXrNUOpYXtP8Ie/NjnQ5TYgNo
	 pz9T36G1GlIPsC+sfhcn2tXDJLR7qulsbSe3MAHKA4It4fI5V2LYIh1t5EN0IjtCXL
	 jLmzA2nZsCuZ3nHYhc/GD+FbMC5DFmigXuEYruOmJWBo4txofmR3p2GZk8lNKHQ4Rr
	 rhejevMAyVP70QjI20iu/C2j9DNNBoYmJX4mrM971wcf+4VP0hXnggltgNeDbC7D+7
	 CAUf4dEM739iw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V11 4/9] iio: imu: inv_icm42607: Add I2C and SPI For
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260610175455.19006-5-macroalpha82@gmail.com>
References: <20260610175455.19006-5-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 18:25:03 +0000
Message-Id: <20260610182504.631801F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing `<linux/bitfield.h>` include for the `FIELD_PREP` macro.
--

commit 20b53f9fe7967725a7d83e31eaa40543016b6759
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add I2C and SPI For icm42607

Add I2C and SPI driver support for InvenSense ICM-42607 devices.
Add necessary Kconfig and Makefile to allow building of (incomplete)
driver.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_i2c.c b/drivers/ii=
o/imu/inv_icm42607/inv_icm42607_i2c.c
> new file mode 100644
> index 0000000000000..2946d54658535
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_i2c.c
> @@ -0,0 +1,92 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2026 InvenSense, Inc.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +
> +#include "inv_icm42607.h"
> +
> +static int inv_icm42607_i2c_bus_setup(struct inv_icm42607_state *st)
> +{
> +	unsigned int val;
> +	int ret;

[ ... ]

> +	ret =3D regmap_clear_bits(st->map, INV_ICM42607_REG_INTF_CONFIG1,
> +				INV_ICM42607_INTF_CONFIG1_I3C_DDR_EN |
> +				INV_ICM42607_INTF_CONFIG1_I3C_SDR_EN);
> +	if (ret)
> +		return ret;
> +
> +	val =3D FIELD_PREP(INV_ICM42607_DRIVE_CONFIG2_I2C_MASK,
> +			 INV_ICM42607_SLEW_RATE_12_36NS);

[Severity: Low]
Does this code require including <linux/bitfield.h>?

This driver, along with inv_icm42607_spi.c, inv_icm42607_core.c, and macro
definitions in inv_icm42607.h heavily use FIELD_PREP(), but the bitfield
header isn't included here or in the shared header. Will this result in
implicit declaration or undefined macro errors during compilation?

[ ... ]

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_spi.c b/drivers/ii=
o/imu/inv_icm42607/inv_icm42607_spi.c
> new file mode 100644
> index 0000000000000..3485777ac5b6e
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_spi.c

[ ... ]

> +	ret =3D regmap_clear_bits(st->map, INV_ICM42607_REG_INTF_CONFIG1,
> +				INV_ICM42607_INTF_CONFIG1_I3C_DDR_EN |
> +				INV_ICM42607_INTF_CONFIG1_I3C_SDR_EN);
> +	if (ret)
> +		return ret;
> +
> +	val =3D FIELD_PREP(INV_ICM42607_DRIVE_CONFIG3_SPI_MASK,
> +			 INV_ICM42607_SLEW_RATE_2NS);

[Severity: Low]
Similar to the I2C driver, should <linux/bitfield.h> be included for this
FIELD_PREP() usage?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610175455.1900=
6-1-macroalpha82@gmail.com?part=3D4
