Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FF143F4A0
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 10:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011839; cv=none; b=QHQKlTXuIFcgbfTyi9b+m2WfxJoyHZYaq76O0rdInh2XbiQuea1IO4LmTMu/uWe6VHhblssBuRJDoX7M3tiNnE48Iyvr8fob4z9gvI+GAwD4LlIbVuyphOAz8fefYzd+hcdNx2CCRpocUS6Luvgpy7NIowSQE3M8Uyu7cCXMAlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011839; c=relaxed/simple;
	bh=CZsDSrcaiTvSIheMyinNq2aemmTQtFQ9gs3bFdr3kNo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rLc3sOnZgjcUuNMa1gCn6xgZG1nS2lxZoncz8gqqhcdSoUxuBNd3RcxPeDJz53vVtS3CtXcJCda5g+T9sh2wtcl4c8Nm9YT2VboBabsL91b+p3t8G4PFIuBdZdiKSEay4EEHCkcr/XTWqeJPqd39tv3GYwf8AGTv+m22oVsts84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L8f+YTYi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L8f+YTYi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A4F31F000E9;
	Thu,  6 Aug 2026 10:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786011837;
	bh=NGsAtR31D/NO7cbpGKHUhCXulgjr/Ip1qyjyXHq/wOo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L8f+YTYiwPS6PDak6a7EExlPx2pmevzZLEcG0v5UiShRWhYZbALmGy6HWt8f3u4s2
	 vRRIijq5bgDPYz+Ylijw0x8+XOft4QAFz2ChV2bsk+sacxWO2OXuLsXZVaRbGnm+p+
	 oRzgTrxoUmjw5DbpSTocHCAOORSZPhuXkdOij6H+hNX1Z4GFvf8d0P5/RacB0AjDKK
	 buTB+iVPXrMrx2GYw9xRv6TQaQputgKk6CQweF9mrexunhwUzwAxB0amjcjHht2YkK
	 Y40nXyD2CmcMV1c0iJGZDXPEBH/k9nxUrhuSPQWESep5LkZtqM31p6l+qSGZWZtZL3
	 LSrW675UIXkgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] spi: qcom-geni: Use GPIO to notify master of SPI
 target activity
Reply-To: sashiko-reviews@lists.linux.dev
To: "Praveen Talari" <praveen.talari@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-2-c363a9b5df69@oss.qualcomm.com>
References: <20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-0-c363a9b5df69@oss.qualcomm.com>
 <20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-2-c363a9b5df69@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 10:23:56 +0000
Message-Id: <20260806102357.6A4F31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The probe function incorrectly handles errors from devm_gpiod_get_=
index_optional(), breaking probe deferral.
- [High] A race condition between spi_geni_transfer_one() and geni_spi_isr(=
) can leave the target readiness GPIO stuck permanently asserted.
- [Medium] The target readiness GPIO is toggled per spi_transfer rather tha=
n per spi_message, causing spurious dropouts mid-transaction.
--

--- Patch [2]: [PATCH 2/2] spi: qcom-geni: Use GPIO to notify master of SPI=
 target activity ---
commit c41b3184af4cdb8d8cf0321da6d2ab29ec44d0c2
Author: Praveen Talari <praveen.talari@oss.qualcomm.com>
spi: qcom-geni: Use GPIO to notify master of SPI target activity

This commit adds support for an optional GPIO to signal target availability
to the SPI master in the GENI SPI controller driver. The GPIO is asserted
when a transfer begins and deasserted upon completion, abort, or timeout.

> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index 6566975eb24f2..6083725a20aa4 100644
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
Does asserting the GPIO here introduce a race condition?

setup_se_xfer() unlocks mas->lock before returning. If the SPI master
immediately clocks data, the transfer could complete on the hardware and
trigger geni_spi_isr() on another CPU.

geni_spi_isr() would then deassert the GPIO to 0 before this thread
asserts it to 1, leaving the GPIO permanently stuck asserted and breaking
the handshake protocol for subsequent transfers.

[Severity: Medium]
Is the target readiness GPIO toggled per spi_transfer instead of per
spi_message here?

If a multi-transfer message is processed, this will cause the signal to
drop between fragments when geni_spi_isr() sets the GPIO to 0, potentially
causing the master to incorrectly interpret it as a target abort or failure.

>  			ret =3D 1;
> +		}
> +
>  		return ret;
>  	}

[ ... ]

> @@ -1131,8 +1144,16 @@ static int spi_geni_probe(struct platform_device *=
pdev)
>  	init_completion(&mas->rx_reset_done);
>  	spin_lock_init(&mas->lock);
> =20
> -	if (spi->target)
> +	if (spi->target) {
>  		spi->target_abort =3D spi_geni_target_abort;
> +		mas->target_gpio =3D devm_gpiod_get_index_optional(dev, "device", 0,
> +								 GPIOD_OUT_LOW);
> +		if (IS_ERR(mas->target_gpio)) {
> +			dev_err(dev, "Failed to request GPIO: %ld\n",
> +				PTR_ERR(mas->target_gpio));
> +			mas->target_gpio =3D NULL;
> +		}
> +	}

[Severity: High]
Could this error handling block probe deferral?

If the GPIO provider has not probed yet, devm_gpiod_get_index_optional()
will return -EPROBE_DEFER. By catching this error and setting
mas->target_gpio to NULL, the driver will silently continue without the
requested GPIO instead of deferring the probe.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-use_gpio_t=
o_notify_master_of_spi_target_activity-v1-0-c363a9b5df69@oss.qualcomm.com?p=
art=3D2
