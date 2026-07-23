Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0929475
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 11:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784806106; cv=none; b=QImM+6yCsoPll/FqvOEcORNSX+yqyUw2s4DVxkFq7EsAbkCwrqhenze/TQ+n931LEv3z2XE8a+tQxWzX6+ZQrAOA9ZXESh4KJzqeCJ7dybYBpYo1lIXzdU7v5ETamdV7vnq4CfZx6hrpw8p/Yov3w9AmXQLG6H/FSxerfADfHnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784806106; c=relaxed/simple;
	bh=H5OGfe2g7MbSDRGSIjSBjXxNKqFC+F2iKmciKN52m40=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kKimSlhcxL/mFzLmW1nlSZ5Gf+S4ymptYKKiim8rwbo6nVR0eElHKMA5/TnYKG1ba10O+g61UQt8WgDPmpIJBEjV1pqPt5XfjkBfLnCYW31kHPBB2gGwAUuLFPkkX8+AubDet+5XfvzGsqw0/48y3PC8hASlOb1FiB7v+hRtwgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kMJPDQUY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kMJPDQUY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 453A51F000E9;
	Thu, 23 Jul 2026 11:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784806105;
	bh=n4DxSwuYTLJPkrKyGNpYMFI/XmdngyOUY7tETtgiNv8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kMJPDQUYA3yRYSW7DdnaY0Pfeuv3pY/hx38K+M8BjAxzhDDxMNE+8dqqaUraAQK0C
	 dbMpWpmukWvKNFlHJrPYb7AjfzoyL4iwRRLwAmvdzKOm30LryWXwQ0RFmOmIwHdKkV
	 g8qr+o7kuw37KSWohBrX3r72nxDXyAeIZ/xaDS6w522vh7ScDcke+bwXXQumeyTxRW
	 wFBHCMEclU2ZUmKJ0e5+Vy0GrR23OfcdzAfE6+75c0Kv29dCmVceaOUN0fKSJpfMti
	 7U4Lbyih7ptNMv8c01IOsQRmGTko+CXnd/OEzLuHavQ2uL0cRXV9D/qxBqL6uVuRNz
	 YpPi7W21RDGQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 07/17] spi: cadence-quadspi: add DQS support to read
 data capture
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: devicetree@vger.kernel.org, "Richard Weinberger" <richard@nod.at>, "Pratyush
 Yadav" <pratyush@kernel.org>, "Michael Walle" <mwalle@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260723110219.3180747-8-s-k6@ti.com>
References: <20260723110219.3180747-1-s-k6@ti.com>
 <20260723110219.3180747-8-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 11:28:23 +0000
Message-Id: <20260723112824.453A51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch unconditionally disables DQS by explicitly clearing bi=
t 8 in CQSPI_REG_READCAPTURE, breaking bisectability and systems that rely =
on the bootloader or firmware to enable DQS.
--

--- Patch [7]: [PATCH v6 07/17] spi: cadence-quadspi: add DQS support to re=
ad data capture ---
commit 67e381a8bfc8dddc89f5ce8ea17f73b3529e597b
Author: Santhosh Kumar K <s-k6@ti.com>

spi: cadence-quadspi: add DQS support to read data capture

Add DQS (Data Strobe) parameter to cqspi_readdata_capture() to control
data capture timing. DQS mode uses a dedicated strobe signal for
improved timing margins in high-speed SPI modes.

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> index f8e2663723677..046fa5d69b0f7 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c
[ ... ]
> @@ -476,6 +477,11 @@ static void cqspi_readdata_capture(struct cqspi_st *=
cqspi, const bool bypass,
>  	reg |=3D (delay & CQSPI_REG_READCAPTURE_DELAY_MASK)
>  	       << CQSPI_REG_READCAPTURE_DELAY_LSB;
> =20
> +	if (dqs)
> +		reg |=3D BIT(CQSPI_REG_READCAPTURE_DQS_LSB);
> +	else
> +		reg &=3D ~BIT(CQSPI_REG_READCAPTURE_DQS_LSB);
> +
>  	writel(reg, reg_base + CQSPI_REG_READCAPTURE);
>  }
[ ... ]
> @@ -1317,7 +1323,7 @@ static void cqspi_configure(struct cqspi_flash_pdat=
a *f_pdata,
>  		cqspi->sclk =3D sclk;
>  		cqspi_config_baudrate_div(cqspi);
>  		cqspi_delay(f_pdata);
> -		cqspi_readdata_capture(cqspi, !cqspi->rclk_en,
> +		cqspi_readdata_capture(cqspi, !cqspi->rclk_en, false,
>  				       f_pdata->read_delay);
>  	}

[Severity: Medium]
Does unconditionally passing false for the dqs parameter break platforms
that rely on the bootloader or firmware to enable the data strobe?

Previously, cqspi_readdata_capture() passively preserved the data strobe
bit state since it only masked and set the bypass and delay bits. Now that
the function explicitly clears the CQSPI_REG_READCAPTURE_DQS_LSB bit when
the dqs argument is false, this will disable the strobe on systems where it
was already configured prior to booting.

Loss of this signal reduces timing margins in high-speed modes and could
lead to read failures. Is it intended to override the bootloader configurat=
ion
here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723110219.3180=
747-1-s-k6@ti.com?part=3D7
