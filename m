Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCDD5632B6
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 14:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965497; cv=none; b=jgmgH5B5fuya0EDaU6BaPC8iBopoqmijwYh4inlB2iRudoe5VUkpVn7v3b9t9tELzdTcv5gYgfx4/LMCdRgw15wZidpYsGi9FWQl0et/SCqVepJrurUxEIkMFtAhrLmHI/KZt/IDpi+VNoBauB4qjEwO6cDW36i3LNpTkVs1hKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965497; c=relaxed/simple;
	bh=AU/o0LKoiIl0QHUdrlNYHb2bVgduaPaNihg88H+/3nc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pypGrTPzUXjwvzzLuWmvzTqsOfVbLZB+rzYF4BO2O/e9VLT3U2qcp17kMF2646vRRwiVgjuaIAqLuqErUGqI73mHEqH4v3GDnSqw3Qf/NNJ5M+CuKRYhU9XB0HqnK7wHb3sgoChTjP5r7XJHokSqcMN3HTR3W8tVWXZHv9Nl2oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gNCiv0PL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gNCiv0PL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 901601F00A3D;
	Wed,  9 Sep 2026 14:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788965495;
	bh=ow1rINbQnuIVIck4S71fiD6wY/uXRq5vqsY7HPiPCvE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gNCiv0PLdvzD8X8R75kBPUSpK3AmsOPyoNLHRptalii8TMSC7ubzwnL0ki+WXFy6/
	 fRco8RixizPaaAPm4rEe0bQeqTbsrYtv4LbMd/RiwC++QOqcKdA2CfYtsPl+ibk0lA
	 yWpR2TLgkDXWGCXoJqrWrAzYLf+o1y7+0UABBHHXor8TQxSLu9vxwFLSK5hgxgWlEy
	 hsCx+UTDYciC/o/h0pwC67W0wAl4VTbMSx9NqpN/Jp5jL6BqA/8wcjFKYeT3OSiMnN
	 bxXLEXL2XIK/WkoSt4glh5OYK936TQr21Jz7mP6B0kbaRMO8Ihu1BgsC3HLSUPptLV
	 Kv0PYBqNowovQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 10/10] iio: dac: add support for Microchip MCP48FEB02
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260909-mcp47feb02_refactor-v5-10-8b67bcab93d1@microchip.com>
References: <20260909-mcp47feb02_refactor-v5-0-8b67bcab93d1@microchip.com>
 <20260909-mcp47feb02_refactor-v5-10-8b67bcab93d1@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 14:51:35 +0000
Message-Id: <20260909145135.901601F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing POR (Power-On Reset) delay after enabling the VDD regulato=
r in probe.
--

commit 3cf6710da958614daaff4a4a7e99d396c3398a95
Author: Ariana Lazar <ariana.lazar@microchip.com>

iio: dac: add support for Microchip MCP48FEB02

This commit introduces SPI support for the Microchip MCP48FEB02 series DACs.
It adds a new SPI driver file and the corresponding Kconfig and Makefile
changes.

> diff --git a/drivers/iio/dac/mcp47feb02-spi.c b/drivers/iio/dac/mcp47feb0=
2-spi.c
> new file mode 100644
> index 0000000000000..0c68d7c318cb2
> --- /dev/null
> +++ b/drivers/iio/dac/mcp47feb02-spi.c

[ ... ]

> +static int mcp47feb02_spi_probe(struct spi_device *spi)
> +{
> +	const struct mcp47feb02_features *chip_features;
> +	struct device *dev =3D &spi->dev;
> +	struct regmap *regmap;

[ ... ]

> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "Error initializing SPI reg=
map\n");
> +
> +	return mcp47feb02_common_probe(chip_features, regmap);
> +}

[Severity: High]
This is a pre-existing issue, but does mcp47feb02_common_probe() miss a
Power-On Reset (POR) delay after enabling the VDD regulator?

Looking at the shared probe function in drivers/iio/dac/mcp47feb02-core.c:

    ret =3D devm_regulator_get_enable_read_voltage(dev, "vdd");
    if (ret < 0)
        return ret;

    /* ... vref initialization ... */

    ret =3D mcp47feb02_init_ctrl_regs(data);

When devm_regulator_get_enable_read_voltage() cold-starts the VDD supply
for the first time, the device requires a typical 2ms (max 4ms) POR delay
before its internal state machine is ready to accept commands.=20

Since the driver immediately proceeds to mcp47feb02_init_ctrl_regs() and
performs a regmap operation without any wait (e.g., usleep_range()), could
this cause the device to fail to probe or read garbage data on setups where
the driver is responsible for turning on the VDD regulator?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-mcp47feb02=
_refactor-v5-0-8b67bcab93d1@microchip.com?part=3D10
