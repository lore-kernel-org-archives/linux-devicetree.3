Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795083924;
	b=12PMhNU5kYNv3nY0RFaaY9NqqZy41vNd5UPcbD0093PVPxH0iXERR1fVQDe53oasngzL
	 4jqQC+aO+laCn26JLNJ/Www2EOQZDI2XMCjyaX4/UWqmluHvk85qmtC7X3QcMbKBHWtK7
	 dax2eLFvEuVahyLcPNsUqA3s2IH/V/RYARt2HpMW6Y9t/bLB8LOArXliGTQ6zuCpL7HPU
	 26+NBYtoA//HlDw8L4Q2wEpMyBD/p+wUZ80tJZhcNoZM0cMB/VmRGOOaVFhIB4NPKR5po
	 D0dw8k4DXFYIY42YuZN/dIDWtv13QY8Km2erizpAkTCEh4LaYDa7yIZRbIebfwsk3Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083924;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RmDcfj6zrEExjiM64Bg7jVISnaxynt+5+9LR5tXC2EA=;
	b=36sBlZm+v0TFx+EqlB2tSVBSZ+5HrUEhW6hH9r4q+ShFG8sILv3uH4e/ogwALIsOM8FO
	 /mrsiYn2lzyaejmJXIvVjKk2YLsq2qLkRUoIuQJtVGlyOnm4StamcU1uvIQhoAa69D6UR
	 beMENLy2bY+di3iXX8apefv0uiZPEr9ZZ3Nx7bFLK2xaF38Jw5ngX6uz1+RhDDfMqgQsD
	 aGOIKatPlyqYMJFieZ8jgCMvk/W1dSwBpOJCjE7XF2ZNNRVnXAK8oZjj1BDItYWp1tSd4
	 RekDFVo5AVIVwu9z6Hqrg+kTtA3Rj+nNlhNoYXokJtCc/D/g6Sj6N2EBQCkdKST4Snw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GBa3dxpY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FFE60A2605
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 10:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GBa3dxpY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5401F000C7;
	Thu, 19 Nov 2026 10:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795083924;
	bh=RmDcfj6zrEExjiM64Bg7jVISnaxynt+5+9LR5tXC2EA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GBa3dxpYdpSAme+HYqwsHp6+Zjk/za06mQX+y+a23oSH5WGKKDckTe8+VIMJFfEEL
	 w/L+8nsWw++48m9X+T0G1/Ov8nAXHXkJNhUf32341r5QwNP4xtKDHvgCw37ZA1h5mw
	 28HE9VdldLJNgtxysyBr3WHMFF2boncSikDBaev5k5C3T5DMorBwI5lSdy6ahNz6Z9
	 ZwI/5K+n4L9BUWq0oHxVrTUIychQFND+pwGWOqDMOiJtgQAwtkSFBvRTJSh2fc68iS
	 b8/mh4w5IO4UmcRfCCB9E8bWW/YOu+DdVyw/d+LYxFyL5rdNgRI0y/T/0VO8fmJnR6
	 pYxCEDgk1oWAg==
Message-ID: <sashiko-outbox-222950@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/6] spi: dw-g2: Add SPI-NAND support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prakriti Sharma" <Prakriti.Sharma@synopsys.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119100513.433044-5-prakriti@synopsys.com>
References: <20261119100513.433044-1-prakriti@synopsys.com>
 <20261119100513.433044-5-prakriti@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 10:25:23 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 7 potential
issues to consider:
- [High] spi: dw-g2: dw_spi_g2_is_reg_op() routes multi-IO and DTR ops
  to 1-1-1 reg_op
- [High] spi: dw-g2: hidden CS-toggling chunks in
  dw_spi_g2_indirect_read() break NAND
- [High] spi: dw-g2: dw_spi_g2_reg_op() races SR_BUSY after CS assert
  and drops errors
- [High] spi: dw-g2: broken multi-IO/DTR writes, DTR wait cycles, and op
  validation
- [Medium] spi: dw-g2: dw_spi_g2_indirect_write() removes FIFO prefill
  before CS assert
- [Medium] spi: dw-g2: dws->is_nand is mutated unlocked and sticky
  across chip selects
