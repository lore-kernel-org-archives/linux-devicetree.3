Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7293FE37A
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 10:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984891; cv=none; b=KQhaQhuCKc+RCHpEu+DMAw9Letw9SeLIPbrafR93WbUuBxdpkd8CM354hqY0CcuVVsyi/UFvkU2E5bDd8u0zX7lx9ZFLR+wFvL4AX1rbf21rlRH7J+Lisgt9tfuxkYFzB0DuOUqSnjv/Ba9nAJY43EvQ5fnVbkFWRRUP0zz5MeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984891; c=relaxed/simple;
	bh=HW1LDkR+xuhyASsvOQ+SEhV2S4T5OMUHaYJSZhLgle4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KLHgEOkd80E3CMLtPvb5Ej7/dYmJHNuzACxI/7GeOTHWQS2krCRTKvxhUJkN03iLhA2pin/FFQRotbZrkj3r5t63f6N/d7npAQbsjnYkvQV2iu4y2z1cMDxPpUlAT4uJ36x1n/V9xTMAnvTFAsuqtGyouu6buL04C7eP2+xor4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NIRwsI9A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NIRwsI9A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696F21F000FF;
	Mon, 21 Sep 2026 10:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789984889;
	bh=x3d+dITGjkumI3NjRijfEyKh74hCumczR0LnzKkX3lc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NIRwsI9AtoU1FS0vo/QYjzh8wpOfit6YO+DLjB9YYUjcIOg0Ek4law/Zo3o3tdmmb
	 RywqDV6hZTCUxGqQC/Vat9DpeB7vfnasR5GzIHQXIyXMLRVUyr4xXSjOVVztaAAhDM
	 SsfTKVQ1nZ9bUsySQROAnVI0Rl+GB283XpP5WkB9jfwVfgWp5wBwu1df3BUGixy76P
	 F22f1UuHayq93xs5dJbgzpjNk2ciD1aud92/cIRkkefAGVFwFpka7dUgHxsLzE2HaY
	 X+gh1gzha8dPWbRNsEnH7ZR9WLeAm0mS/NCw0Tuv6uFNW4tQpeE9+wvqVpJBjgt/SB
	 nQeoHL1nNwL2A==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 2/4] spi: cadence-xspi: add ACMD support for SPI
 NAND
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fei Xie" <fei.xie@horizon.auto>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260921093701.1341766-3-fei.xie@horizon.auto>
References: <20260921093701.1341766-1-fei.xie@horizon.auto>
 <20260921093701.1341766-3-fei.xie@horizon.auto>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 10:01:29 +0000
Message-Id: <20260921100129.696F21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] spi: cadence-xspi: type confusion via illegal spi_mem drvdata cast
- [High] spi: cadence-xspi: intercepts GET_FEATURE and fakes status 0
- [High] spi: cadence-xspi: cross-device data corruption via global state
- [High] spi: cadence-xspi: update_cache incorrectly executes as write_cache
- [High] spi: cadence-xspi: stale interrupt causes immediate false completi=
on
- [Medium] spi: cadence-xspi: first device geometry permanently locks contr=
oller
- [Medium] spi: cadence-xspi: hardcoded 1S sequences break Octal DTR mode
- [Medium] spi: cadence-xspi: intercepting PAGE_READ breaks continuous read
--

commit a80c7f36e6df88f31baa3c4a1e55010ec5dd1515
Author: fei.xie <fei.xie@horizon.auto>
Subject: spi: cadence-xspi: add ACMD support for SPI NAND

This commit adds PIO master-DMA support for the controller's auto-command m=
ode,
configuring the SPI NAND read, program, erase, status, and reset sequences.

