Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E514502F
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 21:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778275976; cv=none; b=Ce102YeRDKBgMb8qMpYTjmGnZXGu50CRnss75KrSbsnAgIvlbRo6WN5LWe6isD22AkWfF4C+x17j6X3PE56hoSwxBfWZSF2xvas2jppV7LShac/E+eWLXCcDGqY0chxw83xihL61yLlSTXwzTqcV4zlPguzZzZcpPl5Ilo1gPXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778275976; c=relaxed/simple;
	bh=Tt7qF8ZR6WcVX8mr/wQWTmXakFzw4eFinUocZMS2wZI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PlAAF0xZHpsmbi0fdJB1sYbtV2QqfAxSWhFQSIQAhCWtqfSmJrinNLH+ndBw/vdovMB+LRS9wrdfx0e3PRmA5gPI2d2XKCmE7XAiZY5MxMiVnhuJ2v75xpnjz57cxbK5dgK8o/xun0uKSartruKjBz8a+ZhbyV1CCFhBb3rGKKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nDA4XIjM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nDA4XIjM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45BE6C2BCB0;
	Fri,  8 May 2026 21:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778275976;
	bh=Tt7qF8ZR6WcVX8mr/wQWTmXakFzw4eFinUocZMS2wZI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=nDA4XIjMJ0m+myz/QmsncMtPFNLZFyzSKCxuR4mHFIrJuelbomYAGSLkXygjwsTfO
	 ygNrl2g5ccz/OGofr0blCeb3DrPGYRq5bopOAhUBAmFcBsBv2fYDhOs/y/HKIMF7KG
	 1sEa5tQolPywcrznH4JvKw/CVT4YIleB9m3Qqg/p6D6HlmPitULGpbzyw0xA+W7N7+
	 +KIAE6/EYa7Ftvykw37uVzysau+OHHSWinccVepNfCY2b4/baGna4AtsPISn/RZSP4
	 z6f3YoWQ7tyjTQL0QJ1a3Vw7RkF92NGyqnr/KApZEQiW9I2Fj0GcyEkyMtjCTq78BN
	 QEyjbfbh72Xzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] [v5 net-next] p54spi: convert to devicetree
Reply-To: sashiko@lists.linux.dev
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260507212451.3333185-3-arnd@kernel.org>
References: <20260507212451.3333185-3-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 21:32:55 +0000
Message-Id: <20260508213256.45BE6C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `p54spi_spi_read` function performs an SPI transfer using a st=
ack-allocated buffer, which violates DMA mapping rules.
- [High] Missing validation for `spi->irq` before calling `request_irq()`.
--

commit fa2ad50656ff32f99005056eb774d07bdf3f221c
Author: Arnd Bergmann <arnd@arndb.de>

p54spi: convert to devicetree

This commit converts the Prism54 SPI driver from using hardcoded GPIO
module parameters to using the GPIO descriptor interface and device tree
probing.

> diff --git a/drivers/net/wireless/intersil/p54/p54spi.c b/drivers/net/wir=
eless/intersil/p54/p54spi.c
> index 9d66dcae54e02..d18be25450285 100644
> --- a/drivers/net/wireless/intersil/p54/p54spi.c
> +++ b/drivers/net/wireless/intersil/p54/p54spi.c

[ ... ]

> @@ -30,19 +31,6 @@
>  MODULE_FIRMWARE("3826.arm");
>  MODULE_FIRMWARE("3826.eeprom");
> =20
> -/* gpios should be handled in board files and provided via platform data,
> - * but because it's currently impossible for p54spi to have a header file
> - * in include/linux, let's use module parameters for now
> - */
> -
> -static int p54spi_gpio_power =3D 97;
> -module_param(p54spi_gpio_power, int, 0444);
> -MODULE_PARM_DESC(p54spi_gpio_power, "gpio number for power line");
> -
> -static int p54spi_gpio_irq =3D 87;
> -module_param(p54spi_gpio_irq, int, 0444);
> -MODULE_PARM_DESC(p54spi_gpio_irq, "gpio number for irq line");
> -
>  static void p54spi_spi_read(struct p54s_priv *priv, u8 address,
>  			      void *buf, size_t len)
>  {

This problem wasn't introduced by this patch, but I noticed a pre-existing
issue in the context here. Does the p54spi_spi_read() function perform an S=
PI
transfer using a stack-allocated buffer?

Looking at p54spi_spi_read(), the addr variable is allocated on the stack a=
nd
passed as a transfer buffer to spi_sync(). The SPI framework maps transfer
buffers for DMA. Passing a stack-allocated buffer is illegal, particularly =
with
CONFIG_VMAP_STACK enabled, because stack memory resides in vmalloc space and
cannot be safely DMA-mapped.

Could this cause memory corruption or a kernel panic during the transfer?

[ ... ]

> @@ -608,31 +596,20 @@ static int p54spi_probe(struct spi_device *spi)
>  		goto err_free;
>  	}
> =20
> -	ret =3D gpio_request(p54spi_gpio_power, "p54spi power");
> -	if (ret < 0) {
> -		dev_err(&priv->spi->dev, "power GPIO request failed: %d", ret);
> +	priv->gpio_powerdown =3D gpiod_get_optional(&spi->dev, "powerdown", GPI=
OD_OUT_HIGH);
> +	if (IS_ERR(priv->gpio_powerdown)) {
> +		ret =3D dev_err_probe(&priv->spi->dev, PTR_ERR(priv->gpio_powerdown),
> +				    "powerdown GPIO request failed\n");
>  		goto err_free;
>  	}
> =20
> -	ret =3D gpio_request(p54spi_gpio_irq, "p54spi irq");
> -	if (ret < 0) {
> -		dev_err(&priv->spi->dev, "irq GPIO request failed: %d", ret);
> -		goto err_free_gpio_power;
> -	}
> -
> -	gpio_direction_output(p54spi_gpio_power, 0);
> -	gpio_direction_input(p54spi_gpio_irq);
> -
> -	ret =3D request_irq(gpio_to_irq(p54spi_gpio_irq),
> -			  p54spi_interrupt, IRQF_NO_AUTOEN, "p54spi",
> -			  priv->spi);
> +	ret =3D request_irq(spi->irq, p54spi_interrupt, IRQF_NO_AUTOEN, "p54spi=
", priv->spi);

Is there missing validation for spi->irq before calling request_irq()?

If the device tree node lacks an interrupts property, the SPI core may set
spi->irq to 0 or a negative error code.

Passing this directly to request_irq() without validation can successfully
hijack a core system interrupt like the system timer on some architectures,
leading to system instability or deadlocks.

Should there be a check like if (spi->irq <=3D 0) to fail the probe gracefu=
lly?

>  	if (ret < 0) {
>  		dev_err(&priv->spi->dev, "request_irq() failed");
> -		goto err_free_gpio_irq;
> +		goto err_free_gpio_power;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260507212451.3333=
185-1-arnd@kernel.org?part=3D2
