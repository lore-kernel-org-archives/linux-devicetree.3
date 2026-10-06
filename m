Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E3D4A4F0A
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 18:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791311799; cv=none; b=mWBDj5a8r7Ryy/5szb3WaO94lW+46OksuHRGBic9jqoxH32d+5xkOxBVKzBm7EuL1+tPvMQYePqruMIOKQuUhPXkgYhdWTGIbJIeXqxMJEphTwwWbUOMH80LGM7xTwo586foVpGdbgOeOyCkTqX3dAD+yGXoa0Dc0ZhuAbYj/qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791311799; c=relaxed/simple;
	bh=HVweg6R1Ro32oFMOATKf4WpNJx9ZWsbblJeVYMAxaks=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=E/ayBgzmAkQOaLBH3nb+FhpZ/KQ3pppmRO12KDTeH07cBZKcCG1A6u6BXDqi4jz3z0Oa2FPggCWbsvFekxFtVyj8A5PW21+nHdvPcty4SAHVfmlyvQ2MM2FNRyO02DfIV/F5eGdp18lO58kmzwUGMdKZ1zsPfUW2KwJUzkNRPXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mfuu4IXM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mfuu4IXM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA3C1F00906;
	Tue,  6 Oct 2026 18:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791311797;
	bh=gttt2ud9BAgKVch9FTdCpZPs9II74VWg9koJGYGUviA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mfuu4IXM6biee7hskAyySs/eRmrpHGujRUaIL6fVMRJOAIkhf8JTaUaBInoF4imsN
	 MXtRtG1+L68xE4A7M+09MCtSVGQRcMZ5czCZWRyNLEnN4jqD3K2koo6i5m9iRVpMNY
	 uYzHRMgrNjt7Z9ThbHqDQ5HbL8+fBuEt+P3UqeykznJmcQdR2ARK/htFG+Vsy/9/2D
	 Bcb+kJGDixlE4dPPRgyoC5yl6InmXhVvHpEQWVUIiTirnEcYFXSZgDzctTe0whCwOO
	 geoYHBbdnbz5TKsnFUGsunAA/CX+NFfSypGfrne0gnP+0iA0NpZAtw1rOODw3Is6re
	 Ih6UOPZ2srGSA==
Message-ID: <sashiko-outbox-162362@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 07/13] iio: adc: ad4134: Support buffered data read
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <5d31212a27c2099c226cce189aa96677e75ca529.1791309733.git.marcelo.schmitt@analog.com>
References: <cover.1791309733.git.marcelo.schmitt@analog.com>
 <5d31212a27c2099c226cce189aa96677e75ca529.1791309733.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 18:36:36 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] iio: data race on rx_buf between trigger handler and regmap debugfs
- [Medium] iio: stack memory leak via regmap due to ARRAY_SIZE(ad4134_chan_=
set) increase
- [Medium] iio: adc: ad4134: DMA buffers rx_buf and tx_buf share the same c=
acheline
--

commit c725b04fb026c820b0d14c82b9c9ef92e634640f
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ad4134: Support buffered data read

This commit enables buffered data captures triggered by the IIO trigger
device and adds an IIO timestamp channel. It also requires single-read
operations to be in IIO device direct access mode to prevent buffered and
single-shot captures from disrupting each other.

> diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> index 3048e61a3cb13..b5207f16054e4 100644
> --- a/drivers/iio/adc/ad4134.c
> +++ b/drivers/iio/adc/ad4134.c
> [ ... ]
> @@ -131,6 +141,7 @@ static const struct iio_chan_spec ad4134_chan_set[] =
=3D {
>  	AD4134_CHANNEL(1),
>  	AD4134_CHANNEL(2),
>  	AD4134_CHANNEL(3),
> +	IIO_CHAN_SOFT_TIMESTAMP(4),
>  };
> =20
>  struct ad4134_state {
> @@ -149,7 +160,7 @@ struct ad4134_state {
>  	 * DMA (thus cache coherency maintenance) requires the transfer buffers
>  	 * to live in their own cache lines.
>  	 */
> -	u8 rx_buf[AD4134_SPI_MAX_XFER_LEN] __aligned(IIO_DMA_MINALIGN);
> +	u8 rx_buf[AD4134_SPI_MAX_XFER_LEN * AD4134_NUM_CHANNELS] __aligned(IIO_=
DMA_MINALIGN);
>  	u8 tx_buf[AD4134_SPI_MAX_XFER_LEN];
>  };

[Severity: Medium]
Do tx_buf and rx_buf end up sharing the same cacheline here?

Because rx_buf is only 12 bytes long (assuming AD4134_SPI_MAX_XFER_LEN is 3
and AD4134_NUM_CHANNELS is 4), tx_buf will be placed immediately after it at
offset 12. Since tx_buf lacks __aligned(IIO_DMA_MINALIGN), they will occupy
the same cacheline.

If the CPU writes to tx_buf during a debugfs operation while the SPI core is
concurrently mapping rx_buf for a triggered read, could the DMA FROM_DEVICE
cache invalidation discard the CPU's writes to tx_buf and corrupt memory?

> [ ... ]
> @@ -269,7 +280,7 @@ static int ad4134_data_read(struct ad4134_state *st, =
unsigned int reg,
>  	 * interface. Now we read data from all channels but keep only the bits
>  	 * from the requested one.
>  	 */
> -	for (i =3D 0; i < ARRAY_SIZE(ad4134_chan_set); i++) {
> +	for (i =3D 0; i < AD4134_NUM_CHANNELS; i++) {
>  		ret =3D spi_write_then_read(st->spi, NULL, 0, st->rx_buf,
>  					  BITS_TO_BYTES(AD4134_CHAN_PRECISION_BITS));

[Severity: Medium]
Could this leak uninitialized stack memory to userspace if accessed via the
regmap debugfs interface?

The patch adds IIO_CHAN_SOFT_TIMESTAMP(4) to ad4134_chan_set, which increas=
es
its ARRAY_SIZE from 4 to 5. The max_register calculation for the regmap
configuration uses ARRAY_SIZE(ad4134_chan_set) - 1.

If userspace reads this new max register (0x54) via the regmap debugfs
interface, it will call ad4134_data_read(). Inside this loop, it only
iterates up to AD4134_NUM_CHANNELS (which is 4).=20

Since AD4134_VREG_CH(reg) would evaluate to 4, the condition
if (i =3D=3D AD4134_VREG_CH(reg)) never matches, leaving the stack variable
'sample' uninitialized before it is sign-extended and returned.

> [ ... ]
> @@ -333,6 +344,44 @@ static const struct regmap_config ad4134_regmap_conf=
ig =3D {
>  	.max_register =3D AD4134_CH_VREG(ARRAY_SIZE(ad4134_chan_set) - 1),
>  };
> =20
> +static irqreturn_t ad4134_trigger_handler(int irq, void *p)
> +{
> +	IIO_DECLARE_BUFFER_WITH_TS(u32, channels, AD4134_NUM_CHANNELS) =3D { };
> +	unsigned int chan_bytes =3D BITS_TO_BYTES(AD4134_CHAN_PRECISION_BITS);
> +	struct iio_poll_func *pf =3D p;
> +	struct iio_dev *indio_dev =3D pf->indio_dev;
> +	struct ad4134_state *st =3D iio_priv(indio_dev);
> +	struct spi_transfer xfer =3D {
> +		.rx_buf =3D st->rx_buf,
> +		.cs_off =3D true,
> +		.len =3D chan_bytes * AD4134_NUM_CHANNELS,
> +	};
> +	int ret;
> +
> +	gpiod_set_value_cansleep(st->odr_gpio, 1);
> +	fsleep(1);
> +	gpiod_set_value_cansleep(st->odr_gpio, 0);
> +
> +	/* Run enough DCLK cycles to match the data frame length. */
> +	ret =3D spi_sync_transfer(st->spi, &xfer, 1);

[Severity: High]
Does this introduce a data race on st->rx_buf?

The trigger handler runs asynchronously and uses st->rx_buf directly in
spi_sync_transfer() without taking any locks.

Meanwhile, if userspace reads from the regmap debugfs node, the regmap core
takes its internal lock and calls ad4134_data_read(), which invokes
spi_write_then_read() using the exact same st->rx_buf.

Because regmap debugfs access does not claim IIO direct mode, and the trigg=
er
handler bypasses the regmap lock, could both paths execute concurrently
and cause concurrent DMA mapping of the same buffer?

> [ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791309733.gi=
t.marcelo.schmitt@analog.com?part=3D7
