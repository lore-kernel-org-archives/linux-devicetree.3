Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474DD494819
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 13:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787319794; cv=none; b=gD9+Z9LwvOYN/e1G0Q2oWjtpkTTJkqP8Lzz26UrA5syvlVisvngmwwbqGNgwcnepQ0KIuMsRNq4dnBsIW1EJVSUsYLcH4BouT+WVAALxLJGdD3AiP7Jk2dXpwaz1BxqsLhTTCx+gDEszAlpDh2E91FpJb9vSUAC0+k382HppYYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787319794; c=relaxed/simple;
	bh=KGL19xcHivd/EJwx/HD/B968rmne2qRowxX7KCtoXmo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iqrOrWo5YyJz1ABJZrFv2lNXPwSny2aWenzbSb55XE3o5JHvfsJNYYom2M3e6p7kLxEJI7RDq9Y3OF5C1rmdKtWOqkFQxzYAlmnA6gQ3CU+mgB88yQJYdouSTR0MCHPFQML3KbWdEV8ou3ZskglqtZWIwLmsMHhe+OmkpGiq+Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S/xkuu5v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S/xkuu5v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 886C81F000E9;
	Fri, 21 Aug 2026 13:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787319785;
	bh=iyyLIHuEOXnshyuG4QL/dq5m5qA3/IGMMJ6DjTIxriY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S/xkuu5vYbKPJkZgZqTIAGyRTtrmwt1SLwlPV8acpsYTNa6a8033exeItMcz2aEAn
	 XnDbf1UU8c1A3hAc+2CryDpJ3a3+xZDWwmLWypwl5JrrTW4QugYcJ4SjySK6yMZEYu
	 XMyB25WOyacfDzSohMYaWt86Qcb5uZvdiJeFRLHYMKXsZiOGZOlDhRCJ42GHelb+X0
	 HwpUT2GoBmNFitrPJ4Dn2yRsipRz+MWU9CzlWDwcQxo0DH1sbq7lfCqdnJlcGADZCn
	 5uAa5N25C26F/l4qD1G6zrCPkAln9QCP/S5DyzaihD9iI/9mzIhYzmwB7ESAwaS1VV
	 QXG/J8I3qNVDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 12/18] spi: cadence-quadspi: enable PHY for indirect
 writes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, "Pratyush
 Yadav" <pratyush@kernel.org>, "Michael Walle" <mwalle@kernel.org>
In-Reply-To: <20260821114822.4040338-13-s-k6@ti.com>
References: <20260821114822.4040338-1-s-k6@ti.com>
 <20260821114822.4040338-13-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 13:43:04 +0000
Message-Id: <20260821134304.886C81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] PHY is enabled for indirect writes without verifying the operation=
's actual frequency, causing PHY timing mismatch at lower frequencies.
- [High] Ignoring the return value of `cqspi_wait_idle()` on the success pa=
th leaves the PHY enabled if a timeout occurs.
--

--- Patch [12]: [PATCH v8 12/18] spi: cadence-quadspi: enable PHY for indir=
ect writes ---
commit 573d2ac8c7923def59b134920cd9dc6bde273f1c
Author: Santhosh Kumar K <s-k6@ti.com>

spi: cadence-quadspi: enable PHY for indirect writes

This commit enables PHY for indirect writes larger than a minimum length
to amortize PHY enable/disable overhead. It threads post_config_max_speed_hz
into the indirect write execution path and attempts to safely disable the
PHY even if the write fails.

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c
[ ... ]
> @@ -1362,18 +1364,32 @@ static int cqspi_write_setup(struct cqspi_flash_p=
data *f_pdata,
> =20
>  static int cqspi_indirect_write_execute(struct cqspi_flash_pdata *f_pdat=
a,
>  					loff_t to_addr, const u8 *txbuf,
> -					const size_t n_tx)
> +					const size_t n_tx,
> +					u32 post_config_max_speed_hz)
>  {
>  	struct cqspi_st *cqspi =3D f_pdata->cqspi;
>  	struct device *dev =3D &cqspi->pdev->dev;
>  	void __iomem *reg_base =3D cqspi->iobase;
>  	unsigned int remaining =3D n_tx;
>  	unsigned int write_bytes;
> +	bool use_tuned_phy_write;
>  	int ret;
> =20
>  	if (!refcount_read(&cqspi->refcount))
>  		return -ENODEV;
> =20
> +	/* Use PHY only for large writes at the calibrated rate */
> +	use_tuned_phy_write =3D n_tx >=3D CQSPI_PHY_MIN_INDIRECT_WRITE_LEN &&
> +			      f_pdata->use_tuned_phy &&
> +			      f_pdata->phy_write_op.max_freq =3D=3D
> +				      post_config_max_speed_hz;

[Severity: High]
Will this apply high-frequency DLL calibrations to lower frequency operatio=
ns?

The driver dynamically configures the clock frequency per operation via
cqspi_configure() using op->max_freq. However, this condition checks if the
calibrated maximum frequency matches the post-configuration maximum speed,
rather than checking the current operation's actual frequency.

If an indirect write executes at a lower frequency than the calibrated
maximum, wouldn't this condition still evaluate to true and corrupt data
by applying mismatched PHY timing?

> +
> +	if (use_tuned_phy_write) {
> +		ret =3D cqspi_tune_phy(f_pdata, true);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	writel(to_addr, reg_base + CQSPI_REG_INDIRECTWRSTARTADDR);
>  	writel(remaining, reg_base + CQSPI_REG_INDIRECTWRBYTES);
[ ... ]
> @@ -1452,15 +1468,26 @@ static int cqspi_indirect_write_execute(struct cq=
spi_flash_pdata *f_pdata,
> =20
>  	cqspi_wait_idle(cqspi);
> =20
> +	if (use_tuned_phy_write)
> +		cqspi_tune_phy(f_pdata, false);
> +
>  	return 0;

[Severity: High]
If cqspi_wait_idle() times out here, does it leak the enabled PHY state?

The return value of cqspi_wait_idle() is ignored on this success path. If
a timeout occurs, the subsequent call to cqspi_tune_phy(f_pdata, false)
will immediately fail its internal idle check and fail to disable the PHY.

Since this function still returns 0 (success) in that scenario, the caller
is unaware of the failure, and subsequent non-PHY operations (like polling
the status register) will execute with the PHY unexpectedly active.

Should the return value of cqspi_wait_idle() be checked, or the error
properly handled so the PHY is successfully disabled?

> =20
>  failwr:
>  	/* Disable interrupt. */
>  	writel(0, reg_base + CQSPI_REG_IRQMASK);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821114822.4040=
338-1-s-k6@ti.com?part=3D12
