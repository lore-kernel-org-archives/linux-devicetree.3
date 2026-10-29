Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793290794;
	b=Oub37LkLlTL0fn6KXEGcSdCt3VKS/BrOxq9F85rtVuCyC5E00tKJjDh3/jLmqFqPR1OG
	 nETr6sC6D+yweWkfkxXl3+XPU4rtbal1gwHUIdsA7tFIw6BKtqBkmPo5EOnL3j3bsXRXQ
	 j99NgtDTOMFeo08BX37Vr7rtZJIUcKDUbbnzgr1I07nwKNL9XNBPo8bIHT+ZGi30/8J3t
	 xZXnd5uVeVJYvnC+CcbJyY/q/h8qOuf4nuk3F+gVlFmxWff6naibSErJke7G6c+6dr1nq
	 xkZC0nnfy1ecRMxVO+H3Hy6wGnIQ5uUBKGyoGEWEpEvsXhcz4f4jBZphlEkxDi/Zl5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793290794;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Dx1ek5UMjogiwomfJeGpH0qNI2iw+KzznInmHJV4Oms=;
	b=zZPlBDJyqkYutwS+D19cPkRAeoPkGgq4Myn+Vm5Nc3NzZCm11AoOi9uSh/SD794NfAid
	 wW4NXxuRtqGK12H2nBeg2XncEVXfVGdUL7gwIH+8icsy1wh4Tt81Q58GhT/acm35ykFm3
	 Qln5mt4+iIDdLDCAviSYRHUhUj1JQ9MPIs5/n6ad6yedQeSFXca04EGsk0uxsu1kuaRoF
	 2e1gl9FZcy4s51dpetM8qhekRbRp1VK4jfwh04pf6qhF+PyHu3s0oUj3UzBhwnd4tNNK6
	 pGgzQZALs6Alcksag0mNnDVvocQ8OzXva0Wdxs+b7k5gLy1O2RBAl0FoTIgoyNUesUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hfhq4s4K;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B810D606A31D
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 16:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hfhq4s4K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16C7F1F01825;
	Thu, 29 Oct 2026 16:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793290793;
	bh=Dx1ek5UMjogiwomfJeGpH0qNI2iw+KzznInmHJV4Oms=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hfhq4s4KFlF1NVdsSaIejsaSOhKyO0stoZXnSgdbO4MjesOHeDGEmT3t7Kl7SgUdS
	 iLkMA9xiul7kW5Bshnjxbm7+U6tnUEnore08dpABBwOzDGBPwPAnmWsSULno3zxT8d
	 X+3Rymm8VMiTaPGTgS9MkFh52fBURmx6wd0j+sUnfFv2rS9qbXXUfBHAgtN9ol8+R5
	 zSx1VQeNI1M0VtqyIdfGWF440EW+l9UI4zL8Pt8QFvWY6uzIS93jvh4dA2vCZNUtAE
	 pt5rWbp2jxHTm9E3jOZtuPHPKN7T9dAMRDUHjHNECu430qQ/07TLEYvyC9MpNZ2OC6
	 D2tcqCGpBTAmw==
Message-ID: <sashiko-outbox-189654@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] spi: cadence-xspi: add ACMD mode support
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261029-xspi-cadence-add-acmd-v1-3-53cd44690e04@analog.com>
References: <20261029-xspi-cadence-add-acmd-v1-0-53cd44690e04@analog.com>
 <20261029-xspi-cadence-add-acmd-v1-3-53cd44690e04@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 16:19:52 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] spi: cadence-xspi: restore work mode and ACMD config in cdns_xspi_=
resume()
- [Medium] spi: cadence-xspi: xfer_error check in cdns_xspi_acmd_read() byp=
asses status check
- [Medium] spi: cadence-xspi: missing STIG mode in cdns_xspi_transfer_one_m=
essage_b0()
--

commit db673b09285a06730d352ef002e9477417c0c965
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

spi: cadence-xspi: add ACMD mode support

This commit adds auto command (ACMD) mode support using the internal DMA for
SPI memory read operations of at least 2048 bytes that include an address
phase. Smaller reads and other operations continue to use STIG mode.

> diff --git a/drivers/spi/spi-cadence-xspi.c b/drivers/spi/spi-cadence-xsp=
i.c
> index 905292fa50a25..b2c1ba86fa149 100644
> --- a/drivers/spi/spi-cadence-xspi.c
> +++ b/drivers/spi/spi-cadence-xspi.c

