Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084082;
	b=cnBJMl7j5Z4FKIopzmER+CMYXJmMl/c8UzawlCfbBKO0r2E981jZ2+N7yagFubGSEh2T
	 UxYEE06N99ioMV9zPLYtX45SwCWtDwfwIq78qkkiQxy+cxd9N6WwgDF/T37m6j16Qw0xL
	 pskSN42L2c3g09JSivayHHdRaD3o7qsGc0m39Rd7wHNXPvCiIZEJrCeujpEkWDWf2++ka
	 qXlMNgfeq+eRmtZ73Vgo9RQGSWcrljmue4L4OaBXY3gvlNiuBmgVsPY+2OFDNo4Jme+ad
	 ljQatj6hjra4Zz4QyVysYy2o0LF9WI1Xe8K7GcZaVIQPpJWYETrvVn3FjOq+OuY+HLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084082;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1qPOZu3uBmKPGUmIncmgAL5lQ/AWe952rUvwTVhCFF4=;
	b=Dc/CsMKNncEiCDtVbCcGQv0UnolzmEBqZY0Y4xiECH6gkln8+5Zua3lxExXBYkj/iqTw
	 o09oDf/xuQsOKiGawl/FtrnG86G5W0oiQ5i5EKyp1w9lBS7YWpvjOE2oNWcNtrfOnHPqH
	 OuC+MCEXZW2si36OMkfAtik3n+moStl9SYxa51cyY6zjuraVNGOhI476xzVq+BXbNxVeu
	 7q9xxChY8Dm6cD75sx3AT8ehDZklaYxaMTsddu4JGQFpBeWVP3M38ngc5zfK5sONi0PkR
	 JcyvJu0WOayTqcYHLuelu1l3WyMMqvSE9kK1wVKUmB0xPlXc4ic9R+MfcdkhdFsYXUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CBNEmROt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C702E606A320
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 10:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CBNEmROt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 353521F000C5;
	Thu, 19 Nov 2026 10:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795084082;
	bh=1qPOZu3uBmKPGUmIncmgAL5lQ/AWe952rUvwTVhCFF4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CBNEmROtaMhuRP1x69p/ljnE61HFJnT258zGUOG+4FehGluNF4EDwJCDM5+EtEGaU
	 z32NeEKZQJyuiNx5USpjG/4t1gG1RO7vn7lf/virX8R72EWE9JpldHQVhCKFlWkF49
	 xfZxhRJXvZsXfrDNa2p+aecpiOePCLt+JJrOBxQtZ0flr7eC/uVVksDEl/N2neMSwv
	 mklxStUobEXqDZq4N4hmpPpEyb4c3RUT8Z2kTJzYsY9OuNyinBLsjv7UKD0PFxjN4I
	 yiXlCvpGCAFghV3t4fCHZBFq/9MN2Ufd5kVh/hPtXebj5Wa3gvMM1wkWb3uj2Mj9s4
	 5UGwPD07Y443g==
Message-ID: <sashiko-outbox-222953@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/6] spi: dw-g2: Add Synopsys DWC SSI v2.02a driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prakriti Sharma" <Prakriti.Sharma@synopsys.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119100513.433044-3-prakriti@synopsys.com>
References: <20261119100513.433044-1-prakriti@synopsys.com>
 <20261119100513.433044-3-prakriti@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 10:28:01 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 13 potential
issues to consider:
- [High] spi: dw-g2: dw_spi_g2_supports_mem_ops() accepts ops
  misexecuted by reg_op()
- [Medium] spi: dw-g2: debugfs init before bus_num allocation and leak
  on probe error
- [Medium] spi: dw-g2: missing SPI_CPOL and SPI_CPHA setup in
  dw_spi_g2_build_ctrlr0()
- [Medium] spi: dw-g2: missing spi_controller_put() in
  dw_spi_g2_mmio_remove()
- [Medium] spi: dw-g2: debugfs leak, UAF, and -1 bus_num in
  dw_spi_g2_mmio_probe()
- [Medium] spi: dw-g2: devm IRQ outlives reset and dws in probe() and
  remove()
- [Medium] spi: dw-g2: unwired dw_spi_g2_transfer_one() locks up CPU if
  called
