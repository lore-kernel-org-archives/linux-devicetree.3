Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861F72F0680
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787143984; cv=none; b=uVhwLvosx3GBStaIg3KRuxoKWhjGWvUt86BzAacVSshZi8KsLKVjaZt9V9xV9bwJ29T5srGlmZJrTAMWzNVsCA/dB6aKNIX7LSkYyEy5Uznw7rQg8hJNIzt9C1HeLOSuVwX2Q9CGo9pFnzDOtUkb+ecG3fGXSsnIFG4k69OfIME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787143984; c=relaxed/simple;
	bh=JLwNflqSyIu254Imq/uCBqjAgby1Pq1yDOY+rnqucII=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PJXNOOAxz4Vr1W/uw1JqFYDROwZ4DiBRoAB9J6EKQ98rP71F0X7CfkMocUIKSMsxEb2ipeZEScmXIhV+Rfi3XVEyMF1bEEDXvqEnXDRfQ5aT0rNyNpGk3Ob8i4emlk3T32/1NEqrNhU6yZYXdIyaRFHG66EHI6au2lUZ6hlaiv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L1W6WTnC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L1W6WTnC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B9211F000E9;
	Wed, 19 Aug 2026 12:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787143980;
	bh=ms8O0uerIBMC590sh/iZzH+6XA4zKu0dIvECj1uISf4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L1W6WTnC0puWzsEpDy/Y4Q4qgzJu2kkNa0L2pxMH2jhQQDb5Qvuv+/oWEK2q46+Mq
	 LBYTL9dSlEI/zZheydAfl6grOEOBD1UZH6+unXJOBcIK6Bu4AV7vhrE3OXDSewnMFN
	 UkCq/BFSSj0aUI1qM1WHoCiwc9/LSYbS6K9YpoQ9G/IiCz/vxmyLvoiBHSh+UGOwJ1
	 eINCDE5P89bHVQ5Hbzcu8XUvMaf/u5P4SsWo6ZYm42PDA9xDZvXUV8fAdQ6PrsXe2A
	 nCGEozyn//1yTAkUurbgQKserrvOW5/TD2UpenGQe47NO1OcAor2JX9MV+pj9BfKIy
	 kyzichEvQkUqQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 9/9] iio: dac: add support for Microchip MCP48FEB02
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260819-mcp47feb02_refactor-v4-9-beb2aa3bfd09@microchip.com>
References: <20260819-mcp47feb02_refactor-v4-0-beb2aa3bfd09@microchip.com>
 <20260819-mcp47feb02_refactor-v4-9-beb2aa3bfd09@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 12:53:00 +0000
Message-Id: <20260819125300.6B9211F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The EEPROM write cycle polling timeout is too short, leading to sp=
oradic -ETIMEDOUT errors and partial EEPROM updates.
--

--- Patch [9]: [PATCH v4 9/9] iio: dac: add support for Microchip MCP48FEB0=
2 ---
commit f9a8ca3d3f3e9e1b7296c59e5fdc69c68349d1ae
Author: Ariana Lazar <ariana.lazar@microchip.com>

iio: dac: add support for Microchip MCP48FEB02

This patch adds SPI support for the Microchip MCP48FxBy1/2/4/8 series of DA=
Cs.
It introduces a new SPI driver module that registers devices using the comm=
on
core probe function.

[ ... ]

> diff --git a/drivers/iio/dac/mcp47feb02-spi.c b/drivers/iio/dac/mcp47feb0=
2-spi.c
> new file mode 100644
> index 0000000000000..0c68d7c318cb2
> --- /dev/null
> +++ b/drivers/iio/dac/mcp47feb02-spi.c
> @@ -0,0 +1,145 @@
[ ... ]
> +static int mcp47feb02_spi_probe(struct spi_device *spi)
> +{
> +	const struct mcp47feb02_features *chip_features;
> +	struct device *dev =3D &spi->dev;
> +	struct regmap *regmap;
> +
> +	chip_features =3D spi_get_device_match_data(spi);
> +	if (!chip_features)
> +		return dev_err_probe(dev, -ENODEV, "No SPI device found\n");
> +
> +	if (chip_features->have_eeprom)
> +		regmap =3D devm_regmap_init_spi(spi, &mcp47feb02_regmap_config);
> +	else
> +		regmap =3D devm_regmap_init_spi(spi, &mcp47fvb02_regmap_config);
> +
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "Error initializing SPI reg=
map\n");
> +
> +	return mcp47feb02_common_probe(chip_features, regmap);
> +}

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a potential timeout
problem in the core driver that might affect these newly supported SPI devi=
ces.

In drivers/iio/dac/mcp47feb02-core.c:mcp47feb02_write_to_eeprom(), the EEPR=
OM
write cycle polling timeout is set to 5 ms:

	ret =3D regmap_read_poll_timeout(data->regmap, MCP47FEB02_GAIN_CTRL_STATUS=
_REG_ADDR,
				       eewa_val,
				       !(eewa_val & MCP47FEB02_GAIN_BIT_STATUS_EEWA_MASK),
				       USEC_PER_MSEC, USEC_PER_MSEC * 5);

Could this short timeout cause sporadic -ETIMEDOUT errors during EEPROM wri=
tes?

The EEPROM write cycle (t_WC) for the MCP47/48FEBxx series can take up to 1=
0 ms.
When a user writes to the store_eeprom sysfs attribute, this function is ca=
lled
in a loop. Could a timeout here cause the sequence to abort midway, leaving
the EEPROM in an inconsistent, partially updated state?

The same 5 ms timeout appears again in store_eeprom_store():

	ret =3D regmap_read_poll_timeout(data->regmap, MCP47FEB02_GAIN_CTRL_STATUS=
_REG_ADDR, eewa_val,
				       !(eewa_val & MCP47FEB02_GAIN_BIT_STATUS_EEWA_MASK),
				       USEC_PER_MSEC, USEC_PER_MSEC * 5);

Would it be better to increase the timeout to at least 10 ms to match the
hardware maximum?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819-mcp47feb02=
_refactor-v4-0-beb2aa3bfd09@microchip.com?part=3D9
