Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843634A3864
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 13:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790861828; cv=none; b=O3Fk/pu/QcZW2cULyZysyxj33Q0bqefcsetcTNggT9ymStuBsFxtTYzOIvbQyldoHzfXJemq3ETjHLkYneA87fmeOohKqhaaWcyGERm2SLrmKyBjWZrxmwHAh4URCw6H5lj6bPjkjXnqhz2p0txBVht8LSpwjHNdRLUd/016/G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790861828; c=relaxed/simple;
	bh=sFRUwCLUNPcwx0LHY+Dy3FOdNQyxcOS7qb92zFE3j6I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CMk2jO3Vbam30eSabMiro4BuquFsRQe+gYN2G664RBhVcNVpncDE2s22HTsKfknPiSFChaIyTd//V5YHhWJ/GTr1hy29/dEzT00tu+fUKecswk05VS0HNemWl0vLCFkU/dEMD+y7YDv7yk7DstPk4IXr+lgWCO+V/8e6gsRZyDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CYe5av8G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CYe5av8G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C5A71F000FF;
	Thu,  1 Oct 2026 13:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790861825;
	bh=uzTM+WbKoLhpT4xpRIfqTnkxDrmqKGWzaIqFWTm2ccY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CYe5av8GvhlUHEL8mLgfhAL9CfNbvobYBdS+o8TmsZ/tOaYPylL1TFsfMmYPwuIYQ
	 8qUtzxRM3nEqogi9htxZoYZAeREwo+WqlfLFzKVC65F/8/4uu+WlcDLSryjoPAqoZ9
	 11m+bhSqQ46/IQqPiyXmQdSm8BVyPCqM5hp1thjes5X35Ds7ng1z5a0tTc/EmuomU8
	 ++uRm9Mwc/gawLWGsy2KXtGuNJgnTlNGwXdfUE9yno1OsdsC4IeGkSEvq2v/Pt3YW0
	 N50fRfwQjBdukfkB0Dc+1u9jN1uD4MIjvIMvWpjMPG1fxMNt0YwCXWqBY8+8zNRRWK
	 yMAAkQ8WIkNUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] spi: ma35d1: Add Nuvoton MA35D1 SPI controller
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chi-Wen Weng" <cwweng.linux@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261001131818.110028-3-cwweng.linux@gmail.com>
References: <20261001131818.110028-1-cwweng.linux@gmail.com>
 <20261001131818.110028-3-cwweng.linux@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 13:37:05 +0000
Message-Id: <20261001133705.7C5A71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] spi: ma35d1: probe fails on valid DT with num-cs > 2 when using =
GPIO CS
--

commit 297501e7117bfad68b786ba4098b2489480c1405
Author: Chi-Wen Weng <cwweng@nuvoton.com>

spi: ma35d1: Add Nuvoton MA35D1 SPI controller support

This commit adds a new driver for the SPI controller found in the Nuvoton
MA35D1 SoC. The driver supports SPI host mode using polling-based PIO
transfers, standard SPI modes, and natively controls up to two chip selects.

> diff --git a/drivers/spi/spi-ma35d1.c b/drivers/spi/spi-ma35d1.c
> new file mode 100644
> index 0000000000000..7560cb7e0b099
> --- /dev/null
> +++ b/drivers/spi/spi-ma35d1.c
[ ... ]
> +static int nuvoton_spi_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret =3D device_property_read_u32(dev, "num-cs", &num_cs);
> +	if (ret && ret !=3D -EINVAL)
> +		return dev_err_probe(dev, ret, "failed to read num-cs\n");
> +
> +	if (!num_cs || num_cs > NUVOTON_SPI_MAX_NATIVE_CS)
> +		return dev_err_probe(dev, -EINVAL, "invalid num-cs %u\n",
> +				     num_cs);

[Severity: Medium]
Will this check inadvertently reject valid device tree configurations that =
use
GPIO chip selects for additional devices?

The SPI core correctly supports expanding the total number of chip selects
beyond the native hardware limit when using GPIO descriptors. Since this
driver sets ctlr->use_gpio_descriptors to true, a device tree could specify=
 a
num-cs value greater than NUVOTON_SPI_MAX_NATIVE_CS (which is 2) in order to
attach a 3rd or 4th SPI target using GPIOs.

Because nuvoton_spi_probe() checks the total num-cs read from the device
tree directly against NUVOTON_SPI_MAX_NATIVE_CS and returns -EINVAL, could
this artificially limit the bus to 2 devices overall and prevent GPIO chip
select expansion?

> +
> +	ctlr->num_chipselect =3D num_cs;
> +	ctlr->max_native_cs =3D NUVOTON_SPI_MAX_NATIVE_CS;
> +	ctlr->use_gpio_descriptors =3D true;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001131818.1100=
28-1-cwweng.linux@gmail.com?part=3D2