- [Medium] spi: dw-g2: missing txe, txaf, and wsf IRQ requests in
  dw_spi_g2_mmio_probe()
- [Medium] spi: dw-g2: unvalidated num-cs and clobbered dws->caps in
  probe and init
- [Medium] spi: dw-g2: missing linux/bitfield.h include for FIELD_PREP()
- [Medium] spi: dw-g2: unchecked dw_spi_g2_wait_idle() and missing
  SR_TFE check
- [Low] spi: dw-g2: MAINTAINERS glob misses spi-dw-g2.h and bad
  kernel-doc markers
- [Low] spi: dw-g2: non-kernel-doc comments using /** in
  spi-dw-g2-core.c
--

commit 6b1bdfd4c5618c387e6d2d343a2ddf90fcf357ed
Author: Prakriti Sharma <Prakriti.Sharma@synopsys.com>

spi: dw-g2: Add Synopsys DWC SSI v2.02a driver

This commit adds the core and MMIO driver for the Synopsys DesignWare SSI
Gen2 (DWC_ssi v2.02a) SPI controller, supporting probe, command-only
transfers, and short register operations via polling.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index e68a4337a651a..e0f97d2792b1d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27310,6 +27310,7 @@ M:	Siddhant Kumar <sidkumar@synopsys.com>
>  L:	linux-spi@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/spi/snps,dwc-ssi-2.02a.yaml
> +F:	drivers/spi/spi-dw-g2-*.[ch]

[Severity: Low]
Does the hyphen before the wildcard cause get_maintainer.pl to miss
drivers/spi/spi-dw-g2.h?  Using drivers/spi/spi-dw-g2*.[ch] would match
both the header and the .c files.

> diff --git a/drivers/spi/spi-dw-g2-core.c b/drivers/spi/spi-dw-g2-core.c
> new file mode 100644
> index 0000000000000..7b0928f671033
> --- /dev/null
> +++ b/drivers/spi/spi-dw-g2-core.c
[ ... ]
> +static void dw_spi_g2_debugfs_init(struct dw_spi_g2 *dws)
> +{
> +	char name[32];
> +
> +	snprintf(name, sizeof(name), "dw_spi_g2.%d", dws->ctlr->bus_num);
> +
> +	dws->debugfs =3D debugfs_create_dir(name, NULL);
> +	if (!dws->debugfs)
> +		return;
> +
> +	dws->regset.base =3D dws->regs;
> +	dws->regset.regs =3D dw_spi_g2_dbg_regs;
> +	dws->regset.nregs =3D ARRAY_SIZE(dw_spi_g2_dbg_regs);
> +
> +	debugfs_create_regset32("registers", 0400, dws->debugfs, &dws->regset);
> +}

[Severity: Medium]
Does calling dw_spi_g2_debugfs_init() from dw_spi_g2_init() run before
spi_register_controller() assigns a dynamic bus_num?

When a Device Tree node has no spiN alias, dws->ctlr->bus_num is still -1
during dw_spi_g2_init(), so this creates /sys/kernel/debug/dw_spi_g2.-1
and collides if a second controller is present.  In addition,
debugfs_create_dir() returns an ERR_PTR() when debugfs is disabled or
fails, so checking !dws->debugfs does not catch errors (though
debugfs_create_regset32() handles an ERR_PTR() parent).

[ ... ]
> +static u32 dw_spi_g2_build_ctrlr0(struct dw_spi_g2 *dws, u8 tmod, u8 frf)
> +{
[ ... ]
> +	ctrlr0 |=3D
> +	    FIELD_PREP(DW_SPI_G2_CTRLR0_DFS_MASK, DW_SPI_G2_DFS_ENCODE(dfs));
> +	ctrlr0 |=3D FIELD_PREP(DW_SPI_G2_CTRLR0_TMOD_MASK, tmod);
> +	ctrlr0 |=3D FIELD_PREP(DW_SPI_G2_CTRLR0_FRF_MASK, frf);
> +
> +	return ctrlr0;
> +}

[Severity: Medium]
Should dw_spi_g2_build_ctrlr0() (and dw_spi_g2_update_config()) also set
DW_SPI_G2_CTRLR0_SCPOL and DW_SPI_G2_CTRLR0_SCPHA from spi->mode?

dw_spi_g2_init() advertises SPI_CPOL | SPI_CPHA in ctlr->mode_bits, but
neither function programs the polarity or phase bits into CTRLR0, forcing
all transfers to run in SPI Mode 0 and breaking communication with Mode
1, 2, or 3 devices.

[ ... ]
> +static int dw_spi_g2_xfer_fifo(struct dw_spi_g2 *dws,
> +			       const u8 *tx_buf, u32 tx_len,
> +			       u8 *rx_buf, u32 rx_len)
> +{
[ ... ]
> +	if (!rx_buf || !rx_len) {
> +		dw_spi_g2_wait_idle(dws);
> +		return 0;
> +	}
> +
> +	/* RX phase */
> +	timeout =3D jiffies + msecs_to_jiffies(1000);
> +	while (rx_got < rx_len) {
> +		sr =3D dw_spi_g2_readl(dws->regs, DW_SPI_G2_SR);
> +		if (sr & DW_SPI_G2_SR_RFNE) {
> +			rx_buf[rx_got++] =3D dw_spi_g2_readl(dws->regs,
> +							   DW_SPI_G2_DR0) &
> +			    0xff;
> +			timeout =3D jiffies + msecs_to_jiffies(1000);
> +		} else if (time_after(jiffies, timeout)) {
> +			dev_err(dws->dev,
> +				"xfer_fifo: RX timeout after %u/%u bytes (SR=3D0x%08x RXFLR=3D%u)\n",
> +				rx_got, rx_len,
> +				dw_spi_g2_readl(dws->regs, DW_SPI_G2_SR),
> +				dw_spi_g2_readl(dws->regs, DW_SPI_G2_RXFLR));
> +			return -ETIMEDOUT;
> +		}
> +		cpu_relax();
> +	}
> +
> +	dw_spi_g2_wait_idle(dws);
> +	return 0;
> +}

