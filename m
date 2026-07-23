Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953B03C7DF1
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 06:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784789811; cv=none; b=UF6+n7lGSHPiP1LSixCYzOCFpEPz+twRvp/S2q5RZeYiC5lT9ZrLAC0Ebq0/yQoSEXvqg7OzQ7Bw/CJlhc0oC1w7IH0JB59wWZ05HeRSUFDxoaKIVE5MC4SxYPPTeA4F8/xAanZRktCIo0yA6HHEFdb99phq6XCHIszBgo20GK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784789811; c=relaxed/simple;
	bh=UkUuXeeLXCCSUojIkKmEdvzDV1uGdoHQuJ6ZXo7TiQY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HC6L+v8FtlPdhkoYsp9Kb4HVw7zeQmyxN6DdpirjKgl3CtOY6kj4EmHx2D+kzdSFSenBZapDoTzn+RUbWOG264yNbR0t8DxOu2+NnE3sXljoZpVTwbgaChpx8Ro8fBXiSoDHD3HEmpY5ZdlpAb7xa2Y6bxoVAIzkgk6EW0qo9RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lWzOCbSG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lWzOCbSG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB2F91F00A3A;
	Thu, 23 Jul 2026 06:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784789810;
	bh=/VmfauhnxpZCQ88u7hkyqlEensLfYHS5l3HR4TTCnwQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lWzOCbSG4PwFETqVB5oJzHZHWSwK5Szklodzjv6wD68z7ARJ0fAOzVdivt+ocR4Wf
	 F9dytAP+xohXCvBihlnerU8+OyRwj3D+bKOTjSVKv/BUc4KRCTdcfgjwt2ZCbhQFB4
	 geQVcQAa5jT2Oh6G1LJF/yQap94IojexCYTBoKwNJ/T1/KTcIaePY0oNbT49bnFa1V
	 GYL0tK+ZPVStKQG1viG1lx6+4E31WMH0Z8jK5uk9W58BPbZ923iw+RLy+gbOUKFY0u
	 57HR930iUwWGdy8XJKv76iW+30BSroWexl9IyCQ3krlDfac5BSfluHKRpN50QNTXWK
	 nQuGlOgYxr4Uw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] spi: amlogic: spisg: Add support for A9
 controller features
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260723-a9-spisg-v2-4-9fc39106b7e2@amlogic.com>
References: <20260723-a9-spisg-v2-0-9fc39106b7e2@amlogic.com>
 <20260723-a9-spisg-v2-4-9fc39106b7e2@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 06:56:49 +0000
Message-Id: <20260723065649.AB2F91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Timeout completion race leading to cross-message corruption and po=
tential DMA UAF.
- [High] PM runtime usage counter leak and missing disable on probe error a=
nd module remove.
- [High] Driver erroneously assumes DMA address 0 is invalid for mapping tr=
acking.
- [High] The runtime PM resume callback ignores clock enablement errors.
--

--- Patch [4]: [PATCH v2 4/4] spi: amlogic: spisg: Add support for A9 contr=
oller features ---
commit 733f8e986a88161245fdf261af60ee5f16e4648c
Author: Xianwei Zhao <xianwei.zhao@amlogic.com>

spi: amlogic: spisg: Add support for A9 controller features
   =20
The Amlogic A9 SPISG controller extends the A4 controller with additional
configuration options. Add SoC-specific capability data and configure
these features when they are supported by the underlying hardware.

> diff --git a/drivers/spi/spi-amlogic-spisg.c b/drivers/spi/spi-amlogic-sp=
isg.c
> index 2d66f00dccd45..bc9564aef2452 100644
> --- a/drivers/spi/spi-amlogic-spisg.c
> +++ b/drivers/spi/spi-amlogic-spisg.c

[ ... ]

