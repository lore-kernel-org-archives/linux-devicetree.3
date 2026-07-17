Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B93C3E1689
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 08:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784275446; cv=none; b=VH2ZljNSgtZsAV+XwgJ1FPME05rEOmV/o8/EDu+1OToAmaaLyRzgJmimpWS+BIWKPEPfQ+spbti/AgmtQJfSk1OPJaljDKh+mZJSUBmky7naGa2ES01t9/bd0OH9Q35bhE5zTkUe2tTjMGYNTlmoFfpVA5721XGzvJZ2/FItQp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784275446; c=relaxed/simple;
	bh=wAOUV999ROhkzt50m9xWAwQ2jf8Fo+MNYzK04yKphcI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IQKHmqYT9Kz7ffdfbcKxiuJX0eXdPcRw5yKbzMiA5I/7Rfce7ARguiqkHRNOlSbgDBAZ983gb7KCMUg0VT+SncRGvYijJKHg4EWwuCDcWdxyuFl9xomiVWn6oQT2VToCgOPLCU72AP03+LVxDHYooFcU7Ticd9Zv0vRd9H4vY20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LEtvljTf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LEtvljTf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76DD91F000E9;
	Fri, 17 Jul 2026 08:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784275444;
	bh=0CbAhbRA8Tg4xKwUdb4WXdDz/GTyZXdxx/wUbgFU6Yc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LEtvljTfBWJ7FdQA5PUubV71KAM5/cR40ELQ8o7uN5va6hpC8/PmSWoqfvT0KX6E+
	 QcpQ+094y+ZciBQv30kxPYxu0os3Xhv1bOaNK9sGDLk8yLCaPIivn7zgb6vIQuVgN9
	 Yq7TTFy5NZGcu4P9TAvBXZ/EE1dQMT1z4Q7f3E993TBPHOYSZ1OxcK+YSPtjdit558
	 KV2ibr1fCecabwPx8dndvHbU3bLzBjqJi9aWSCbiq1J4339acZ1bFdE2JdKhIgbP3L
	 Lwk7SdZy7TKJSv1/rsIPhXzvboqGRDZBwLgZpqZaHyOwjtLrmtIQBZHDautanvqjJh
	 lhH0XDJq4ZrXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] spi: amlogic: spisg: Add support for A9 controller
 features
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, robh@kernel.org
In-Reply-To: <20260717-a9-spisg-v1-3-2eeea77be19f@amlogic.com>
References: <20260717-a9-spisg-v1-0-2eeea77be19f@amlogic.com>
 <20260717-a9-spisg-v1-3-2eeea77be19f@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 08:04:03 +0000
Message-Id: <20260717080404.76DD91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The calculated CFG_CS_HOLD delay value lacks bounds checking befor=
e being written via FIELD_MODIFY, leading to silent bitwise truncation and =
incorrectly shortened hold times.

Pre-existing issues:
- [High] The driver fails to abort the hardware operation when a transfer t=
imes out, leading to DMA use-after-free and cascading synchronization failu=
res.
- [High] `spi_delay_to_sclk()` suffers from a 32-bit integer overflow when =
calculating delay cycles, resulting in drastically shorter setup and hold t=
imes than requested.
--

--- Patch [3]: [PATCH 3/3] spi: amlogic: spisg: Add support for A9 controll=
er features ---
commit 850f7cb5955f8bd514dfd78b459ee02b15378db4
Author: Xianwei Zhao <xianwei.zhao@amlogic.com>

spi: amlogic: spisg: Add support for A9 controller features
   =20
The Amlogic A9 SPISG controller extends the A4 controller with additional
configuration options. Add SoC-specific capability data and configure
these features when supported by the hardware, while keeping compatibility
with existing A4 controllers.