> diff --git a/drivers/spi/spi-cadence-xspi.c b/drivers/spi/spi-cadence-xsp=
i.c
> --- a/drivers/spi/spi-cadence-xspi.c
> +++ b/drivers/spi/spi-cadence-xspi.c
> @@ ... @@
[ ... ]
> +static void cdns_xspi_nand_erase_seq_init(struct cdns_xspi_dev *cdns_xsp=
i,
> +					  struct spinand_device *spinand)
> +{
> +	u32 erase_seq_cfg0;
> +	u32 erase_seq_cfg1;
> +
> +	/* SPI-NAND block erase is always D8h with a 3-byte row address. */
> +	erase_seq_cfg0 =3D
> +		FIELD_PREP(CDNS_XSPI_ERSS_SEQ_P1_CMD_VAL, 0xd8) |
> +		FIELD_PREP(CDNS_XSPI_ERSS_SEQ_P1_CMD_IOS, 0) |
> +		FIELD_PREP(CDNS_XSPI_ERSS_SEQ_P1_CMD_EDGE, 0) |

[Severity: Medium]
Does hardcoding CMD_IOS and CMD_EDGE to 0 (Single-SPI SDR) break devices
operating in Octal DTR mode?=20

If the SPI NAND core configures the controller and flash for 8D-8D-8D mode,
the flash will expect all commands to be in 8D format, but the hardware ACMD
engine would continue to transmit erase commands in 1S mode.

[ ... ]
> +static void cdns_xspi_nand_write_enable_seq_init(struct cdns_xspi_dev *c=
dns_xspi)
> +{
> +	u32 cfg;
> +
> +	cfg =3D readl(cdns_xspi->iobase + CDNS_XSPI_WE_SEQ_CFG_0);
> +	cfg =3D u32_replace_bits(cfg, 1, CDNS_XSPI_WE_SEQ_P1_EN);
> +	cfg =3D u32_replace_bits(cfg, CDNS_XSPI_NAND_OP_WRITE_ENABLE,
> +			       CDNS_XSPI_WE_SEQ_P1_CMD_VAL);
> +	cfg =3D u32_replace_bits(cfg, 0, CDNS_XSPI_WE_SEQ_P1_CMD_IOS);
> +	cfg =3D u32_replace_bits(cfg, 0, CDNS_XSPI_WE_SEQ_P1_CMD_EDGE);

[Severity: Medium]
Similarly, does hardcoding the Write Enable sequence to Single-SPI SDR cause
failures on flashes currently operating in Octal DTR mode?

[ ... ]
> +static int cdns_xspi_nand_init(struct cdns_xspi_dev *cdns_xspi,
> +			       struct spinand_device *spinand)
> +{
[ ... ]
> +	cdns_xspi->dma_buf_len =3D spinand->base.memorg.pagesize +
> +				 spinand->base.memorg.oobsize;
> +	cdns_xspi->dma_buf =3D dmam_alloc_coherent(cdns_xspi->dev,
> +						 cdns_xspi->dma_buf_len,
> +						 &cdns_xspi->dma_addr,
> +						 GFP_KERNEL);

[Severity: Medium]
Since cdns_xspi_nand_init() sets up the global DMA buffer and hardware
sequence registers using the first active device's geometry (and is executed
only once per controller), does this cause problems if multiple SPI NAND
devices with different geometries (e.g., 2K vs 4K pages) are attached?

Subsequent devices with larger pages might experience truncated or
out-of-bounds transfers if they are bound to the initial device's constrain=
ts.

[ ... ]
> +static int cdns_xspi_acmd_run(struct cdns_xspi_dev *cdns_xspi, u32 cmd_r=
egs[6],
> +			      u32 thread)
> +{
> +	unsigned long timeout;
> +	int ret;
> +
> +	cdns_xspi_set_mode_acmd(cdns_xspi);
> +	reinit_completion(&cdns_xspi->auto_cmd_complete);
> +	cdns_xspi_set_interrupts(cdns_xspi, true);
> +	cdns_xspi_trigger_command(cdns_xspi, cmd_regs);
> +
> +	timeout =3D msecs_to_jiffies(CDNS_XSPI_ACMD_TIMEOUT_MS);
> +	if (!wait_for_completion_timeout(&cdns_xspi->auto_cmd_complete,
> +					 timeout)) {

[Severity: High]
Could this lead to a false completion if a previous command timed out but
the hardware later completed it asynchronously?=20

If the stale interrupt flag is not cleared before calling
cdns_xspi_set_interrupts(), the latent interrupt might fire immediately.
This could cause wait_for_completion_timeout() to return success while the
hardware is still executing the newly triggered command, potentially result=
ing
in a DMA use-after-free.

[ ... ]
> +static int cdns_xspi_pio_mdma_program(struct cdns_xspi_dev *cdns_xspi,
> +				      struct spinand_device *spinand,
> +				      const struct spi_mem_op *op)
> +{
[ ... ]
> +	if (cdns_xspi->acmd_info.data_nbytes > cdns_xspi->dma_buf_len) {
> +		ret =3D -EMSGSIZE;
> +		goto out_clear_program_state;
> +	}
> +
> +	memcpy(cdns_xspi->dma_buf, cdns_xspi->out_buffer,
> +	       cdns_xspi->acmd_info.data_nbytes);

[Severity: High]
Is there a risk of cross-device data corruption here?=20
   =20
The SPI core's bus lock is dropped between steps of a multi-step sequence
(like WRITE_CACHE followed by PROGRAM_EXECUTE). If another SPI device on
the same controller executes an operation in between, it could overwrite
cdns_xspi->out_buffer in the shared controller structure. This would cause
the PROGRAM_EXECUTE step to copy from the wrong buffer or a stale pointer.

[ ... ]
> +static int cdns_xspi_send_pio_command(struct cdns_xspi_dev *cdns_xspi,
> +				      struct spi_mem *mem,
> +				      const struct spi_mem_op *op)
> +{
> +	struct spinand_device *spinand;
> +	const struct spi_mem_op *read_cache;
> +	const struct spi_mem_op *write_cache;
> +	const struct spi_mem_op *update_cache;
> +	int ret;
> +
> +	if (cdns_xspi->flash_type !=3D CDNS_XSPI_FLASH_TYPE_NAND)
> +		goto use_stig;
> +
> +	spinand =3D spi_mem_get_drvdata(mem);
> +	if (!spinand || !spinand->op_templates ||
> +	    !spinand->op_templates->read_cache ||

[Severity: High]
Can this cause a type confusion if the SPI device is bound to a different
client driver (such as spidev or spi-eeprom)?=20
   =20
Calling spi_mem_get_drvdata() and blindly casting it to a struct
spinand_device pointer could lead to out-of-bounds access or a kernel panic
when dereferencing the mismatched struct.

[ ... ]
> +	if ((write_cache && op->cmd.opcode =3D=3D write_cache->cmd.opcode) ||
> +	    (update_cache && op->cmd.opcode =3D=3D update_cache->cmd.opcode)) {
> +		if (op->data.dir !=3D SPI_MEM_DATA_OUT || !op->data.nbytes ||
> +		    !op->data.buf.out)
> +			return -EINVAL;
> +
> +		cdns_xspi_nand_write_enable_seq_init(cdns_xspi);
> +		cdns_xspi->out_buffer =3D op->data.buf.out;
> +		cdns_xspi->acmd_info.column_addr =3D op->addr.val;
> +		cdns_xspi->acmd_info.data_nbytes =3D op->data.nbytes;
> +		return 0;
> +	}

[Severity: High]
Does routing update_cache (Random Program Load) identically to write_cache
(Program Load) cause unintended erasure?=20
   =20
The hardware PROG_SEQ is statically configured using the write_cache opcode.
If the MTD core issues an update_cache command to modify specific bytes
without altering the rest of the cache, the hardware would incorrectly emit
the destructive write_cache opcode instead, erasing pre-existing cache data.

[ ... ]
> +	switch (op->cmd.opcode) {
> +	case CDNS_XSPI_NAND_OP_PAGE_READ:
> +		cdns_xspi->acmd_info.row_addr =3D op->addr.val;
> +		cdns_xspi->acmd_info.row_addr_valid =3D true;
> +		return 0;

[Severity: Medium]
Does silently intercepting and returning success for PAGE_READ break
continuous page read operations?=20
   =20
The initial PAGE_READ is dropped here, so the hardware cache is never loade=
d.
When the core subsequently issues a cont_read_cache command, it falls throu=
gh
to the STIG fallback, which might read garbage data from an empty flash
cache.

> +
> +	case CDNS_XSPI_NAND_OP_GET_FEATURE:
> +		if (op->addr.val !=3D CDNS_XSPI_NAND_STATUS_REG ||
> +		    !cdns_xspi->acmd_info.row_addr_valid)
> +			break;
> +
> +		if (op->data.dir !=3D SPI_MEM_DATA_IN || !op->data.nbytes ||
> +		    !op->data.buf.in)
> +			return -EINVAL;
> +
> +		memset(op->data.buf.in, 0, op->data.nbytes);
> +		return 0;

[Severity: High]
Can zeroing the GET_FEATURE receive buffer here cause silent data corruptio=
n?
   =20
By masking the hardware's true status register, this fakes an error-free
state and hides correctable bitflips and uncorrectable ECC errors from the
MTD subsystem. This breaks block scrubbing and bad block management logic.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921093701.1341=
766-1-fei.xie@horizon.auto?part=3D2
