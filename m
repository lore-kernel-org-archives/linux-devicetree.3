Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8591D242D84
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 13:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787060886; cv=none; b=RdUWwkxh4QHdEZU1oW4zlnLKVw84+2hsZe3okR4DNs+jDh+7ctzgEwjiJnauzEKDl4hVtSsizVUlOpxi7rD8wUbZfaoLiUADPHBgqKGzdpSf66A5bfRUIqxGlx8WcKtmvxR0Uxt8xKZW/zDUOyYPvmaMilcAx32izb0al/E3RS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787060886; c=relaxed/simple;
	bh=isQeRyT2aOh1SxOAsiXN3sccWFpiB6igQzPBhaBOdGY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UuWgYNpnPPXrn8KsmeCOcbWrxKwqN5O2p43TdqnBqSxpJT7ihKaXm62cVRbSY6egL0etYzhmOpwN4DMFgjucpQ7SeQ590Okc+5EQXCjFoBH+ziiaO8qvpoz+08Cv8XouT1DZkWiOVJBN4STC6LZN5BRLk/XJgk1j6dD0crYJSr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IOWFT8EZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IOWFT8EZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B1601F000E9;
	Tue, 18 Aug 2026 13:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787060885;
	bh=5lKMtvzEFbNGDn/hLgK8do9cuoi3qr9nP0p2BC4ghHI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IOWFT8EZfZohkYG6KDPQKaLHwPnTDME+OXPbZolJHe7y+g8jTkogyX4vxTPifV1Sl
	 1RjUWzY3TfSxU3EvoI9gwN9mh4lKxZw+OSL1zeAE6k+Gnw8UmSl9uRtN/LUM2oFURf
	 KgbEt4sEEhLsWXhN7VCD2B97hy+I1MRwGHOesGEZVvcjwy8526pMCvZWgUw8yMARY7
	 Yc0czW5gMaWAJysATyo+KvQnis1Nx863QApjmf7jy6+V3tbrVbfxSWdEJ02ETvmCb/
	 g60rAP9OZASkDJdy/Rq0hUwqU7WT9RhksyvVVwhLOioyxXevgOC+f0brjNWudqyD7l
	 UCvJYaxwKox1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] spi: qcom-geni: Use GPIO to notify master of SPI
 target activity
Reply-To: sashiko-reviews@lists.linux.dev
To: "Praveen Talari" <praveen.talari@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260818-use_gpio_to_notify_master_of_spi_target_activity-v3-2-e1c9e0dabbda@oss.qualcomm.com>
References: <20260818-use_gpio_to_notify_master_of_spi_target_activity-v3-0-e1c9e0dabbda@oss.qualcomm.com>
 <20260818-use_gpio_to_notify_master_of_spi_target_activity-v3-2-e1c9e0dabbda@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 13:48:04 +0000
Message-Id: <20260818134805.2B1601F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Masking of legitimate errors (such as -EPROBE_DEFER) from devm_gpi=
od_get_index_optional() breaks probe deferral.
- [High] A race condition between hardware transfer setup and completion ca=
n leave the target ready GPIO permanently asserted.
- [High] The target_gpio is manipulated from hard IRQ handlers and under sp=
inlocks without verifying it is safe for atomic access.
- [Medium] The target ready GPIO is never asserted or deasserted when the c=
ontroller operates in GENI_GPI_DMA mode.
--

--- Patch [2]: [PATCH v3 2/2] spi: qcom-geni: Use GPIO to notify master of =
SPI target activity ---
commit 53485a3ab9e87d880b4b4561671fdbf7ecc3b9cf
Author: Praveen Talari <praveen.talari@oss.qualcomm.com>

spi: qcom-geni: Use GPIO to notify master of SPI target activity

This commit adds support for an optional ready GPIO to notify the SPI master
of target activity. The GPIO is asserted when a transfer begins and deasser=
ted
on completion or error.

> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c

[ ... ]

> @@ -938,8 +943,12 @@ static int spi_geni_transfer_one(struct spi_controll=
er *spi,
>  	if (mas->cur_xfer_mode =3D=3D GENI_SE_FIFO || mas->cur_xfer_mode =3D=3D=
 GENI_SE_DMA) {
>  		ret =3D setup_se_xfer(xfer, mas, slv->mode, spi);
>  		/* SPI framework expects +ve ret code to wait for transfer complete */
> -		if (!ret)
> +		if (!ret) {
> +			if (spi->target && mas->target_gpio)
> +				gpiod_set_value(mas->target_gpio, 1);

[Severity: High]
Is it possible for the hardware to complete the transfer and trigger the ISR
before this GPIO assertion occurs?

Since setup_se_xfer() drops the mas->lock spinlock before returning, a fast
SPI master or immediate hardware error could trigger the interrupt. If the =
ISR
runs first and deasserts the GPIO:

geni_spi_isr()
    if (mas->cur_xfer) {
        ...
        if (spi->target && mas->target_gpio)
            gpiod_set_value(mas->target_gpio, 0);
    }

Would this code then unconditionally overwrite the GPIO to 1, leaving it
permanently asserted and falsely signaling readiness to the master?

> +			ret =3D 1;
> +		}
> +
>  		return ret;
>  	}
>  	return setup_gsi_xfer(xfer, mas, slv, spi);

[Severity: Medium]
Does the target ready GPIO need to be managed when operating in GENI_GPI_DMA
mode?

If mas->cur_xfer_mode is GENI_GPI_DMA, this path is taken, bypassing the new
GPIO assertion logic entirely. Could this leave the external SPI master
waiting indefinitely for the readiness signal?

[ ... ]

> @@ -981,6 +990,8 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
>  			if (mas->cur_xfer) {
>  				spi_finalize_current_transfer(spi);
>  				mas->cur_xfer =3D NULL;
> +				if (spi->target && mas->target_gpio)
> +					gpiod_set_value(mas->target_gpio, 0);

[Severity: High]
Could this cause a scheduling while atomic panic if the GPIO assigned in the
device tree is behind a sleeping controller, such as an I2C or SPI expander?

The GPIO is requested during probe without checking gpiod_cansleep() to
explicitly reject sleeping GPIOs, and is being manipulated here directly
inside a hardirq handler.

[ ... ]

> @@ -1131,8 +1144,16 @@ static int spi_geni_probe(struct platform_device *=
pdev)
>  	init_completion(&mas->rx_reset_done);
>  	spin_lock_init(&mas->lock);
> =20
> -	if (spi->target)
> +	if (spi->target) {
>  		spi->target_abort =3D spi_geni_target_abort;
> +		mas->target_gpio =3D devm_gpiod_get_index_optional(dev, "ready", 0,
> +								 GPIOD_OUT_LOW);
> +		if (IS_ERR(mas->target_gpio)) {
> +			dev_err(dev, "Failed to request GPIO: %ld\n",
> +				PTR_ERR(mas->target_gpio));
> +			mas->target_gpio =3D NULL;
> +		}

[Severity: High]
Does this error handling block probe deferral?

By catching all errors from devm_gpiod_get_index_optional() and replacing t=
hem
with NULL, legitimate errors like -EPROBE_DEFER will be masked.

If the GPIO provider has not probed yet, will the SPI controller permanently
fail to acquire the GPIO for this boot rather than properly deferring?

> +	}
> =20
>  	pm_runtime_use_autosuspend(&pdev->dev);
>  	pm_runtime_set_autosuspend_delay(&pdev->dev, 250);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-use_gpio_t=
o_notify_master_of_spi_target_activity-v3-0-e1c9e0dabbda@oss.qualcomm.com?p=
art=3D2
