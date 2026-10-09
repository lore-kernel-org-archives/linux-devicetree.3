Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF974E50AC
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 14:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791555849; cv=none; b=ANRU4XOQbfCTz8ngK95qx7F72in5HcWsNPbuIJ9P8vOssIcQW0E7paii0wzQXfWo8BmxyF+ctf4PrHjkn6QgK8TNbAk+eii+PA0cPAGPskmRJ4lDkhEYdhvze06OSq7uMJ06u1CQ0WIbFUtUWk7xodaDKFEpEOIrlA+Fm2yoplQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791555849; c=relaxed/simple;
	bh=ERxpC1H+cx1EPZxuWv3UDFOE9M8QI9bFXuuiBPeT/ec=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=SGXs2nooPXobMAeWI0TqLYFXewMftFPLZlClsHiuZMLmvjb4mOtPPZpfArmjMADQgGadmfuJqbrR9jMRXNrTxEzipczLCgAq8o3Y0aAbg/5o25WB64BpZsEBdWfGu0uIH5WHOzH998YdIrw0zVZqz9h2CQKntp3p2HIUzbhp+L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ezd6SEL3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ezd6SEL3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A8B21F000FF;
	Fri,  9 Oct 2026 14:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791555848;
	bh=q2h/ts5/IXc3Rk9UKoGCmzVkf+lV1AXvmTFZMSWlD2o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ezd6SEL3/xG/8HfjMdLao63rK+Z0aemI2ON5awMvLUXdIBK/uGkE7ehXZXlWPKN6B
	 rHLTOfOT+aNKaC7L5iEbJSCu6w6uwUngpEEQA6qhKI0Ydy9DxDZsTA4wapGYKFwEoC
	 5GyKPVgvRS7Cm4yhLA/fAsLdrSb2/bGHfd3fqL7bCAR8xe0SfT6Ps4x79fB2SykzEl
	 xDpKmry24ywGwdQCRLKkzpHXQAYIF9asZw7xAMp9sRQOP/Ys1a3u+Rsn0X3YM4+5PS
	 W1mnDat2f8zrNXlzfCoOG8ZYihyF1NcVYjLJYbpixgcheVZbQbJWPr4EVxDDVHQIyq
	 xVXULeUlOudfw==
Message-ID: <sashiko-outbox-165703@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/6] iio: imu: inv_icm42607: Implement MREGx register
 access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kanak Shilledar" <kanak.shilledar@axis.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261009-b4-inv_icm42370p-v6-5-e53884f185ff@axis.com>
References: <20261009-b4-inv_icm42370p-v6-0-e53884f185ff@axis.com>
 <20261009-b4-inv_icm42370p-v6-5-e53884f185ff@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 14:24:07 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] build: SPI driver fails to link when I2C is disabled due to missin=
g regmap_config
- [High] iio: resume failure due to regcache_sync() attempting bulk writes =
on MREG registers
- [Low] iio: INV_ICM42607_REG_ZG_ST_DATA is defined as max_register but is =
not readable
--

commit 402c5b10cd3776a6da15b9bcc49baac45dadfdbb
Author: Kanak Shilledar <kanak.shilledar@axis.com>

iio: imu: inv_icm42607: Implement MREGx register access

The device supports indirect register access to different banks. A
specific routine needs to be followed when accessing the registers in
another bank as documented in the datasheet (section 13). This is
required for accessing registers configured via the user and
implementing buffer support.

Link: https://www.invensense.tdk.com/en-us/products/3-axis/icm-42370-p
Link: https://www.lcsc.com/product-detail/C5129967.html

> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> @@ -18,63 +18,255 @@

[ ... ]

> +static int inv_icm42607_mreg_write(struct regmap *map, unsigned int reg,
> +				   const u8 *data, size_t count)
> +{
> +	bool idle_set;
> +	int ret, ret2;
> +	u8 blk_sel;
> +
> +	/* MREG access is one byte per transaction, no burst support. */
> +	if (count !=3D 1)
> +		return -EINVAL;

[Severity: High]
Does this strict size check cause system resume to fail?

If a user reads or writes USER0 through USER8 registers via debugfs, they a=
re
cached and can become dirty. During system resume, inv_icm42607_resume() ca=
lls
regcache_mark_dirty() followed by regcache_sync(). Because the regcache uses
REGCACHE_MAPLE and the config below omits .use_single_write =3D true,
regcache_sync() will group contiguous dirty MREG registers into a single bu=
lk
write. This bulk write is then passed to inv_icm42607_mreg_write(), which w=
ill
return -EINVAL, causing regcache_sync() and the resume process to fail.

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
> +	case INV_ICM42607_REG_OFFSET_USER0 ... INV_ICM42607_REG_OFFSET_USER8:
>  		return true;
>  	}
> =20
>  	return false;
>  }

[ ... ]

> +static const struct regmap_config inv_icm42607_virt_regmap_config =3D {
> +	.name =3D "banks",
> +	.reg_bits =3D 16,
>  	.val_bits =3D 8,
>  	.writeable_reg =3D inv_icm42607_is_writeable_reg,
>  	.readable_reg =3D inv_icm42607_is_readable_reg,
>  	.volatile_reg =3D inv_icm42607_is_volatile_reg,
> -	.max_register =3D INV_ICM42607_REG_WHOAMI,
> +	.max_register =3D INV_ICM42607_REG_ZG_ST_DATA,
>  	.cache_type =3D REGCACHE_MAPLE,
>  };

[Severity: Low]
Does this prevent INV_ICM42607_REG_ZG_ST_DATA from actually being accessed?

While INV_ICM42607_REG_ZG_ST_DATA is defined as .max_register, it is missing
from the switch statements in both inv_icm42607_is_readable_reg() and
inv_icm42607_is_writeable_reg(). Will this cause the regmap core to block a=
ny
attempts to read or write it, returning an error like -EIO?

> -EXPORT_SYMBOL_NS_GPL(inv_icm42607_regmap_config, "IIO_ICM42607");

> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_i2c.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_i2c.c
> @@ -12,6 +12,12 @@
> =20
>  #include "inv_icm42607.h"
> =20
> +const struct regmap_config inv_icm42607_regmap_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +};
> +EXPORT_SYMBOL_NS_GPL(inv_icm42607_regmap_config, "IIO_ICM42607");
> +

[Severity: High]
Does this break the build when the SPI driver is compiled without I2C suppo=
rt?

Because inv_icm42607_regmap_config was moved exclusively to the I2C-specific
file, compiling the kernel with CONFIG_INV_ICM42607_SPI=3Dy and
CONFIG_INV_ICM42607_I2C=3Dn will skip compiling inv_icm42607_i2c.c. Since t=
he SPI
driver still references this configuration via devm_regmap_init_spi(), will=
 it
cause an undefined reference linker error?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-b4-inv_icm=
42370p-v6-0-e53884f185ff@axis.com?part=3D5