- [Low] spi: dw-g2: unused write-only variable tx_entries in
  dw_spi_g2_indirect_read()
--

commit 9669d454b276956e6dd4740dc840ec3191c46b35
Author: Prakriti Sharma <Prakriti.Sharma@synopsys.com>

spi: dw-g2: Add SPI-NAND support

This commit updates the DW SSI G2 spi-mem implementation to handle SPI-NAND
devices by routing FIFO-sized operations through TR mode, chunking indirect
reads, and adding DTR support and a NAND CS settling delay.

> diff --git a/drivers/spi/spi-dw-g2-core.c b/drivers/spi/spi-dw-g2-core.c
> index c640d6a192600..a94d4a7870dfd 100644
> --- a/drivers/spi/spi-dw-g2-core.c
> +++ b/drivers/spi/spi-dw-g2-core.c
> @@ -262,9 +262,13 @@ static u32 dw_spi_g2_get_frf(const struct spi_mem_op=
 *op)
>   * dw_spi_g2_get_tt - Determine transfer type from operation bus widths
>   * @op: SPI memory operation
>   *
> - * The transfer type (TT) field in SPI_CTRLR0 defines which phases use
> - * multi-line mode. TT0 =3D standard (1-1-1), TT1 =3D data multi-line (1=
-1-x),
> - * TT2 =3D addr+data multi-line (1-x-x). TT3 (x-x-x) is not supported.
> + * TRANS_TYPE in SPI_CTRLR0 / XIP_CTRL controls only the instruction and
> + * address phases.  Data always uses the enhanced mode set by SPI_FRF in
> + * CTRLR0 (or FRF in XIP_CTRL).
> + *
> + *   TT0 (0x0): instruction standard, address standard  (1-1-x)
> + *   TT1 (0x1): instruction standard, address enhanced  (1-x-x)
> + *   TT2 (0x2): instruction enhanced, address enhanced  (x-x-x)
>   *
>   * Return: Transfer type value (0-2), or -EOPNOTSUPP for unsupported pat=
terns
>   */
> @@ -272,29 +276,37 @@ static int dw_spi_g2_get_tt(const struct spi_mem_op=
 *op)
>  {
>  	bool cmd_m =3D (op->cmd.buswidth > 1);
>  	bool addr_m =3D (op->addr.nbytes && op->addr.buswidth > 1);
> -	bool data_m =3D (op->data.nbytes && op->data.buswidth > 1);
> =20
> -	if (!cmd_m && !addr_m && !data_m)
> -		return DW_SPI_G2_TRANS_TYPE_TT0;	/* 1-1-1 */
> -	if (!cmd_m && !addr_m && data_m)
> -		return DW_SPI_G2_TRANS_TYPE_TT1;	/* 1-1-x */
> -	if (!cmd_m && addr_m && data_m)
> -		return DW_SPI_G2_TRANS_TYPE_TT2;	/* 1-x-x */
> +	if (!cmd_m && !addr_m)
> +		return DW_SPI_G2_TRANS_TYPE_TT0;	/* 1-1-x */
> +	if (!cmd_m && addr_m)
> +		return DW_SPI_G2_TRANS_TYPE_TT1;	/* 1-x-x */
> +	if (cmd_m && addr_m)
> +		return DW_SPI_G2_TRANS_TYPE_TT2;	/* x-x-x */
> =20
>  	return -EOPNOTSUPP;
>  }
> =20
>  /**
> - * dw_spi_g2_is_reg_op - Check if operation is a register read/write
> + * dw_spi_g2_is_reg_op - Check if operation fits in TR (transmit-receive=
) mode
> + * @dws: Driver state (provides runtime fifo_len)
>   * @op: SPI memory operation
>   *
> - * Register operations are single-byte commands with no address (e.g.,
> - * RDSR, WRSR, RDID). Data must fit within the fixed-size stack buffer.
> + * Routes operations through TR mode when total transfer size (cmd + add=
r +
> + * dummy + data) fits within the FIFO. This avoids RO mode with SPI_CTRL=
R0
> + * (enhanced SPI framing) which some platforms don't fully support.
> + *
> + * Limit is min(fifo_len, compile-time buffer size) to stay within both
> + * the hardware FIFO and the stack-allocated buffers in reg_op().
>   */
> -static inline bool dw_spi_g2_is_reg_op(const struct spi_mem_op *op)
> +static inline bool dw_spi_g2_is_reg_op(struct dw_spi_g2 *dws,
> +				       const struct spi_mem_op *op)
>  {
> -	return !op->addr.nbytes && op->data.nbytes > 0 &&
> -	       op->data.nbytes <=3D DW_SPI_G2_REG_OP_MAX_DATA;
> +	u32 total =3D op->cmd.nbytes + op->addr.nbytes +
> +		    op->dummy.nbytes + op->data.nbytes;
> +	u32 limit =3D min_t(u32, dws->fifo_len, DW_SPI_G2_REG_OP_BUF_SIZE);
> +
> +	return op->data.nbytes > 0 && total <=3D limit;
>  }

