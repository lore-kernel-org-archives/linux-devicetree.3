Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC31E41D216
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 14:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784815394; cv=none; b=rI0nWSwu6bEMZUPmk6eWi3zMJAIt8RhBvyuOlpj9CQWJz2Ry48c58WaiRdegi7bcFh1NPhgg9O8GuNi1dpyExyL/90k26dV+60vreejmTdb/Db7Te2SKjByHilO7/yfiLN6GsCUIkzF4E7mlepO4q8VHf3Wa+S/m5AtmjkFWVN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784815394; c=relaxed/simple;
	bh=zwecTFw6g2xkF5d3oUlOFy+4npSfbx3BlfQi/+MeNlI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m+eCpEPRzneAFKZUdGwm7vT+ULEdFQjo8C6d/BwTbEI2bs7TuIiGMLEbrVKNrqbIcS0DyEXFOfl8Q05EiY07GRNzFqT4cj992baYUFUUhWeY7S+KaZb/nI6Pd7WC2KqgwHgDKGTW6IuUjMu4DQ9u9M4pqgLpqLPtLuDtUYHLSuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 331261F000E9;
	Thu, 23 Jul 2026 14:03:12 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] iio: dac: add support for Microchip MCP48FEB02
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260723-mcp47feb02_refactor-v1-3-ee59e63672bc@microchip.com>
References: <20260723-mcp47feb02_refactor-v1-0-ee59e63672bc@microchip.com>
 <20260723-mcp47feb02_refactor-v1-3-ee59e63672bc@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 14:03:11 +0000
Message-Id: <20260723140312.331261F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Missing initialization of driver data causes NULL pointer dere=
ference in PM suspend/resume callbacks.
- [High] Lack of locking across the EEPROM snapshot sequence causes data co=
rruption and inconsistent state saves.
--

--- Patch [3]: [PATCH 3/3] iio: dac: add support for Microchip MCP48FEB02 -=
--
commit 438874da57433396f6f194cc2238c897dfc234a2
Author: Ariana Lazar <ariana.lazar@microchip.com>

iio: dac: add support for Microchip MCP48FEB02

This is the iio driver for Microchip MCP48FxBy1/2/4/8 series of
buffered voltage output Digital-to-Analog Converters with nonvolatile or
volatile memory and an SPI Interface.

> diff --git a/drivers/iio/dac/mcp47feb02-spi.c b/drivers/iio/dac/mcp47feb0=
2-spi.c
> new file mode 100644
> index 0000000000000..4395d49405dd8
> --- /dev/null
> +++ b/drivers/iio/dac/mcp47feb02-spi.c
[ ... ]
> +static int mcp47feb02_spi_probe(struct spi_device *spi)
> +{
[ ... ]
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "Error initializing SPI reg=
map\n");
> +
> +	return mcp47feb02_common_probe(chip_features, regmap);
> +}

[Severity: Critical]
This is a pre-existing issue, but since the new SPI driver uses
mcp47feb02_common_probe(), will this result in a NULL pointer dereference
during suspend and resume transitions?

Looking at mcp47feb02_common_probe() in the core driver, it allocates the I=
IO
device with devm_iio_device_alloc() but misses setting the driver data on t=
he
parent device. Neither the I2C nor the new SPI probe explicitly calls
spi_set_drvdata() or dev_set_drvdata().

When the system undergoes PM suspend, mcp47feb02_suspend() runs:

drivers/iio/dac/mcp47feb02-core.c:mcp47feb02_suspend() {
    struct iio_dev *indio_dev =3D dev_get_drvdata(dev);
    struct mcp47feb02_data *data =3D iio_priv(indio_dev);
    ...
    guard(mutex)(&data->lock);
    ...
}

Because the driver data is never set, dev_get_drvdata(dev) returns NULL.
Passing NULL to iio_priv() computes an invalid pointer for data, causing the
guard(mutex) call to dereference unmapped memory.

[Severity: High]
This is also a pre-existing issue in the core code, but could the lack of
locking across the EEPROM snapshot sequence cause data corruption?

In the sysfs attribute handler store_eeprom_store(), the driver loops over
channels to perform EEPROM writes:

drivers/iio/dac/mcp47feb02-core.c:store_eeprom_store() {
    ...
    for_each_set_bit(i, &data->active_channels_mask, data->phys_channels) {
        ret =3D mcp47feb02_write_to_eeprom(data, NV_REG_ADDR(i),
                                         data->chdata[i].dac_data);
    ...
}

The function mcp47feb02_write_to_eeprom() acquires and releases data->lock
internally for each write. This leaves the overall loop sequence in
store_eeprom_store() unprotected.

Can a concurrent sysfs operation, such as mcp47feb02_write_raw(), alter the
channel software state and hardware registers in the middle of this loop?
This might lead to a torn or inconsistent state being persisted to the
non-volatile memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-mcp47feb02=
_refactor-v1-0-ee59e63672bc@microchip.com?part=3D3