[Severity: Medium]
Can ignoring the return value of dw_spi_g2_wait_idle() here report false
success when a transfer times out, and can dw_spi_g2_wait_idle() return
before the TX FIFO has started shifting?

dw_spi_g2_wait_idle() in drivers/spi/spi-dw-g2.h only polls
!(sr & DW_SPI_G2_SR_BUSY) without checking (sr & DW_SPI_G2_SR_TFE).
Because SR_BUSY is driven by the serial shifter in the ssi_clk domain,
reading SR immediately after writing DR0 can observe SR_BUSY =3D=3D 0 while
bytes are still queued in the TX FIFO (SR_TFE =3D=3D 0), causing the caller=
's
dw_spi_g2_transfer_end() to clear SSIENR and abort the transfer early.
Also, if dw_spi_g2_wait_idle() times out, dw_spi_g2_xfer_fifo() discards
the -ETIMEDOUT error and returns 0.

[ ... ]
> +/**
> + * Command-only operations (WREN, WRDI, Chip Erase, Sector Erase, etc.)
> + * TMOD=3D1 (TX-Only) =E2=80=94 Send opcode + optional address, no data =
phase
> + */
[ ... ]
> +/**
> + * Indirect read operations
> + */
> +
> +/*
> + * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> + * SPI-MEM interface
> + * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> + */
> +
> +static bool dw_spi_g2_supports_mem_ops(struct spi_mem *mem,
> +				       const struct spi_mem_op *op)
> +{
> +	return spi_mem_default_supports_op(mem, op);
> +}

