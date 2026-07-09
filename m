Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E109E3BE154
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 14:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783608638; cv=none; b=ehfyyzS98S9r4rIYZ1IvVs98RO9yF4p3MRthsCEk69/thaDJHkjQT/J1ICaJZYOh4aujQukfCKXKEU819xYQpzHH3h9TABlx2sCTR2mFqpz5GarxOVS/1wUn5+5VvPP7Mu93tLgV8LNLlr7FRnyjZ/9OPpZZCw0YbXNS63apSAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783608638; c=relaxed/simple;
	bh=1NUM3jZQhSZqKuk4mi5S0jxhmAYCHKu1zcpa8bIMT5Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WyBuv/BpLpIbm05lt+nshdUMoPuET8qzSmUDbCNdA1F8vvt33VE/AfQmKuEB+Ft+KAwtbT1LCB5noBeV4rlz9ZgtbCtppihX87ADay8cgIWp6EdhjCiD4baZ4FO2Y+FGlk5Fv4Jnks/GNMNE2h53l1tyHZPkuBBwfOWpQs0U2dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D06gWHDf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D06gWHDf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC291F000E9;
	Thu,  9 Jul 2026 14:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783608636;
	bh=Y3U0wJ+ikIQC0588EC3yGaaNjpFhjcXmYu9mApejvJY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D06gWHDfkpaJodfY4VFJEhGqZJ3o2F2Gpi7mJXkgZBnY1kQSwjSmWt+NYwEVkTPMW
	 9VidR+IKCpEgNn1tHMQRgAYHAmRe/KSsx51k5kk5jx+xl7nvLo16qtq/ArhXtywCcQ
	 +CSsjHgf5wKZpSLT9TFOwdj65RlXCh1Hqijf6OMsZ30mG7ZL4R1rfT/zi1/WjiE2h7
	 pFqfpjNaVGZ5gZW8/L/ww0EuQTQCeGG+MzC6KuMj6eJKFlMDj9NyUCMu6w/jpmpzHU
	 ot1b5Jn/mdXBG5Dne84Hji/YOqQnPEH8s3j/JSVfb9d1XaMVYXBcOUauNqqqkbvEnH
	 dgQAzKz9shB3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 07/11] spi: dw: use irq handler for enhanced spi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709055204.138168-8-changhuang.liang@starfivetech.com>
References: <20260709055204.138168-1-changhuang.liang@starfivetech.com>
 <20260709055204.138168-8-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 14:50:35 +0000
Message-Id: <20260709145036.4DC291F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Integer underflow when writing to the DW_SPI_RXFTLR hardware regis=
ter causes 0xFFFFFFFF to be written.
- [High] A hardcoded 5 microsecond delay before unmasking interrupts can ca=
use RX FIFO overflow during high-speed SPI reads.
- [High] Enhanced SPI memory operations for write and no-data commands are =
prematurely aborted, discarding data still in the TX FIFO.
- [High] Hardware errors (FIFO underflows/overflows) during enhanced SPI me=
mory operations are silently ignored, reporting success.
- [High] Missing interrupt mask on the timeout path of `dw_spi_exec_enh_mem=
_op` leads to a Use-After-Free and interrupt storm.
--

--- Patch [7]: [PATCH v1 07/11] spi: dw: use irq handler for enhanced spi -=
--
commit 788453296e7040a4cdd9daf4c44b6d7c00eb97d0
Author: Sudip Mukherjee <sudip.mukherjee@sifive.com>

spi: dw: use irq handler for enhanced spi

This commit introduces an interrupt handler for enhanced SPI to perform
reads and writes based on generated IRQs. It also utilizes the
xfer_completion from spi_controller to wait for a timeout or completion
from the new IRQ handler.

> diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
> --- a/drivers/spi/spi-dw-core.c
> +++ b/drivers/spi/spi-dw-core.c
> @@ -248,6 +248,34 @@ static irqreturn_t dw_spi_transfer_handler(struct dw=
_spi *dws)
>  	return IRQ_HANDLED;
>  }
> =20
> +static irqreturn_t dw_spi_enh_handler(struct dw_spi *dws)
> +{
> +	u16 irq_status =3D dw_readl(dws, DW_SPI_ISR);
> +
> +	if (dw_spi_check_status(dws, false)) {
> +		spi_finalize_current_transfer(dws->ctlr);
> +		return IRQ_HANDLED;
> +	}

[Severity: High]
Does this silently ignore hardware errors during memory operations?

When a hardware error like an RX FIFO overflow occurs, dw_spi_check_status()
attempts to record the error by setting dws->ctlr->cur_msg->status.
However, memory operations bypass the standard spi_message queue, so cur_msg
is NULL and the error code is discarded.

The handler then signals completion, and the caller sees a successful wait
without knowing the data might be corrupted.

> +
> +	if (irq_status & DW_SPI_INT_RXFI) {
> +		dw_reader(dws);
> +		if (dws->rx_len <=3D dw_readl(dws, DW_SPI_RXFTLR))
> +			dw_writel(dws, DW_SPI_RXFTLR, dws->rx_len - 1);
> +	}

[Severity: High]
Can this cause an integer underflow when writing to the hardware register?

When a read operation finishes and dws->rx_len reaches 0, the check evaluat=
es
to true, and this writes 0xFFFFFFFF to DW_SPI_RXFTLR.

> +
> +	if (irq_status & DW_SPI_INT_TXEI)
> +		dw_writer(dws);
> +
> +	if (!dws->tx_len && dws->rx_len) {
> +		dw_spi_mask_intr(dws, DW_SPI_INT_TXEI);
> +	} else if (!dws->rx_len && !dws->tx_len) {
> +		dw_spi_mask_intr(dws, 0xff);
> +		spi_finalize_current_transfer(dws->ctlr);
> +	}
> +
> +	return IRQ_HANDLED;
> +}

