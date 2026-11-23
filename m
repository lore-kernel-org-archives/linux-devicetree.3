Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429025;
	b=QP2yXs/lkEdzO6P8hxIdglWWzxNje4l7Zkn8d9j6m/NIw42FZ4Ro6/RTuX4oTGf8gLem
	 rV0KjLjxuxIKqe1nwroVj8YzJQllOPfzh6TBGxTYa1cH+nZPcmJe8GwEo6ydy55bUUH2Y
	 YIklN1M9+UPZjsl2mjIKvJ9cf50nB+7B9lNQhxzBVFQssZzI+fYMsp10ZtP2o6G8QXEE8
	 Tk0BtqFuVIi2dDvELBkc1OeVxxPqTEXNNyDf4dAsCxy43+Hvdn37Zu9sDATZ8Ikce6uN3
	 iHCWCIoFvxnoDAZ43CJlo+lo0AupgRDYcBFtubl7rSfgaUO6RZG3ZOT/g7lqfI+uPGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429025;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ovSWVOZqW2HHbvqAgH+Rz53AY9j9Y7v6mbVn7bgej5c=;
	b=ZyhlOJHfO0ljP/jYm1h4+AQvS0VQZbXC68xZp7DehLUfAE+ywCaX0sE/aioVT3PfpkFg
	 r4uH1haL3xgxOLbLzk7s2HY6+/d9QilV2SLLBzLRs/Pl9/hVk3OWytbPP2R1L4l28nBW0
	 6TreQWN5bUFm/smnXBk6VKueSxYNZTwQm0HBfj5nOAatHhHTRJxR6v+d/CttbQmqqqTlQ
	 Wvt8ZC/pvuanpjKm7cSl9ReDF0abArMHEGvTbnvMXmZ4mC2E5d/6H7oIEbk6M7zYHl5hi
	 NKGcCdBZcXYE7qOPUAI8PsAvy7Uzsv9HCo5d/ku5ibEReZfJrsYpeN65uwR30mS5AyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A7rWbWeK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201AD606A333
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A7rWbWeK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3E11F000D1;
	Mon, 23 Nov 2026 10:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795429024;
	bh=ovSWVOZqW2HHbvqAgH+Rz53AY9j9Y7v6mbVn7bgej5c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A7rWbWeKWYpQyH+LHTkOhGP7qwYQv39VtrNuO5HwYGmp7RkHoyjIebhPWmSUWVQsL
	 Vz2XF7GKK0ZOexJ8g9lS/YismE2n3PlScIdkonROksGkPXZEV9emrJkk6DNdZuH0PM
	 qzH02Oy5luPRgOS2MipLqjPWplAuI1b3vdpdcugrZe0heXr9pOM+RR21b2sg9D8yeM
	 fonWQm46msZK9HNp9M+mLiPdg/tRtL5ygmXOZ33fyxJs2SZyzyp/pDzBacPlO1Jk7e
	 RVNKEYfK9pw8FuniiL9d23cgnExeMJ/PILyZ7r5FemGHfxRDiP0dvXoOS/foqTr8Nu
	 m2aspTzWoqakQ==
Message-ID: <sashiko-outbox-229031@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] spi: loongson-io: Add DMA support to SPI-IO driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <c97601131ad439f6648e5c8d5a624a2588479728.1795425389.git.zhoubinbin@loongson.cn>
References: <cover.1795425389.git.zhoubinbin@loongson.cn>
 <c97601131ad439f6648e5c8d5a624a2588479728.1795425389.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 10:17:04 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 8 potential
issues to consider:
- [High] spi: loongson-io: device DMA sync in
  loongson_spi_io_dma_drain_rx() loses tail
- [High] spi: loongson-io: ERR_PTR dereference in
  loongson_spi_dma_config_and_submit()
- [Medium] spi: loongson-io: PIO fallback in
  loongson_spi_io_transfer_one() corrupts RX
- [Medium] spi: loongson-io: loongson_spi_io_transfer_one() re-evaluates
  can_dma()
- [Medium] spi: loongson-io: EOT IRQ left enabled after
  loongson_spi_dma_transfer()
