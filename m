Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428329;
	b=tkmxtTmxy1PNLSzALs7Z47wt8DlUunsKlnW9DFw4GSo39oIDag7IKCYTD/GSqKBT/dBf
	 gQaakF5mgEFmXBZzTIKmQuAokKDtwfj+JUKSb7SUObiGRTrPHbHDwZPPv0qnphzhaPWSG
	 PPc0Xo89caAn3LnMf1h1lDt8Xb/KRMBZl8U3VW+1c3V6SNeF6ZJblRxo/zw8YtripByst
	 HKE1wloH6nA4fMb91TQz4QnWtxTjxmd48jM37RsarJFZUvqWr+cQBUmeAb0L/03h3pMkt
	 DVUn+EZCkZhml0D9ScoP1mTI1RuqE1NUPV+jZHidHXu1L+ecM0XgIujCLErHl8sGssQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428329;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QQZgVkcJ/TANVsFTmZIKMPM1BlK5beIL8SDsM5Ps0CU=;
	b=5JSTGxvAljyYyF1hnRJ5XrZjyAVa6/yyxNtBH0UMJwJCk5oi7wdxojqljgqJ/n30wqBe
	 YmDol6fvyGVXzweCiJSU3liTcSUK6HNAUMdIKkAElEPCrdUKixtPrSLbzk5YYAtUrdlp1
	 e++I4JV+t8Oq1FqgYoIWZw3ZbA3tr2/58V0FCFppzZO6RjtqltkZYwsBE64sDRdh7xgin
	 HXP75gteHsc7PM0vA+b9JhtKHGH0YI/k9V1wzYug7sQi3wCJ3lOCC0WFg1ussr3L8VB6Y
	 plXuHCoakSGiXLZ8hGWXgDMOIxukA4jR+3ci6SMWHiLrAfVaSmGQzSRcMlcO3wVr5EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RwtoyoAV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6615D606A32C
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RwtoyoAV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80EF01F000D0;
	Mon, 23 Nov 2026 10:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795428328;
	bh=QQZgVkcJ/TANVsFTmZIKMPM1BlK5beIL8SDsM5Ps0CU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RwtoyoAVM+wV9kg4/rl9qhapdfUUw8GT7mtWCuuxLNcDboEUl43sl5z9nd62ACrJW
	 txoqFd8+Dryemiof/tiShjqwcoFyXRjVTAEt1+b6cwvkUwi++dcUcBE1DvOFjcacUy
	 83BqiTV6/UAjgrbECYBcpe+z2VYVF1frQzCfQfoOn6ijRIe6cMWjWmw4wvk60NCFY5
	 2Wnrqievite5qwdNXxC3fnY03gJievPGSJoTH0JwFft6i/bhuYXQsm2QtWWaksY1M4
	 SAnNG2y8RPGwWpHsjBYrjGSAbWa98d/SxItXiH3XkoGHU+zAV+nm3yqnSj/4TsEt/V
	 rocjJ3YbeG+NQ==
Message-ID: <sashiko-outbox-229025@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] spi: loongson-io: Add SPI-IO interrupt-driven
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <010b8f2cd618854142124c6418f4e9ccb80fb852.1795425389.git.zhoubinbin@loongson.cn>
References: <cover.1795425389.git.zhoubinbin@loongson.cn>
 <010b8f2cd618854142124c6418f4e9ccb80fb852.1795425389.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 10:05:28 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] spi: loongson-io: missing error IRQ enables and uncleared SR1
  in ISR
- [High] spi: loongson-io: 32-bit divisor truncation in
  loongson_spi_io_timeout()
- [Medium] spi: loongson-io: IRQ enabled before hardware and batch init
  in probe/xfer
- [Medium] spi: loongson-io: unsynchronized timeout in
  loongson_spi_io_transfer_one()
- [Low] spi: loongson-io: inverted @high CS contract in
  loongson_spi_io_set_cs()
--

commit 7a2b450ad49a89d82f040f8bc7f2f42d5aadeb60
Author: Binbin Zhou <zhoubinbin@loongson.cn>

spi: loongson-io: Add SPI-IO interrupt-driven driver

This commit adds an interrupt-driven platform driver for the Loongson-2K0300
SPI-IO controller (SPI2 and SPI3).

> diff --git a/drivers/spi/spi-loongson-io.c b/drivers/spi/spi-loongson-io.c
> new file mode 100644
> index 0000000000000..e273c9f4a9430
> --- /dev/null
> +++ b/drivers/spi/spi-loongson-io.c
> @@ -0,0 +1,737 @@

