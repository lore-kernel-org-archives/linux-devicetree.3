Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0AE4746C7
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 11:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784807317; cv=none; b=Buo2Rxdma1T2lKfG2uIqe5oStOYBvOq1D9sT1mACwuGNCHc7HPKiVEK00yq+b1OlqC7uGm9RBpDYk+uCAYtwCECQrGchpV0eRM91ON0TWlz6SAUZOh//Yammi9EwVsJtIgdBKNBYSPFqHmpjStkhyl/1SPPBA+ARYxoLCDqPRVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784807317; c=relaxed/simple;
	bh=9oAS8o+edDZBvSm1pnf5pZp4bZYJXvr1gZCOmAhOB3Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sjdeoBEBMtOXirnbOTZjU/FN3gcR84OF0EPL1Z1+Sp52aRCCq+aIaJUagXf2oP8UJpCPYb885dLxGOXrs+na+d+cCmt1AuNrK/xfIgX4JxrcnFBxsACuBE1vEG/5rfjp2utbpHF1glG0RyVfkrK0mIET74enVZ/13uLMhu7tZxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 926A11F00A3A;
	Thu, 23 Jul 2026 11:48:29 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 11/17] spi: cadence-quadspi: enable PHY for direct
 reads
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: robh@kernel.org, "Pratyush Yadav" <pratyush@kernel.org>, "Michael Walle" <mwalle@kernel.org>, "Richard
 Weinberger" <richard@nod.at>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, devicetree@vger.kernel.org, conor+dt@kernel.org, "Miquel
 Raynal" <miquel.raynal@bootlin.com>
In-Reply-To: <20260723110219.3180747-12-s-k6@ti.com>
References: <20260723110219.3180747-1-s-k6@ti.com>
 <20260723110219.3180747-12-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 11:48:25 +0000
Message-Id: <20260723114829.926A11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] Unaligned portions of a direct read are executed at max frequency =
without the tuned PHY, causing data corruption.
- [High] cqspi_tune_phy() modifies hardware configuration registers before =
ensuring the controller is idle.
- [Medium] Integer underflow when decrementing zero dummy cycles in cqspi_t=
une_phy().
- [Medium] Unhandled timeout in cqspi_tune_phy(true) leaves the PHY permane=
ntly enabled.
- [Medium] cqspi_direct_read_execute() ignores the return value of cqspi_tu=
ne_phy(false), potentially causing cascading DMA failures.

Pre-existing issues:
- [High] Indirect read/write functions mix stream I/O accessors with regist=
er accessors, corrupting data on big-endian systems.
--

--- Patch [11]: [PATCH v6 11/17] spi: cadence-quadspi: enable PHY for direc=
t reads ---
commit 4223586f65bba407ee59a0d012c45b1e0b10727f
Author: Santhosh Kumar K <s-k6@ti.com>

spi: cadence-quadspi: enable PHY for direct reads

Add cqspi_tune_phy() to toggle PHY mode. Enabling sets the calibrated
read-capture delay, asserts PHY_EN and PHY_PIPELINE, and decrements the
dummy cycle count by one since the PHY pipeline absorbs that latency.

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c

[ ... ]

