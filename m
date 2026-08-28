Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A72A3CF678
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 06:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787900238; cv=none; b=BsQ6xnOwFm7+nlqahofNCBp4hxsM8aPoj3YO42rimiUcBeAybUyARm9/0ccSjBBltRGMonWkX87+yqeZ5+On7rydM7sDTGvOQ5luvsKz2Wm3nC0y2WEWwqp+uAVJlFZKrGZvoTc8ACrdw4JTiHojE4WKXmfHqpbVQwGZry47B6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787900238; c=relaxed/simple;
	bh=wYlVDZiOMbt3KeytAEBSwXHy9SeaqkWrzUO4wSvbhEs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eRYr7/43gRrAFVgI3CNbg4Akgie92t7LJpY38lVdjYES+wMtM+UdU/s82SpFvkBy96IWyazpxo1x+t4PtPt5nbM8f/uP7K5oDOj1mcurLVxoh37FmkHWInzsjQldA3iXXrdRMcqsbVhkdPNKSdqMNheron8aA2osoHi56eEkaGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yy/6D7/w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yy/6D7/w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 350741F000E9;
	Fri, 28 Aug 2026 06:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787900237;
	bh=V+sCFQiDb8iMri+hsUKKUN/WFNCmTC/EgwHvwHUHn+s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yy/6D7/wtbffp0ePBsVpnB3unhZ+iXIiywnuXsnYDYTJrPAaZHvc1aHBVlbjFCzSF
	 aSqEYiza+OCzuglSfcr+QJGNJkdnN5zTqgj7DffXO85/R5FFOnR4rHn+UBawtjzna6
	 CR81uxgDefnWQog+hLwDI0p7YUlAqzOPtinzWEqNMfYxkbP3C6+48uSJAmord83KCl
	 86cKgUhHdHL+G9Jkrv4myjAU4FlTbTdocBebvitdNBhctJiXooYTOLvocaLnqOkgh1
	 yZKumH5R9vmdEeU3kyVs8xhQQyweIRJN7enqPid+AwgvmkeaZcU6w4ygy45Ce5znNR
	 d/Pfbm71fmHgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 08/10] iio: adc: ti-ads1262: support triggered buffer
 sampling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260828-ads126x-v4-8-1dc27e9c0260@gmail.com>
References: <20260828-ads126x-v4-0-1dc27e9c0260@gmail.com>
 <20260828-ads126x-v4-8-1dc27e9c0260@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 06:57:16 +0000
Message-Id: <20260828065717.350741F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The `rx` buffer in `struct ads1262` lacks the `__aligned(IIO_DMA_M=
INALIGN)` attribute, causing it to be placed at an unaligned memory offset =
and sharing a cacheline with the `tx` buffer.
- [High] The driver fails to filter out the IIO soft timestamp channel when=
 iterating over `active_scan_mask`, treating it as a hardware channel. This=
 leads to out-of-bounds array reads and writes, including a potential `FORT=
IFY_SOURCE` kernel panic.
- [High] The driver dynamically modifies a pre-optimized SPI transfer buffe=
r without cache synchronization, breaking DMA coherency on architectures wi=
thout hardware cache coherency.
--

commit 21b4fc84b4dd63fd1e3310ee7b41df30e8039785
Author: Kurt Borja <kuurtb@gmail.com>
Subject: iio: adc: ti-ads1262: support triggered buffer sampling

Add triggered buffer support and a data-ready (DRDY) hardware trigger.

> diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
> index 04566d00d7cb8..3f6d34a08b296 100644
> --- a/drivers/iio/adc/ti-ads1262.c
> +++ b/drivers/iio/adc/ti-ads1262.c
[ ... ]
> @@ -232,6 +239,11 @@ struct ads1262 {
>  	u32 rref_ohms[ADS1262_EXT_REF_COUNT][ADS1262_EXT_REF_COUNT];
>  	int refp_uV[ADS1262_EXT_REF_COUNT];
>  	int refn_uV[ADS1262_EXT_REF_COUNT];
> +	IIO_DECLARE_BUFFER_WITH_TS(__be32, scan_buffer,
> +				   ADS1262_FW_CHANNEL_COUNT +
> +				   ADS1262_MON_CHANNEL_COUNT);
> +	u8 tx[ADS1262_SPI_XFER_SZ] __aligned(IIO_DMA_MINALIGN);
> +	u8 rx[ADS1262_SPI_XFER_SZ];

[Severity: High]
Does the rx buffer need the __aligned(IIO_DMA_MINALIGN) attribute as well?

Without it, rx might be placed at an unaligned memory offset and share a
cacheline with the tx buffer. Since they are mapped for DMA in opposite
directions (DMA_TO_DEVICE and DMA_FROM_DEVICE), mapping overlapping
cachelines can violate the DMA API and cause memory corruption on
non-cache-coherent architectures.

>  };
> =20
>  static const char * const ads1262_device_id_to_name[] =3D {
[ ... ]
> @@ -837,10 +849,284 @@ static const struct iio_info ads1262_iio_info =3D {
[ ... ]
> +static int ads1262_fill_buffer_mult(struct iio_dev *indio_dev)
> +{
> +	struct ads1262 *st =3D iio_priv(indio_dev);
> +	unsigned int chan;
> +	int i =3D -1;
> +	int ret;
> +
> +	/*
> +	 * This routine enables and reads channels in a full-duplex fashion.
> +	 *
> +	 * When a channel is enabled, the previous conversion is clocked out of
> +	 * the shift data register on the same transfer (Section 9.4.7.1). This
> +	 * allows for low latency software sequencing but forbids any
> +	 * communication with the chip in-between or data corruption may occur,
> +	 * hence the need to take the xfer_lock for the whole operation.
> +	 */
> +	guard(mutex)(&st->xfer_lock);
> +
> +	iio_for_each_active_channel(indio_dev, chan) {
> +		ads1262_channel_prep_tx(st, &indio_dev->channels[chan]);

[Severity: High]
Is it possible for this loop to iterate over the IIO soft timestamp channel?

If the timestamp channel is enabled and its bit is set in active_scan_mask,
iio_for_each_active_channel() will yield the timestamp channel's index.

This would cause ads1262_channel_prep_tx() to perform an out-of-bounds read
on the st->channels array since the timestamp channel is treated as a
hardware channel:

	struct ads1262_channel *chan =3D &st->channels[spec->scan_index];

Additionally, the extra loop iteration could cause the following memcpy to
write past the bounds of the scan_buffer array when all channels are active:

	memcpy(&st->scan_buffer[i], st->rx, sizeof(st->scan_buffer[i]));

> +
> +		reinit_completion(&st->drdy);
> +
> +		ret =3D spi_sync(st->spi, &st->msg);

[Severity: High]
Could this sequence break DMA coherency on architectures without hardware
cache coherency?

If the SPI message is permanently mapped for DMA in
ads1262_buffer_postenable_mult() via spi_optimize_message():

	return spi_optimize_message(st->spi, &st->msg);

And then on every trigger event, ads1262_channel_prep_tx() dynamically writ=
es
new register commands directly into the st->tx buffer from the CPU:

	st->tx[0] =3D ADS1262_MODE0_REG | ADS1262_OPCODE_WREG;

When ads1262_fill_buffer_mult() later calls spi_sync(), the message is
already marked as pre-optimized, so dma_sync_single_for_device() might
be skipped. Will the SPI controller fetch stale cached data instead of
the newly written configuration commands?

> +		if (ret)
> +			return ret;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828-ads126x-v4=
-0-1dc27e9c0260@gmail.com?part=3D8