[ ... ]

> +static unsigned long loongson_spi_io_timeout(struct loongson_spi_priv *p=
riv,
> +					     struct spi_transfer *xfer)
> +{
> +	u64 frames =3D xfer->len / priv->frame_bytes;
> +	u64 nsec =3D frames * priv->bits_per_word * NSEC_PER_SEC;
> +	u32 rate =3D priv->hz ? priv->hz : 1000;
> +	u64 msec =3D DIV_ROUND_UP_ULL(nsec, (u64)rate * NSEC_PER_MSEC);
> +
> +	return msecs_to_jiffies(max_t(u64, msec * 2, 1000));
> +}

[Severity: High]
Does DIV_ROUND_UP_ULL() truncate the 64-bit divisor (u64)rate * NSEC_PER_MS=
EC
to 32 bits?

DIV_ROUND_UP_ULL() expands to do_div(), which casts its divisor to uint32_t.
For any SPI clock rate >=3D 4,295 Hz, (u64)rate * NSEC_PER_MSEC exceeds
U32_MAX, corrupting the timeout calculation, and when rate is a multiple of
67,108,864 Hz (2^26 Hz), the truncated 32-bit divisor becomes zero and caus=
es
a division-by-zero panic.  In addition, because transfers run in 4-byte IRQ
batches, computing the timeout from ideal wire speed alone leaves large
high-speed transfers clamped at the 1000 ms floor despite per-batch interru=
pt
and MMIO overhead; using DIV64_U64_ROUND_UP() avoids the divisor truncation.

[ ... ]

> +/**
> + * loongson_spi_io_set_cs() - Set the hardware chip-select output
> + * @spi: SPI target device
> + * @high: true to assert chip select
> + *
> + * The SSREV bit controls the hardware chip-select assertion state.
> + */
> +static void loongson_spi_io_set_cs(struct spi_device *spi, bool high)
> +{
> +	struct loongson_spi_priv *priv =3D spi_controller_get_devdata(spi->cont=
roller);
> +	u32 val =3D high ? LOONGSON_SPI_IO_CR1_SSREV : 0;
> +
> +	loongson_spi_update_bits(priv, LOONGSON_SPI_IO_CR1_REG,
> +				 LOONGSON_SPI_IO_CR1_SSREV, val);
> +}

[Severity: Low]
Is the @high polarity in loongson_spi_io_set_cs() inverted relative to the
SPI core's set_cs() contract?

Because SPI_CS_HIGH is not set in host->mode_bits, spi_set_cs() passes
high =3D=3D false (logic low) to assert an active-low chip select and
high =3D=3D true (logic high) to deassert it.  If LOONGSON_SPI_IO_CR1_SSREV
asserts chip select as the comment states, the ternary condition is inverte=
d;
if it drives the CS line high, the kernel-doc comment is inverted.

[ ... ]

> +static irqreturn_t loongson_spi_io_irq_handler(int irq, void *dev_id)
> +{
> +	struct loongson_spi_priv *priv =3D dev_id;
> +	u32 rx_data;
> +	u32 sr1;
> +
> +	sr1 =3D loongson_spi_readl(priv, LOONGSON_SPI_IO_SR1_REG);
> +
> +	if (sr1 & LOONGSON_SPI_IO_SR1_ERR_MASK) {
> +		dev_err(&priv->controller->dev, "SPI error: SR1=3D0x%x", sr1);
> +		loongson_spi_writel(priv, LOONGSON_SPI_IO_IER_REG, 0);
> +		priv->xfer_ret =3D -EIO;
> +		complete(&priv->xfer_completion);
> +		return IRQ_HANDLED;
> +	}

[Severity: High]
Does the error path in loongson_spi_io_irq_handler() leave
LOONGSON_SPI_IO_SR1_ERR_MASK latched in LOONGSON_SPI_IO_SR1_REG while none =
of
the error interrupt bits are enabled in LOONGSON_SPI_IO_IER_REG?

loongson_spi_io_transfer_one() only enables LOONGSON_SPI_IO_IER_EOTIE, so an
overrun, underrun, mode fault, or CRC error that halts a transfer before EOT
never raises an interrupt and stalls until the transfer timeout.  Conversel=
y,
because loongson_spi_io_irq_handler() does not mask sr1 against
LOONGSON_SPI_IO_IER_REG and does not write LOONGSON_SPI_IO_SR1_ERR_MASK back
to LOONGSON_SPI_IO_SR1_REG to clear the status bits, any latched error bit
causes every subsequent interrupt from another device on the shared IRQ line
to re-enter this error branch, log an error, and complete
priv->xfer_completion while idle.

[ ... ]

> +	reinit_completion(&priv->xfer_completion);
> +	priv->xfer_mode =3D XFER_INTERRUPT;
> +
> +	loongson_spi_update_bits(priv, LOONGSON_SPI_IO_CR1_REG,
> +				 LOONGSON_SPI_IO_CR1_AUTOSUS,
> +				 LOONGSON_SPI_IO_CR1_AUTOSUS);
> +	loongson_spi_update_bits(priv, LOONGSON_SPI_IO_IER_REG,
> +				 LOONGSON_SPI_IO_IER_EOTIE,
> +				 LOONGSON_SPI_IO_IER_EOTIE);
> +
> +	loongson_spi_io_start_batch(priv);
> +
> +	ret =3D wait_for_completion_timeout(&priv->xfer_completion,
> +					  loongson_spi_io_timeout(priv, xfer));
> +	priv->xfer_mode =3D XFER_IDLE;
> +
> +	if (ret =3D=3D 0) {
> +		loongson_spi_writel(priv, LOONGSON_SPI_IO_IER_REG, 0);
> +		dev_err(&spi->dev, "Interrupt transfer timeout");
> +		return -ETIMEDOUT;
> +	}
> +
> +	return priv->xfer_ret;
> +}

