Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084072;
	b=3QBXMRPqFd5MN6sptdS9vIHmvRWopCecow3o1r5rrgRtCVwbpsG5P0k1JWM0gOL7gknD
	 9R7AX16kQ2r9F7TDFmWv1OVAe4tg+YclkOsDNSLSGltNSET/JnU2W7/B8Wl0b/Pe4vCXR
	 Sk0QUwOW6Rc4W6gWstsZ8Ueta3E7P2pKWwzSNeveo1ZzNvMBEgOPN++WRg8bHi88Q+cJs
	 58Vl0aErKmTfrSUbJ3HJkzhmJzqgwZN0q7oBh7DnKkjnT70lo5MZ9KDvXMvr7ZrGqIQZK
	 mOsN6+F6NJB4cdY50fecKxC0z+LIrUicLbMKyE1/PYGSD8VyY7GUnJ+1x44AnyZR9Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084072;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aVhRX2cFS1IzFixHSFg6XoTvWUiuczQWnnGeAuEXK1o=;
	b=Drs03Q3P5PhY81s72Fxx849izDlWSPElXmHMkdD3J6Zlv+MIj+dLEpZqOjR9MR9mgayS
	 C5J8ofQvkSlSePIR5k3+gG6xXLA/gg2m+QhHw0ks/eTvMHRGr+VCB55KrvrDnCsx0vXM+
	 tQsDr8R6J07qD9byeOkQjp8dYed0Um4pZNvcNxSI3kOnoy3eSsalKkdGUEfb80FM6/ooL
	 Cwx1CGq7fawL4f1JuyNALf11Q/b+zCxvoqg7n148byxhsV+LuvrTgiGyVanXyCz5iXKVG
	 Z6CG1fU9qxj3wEAdi425WpSFccJyTtJja+TM5IvmBZvdvh5To+p5IiRxk8CeFQnyj4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="MuoF/vXd";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB20606A324
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 10:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MuoF/vXd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EF701F000C5;
	Thu, 19 Nov 2026 10:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795084071;
	bh=aVhRX2cFS1IzFixHSFg6XoTvWUiuczQWnnGeAuEXK1o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MuoF/vXdjd5bzQxI5ESJIdc8wXHqwJblDk02dH0GZlPFi3C4LctJCmd2rivZP1QAA
	 6pLIgGiHlPYYgVFMMT6dFwH+GmA+ciEmIndEoxU9ihe73wKUK7BMxsBrNB2EetzK4i
	 zitjK9IFtIsKIUWBdl4//0QsUKNw+Z1l7bmxINy4nwTd0Hu+iZJ5Rr+x9VIplKvzJh
	 mCQeO/LB3THJzqh4oPH7+K0b4i405/zSiYHJHymyfPdFSQpTh2/q1Vd0PqUzk1iQbq
	 xJNDorSty7wPTx93/qcQX1jKssjERGjhYQrXDhiL81YwDrgMlyNPBiDfpmQVcKkpga
	 CNkAoXB24FB5g==
Message-ID: <sashiko-outbox-222952@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/6] spi: dw-g2: Add indirect read and write
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prakriti Sharma" <Prakriti.Sharma@synopsys.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119100513.433044-4-prakriti@synopsys.com>
References: <20261119100513.433044-1-prakriti@synopsys.com>
 <20261119100513.433044-4-prakriti@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 10:27:50 +0000
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
- [High] spi: dw-g2: multi-line writes sent in 1-1-1 mode in
  dw_spi_g2_indirect_write()
- [High] spi: dw-g2: premature TX termination and ignored timeout in
  dw_spi_g2_indirect_write()
- [Medium] spi: dw-g2: 64-bit address truncated to u32 in
  dw_spi_g2_indirect_read()
- [Medium] spi: dw-g2: dw_spi_g2_exec_mem_op() routes non-1-1-1 ops to
  dw_spi_g2_reg_op()
- [Medium] spi: dw-g2: missing CPOL/CPHA setup in
  dw_spi_g2_build_ctrlr0()
- [Low] spi: dw-g2: unused variable tx_entries in
  dw_spi_g2_indirect_read()
- [Low] spi: dw-g2: malformed kernel-doc comment above
  dw_spi_g2_indirect_write_setup()
--

commit 5c69b8ce5159adba9406d4ca9e6fadba79d41ae5
Author: Prakriti Sharma <Prakriti.Sharma@synopsys.com>

spi: dw-g2: Add indirect read and write

This commit adds the FIFO-based indirect read (receive-only) and indirect
write (transmit-only) paths for spi-mem data transfers.

