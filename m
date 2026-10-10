Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91311A683D
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 07:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791616188; cv=none; b=RU/QQydO07+citZdu6CnnTPYwf5/ORN5e4MAzFiVQrQLgdwjV/FQpy/gGj0RBsGIQ1RnKyYIXpbQk+D5LMSaqeNn31/2VmxMv9i87QUglMGVelxOOyYn9IJK2ivo0/N6wiWX/JlwbadymDUn0Mdpy08HUlDzkHlY/bov9H6eyCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791616188; c=relaxed/simple;
	bh=aThL1XnIrVBcT+eMucmA68llWXyxkT4ULCVekE0tJiM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=MDVHgIqrZCrZ/pJBHxpaFVxdTU7cAHnj3uf13TTfz370bYCsHCViAlxQP9FVvzvrjduD4ASFhh4UUQYWgHlsHTTl2UNJAMACkW7qj0w9s3UWX1h0lopnDlctiv5F2mBmjCYFEw8kuHi9CyhCNj9fvoPF412yRx0zeCJRCIli/qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BlW53K+4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BlW53K+4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 452081F000FF;
	Sat, 10 Oct 2026 07:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791616186;
	bh=PoYtfkgXSg9DdJ1/lX03+r8Om67OCFFuPZxbXJ8FqU8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BlW53K+4h+apbX9WAasNSxViooC8eGe9F3HxnTRICWBGbJVILd3yOAYjiwaH+PXHC
	 plR85Fs+FWVdK7nlBbqLx4USVu7kooIL8xOsu+xIanP7VU33ZqWSBbhtwW5R29wF8B
	 ED2r1RiKzFpC6xOOCqzYuO/OwKV9rCJgFC19u37yty9HmA0AxYd5a0Jh3eRcT8a3kp
	 KQIdciFS51gFqRhwChbMyjkFNcLlkxQhL+oDIlUEjfnEKiQHBW8W2DtIfkQ/Uxwdto
	 CJ+k0QHfS5jaEbw/FcGf2cUqpiLjZ1c1ewa+j7f4jhLRaODtgabCydzTREryCGab+M
	 f2HIOyJwfLtZg==
Message-ID: <sashiko-outbox-166298@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 08/10] iio: adc: ti-ads1262: support triggered buffer
 sampling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261010-ads126x-v5-8-49e331cb2fed@gmail.com>
References: <20261010-ads126x-v5-0-49e331cb2fed@gmail.com>
 <20261010-ads126x-v5-8-49e331cb2fed@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 07:09:45 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] spi: DMA API violation due to cacheline sharing between tx and rx =
buffers
- [High] iio: Out-of-bounds array access on soft timestamp channel in trigg=
er handlers
--

commit 498de2a7a709d846f73f3af6fbc4fac307b5368e
Author: Kurt Borja <kuurtb@gmail.com>

iio: adc: ti-ads1262: support triggered buffer sampling

Add triggered buffer support and a data-ready (DRDY) hardware trigger.

> diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
> index 49d4bf206be07..0606e712feec8 100644
> --- a/drivers/iio/adc/ti-ads1262.c
> +++ b/drivers/iio/adc/ti-ads1262.c
[ ... ]
> @@ -233,6 +240,11 @@ struct ads1262 {
>  	u32 rref_ohms[ADS1262_EXT_REF_COUNT][ADS1262_EXT_REF_COUNT];
>  	int refp_uV[ADS1262_EXT_REF_COUNT];
>  	int refn_uV[ADS1262_EXT_REF_COUNT];
> +	IIO_DECLARE_BUFFER_WITH_TS(__be32, scan_buffer,
> +				   ADS1262_FW_CHANNEL_COUNT +
> +				   ADS1262_MON_CHANNEL_COUNT);
> +	u8 tx[ADS1262_SPI_XFER_SZ] __aligned(IIO_DMA_MINALIGN);
> +	u8 rx[ADS1262_SPI_XFER_SZ];
        ^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
Does this code risk a DMA API violation on non-coherent architectures?

The compiler places rx immediately after tx at offset 13. While tx has the
__aligned(IIO_DMA_MINALIGN) attribute, its size (13 bytes) is not padded
to the cacheline boundary, causing rx to share the same cacheline as tx.

During SPI transfers, both buffers are mapped for DMA concurrently.
Unmapping rx (which invalidates the CPU cache for that line) can silently
destroy adjacent CPU writes or unflushed data in tx, leading to data
corruption and triggering CONFIG_DMA_API_DEBUG warnings.

Should rx also be explicitly marked with __aligned(IIO_DMA_MINALIGN)?

[ ... ]
> +static void ads1262_channel_prep_tx(struct ads1262 *st,
> +				    const struct iio_chan_spec *spec)
> +{
> +	struct ads1262_channel *chan =3D &st->channels[spec->scan_index];
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
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
Can this code read out-of-bounds when chan is the soft timestamp channel?

When triggered buffer support is set up, the IIO core automatically
appends a software timestamp channel to the indio_dev->channels array
and reserves a bit for it in the active scan mask.

The loop over iio_for_each_active_channel() does not skip the IIO_TIMESTAMP
channel. When ads1262_channel_prep_tx() is called for the timestamp channel,
it accesses st->channels[spec->scan_index]. Because the timestamp channel's
scan_index is numerically greater than the hardware channels, it indexes
out-of-bounds of the driver's allocated st->channels array.

The driver then sends configuration data read from this out-of-bounds memory
to the ADC and blocks on wait_for_completion_interruptible_timeout(). Since
the ADC was improperly configured, the expected DRDY interrupt may never
arrive, causing a timeout.

Does this same issue exist in ads1262_buffer_postenable_one() if only the
timestamp channel is enabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010-ads126x-v5=
-0-49e331cb2fed@gmail.com?part=3D8