> +static int cqspi_tune_phy(struct cqspi_flash_pdata *f_pdata, bool enable)
> +{
> +	struct cqspi_st *cqspi =3D f_pdata->cqspi;
> +	void __iomem *reg_base =3D cqspi->iobase;
> +	u32 reg;
> +	u8 dummy;
> +	int ret;
> +
> +	if (enable) {

[ ... ]

> +		reg =3D readl(reg_base + CQSPI_REG_CONFIG);
> +		reg |=3D CQSPI_REG_CONFIG_PHY_EN | CQSPI_REG_CONFIG_PHY_PIPELINE;
> +		writel(reg, reg_base + CQSPI_REG_CONFIG);

[Severity: High]
Should we verify the controller is idle before modifying these hardware
configuration registers?

cqspi_tune_phy() modifies CQSPI_REG_CONFIG and CQSPI_REG_RD_INSTR
immediately, but only calls cqspi_wait_idle() at the end of the function.

Modifying core configuration registers while the SPI controller might still
be internally active (like finishing the previous AHB read or de-asserting
CS) can hang the controller state machine.

> +
> +		/*
> +		 * The PHY data-capture pipeline absorbs one dummy cycle's
> +		 * worth of latency; reduce the count to avoid over-compensation.
> +		 */
> +		reg =3D readl(reg_base + CQSPI_REG_RD_INSTR);
> +		dummy =3D FIELD_GET(CQSPI_REG_RD_INSTR_DUMMY_MASK
> +					  << CQSPI_REG_RD_INSTR_DUMMY_LSB,
> +				  reg);
> +		dummy--;

[Severity: Medium]
Can this underflow if the command requires zero dummy cycles?

If a read command matching the maximum frequency has 0 dummy cycles,
unconditionally executing dummy-- will cause an underflow to 255.

Since FIELD_PREP masks this to the maximum field value, could this
configure the hardware to wait 31 dummy cycles instead of 0, resulting
in read corruption?

[ ... ]

> +	return cqspi_wait_idle(cqspi);
> +}

[Severity: Medium]
If this wait times out, does it leave the PHY permanently enabled?

When called with enable=3Dtrue, cqspi_tune_phy() modifies the hardware
registers and then waits for idle. If the wait times out, the error is
returned but the PHY_EN and PHY_PIPELINE bits remain set.

Could this leave the PHY permanently enabled for subsequent operations
that might not support it?

[ ... ]

> +	/* Split into unaligned head, aligned middle, unaligned tail */
> +	from_aligned =3D ALIGN(from, 16);
> +	to_aligned =3D ALIGN_DOWN(from + len, 16);
> +	len_aligned =3D to_aligned - from_aligned;
> +
> +	if (from !=3D from_aligned) {
> +		ret =3D cqspi_direct_read_dma(f_pdata, buf, from,
> +					    from_aligned - from);
> +		if (ret)
> +			return ret;
> +		buf +=3D from_aligned - from;
> +	}

[Severity: High]
Does this execute the unaligned head read at the maximum tuned frequency
without the PHY protection?

When a direct read operation is not 16-byte aligned, it is split into an
unaligned head, aligned middle, and unaligned tail. The driver explicitly
disables the tuned PHY for the head and tail portions, but it does not
seem to reduce the SPI clock frequency.

Could executing high-frequency reads without the calibrated PHY capture
delays result in setup/hold timing violations and sample garbage data?

> +
> +	if (len_aligned) {
> +		ret =3D cqspi_tune_phy(f_pdata, true);
> +		if (ret)
> +			return ret;
> +		ret =3D cqspi_direct_read_dma(f_pdata, buf, from_aligned,
> +					    len_aligned);
> +		cqspi_tune_phy(f_pdata, false);
> +		if (ret)
> +			return ret;

[Severity: Medium]
Is the return value of cqspi_tune_phy(false) intentionally ignored here?

If disabling the PHY fails due to a hardware wait timeout, the error is
discarded.

Could this cause the code to unconditionally proceed and start another DMA
transaction for the tail read on a controller that is in an unresponsive
state, leading to cascading failures?

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but do the indirect read and
write functions mix stream I/O accessors with register accessors?

Looking at cqspi_indirect_read_execute():

    unsigned int temp =3D ioread32(ahb_base);
    if (rxbuf) {
        memcpy(rxbuf, &temp, mod_bytes);
        rxbuf +=3D mod_bytes;
    }

The bulk transfers use stream semantics with no byteswapping, while these
remainder bytes use register semantics which includes CPU-to-device
byteswapping.

Will these mixed semantics cause the remainder bytes to be swapped
incorrectly and corrupt data on big-endian architectures?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723110219.3180=
747-1-s-k6@ti.com?part=3D11