> diff --git a/drivers/spi/spi-dw-g2-core.c b/drivers/spi/spi-dw-g2-core.c
> index 7b0928f671033..c640d6a192600 100644
> --- a/drivers/spi/spi-dw-g2-core.c
> +++ b/drivers/spi/spi-dw-g2-core.c
> @@ -538,6 +538,237 @@ static int dw_spi_g2_reg_op(struct dw_spi_g2 *dws, =
const struct spi_mem_op *op)
>   * Indirect read operations
>   */
> =20
> +/**
> + * dw_spi_g2_indirect_read_setup - Configure controller for indirect read
> + * @dws: Driver state
> + * @op: SPI memory operation
> + *
> + * Sets up TMOD=3DRO with enhanced SPI framing.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int dw_spi_g2_indirect_read_setup(struct dw_spi_g2 *dws,
> +					 const struct spi_mem_op *op)
> +{
> +	u32 ctrlr0 =3D dw_spi_g2_build_ctrlr0(dws, DW_SPI_G2_CTRLR0_TMOD_RO,
> +					    dw_spi_g2_get_frf(op));

[Severity: Medium]
Does dw_spi_g2_build_ctrlr0() omit DW_SPI_G2_CTRLR0_SCPOL and
DW_SPI_G2_CTRLR0_SCPHA from ctrlr0?

The controller advertises SPI_CPOL | SPI_CPHA in ctlr->mode_bits, but
dw_spi_g2_build_ctrlr0() never checks dws->curr_spi->mode, so indirect
reads and writes always program CTRLR0 for SPI Mode 0 and fail on flash
devices configured for SPI Mode 1, 2, or 3.

[ ... ]

> +static int dw_spi_g2_indirect_read(struct dw_spi_g2 *dws,
> +				   const struct spi_mem_op *op)
> +{
> +	u32 tx_entries;
> +	u8 dummy_buf =3D 0;
> +	int ret;

[ ... ]

> +	tx_entries =3D 0;
> +
> +	/* Write instruction */
> +	dw_spi_g2_writel(dws->regs, DW_SPI_G2_DR0, op->cmd.opcode);
> +	tx_entries++;
> +
> +	/* Write address as a packed 32-bit value (one FIFO entry) */
> +	if (op->addr.nbytes) {
> +		dw_spi_g2_writel(dws->regs, DW_SPI_G2_DR0, (u32)op->addr.val);
> +		tx_entries++;
> +	}

[Severity: Low]
tx_entries is incremented here but never read, which triggers a
-Wunused-but-set-variable warning under W=3D1 builds.

[Severity: Medium]
Does casting op->addr.val to u32 and writing a single DR0 entry break
reads withop->addr.nbytes > 4?

dw_spi_g2_exec_mem_op() allows addresses up to DW_SPI_G2_ADDR_L_MAX_BITS
(60 bits) and dw_spi_g2_indirect_read_setup() programs ADDR_L for the
full op->addr.nbytes (and commit "spi: dw-g2: Add XIP and dirmap
support" folds dummy bytes into op.addr.nbytes before calling
dw_spi_g2_indirect_read()).  When ADDR_L > 8 (more than 32 bits), the
controller expects two 32-bit address entries in the TX FIFO before
starting the receive phase, so writing only one truncated 32-bit word
stalls the transfer until dw_spi_g2_xfer_fifo() times out.

[ ... ]

> +/**
> + * Indirect write operations (Page Program)
> + * Uses TMOD=3DTO (Transmit-Only) mode
> + */

[Severity: Low]
This section comment starts with /** instead of /*, which causes a
scripts/kernel-doc warning on W=3D1 builds.

> +/**
> + * dw_spi_g2_indirect_write_setup - Configure controller for indirect wr=
ite
> + * @dws: Driver state
> + * @op: SPI memory operation
> + *
> + * Sets up TMOD=3DTO (transmit-only), standard SPI mode.
> + */
> +static void dw_spi_g2_indirect_write_setup(struct dw_spi_g2 *dws,
> +					   const struct spi_mem_op *op)
> +{
> +	u32 ctrlr0 =3D dw_spi_g2_build_ctrlr0(dws, DW_SPI_G2_CTRLR0_TMOD_TO,
> +					    DW_SPI_G2_FRF_STANDARD);
> +
> +	dw_spi_g2_controller_reset(dws);
> +	dw_spi_g2_target_disable(dws, dws->cs);
> +
> +	dw_spi_g2_writel(dws->regs, DW_SPI_G2_CTRLR0(dws->cs), ctrlr0);
> +	dw_spi_g2_writel(dws->regs, DW_SPI_G2_CTRLR1(dws->cs), 0);
> +	dw_spi_g2_writel(dws->regs, DW_SPI_G2_SPI_CTRLR0(dws->cs), 0);
> +	dw_spi_g2_writel(dws->regs, DW_SPI_G2_TXFTLR, 0);
> +	dw_spi_g2_writel(dws->regs, DW_SPI_G2_RXFTLR, 0);
> +}

[Severity: High]
Can dw_spi_g2_indirect_write_setup() and dw_spi_g2_indirect_write() send
multi-line write operations in single-wire 1-1-1 mode?

