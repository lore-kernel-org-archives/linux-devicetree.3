Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BF82BEC45
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 20:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790453216; cv=none; b=SavV6aBnmOeeMsNYdyM0nd+IROQh+N9Mmvkw1UqfLSBhJaN+oCx/UsIdAVyZjke2ls2g0Z35KsyUs9twISlFWqgpoG03WECK94FYtMtlHvT3ByFmnRt2sDV2ofhf71NjDr73kmhhkg8KQ9wCY9QYIoGX/OUR4s9BUc7+Xod6+7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790453216; c=relaxed/simple;
	bh=gdWdGfufsBDqwGqTFQLKl2TKlLHmI1VpEUbei0rpoqk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EXgP0A9ZR/CUcENZuNarwVWaxwNRnd4a/4ZmenjaRsc9LKYakfe0qIPeP4R33Rsdxa1EWBkie1Jb0vE1lB0V/1cR2dOOGOgF2OMgt+MydSh8+8sk38SKQFPXlWW1/KynD73imd2hDkSYyhw2OMIPEW+n2Xi9LEx4B4JRZ97pMAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c7Vs/VN0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c7Vs/VN0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 547BF1F000FF;
	Sat, 26 Sep 2026 20:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790453214;
	bh=qcl6IlPdLbFs+zPrezRrcAjarr3BmEeXCJPKbgUP6pE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c7Vs/VN0X1AIsRmXJPPRBoLnhOc3V7qNdw2TK+S/KVezh44xAQ995gn+R4ue2gt0A
	 Y0uDS2u5Gr6ONaYhIt4kuWIavuHvkF0tq49aDjKqg18m7em+zEGCQgI/BcRGxYFpTJ
	 yLyOFbJVW335ZqSWxfdrI2ilAmRXA9r9iKGHETUd552D13TZCGiVatY4uhP/kih9Ny
	 pTA3p/rhDcnUCAKxYBlfdMStFo+0N+EmGIGBBKqCLUKDtGOBA93AjZ65Y//salSmsQ
	 3Q3UyE2dYyKomdxmuCtmCAJEcy0hlRDTEBEqXKZP26py0TqQnS1rD09yq2yVrIdjIg
	 T7y3fQyVYMuHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] spi: qcom-geni: Use GPIO to notify master of SPI
 target activity
Reply-To: sashiko-reviews@lists.linux.dev
To: "Praveen Talari" <praveen.talari@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260927-use_gpio_to_notify_master_of_spi_target_activity-v5-2-9b973623080f@oss.qualcomm.com>
References: <20260927-use_gpio_to_notify_master_of_spi_target_activity-v5-0-9b973623080f@oss.qualcomm.com>
 <20260927-use_gpio_to_notify_master_of_spi_target_activity-v5-2-9b973623080f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 20:06:53 +0000
Message-Id: <20260926200654.547BF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] spi: qcom-geni: missing ready_gpio deassertion in GENI_SE_FIFO mode
- [High] spi: qcom-geni: ready_gpio completely unhandled in GENI_GPI_DMA mo=
de
--

commit b777efb262a38b2b19686188b7453a1af9e45b0c
Author: Praveen Talari <praveen.talari@oss.qualcomm.com>

spi: qcom-geni: Use GPIO to notify master of SPI target activity

This commit adds an optional ready GPIO to notify the SPI master of the
target's active state when operating in SPI target mode. The GPIO is
asserted when a transfer begins and deasserted upon completion, abort,
or timeout.

> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index bced6279a0624..91e75e213f929 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c

[ ... ]

> @@ -936,8 +941,12 @@ static int spi_geni_transfer_one(struct spi_controll=
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
>  	return setup_gsi_xfer(xfer, mas, slv, spi);

[Severity: High]
Should ready_gpio be asserted and deasserted for GENI_GPI_DMA mode as well?

If the hardware configuration supports GPI DMA, spi_geni_init() can select
GENI_GPI_DMA mode for the target. When spi_geni_transfer_one() delegates
directly to setup_gsi_xfer() here, the ready_gpio assertion is skipped.

Similarly, the DMA completion in spi_gsi_callback_result() does not seem to
deassert the GPIO.

Could this cause the SPI master to wait indefinitely for the ready signal on
platforms with GPI DMA enabled, leading to bus stalls and total communicati=
on
failure?

[ ... ]

> @@ -1023,6 +1032,8 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
>  		if (dma_rx_status & RX_RESET_DONE)
>  			complete(&mas->rx_reset_done);
>  		if (!mas->tx_rem_bytes && !mas->rx_rem_bytes && xfer) {
> +			if (spi->target)
> +				gpiod_set_value(mas->ready_gpio, 0);
>  			spi_finalize_current_transfer(spi);
>  			mas->cur_xfer =3D NULL;
>  		}

[Severity: High]
Does the GENI_SE_FIFO mode completion path in geni_spi_isr() also need to
deassert ready_gpio?

When a target SPI transfer falls back to GENI_SE_FIFO mode and the transfer
completes, geni_spi_isr() processes M_CMD_DONE_EN, calls
spi_finalize_current_transfer(), and clears mas->cur_xfer:

drivers/spi/spi-geni-qcom.c:geni_spi_isr() {
    ...
    if (mas->cur_xfer_mode =3D=3D GENI_SE_FIFO) {
        ...
        if (m_irq & M_CMD_DONE_EN) {
            if (mas->cur_xfer) {
                spi_finalize_current_transfer(spi);
                mas->cur_xfer =3D NULL;
    ...
}

However, the GPIO doesn't appear to be deasserted in this path.

If the ready_gpio remains permanently asserted after the first GENI_SE_FIFO
transfer completes successfully, could this break the target-ready handshake
protocol and cause the SPI master to incorrectly perceive the target as alw=
ays
ready?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927-use_gpio_t=
o_notify_master_of_spi_target_activity-v5-0-9b973623080f@oss.qualcomm.com?p=
art=3D2
