Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B7B47252F
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 11:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784807079; cv=none; b=BpczZUtvO7tNQ0CCNmjVcc08ZPBer6Wy7C00dxIuNr6tFC4zvhVfxkA30d2P+UyEEmQZfIwYPpBJwx85rMTmU0SKhX0XO6H14cCq7TLN//1O8xh+ZCW0TtJ3EXHFZ41vTCqrpmFUNc73FybJfsZ2LHZfC+4sVMpF8+gsgRTl8Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784807079; c=relaxed/simple;
	bh=sQ/1E/TUp6ZAqA1fdiKI+J9LCg6oMapUWprd4UHFCq0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gj2cymz28SiFXjSgJ83mgRSTZ4T848rVT0pHX+a+gJ66tOFpXpDEV5DgwtyVqC6kPatd8gVOY94Ye+twWrH1WX7V1vUKRnBRS5K2/vhBLQIcV0qhuj/mg4+a+0DNA26WzCoEvT+ecaESn3RYZ0s+9qGIj/DD8lHUP4RrY0fWPtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E981F000E9;
	Thu, 23 Jul 2026 11:44:32 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 12/17] spi: cadence-quadspi: enable PHY for indirect
 writes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: "Richard Weinberger" <richard@nod.at>, devicetree@vger.kernel.org, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Pratyush Yadav" <pratyush@kernel.org>, conor+dt@kernel.org, robh@kernel.org, "Michael
 Walle" <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>
In-Reply-To: <20260723110219.3180747-13-s-k6@ti.com>
References: <20260723110219.3180747-1-s-k6@ti.com>
 <20260723110219.3180747-13-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 11:44:27 +0000
Message-Id: <20260723114432.35E981F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] PHY tuning and configuration are illegally executed while the indi=
rect write controller is already active, causing a guaranteed timeout and h=
ardware state corruption.
- [High] Incorrect teardown order on the `failwr` error path causes a secon=
dary 500ms timeout by waiting for the controller to become idle while it is=
 still hung.
- [Medium] Reusing `cqspi_tune_phy()` for writes underflows the dummy cycle=
 count, injecting 31 unintended dummy cycles.
--

--- Patch [12]: [PATCH v6 12/17] spi: cadence-quadspi: enable PHY for indir=
ect writes ---
commit 37f2245caf607b9e33d418045174172a49f40271
Author: Santhosh Kumar K <s-k6@ti.com>

spi: cadence-quadspi: enable PHY for indirect writes

This commit enables PHY for indirect writes of at least 1KB that run at the
calibrated post-config frequency. It threads the max speed parameter into
the write execution path to match the read path's frequency guard.

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> index 35a4000739449..542ad331ff167 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c

[ ... ]

> @@ -1377,6 +1381,18 @@ static int cqspi_indirect_write_execute(struct cqs=
pi_flash_pdata *f_pdata,
>  	if (cqspi->apb_ahb_hazard)
>  		readl(reg_base + CQSPI_REG_INDIRECTWR);
> =20
> +	/* Use PHY only for large writes at the calibrated rate */
> +	use_tuned_phy_write =3D n_tx >=3D CQSPI_PHY_MIN_INDIRECT_WRITE_LEN &&
> +			      f_pdata->use_tuned_phy &&
> +			      f_pdata->phy_write_op.max_freq =3D=3D
> +				      post_config_max_speed_hz;
> +
> +	if (use_tuned_phy_write) {
> +		ret =3D cqspi_tune_phy(f_pdata, true);

[Severity: High]
Does this call to cqspi_tune_phy() happen after the hardware state machine
has already been started?

In cqspi_indirect_write_execute(), the CQSPI_REG_INDIRECTWR_START_MASK bit
is written to CQSPI_REG_INDIRECTWR just before this block. This activates
the state machine, making the controller busy as it waits for AHB data.=20

When cqspi_tune_phy() is called here, it eventually calls cqspi_wait_idle().
Will this create a deadlock where the CPU waits 500ms for the controller
to become idle, while the controller waits for the CPU to push data?

[Severity: Medium]
Does reusing cqspi_tune_phy() for writes cause an underflow of the dummy=20
cycle count?

The cqspi_tune_phy() function unconditionally decrements the dummy cycle co=
unt:

drivers/spi/spi-cadence-quadspi.c:cqspi_tune_phy() {
    ...
    dummy =3D FIELD_GET(CQSPI_REG_RD_INSTR_DUMMY_MASK
                      << CQSPI_REG_RD_INSTR_DUMMY_LSB,
                      reg);
    dummy--;
    ...
}

Since indirect writes typically have 0 dummy cycles, does this unsigned
decrement underflow to 255 and overwrite CQSPI_REG_RD_INSTR with 31=20
unintended dummy cycles?

> +		if (ret)
> +			goto failwr;
> +	}
> +
>  	while (remaining > 0) {
>  		size_t write_words, mod_bytes;
> =20

[ ... ]

> @@ -1425,9 +1441,15 @@ static int cqspi_indirect_write_execute(struct cqs=
pi_flash_pdata *f_pdata,
> =20
>  	cqspi_wait_idle(cqspi);
> =20
> +	if (use_tuned_phy_write)
> +		cqspi_tune_phy(f_pdata, false);
> +
>  	return 0;
> =20
>  failwr:
> +	if (use_tuned_phy_write)
> +		cqspi_tune_phy(f_pdata, false);
> +

[Severity: High]
Will this teardown order cause a secondary timeout during error recovery?

When the initial cqspi_tune_phy() call times out, execution jumps to the
failwr label. At this point, cqspi_tune_phy(..., false) is called before=20
the active indirect write is cancelled via CQSPI_REG_INDIRECTWR_CANCEL_MASK.

Since the controller is still actively waiting for data, does the mandatory=
=20
cqspi_wait_idle() call inside the PHY disable sequence also time out,=20
stalling the CPU for another 500ms?

>  	/* Disable interrupt. */
>  	writel(0, reg_base + CQSPI_REG_IRQMASK);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723110219.3180=
747-1-s-k6@ti.com?part=3D12