> diff --git a/drivers/spi/spi-amlogic-spisg.c b/drivers/spi/spi-amlogic-sp=
isg.c
> index 0f026d3e43e0b..845eb81d483a3 100644
> --- a/drivers/spi/spi-amlogic-spisg.c
> +++ b/drivers/spi/spi-amlogic-spisg.c
[ ... ]
> @@ -525,9 +541,17 @@ static int aml_spisg_transfer_one_message(struct spi=
_controller *ctlr,
>  		}
> =20
>  		/* calculate cs-setup delay with the first xfer speed */
> -		if (list_is_first(&xfer->transfer_list, &msg->transfers))
> -			desc->cfg_bus |=3D FIELD_PREP(CFG_CS_SETUP,
> -				spi_delay_to_sclk(xfer->effective_speed_hz, &msg->spi->cs_setup));
> +		if (list_is_first(&xfer->transfer_list, &msg->transfers)) {
> +			val =3D spi_delay_to_sclk(xfer->effective_speed_hz, &msg->spi->cs_set=
up);

[Severity: High]
This is a pre-existing issue, but can spi_delay_to_sclk() suffer from a
32-bit integer overflow when calculating delay cycles?

Looking at spi_delay_to_sclk():

drivers/spi/spi-amlogic-spisg.c:spi_delay_to_sclk() {
    ...
    return DIV_ROUND_UP_ULL(slck_speed_hz * ns, NSEC_PER_SEC);
}

If a client requests a large delay, the multiplication of the two 32-bit
integers (slck_speed_hz and ns) can wrap around before being cast to a
64-bit integer by DIV_ROUND_UP_ULL.

Could this result in drastically shorter setup and hold times than
requested?

> +			if (data && data->cs_setup_extend_ctrl) {
> +				val =3D min_t(u32, 0xFF, val);
> +				desc->cfg_bus |=3D FIELD_PREP(CFG_CS_SETUP, val & 0xF);
> +				FIELD_MODIFY(CFG_CS_SETUP_EXTEND, &spisg->cfg_spi, val >> 4);
> +			} else {
> +				val =3D min_t(u32, 0xF, val);
> +				desc->cfg_bus |=3D FIELD_PREP(CFG_CS_SETUP, val);
> +			}
> +		}
> =20
>  		/* calculate cs-hold delay with the last xfer speed */
>  		if (list_is_last(&xfer->transfer_list, &msg->transfers)) {
> @@ -542,7 +566,12 @@ static int aml_spisg_transfer_one_message(struct spi=
_controller *ctlr,
>  				       xfer->effective_speed_hz);
>  	}
> =20
> -	if (cs_hold_in_sclk) {
> +	if (data && data->cs_hold_ctrl) {
> +		cs_hold_in_sclk =3D cs_hold_in_sclk ? : 1;
> +		val =3D cs_hold_in_sclk * (FIELD_GET(CFG_CLK_DIV, spisg->cfg_bus) + 1);
> +		FIELD_MODIFY(CFG_CS_HOLD, &spisg->cfg_spi, val);

[Severity: High]
Does the calculated CFG_CS_HOLD delay value lack bounds checking before
being written via FIELD_MODIFY?

Unlike CFG_CS_SETUP which safely uses min_t(), cs_hold is left unbounded.
Since CFG_CS_HOLD is a 15-bit field, if an SPI client requests a large CS
hold time, the FIELD_MODIFY macro will silently apply a bitwise mask.

Will this cause the delay to wrap around (e.g. 32768 becomes 0) rather
than clamping at the maximum supported hardware limit, leading to hardware
timing violations?

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for the
timeout error path to free DMA-mapped memory without halting the active
hardware?

Looking further down in aml_spisg_transfer_one_message():

drivers/spi/spi-amlogic-spisg.c:aml_spisg_transfer_one_message() {
    ...
    if (wait_for_completion_timeout(&spisg->completion, ...))
        ret =3D spisg->status ? -EIO : 0;
    else
        ret =3D -ETIMEDOUT;

    dma_unmap_single(dev, descs_paddr, descs_len, DMA_TO_DEVICE);
end:
    ...
    kfree(descs);
    ...
}

If an SPI transfer times out and wait_for_completion_timeout() expires,
the code proceeds directly to unmap the DMA memory and free the descriptor
array. However, the hardware is never halted or reset (e.g. by writing 0
to the descriptor list register).

Might the hardware still be actively performing DMA, resulting in memory
corruption from a use-after-free? Furthermore, if the hardware eventually
completes, could the delayed interrupt falsely wake up subsequent transfers?

> +		desc--;
> +	} else if (cs_hold_in_sclk) {
>  		/* additional null-descriptor to achieve the cs-hold delay */
>  		aml_spisg_setup_null_desc(spisg, desc, cs_hold_in_sclk);
>  		desc--;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-a9-spisg-v=
1-0-2eeea77be19f@amlogic.com?part=3D3