- [Medium] spi: loongson-io: leaked TX DMA channel in
  loongson_spi_io_probe() fallback
- [Medium] spi: loongson-io: missing buffer alignment and presence
  checks in loongson_spi_can_dma()
- [Low] spi: loongson-io: unmasked EOTIE on exit in
  loongson_spi_dma_transfer()
--

commit b9f174f53160693a3668bfcf2827fd85a0dafb9d
Author: Binbin Zhou <zhoubinbin@loongson.cn>

spi: loongson-io: Add DMA support to SPI-IO driver

This commit adds optional TX and RX DMA channel support to the Loongson
SPI-IO controller driver, falling back to interrupt mode when DMA is
unavailable or below the transfer threshold.

> diff --git a/drivers/spi/spi-loongson-io.c b/drivers/spi/spi-loongson-io.c
> index e273c9f4a9430..c153e483ab41d 100644
> --- a/drivers/spi/spi-loongson-io.c
> +++ b/drivers/spi/spi-loongson-io.c
[ ... ]
> @@ -264,11 +292,59 @@ static unsigned long loongson_spi_io_timeout(struct=
 loongson_spi_priv *priv,
>  	return msecs_to_jiffies(max_t(u64, msec * 2, 1000));
>  }
[ ... ]
> +static void loongson_spi_io_dma_drain_rx(struct loongson_spi_priv *priv,
> +					 struct spi_transfer *xfer)
> +{
> +	struct device *rx_dev =3D dmaengine_get_dma_device(priv->dma_rx);
> +	u32 rxflv =3D FIELD_GET(LOONGSON_SPI_IO_SR2_RXFLV,
> +			      loongson_spi_readl(priv, LOONGSON_SPI_IO_SR2_REG));
> +	u8 frame_bytes =3D priv->frame_bytes;
> +	u8 *dst =3D NULL;
> +	u32 data;
> +
> +	if (!rxflv)
> +		return;
> +
> +	if (xfer->rx_buf && rxflv <=3D xfer->len)
> +		dst =3D (u8 *)xfer->rx_buf + xfer->len - rxflv;
> +
> +	/* SPI core skips cache sync while transfer_one() is running. */
> +	dma_sync_sgtable_for_cpu(rx_dev, &xfer->rx_sg, DMA_FROM_DEVICE);
> +	loongson_spi_io_set_thresh(priv, false);
> +
> +	while (rxflv) {
> +		data =3D loongson_spi_io_read_dr(priv);
> +		if (dst) {
> +			memcpy(dst, &data, frame_bytes);
> +			dst +=3D frame_bytes;
> +		}
> +		rxflv -=3D frame_bytes;
> +	}
> +
> +	dma_sync_sgtable_for_device(rx_dev, &xfer->rx_sg, DMA_FROM_DEVICE);
> +}

[Severity: High]
Does the final dma_sync_sgtable_for_device(..., DMA_FROM_DEVICE) cause
the drained tail bytes in xfer->rx_buf to be overwritten when
transfer_one() returns?

When loongson_spi_io_transfer_one() returns 0, spi_transfer_one_message()
calls spi_dma_sync_for_cpu(), which runs dma_sync_sgtable_for_cpu(...,
DMA_FROM_DEVICE) on xfer->rx_sg.  For a DMA_FROM_DEVICE mapping,
syncing for the device does not copy CPU writes into an active SWIOTLB
bounce buffer (and invalidates cache lines on non-coherent DMA), so the
subsequent sync for the CPU copies the stale bounce buffer back over the
bytes memcpy() just wrote into xfer->rx_buf.

[ ... ]

