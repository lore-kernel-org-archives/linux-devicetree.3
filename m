Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E798F43CEF2
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 11:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784806441; cv=none; b=PYUHpQrvVJin+AKRVArekd5/eJd5Y7w8/S9WI9l60NFMpLwBTCccGWrpqnRN7T6wo8TsQMAqlFCTXjsOMUYTguA3/uZSYP2tXvoJdRjdkF2SIHYHWdQB+UJgVrS4K9zmd9c488B+vscToVS97i/QeW81gCiXwwkecpvt8BSbSSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784806441; c=relaxed/simple;
	bh=IOMF6q/JCVg/prWVi0uI+qs6en0znDutobPn8+wLMPU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GWm8zq6+BgZcmOZicB9XcDXs6CryjgMfzC2AQ7yTpqPv57NoDiq5eSiZmPc9xExOi6dhjeRIw0fP9VTDdPcZY3CWImCmHkUHex49GJMMfKPMc43sCavKXq/Vj8TMbhdKseaTH9KjKO0gCefh8+CppoRz3X4Kbf55BVVpBdT+PM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gobs9/fn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gobs9/fn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5BB91F000E9;
	Thu, 23 Jul 2026 11:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784806437;
	bh=RHsYiZtl9xJhRyPzg/LDEqThKMatuGLCMoPTUWRduLM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gobs9/fn9pm6Z0bNdhwjKWcYPhOAankQUJcFZxWktlQ0llgQI/6cA39HGsyUy/R2p
	 0mXa4yQCJbIYfmfCfOHjDDy0Po11dtPaUGgVzzOWDsIRqzz05Wlk7dvSxRKM+JQqXG
	 Z5OwLuropH6lyICDeQGnrd6RgISk720rfzy1Y3YhoXbvqp7R+4s8t3poqcEWJ4d3CS
	 2CyOMmi2doSeRyRxIWpEqs6zF9fCVd8i+GEng8IQqVQ68A+4TWt4nICeG2kSusYucF
	 Feeq3D1STWi7tpYdtVGD3sgJnlwYsrrTdw9OGySSUTNDna+/0UcHQONEm1d33AS+qe
	 TfKO3dRSP36tw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 08/17] spi: cadence-quadspi: add PHY tuning support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: conor+dt@kernel.org, "Richard Weinberger" <richard@nod.at>, robh@kernel.org, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Michael
 Walle" <mwalle@kernel.org>, devicetree@vger.kernel.org, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>
In-Reply-To: <20260723110219.3180747-9-s-k6@ti.com>
References: <20260723110219.3180747-1-s-k6@ti.com>
 <20260723110219.3180747-9-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 11:33:56 +0000
Message-Id: <20260723113356.B5BB91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] Hardware registers configured for PHY tuning are unconditionally c=
lobbered by the driver's generic transfer routines.
- [High] Uninitialized variable `ret` is returned on the error path when sk=
ipping tuning, and offset 0 is incorrectly rejected.
- [High] The PHY tuning loops sweep over `read_delay` but fail to apply it =
to the hardware, rendering the delay search ineffective.
- [High] Unsafe `u8` arithmetic in the dual-region DDR tuning path can unde=
rflow, configuring out-of-bounds delays.
- [High] The tuning procedure mutates global controller registers and runs =
over a long duration without holding the SPI bus lock.
- [High] The tuning procedure directly mutates the caller's operation templ=
ates (`read_op` and `write_op`), corrupting them for subsequent uses.
- [Medium] CQSPI_REG_PHY_DLL_MASTER_INIT_DELAY is not cleared before ORing =
the new value, potentially accumulating stale bits.
- [Medium] Missing error check after the initial `rxlow` search in SDR tuni=
ng causes anomalous out-of-bounds execution.
- [Low] The field `phy_write_op` is populated but completely unused.
--

--- Patch [8]: [PATCH v6 08/17] spi: cadence-quadspi: add PHY tuning suppor=
t ---
commit 72b444b4b37e26e6d981401c000139a0fd3aac27
Author: Santhosh Kumar K <s-k6@ti.com>

spi: cadence-quadspi: add PHY tuning support