> @@ -542,7 +566,13 @@ static int aml_spisg_transfer_one_message(struct spi=
_controller *ctlr,
>  				       xfer->effective_speed_hz);
>  	}
> =20
> -	if (cs_hold_in_sclk) {
> +	if (data && data->cs_hold_ctrl) {
> +		cs_hold_in_sclk =3D cs_hold_in_sclk ? : 1;
> +		val =3D cs_hold_in_sclk * (FIELD_GET(CFG_CLK_DIV, spisg->cfg_bus) + 1);
> +		val =3D min_t(u32, 0x7FFF, val);
> +		FIELD_MODIFY(CFG_CS_HOLD, &spisg->cfg_spi, val);
> +		desc--;
> +	} else if (cs_hold_in_sclk) {
>  		/* additional null-descriptor to achieve the cs-hold delay */
>  		aml_spisg_setup_null_desc(spisg, desc, cs_hold_in_sclk);
>  		desc--;

[Severity: High]
This is a pre-existing issue, but does aml_spisg_transfer_one_message() hav=
e a
timeout completion race that could lead to DMA use-after-free?

If wait_for_completion_timeout() expires, the driver attempts to stop the
transfer by writing 0 to SPISG_REG_DESC_LIST_H:

	if (wait_for_completion_timeout(&spisg->completion, ...)) {
		ret =3D spisg->status ? -EIO : 0;
	} else {
		/* stop transfer */
		regmap_write(spisg->map, SPISG_REG_DESC_LIST_H, 0);
		ret =3D -ETIMEDOUT;
	}

Since it fails to disable the hardware interrupt or synchronize with the IRQ
handler via synchronize_irq(), could a delayed hardware interrupt call
complete(&spisg->completion) slightly late?

If this happens during or just after the next SPI message calls
reinit_completion(), it would immediately satisfy the new message's
completion wait, unmapping the DMA buffers while the hardware is actively
using them.

[Severity: High]
This isn't a bug introduced by this patch, but does this driver erroneously
assume DMA address 0 is invalid for mapping tracking?

In aml_spisg_setup_transfer() and aml_spisg_cleanup_transfer(), the code ch=
ecks
if the mapped DMA address is zero to determine if a mapping exists:

	if (desc->tx_paddr) {
		if (FIELD_GET(CFG_TXD_MODE, desc->cfg_start) =3D=3D SPISG_DATA_MODE_SG) {
			dma_unmap_single(dev, (dma_addr_t)desc->tx_paddr,
					 exdesc->tx_ccsg_len, DMA_TO_DEVICE);
			kfree(exdesc->tx_ccsg);

Since 0 is a valid DMA address on some platforms, if dma_map_single()
successfully maps a buffer to address 0, would this skip the unmap and kfree
calls, leaking memory and the DMA mapping? Should this use a separate boole=
an
flag like tx_mapped instead of testing the DMA address value?

[ ... ]

> @@ -773,6 +805,21 @@ static int aml_spisg_probe(struct platform_device *p=
dev)
> =20
>  	spisg->cfg_spi =3D FIELD_PREP(CFG_SFLASH_WP, 1) |
>  			 FIELD_PREP(CFG_SFLASH_HD, 1);
> +
> +	if (spisg->data && spisg->data->mo_idle_output_ctrl) {
> +		if (!of_property_read_u32(dev->of_node, "amlogic,mo-idle-output", &val=
))
> +			spisg->cfg_spi |=3D  FIELD_PREP(CFG_MO_IDLE_OUTPUT, val);
> +		else
> +			spisg->cfg_spi |=3D  FIELD_PREP(CFG_MO_IDLE_OUTPUT, 0);
> +	}
> +
> +	if (spisg->data && spisg->data->word_gap_ctrl) {
> +		if (!of_property_read_u32(dev->of_node, "amlogic,word-gap", &val))
> +			spisg->cfg_spi |=3D  FIELD_PREP(CFG_WORD_GAP, val);
> +		else
> +			spisg->cfg_spi |=3D  FIELD_PREP(CFG_WORD_GAP, 1);
> +	}
> +
>  	if (spi_controller_is_target(ctlr)) {
>  		spisg->cfg_spi |=3D FIELD_PREP(CFG_SLAVE_EN, 1);
>  		spisg->cfg_bus =3D FIELD_PREP(CFG_TX_TUNING, 0xf);

[Severity: High]
This isn't a bug introduced by this patch, but does aml_spisg_probe() leak
the PM runtime usage counter on error paths?

The driver enables PM runtime and increments the usage counter:

	pm_runtime_set_active(&spisg->pdev->dev);
	pm_runtime_enable(&spisg->pdev->dev);
	pm_runtime_resume_and_get(&spisg->pdev->dev);

If a subsequent operation like devm_request_irq() fails, the code branches =
to
out_clk and returns without decrementing the usage counter or disabling PM
runtime.=20

Additionally, aml_spisg_remove() does not appear to call pm_runtime_disable=
(),
which could leave the device dangling in the PM runtime core after module
unload.

[ ... ]

> @@ -859,6 +906,13 @@ static int spisg_resume_runtime(struct device *dev)
>  	return 0;
>  }
> =20
> +static const struct aml_spisg_data a9_spisg_data =3D {
> +	.mo_idle_output_ctrl =3D true,
> +	.word_gap_ctrl =3D true,
> +	.cs_hold_ctrl =3D true,
> +	.cs_setup_extend_ctrl =3D true,
> +};
> +

[Severity: High]
This is a pre-existing issue, but does spisg_resume_runtime() ignore clock
enablement errors?

In spisg_resume_runtime(), the driver calls:

	clk_prepare_enable(spisg->core);
	clk_prepare_enable(spisg->sclk);

If clock enablement fails, the function still returns 0 (success). Could th=
is
trick the PM runtime core into believing the device is active, causing
subsequent MMIO register accesses to hang the bus or crash the system since
the clock domain is off?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-a9-spisg-v=
2-0-9fc39106b7e2@amlogic.com?part=3D4