[ ... ]

> @@ -378,13 +435,19 @@ static void cdns_xspi_trigger_command(struct cdns_x=
spi_dev *cdns_xspi,
>  	writel(cmd_regs[0], cdns_xspi->iobase + CDNS_XSPI_CMD_REG_0);
>  }
> =20
> -static int cdns_xspi_check_command_status(struct cdns_xspi_dev *cdns_xsp=
i)
> +static int cdns_xspi_check_command_status(struct cdns_xspi_dev *cdns_xsp=
i,
> +					  bool acmd)
>  {
>  	int ret =3D 0;
>  	u32 cmd_status =3D readl(cdns_xspi->iobase + CDNS_XSPI_CMD_STATUS_REG);
> =20
>  	if (cmd_status & CDNS_XSPI_CMD_STATUS_COMPLETED) {
>  		if ((cmd_status & CDNS_XSPI_CMD_STATUS_FAILED) !=3D 0) {
> +			if (acmd && cmd_status & CDNS_XSPI_CMD_STATUS_DEVICE_ERROR) {
> +				dev_err(cdns_xspi->dev,
> +					"Device reported an error\n");
> +				ret =3D -EPROTO;
> +			}
>  			if (cmd_status & CDNS_XSPI_CMD_STATUS_DQS_ERROR) {
>  				dev_err(cdns_xspi->dev,
>  					"Incorrect DQS pulses detected\n");

[ ... ]

> @@ -447,6 +543,9 @@ static int cdns_xspi_controller_init(struct cdns_xspi=
_dev *cdns_xspi)
>  	cdns_xspi->dma_data_width =3D (ctrl_features & CDNS_XSPI_DMA_DATA_WIDTH=
) ? 8 : 4;
>  	cdns_xspi->set_interrupts_handler(cdns_xspi, false);
> =20
> +	if (cdns_xspi->has_acmd)
> +		cdns_xspi_acmd_init(cdns_xspi);
> +
>  	return 0;
>  }
> =20
> @@ -527,6 +626,24 @@ static int cdns_xspi_sdma_handle(struct cdns_xspi_de=
v *cdns_xspi)
>  	return 0;
>  }
> =20
> +static int cdns_xspi_set_work_mode(struct cdns_xspi_dev *cdns_xspi, int =
mode)
> +{
> +	int ret;
> +
> +	if (cdns_xspi->cur_work_mode =3D=3D mode)
> +		return 0;
> +
> +	ret =3D cdns_xspi_wait_for_controller_idle(cdns_xspi);
> +	if (ret < 0)
> +		return ret;
> +
> +	writel(FIELD_PREP(CDNS_XSPI_CTRL_WORK_MODE, mode),
> +	       cdns_xspi->iobase + CDNS_XSPI_CTRL_CONFIG_REG);
> +	cdns_xspi->cur_work_mode =3D mode;
> +
> +	return 0;
> +}

[Severity: High]
What happens across a system suspend and resume cycle when
cdns_xspi->cur_work_mode has been cached as CDNS_XSPI_WORK_MODE_STIG or
CDNS_XSPI_WORK_MODE_ACMD?

Previously, cdns_xspi_send_stig_command() wrote CDNS_XSPI_CTRL_CONFIG_REG
unconditionally on every command. With cdns_xspi_set_work_mode() skipping t=
he
register write when cdns_xspi->cur_work_mode =3D=3D mode, and cdns_xspi_acm=
d_init()
only running in cdns_xspi_controller_init() during probe, a controller reset
during system suspend will leave CDNS_XSPI_CTRL_CONFIG_REG in
CDNS_XSPI_WORK_MODE_DIRECT (0) and clear CDNS_XSPI_SEQ_GCTL0_REG and
CDNS_XSPI_READ_SEQ_CFG1_REG.

Looking at cdns_xspi_resume() in drivers/spi/spi-cadence-xspi.c:

static int cdns_xspi_resume(struct device *dev)
{
	struct cdns_xspi_dev *cdns_xspi =3D dev_get_drvdata(dev);

#ifdef CONFIG_64BIT
	if (cdns_xspi->driver_data->mrvl_hw_overlay) {
		cdns_mrvl_xspi_setup_clock(cdns_xspi, MRVL_DEFAULT_CLK);
		cdns_xspi_configure_phy(cdns_xspi);
	}
#endif

	cdns_xspi->set_interrupts_handler(cdns_xspi, false);

	return spi_controller_resume(cdns_xspi->host);
}

Should cdns_xspi_resume() reset cdns_xspi->cur_work_mode to
CDNS_XSPI_WORK_MODE_DIRECT and call cdns_xspi_acmd_init() when
cdns_xspi->has_acmd is set so that post-resume SPI operations do not skip
reprogramming CDNS_XSPI_CTRL_CONFIG_REG and the ACMD sequence registers?

> +
>  static int cdns_xspi_send_stig_command(struct cdns_xspi_dev *cdns_xspi,
>  				       const struct spi_mem_op *op,
>  				       bool data_phase)
> @@ -536,12 +653,9 @@ static int cdns_xspi_send_stig_command(struct cdns_x=
spi_dev *cdns_xspi,
>  	int ret;
>  	int dummybytes =3D op->dummy.nbytes;
> =20
> -	ret =3D cdns_xspi_wait_for_controller_idle(cdns_xspi);
> -	if (ret < 0)
> -		return -EIO;
> -
> -	writel(FIELD_PREP(CDNS_XSPI_CTRL_WORK_MODE, CDNS_XSPI_WORK_MODE_STIG),
> -	       cdns_xspi->iobase + CDNS_XSPI_CTRL_CONFIG_REG);
> +	ret =3D cdns_xspi_set_work_mode(cdns_xspi, CDNS_XSPI_WORK_MODE_STIG);
> +	if (ret)
> +		return ret;
> =20
>  	cdns_xspi->set_interrupts_handler(cdns_xspi, true);
>  	cdns_xspi->xfer_error =3D false;
> @@ -589,13 +703,112 @@ static int cdns_xspi_send_stig_command(struct cdns=
_xspi_dev *cdns_xspi,
>  	wait_for_completion(&cdns_xspi->cmd_complete);
>  	cdns_xspi->set_interrupts_handler(cdns_xspi, false);
> =20
> -	cmd_status =3D cdns_xspi_check_command_status(cdns_xspi);
> +	cmd_status =3D cdns_xspi_check_command_status(cdns_xspi, false);
>  	if (cmd_status)
>  		return -EPROTO;
> =20
>  	return 0;
>  }
> =20
> +static void cdns_xspi_acmd_setup_read_seq(struct cdns_xspi_dev *cdns_xsp=
i,
> +					  const struct spi_mem_op *op)
> +{
> +	u32 cfg0;
> +
> +	cfg0 =3D FIELD_PREP(CDNS_XSPI_READ_SEQ_CFG0_CMD_VALUE, op->cmd.opcode) |
> +	       FIELD_PREP(CDNS_XSPI_READ_SEQ_CFG0_CMD_IOS,
> +			  ilog2(op->cmd.buswidth)) |
> +	       FIELD_PREP(CDNS_XSPI_READ_SEQ_CFG0_ADDR_CNT, op->addr.nbytes) |
> +	       FIELD_PREP(CDNS_XSPI_READ_SEQ_CFG0_ADDR_IOS,
> +			  ilog2(op->addr.buswidth)) |
> +	       FIELD_PREP(CDNS_XSPI_READ_SEQ_CFG0_DAT_IOS,
> +			  ilog2(op->data.buswidth));
> +
> +	if (op->dummy.nbytes && op->dummy.buswidth)
> +		cfg0 |=3D FIELD_PREP(CDNS_XSPI_READ_SEQ_CFG0_DMY_CNT,
> +				   (op->dummy.nbytes * 8) / op->dummy.buswidth);
> +
> +	writel(cfg0, cdns_xspi->iobase + CDNS_XSPI_READ_SEQ_CFG0_REG);
> +}
> +
> +static int cdns_xspi_acmd_check_status(struct cdns_xspi_dev *cdns_xspi)
> +{
> +	writel(FIELD_PREP(CDNS_XSPI_CMD_STATUS_PTR_SEL, CDNS_XSPI_ACMD_THRD_0),
> +	       cdns_xspi->iobase + CDNS_XSPI_CMD_STATUS_PTR_REG);
> +
> +	return cdns_xspi_check_command_status(cdns_xspi, true);
> +}
> +
> +static int cdns_xspi_acmd_read(struct cdns_xspi_dev *cdns_xspi,
> +			       const struct spi_mem_op *op)
> +{
> +	dma_addr_t dma_addr;
> +	u32 cmd_regs[6];
> +	int ret;
> +
> +	ret =3D cdns_xspi_set_work_mode(cdns_xspi, CDNS_XSPI_WORK_MODE_ACMD);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D cdns_xspi_wait_for_acmd_idle(cdns_xspi);
> +	if (ret)
> +		return ret;
> +
> +	cdns_xspi_acmd_setup_read_seq(cdns_xspi, op);
> +
> +	dma_addr =3D dma_map_single(cdns_xspi->dev, op->data.buf.in,
> +				  op->data.nbytes, DMA_FROM_DEVICE);
> +	if (dma_mapping_error(cdns_xspi->dev, dma_addr))
> +		return -ENOMEM;
> +
> +	cdns_xspi->xfer_error =3D false;
> +	writel(CDNS_XSPI_ACMD_THRD_0_MASK,
> +	       cdns_xspi->iobase + CDNS_XSPI_TRD_COMP_INTR_STATUS);
> +	writel(CDNS_XSPI_ACMD_THRD_0_MASK,
> +	       cdns_xspi->iobase + CDNS_XSPI_TRD_ERR_INTR_STATUS);
> +	cdns_xspi_set_thread_error_interrupt(cdns_xspi, true);
> +	cdns_xspi->set_interrupts_handler(cdns_xspi, true);
> +
> +	cmd_regs[1] =3D lower_32_bits(op->addr.val);
> +	cmd_regs[5] =3D upper_32_bits(op->addr.val);
> +	cmd_regs[2] =3D lower_32_bits(dma_addr);
> +	cmd_regs[3] =3D upper_32_bits(dma_addr);
> +	cmd_regs[4] =3D op->data.nbytes - 1;
> +	cmd_regs[0] =3D FIELD_PREP(CDNS_XSPI_ACMD_MODE,
> +				 CDNS_XSPI_ACMD_MODE_PIO) |
> +		      FIELD_PREP(CDNS_XSPI_ACMD_TRD_NUM, CDNS_XSPI_ACMD_THRD_0) |
> +		      FIELD_PREP(CDNS_XSPI_ACMD_BANK, cdns_xspi->cur_cs) |
> +		      CDNS_XSPI_ACMD_DMA_SEL | CDNS_XSPI_ACMD_INT |
> +		      FIELD_PREP(CDNS_XSPI_ACMD_CMD_TYPE,
> +				 CDNS_XSPI_ACMD_TYPE_READ);
> +
> +	reinit_completion(&cdns_xspi->auto_cmd_complete);
> +	cdns_xspi_trigger_command(cdns_xspi, cmd_regs);
> +	wait_for_completion(&cdns_xspi->auto_cmd_complete);
> +
> +	cdns_xspi->set_interrupts_handler(cdns_xspi, false);
> +	cdns_xspi_set_thread_error_interrupt(cdns_xspi, false);
> +	dma_unmap_single(cdns_xspi->dev, dma_addr, op->data.nbytes,
> +			 DMA_FROM_DEVICE);
> +
> +	if (cdns_xspi->xfer_error)
> +		return -EIO;
> +
> +	return cdns_xspi_acmd_check_status(cdns_xspi);
> +}

[Severity: Medium]
Does checking cdns_xspi->xfer_error and returning -EIO here prevent
cdns_xspi_acmd_check_status() from ever running when an ACMD command fails?

When thread 0 encounters an ACMD command error (setting
CDNS_XSPI_CMD_STATUS_FAILED in CDNS_XSPI_CMD_STATUS_REG due to
CDNS_XSPI_CMD_STATUS_DEVICE_ERROR, CDNS_XSPI_CMD_STATUS_DQS_ERROR,
CDNS_XSPI_CMD_STATUS_CRC_ERROR, CDNS_XSPI_CMD_STATUS_BUS_ERROR, or
CDNS_XSPI_CMD_STATUS_INV_SEQ_ERROR), the controller raises the thread 0 err=
or
interrupt in CDNS_XSPI_TRD_ERR_INTR_STATUS.

In cdns_xspi_irq_handler(), that interrupt sets cdns_xspi->xfer_error =3D t=
rue
and completes cdns_xspi->auto_cmd_complete:

	irq_status =3D readl(cdns_xspi->iobase + CDNS_XSPI_TRD_ERR_INTR_STATUS);
	if (irq_status) {
		writel(irq_status,
		       cdns_xspi->iobase + CDNS_XSPI_TRD_ERR_INTR_STATUS);

		if (irq_status & CDNS_XSPI_ACMD_THRD_0_MASK) {
			cdns_xspi->xfer_error =3D true;
			acmd_done =3D true;
		}

		result =3D IRQ_HANDLED;
	}

Because cdns_xspi_acmd_read() returns -EIO as soon as cdns_xspi->xfer_error=
 is
true, cdns_xspi_acmd_check_status() -> cdns_xspi_check_command_status() is
bypassed on thread error interrupts, skipping all error logging (including =
the
new CDNS_XSPI_CMD_STATUS_DEVICE_ERROR check) and returning -EIO instead of
-EPROTO.

> +
> +static bool cdns_xspi_acmd_can_read(const struct cdns_xspi_dev *cdns_xsp=
i,
> +				    const struct spi_mem_op *op)
> +{
> +	if (!cdns_xspi->has_acmd)
> +		return false;
> +
> +	if (op->data.dir !=3D SPI_MEM_DATA_IN || !op->addr.nbytes)
> +		return false;
> +
> +	return op->data.nbytes >=3D CDNS_XSPI_ACMD_MIN_BYTES;
> +}
> +
>  static int cdns_xspi_mem_op(struct cdns_xspi_dev *cdns_xspi,
>  			    struct spi_mem *mem,
>  			    const struct spi_mem_op *op)
> @@ -605,6 +818,9 @@ static int cdns_xspi_mem_op(struct cdns_xspi_dev *cdn=
s_xspi,
>  	if (cdns_xspi->cur_cs !=3D spi_get_chipselect(mem->spi, 0))
>  		cdns_xspi->cur_cs =3D spi_get_chipselect(mem->spi, 0);
> =20
> +	if (cdns_xspi_acmd_can_read(cdns_xspi, op))
> +		return cdns_xspi_acmd_read(cdns_xspi, op);
> +
>  	return cdns_xspi_send_stig_command(cdns_xspi, op,
>  					   (dir !=3D SPI_MEM_NO_DATA));
>  }

[Severity: Medium]
Can cdns_xspi_transfer_one_message_b0() issue STIG commands while the
controller is still left in CDNS_XSPI_WORK_MODE_ACMD?

When mrvl_hw_overlay is enabled, marvell_xspi_mem_ops.exec_op calls
marvell_xspi_mem_op_execute() -> cdns_xspi_mem_op() -> cdns_xspi_acmd_read(=
),
which switches CDNS_XSPI_CTRL_CONFIG_REG to CDNS_XSPI_WORK_MODE_ACMD.

However, cdns_xspi_transfer_one_message_b0() in
drivers/spi/spi-cadence-xspi.c triggers STIG generic commands directly with=
out
calling cdns_xspi_set_work_mode(cdns_xspi, CDNS_XSPI_WORK_MODE_STIG):

			if (current_transfer_len < 10) {
				cdns_xspi_prepare_generic(cs, txd, current_transfer_len,
							  false, cmd_regs);
				cdns_xspi_trigger_command(cdns_xspi, cmd_regs);
				if (!cdns_xspi_is_stig_ready(cdns_xspi, true))
					return -EIO;
			} else {
				cdns_xspi_prepare_generic(cs, txd, 1, true, cmd_regs);
				cdns_xspi_trigger_command(cdns_xspi, cmd_regs);
				cdns_xspi_prepare_transfer(cs, 1, current_transfer_len - 1,
							   cmd_regs);
				cdns_xspi_trigger_command(cdns_xspi, cmd_regs);

If a controller with mrvl_hw_overlay uses ACMD mode and then runs a regular=
 SPI
transfer via cdns_xspi_transfer_one_message_b0(), won't writing STIG command
words to CDNS_XSPI_CMD_REG_0..5 while in ACMD mode be misinterpreted by the
hardware as an ACMD command?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029-xspi-caden=
ce-add-acmd-v1-0-53cd44690e04@analog.com?part=3D3
