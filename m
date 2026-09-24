Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61DB3BED7D
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 09:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790242958; cv=none; b=ET/YytdU4YtQfLmKfj5iy51StDX7mQ3umaSQDXrTLZjITJVG0tZHa5GDLyBciToarryI6UHbJ7pYYEaTaBXlt8EuIoR3lvIlaODJAJiSOgcdDOlknhLgWgrybdWB3G3AjAF2SQCQlwxtglHGVTZkai2FSgTfgvr4N1W8wJyGxhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790242958; c=relaxed/simple;
	bh=vRftVCTyYwdYNnsUlNjQMuxA/tHONptZXvXInvysDiU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U/vFViHVm74DB7XiMnoCxvQOJOm3135yXQUCf1cX3fd0+7BnccUwUHZFMxEMgILtmYarhVHTysdsLfHs9wj8snpemboqKfELLJTQi5BrPuiZz08LGnAdXJJBrLGr+6mskQe284BQYg/GVLEZtB1LeqDBA59k1vdhxADmJvo3sd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HI866nwl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HI866nwl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42CC61F000FF;
	Thu, 24 Sep 2026 09:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790242951;
	bh=y22qmFJzUBjNJ0RE1/+3LwydbRF5yLBg4NI3Cyqh9FA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HI866nwlRITD1W9tfsTXdAxQYJqGZfEJXJt8zdu5spxu0/fmcvJzBq4tMZpakwybj
	 +p/QcCQoAI+hy29SKeYg4TphX+BIZ0TID8/oOFDblPjf/13JIi8Eo3M/z18xudLnIv
	 sfBU/PUGGpWOlQxQT3WwrgiANOtl1KyPFAivcnuxzQPH4KG+jZcbMTqZhedzkfHVLj
	 32bNHkLXnSRRQdc8U46Wwp+0hNZbxLGCA7SbVn/klnZ13sWt3YbJx/ArSAkoHbYvbn
	 g9L2stgtoYoEKJCGtqV2gfkNBGV91B51xgm0KbOO2CxEnD9Ui6OXx52vJCaWoNsdcx
	 I0zm8+iId4dgQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] EDAC/cadence: Add Cadence DDR EDAC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Louvel" <paul.louvel@bootlin.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260924-paul-v7-3-rc1-edac-v1-2-70be37c41a18@bootlin.com>
References: <20260924-paul-v7-3-rc1-edac-v1-0-70be37c41a18@bootlin.com>
 <20260924-paul-v7-3-rc1-edac-v1-2-70be37c41a18@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 09:42:30 +0000
Message-Id: <20260924094231.42CC61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] core: stack use-after-free in devm_clk_bulk_get_enable()
- [Medium] irq: spurious IRQ detection defeated by unconditional IRQ_HANDLED
- [Medium] irq: missing hardware interrupt mask on driver removal
- [Low] build: build failure due to non-constant mask in FIELD_MODIFY()
- [Low] sysfs: data race during hardware RMW in cdns_rmw()
--

commit 6d767e55902586f690d28deaaff002c58978b206
Author: Paul Louvel <paul.louvel@bootlin.com>

EDAC/cadence: Add Cadence DDR EDAC driver

Add the Cadence EDAC driver found on Renesas RZ/N1x SoC.
The memory controller supports ECC, software scrubbing, and SECDED.

> diff --git a/drivers/edac/cadence_edac.c b/drivers/edac/cadence_edac.c
> new file mode 100644
> index 0000000000000..6567ac5147d05
> --- /dev/null
> +++ b/drivers/edac/cadence_edac.c
[ ... ]
> +static void cdns_rmw(struct cdns_mc_priv *drv, u32 reg, u32 mask, u32 va=
l)
> +{
> +	u32 regval;
> +
> +	regval =3D readl(drv->io_base + reg);
> +	FIELD_MODIFY(mask, &regval, val);

[Severity: Low]
Does this compile under all configurations? FIELD_MODIFY requires the mask
argument to be a compile-time constant, as it internally asserts
BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask), ...). Since mask is passed as
a variable argument to cdns_rmw() in drivers/edac/cadence_edac.c, this can
lead to build failures if the compiler decides not to inline this function.