> @@ -423,6 +499,42 @@ static int loongson_spi_io_setup(struct spi_device *=
spi)
>  	return 0;
>  }
> =20
> +/**
> + * loongson_spi_can_dma() - Check whether a transfer can use DMA
> + * @ctrl: SPI controller
> + * @spi: SPI target device
> + * @xfer: SPI transfer to check
> + *
> + * DMA requires both channels, a four-byte-aligned length and a transfer=
 at
> + * least as large as dma_threshold. Three-wire transfers use interrupt m=
ode
> + * because the DMA path requires both TX and RX scatterlists.
> + *
> + * Return: true when DMA is supported for @xfer.
> + */
> +static bool loongson_spi_can_dma(struct spi_controller *ctrl, struct spi=
_device *spi,
> +				 struct spi_transfer *xfer)
> +{
> +	struct loongson_spi_priv *priv =3D spi_controller_get_devdata(ctrl);
> +
> +	if (!priv->use_dma)
> +		return false;
> +
> +	/* The DMA path requires both TX and RX scatterlists. */
> +	if (spi->mode & SPI_3WIRE)
> +		return false;
> +
> +	if (xfer->len < dma_threshold)
> +		return false;
> +
> +	if (!xfer->tx_buf && !xfer->rx_buf)
> +		return false;
> +
> +	if (xfer->len % 4)
> +		return false;
> +
> +	return true;
> +}

[Severity: Medium]
Does loongson_spi_can_dma() also need to check that xfer->tx_buf and
xfer->rx_buf are both non-NULL and 4-byte aligned, and that xfer->len is
non-zero?

loongson_spi_dma_config_and_submit() configures DMA_SLAVE_BUSWIDTH_4_BYTES
on both channels.  When an unaligned vmalloc buffer is split at page
boundaries by spi_map_buf_attrs(), each scatterlist segment length is
PAGE_SIZE - offset_in_page(buf) (not a multiple of 4), and
loongson2_cmc_dma_prep_slave_sg() rounds each segment up with
DIV_ROUND_UP(sg_dma_len(sg), 4), reading or writing extra bytes across
segment boundaries.

In addition, checking (!xfer->tx_buf && !xfer->rx_buf) allows a transfer
with only one buffer to pass if dummy buffer allocation is not active, and
if dma_threshold is set to 0 via sysfs, a transfer with xfer->len =3D=3D 0
passes loongson_spi_can_dma() and fails in sg_alloc_table() with -EINVAL.