dw_spi_g2_init() sets SPI_TX_DUAL | SPI_TX_QUAD | SPI_TX_OCTAL in
ctlr->mode_bits and dw_spi_g2_supports_mem_ops() delegates directly to
spi_mem_default_supports_op(), so spi-mem negotiates multi-wire Page
Program operations (such as 1-1-4 or 1-4-4 Quad writes).  However,
dw_spi_g2_indirect_write_setup() hardcodes DW_SPI_G2_FRF_STANDARD with
DW_SPI_G2_SPI_CTRLR0 set to 0, and dw_spi_g2_indirect_write() streams
[cmd][addr][data] over IO0 without multi-line framing or dummy cycles,
corrupting the data written to flash.

[ ... ]

> +	/* Assert CS - transfer starts */
> +	dw_spi_g2_cs_assert(dws, dws->cs);
> +
> +	/* Refill FIFO with remaining bytes (if any) via polling */
> +	if (pos < tx_total) {
> +		int ret =3D dw_spi_g2_xfer_fifo(dws, &tx_buf[pos],
> +					      tx_total - pos, NULL, 0);
> +		if (ret) {
> +			dw_spi_g2_transfer_end(dws);
> +			dw_spi_g2_controller_reset(dws);
> +			kfree(tx_buf);
> +			return ret;
> +		}
> +	}
> +
> +	/* Wait for transfer completion */
> +	dw_spi_g2_wait_idle(dws);
> +
> +	dw_spi_g2_transfer_end(dws);
> +	dw_spi_g2_controller_reset(dws);
> +
> +	kfree(tx_buf);
> +	return 0;
> +}

[Severity: High]
Can dw_spi_g2_wait_idle() return before the pre-filled TX FIFO has
drained, and does ignoring its return value hide transfer timeouts?

drivers/spi/spi-dw-g2.h:dw_spi_g2_wait_idle() {
	u32 sr;

	return readl_poll_timeout(dws->regs + DW_SPI_G2_SR, sr,
				  !(sr & DW_SPI_G2_SR_BUSY), 1, DW_SPI_G2_TIMEOUT_US);
}

When tx_total <=3D dws->fifo_len, dw_spi_g2_indirect_write() asserts CS and
immediately calls dw_spi_g2_wait_idle().  Because SER is written in the
APB clock domain while frames begin shifting on the divided ssi_clk,
DW_SPI_G2_SR_BUSY can still read 0 before the first byte is popped from
the TX FIFO (while DW_SPI_G2_SR_TFE is 0), causing
dw_spi_g2_transfer_end() to disable SSIENR and discard the queued write.
In addition, both dw_spi_g2_indirect_write() and dw_spi_g2_xfer_fifo()
ignore the -ETIMEDOUT return value of dw_spi_g2_wait_idle().  Commit
"spi: dw-g2: Add SPI-NAND support" later routes indirect writes through
dw_spi_g2_xfer_fifo(), which still leaves dw_spi_g2_wait_idle() missing
a DW_SPI_G2_SR_TFE check and its return value unchecked.

> @@ -626,12 +857,11 @@ static int dw_spi_g2_exec_mem_op(struct spi_mem *me=
m,
>  	if (dw_spi_g2_is_reg_op(op))
>  		return dw_spi_g2_reg_op(dws, op);
> =20
> -	/*
> -	 * Bulk reads and writes are added by the indirect-transfer patch.
> -	 * This patch handles commands and short register operations only.
> -	 */
> -	if (op->data.dir !=3D SPI_MEM_NO_DATA && !dw_spi_g2_is_reg_op(op))
> -		return -EOPNOTSUPP;
> +	if (op->data.dir =3D=3D SPI_MEM_DATA_IN)
> +		return dw_spi_g2_indirect_read(dws, op);
> +
> +	if (op->data.dir =3D=3D SPI_MEM_DATA_OUT)
> +		return dw_spi_g2_indirect_write(dws, op);
> =20
>  	return -EOPNOTSUPP;
>  }

[Severity: Medium]
Does checking dw_spi_g2_is_reg_op() before the indirect paths misroute
short non-1-1-1 operations to dw_spi_g2_reg_op()?

drivers/spi/spi-dw-g2-core.c:dw_spi_g2_is_reg_op() {
	return !op->addr.nbytes && op->data.nbytes > 0 &&
	       op->data.nbytes <=3D DW_SPI_G2_REG_OP_MAX_DATA;
}

dw_spi_g2_is_reg_op() does not check that op->cmd.nbytes =3D=3D 1,
op->dummy.nbytes =3D=3D 0, all phase buswidths are 1, and DTR is disabled,
whereas dw_spi_g2_reg_op() only sends a 1-byte opcode in 1-1-1 standard
SPI mode without dummy cycles.  Short operations using dummy cycles,
2-byte opcodes, multi-wire buswidths, or DTR are sent through
dw_spi_g2_reg_op() instead of dw_spi_g2_indirect_read(), and commit
"spi: dw-g2: Add SPI-NAND support" widens dw_spi_g2_is_reg_op() to match
addressed operations up to fifo_len bytes with the same 1-1-1 restriction.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119100513.4330=
44-1-prakriti@synopsys.com?part=3D3
