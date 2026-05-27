Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6E147DFAA
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 18:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779905830; cv=none; b=D3L8WYZhGX8IJlk5NkocsLSiQsb0zu5quvT6ZdgZQN/87wwCjoI/kTfJ1OOaRr71aL8IqLxkiDRy/07M5pVoGJrlfDMyN55bmBd9B/8oFLWhmv/z72Wh/nLX+efLgwjPEydZXXYKxiMzrdYtJOMqTKdmGhiWuI7SQOwMpmv3TnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779905830; c=relaxed/simple;
	bh=3XqTHUN12lMP4GNKQm5fyb5aE70+5gy4KrliWFVf48E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s2cnVcsD0AeEb+Qyo3L8vthuuTs4rFCFt3nCc8wLQ7DsGtRUM38dLC6Q2T7UWnF4lSYBDl/ivaSM00A/x3o792N5E6lEua4RIzT21H/YkcPgt1ZC84lTXl6spKxqcco02eDLEM41FfcB+Mq6xk5j9c5uIJSILi6748iBjr/18ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yl2PBn8c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yl2PBn8c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C6E1F000E9;
	Wed, 27 May 2026 18:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779905829;
	bh=3wqNqXziVz14bBFTH19HXNwNHqyU96gKjQ8c31km+e0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yl2PBn8coou2WIoJLB1gTy5ZSAtZzQNlnRkynw6646fq0xaqPscCdtkWN8ECfmaGj
	 jjDjPviQ+ZRWSKqQ/vGedEFjJoYrNprOIIHOmzhto091hO3VaubnkI0i2kOfxrfHKj
	 HoQ298uJfVUvCw8XgGW/gsftslCtaE/fQWSRfWDSxiqYKpQ0SbNcGXOglTzp2MzOb8
	 3AHae4EnysNGRwiJrVtXaXdhPgjrNXDnAkpYzlBDfxtXaP8C0FlkDyaabyC516L1/9
	 YWmApJ0Akw6BqJVmWzB7HCWieB3xTaX62IljvoNT5rlWJriFWJ2NWNwloTaEwa2T4n
	 QQtQEhYIMmn+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/13] spi: cadence-quadspi: add DQS support to read
 data capture
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260527175527.2247679-8-s-k6@ti.com>
References: <20260527175527.2247679-8-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 18:17:08 +0000
Message-Id: <20260527181709.50C6E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The patch unconditionally clears the DQS (Data Strobe) bit, introd=
ucing a hardware regression for platforms relying on bootloader configurati=
on.
--

commit d5c6dc375c1d0a353b769715e376a353d659f290
Author: Santhosh Kumar K <s-k6@ti.com>

spi: cadence-quadspi: add DQS support to read data capture

This commit introduces a DQS (Data Strobe) parameter to the
cqspi_readdata_capture() function. It updates the register configuration
to explicitly set or clear the DQS bit based on the provided boolean flag.

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> index 0cc0d648d78db..f4efb92c9446a 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c

[ ... ]

> @@ -472,6 +473,11 @@ static void cqspi_readdata_capture(struct cqspi_st *=
cqspi, const bool bypass,
>  	reg |=3D (delay & CQSPI_REG_READCAPTURE_DELAY_MASK)
>  	       << CQSPI_REG_READCAPTURE_DELAY_LSB;
> =20
> +	if (dqs)
> +		reg |=3D BIT(CQSPI_REG_READCAPTURE_DQS_LSB);
> +	else
> +		reg &=3D ~BIT(CQSPI_REG_READCAPTURE_DQS_LSB);

[Severity: High]
Could this cause a regression for platforms that rely on the bootloader to
configure the DQS setup? Prior to this change, the read-modify-write
operation implicitly preserved this bit.

Because the caller below is updated to pass false unconditionally, explicit=
ly
clearing the bit here might lead to a loss of timing margins or immediate
read failures on platforms depending on the inherited hardware state for
high-speed DTR modes.

> +
>  	writel(reg, reg_base + CQSPI_REG_READCAPTURE);
>  }
> =20
> @@ -1313,7 +1319,7 @@ static void cqspi_configure(struct cqspi_flash_pdat=
a *f_pdata,
>  		cqspi->sclk =3D sclk;
>  		cqspi_config_baudrate_div(cqspi);
>  		cqspi_delay(f_pdata);
> -		cqspi_readdata_capture(cqspi, !cqspi->rclk_en,
> +		cqspi_readdata_capture(cqspi, !cqspi->rclk_en, false,

[Severity: High]
Does hardcoding this argument to false break bisectability? Platforms lacki=
ng
a device tree reset line that need DQS might fail here until subsequent
patches in the series restore proper tuning configurations.

>  				       f_pdata->read_delay);
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527175527.2247=
679-1-s-k6@ti.com?part=3D7