[Severity: High]
Does this prematurely abort write operations?

For write-only operations like flashing memory, dws->tx_len drops to 0 as s=
oon
as all bytes are pushed into the TX FIFO. This signals completion immediate=
ly,
before the hardware actually transmits the bytes over the wire.

The upstream caller will then disable the SPI chip, which flushes the FIFOs
and discards the trailing bytes.

[ ... ]

> @@ -399,6 +434,34 @@ static void dw_spi_irq_setup(struct dw_spi *dws)
>  	dw_spi_umask_intr(dws, imask);
>  }
> =20
> +static void dw_spi_enh_irq_setup(struct dw_spi *dws)
> +{
> +	u16 level;
> +	u8 imask;
> +
> +	/*
> +	 * Originally Tx and Rx data lengths match. Rx FIFO Threshold level
> +	 * will be adjusted at the final stage of the IRQ-based SPI transfer
> +	 * execution so not to lose the leftover of the incoming data.
> +	 */
> +	level =3D min_t(unsigned int, dws->fifo_len / 2, dws->tx_len);
> +	dw_writel(dws, DW_SPI_TXFTLR, level);
> +
> +	/*
> +	 * In enhanced mode if we are reading then tx_len is 0 as we
> +	 * have nothing to transmit. Calculate DW_SPI_RXFTLR with
> +	 * rx_len.
> +	 */
> +	level =3D min_t(unsigned int, dws->fifo_len / 2, dws->rx_len);
> +	dw_writel(dws, DW_SPI_RXFTLR, level - 1);

[Severity: High]
Will this write 0xFFFFFFFF to DW_SPI_RXFTLR during TX-only operations?

For any TX-only memory operation like a flash write, dws->rx_len is 0. This
results in level becoming 0, causing an unconditional write of 0xFFFFFFFF
to the hardware register.

[ ... ]

> @@ -906,9 +970,36 @@ static int dw_spi_exec_enh_mem_op(struct spi_mem *me=
m, const struct spi_mem_op *
> =20
>  	dw_spi_update_config(dws, mem->spi, &cfg, &enh_cfg);
> =20
> +	dw_spi_mask_intr(dws, 0xff);
> +	reinit_completion(&ctlr->xfer_completion);
>  	dw_spi_enable_chip(dws, 1);
> =20
>  	dw_spi_enh_write_cmd_addr(dws, op);
> +	dw_spi_set_cs(mem->spi, false);
> +
> +	udelay(5);
> +
> +	dw_spi_enh_irq_setup(dws);

[Severity: High]
Can this delay cause an RX FIFO overflow?

The hardware transfer begins when CS is asserted, but the CPU blocks on this
udelay(5) before unmasking the interrupts.

During these 5 microseconds, the hardware is actively running and clocking =
in
data, but the CPU is prevented from draining the RX FIFO. At higher SPI clo=
ck
speeds with smaller FIFOs, this can result in the hardware receiving more d=
ata
than the FIFO can hold within 5us, leading to an RX overflow and data loss.

> +
> +	/* Use timeout calculation from spi_transfer_wait() */
> +	ms =3D 8LL * MSEC_PER_SEC * (dws->rx_len ? dws->rx_len : dws->tx_len);
> +	do_div(ms, dws->current_freq);
> +
> +	/*
> +	 * Increase it twice and add 200 ms tolerance, use
> +	 * predefined maximum in case of overflow.
> +	 */
> +	ms +=3D ms + 200;
> +	if (ms > UINT_MAX)
> +		ms =3D UINT_MAX;
> +
> +	ms =3D wait_for_completion_timeout(&ctlr->xfer_completion,
> +					 msecs_to_jiffies(ms));
> +
> +	dw_spi_stop_mem_op(dws, mem->spi);
> +
> +	if (ms =3D=3D 0)
> +		return -EIO;

[Severity: High]
Does this timeout path leave interrupts unmasked and cause a use-after-free?

If wait_for_completion_timeout() times out, this returns -EIO without
masking the interrupts via dw_spi_mask_intr().

Calling dw_spi_stop_mem_op() disables and re-enables the SPI chip, which
flushes the TX FIFO. Because the TXEI interrupt was never masked, re-enabli=
ng
the chip instantly triggers the interrupt.

The unmasked dw_spi_enh_handler() will fire asynchronously and call
dw_writer() to push more data, dereferencing dws->tx. Since this function
already returned -EIO, the upstream caller likely freed or popped the buffer
off the stack.

> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709055204.1381=
68-1-changhuang.liang@starfivetech.com?part=3D7