This commit adds an execute_tuning callback for delay-line calibration on
the Cadence QSPI controller. It performs a sweep of RX and TX delays to find
an optimal operating window for DDR and SDR protocols.

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> index 046fa5d69b0f7..22a5c88bbd8dc 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c
[ ... ]
> +static void cqspi_phy_set_dll_master(struct cqspi_st *cqspi)
> +{
> +	void __iomem *reg_base =3D cqspi->iobase;
> +	unsigned int reg;
> +
> +	reg =3D readl(reg_base + CQSPI_REG_PHY_DLL_MASTER);
> +	reg &=3D ~((CQSPI_REG_PHY_DLL_MASTER_DLY_ELMTS_LEN
> +		  << CQSPI_REG_PHY_DLL_MASTER_DLY_ELMTS_LSB) |
> +		 CQSPI_REG_PHY_DLL_MASTER_BYPASS |
> +		 CQSPI_REG_PHY_DLL_MASTER_CYCLE);
> +	reg |=3D ((CQSPI_REG_PHY_DLL_MASTER_DLY_ELMTS_3
> +		 << CQSPI_REG_PHY_DLL_MASTER_DLY_ELMTS_LSB) |
> +		CQSPI_REG_PHY_DLL_MASTER_CYCLE);
> +
> +	writel(reg, reg_base + CQSPI_REG_PHY_DLL_MASTER);
> +}
> +
> +static void cqspi_phy_pre_config(struct cqspi_st *cqspi,
> +				 struct cqspi_flash_pdata *f_pdata,
> +				 const bool bypass)
> +{
> +	void __iomem *reg_base =3D cqspi->iobase;
> +	unsigned int reg;
> +	u8 dummy;
> +
> +	cqspi_readdata_capture(cqspi, bypass, f_pdata->use_dqs,
> +			       f_pdata->phy_setting.read_delay);
> +
> +	reg =3D readl(reg_base + CQSPI_REG_CONFIG);
> +	reg &=3D ~(CQSPI_REG_CONFIG_PHY_EN | CQSPI_REG_CONFIG_PHY_PIPELINE);
> +	reg |=3D CQSPI_REG_CONFIG_PHY_EN;
> +	writel(reg, reg_base + CQSPI_REG_CONFIG);
> +
> +	reg =3D readl(reg_base + CQSPI_REG_RD_INSTR);
> +	dummy =3D FIELD_GET(CQSPI_REG_RD_INSTR_DUMMY_MASK
> +				  << CQSPI_REG_RD_INSTR_DUMMY_LSB,
> +			  reg);
> +	dummy--;
> +	reg &=3D ~(CQSPI_REG_RD_INSTR_DUMMY_MASK << CQSPI_REG_RD_INSTR_DUMMY_LS=
B);
> +	reg |=3D FIELD_PREP(CQSPI_REG_RD_INSTR_DUMMY_MASK
> +				  << CQSPI_REG_RD_INSTR_DUMMY_LSB,
> +			  dummy);
> +	writel(reg, reg_base + CQSPI_REG_RD_INSTR);

[Severity: High]
Will this register state survive the tuning reads? When
cqspi_phy_check_pattern() invokes spi_mem_exec_op(), the driver eventually
calls cqspi_configure() and other standard transfer routines. These routines
typically recalculate and overwrite CQSPI_REG_RD_INSTR, which could destroy
this dummy cycle decrement before the test pattern is actually read.
Furthermore, cqspi_configure() unconditionally invokes
cqspi_readdata_capture() during clock changes, which might wipe out the EDGE
bit and DQS settings.

> +
> +	cqspi_phy_set_dll_master(cqspi);
> +}
[ ... ]
> +static int cqspi_resync_dll(struct cqspi_st *cqspi)
> +{
> +	void __iomem *reg_base =3D cqspi->iobase;
> +	unsigned int reg;
> +	int ret;
> +
> +	ret =3D cqspi_wait_idle(cqspi);
> +	if (ret)
> +		return ret;
> +
> +	reg =3D readl(reg_base + CQSPI_REG_CONFIG);
> +	reg &=3D ~CQSPI_REG_CONFIG_ENABLE_MASK;
> +	writel(reg, reg_base + CQSPI_REG_CONFIG);
> +
> +	reg =3D readl(reg_base + CQSPI_REG_PHY_CONFIG);
> +	reg &=3D ~(CQSPI_REG_PHY_CONFIG_DLL_RESET | CQSPI_REG_PHY_CONFIG_RESYNC=
);
> +	writel(reg, reg_base + CQSPI_REG_PHY_CONFIG);
> +
> +	reg =3D readl(reg_base + CQSPI_REG_PHY_DLL_MASTER);
> +	reg |=3D (CQSPI_REG_PHY_DLL_MASTER_INIT_DELAY_VAL
> +		<< CQSPI_REG_PHY_DLL_MASTER_INIT_DELAY_LSB);
> +	writel(reg, reg_base + CQSPI_REG_PHY_DLL_MASTER);

[Severity: Medium]
Is it safe to bitwise OR the initial delay value without clearing the
existing bits first? If a bootloader or previous initialization left
non-zero bits in this register field, they will remain and intermix with
the new value, potentially leading to an unpredictable DLL master delay.

[ ... ]
> +static int cqspi_phy_apply_setting(struct cqspi_flash_pdata *f_pdata,
> +				   struct phy_setting *phy)
> +{
> +	struct cqspi_st *cqspi =3D f_pdata->cqspi;
> +	unsigned int reg;
> +	int ret;
> +
> +	reg =3D readl(cqspi->iobase + CQSPI_REG_READCAPTURE);
> +	reg |=3D BIT(CQSPI_REG_READCAPTURE_EDGE_LSB);
> +	writel(reg, cqspi->iobase + CQSPI_REG_READCAPTURE);
> +
> +	cqspi_set_dll(cqspi->iobase, phy->rx, phy->tx);
> +
> +	ret =3D cqspi_resync_dll(cqspi);
> +	if (ret)
> +		return ret;
> +
> +	f_pdata->phy_setting.rx =3D phy->rx;
> +	f_pdata->phy_setting.tx =3D phy->tx;
> +	f_pdata->phy_setting.read_delay =3D phy->read_delay;
> +	return 0;
> +}

[Severity: High]
Does this function need to write the read_delay to the hardware? The tuning
loops sweep over the read_delay parameter, but this only updates the
software state in f_pdata. Because the new read_delay is never written to
CQSPI_REG_READCAPTURE here, it seems the multidimensional tuning algorithm
might fail to test different read delays and run all tests at the initial
delay value.

[ ... ]
> +static int cqspi_phy_tuning_ddr(struct cqspi_flash_pdata *f_pdata,
> +				struct spi_mem *mem)
> +{
[ ... ]
> +	rxlow.tx =3D CQSPI_PHY_TX_LOOKUP_LOW_START;
> +	do {
> +		dev_dbg(dev, "Searching for Golden Primary rxlow on TX =3D %d\n",
> +			rxlow.tx);
> +		rxlow.read_delay =3D CQSPI_PHY_INIT_RD;
> +		ret =3D cqspi_find_rx_low_ddr(f_pdata, mem, &rxlow);

[Severity: High]
Could concurrent transactions from other SPI devices corrupt the PHY state
during this loop? The SPI core acquires the bus lock per exec_op inside
cqspi_phy_check_pattern(), meaning the lock is released between iterations.
If another SPI device performs a transfer between iterations, it might run
with the PHY incorrectly enabled and its cqspi_configure() call could
overwrite the global CQSPI_REG_READCAPTURE register, breaking the tuning
procedure.

[ ... ]
> +		/* Compare Manhattan distances: choose corner furthest from gap */
> +		if ((abs(gaplow.tx - bottomleft.tx) +
> +		     abs(gaplow.rx - bottomleft.rx)) <
> +		    (abs(gaphigh.tx - topright.tx) +
> +		     abs(gaphigh.rx - topright.rx))) {
> +			/* Topright further: Use Region 2, 16 taps inward */
> +			searchpoint =3D topright;
> +			searchpoint.tx -=3D 16;
> +			searchpoint.rx -=3D (16 * (topright.rx - bottomleft.rx)) /
> +					  (topright.tx - bottomleft.tx);

[Severity: High]
Can this integer math underflow? Because searchpoint.tx is a u8, if the
valid region corner topright.tx is less than 16, this subtraction could wrap
around to a large value like 240. This seems different from the
single-region path which uses clamp() and int casts to prevent wraparound.

[ ... ]
> +static int cqspi_phy_tuning_sdr(struct cqspi_flash_pdata *f_pdata,
> +				struct spi_mem *mem)
> +{
[ ... ]
> +	do {
> +		ret =3D cqspi_find_rx_low_sdr(f_pdata, mem, &rxlow);
> +
> +		if (ret)
> +			rxlow.read_delay++;
> +	} while (ret && rxlow.read_delay <=3D CQSPI_PHY_MAX_RD);
> +
> +	/* Find rxhigh: Decrement from RX=3D127 at same read_delay */
> +
> +	rxhigh.read_delay =3D rxlow.read_delay;
> +	ret =3D cqspi_find_rx_high_sdr(f_pdata, mem, &rxhigh, rxlow.rx);

[Severity: Medium]
Is a check for ret missing here after the while loop? If
cqspi_find_rx_low_sdr fails for all read delays, it exits the loop with
ret =3D -ENOENT. Without a check for ret, the code proceeds to use an
out-of-bounds read_delay and blindly invokes cqspi_find_rx_high_sdr().

[ ... ]
> +static int cqspi_write_pattern_to_cache(struct cqspi_flash_pdata *f_pdat=
a,
> +					struct spi_mem *mem,
> +					struct spi_mem_op *write_op)
> +{
> +	struct device *dev =3D &f_pdata->cqspi->pdev->dev;
> +	int ret;
> +
> +	write_op->data.nbytes =3D sizeof(phy_tuning_pattern);
> +	write_op->data.buf.out =3D phy_tuning_pattern;

[Severity: High]
Does this overwrite the caller's operation template in place? Modifying
write_op->data.buf.out directly alters the pointer belonging to the caller
(the SPI core or flash layer). This might corrupt the template for
subsequent transfers, causing the PHY tuning pattern to be written instead
of real data.

> +
> +	ret =3D spi_mem_exec_op(mem, write_op);
[ ... ]
> +static int cqspi_am654_ospi_execute_tuning(struct spi_mem *mem,
> +					   struct spi_mem_op *read_op,
> +					   struct spi_mem_op *write_op)
> +{
> +	struct cqspi_st *cqspi =3D
> +		spi_controller_get_devdata(mem->spi->controller);
> +	struct cqspi_flash_pdata *f_pdata;
> +	struct device *dev =3D &cqspi->pdev->dev;
> +	int ret;
> +
> +	f_pdata =3D &cqspi->f_pdata[spi_get_chipselect(mem->spi, 0)];
> +
> +	if (!mem->spi->post_config_max_speed_hz) {
> +		dev_dbg(dev,
> +			"No post-config frequency configured, skipping tuning\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (write_op) {
> +		ret =3D cqspi_write_pattern_to_cache(f_pdata, mem, write_op);
> +		if (ret) {
> +			dev_warn(dev,
> +				 "failed to write pattern to cache: %d, skipping tuning\n",
> +				 ret);
> +			goto out;
> +		}
> +
> +		f_pdata->phy_write_op =3D *write_op;

[Severity: Low]
Is f_pdata->phy_write_op ever read again? It appears to be populated here
but remains unused elsewhere in the driver.

> +	} else {
> +		if (!f_pdata->phy_pattern_partition_offset) {
> +			dev_warn(dev, "pattern partition not found, skipping tuning\n");
> +			goto out;
> +		}

[Severity: High]
If the pattern partition offset is intentionally 0, will this falsely reject
it? Also, jumping to out leaves ret uninitialized. Could this result in
returning garbage stack memory to the SPI core?

> +		read_op->addr.val =3D f_pdata->phy_pattern_partition_offset;
> +	}

[Severity: High]
Does modifying read_op->addr.val in place permanently alter the caller's SPI
template? Similar to the write_op modification, this could cause data
corruption if the caller reuses this template for subsequent operations.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723110219.3180=
747-1-s-k6@ti.com?part=3D8
