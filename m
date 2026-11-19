Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084367;
	b=qFEED754tYpo61OjT2awmTY7gya80oTcknZoOqF5KsxkBWJoUza0sturZpfFpawYUgvn
	 ZCbcnMqLMB8c/APQefxpID+aqYXwQrMUZ4Gs1jspbk+mV2B/lVj5zzBj0OcbWEC7rqWI4
	 Syk2Nu1uoew7vqDXcpSN9e42Tv4ITj9aSd618mjH6ioR87B8CZIz/K5ywQBExLy4zT47C
	 pYiBtRHcB+FfBfH0VV12V2irIQ8hQwnybFxp7KObSwoSHFeWRumXMlct3VNCYwoiNM/Zd
	 29Tm7ZUys+IJceheaSkDZ7vGP+v0MoQwQ8hWQcmb1+hi6NF29xIKZCm3R9ErZYldgeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084367;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Vjae6DN3vKKDs3BXIgwB9c8Junwn0cXFfpl9kUCZMF0=;
	b=2okDEu9deSYdM9aBPFu7xEM3sN894S6ccCD1mbXrloBEMSSdzVvbp2xVAVWG4vXfFgzK
	 HZzQEHboAkms7agDZ/80C8KMezkyOkgLwoyYFlfqnaSbkbe6MYUzl0/6HJejymIAkmzsC
	 wIn6WyRKBW+s/adRQq0e5suwEkQQakd0EUStu+RqYhkcCxXdXCpr12ZmyIDGr8x7GJ8Vi
	 9TJR2dYeKdfQ/MFXZ7aGJyLMFdbET1lQp4dHLdKErKomOdjYw7pZUeli6h4s915/UcTwB
	 RhujnnrxORd737/eElfJcJsIyu6KqRbhJt7B7t00TtW0HZk0oicr8uB8krc2pZiEp7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tmhb5Iuz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5E4606A324
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 10:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tmhb5Iuz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B72F81F000C6;
	Thu, 19 Nov 2026 10:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795084367;
	bh=Vjae6DN3vKKDs3BXIgwB9c8Junwn0cXFfpl9kUCZMF0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tmhb5Iuzh/Evo9JbtNdx9DTAAH8qJQCiN7Lv2bD05jMP2C7KBvIIRLXQdPHiRHoUE
	 kSUFkNkYJS/7Uo4kaT9LN+pcovwsV9XRczzxb+yXr/dbbGqRpQwJQT5wtXDlaB2krw
	 3lZFOe/XF66pSGm6q5tbfHo46XuIwDJUxHAsgaVOXqLvTWKznd3bE5T2FaE9zNmfpj
	 psNrsyBqPRFQOWIEsf94gmC0tvUVRKXW1xQLRFaZDQ7bpwtuA6IyD/2D7wIjfDyyyg
	 el0IApTBVcqgY1J8zqSmR3AxNZ17MojH33CEZWI2vWdvh4bIesmGJZ4P1KdDm1VmNZ
	 zCnM2lMLln28g==
Message-ID: <sashiko-outbox-222959@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/6] spi: dw-g2: Add XIP support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prakriti Sharma" <Prakriti.Sharma@synopsys.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119100513.433044-7-prakriti@synopsys.com>
References: <20261119100513.433044-1-prakriti@synopsys.com>
 <20261119100513.433044-7-prakriti@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 10:32:46 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 12 potential
issues to consider:
- [High] spi: dw-g2: broken NOR XIP write path in
  dw_spi_g2_dirmap_write()
- [High] spi: dw-g2: address truncation and shift overflow in
  dw_spi_g2_dirmap_read()
- [High] spi: dw-g2: ignored desc->info.offset and bounds overflow in
  dirmap ops
- [High] spi: dw-g2: stale XIP_CTRL and XIP_WRITE_CTRL left set for
  exec_mem_op
- [High] spi: dw-g2: MMIO write after reset and missing put in
  dw_spi_g2_mmio_remove()
- [Medium] spi: dw-g2: sampling mode bits clobbered after
  dw_spi_g2_set_sampling_mode()
- [Medium] spi: dw-g2: broken per-CS rx_sample_dly tracking and missing
  DT default
- [Medium] spi: dw-g2: 8-bit mask on 16-bit BAUDR in
  dw_spi_g2_update_ddr_drive_edge()
- [Medium] spi: dw-g2: dw_spi_g2_op_freq() ignores max_speed_hz and
  reg_op skips BAUDR
- [Medium] spi: dw-g2: missing dw_spi_g2_deinit() on probe failure leaks
  debugfs
- [Medium] spi: dw-g2: missing op validation in dirmap_create and
  unchecked errors
- [Low] spi: dw-g2: unused DMA struct fields and duplicate undocumented
  sysfs files
--

commit 31552d5f4b52b9bd42041e49fac8bf977363c65c
Author: Prakriti Sharma <Prakriti.Sharma@synopsys.com>

spi: dw-g2: Add XIP support

This commit adds memory-mapped execute-in-place (XIP) support via the
spi-mem direct-mapping interface, along with runtime mode controls, per-op
baud rate programming, and RX sampling configuration.