[Severity: Low]
The two section comments above ("Command-only operations..." and
"Indirect read operations") start with /** instead of /*, which triggers
scripts/kernel-doc warnings under W=3D1 builds.

[Severity: High]
Does dw_spi_g2_supports_mem_ops() accept operations that
dw_spi_g2_reg_op() and dw_spi_g2_cmd_only() cannot execute as requested?

Because ctlr->mode_bits advertises Dual, Quad, and Octal modes,
spi_mem_default_supports_op() accepts multi-wire operations, operations
with dummy cycles, and 2-byte opcodes.  However, dw_spi_g2_cmd_only_setup()
and dw_spi_g2_reg_op_setup() hardcode DW_SPI_G2_FRF_STANDARD (1-1-1 mode)
and write 0 to DW_SPI_G2_SPI_CTRLR0, and dw_spi_g2_reg_op() only sends a
1-byte opcode (tx_buf[0] =3D op->cmd.opcode) and omits op->dummy.nbytes
entirely, resulting in malformed flash transactions on the wire.  Even
after commit "spi: dw-g2: Add SPI-NAND support" and commit "spi: dw-g2:
Add indirect read and write", dw_spi_g2_is_reg_op() routes all transfers
up to 256 bytes into dw_spi_g2_reg_op() in 1-1-1 mode with 1-byte opcodes,
and TX register/command ops still drop dummy cycles.

[ ... ]
> +void dw_spi_g2_update_config(struct dw_spi_g2 *dws, struct spi_device *s=
pi,
> +			     struct dw_spi_g2_cfg *cfg)
> +{
> +	u32 ctrlr0 =3D 0;
> +	u32 div;
> +
> +	ctrlr0 |=3D FIELD_PREP(DW_SPI_G2_CTRLR0_DFS_MASK, cfg->dfs - 1);
> +	ctrlr0 |=3D FIELD_PREP(DW_SPI_G2_CTRLR0_TMOD_MASK, cfg->tmode);
> +
> +	dw_spi_g2_writel(dws->regs, DW_SPI_G2_CTRLR0(dws->cs), ctrlr0);
> +
> +	if (cfg->tmode =3D=3D DW_SPI_G2_CTRLR0_TMOD_RO)
> +		dw_spi_g2_writel(dws->regs, DW_SPI_G2_CTRLR1(dws->cs), cfg->ndf - 1);
> +
> +	div =3D DIV_ROUND_UP(dws->max_freq, cfg->freq);
> +	if (div & 1)
> +		div++;
> +	dw_spi_g2_writel(dws->regs, DW_SPI_G2_BAUDR(dws->cs), div);
> +}
> +
[ ... ]
> +int dw_spi_g2_transfer_one(struct spi_controller *ctlr, struct spi_devic=
e *spi,
> +			   struct spi_transfer *xfer)
> +{
[ ... ]
> +	dw_spi_g2_enable(dws, false);
> +	dw_spi_g2_update_config(dws, spi, &cfg);
> +
> +	dw_spi_g2_writel(dws->regs, DW_SPI_G2_TXFTLR, dws->fifo_len / 2);
> +	dw_spi_g2_writel(dws->regs, DW_SPI_G2_RXFTLR, (dws->fifo_len / 2) - 1);
> +
> +	dw_spi_g2_enable(dws, true);
> +
> +	local_irq_disable();
> +	/* Polling-based full-duplex transfer */
> +	while (dws->tx_len || dws->rx_len) {
> +		sr =3D dw_spi_g2_readl(dws->regs, DW_SPI_G2_SR);
> +
> +		/* Transmit if FIFO not full and bytes remaining */
> +		if (dws->tx_len && (sr & DW_SPI_G2_SR_TFNF)) {
> +			u8 val =3D 0;
> +
> +			if (dws->tx) {
> +				val =3D *(u8 *)dws->tx;
> +				dws->tx +=3D 1;
> +			}
> +			dw_spi_g2_writel(dws->regs, DW_SPI_G2_DR0, val);
> +			dws->tx_len--;
> +		}
> +
> +		/* Receive if FIFO not empty and bytes expected */
> +		if (dws->rx_len && (sr & DW_SPI_G2_SR_RFNE)) {
> +			u8 val =3D dw_spi_g2_readl(dws->regs, DW_SPI_G2_DR0);
> +
> +			if (dws->rx) {
> +				*(u8 *)dws->rx =3D val;
> +				dws->rx +=3D 1;
> +			}
> +			dws->rx_len--;
> +		}
> +		cpu_relax();
> +	}
> +	local_irq_enable();

[Severity: Medium]
Should dw_spi_g2_transfer_one() and dw_spi_g2_update_config() be removed
since ctlr->transfer_one is never wired up and neither symbol is exported?

If dw_spi_g2_transfer_one() is ever called, it never enables the target CS
block or asserts DW_SPI_G2_SER, so the hardware never shifts out the TX
FIFO and the unbounded loop under local_irq_disable() will hard-lock the
CPU waiting for DW_SPI_G2_SR_RFNE.  In addition, dw_spi_g2_update_config()
writes per-CS registers without disabling the target CS block and divides
by cfg->freq without guarding against 0.

