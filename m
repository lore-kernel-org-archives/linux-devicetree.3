Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12CE397690
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781210386; cv=none; b=DV8drl6ibueZPQUzopsPvTu4hkzpJd/HaYvuzeElnD6sa1NsszsSauVV/1WsHQfVo7cGH2wwogkObBSEeDUbzBW0dfygdj6cjFcVn+KClIyW07ZQpA9cgg3okmTVCjCjt+7/n0/p12oyVXEe8IfYCGhyqjZ1qcqg62mr7ZFMmb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781210386; c=relaxed/simple;
	bh=AOtWvihSRVhj1k8bwuqDLntiNxdsTpJZ5Ur7161kFVQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DNYUX0i8LJHQSYpU/1ocs8nq+xOvFg541t5p9UrGhJwb3X54wkEtmxZ0PgSM/Sj+H65m0VBslmgmCiNUW+3p60xjyDYLRJUVg/b3BOWgHFZgHKK+m2gNrCd77pOgzTUC58qZzCNoNzgAVJpgXmZAUW46hRoqhxy7dA/Z3p/1aGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UAKuaaC1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UAKuaaC1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF081F000E9;
	Thu, 11 Jun 2026 20:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781210383;
	bh=W4d1LLJShrKqv3v2D8KwH++gP9aG8tMYDhYGWHD346s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UAKuaaC1FCCkkQ0LUKkWXBnmoyJ815urUriFtPBXdvxkOKUwZdHf6zv5hecUp83x8
	 3AsdzEPn29C18rJeamgAnPLiXAYahL/h2nyKt77ihuT7LbM37WG8ZlO/erArFZeHxv
	 cK7si7lfDKD8W6iItkzaQWCGcfTAh9bO1cxzV+zuEEvJ4mIktZLnvnMushWyUkQoHO
	 I8uBH7H5Q1nB0Tjx1KF9WmR12aY405OSdz9CsD1aTeY3sXQd8ruk7zzjse7hYsEXWS
	 cEhuMM6DECr5OwxAsczKiaSebAz0WGUa7u+/cDfSCj2kiER5ejgqN7Y+ptQgBmwxR8
	 040fM3WVNOF9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V12 3/9] iio: imu: inv_icm42607: Add inv_icm42607 Core
 Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260611202607.85376-4-macroalpha82@gmail.com>
References: <20260611202607.85376-4-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 20:39:42 +0000
Message-Id: <20260611203942.CAF081F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Double application of FIELD_PREP on INV_ICM42607_INTF_CONFIG0_UI_SI=
FS_CFG_SPI_DIS.
- [Low] Wake-on-Motion threshold registers are omitted from regmap read/wri=
te permission access checks.
--

commit db0995d0ef167d77bbd7b68753044eb2b93adf1c
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add inv_icm42607 Core Driver

Add the core component of a new inv_icm42607 driver. This includes
a few setup functions and the full register definition in the
header file, as well as the bits necessary to compile and probe the
device when used on an i2c bus.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> index 0000000000000..5d40f1ee53d6d
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> @@ -0,0 +1,285 @@

[ ... ]

> +static bool inv_icm42607_is_readable_reg(struct device *dev, unsigned in=
t reg)
> +{
> +	switch (reg) {
> +	case INV_ICM42607_REG_MCLK_RDY ... INV_ICM42607_REG_INT_CONFIG:
> +	case INV_ICM42607_REG_TEMP_DATA1 ... INV_ICM42607_REG_TMST_FSYNCL:
> +	case INV_ICM42607_REG_APEX_DATA4 ... INV_ICM42607_REG_INTF_CONFIG1:
> +	case INV_ICM42607_REG_INT_STATUS_DRDY ... INV_ICM42607_REG_FIFO_DATA:
> +	case INV_ICM42607_REG_WHOAMI:
> +		return true;
> +	}
> +
> +	return false;
> +}

[Severity: Low]
Are the Wake-on-Motion threshold registers (0x4b - 0x4d) missing from this
allowed list in inv_icm42607_is_readable_reg()?

Registers like INV_ICM42607_REG_ACCEL_WOM_X_THR are defined in the header,
but since they are omitted here, any future attempt to read them will be
rejected by the regmap core with an -EIO error.

> +
> +static bool inv_icm42607_is_writeable_reg(struct device *dev, unsigned i=
nt reg)
> +{
> +	switch (reg) {
> +	case INV_ICM42607_REG_DEVICE_CONFIG ... INV_ICM42607_REG_INT_CONFIG:
> +	case INV_ICM42607_REG_PWR_MGMT0 ... INV_ICM42607_REG_INT_SOURCE4:
> +	case INV_ICM42607_REG_INTF_CONFIG0 ... INV_ICM42607_REG_INTF_CONFIG1:
> +		return true;
> +	}
> +
> +	return false;
> +}

[Severity: Low]
Similarly, are the Wake-on-Motion threshold registers missing from the swit=
ch
statement in inv_icm42607_is_writeable_reg()?

[ ... ]

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_i2c.c b/drivers/ii=
o/imu/inv_icm42607/inv_icm42607_i2c.c
> index 0000000000000..a1484f32c5d94
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_i2c.c
> @@ -0,0 +1,97 @@

[ ... ]

> +static int inv_icm42607_i2c_bus_setup(struct inv_icm42607_state *st)
> +{
> +	unsigned int val;
> +	int ret;
> +
> +	ret =3D regmap_clear_bits(st->map, INV_ICM42607_REG_INTF_CONFIG1,
> +				INV_ICM42607_INTF_CONFIG1_I3C_DDR_EN |
> +				INV_ICM42607_INTF_CONFIG1_I3C_SDR_EN);
> +	if (ret)
> +		return ret;
> +
> +	val =3D FIELD_PREP(INV_ICM42607_DRIVE_CONFIG2_I2C_MASK,
> +			 INV_ICM42607_SLEW_RATE_12_36NS);
> +	ret =3D regmap_update_bits(st->map, INV_ICM42607_REG_DRIVE_CONFIG2,
> +				 INV_ICM42607_DRIVE_CONFIG2_I2C_MASK, val);
> +	if (ret)
> +		return ret;
> +
> +	val =3D FIELD_PREP(INV_ICM42607_INTF_CONFIG0_UI_SIFS_CFG_MASK,
> +			 INV_ICM42607_INTF_CONFIG0_UI_SIFS_CFG_SPI_DIS);

[Severity: Low]
Is this double-application of FIELD_PREP intentional?

The macro INV_ICM42607_INTF_CONFIG0_UI_SIFS_CFG_SPI_DIS is already defined
using FIELD_PREP in inv_icm42607.h:

#define INV_ICM42607_INTF_CONFIG0_UI_SIFS_CFG_SPI_DIS \
    FIELD_PREP(INV_ICM42607_INTF_CONFIG0_UI_SIFS_CFG_MASK, 2)

Passing it as the value argument to another FIELD_PREP in
inv_icm42607_i2c_bus_setup() is conceptually incorrect. It only evaluates
correctly here by coincidence because the bitmask GENMASK(1, 0) has a shift
of 0.

> +	return regmap_update_bits(st->map, INV_ICM42607_REG_INTF_CONFIG0,
> +				  INV_ICM42607_INTF_CONFIG0_UI_SIFS_CFG_MASK,
> +				  val);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611202607.8537=
6-1-macroalpha82@gmail.com?part=3D3
