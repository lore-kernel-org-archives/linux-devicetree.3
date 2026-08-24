Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D835F26B2D2
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 14:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787582392; cv=none; b=EV7M0IGFvVdk9wb3TuB1JblKOaSotUcFk7ccfITmP0Aj+HqtNPt67ebGbO7EsA1UYMpBKEN+aEsyI8Wc/XZLr19OSciS75eXYOf00CcRQLB9YA37yaGi4c/TgVJx64vljKoWJiPN8GyrsrfOzs35JxoemildjDOeZFA3vZ3NW00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787582392; c=relaxed/simple;
	bh=ZhCzzAfRsGx4LHgG020bbUcF5BBaGPd/ybnRI8yC5tQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Bu8Kiojo3MDlash7kC7DW1rqgYFzVzlGYrg8DI313p931c6gaT8PIn3KAGfflrMP3wDQkbncegyMGI0Pihe7pP8FbEayv2QJbhnZSBPzdj3F4C5lz8k+785wG6N1h40ZI2e0kr7fJNFugOjGADi/VEip1CGpFeyy0rZX6lLtABE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kjQj9GMN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kjQj9GMN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 296C11F000E9;
	Mon, 24 Aug 2026 14:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787582390;
	bh=GHYpUQAd4q7WISF+JL4eDkvSZYxhLoI+k9BAtk3Nq9I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kjQj9GMN4U7GRcgH0amlvPHEvIOi4WOU1qZThOtM1scaCbB9JvGmnCkNjDAN2v7W1
	 d0jm19wRQZfS/wPJRmPseaQsNU+fd+xYAQ5rk1iQjsnZDYk5vH3I2jv29xX5cvhuR2
	 TQFkY6akP17f6UaQDkeCowl/br8XZnIkj1fizxhLOXTxegfyXXjIQKuSXyuvjbRRdE
	 +hfIBauqJnWvoAIH0ad2+zfWx6Kis4O7S74lupy/4XM0TXuVEfggKYPMtjEjerIcuz
	 ONjJrNa+uuonsaJgc7OqCcOfhJHhKPjHce+gh9kwtOn+YjyEWPiRVcCbHWqG3i/A7W
	 rfL8hCaNUTv4Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] spi: qcom-geni: Use GPIO to notify master of SPI
 target activity
Reply-To: sashiko-reviews@lists.linux.dev
To: "Praveen Talari" <praveen.talari@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260824-use_gpio_to_notify_master_of_spi_target_activity-v4-2-fde2ebf043db@oss.qualcomm.com>
References: <20260824-use_gpio_to_notify_master_of_spi_target_activity-v4-0-fde2ebf043db@oss.qualcomm.com>
 <20260824-use_gpio_to_notify_master_of_spi_target_activity-v4-2-fde2ebf043db@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 14:39:49 +0000
Message-Id: <20260824143950.296C11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The driver masks errors from `devm_gpiod_get_optional()`, breaking=
 probe deferral when the GPIO provider is not yet loaded.
- [High] A race condition between starting the hardware transfer and assert=
ing `ready_gpio` can leave the ready signal permanently stuck high.
- [High] The `ready_gpio` signaling is completely bypassed when the SPI con=
troller operates in GSI DMA mode (`GENI_GPI_DMA`), causing the SPI master t=
o hang indefinitely.
- [Medium] The driver manipulates `ready_gpio` in hardirq context without c=
hecking if the provided GPIO can sleep.
--

--- Patch [2]: [PATCH v4 2/2] spi: qcom-geni: Use GPIO to notify master of =
SPI target activity ---
commit 8e9921c3fb958996ba0f3bd409f4db2936232e27
Author: Praveen Talari <praveen.talari@oss.qualcomm.com>

spi: qcom-geni: Use GPIO to notify master of SPI target activity

When operating in SPI target mode, the GENI controller relies on an
external GPIO to notify the SPI master about the target's active state.
This adds support for an optional ready GPIO that is asserted when a target
transfer begins and deasserted when the transfer completes.

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
> +			if (spi->target)
> +				gpiod_set_value(mas->ready_gpio, 1);
>  			ret =3D 1;
> +		}
> +
>  		return ret;
>  	}

[Severity: High]
Does this introduce a race condition with the interrupt handler that could
leave the ready GPIO permanently asserted?

In setup_se_xfer(), the transfer is started and the mas->lock is dropped.
If the master clocks the transfer immediately, it could complete and trigger
geni_spi_isr() before we reach the GPIO assertion here in
spi_geni_transfer_one().

The interrupt handler would deassert the GPIO on completion, but then this
function would unconditionally assert it again, leaving it stuck high.

[Severity: High]
Are we missing the ready signal assertion when the controller operates in
GSI DMA mode?

If the hardware is configured to use GENI_GPI_DMA, spi_geni_transfer_one()
routes the transfer to setup_gsi_xfer() directly below, which bypasses the
ready_gpio assertion entirely.=20

Looking at setup_gsi_xfer(), it doesn't appear to assert the ready signal
before initiating DMA, and the completion callback spi_gsi_callback_result()
does not deassert it.

>  	return setup_gsi_xfer(xfer, mas, slv, spi);
>  }
[ ... ]
> @@ -981,6 +990,8 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
>  			if (mas->cur_xfer) {
>  				spi_finalize_current_transfer(spi);
>  				mas->cur_xfer =3D NULL;
> +				if (spi->target)
> +					gpiod_set_value(mas->ready_gpio, 0);

[Severity: Medium]
Will this cause a 'sleeping in atomic context' splat if the ready GPIO is
backed by a sleeping controller?

Since geni_spi_isr() runs in hardirq context, gpiod_set_value() could sleep
if the GPIO provider is an I2C or SPI expander. Should we verify
!gpiod_cansleep() during probe before using it here?

>  				/*
>  				 * If this happens, then a CMD_DONE came before all the
>  				 * Tx buffer bytes were sent out. This is unusual, log
[ ... ]
> @@ -1131,8 +1144,16 @@ static int spi_geni_probe(struct platform_device *=
pdev)
>  	init_completion(&mas->rx_reset_done);
>  	spin_lock_init(&mas->lock);
> =20
> -	if (spi->target)
> +	if (spi->target) {
>  		spi->target_abort =3D spi_geni_target_abort;
> +		mas->ready_gpio =3D devm_gpiod_get_optional(dev, "ready",
> +							  GPIOD_OUT_LOW);
> +		if (IS_ERR(mas->ready_gpio)) {
> +			dev_err(dev, "Failed to request GPIO: %ld\n",
> +				PTR_ERR(mas->ready_gpio));
> +			mas->ready_gpio =3D NULL;
> +		}
> +	}

[Severity: High]
Does overwriting mas->ready_gpio with NULL break probe deferral?

If devm_gpiod_get_optional() returns -EPROBE_DEFER because the GPIO
controller isn't loaded yet, this error is masked and the SPI driver will
successfully probe but permanently operate without the required readiness
signaling.

> =20
>  	pm_runtime_use_autosuspend(&pdev->dev);
>  	pm_runtime_set_autosuspend_delay(&pdev->dev, 250);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-use_gpio_t=
o_notify_master_of_spi_target_activity-v4-0-fde2ebf043db@oss.qualcomm.com?p=
art=3D2