> diff --git a/drivers/spi/spi-dw-g2-mmio.c b/drivers/spi/spi-dw-g2-mmio.c
> new file mode 100644
> index 0000000000000..6ef8f926e0eb9
> --- /dev/null
> +++ b/drivers/spi/spi-dw-g2-mmio.c
> @@ -0,0 +1,196 @@
[ ... ]
> +static int dw_spi_g2_mmio_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	/*
> +	 * IRQ.
> +	 *
> +	 * The DWC SSI Gen2 IP exposes per-source interrupt outputs
> +	 * alongside a combined ssi_intr. SoC integrators may route
> +	 * either the combined line, the individual lines, or any
> +	 * subset. We accept both DT forms:
> +	 *
> +	 *  - Named-line DT: one entry per output, with interrupt-names
> +	 *    in {"rxf","txe","txaf","wsf"}. Each line is requested
> +	 *    and bound to the shared dw_spi_g2_irq() decoder.
> +	 *  - Single-line DT: combined ssi_intr at index 0, used by
> +	 *    integrations that OR the sources in HW.
> +	 *
> +	 * Either way dws->irq holds the "primary" line (rxf when
> +	 * named, index 0 otherwise) so debugfs and PM paths stay
> +	 * source-agnostic.
> +	 */
> +	dws->irq =3D platform_get_irq_byname_optional(pdev, "rxf");
> +	if (dws->irq < 0)
> +		dws->irq =3D platform_get_irq(pdev, 0);
> +	if (dws->irq < 0) {
> +		ret =3D dws->irq;
> +		goto err_put;
> +	}

[Severity: Medium]
Where are the "txe", "txaf", and "wsf" interrupt lines requested when
named interrupts are used in Device Tree?

Both the commit message and the comment above state that each of {"rxf",
"txe", "txaf", "wsf"} is requested and bound to dw_spi_g2_irq(), but
dw_spi_g2_mmio_probe() only queries "rxf" (falling back to index 0 even if
"rxf" returned -EPROBE_DEFER) and calls devm_request_irq() once for
dws->irq.

[ ... ]
> +	reset_control_deassert(dwsmmio->rstc);
> +
> +	/* Read num-cs from device tree */
> +	ret =3D device_property_read_u32(&pdev->dev, "num-cs", &num_cs);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to read 'num-cs' property: %d\n", ret);
> +		goto err_reset;
> +	}
> +	ctlr->num_chipselect =3D num_cs;
> +
> +	dw_spi_g2_writel(dws->regs, DW_SPI_G2_SER, 0);
> +	dw_spi_g2_writel(dws->regs, DW_SPI_G2_DEDICATED_CS_EN,
> +			 GENMASK(ctlr->num_chipselect - 1, 0));
> +	dw_spi_g2_enable(dws, false);
> +	dw_spi_g2_writel(dws->regs, DW_SPI_G2_IMR, 0);
> +	/* Clear all interrupts by writing 1s to defined ICR bits */
> +	dw_spi_g2_writel(dws->regs, DW_SPI_G2_ICR, DW_SPI_G2_ICR_ALL);
> +
> +	/*
> +	 * Latch the static controller identity once. VERSION_ID and
> +	 * HW_CAPABILITIES are read-only and never change at runtime.
> +	 */
> +	dws->version_id =3D dw_spi_g2_readl(dws->regs, DW_SPI_G2_VERSION_ID);
> +	dws->hw_caps =3D dw_spi_g2_readl(dws->regs, DW_SPI_G2_HW_CAPABILITIES);
> +	dws->caps =3D dws->hw_caps;

[Severity: Medium]
Can an omitted or out-of-range num-cs property break probe or trigger
undefined shift behavior in GENMASK(ctlr->num_chipselect - 1, 0)?

In Documentation/devicetree/bindings/spi/snps,dwc-ssi-2.02a.yaml, num-cs
is optional with a valid range of 1..4, so probe should default num-cs
when absent and reject values outside 1..4 before evaluating GENMASK() or
indexing per-CS register blocks.  Also, the return value of
reset_control_deassert() is not checked before accessing MMIO registers,
and the writes to DW_SPI_G2_DEDICATED_CS_EN and dws->caps =3D dws->hw_caps
here are immediately overwritten with 0 by dw_spi_g2_init() below.

