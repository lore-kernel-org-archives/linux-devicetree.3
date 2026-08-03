Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE9E386422
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 13:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785762166; cv=none; b=YGeY5AJ2dqLkLbEAuR3GDcMLtHxUSDnSICaOY/RVzegK7zFKbGBDDiUqOpljg2ZrdrKW7L+ByEobxcLWXe7rHM6hS2hBnnvjoSsDf3xo8+IbfJlEEbw2R0/66NO9/WqRH5YlbxM4LJG1kE/js366t2A8YiCsXzGMdExiqOFJi+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785762166; c=relaxed/simple;
	bh=X+ONgLmFJ7wfcEGbccW8EecOO6CMmLI5FEHfHld3OQs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B63lJeOY2DMrBaGXE3TLZ5Ku1XDW/bE0HY0LODeXuBtvMN6Hfz2ejF+tLnVkGxhKeQNc33ghIzvCfEGDqXbm1pt+wZPSdcyWRAme/cMl51qKcBBOIuBTjtBtGkh1cirC4SpEV0uOQNqL8A9m7z0DFdQqsKMMjqDO5FEokA9c7is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VV5dKYXJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VV5dKYXJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A642E1F000E9;
	Mon,  3 Aug 2026 13:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785762164;
	bh=qKfWCM8TYXgl00O+REo807SvAktKoS1zeKAMdiMYa3I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VV5dKYXJ5KiA3Nmrt3vx38VuuatY0Pb4Qx7p9Q8ztVKMtdxHTrpmaJQifZuDm90D5
	 QqVHFKat6URKsC3BzX9xdRyjm3EVKWz3sfkKh66apZnuEMCL0W7JikmPp9M81621B2
	 GAZg/CGAI0WZDi1f+JWn9t5Rv/lye7bkL3szJpwCe7CS8XvGC75vCfgZq0qTYfA2uw
	 PqAGLCGn6Fc5JkZIE4p3xASSNb8+TzMGERkZQ4rixYKsYGdgFPq/doNoL5ZxoyVqIp
	 DwwWzaXfmMwMdiGaFgYtijM/Kd8hGIGWCy4SgRbNDcS9344MUj6fWt8K9AQIz9Q8mf
	 nNTxOY22KESBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/11] spi: dw: update NDF while using enhanced spi
 mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260803124044.156998-6-changhuang.liang@starfivetech.com>
References: <20260803124044.156998-1-changhuang.liang@starfivetech.com>
 <20260803124044.156998-6-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 13:02:43 +0000
Message-Id: <20260803130244.A642E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `cfg.ndf` (Number of Data Frames) field is left uninitialize=
d (0) for Transmit Only operations in `dw_spi_exec_mem_op()`, causing the h=
ardware to be erroneously programmed to transmit 0 frames.
- [Medium] The condition to update the NDF register for Transmit Only mode =
incorrectly checks the static controller capability instead of the actual t=
ransfer format.
--

--- Patch [5]: [PATCH v2 05/11] spi: dw: update NDF while using enhanced sp=
i mode ---
commit 5891fe2f8ceff4e681ce6ee14b10868e4b3ce4bc
Author: Sudip Mukherjee <sudip.mukherjee@sifive.com>

spi: dw: update NDF while using enhanced spi mode

This commit updates the driver to configure the Number of Data Frames (NDF)
register during Transmit Only mode on enhanced SPI controllers. It modifies
dw_spi_update_config() to write cfg->ndf to DW_SPI_CTRLR1 when the transfer
mode is DW_SPI_CTRLR0_TMOD_TO and the controller supports enhanced SPI.

> diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
> index f1b7328fed772..d654cb748646a 100644
> --- a/drivers/spi/spi-dw-core.c
> +++ b/drivers/spi/spi-dw-core.c
> @@ -348,6 +348,9 @@ void dw_spi_update_config(struct dw_spi *dws, struct =
spi_device *spi,
>  	if (cfg->tmode =3D=3D DW_SPI_CTRLR0_TMOD_EPROMREAD ||
>  	    cfg->tmode =3D=3D DW_SPI_CTRLR0_TMOD_RO)
>  		dw_writel(dws, DW_SPI_CTRLR1, cfg->ndf ? cfg->ndf - 1 : 0);
> +	else if (cfg->tmode =3D=3D DW_SPI_CTRLR0_TMOD_TO &&
> +		 dws->caps & DW_SPI_CAP_EMODE)
> +		dw_writel(dws, DW_SPI_CTRLR1, cfg->ndf);

[Severity: Medium]
Will this write a 0 to DW_SPI_CTRLR1 for outbound memory operations?

Looking at dw_spi_exec_mem_op(), cfg is initialized to zero, and cfg.ndf is
only assigned for SPI_MEM_DATA_IN:

drivers/spi/spi-dw-core.c:dw_spi_exec_mem_op() {
	struct dw_spi_cfg cfg =3D {0};
	...
	if (op->data.dir =3D=3D SPI_MEM_DATA_IN) {
		cfg.tmode =3D DW_SPI_CTRLR0_TMOD_EPROMREAD;
		cfg.ndf =3D op->data.nbytes;
	} else {
		cfg.tmode =3D DW_SPI_CTRLR0_TMOD_TO;
	}
	...
}

For transmit operations (SPI_MEM_DATA_OUT), cfg.ndf remains 0 when it's pas=
sed
into dw_spi_update_config(), causing the hardware to be programmed to trans=
mit
0 frames.

[Severity: Medium]
Does this condition correctly identify an Enhanced SPI transfer?

Checking dws->caps & DW_SPI_CAP_EMODE verifies that the controller supports
Enhanced SPI, but it does not check if the current transfer is actually
using it.

Could this cause standard 1-bit SPI memory writes on EMODE-capable controll=
ers
to inappropriately update DW_SPI_CTRLR1 with cfg->ndf?

>  	/* Note DW APB SSI clock divider doesn't support odd numbers */
>  	clk_div =3D (DIV_ROUND_UP(dws->max_freq, cfg->freq) + 1) & 0xfffe;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803124044.1569=
98-1-changhuang.liang@starfivetech.com?part=3D5