> diff --git a/drivers/spi/spi-dw-g2-core.c b/drivers/spi/spi-dw-g2-core.c
> index a94d4a7870dfd..2e265459381d1 100644
> --- a/drivers/spi/spi-dw-g2-core.c
> +++ b/drivers/spi/spi-dw-g2-core.c
[ ... ]
> @@ -152,28 +261,61 @@ int dw_spi_g2_setup(struct spi_device *spi)
>  	dw_spi_g2_target_disable(dws, dws->cs);
>  	dw_spi_g2_writel(dws->regs, DW_SPI_G2_BAUDR(dws->cs), baud);
> =20
> +	/* Configure RX sample delay for chip select */
> +	if (dws->cs < DW_SPI_G2_MAX_CS) {
> +		u32 rx_dly_ns;
> +
> +		if (device_property_read_u32(&spi->dev, "rx-sample-delay-ns",
> +					     &rx_dly_ns))
> +			rx_dly_ns =3D dws->def_rx_sample_dly_ns;
> +
> +		dws->rx_sample_dly[dws->cs] =3D
> +			DIV_ROUND_CLOSEST(rx_dly_ns,
> +					  NSEC_PER_SEC / dws->max_freq);
> +	}
[ ... ]
> @@ -230,6 +372,30 @@ static u32 dw_spi_g2_build_ctrlr0(struct dw_spi_g2 *=
dws, u8 tmod, u8 frf)
>  	return ctrlr0;
>  }
> =20
> +static void dw_spi_g2_controller_reset(struct dw_spi_g2 *dws)
> +{
> +	int drain =3D 0;
> +
> +	dw_spi_g2_enable(dws, false);
> +	dw_spi_g2_writel(dws->regs, DW_SPI_G2_SER, 0);
> +	dw_spi_g2_writel(dws->regs, DW_SPI_G2_ICR, DW_SPI_G2_ICR_ALL);
> +
> +	/* Drain any stale RX data left from previous transfers */
> +	while (dw_spi_g2_readl(dws->regs, DW_SPI_G2_RXFLR) > 0 &&
> +	       drain < dws->fifo_len) {
> +		(void)dw_spi_g2_readl(dws->regs, DW_SPI_G2_DR0);
> +		drain++;
> +	}
> +
> +	/* Update RX sample delay for current CS if value differs. */
> +	if (dws->cs < DW_SPI_G2_MAX_CS &&
> +	    dws->rx_sample_dly[dws->cs] !=3D dws->cur_rx_sample_dly) {
> +		dw_spi_g2_writel(dws->regs, DW_SPI_G2_RX_SAMPLE_DELAY(dws->cs),
> +				 dws->rx_sample_dly[dws->cs]);
> +		dws->cur_rx_sample_dly =3D dws->rx_sample_dly[dws->cs];
> +	}
> +}

[Severity: Medium]
Does tracking per-CS DW_SPI_G2_RX_SAMPLE_DELAY(dws->cs) registers with a
single scalar dws->cur_rx_sample_dly skip programming other chip selects?
If CS0 and CS1 share the same non-zero rx_sample_dly value, the first
transfer on CS0 updates dws->cur_rx_sample_dly, causing subsequent
transfers on CS1 to see a match and leave DW_SPI_G2_RX_SAMPLE_DELAY(1)
unprogrammed.

In addition, dws->def_rx_sample_dly_ns is never read from the controller
device node during probe, XIP transfers never call
dw_spi_g2_controller_reset() to program DW_SPI_G2_RX_SAMPLE_DELAY(dws->cs),
and dw_spi_g2_hw_init() does not reset the cached delay state after a
hardware reset.  Writing DW_SPI_G2_RX_SAMPLE_DELAY(dws->cs) directly in
dw_spi_g2_setup() and restoring it in dw_spi_g2_hw_init() would avoid the
stale cache.

[ ... ]

> @@ -629,6 +808,90 @@ static int dw_spi_g2_reg_op(struct dw_spi_g2 *dws, c=
onst struct spi_mem_op *op)
>  	return ret;
>  }
> =20
> +/**
> + * dw_spi_g2_op_freq - Choose the SPI clock frequency for a given op
> + * @dws: Driver state
> + * @op: SPI memory operation
> + *
> + * Prefer op->max_freq. If it is unset, use a conservative fraction of
> + * the controller clock rather than dws->max_freq, which can overclock
> + * a slow flash.
> + *
> + * Return: Frequency in Hz to program into BAUDR.
> + */
> +u32 dw_spi_g2_op_freq(struct dw_spi_g2 *dws,
> +		      const struct spi_mem_op *op)
> +{
> +	u32 f =3D op->max_freq;
> +
> +	if (!f)
> +		f =3D dws->max_freq / 8;
> +
> +	return f;
> +}

