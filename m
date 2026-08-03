Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B069840DB5B
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 13:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785762454; cv=none; b=smjyP59+CMVJWpn6ix3jnU8SWRe9Kyhn9vKo9T5DZ79UEHukvLXoHU1BQFgkkqhOvGfZhpUVGyLsxULT2yMKnUvlgQdEH1JptJ5hR/tW1HuFK0sCTPfLVS5/Hu+nBZ3gKLmr19U9fZvYj/BrZ3aFoYJiEXAh2yx08bKi1Zgjf9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785762454; c=relaxed/simple;
	bh=ADwxUMi9UW/alGpfaQfBNPjvt99aPM0glNXq7HMxzAA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jRBY4XTx+ZUweRgEdPjAYIOEafVvWT6SxYf+fl+98Nhke0CNFb2vDB5WZwrmMhCnF5vF+UHQOw+0GdLryr3MV3+iIlT8fRkC7QUrIXmDnVsP90OCcbIfMiTC09sqSmPIJlAKFaNJEg1e52en4vNFo8+YtRWekFz/QbOp5E9GQds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OHQGVNoe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OHQGVNoe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D9D1F000E9;
	Mon,  3 Aug 2026 13:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785762450;
	bh=9h+rTMrizo9u42Y8cTvTMMogqzXJ62UsQwyrNYwKqec=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OHQGVNoefPLCQbBYE9pvnx0CkeEbIDtlGmpynsk2iMuCc4HvbuBpBOm4gIhDiP543
	 JFtaY5FpWe2KqC+jie8ckVh4wljtklEwdP4Pvk3xPqtJrI5PUDteXcRiz2PLCSzpHo
	 Pscnx3DMs4kz/87HukYt+3MSX6tpYCRF4n2ILCIW2WjLoNZVc4P6jllMwtGrFk6Ksz
	 M2mTiJImlaMgSN8U3lONcEeaHrGjtlP3vHRUhoxPuX8xVhU4TElKeU+3JZUl5uVGCY
	 IfPyZOKgBbV/n3vm/uH7ALKsQV/xT2L+CJA4XWYaLqtu9Ya0PDNYXXTRKB8zC6I03y
	 exQuiS2Jz1oyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/11] spi: dw: Add support for StarFive JHB100 SoC
 SFC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803124044.156998-12-changhuang.liang@starfivetech.com>
References: <20260803124044.156998-1-changhuang.liang@starfivetech.com>
 <20260803124044.156998-12-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 13:07:28 +0000
Message-Id: <20260803130729.D3D9D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The return value of `regmap_update_bits` is silently ignored in =
`dw_spi_jhb100_set_addr_nbyte`.
--

--- Patch [11]: [PATCH v2 11/11] spi: dw: Add support for StarFive JHB100 S=
oC SFC ---
commit 6fd643ebea16814890aa0dbec055ee773f4f746d
Author: Changhuang Liang <changhuang.liang@starfivetech.com>

spi: dw: Add support for StarFive JHB100 SoC SFC

This commit adds support for the StarFive JHB100 SoC SPI Flash Controller
(SFC). It introduces customizations to handle separate registers for
instruction and address, and utilizes a syscon to configure 3-byte/4-byte
address mode switching per chip select.

> diff --git a/drivers/spi/spi-dw-mmio.c b/drivers/spi/spi-dw-mmio.c
> index 603e81a92c57a..8cdb0351605b2 100644
> --- a/drivers/spi/spi-dw-mmio.c
> +++ b/drivers/spi/spi-dw-mmio.c
[ ... ]
> @@ -310,6 +314,58 @@ static int dw_spi_elba_init(struct platform_device *=
pdev,
>  	return 0;
>  }
> =20
> +static int dw_spi_jhb100_set_addr_nbyte(struct spi_device *spi, u8 nbyte)
> +{
> +	struct dw_spi *dws =3D spi_controller_get_devdata(spi->controller);
> +	struct dw_spi_mmio *dwsmmio =3D container_of(dws, struct dw_spi_mmio, d=
ws);
> +	struct regmap *syscon =3D dwsmmio->priv;
> +
> +	if (nbyte =3D=3D 3) {
> +		regmap_update_bits(syscon, JHB100_ADDRMODE_CS,
> +				   BIT(spi_get_chipselect(spi, 0)),
> +				   0);
> +	} else if (nbyte =3D=3D 4) {
> +		regmap_update_bits(syscon, JHB100_ADDRMODE_CS,
> +				   BIT(spi_get_chipselect(spi, 0)),
> +				   BIT(spi_get_chipselect(spi, 0)));

[Severity: Medium]
Is it intentional to silently ignore the return value of
regmap_update_bits() here?

If the regmap_update_bits() call fails, the hardware might be left in an
incorrect address mode (e.g., 3-byte instead of 4-byte). This could
silently corrupt subsequent SPI flash operations.

> +	} else {
> +		dev_err(&spi->dev, "Unsupported address nbyte %d\n", nbyte);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803124044.1569=
98-1-changhuang.liang@starfivetech.com?part=3D11