[Severity: High]
Does dw_spi_g2_is_reg_op() route multi-IO, DTR, and 2-byte-opcode
operations up to 256 bytes into the 1-1-1 standard SPI path in
dw_spi_g2_reg_op()?

dw_spi_g2_reg_op_setup() hardcodes DW_SPI_G2_FRF_STANDARD and writes 0 to
DW_SPI_G2_SPI_CTRLR0, so any Dual, Quad, Octal, or DTR operation whose
total length fits in min(dws->fifo_len, 256) (such as a 64-byte SPI-NAND
OOB read using 1-1-4 Quad Read From Cache 0x6b) is clocked out on a single
data wire in STR mode.

In addition, dw_spi_g2_reg_op() serializes only one byte of op->cmd.opcode
and sets echo_bytes =3D 1 + op->addr.nbytes + op->dummy.nbytes (truncating
2-byte opcodes), drops op->dummy.nbytes on SPI_MEM_DATA_OUT, and clocks
dummy bytes as 1-bit data on SPI_MEM_DATA_IN.  Conversely, a standard
1-1-1 read larger than dws->fifo_len falls through to
dw_spi_g2_indirect_read(), which sets DW_SPI_G2_FRF_STANDARD (where
SPI_CTRLR0 enhanced framing is inactive) while writing chunk_op.addr.val
as a single DR0 entry.