[Severity: Medium]
Can dw_spi_g2_op_freq() ignore the target device's spi-max-frequency?
Unlike spi_mem_exec_op(), the spi_mem_dirmap_create(),
spi_mem_dirmap_read(), and spi_mem_dirmap_write() paths do not run
spi_mem_adjust_op_freq() on desc->info.op_tmpl, so op->max_freq is 0 on
standard SPI-NOR and SPI-NAND dirmap templates.  Falling back to
dws->max_freq / 8 instead of dws->curr_spi->max_speed_hz (and not clamping
f to dws->curr_spi->max_speed_hz) can overclock flashes rated below
dws->max_freq / 8 or throttle faster flashes.

Also, while dw_spi_g2_mem_caps advertises .per_op_freq =3D true, neither
dw_spi_g2_reg_op_setup() nor dw_spi_g2_cmd_only_setup() calls
dw_spi_g2_program_baudr(), so small transfers handled by dw_spi_g2_reg_op()
and command-only ops run at whatever BAUDR the previous operation left
behind.

> +
> +/**
> + * dw_spi_g2_program_baudr - Program per-CS BAUDR for a given target freq
> + * @dws: Driver state
> + * @freq: Target SPI clock frequency in Hz
> + *
> + * SCKDV must be even (or 1 for passthrough). Must be called with SSI
> + * disabled. If @freq is 0, fall back to a conservative fraction of the
> + * controller clock. No-op if no valid frequency is available or the
> + * active CS is out of range.
> + */
> +void dw_spi_g2_program_baudr(struct dw_spi_g2 *dws, u32 freq)
> +{
> +	u32 div, baud;
> +
> +	if (dws->cs >=3D DW_SPI_G2_MAX_CS)
> +		return;
> +
> +	if (!freq)
> +		freq =3D dws->max_freq / 8;
> +	if (!freq)
> +		return;
> +
> +	div =3D DIV_ROUND_UP(dws->clk_rate, freq);
> +	if (div <=3D 1) {
> +		baud =3D 1;	/* Passthrough mode */
> +	} else {
> +		if (div & 1)
> +			div++;	/* SCKDV must be even */
> +		baud =3D div;
> +	}
> +
> +	dw_spi_g2_writel(dws->regs, DW_SPI_G2_BAUDR(dws->cs), baud);
> +}
> +
> +/**
> + * dw_spi_g2_update_ddr_drive_edge - Program per-CS DDR transmit drive e=
dge
> + * @dws: Driver state
> + * @op: SPI memory operation (must have a DDR/DTR phase)
> + *
> + * At BAUDR 1 or 2 the drive edge is set for edge-aligned data so the TX
> + * delay line can centre the clock; at higher divisors the register retu=
rns
> + * to 0 (edge-aligned with sclk_out, default DDR behaviour).
> + */
> +static void dw_spi_g2_update_ddr_drive_edge(struct dw_spi_g2 *dws,
> +					    const struct spi_mem_op *op)
> +{
> +	u32 baud;
> +
> +	if (!op->cmd.dtr && !op->addr.dtr && !op->data.dtr)
> +		return;
> +
> +	if (dws->cs >=3D DW_SPI_G2_MAX_CS)
> +		return;
> +
> +	baud =3D dw_spi_g2_readl(dws->regs, DW_SPI_G2_BAUDR(dws->cs)) & 0xFF;
> +	if (!baud)
> +		baud =3D 1;
> +
> +	dw_spi_g2_writel(dws->regs, DW_SPI_G2_DDR_DRIVE_EDGE(dws->cs),
> +			 (baud <=3D 2) ? 1 : 0);
> +}

[Severity: Medium]
Should dw_spi_g2_update_ddr_drive_edge() mask DW_SPI_G2_BAUDR(dws->cs) with
0xFFFF instead of 0xFF?  Because BAUDR is a 16-bit divisor register,
masking with 0xFF truncates any divisor >=3D 256 to its low byte and
misprograms DW_SPI_G2_DDR_DRIVE_EDGE(dws->cs) to 1 whenever the low byte is
0 or 2 (such as divisors 256 or 258).

In addition, dw_spi_g2_program_baudr() does not clamp baud to
DW_SPI_G2_MAX_BAUDR (65534) the way dw_spi_g2_setup() does, so a low
frequency producing div >=3D 65535 rounds up to 0x10000 and writes 0 into t=
he
16-bit divisor field.

[ ... ]