[Severity: Medium]
Can a timeout in loongson_spi_io_transfer_one() race with an in-flight
loongson_spi_io_irq_handler() on another CPU?

CPU0                              CPU1
loongson_spi_io_transfer_one()
  wait_for_completion_timeout()
  /* times out */
                                  loongson_spi_io_irq_handler()
                                    switch (priv->xfer_mode)
                                    case XFER_INTERRUPT:
  priv->xfer_mode =3D XFER_IDLE;
  loongson_spi_writel(..., IER_REG, 0);
  return -ETIMEDOUT;
spi_transfer_one_message()
  spi_dma_sync_for_cpu()
                                      memcpy(priv->rx_buf, ...)
                                      loongson_spi_io_start_batch()
                                        loongson_spi_update_bits(CR1_REG)
  spi_set_cs()
    loongson_spi_io_set_cs()
      loongson_spi_update_bits(CR1_REG)  <-- unlocked RMW race
  loongson_spi_io_handle_err()
    synchronize_irq(priv->irq)

Because loongson_spi_io_transfer_one() returns -ETIMEDOUT without a spinlock
or synchronize_irq(priv->irq), spi_transfer_one_message() runs
spi_dma_sync_for_cpu() and loongson_spi_io_set_cs() before calling
loongson_spi_io_handle_err().  A concurrent ISR that already read
XFER_INTERRUPT can touch priv->rx_buf and priv->tx_buf, start another hardw=
are
batch, and perform an unlocked read-modify-write on LOONGSON_SPI_IO_CR1_REG
concurrently with loongson_spi_io_set_cs(), clobbering
LOONGSON_SPI_IO_CR1_SSREV or LOONGSON_SPI_IO_CR1_CSTART.

[ ... ]

> +	ret =3D devm_request_irq(dev, priv->irq, loongson_spi_io_irq_handler,
> +			       IRQF_SHARED, dev_name(dev), priv);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to request IRQ");
> +
> +	loongson_spi_io_reginit(priv);
> +	loongson_spi_writel(priv, LOONGSON_SPI_IO_IER_REG, 0);

[Severity: Medium]
Can an interrupt on the shared IRQ line fire in loongson_spi_io_probe() bef=
ore
the controller registers are initialized and LOONGSON_SPI_IO_IER_REG is
masked?

devm_request_irq() registers the IRQF_SHARED handler before
loongson_spi_io_reginit() runs and before LOONGSON_SPI_IO_IER_REG is cleared
(and without clearing stale status flags in LOONGSON_SPI_IO_SR1_REG).
Similarly, in loongson_spi_io_transfer_one(), priv->xfer_mode =3D XFER_INTE=
RRUPT
and LOONGSON_SPI_IO_IER_EOTIE are set before loongson_spi_io_start_batch()
initializes priv->batch_size and clears LOONGSON_SPI_IO_SR1_EOT, leaving a
window where a shared or stale IRQ sees the previous transfer's
priv->batch_size.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795425389.gi=
t.zhoubinbin@loongson.cn?part=3D3