> @@ -464,14 +576,191 @@ static int loongson_spi_io_start_batch(struct loon=
gson_spi_priv *priv)
>  	return batch_size;
>  }
[ ... ]
> +static int loongson_spi_dma_config_and_submit(struct loongson_spi_priv *=
priv,
> +					      struct spi_transfer *xfer)
> +{
[ ... ]
> +	rx_desc =3D dmaengine_prep_slave_sg(priv->dma_rx, xfer->rx_sg.sgl,
> +					  xfer->rx_sg.nents, DMA_DEV_TO_MEM,
> +					  DMA_CTRL_ACK);
> +	if (!rx_desc) {
> +		dev_err(dev, "RX DMA prep_slave_sg failed");
> +		return -EINVAL;
> +	}
> +
> +	ret =3D dma_submit_error(dmaengine_submit(rx_desc));
> +	if (ret) {
> +		dev_err(dev, "RX DMA submit failed");
> +		return ret;
> +	}
> +
> +	tx_desc =3D dmaengine_prep_slave_sg(priv->dma_tx, xfer->tx_sg.sgl,
> +					  xfer->tx_sg.nents, DMA_MEM_TO_DEV,
> +					  DMA_CTRL_ACK);
> +	if (!tx_desc) {
> +		dev_err(dev, "TX DMA prep_slave_sg failed");
> +		return -EINVAL;
> +	}
> +
> +	ret =3D dma_submit_error(dmaengine_submit(tx_desc));

[Severity: High]
Can rx_desc or tx_desc be an ERR_PTR here, causing dmaengine_submit() to
dereference an error pointer?

The paired DMA engine driver returns ERR_PTR(-ENOMEM) or ERR_PTR(-EINVAL)
on failure rather than NULL:

drivers/dma/loongson/loongson2-apb-cmc-dma.c:loongson2_cmc_dma_prep_slave_s=
g() {
	...
	desc =3D kzalloc_flex(*desc, sg_req, sg_len, GFP_NOWAIT);
	if (!desc)
		return ERR_PTR(-ENOMEM);
	...
}

Using IS_ERR_OR_NULL() on rx_desc and tx_desc avoids dereferencing the
error pointer in dmaengine_submit().

[ ... ]

> +static int loongson_spi_dma_transfer(struct loongson_spi_priv *priv,
> +				     struct spi_transfer *xfer,
> +				     bool *bus_started)
> +{
[ ... ]
> +out_stop:
> +	loongson_spi_update_bits(priv, LOONGSON_SPI_IO_CR1_REG,
> +				 LOONGSON_SPI_IO_CR1_CSTART, 0);
> +	loongson_spi_update_bits(priv, LOONGSON_SPI_IO_CR2_REG,
> +				 LOONGSON_SPI_IO_CR2_DMAEN_MASK, 0);
> +	priv->xfer_mode =3D XFER_IDLE;

[Severity: Low]
Should out_stop also clear LOONGSON_SPI_IO_IER_EOTIE in
LOONGSON_SPI_IO_IER_REG?

loongson_spi_io_transfer_one() enables LOONGSON_SPI_IO_IER_EOTIE before
calling loongson_spi_dma_transfer(), and neither the XFER_DMA IRQ path nor
out_stop masks it again, leaving EOT interrupts enabled while
priv->xfer_mode is XFER_IDLE.

[ ... ]

> @@ -497,6 +786,12 @@ static irqreturn_t loongson_spi_io_irq_handler(int i=
rq, void *dev_id)
>  	loongson_spi_writel(priv, LOONGSON_SPI_IO_SR1_REG, LOONGSON_SPI_IO_SR1_=
EOT);
> =20
>  	switch (priv->xfer_mode) {
> +	case XFER_DMA:
> +		loongson_spi_update_bits(priv, LOONGSON_SPI_IO_CR1_REG,
> +					 LOONGSON_SPI_IO_CR1_CSTART, 0);
> +		priv->xfer_ret =3D 0;
> +		complete(&priv->xfer_completion);
> +		break;

[Severity: Medium]
If loongson_spi_dma_wait_eot() times out, can a late EOT interrupt race
with out_stop on LOONGSON_SPI_IO_CR1_REG and priv->xfer_mode?

CPU0                                    CPU1 (<hardirq>)
loongson_spi_dma_transfer()
  loongson_spi_dma_wait_eot()
    /* times out */
  out_stop:
    loongson_spi_update_bits(...,
      LOONGSON_SPI_IO_CR1_REG, ...)
                                        loongson_spi_io_irq_handler()
                                          case XFER_DMA:
                                            loongson_spi_update_bits(...,
                                              LOONGSON_SPI_IO_CR1_REG, ...)
    priv->xfer_mode =3D XFER_IDLE;

Because LOONGSON_SPI_IO_IER_EOTIE is still enabled when
loongson_spi_dma_wait_eot() times out, loongson_spi_io_irq_handler() can
run concurrently with out_stop and perform an unsynchronized
read-modify-write on LOONGSON_SPI_IO_CR1_REG, or fire after
priv->xfer_mode is set to XFER_IDLE.

[ ... ]

> @@ -563,7 +862,27 @@ static int loongson_spi_io_transfer_one(struct spi_c=
ontroller *ctrl, struct spi_
>  	loongson_spi_writel(priv, LOONGSON_SPI_IO_SR1_REG,
>  			    LOONGSON_SPI_IO_SR1_EOT | LOONGSON_SPI_IO_SR1_ERR_MASK);
> =20
> -	loongson_spi_io_set_thresh(priv);
> +	use_dma =3D ctrl->can_dma && ctrl->can_dma(ctrl, spi, xfer);
> +	loongson_spi_io_set_thresh(priv, use_dma);

[Severity: Medium]
Can calling ctrl->can_dma() again here disagree with the mapping decision
__spi_map_msg() already made for this transfer?

Because dma_threshold is writable at runtime (mode 0644), changing it
between __spi_map_msg() and loongson_spi_io_transfer_one() can make
can_dma() transition from false to true, causing
loongson_spi_dma_config_and_submit() to submit unmapped scatterlists with
nents =3D=3D 0 (which makes loongson2_cmc_dma_prep_slave_sg() allocate a
0-element sg_req[] array and loongson2_cmc_dma_start_transfer() read
sg_req[0] out of bounds).  If dma_threshold is raised instead, the
driver takes the interrupt PIO path while xfer->rx_sg is mapped and
owned by the DMA device, so SPI core's post-transfer
spi_dma_sync_for_cpu() overwrites xfer->rx_buf.  Checking
xfer->tx_sg_mapped && xfer->rx_sg_mapped here avoids both mismatches.

> +
> +	if (use_dma) {
> +		loongson_spi_update_bits(priv, LOONGSON_SPI_IO_SR1_REG,
> +					 LOONGSON_SPI_IO_SR1_EOT,
> +					 LOONGSON_SPI_IO_SR1_EOT);
> +		loongson_spi_update_bits(priv, LOONGSON_SPI_IO_IER_REG,
> +					 LOONGSON_SPI_IO_IER_EOTIE,
> +					 LOONGSON_SPI_IO_IER_EOTIE);
> +		ret =3D loongson_spi_dma_transfer(priv, xfer, &bus_started);
> +		if (!ret)
> +			return 0;
> +		if (bus_started) {
> +			dev_err(&spi->dev, "DMA transfer failed: %d", ret);
> +			return ret;
> +		}
> +
> +		dev_dbg(&spi->dev, "DMA setup failed (%d), using interrupt mode", ret);
> +		loongson_spi_io_set_thresh(priv, false);
> +	}

[Severity: Medium]
When DMA setup fails before bus_started is set, does falling through to
interrupt mode corrupt xfer->rx_buf because xfer->tx_sg and xfer->rx_sg
are still mapped and synced for the DMA device?

spi_transfer_one_message() calls spi_dma_sync_for_device() before
transfer_one() and spi_dma_sync_for_cpu() after transfer_one() returns 0.
If the driver runs PIO in place while xfer->rx_sg_mapped is true, the
post-transfer spi_dma_sync_for_cpu() copies the untouched SWIOTLB bounce
buffer over the PIO-received data in xfer->rx_buf.  Setting
xfer->error |=3D SPI_TRANS_FAIL_NO_START and returning ret lets
spi_transfer_one_message() unmap the scatterlists and retry via its
fallback_pio path.

[ ... ]

> @@ -702,6 +1059,26 @@ static int loongson_spi_io_probe(struct platform_de=
vice *pdev)
>  	host->min_speed_hz =3D (u32)min_t(u64, DIV_ROUND_UP_ULL(priv->clk_rate,=
 255),
>  					U32_MAX);
> =20
> +	priv->dma_tx =3D loongson_spi_io_request_dma_chan(dev, "tx");
> +	if (IS_ERR(priv->dma_tx))
> +		return PTR_ERR(priv->dma_tx);
> +
> +	priv->dma_rx =3D loongson_spi_io_request_dma_chan(dev, "rx");
> +	if (IS_ERR(priv->dma_rx))
> +		return PTR_ERR(priv->dma_rx);
> +
> +	if (priv->dma_tx && priv->dma_rx) {
> +		priv->use_dma =3D true;
> +		/* Let SPI core provide and map dummy buffers for full-duplex DMA. */
> +		host->flags |=3D SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX;
> +		host->dma_tx =3D priv->dma_tx;
> +		host->dma_rx =3D priv->dma_rx;
> +		host->can_dma =3D loongson_spi_can_dma;
> +		dev_info(dev, "DMA channels acquired");
> +	} else {
> +		dev_info(dev, "DMA unavailable, using interrupt mode only");
> +	}

[Severity: Medium]
If one DMA channel is acquired and the other returns NULL, does the
else branch leave the acquired channel allocated while running in
interrupt-only mode?

Because devm_dma_request_chan() only releases the channel when the device
is unbound, the unused channel remains held for the lifetime of the SPI
controller unless the else branch releases a non-NULL priv->dma_tx or
priv->dma_rx.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795425389.gi=
t.zhoubinbin@loongson.cn?part=3D4