[ ... ]
> +	/* core init */
> +	ret =3D dw_spi_g2_init(dws);
> +	if (ret)
> +		goto err_reset;
> +
> +	ret =3D devm_request_irq(&pdev->dev, dws->irq, dw_spi_g2_irq, 0,
> +			       dev_name(&pdev->dev), dws);
> +	if (ret)
> +		goto err_reset;
> +
> +	pm_runtime_enable(&pdev->dev);
> +
> +	ret =3D spi_register_controller(ctlr);
> +	if (ret)
> +		goto err_pm;
> +
> +	dev_info(&pdev->dev, "DW SSI G2 MMIO probed\n");
> +	return 0;
> +
> +err_pm:
> +	pm_runtime_disable(&pdev->dev);
> +err_reset:
> +	reset_control_assert(dwsmmio->rstc);
> +err_put:
> +	spi_controller_put(ctlr);
> +	return ret;
> +}

[Severity: Medium]
Does failing at devm_request_irq() or spi_register_controller() leak the
debugfs directory created by dw_spi_g2_init() and leave a dangling
&dws->regset pointer after spi_controller_put(ctlr) frees ctlr?

Because err_pm and err_reset do not call dw_spi_g2_deinit(dws),
/sys/kernel/debug/dw_spi_g2.<bus_num>/registers remains registered
pointing to freed memory, causing a use-after-free if read.

[Severity: Medium]
Can dw_spi_g2_irq() fire after reset_control_assert() and
spi_controller_put(ctlr) on the err_pm error path (or after
reset_control_assert() in dw_spi_g2_mmio_remove())?

dws->irq is requested with devm_request_irq(), which is not freed until
after probe() or remove() returns, while ctlr (containing dws) is
allocated with the non-devm spi_alloc_host() and freed immediately at
err_put, and dwsmmio->rstc is asserted before devres releases the IRQ.

> +
> +static void dw_spi_g2_mmio_remove(struct platform_device *pdev)
> +{
> +	struct spi_controller *ctlr =3D platform_get_drvdata(pdev);
> +	struct dw_spi_g2_mmio *dwsmmio =3D spi_controller_get_devdata(ctlr);
> +
> +	spi_unregister_controller(ctlr);
> +	dw_spi_g2_deinit(&dwsmmio->dws);
> +	pm_runtime_disable(&pdev->dev);
> +	reset_control_assert(dwsmmio->rstc);
> +}

[Severity: Medium]
Does dw_spi_g2_mmio_remove() leak ctlr and dwsmmio?

ctlr is allocated with spi_alloc_host() rather than devm_spi_alloc_host(),
and spi_unregister_controller() only drops the registration reference from
device_add(), so the initial allocation reference is never released
without a matching spi_controller_put(ctlr) (or switching probe to
devm_spi_alloc_host()).

> diff --git a/drivers/spi/spi-dw-g2.h b/drivers/spi/spi-dw-g2.h
> new file mode 100644
> index 0000000000000..1106be0af7b65
> --- /dev/null
> +++ b/drivers/spi/spi-dw-g2.h
> @@ -0,0 +1,396 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
> +
> +#ifndef _SPI_DW_G2_H
> +#define _SPI_DW_G2_H
> +
> +#include <linux/spi/spi.h>
> +#include <linux/io.h>
> +#include <linux/device.h>
> +#include <linux/irqreturn.h>
> +#include <linux/iopoll.h>
> +#include <linux/spi/spi-mem.h>

[Severity: Medium]
Does drivers/spi/spi-dw-g2-core.c fail to build at this commit on
architectures that do not transitively include linux/bitfield.h?

dw_spi_g2_build_ctrlr0() and dw_spi_g2_update_config() use FIELD_PREP(),
but <linux/bitfield.h> is only added to drivers/spi/spi-dw-g2.h later in
commit "spi: dw-g2: Add XIP support", breaking bisection on architectures
such as x86_64 and riscv.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119100513.4330=
44-1-prakriti@synopsys.com?part=3D2
