Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B3644D011
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 16:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786984091; cv=none; b=mhs25jIdHl7X+P42qyXi3/rSHgddpHx7LKreblGuP1JVyP+UfmQSfsXxZxmLjM3mUdBSmvPUEb9Ykc/IhjJDYaeh35HRgY7Uz+JXxSe/cifV1wzIYNzS6dTQihU1gxOKYVxVQmq0afX98woTmavVhUfwtWDG5248oVThO9eD5Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786984091; c=relaxed/simple;
	bh=L4aQgT8fXeqPiOdTgjkC0lOKyX+YyiVCgNjOLpBrcQg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dgpVhpjyNGpvhhZxYUWF7Y7LG3DJPSkZrL2IyN6VNCvWcVC90FHHPOe2cRXDEcuJ/ziXLG3faAgZ5zYdE8NOZMPvd5XSPwzkBiuaUyUF6dHdXhZEN4vFHupIlfT3Zc1zyCIWUVRrGRYBOegWksVUvVt/0+uTqjaaggODLLf16Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XsE1bvza; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XsE1bvza"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 379681F000E9;
	Mon, 17 Aug 2026 16:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786984088;
	bh=rkQK4JrZ6iw4CExt8/XNPAiEtUlvNHZmiGV6tHnoAYI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XsE1bvzaYZu9/vmmFkLs2I+5icBR6EzaQODpN8L5RqEBJ6CihUKqQdS3O+GRPUqVU
	 +q5V/XZKXCmG2pRo4YfJMkx0bnWN5X6LjcrPF0tzmFxuLqPF98ew/jRUhz/WopuiQC
	 /chlXrlbPLdd0fwH3YG3nQp+H3w6xX6Um7FkrLBjC9MnUztNynqCjoJcj8jqjd9QVG
	 R6dn8kBz9oXMyMUKapSGOBekDt+YXJqPyL8wkSAPIbI/qKxedfOPIkYHE5ZlX4ds2B
	 GMVxL9/wA5GIMgZid9hCKDTaatuKjJqsa2wwVoGco5ELKdKmpTgC7oKHEmdZH35v7y
	 Hm0jJ5BiutqkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] spi: qcom-geni: Use GPIO to notify master of SPI
 target activity
Reply-To: sashiko-reviews@lists.linux.dev
To: "Praveen Talari" <praveen.talari@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260817-use_gpio_to_notify_master_of_spi_target_activity-v2-2-94d1eff3175f@oss.qualcomm.com>
References: <20260817-use_gpio_to_notify_master_of_spi_target_activity-v2-0-94d1eff3175f@oss.qualcomm.com>
 <20260817-use_gpio_to_notify_master_of_spi_target_activity-v2-2-94d1eff3175f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 16:28:07 +0000
Message-Id: <20260817162808.379681F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The driver incorrectly swallows errors from `devm_gpiod_get_index_=
optional()`, breaking deferred probing (-EPROBE_DEFER).
- [High] The target ready GPIO is completely ignored when the SPI controlle=
r operates in GPI DMA mode (`GENI_GPI_DMA`).
- [High] A race condition between hardware initiation and GPIO assertion ca=
n leave the ready GPIO permanently stuck high.
--

--- Patch [2]: [PATCH v2 2/2] spi: qcom-geni: Use GPIO to notify master of =
SPI target activity ---
commit d3635e8d846f952a724421a12c51192475a16e09
Author: Praveen Talari <praveen.talari@oss.qualcomm.com>

spi: qcom-geni: Use GPIO to notify master of SPI target activity

When operating in SPI target mode, the GENI controller relies on an
external GPIO to notify the SPI master about the target's active state.

Add support for an optional ready GPIO that is asserted when a target
transfer begins and deasserted when the transfer completes, is aborted,
or hits a timeout. This allows the target to explicitly signal its
availability to the master and ensures the GPIO is released in all error
and completion paths, preventing the master from observing a stale or
incorrect target-ready indication.

> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index 6c57f8309a3b2..bbe040383d530 100644
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
Is there a race condition here between hardware initiation and GPIO asserti=
on
that could leave the ready GPIO permanently stuck high?

When setup_se_xfer() arms the hardware and drops the spinlock:

drivers/spi/spi-geni-qcom.c:setup_se_xfer() {
    ...
    spin_unlock_irq(&mas->lock);
    return ret;
}

If the SPI master immediately sends clocks, the hardware can complete the
transfer and trigger geni_spi_isr() on another CPU before we assert the GPIO
here. The ISR finalizes the transfer and deasserts the GPIO to 0.

Afterwards, this code resumes and unconditionally asserts the GPIO to 1,
overriding the completed state.

>  			ret =3D 1;
> +		}
> +
>  		return ret;
>  	}
>  	return setup_gsi_xfer(xfer, mas, slv, spi);

[Severity: High]
Does this bypass the GPIO assertion logic when the SPI controller operates =
in
GPI DMA mode (GENI_GPI_DMA)?

The GPIO assertion logic appears to be restricted to SE DMA and FIFO paths,
skipping the GPI DMA fallback path completely.

Furthermore, is the GPIO deassertion also missing in the GPI DMA completion
handler?

drivers/spi/spi-geni-qcom.c:spi_gsi_callback_result() {
    ...
    if (!result->residue) {
        spi->cur_msg->status =3D 0;
        dev_dbg(&spi->dev, "DMA txn completed\n");
    }
    ...
}

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

[Severity: High]
Does this incorrectly swallow errors from devm_gpiod_get_index_optional(),
breaking deferred probing (-EPROBE_DEFER)?

If the GPIO provider probes after the SPI controller,
devm_gpiod_get_index_optional() will return -EPROBE_DEFER, but this catches
the error, logs it, and sets the pointer to NULL instead of propagating the
error to allow retrying later.

> +		}
> +	}
> =20
>  	pm_runtime_use_autosuspend(&pdev->dev);
>  	pm_runtime_set_autosuspend_delay(&pdev->dev, 250);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-use_gpio_t=
o_notify_master_of_spi_target_activity-v2-0-94d1eff3175f@oss.qualcomm.com?p=
art=3D2