> @@ -823,9 +1106,25 @@ static void dw_spi_g2_indirect_write_setup(struct d=
w_spi_g2 *dws,
>  	if (op->addr.dtr || op->data.dtr)
>  		spictrlr0 |=3D DW_SPI_G2_SPI_CTRLR0_DDR_EN_MASK;
> =20
> +	/*
> +	 * For writes, sampling mode is less critical but enforce
> +	 * mutual exclusivity for consistency with read path.
> +	 */
> +	if (op->data.dtr) {
> +		dw_spi_g2_set_sampling_mode(dws, dws->cs,
> +					    DW_SPI_G2_SAMPLING_DATA_STROBE);
> +	} else {
> +		dw_spi_g2_set_sampling_mode(dws, dws->cs,
> +					    DW_SPI_G2_SAMPLING_RX_DELAY);
> +	}
>  	dw_spi_g2_writel(dws->regs, DW_SPI_G2_CTRLR0(dws->cs), ctrlr0);
>  	dw_spi_g2_writel(dws->regs, DW_SPI_G2_CTRLR1(dws->cs), 0);
>  	dw_spi_g2_writel(dws->regs, DW_SPI_G2_SPI_CTRLR0(dws->cs), spictrlr0);

[Severity: Medium]
Doesn't writing ctrlr0 and spictrlr0 here immediately overwrite the
register bits that dw_spi_g2_set_sampling_mode() just modified in hardware?
Because local spictrlr0 in dw_spi_g2_indirect_write_setup() never sets
DW_SPI_G2_SPI_CTRLR0_INST_RXDS_EN_MASK, the DW_SPI_G2_SPI_CTRLR0(dws->cs)
write clobbers the strobe bit set by dw_spi_g2_set_sampling_mode().

Similarly, in dw_spi_g2_indirect_read_setup(), dw_spi_g2_set_sampling_mode()
reads and writes the stale DW_SPI_G2_SPI_CTRLR0(dws->cs) value in hardware
right before it is overwritten with local spictrlr0, and in
dw_spi_g2_xip_setup() calling dw_spi_g2_set_sampling_mode() sets
DW_SPI_G2_SPI_CTRLR0_INST_RXDS_EN_MASK in DW_SPI_G2_SPI_CTRLR0(dws->cs)
after the XIP callers explicitly zeroed SPI_CTRLR0.

[ ... ]

> +int dw_spi_g2_dirmap_create(struct spi_mem_dirmap_desc *desc)
> +{
> +	struct spi_device *spi =3D desc->mem->spi;
> +	struct dw_spi_g2 *dws =3D spi_controller_get_devdata(spi->controller);
> +	const struct spi_mem_op *op =3D desc->info.op_tmpl;
> +	u32 ctrlr0;
> +	int ret;
> +
> +	if (!dws->xip_mem) {
> +		dev_dbg(dws->dev, "XIP memory region not available\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	dev_dbg(dws->dev, "dirmap_create: cmd=3D0x%02x addr_width=3D%u dir=3D%s=
 dummy=3D%u\n",
> +		op->cmd.opcode, op->addr.nbytes,
> +		op->data.dir =3D=3D SPI_MEM_DATA_IN ? "READ" : "WRITE",
> +		op->dummy.nbytes);
> +
> +	dws->cs =3D spi_get_chipselect(spi, 0);
> +	dws->curr_spi =3D spi;
> +
> +	/*
> +	 * Configure CTRLR0 with data frame size and SPI mode settings.
> +	 * XIP mode uses these settings for all memory-mapped accesses.
> +	 */
> +	dw_spi_g2_enable(dws, false);
> +	dw_spi_g2_target_disable(dws, dws->cs);
> +
> +	ctrlr0 =3D dw_spi_g2_build_ctrlr0(dws, DW_SPI_G2_CTRLR0_TMOD_TR,
> +					DW_SPI_G2_FRF_STANDARD);
> +	dw_spi_g2_writel(dws->regs, DW_SPI_G2_CTRLR0(dws->cs), ctrlr0);
> +
> +	/* Configure XIP registers for read/write operations */
> +	ret =3D dw_spi_g2_xip_setup(dws, op,
> +				  op->data.dir =3D=3D SPI_MEM_DATA_OUT);
> +	/*
> +	 * xip_setup enables the target (sets BIT(cs) in
> +	 * DEDICATED_CS_EN) to program per-CS registers.
> +	 * Clean it up so stale bits don't leak into
> +	 * cmd_only / reg_op operations on other CS lines.
> +	 * dirmap_read/write will re-enable when needed.
> +	 */
> +	dw_spi_g2_target_disable(dws, dws->cs);
> +	return ret;
> +}

[Severity: Medium]
Does dw_spi_g2_dirmap_create() validate the operation template before
accepting the direct mapping?  spi_mem_dirmap_create() calls
ctlr->mem_ops->dirmap_create() without calling supports_op first, and
neither dw_spi_g2_dirmap_create() nor dw_spi_g2_xip_setup() checks
dw_spi_g2_supports_mem_ops(desc->mem, op), dws->cs < DW_SPI_G2_MAX_CS,
op->cmd.nbytes <=3D 2, or op->addr.nbytes * 8U <=3D DW_SPI_G2_ADDR_L_MAX_BI=
TS.

Also, the return values of dw_spi_g2_xip_setup() (in
dw_spi_g2_dirmap_read(), dw_spi_g2_dirmap_write_nor_xip(), and
dw_spi_g2_dirmap_write()) and dw_spi_g2_wait_idle() (in
dw_spi_g2_cmd_only(), dw_spi_g2_dirmap_write_nor_xip(), and
dw_spi_g2_dirmap_write()) are ignored, masking setup errors and controller
timeouts as successful transfers.

> +
> +/**
> + * dw_spi_g2_dirmap_read - Direct memory-mapped read from flash
> + * @desc: Direct mapping descriptor
> + * @offs: Offset within the mapped region
> + * @len: Number of bytes to read
> + * @buf: Destination buffer
> + *
> + * Performs direct memory-mapped read using XIP mode. The controller
> + * automatically sends the configured command and address for each acces=
s.
> + * Supports 8/16/32-bit data frame sizes for optimal performance.
> + *
> + * Return: Number of bytes read on success, negative error code on failu=
re
> + */
> +ssize_t dw_spi_g2_dirmap_read(struct spi_mem_dirmap_desc *desc,
> +			      u64 offs, size_t len, void *buf)
> +{
> +	struct spi_device *spi =3D desc->mem->spi;
> +	struct dw_spi_g2 *dws =3D spi_controller_get_devdata(spi->controller);
> +	void __iomem *src;
> +	u32 ctrlr0;
> +
> +	dws->cs =3D spi_get_chipselect(spi, 0);
> +	dws->curr_spi =3D spi;
> +
> +	if (!dws->use_xip) {
> +		struct spi_mem_op op =3D *desc->info.op_tmpl;
> +		size_t chunk, done =3D 0;
> +		unsigned int dummy_shift =3D 0;
> +		int ret;
> +
> +		/* Clear XIP registers so they don't interfere with RO mode */
> +		dw_spi_g2_enable(dws, false);
> +		dw_spi_g2_writel(dws->regs, DW_SPI_G2_XIP_SER, 0);
> +		dw_spi_g2_writel(dws->regs, DW_SPI_G2_XIP_WR_SER, 0);
> +		dw_spi_g2_writel(dws->regs, DW_SPI_G2_XIP_CTRL(dws->cs), 0);
> +
> +		/*
> +		 * Fold dummy bytes into the address field.
> +		 *
> +		 * To handle WAIT_CYCLES in RO mode --
> +		 * the RX FIFO stays empty when WAIT_CYCLES > 0.  Work around
> +		 * this by absorbing the dummy phase into the address: shift the
> +		 * real address left by (dummy_nbytes * 8) bits and zero-pad.
> +		 * This makes WAIT_CYCLES=3D0 while the flash still receives the
> +		 * correct number of clock cycles before data.
> +		 *
> +		 * With TT1 (1-1-x), both address and folded-dummy bits travel
> +		 * on the standard single lane, so the flash sees:
> +		 *   [real addr MSB..LSB] [zero-pad dummy clocks] [data on x lanes]
> +		 */
> +		if (op.dummy.nbytes) {
> +			dummy_shift =3D op.dummy.nbytes * 8;
> +			op.addr.nbytes +=3D op.dummy.nbytes;
> +			op.dummy.nbytes =3D 0;
> +		}
> +
> +		while (done < len) {
> +			chunk =3D min_t(size_t, len - done, dws->fifo_len);
> +
> +			op.addr.val =3D (u64)(offs + done) << dummy_shift;
> +			op.data.nbytes =3D chunk;
> +			op.data.buf.in =3D (u8 *)buf + done;
> +
> +			ret =3D dw_spi_g2_indirect_read(dws, &op);
> +			if (ret)
> +				return ret;
> +
> +			done +=3D chunk;
> +		}
> +
> +		return (ssize_t)len;
> +	}

[Severity: High]
Doesn't folding op.dummy.nbytes into op.addr.nbytes and shifting
op.addr.val left by dummy_shift truncate the flash address in
dw_spi_g2_indirect_read()?  Because dws->use_xip defaults to false while
dw_spi_g2_dirmap_create() succeeds whenever dws->xip_mem is present,
default dirmap reads take this path and call dw_spi_g2_indirect_read(),
which casts chunk_op.addr.val to u32 and writes only a single 32-bit word:

drivers/spi/spi-dw-g2-core.c:dw_spi_g2_indirect_read() {
    ...
		if (chunk_op.addr.nbytes) {
			dw_spi_g2_writel(dws->regs, DW_SPI_G2_DR0,
					 (u32)chunk_op.addr.val);
			tx_entries++;
		}
    ...
}

Whenever the original op.addr.nbytes + op.dummy.nbytes exceeds 4 bytes
(such as a 3-byte or 4-byte SPI-NOR read with dummy bytes, or a 2-byte
SPI-NAND 1-4-4 read with 4 dummy bytes), shifting left by dummy_shift
pushes the upper address bits (or the entire address when
op.dummy.nbytes >=3D 4) past bit 31 where the u32 cast discards them, readi=
ng
from the wrong flash offset.  When op.dummy.nbytes >=3D 8 (such as Octal or
Octal DTR reads), dummy_shift >=3D 64 triggers an undefined 64-bit shift and
overflows the 4-bit DW_SPI_G2_SPI_CTRLR0_ADDR_L_MASK field in
dw_spi_g2_indirect_read_setup().  Moreover, when op.dummy.buswidth > 1 in
1-1-x (TT0) mode, op.dummy.nbytes is sized for the wider dummy buswidth
rather than a single address lane, so adding op.dummy.nbytes to
op.addr.nbytes sends the wrong number of dummy clock cycles.

> +
> +	if (!dws->xip_mem)
> +		return -EOPNOTSUPP;
> +
> +	if (offs + len > dws->xip_len)
> +		return -EINVAL;
> +
> +	/*
> +	 * Restore full XIP register state. An indirect transfer (from a
> +	 * prior mode switch) may have left CTRLR0 in TMOD_RO/TO and
> +	 * SPI_CTRLR0 with non-XIP framing, which corrupts XIP accesses.
> +	 */
> +	dw_spi_g2_enable(dws, false);
> +	dw_spi_g2_target_disable(dws, dws->cs);
> +	ctrlr0 =3D dw_spi_g2_build_ctrlr0(dws, DW_SPI_G2_CTRLR0_TMOD_TR,
> +					DW_SPI_G2_FRF_STANDARD);
> +	dw_spi_g2_writel(dws->regs, DW_SPI_G2_CTRLR0(dws->cs), ctrlr0);
> +	dw_spi_g2_writel(dws->regs, DW_SPI_G2_SPI_CTRLR0(dws->cs), 0);
> +	dw_spi_g2_writel(dws->regs, DW_SPI_G2_CTRLR1(dws->cs), 0);
> +	dw_spi_g2_xip_setup(dws, desc->info.op_tmpl, false);
> +
> +	src =3D dws->xip_mem + offs;

[Severity: High]
Shouldn't dw_spi_g2_dirmap_read() and dw_spi_g2_dirmap_write() add
desc->info.offset to offs?  In the spi-mem dirmap interface, offs is
relative to desc->info.offset; for example, spinand_create_dirmap() encodes
the plane select bit in info.offset, so ignoring desc->info.offset here
(and in the indirect fallback and write paths) causes multi-plane SPI-NAND
reads and writes on plane >=3D 1 to access plane 0 instead.

Also, dw_spi_g2_dirmap_create() never checks that desc->info.offset and
desc->info.length fit within dws->xip_len (preventing
spi_mem_dirmap_create() from falling back to non-dirmap ops when the flash
exceeds the XIP window), and the check offs + len > dws->xip_len in
dw_spi_g2_dirmap_read() and dw_spi_g2_dirmap_write() can wrap around on
64-bit unsigned addition.

> +
> +	/* Enable XIP mode for read */
> +	dw_spi_g2_writel(dws->regs, DW_SPI_G2_XIP_SER, BIT(dws->cs));
> +	dw_spi_g2_enable(dws, true);
> +
> +	/*
> +	 * PIO read from XIP window. The XIP engine turns each AHB read
> +	 * into a (cmd + addr + dummy + data) SPI transaction.
> +	 */
> +	memcpy_fromio(buf, src, len);
> +
> +	/* Disable XIP mode and clean up DEDICATED_CS_EN */
> +	dw_spi_g2_writel(dws->regs, DW_SPI_G2_XIP_SER, 0);
> +	dw_spi_g2_enable(dws, false);
> +	dw_spi_g2_target_disable(dws, dws->cs);
> +
> +	return (ssize_t)len;
> +}

[Severity: High]
Does leaving DW_SPI_G2_XIP_CTRL(dws->cs) and
DW_SPI_G2_XIP_WRITE_CTRL(dws->cs) non-zero after dw_spi_g2_dirmap_create(),
dw_spi_g2_dirmap_read(), and dw_spi_g2_dirmap_write() interfere with
subsequent dw_spi_g2_exec_mem_op() FIFO transfers?  As noted in the
comments in the indirect branches of dw_spi_g2_dirmap_read() and
dw_spi_g2_dirmap_write(), non-zero XIP_CTRL and XIP_WRITE_CTRL registers
cause the controller to misinterpret FIFO RO/TO-mode operations, yet
neither the XIP teardown paths nor the exec_mem_op setup helpers
(dw_spi_g2_cmd_only_setup(), dw_spi_g2_reg_op_setup(),
dw_spi_g2_indirect_read_setup(), dw_spi_g2_indirect_write_setup()) clear
those registers.

[ ... ]

> +ssize_t dw_spi_g2_dirmap_write(struct spi_mem_dirmap_desc *desc,
> +			       u64 offs, size_t len, const void *buf)
> +{
> +	struct spi_device *spi =3D desc->mem->spi;
> +	struct dw_spi_g2 *dws =3D spi_controller_get_devdata(spi->controller);
> +	void __iomem *dst;
> +	u32 ctrlr0;
> +	bool use_indirect =3D false;
> +
> +	dws->cs =3D spi_get_chipselect(spi, 0);
> +	dws->curr_spi =3D spi;
> +
> +	/*
> +	 * NOR Page Program (addr_nbytes >=3D 3) cannot ride the XIP-write
> +	 * engine in burst mode -- the engine emits one cmd+addr+data SPI
> +	 * transaction per AHB write but the SPI-NOR framework only issues
> +	 * WREN once before dirmap_write(), so every transaction past the
> +	 * first arrives with write-enable cleared and is silently dropped.
> +	 * NAND Program Load (addr_nbytes =3D=3D 2) is XIP-friendly because the
> +	 * on-die page buffer has no per-byte write-enable gating, so it goes
> +	 * to the NAND-XIP-BURST path below.
> +	 */
> +	if (!dws->use_xip || desc->info.op_tmpl->addr.nbytes >=3D 3)
> +		use_indirect =3D true;
> +
> +	/*
> +	 * NOR with XIP enabled: route through the byte-by-byte XIP-write
> +	 * helper so the XIP-write engine is exercised end-to-end.
> +	 */
> +	if (use_indirect && dws->use_xip && dws->xip_mem &&
> +	    desc->info.op_tmpl->addr.nbytes >=3D 3) {
> +		dev_info(dws->dev,
> +			 "dirmap_write: ROUTE=3DNOR-XIP cmd=3D0x%02x offs=3D0x%llx len=3D%zu\=
n",
> +			 desc->info.op_tmpl->cmd.opcode,
> +			 (unsigned long long)offs, len);
> +		return dw_spi_g2_dirmap_write_nor_xip(dws, desc, offs, len,
> +						      buf);
> +	}

[Severity: High]
Why does dw_spi_g2_dirmap_write() route NOR writes to
dw_spi_g2_dirmap_write_nor_xip() when the commit message states that NOR
page-program writes stay on the indirect FIFO path?

In dw_spi_g2_dirmap_write_nor_xip(), the controller driver bypasses the
spi-nor layer and hardcodes 1-1-1 SDR WREN (0x06) and RDSR1 (0x05) commands
along with 1-byte writeb() transactions for every byte:

drivers/spi/spi-dw-g2-core.c:dw_spi_g2_dirmap_write_nor_xip() {
	const struct spi_mem_op wren_op =3D SPI_MEM_OP(SPI_MEM_OP_CMD(DW_SPI_G2_NO=
R_OP_WREN, 1),
						     SPI_MEM_OP_NO_ADDR,
						     SPI_MEM_OP_NO_DUMMY,
						     SPI_MEM_OP_NO_DATA);
    ...
	for (i =3D 0; i < len; i++) {
		const struct spi_mem_op rdsr_op =3D
			SPI_MEM_OP(SPI_MEM_OP_CMD(DW_SPI_G2_NOR_OP_RDSR1, 1),
				   SPI_MEM_OP_NO_ADDR,
				   SPI_MEM_OP_NO_DUMMY,
				   SPI_MEM_OP_DATA_IN(1, &sr1, 1));
    ...
		ret =3D dw_spi_g2_cmd_only(dws, &wren_op);
}

This breaks flashes operating in 4-4-4 QPI, 8-8-8 Octal, or 8D-8D-8D Octal
DTR mode (where 1-1-1 SDR 0x06/0x05 commands are invalid and 1-byte page
programs violate 2-byte DTR / internal-ECC alignment), and it invokes
dw_spi_g2_cmd_only() (a TO-mode FIFO transfer) while
DW_SPI_G2_XIP_WRITE_CTRL(dws->cs) is still non-zero.

In addition, all three routing branches in dw_spi_g2_dirmap_write() call
dev_info() on every write call, which will flood the kernel log during
normal flash writes.

> diff --git a/drivers/spi/spi-dw-g2-mmio.c b/drivers/spi/spi-dw-g2-mmio.c
> index 6ef8f926e0eb9..9620ae6e5c23c 100644
> --- a/drivers/spi/spi-dw-g2-mmio.c
> +++ b/drivers/spi/spi-dw-g2-mmio.c
[ ... ]
> @@ -151,7 +386,29 @@ static int dw_spi_g2_mmio_probe(struct platform_devi=
ce *pdev)
>  	if (ret)
>  		goto err_pm;
> =20
> -	dev_info(&pdev->dev, "DW SSI G2 MMIO probed\n");
> +	ret =3D device_create_file(&pdev->dev, &dev_attr_xip_mode);
> +	if (ret)
> +		dev_warn(&pdev->dev,
> +			 "Failed to create xip_mode sysfs attribute: %d\n",
> +			 ret);
> +
> +	if (dws->xip_mem) {
> +		ret =3D device_create_file(&pdev->dev,
> +					 &dev_attr_xip_continuous_mode);
> +		if (ret)
> +			dev_warn(&pdev->dev,
> +				 "Failed to create xip_continuous_mode sysfs: %d\n",
> +				 ret);
> +
> +		ret =3D device_create_file(&pdev->dev,
> +					 &dev_attr_xip_prefetch_mode);
> +		if (ret)
> +			dev_warn(&pdev->dev,
> +				 "Failed to create xip_prefetch_mode sysfs: %d\n",
> +				 ret);
> +	}
> +	dev_info(&pdev->dev, "DW SSI G2 MMIO probed (mode=3D%s)\n",
> +		 dws->use_xip ? "XIP" : "indirect");
>  	return 0;
> =20
>  err_pm:

[Severity: Medium]
If devm_request_irq() or spi_register_controller() fails after
dw_spi_g2_init(dws) has created the debugfs directory and files, doesn't
jumping to err_reset or err_pm without calling dw_spi_g2_deinit(dws) leak
the debugfs entries?  Because spi_controller_put(ctlr) frees ctlr and the
embedded dws structure on that error path, the leaked debugfs files retain
dangling pointers to dws and dws->regset, causing a use-after-free if they
are accessed in debugfs.

> @@ -168,10 +425,14 @@ static void dw_spi_g2_mmio_remove(struct platform_d=
evice *pdev)
>  	struct spi_controller *ctlr =3D platform_get_drvdata(pdev);
>  	struct dw_spi_g2_mmio *dwsmmio =3D spi_controller_get_devdata(ctlr);
> =20
> +	device_remove_file(&pdev->dev, &dev_attr_xip_mode);
> +	device_remove_file(&pdev->dev, &dev_attr_xip_continuous_mode);
> +	device_remove_file(&pdev->dev, &dev_attr_xip_prefetch_mode);
>  	spi_unregister_controller(ctlr);
>  	dw_spi_g2_deinit(&dwsmmio->dws);
>  	pm_runtime_disable(&pdev->dev);
>  	reset_control_assert(dwsmmio->rstc);
> +	dw_spi_g2_enable(&dwsmmio->dws, false);
>  }

[Severity: High]
Doesn't calling dw_spi_g2_enable(&dwsmmio->dws, false) after
reset_control_assert(dwsmmio->rstc) write to DW_SPI_G2_SSIENR while the
controller is held in hardware reset?  On many SoCs, MMIO accesses to an IP
block with its reset line asserted trigger a synchronous external abort or
bus hang; disabling the controller should happen before asserting reset.

Also, dw_spi_g2_mmio_probe() allocates ctlr with non-managed
spi_alloc_host(), and spi_unregister_controller(ctlr) only drops the
reference taken by spi_register_controller(), so dw_spi_g2_mmio_remove()
still needs to call spi_controller_put(ctlr) to avoid leaking ctlr and
dwsmmio.

> diff --git a/drivers/spi/spi-dw-g2.h b/drivers/spi/spi-dw-g2.h
> index 3091697238d7d..162d233902982 100644
> --- a/drivers/spi/spi-dw-g2.h
> +++ b/drivers/spi/spi-dw-g2.h
[ ... ]
> @@ -260,9 +371,32 @@ struct dw_spi_g2 {
>  	struct completion       mem_done;
>  	int                     error;
> =20
> +	/* XIP (Direct Mapping) support */
> +	void __iomem		*xip_mem;
> +	resource_size_t		xip_phys;
> +	size_t			xip_len;
> +	bool			use_xip;
> +	bool			xip_continuous_mode;
> +	bool			xip_prefetch_mode;
> +
> +	/* Per-CS RX sample delay (in SSI clock cycles) */
> +	u8			rx_sample_dly[DW_SPI_G2_MAX_CS];
> +	u8			cur_rx_sample_dly;
> +	u32			def_rx_sample_dly_ns;
> +
>  	/* Flash type detection for timing workarounds */
>  	bool			is_nand;
> =20
> +
> +	/* DMA support for FIFO/Indirect operations (External DMA) */
> +	struct dma_chan		*tx_chan;
> +	struct dma_chan		*rx_chan;
> +	struct completion	tx_dma_complete;
> +	struct completion	rx_dma_complete;
> +	bool			use_dma_indirect;  /* DMA for FIFO operations */
> +	bool			use_dma_read;      /* DMA for XIP (placeholder) */
> +	u32			dma_caps;          /* DMA capability flags */
> +
>  #ifdef CONFIG_DEBUG_FS
>  	struct dentry *debugfs;
>  	struct debugfs_regset32 regset;
[ ... ]
> @@ -319,6 +456,17 @@ int dw_spi_g2_adjust_mem_op_size(struct spi_mem *mem=
, struct spi_mem_op *op);
> =20
>  irqreturn_t dw_spi_g2_irq(int irq, void *dev_id);
> =20
> +/* XIP/Direct mapping support */
> +int dw_spi_g2_dirmap_create(struct spi_mem_dirmap_desc *desc);
> +ssize_t dw_spi_g2_dirmap_read(struct spi_mem_dirmap_desc *desc,
> +			      u64 offs, size_t len, void *buf);
> +ssize_t dw_spi_g2_dirmap_write(struct spi_mem_dirmap_desc *desc,
> +			       u64 offs, size_t len, const void *buf);
> +
> +u32 dw_spi_g2_op_freq(struct dw_spi_g2 *dws,
> +		      const struct spi_mem_op *op);
> +void dw_spi_g2_program_baudr(struct dw_spi_g2 *dws, u32 freq);

[Severity: Low]
These seven DMA fields in struct dw_spi_g2 are unused in this patch, and
dw_spi_g2_dirmap_create(), dw_spi_g2_dirmap_read(),
dw_spi_g2_dirmap_write(), dw_spi_g2_op_freq(), dw_spi_g2_program_baudr(),
and dw_spi_g2_set_sampling_mode() are only used within
drivers/spi/spi-dw-g2-core.c and can be static.  Also,
dw_spi_g2_mmio_probe() creates undocumented sysfs attributes (xip_mode,
xip_continuous_mode, xip_prefetch_mode) via device_create_file() after
spi_register_controller() that duplicate the debugfs controls mentioned in
the commit message.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119100513.4330=
44-1-prakriti@synopsys.com?part=3D6
