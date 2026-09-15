Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF694CE66A
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 19:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789500564; cv=none; b=KW8S3fuftNm9hhQqRlq1a/RGhIRbDhfdByKEiCV+R1eOwnThcr1gl2U4YDL9x5k1Ci7MCAos3t85eWaXZUQpvwASgZAe/jQBM7EauKho/8U0x/cc3F80bWKBGqYXY+4uT3DnzKEcdmyhLDex4v0y2/uTJfksGur0/Sr6IJmuPVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789500564; c=relaxed/simple;
	bh=8gMwPbPMJOZM2SzH6NpnSBih9kGcleO0JLeOjdD9PZU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bDrABFi7rUWsxB6A0uDWEMA1F0SH6eWTmS5LxrC6FdvuLRpS+UNmNP55bLMfeFXmBF21GfFiPd5fpE+pnn8NpyEJYpGwaIYneehv0/99XL3UTCFlngSfkN2p6ufVlkBZH3EYZUcjGErVBlhXvO+0lvCZBTBjkSByXZiGa2xV9ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UdzZInIJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UdzZInIJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 206431F000FF;
	Tue, 15 Sep 2026 19:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789500562;
	bh=uVZ9/NpYUTOpLEif+FVrdj6K2lQJHZSf0W4LmHSzdVM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UdzZInIJfcx1/4IwlFpEryRk1xqfqbNqJf6wVopYOCbR7YEu/om+Z2TIybmYqcLvc
	 VQiKs7dqlmvquImClfwZvlgESt11hnTnuIxQ4YzNLtkHIgb7rVHP3/DaulKXyxeJgF
	 J8YHWEagKyRFQAg0cAgAj3HNUOWwBjrlIWrYbUEn183SAHhS2/ag9Sio+9le0xdUko
	 wSp/oRqcFqIBZCbh9R0KIXDRS+fDq/norR+GBIHWaaCv1SFmDJyI+Q4pJDzoQjBiGp
	 yCv+bqfFI+Lankr73gBoz3xlCGBVUvQv60/TJl/42NFUDTAw1iAOPE9fFEsq62misT
	 SEU2yWXgaB6CQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/15] iio: adc: ad4134: Support buffered data read
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <dbc37d95fe7f96bd158d8e3339c41205524ae217.1789494473.git.marcelo.schmitt@analog.com>
References: <cover.1789494473.git.marcelo.schmitt@analog.com>
 <dbc37d95fe7f96bd158d8e3339c41205524ae217.1789494473.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 19:29:21 +0000
Message-Id: <20260915192922.206431F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] iio: adc: ad4134: buffer compaction overwrites active channels due=
 to skipped index increment
- [High] iio: adc: ad4134: undersized scan buffer causes -ENOSPC during tri=
ggered captures
- [High] iio: adc: ad4134: data corruption due to concurrent lockless acces=
s to shared rx_buf union
- [Medium] iio: adc: ad4134: uninitialized stack memory leak via out-of-bou=
nds virtual register read
--

commit 67ed10376d89a2413bb4cf43e7a24f52e73e8a76
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ad4134: Support buffered data read

Enable users to run buffered data captures triggered by IIO trigger device.
Add an IIO timestamp channel so each data scan is provided with measurement
time information. Require single-read operations to be in IIO device direct
access mode to prevent buffered and single-shot data captures to disrupt
each other.

> diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> index 30c7b1d1bc67c..0b6843bf8a9e3 100644
> --- a/drivers/iio/adc/ad4134.c
> +++ b/drivers/iio/adc/ad4134.c

[ ... ]

> @@ -149,7 +161,10 @@ struct ad4134_state {
>  	 * DMA (thus cache coherency maintenance) requires the transfer buffers
>  	 * to live in their own cache lines.
>  	 */
> -	u8 rx_buf[AD4134_SPI_MAX_XFER_LEN] __aligned(IIO_DMA_MINALIGN);
> +	union {
> +		u8 reg[AD4134_SPI_MAX_XFER_LEN];
> +		u32 scan[ARRAY_SIZE(ad4134_chan_set)];

[Severity: High]
Does this array size fail to account for the timestamp's alignment padding?

The array is fixed at 20 bytes (5 elements). When all 4 channels and the 64=
-bit
timestamp are active, the IIO core computes scan_bytes as 24 bytes due to t=
he
timestamp's 8-byte alignment requirement (16 bytes data + 8 bytes padding a=
nd
timestamp). Passing sizeof(st->rx_buf.scan) to iio_push_to_buffers_with_ts()
later in the trigger handler will cause the IIO core's safety check to fail,
aborting the buffer push with -ENOSPC on full-scan captures.

[Severity: High]
Can concurrent lockless accesses corrupt the rx_buf shared union?

The ad4134_trigger_handler() executes locklessly in a pollfunc context, whi=
le
regmap debugfs reads/writes (which do not acquire the IIO direct mode lock)=
 can
concurrently use st->rx_buf.reg as a DMA buffer. This can result in corrupt=
ed
SPI scan data, corrupted regmap read/write data, and potentially invalid
hardware configurations or ADC samples if debugfs is accessed while a trigg=
ered
buffer capture is running.

> +	} rx_buf __aligned(IIO_DMA_MINALIGN);
>  	u8 tx_buf[AD4134_SPI_MAX_XFER_LEN];
>  };