> @@ -483,49 +495,132 @@ static void dw_spi_g2_reg_op_setup(struct dw_spi_g=
2 *dws,
> =20
>  static int dw_spi_g2_reg_op(struct dw_spi_g2 *dws, const struct spi_mem_=
op *op)
>  {

[ ... ]

> +	/* Ensure all FIFO writes complete before CS assertion */
> +	wmb();
> +
> +	dw_spi_g2_cs_assert(dws, dws->cs);
> +
> +	/*
> +	 * CS settling delay for NAND flash:
> +	 *
> +	 * NAND flash requires a settling period after CS assertion before
> +	 * data transactions can begin reliably. This is a hardware timing requ=
irement.
> +	 *
> +	 * This is specific to NAND flash behavior where CS-to-valid-data timing
> +	 * is more stringent than NOR flash. The delay applies to small
> +	 * register operations (reg_op path) which are commonly used for:
> +	 * - READID (0x9F)
> +	 * - GET_FEATURE (0x0F)
> +	 * - SET_FEATURE (0x1F)
> +	 * - READ_STATUS (0x0F with feature address)
> +	 *
> +	 * Note: Only applies to NAND (detected via DT "spi-nand" compatible)
> +	 * to avoid performance impact on NOR flash.
> +	 */
> +	if (dws->is_nand) {
> +		/* Force a register read to ensure CS assertion propagates */
> +		(void)dw_spi_g2_readl(dws->regs, DW_SPI_G2_SR);
> +		usleep_range(10, 20);
> +	}
> +
> +	dw_spi_g2_wait_idle(dws);
> +
> +	/* For TR mode reads, harvest RX FIFO after the burst completes */
> +	if (op->data.dir =3D=3D SPI_MEM_DATA_IN) {
> +		u32 rxflr =3D dw_spi_g2_readl(dws->regs, DW_SPI_G2_RXFLR);
> +		u32 rx_got =3D min_t(u32, rxflr, tx_len);
> +
> +		/* Ensure RXFLR read completes before reading RX FIFO */
> +		rmb();
> +
> +		for (i =3D 0; i < rx_got; i++) {
> +			u8 val =3D dw_spi_g2_readl(dws->regs,
> +						 DW_SPI_G2_DR0) & 0xFF;
> +			if (i >=3D echo_bytes &&
> +			    (i - echo_bytes) < op->data.nbytes)
> +				((u8 *)op->data.buf.in)[i - echo_bytes] =3D val;
> +		}
> +
> +		if (rx_got < echo_bytes + op->data.nbytes) {
> +			dev_err(dws->dev,
> +				"reg_op RX short: got %u, need %u\n",
> +				rx_got, echo_bytes + op->data.nbytes);
> +			ret =3D -EIO;
> +		}
>  	}
> =20
>  	dw_spi_g2_transfer_end(dws);

[Severity: High]
Can dw_spi_g2_wait_idle() return before DW_SPI_G2_SR_BUSY asserts after
dw_spi_g2_cs_assert()?

dw_spi_g2_wait_idle() only checks !(sr & DW_SPI_G2_SR_BUSY) without
checking DW_SPI_G2_SR_TFE.  In DWC SSI hardware, writing SER does not set
SR_BUSY until SER synchronizes into the ssi_clk domain.  When dws->is_nand
is false (such as on SPI-NOR), polling SR immediately after
dw_spi_g2_cs_assert() can observe SR_BUSY =3D=3D 0 before shifting starts:
SPI_MEM_DATA_IN then reads RXFLR =3D=3D 0 and fails with -EIO, while
SPI_MEM_DATA_OUT calls dw_spi_g2_transfer_end() and aborts the transfer
while the TX FIFO is still full.

Also, dw_spi_g2_wait_idle()'s return value is ignored, so a busy timeout
on SPI_MEM_DATA_OUT silently returns 0.

> @@ -615,14 +710,17 @@ static int dw_spi_g2_indirect_read_setup(struct dw_=
spi_g2 *dws,
>   * @dws: Driver state
>   * @op: SPI memory operation
>   *
> - * Reads data from flash using RO (receive-only) mode.
> + * Reads data from flash using RO (receive-only) mode with enhanced SPI
> + * framing via SPI_CTRLR0.
>   * Return: 0 on success, negative error code on failure
>   */
>  static int dw_spi_g2_indirect_read(struct dw_spi_g2 *dws,
>  				   const struct spi_mem_op *op)
>  {
> -	u32 tx_entries;
> +	struct spi_mem_op chunk_op;
>  	u8 dummy_buf =3D 0;
> +	u32 total, done =3D 0;
> +	u32 tx_entries;
>  	int ret;
> =20
>  	if (!op->data.nbytes) {
> @@ -635,35 +733,67 @@ static int dw_spi_g2_indirect_read(struct dw_spi_g2=
 *dws,
>  		return -EINVAL;
>  	}
> =20
> -	ret =3D dw_spi_g2_indirect_read_setup(dws, op);
> -	if (ret)
> -		return ret;
> +	total =3D op->data.nbytes;
> +	dev_dbg(dws->dev, "indirect_read: cmd=3D0x%02x addr=3D0x%llx len=3D%u\n=
",
> +		op->cmd.opcode, op->addr.val, total);
> =20
> -	dw_spi_g2_target_enable(dws, dws->cs);
> -	dw_spi_g2_enable(dws, true);
> +	/*
> +	 * Split into chunks no larger than dws->fifo_len so the RX FIFO
> +	 * never overflows. Each iteration reprograms CTRLR1/NDF and
> +	 * re-issues cmd+addr with the column advanced. A single
> +	 * >fifo_len request leaves the controller idle (SR.BUSY=3D0,
> +	 * RXFLR=3D0) after the first FIFO worth of data, causing an
> +	 * RX timeout.
> +	 */
> +	chunk_op =3D *op;
> +
> +	while (done < total) {
> +		u32 chunk =3D min_t(u32, total - done, dws->fifo_len);
> +
> +		chunk_op.addr.val =3D op->addr.val + done;
> +		chunk_op.data.nbytes =3D chunk;
> +		chunk_op.data.buf.in =3D (u8 *)op->data.buf.in + done;
> =20
> -	tx_entries =3D 0;
> +		ret =3D dw_spi_g2_indirect_read_setup(dws, &chunk_op);
> +		if (ret)
> +			return ret;
> +
> +		dw_spi_g2_target_enable(dws, dws->cs);
> +		dw_spi_g2_enable(dws, true);
> =20
> -	/* Write instruction */
> -	dw_spi_g2_writel(dws->regs, DW_SPI_G2_DR0, op->cmd.opcode);
> -	tx_entries++;
> +		tx_entries =3D 0;
> =20
> -	/* Write address as a packed 32-bit value (one FIFO entry) */
> -	if (op->addr.nbytes) {
> -		dw_spi_g2_writel(dws->regs, DW_SPI_G2_DR0, (u32)op->addr.val);
> +		/* Write instruction to DR0 */
> +		dw_spi_g2_writel(dws->regs, DW_SPI_G2_DR0,
> +				 chunk_op.cmd.opcode);
>  		tx_entries++;
> -	}
> =20
> -	/* Assert CS - controller begins: sends TX FIFO, then receives */
> -	dw_spi_g2_cs_assert(dws, dws->cs);
> +		/*
> +		 * Write address as a single packed value.
> +		 * In enhanced SPI framing (RO mode with SPI_CTRLR0), the
> +		 * hardware extracts ADDR_L bits from this write.
> +		 */
> +		if (chunk_op.addr.nbytes) {
> +			dw_spi_g2_writel(dws->regs, DW_SPI_G2_DR0,
> +					 (u32)chunk_op.addr.val);
> +			tx_entries++;
> +		}

[Severity: Low]
tx_entries is assigned and incremented here, but never read, which triggers
a -Wunused-but-set-variable compiler warning.

> =20
> -	/* Receive data via polling */
> -	ret =3D dw_spi_g2_xfer_fifo(dws, &dummy_buf, 0,
> -				  op->data.buf.in, op->data.nbytes);
> -	dw_spi_g2_transfer_end(dws);
> -	dw_spi_g2_controller_reset(dws);
> +		/* Assert CS - controller begins: sends TX FIFO, then receives */
> +		dw_spi_g2_cs_assert(dws, dws->cs);
> =20
> -	return ret;
> +		/* Receive data via polling */
> +		ret =3D dw_spi_g2_xfer_fifo(dws, &dummy_buf, 0,
> +					  chunk_op.data.buf.in, chunk);
> +		dw_spi_g2_transfer_end(dws);
> +		dw_spi_g2_controller_reset(dws);
> +		if (ret)
> +			return ret;
> +
> +		done +=3D chunk;
> +	}
> +
> +	return 0;
>  }

[Severity: High]
Won't splitting a single spi_mem_op across multiple CS assertions here while
raising DW_G2_MAX_CHUNK to 64 KB break SPI-NAND continuous reads?

In drivers/mtd/nand/spi/core.c, spinand_read_from_cache_op() relies on
adjust_op_size() clamping op->data.nbytes to the controller's single-CS
transfer limit so it can fall back to buffered page reads when a continuous
read cannot complete in one CS assertion.  On Winbond W25N01JW, continuous
read is enabled by default and uses a 1-byte dummy address (addr.nbytes =3D=
 1,
addr.val =3D 0) while streaming from column 0 for as long as CS stays low;
toggling CS every dws->fifo_len bytes aborts the continuous stream in the
flash and overflows the 1-byte dummy address once done >=3D 256.

If the controller cannot receive more than dws->fifo_len bytes in one CS
assertion, dw_spi_g2_adjust_mem_op_size() should clamp SPI_MEM_DATA_IN to
dws->fifo_len so the spi-mem and spinand callers advance the address and
manage CS boundaries themselves.

> @@ -676,20 +806,26 @@ static int dw_spi_g2_indirect_read(struct dw_spi_g2=
 *dws,
>   * @dws: Driver state
>   * @op: SPI memory operation
>   *
> - * Sets up TMOD=3DTO (transmit-only), standard SPI mode.
> + * Sets up TMOD=3DTO (transmit-only)
>   */
>  static void dw_spi_g2_indirect_write_setup(struct dw_spi_g2 *dws,
>  					   const struct spi_mem_op *op)
>  {
>  	u32 ctrlr0 =3D dw_spi_g2_build_ctrlr0(dws, DW_SPI_G2_CTRLR0_TMOD_TO,
>  					    DW_SPI_G2_FRF_STANDARD);
> +	u32 spictrlr0 =3D 0;
> =20
>  	dw_spi_g2_controller_reset(dws);
>  	dw_spi_g2_target_disable(dws, dws->cs);
> =20
> +	if (op->cmd.dtr)
> +		spictrlr0 |=3D DW_SPI_G2_SPI_CTRLR0_INST_DDR_EN_MASK;
> +	if (op->addr.dtr || op->data.dtr)
> +		spictrlr0 |=3D DW_SPI_G2_SPI_CTRLR0_DDR_EN_MASK;
> +
>  	dw_spi_g2_writel(dws->regs, DW_SPI_G2_CTRLR0(dws->cs), ctrlr0);
>  	dw_spi_g2_writel(dws->regs, DW_SPI_G2_CTRLR1(dws->cs), 0);
> -	dw_spi_g2_writel(dws->regs, DW_SPI_G2_SPI_CTRLR0(dws->cs), 0);
> +	dw_spi_g2_writel(dws->regs, DW_SPI_G2_SPI_CTRLR0(dws->cs), spictrlr0);
>  	dw_spi_g2_writel(dws->regs, DW_SPI_G2_TXFTLR, 0);
>  	dw_spi_g2_writel(dws->regs, DW_SPI_G2_RXFTLR, 0);
>  }

[ ... ]

> @@ -721,52 +861,36 @@ static int dw_spi_g2_indirect_write(struct dw_spi_g=
2 *dws,
>  		return -EINVAL;
>  	}
> =20
> +	dev_dbg(dws->dev, "indirect_write: cmd=3D0x%02x addr=3D0x%llx len=3D%u\=
n",
> +		op->cmd.opcode, op->addr.val, op->data.nbytes);
> +
>  	dw_spi_g2_indirect_write_setup(dws, op);
> =20
> -	/* Allocate and build TX buffer: [cmd][addr][data] */
>  	tx_buf =3D kzalloc(tx_total, GFP_KERNEL);
>  	if (!tx_buf)
>  		return -ENOMEM;
> =20
>  	dw_spi_g2_fill_tx_buf(tx_buf, op, true);
> =20
> -	/*
> -	 * Split enable sequence:
> -	 * Enable SSI (without CS), pre-fill TX FIFO, then assert CS.
> -	 * FIFO pointers are reset while SSIENR=3D0, so writes before
> -	 * enabling would be discarded.
> -	 */
>  	dw_spi_g2_target_enable(dws, dws->cs);
> -	dw_spi_g2_enable(dws, true);
> -
> -	/* Pre-fill FIFO to capacity or total size */
> -	prefill =3D min_t(u32, tx_total, dws->fifo_len);
> -	for (pos =3D 0; pos < prefill; pos++)
> -		dw_spi_g2_writel(dws->regs, DW_SPI_G2_DR0, tx_buf[pos]);
> -
> -	/* Assert CS - transfer starts */
>  	dw_spi_g2_cs_assert(dws, dws->cs);
> +	dw_spi_g2_enable(dws, true);
> =20
> -	/* Refill FIFO with remaining bytes (if any) via polling */
> -	if (pos < tx_total) {
> -		int ret =3D dw_spi_g2_xfer_fifo(dws, &tx_buf[pos],
> -					      tx_total - pos, NULL, 0);
> -		if (ret) {
> -			dw_spi_g2_transfer_end(dws);
> -			dw_spi_g2_controller_reset(dws);
> -			kfree(tx_buf);
> -			return ret;
> -		}
> +	ret =3D dw_spi_g2_xfer_fifo(dws, tx_buf, tx_total, NULL, 0);

[Severity: Medium]
Can asserting CS and enabling SSI before pre-filling the TX FIFO cause a TX
FIFO underrun that deasserts CS mid-write?

With SER and SSIENR both active, DWC SSI starts shifting as soon as the
first byte is written to DR0 in dw_spi_g2_xfer_fifo(), and automatically
deasserts CS if the TX FIFO drains empty before the next byte arrives.
Because dw_spi_g2_xfer_fifo() runs in preemptible context and reads
DW_SPI_G2_SR before each byte write, an interrupt or scheduling delay after
the opcode byte can drain the 1-byte FIFO and toggle CS during a page
program.

> @@ -778,9 +902,46 @@ static int dw_spi_g2_indirect_write(struct dw_spi_g2=
 *dws,
>  static bool dw_spi_g2_supports_mem_ops(struct spi_mem *mem,
>  				       const struct spi_mem_op *op)
>  {
> +	struct spi_device *spi =3D mem->spi;
> +	struct dw_spi_g2 *dws =3D spi_controller_get_devdata(spi->controller);
> +	bool op_is_dtr =3D
> +		op->cmd.dtr || op->addr.dtr || op->dummy.dtr || op->data.dtr;
> +
> +	/*
> +	 * Detect NAND flash by checking device tree compatible string.
> +	 * This is used for VDK timing workarounds.
> +	 */
> +	if (spi->dev.of_node) {
> +		if (of_device_is_compatible(spi->dev.of_node, "spi-nand"))
> +			dws->is_nand =3D true;
> +	}

[Severity: Medium]
Isn't dws->is_nand controller-wide state that gets latched permanently acro=
ss
all chip selects and modified without holding any controller lock?

supports_op() is called before spi_mem_access_start() acquires the bus
locks, and once any child node matches "spi-nand", dws->is_nand remains
true even when talking to a non-NAND device on another chip select.

> +
> +	if (op_is_dtr) {
> +		/*
> +		 * DTR requires enhanced SPI modes (Dual/Quad/Octal).
> +		 * Reject standard-width DTR since it has no practical use
> +		 * and the hardware doesn't support it meaningfully.
> +		 */
> +		if (op->data.nbytes && op->data.buswidth =3D=3D 1)
> +			return false;
> +
> +		/*
> +		 * In DTR mode all phases must agree on DTR =E2=80=94 reject
> +		 * mixed STR/DTR within a single operation.
> +		 */
> +		if (op->addr.nbytes && op->addr.dtr !=3D op->cmd.dtr)
> +			return false;
> +		if (op->data.nbytes && op->data.dtr !=3D op->cmd.dtr)
> +			return false;
> +	}
> +
>  	return spi_mem_default_supports_op(mem, op);
>  }

[Severity: High]
Does dw_spi_g2_supports_mem_ops() advertise multi-IO and DTR write and
command-only operations that the driver only transmits in 1-1-1 STR mode?

ctlr->mode_bits includes SPI_TX_DUAL, SPI_TX_QUAD, and SPI_TX_OCTAL, and
dw_spi_g2_mem_caps enables .dtr =3D true, so dw_spi_g2_supports_mem_ops()
accepts operations such as Winbond W25N01JW's 1-1-4 Program Load (0x32) or
8D-8D-8D writes.  However, dw_spi_g2_indirect_write_setup() and
dw_spi_g2_cmd_only_setup() both hardcode DW_SPI_G2_FRF_STANDARD (where the
DDR bits written to SPI_CTRLR0 are ignored) and leave INST_L and ADDR_L at
0, sending all bytes over a single wire.

There are two related DTR and buswidth issues in this path:

1. In dw_spi_g2_indirect_read_setup() and dw_spi_g2_exec_mem_op(),
   dummy_cycles is computed as (op->dummy.nbytes * 8) / op->dummy.buswidth
   without halving for DTR mode (later partially adjusted in commit
   "spi: dw-g2: Add XIP support"), programming twice the required wait
   cycles.

2. dw_spi_g2_supports_mem_ops() does not verify that op->dummy.dtr matches
   op->cmd.dtr, that cmd/addr buswidth > 1 is rejected when
   op->data.nbytes =3D=3D 0, or that multi-line phase buswidths are support=
ed by
   dw_spi_g2_get_tt() and the single CTRLR0.FRF field (for example,
   cmd.buswidth > 1 with addr.nbytes =3D=3D 0 passes supports_op() and then
   fails in dw_spi_g2_get_tt() with -EOPNOTSUPP).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119100513.4330=
44-1-prakriti@synopsys.com?part=3D4