[Severity: Low]
Is it possible to corrupt the hardware state here due to concurrent access?
This read-modify-write sequence lacks synchronization. Since cdns_rmw() is
called from cdns_mc_err_inject() in drivers/edac/cadence_edac.c, which is
invoked via the inject_ctrl_store() sysfs callback, concurrent sysfs writes
could interleave and cause lost register updates.

> +	writel(regval, drv->io_base + reg);
> +}
> +
> +static irqreturn_t cdns_mc_err_handler(int irq, void *dev_id)
> +{
> +	struct mem_ctl_info *mci =3D dev_id;
> +	struct cdns_mc_priv *priv =3D mci->pvt_info;
> +	u32 addr, status, err_addr, syndrome, reg;
> +	char other_details_str[32];
> +	u8 type;
> +
> +	/* Read the interrupt status register */
> +	status =3D readl(priv->io_base + CDNS_DDR_ECC_INT_STAT);

[ ... ]

> +	/* clear the error, clears the interrupt */
> +	writel(status & CDNS_DDR_ECC_INT_ACK_MASK, priv->io_base + CDNS_DDR_ECC=
_INT_ACK);
> +
> +	return IRQ_HANDLED;

[Severity: Medium]
Can this unconditionally return IRQ_HANDLED even on spurious interrupts? If
the read status is 0, the handler won't process anything but still returns
IRQ_HANDLED. This prevents the core IRQ subsystem from detecting an unhandl=
ed
stuck IRQ line and disabling it, which might lead to an interrupt storm and=
 a
hard lockup.

> +}

[ ... ]

> +static int cdns_mc_probe(struct platform_device *pdev)
> +{
> +struct edac_mc_layer layers[2];
> +	struct clk_bulk_data clks[2] =3D {
> +		{ .id =3D "ddrc" },
> +		{ .id =3D "pclk" },
> +	};

[ ... ]

> +	ret =3D devm_clk_bulk_get_enable(&pdev->dev, ARRAY_SIZE(clks), clks);

[Severity: High]
Does this code pass a stack pointer to the devres framework? The clks array=
 is
allocated on the local stack in cdns_mc_probe() in drivers/edac/cadence_eda=
c.c.
When passed to devm_clk_bulk_get_enable(), the devres framework stores this
pointer internally. If the device is later unbound or if a subsequent probe
step fails, the cleanup function will dereference this stale stack pointer =
to
disable the clocks, resulting in a use-after-free and likely a kernel panic.

[ ... ]

> +	/*
> +	 * Unmask ECC recoverable and unrecoverable interrupts, and port
> +	 * command errors.
> +	 */
> +	writel(CDNS_DDR_ECC_INT_CTRL_UNMASK(
> +		       CDNS_DDR_ECC_INT_STAT_CE | CDNS_DDR_ECC_INT_STAT_MULTIPLE_CE |
> +		       CDNS_DDR_ECC_INT_STAT_UE | CDNS_DDR_ECC_INT_STAT_MULTIPLE_UE |
> +		       CDNS_DDR_ECC_INT_STAT_PORT_CMD_CHAN),
> +	       priv->io_base + CDNS_DDR_ECC_INT_CTRL);

[Severity: Medium]
Are these interrupts properly disabled when the driver is removed? Hardware
interrupts are explicitly unmasked here in cdns_mc_probe() in
drivers/edac/cadence_edac.c, but there does not appear to be a .remove
callback or a custom devm action to mask them again. When the driver is
unbound, devres will deregister the software IRQ handler, but the hardware
will remain active. If the hardware asserts an interrupt after removal, it
will be unhandled.

> +
> +	edac_mc_chipset_printk(mci, KERN_DEBUG, DRV_NAME, "ECC %s",
> +			       (mci->edac_cap =3D=3D EDAC_FLAG_NONE) ? "disabled" : "enabled"=
);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-paul-v7-3-=
rc1-edac-v1-0-70be37c41a18@bootlin.com?part=3D2
