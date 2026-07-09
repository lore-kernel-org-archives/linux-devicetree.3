Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783D2364943
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 15:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783610403; cv=none; b=fvG8pdxYTFL1/AjRg7T9bZTtYk3DQq9wPWoPjelaxSJsJyzZLPcTjAp1IVi2q/XDsjusCTI6BZbs0Ym65hNx5GizT9v5VqIbq1K7An1mtNKzdDzWHJGzcuCa2r0cLk3MG8t+e7DB9VmvgpcFd+m14c94ZO7ZIDbbHRw4HGtUM8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783610403; c=relaxed/simple;
	bh=UEkmvC/q4vEukLwG+Ow46ntUuHEXuSQPGkXWyaNAVfc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XgAnLoYVdUJTaNh5cmLgOvYnYz8y60zFfV3t+fmXjP/SbCZ0aC4ROwJ3bkoZ8LYuCQwlm5sP+HiOjBLanWCZAINJ43iwwMNVPRmjdmWNIUNqQTYMBVAXnYd55N30wAjrBQpDgSsLmgNDv6T/fU+C4OUINaYqyIZNlrzPpJURqVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LYUuB2df; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LYUuB2df"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D1E1F000E9;
	Thu,  9 Jul 2026 15:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783610401;
	bh=bujbwCVrYa9QgMI4R1VWXuDwlL+vyG5/n47qVFsByIM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LYUuB2dfw44xlWr/tYT9Fn/o6S6YG+n6ueumPlTprR7IOkvSGFlr0agMI6M/dh3ej
	 bG/gtbxMzVvRDS89D2tVRxhZ6PEl86hvVZetFXrPyFVNEDpI6IG6YFQnVnjrgTvFwI
	 04an7sAdvir8R7IDFB3BpIxSZR0tzxo0qPNOWql58WgWiTu5s6O3FeiCaEXYmDGGfQ
	 5hHXDpJoBsiEOONBj5eNWFov1tPgkLKjEupdzbOgHTWpFMrCXpGygzGZI5OvdOVnm8
	 6kwMWy1m31ry3vt+yKJt+eVAhG5wP4VYN9hwM7zeAc3MCCXGguJEdTk3pGu7AP64I/
	 txFdYO9Gj3QZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 09/11] spi: dw: detect enhanced spi mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709055204.138168-10-changhuang.liang@starfivetech.com>
References: <20260709055204.138168-1-changhuang.liang@starfivetech.com>
 <20260709055204.138168-10-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 15:20:00 +0000
Message-Id: <20260709152000.B1D1E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] detect_enh_mode() leaks detected multi-lane modes into ctlr->mode_=
bits on clock stretch test failure.
- [High] Advertising multi-bit SPI modes globally without supporting them i=
n dw_spi_transfer_one() causes standard multi-lane transfers to corrupt dat=
a.
- [High] The register writability test falsely detects OCTAL mode support o=
n QUAD-only hardware.
- [High] dw_spi_hw_init() blindly overwrites ctlr->mode_bits, wiping out dy=
namically established capabilities like SPI_LOOP after a suspend/resume cyc=
le.
--

--- Patch [9]: [PATCH v1 09/11] spi: dw: detect enhanced spi mode ---
commit 0f885f7a3380b812c7026e7502b6a3b2baf64278
Author: Sudip Mukherjee <sudip.mukherjee@sifive.com>

spi: dw: detect enhanced spi mode

All the SSI controllers supporting enhanced spi modes might not support
all the three dual or quad or octal modes. Detect the modes that are
supported and finally enable the DW_SPI_CAP_EMODE capability which will
start using all the enhanced spi functions that has been added.

> diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
> index 526b54385cd3e..ef1abb540f069 100644
> --- a/drivers/spi/spi-dw-core.c
> +++ b/drivers/spi/spi-dw-core.c
[ ... ]
> @@ -1083,6 +1083,64 @@ static void dw_spi_cleanup(struct spi_device *spi)
[ ... ]
> +static u16 detect_enh_mode(struct dw_spi *dws)
> +{
[ ... ]
> +	/* test octal mode */
> +	tmp_val =3D DW_SPI_CTRLR0_SPI_FRF_OCT_SPI << frf_shift;
> +	dw_writel(dws, DW_SPI_CTRLR0, tmp_val);
> +	if ((tmp_val & dw_readl(dws, DW_SPI_CTRLR0)) =3D=3D tmp_val)
> +		mode |=3D SPI_TX_OCTAL | SPI_RX_OCTAL;

[Severity: High]
Can this writability test falsely detect Octal mode support on Quad-only
hardware?

If the SPI_FRF field is 2 bits wide, Quad mode would require both physical
flip-flops to exist. When the driver tests for Octal mode by writing a value
that sets both bits, the readback will confirm both bits are set. This would
hold the value and trick the driver into assuming the IP supports internal
Octal logic when it may only be synthesized for Quad.

> +
> +	if (!mode)
> +		goto disable_enh;
> +
> +	/* test clock stretching */
> +	dw_writel(dws, DW_SPI_SPI_CTRLR0, DW_SPI_ENH_CTRLR0_CLK_STRETCH_EN);
> +	if ((DW_SPI_ENH_CTRLR0_CLK_STRETCH_EN & dw_readl(dws, DW_SPI_SPI_CTRLR0=
)) !=3D
> +	    DW_SPI_ENH_CTRLR0_CLK_STRETCH_EN)
> +		/*
> +		 * If clock stretching is not enabled then do not use
> +		 * enhanced mode.
> +		 */
> +		goto disable_enh;

[Severity: High]
Does this error path leak the detected multi-lane modes?

When the clock stretching test fails, the code jumps to the disable_enh lab=
el
without clearing the local mode variable. The non-zero mode bitmask is then
returned and unconditionally bitwise-ORed into ctlr->mode_bits by the calle=
r.

Could this falsely advertise multi-lane capabilities to the SPI subsystem
when the controller does not actually support enhanced mode?

> +
> +	dws->caps |=3D DW_SPI_CAP_EMODE;
> +
> +disable_enh:
> +	dw_writel(dws, DW_SPI_CTRLR0, tmp_ctrlr0);
> +	dw_writel(dws, DW_SPI_SPI_CTRLR0, tmp_spi_ctrlr0);
> +	dw_spi_enable_chip(dws, 1);
> +
> +	return mode;
> +}
[ ... ]
> @@ -1162,6 +1220,9 @@ static void dw_spi_hw_init(struct device *dev, stru=
ct dw_spi *dws)
[ ... ]
>  		dws->caps |=3D DW_SPI_CAP_DFS32;
>  	}
> =20
> +	dws->ctlr->mode_bits =3D SPI_CPOL | SPI_CPHA;

[Severity: High]
Does this direct assignment overwrite dynamically established capabilities?

During initial probe, dw_spi_add_controller() sets capabilities like:
    ctlr->mode_bits |=3D SPI_LOOP;

When the system resumes, dw_spi_resume_controller() calls dw_spi_hw_init():

drivers/spi/spi-dw-core.c:dw_spi_resume_controller() {
    ...
    dw_spi_hw_init(&dws->ctlr->dev, dws);
    ...
}

Will this blind assignment wipe out flags like SPI_LOOP after a
suspend/resume cycle?

> +	dws->ctlr->mode_bits |=3D detect_enh_mode(dws);

[Severity: High]
Does advertising these multi-bit SPI modes globally cause standard multi-la=
ne
transfers to corrupt data?

By adding these multi-lane modes to the controller's mode_bits, they are
exposed to standard (non-mem_ops) SPI transfers. If a user-space application
or kernel driver initiates a standard spi_transfer with tx_nbits > 1, the S=
PI
core will accept it.=20

However, looking at dw_spi_transfer_one(), the standard transfer handler
appears to ignore multi-lane requests and executes everything in 1-bit
standard mode:

drivers/spi/spi-dw-core.c:dw_spi_transfer_one() {
    ...
    .spi_frf =3D DW_SPI_CTRLR0_SPI_FRF_STD_SPI,
    ...
}

Will this result in data corruption and protocol mismatch on the SPI bus?

> +
>  	/* enable HW fixup for explicit CS deselect for Amazon's alpine chip */
>  	if (dws->caps & DW_SPI_CAP_CS_OVERRIDE)
>  		dw_writel(dws, DW_SPI_CS_OVERRIDE, 0xF);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709055204.1381=
68-1-changhuang.liang@starfivetech.com?part=3D9