[ ... ]

> @@ -269,8 +284,8 @@ static int ad4134_data_read(struct ad4134_state *st, =
unsigned int reg,
>  	 * interface. Now we read data from all channels but keep only the bits
>  	 * from the requested one.
>  	 */
> -	for (i =3D 0; i < ARRAY_SIZE(ad4134_chan_set); i++) {
> -		ret =3D spi_write_then_read(st->spi, NULL, 0, st->rx_buf,
> +	for (i =3D 0; i < AD4134_NUM_CHANNELS; i++) {
> +		ret =3D spi_write_then_read(st->spi, NULL, 0, st->rx_buf.reg,
>  					  BITS_TO_BYTES(AD4134_CHAN_PRECISION_BITS));
>  		if (ret)
>  			return ret;
> @@ -281,7 +296,7 @@ static int ad4134_data_read(struct ad4134_state *st, =
unsigned int reg,
>  		 * Clock out data from all channels to avoid that.
>  		 */
>  		if (i =3D=3D AD4134_VREG_CH(reg))
> -			sample =3D get_unaligned_be24(st->rx_buf);
> +			sample =3D get_unaligned_be24(st->rx_buf.reg);
>  	}
>  	*val =3D sign_extend32(sample, AD4134_CHAN_PRECISION_BITS - 1);

[Severity: Medium]
Does this leak uninitialized stack memory if the soft timestamp channel is =
read
as a virtual register?

Because ad4134_regmap_config sets max_register to include the soft timestamp
channel (ARRAY_SIZE(ad4134_chan_set) includes the timestamp, making index 4
valid), userspace could read virtual register index 4 via regmap debugfs. In
that case, this loop iterates only up to AD4134_NUM_CHANNELS (indices 0 to =
3),
meaning `i =3D=3D AD4134_VREG_CH(reg)` (where AD4134_VREG_CH(reg) would be =
4) is
never true. The sample variable is left uninitialized, and an uninitialized
32-bit stack chunk is processed and returned to userspace.

[ ... ]

> @@ -333,6 +348,37 @@ static const struct regmap_config ad4134_regmap_conf=
ig =3D {
>  	.max_register =3D AD4134_CH_VREG(ARRAY_SIZE(ad4134_chan_set)),
>  };
> =20
> +static irqreturn_t ad4134_trigger_handler(int irq, void *p)
> +{
> +	struct iio_poll_func *pf =3D p;
> +	struct iio_dev *indio_dev =3D pf->indio_dev;
> +	struct ad4134_state *st =3D iio_priv(indio_dev);
> +	unsigned int i =3D 0;
> +	int ret;
> +
> +	gpiod_set_value_cansleep(st->odr_gpio, 1);
> +	fsleep(1);
> +	gpiod_set_value_cansleep(st->odr_gpio, 0);
> +
> +	for (unsigned int ch =3D 0; ch < AD4134_NUM_CHANNELS; ch++) {
> +		ret =3D spi_write_then_read(st->spi, NULL, 0, &st->rx_buf.scan[ch],
> +					  BITS_TO_BYTES(AD4134_CHAN_PRECISION_BITS));
> +		if (ret)
> +			goto err_out;
> +
> +		if (test_bit(ch, indio_dev->active_scan_mask) && ch !=3D i)
> +			memcpy(&st->rx_buf.scan[i++], &st->rx_buf.scan[ch],

[Severity: High]
Does this conditional logic permanently corrupt the scan data by overwriting
active channels?

When the first active channel has the same index as the destination (for ex=
ample,
both are 0), the condition `ch !=3D i` evaluates to false, short-circuiting=
 the
if statement and entirely skipping the post-increment `i++`. The next active
channel will then overwrite the previous data by being written to scan[0] a=
gain.
This triggers on any standard buffered capture involving multiple channels.

> +			       sizeof(st->rx_buf.scan[ch]));
> +	}
> +
> +	iio_push_to_buffers_with_ts(indio_dev, &st->rx_buf.scan,
> +				    sizeof(st->rx_buf.scan), pf->timestamp);
> +
> +err_out:
> +	iio_trigger_notify_done(indio_dev->trig);
> +	return IRQ_HANDLED;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1789494473.gi=
t.marcelo.schmitt@analog.com?part=3D8
