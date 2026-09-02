Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A2A4B129E
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 17:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788370742; cv=none; b=YBF5YHdOt4U1cAP2mctY1qbtc+I7Mjlc0eK7RrqraH9CQKihP+oKWfLj4Mb2Ce1+Ee08eXc0guvnQ9ptlR3ZxCIWf4G1dBWiQHbZB33uH1naOhB/uhCFEYtCBmkaxnP9Z7XgBKFydyeV3CTpps3bqgxymlvPWjQQAu+0fB50IKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788370742; c=relaxed/simple;
	bh=IqEBtHIxEDg0XrXzHnzAZcvlZesDgmlhysYEIfEUKsc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lB1fbBUNR/+HSL6PIxGyhMBWqdJbMxBD45LrNByqeoZnzXQfMZVI9j6Z+dPYtYBy/gFdUWqVijik5PgiK3iAJ5NfkxtUF4ItqPBhfxxH5HHGxn5t9GKPq4d3AiiTn8J7O4sqvfCbajMTCNILs0NkrKcgJXFWjc1gATL6qWd7r2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dXJA3O9g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dXJA3O9g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EAC41F00AC4;
	Wed,  2 Sep 2026 17:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788370737;
	bh=nMKjlsA5WA+9fPd62HAq5Z7f5oWQE8DCEDXukcq+I5I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dXJA3O9gijyjKdTk8xsCHWHjMKzRzlLGmRDkxjUjo1Ukno6sAuqdA4nwpd+QLLoZC
	 abjHrhckjhES7qQmhTAFoLdXojJmYO2Arl3Bzk4eFXfGDZXnOeQvYCngqs3RDpIC1Y
	 kQNew1wN2qNDhfuA8digTnmwtQUPcuxnXIP/Lx+vnfq9oeWg3SF+5zN+bL9eSGT1fj
	 zz5JxLtiw5c0jaaS3sB5ZXkGsuiJqkAGcq9uppucofFzQyw5JJQiattk5E8T4NNgGC
	 v/UZ8Sol+STwGjJ+HPcyNPTNEhJ/oD7qBQ0VqqEVxfgBe34GgsGIkkNR7FD/lRBrMs
	 /uKLa8aNlJBcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 07/13] iio: adc: ad4134: Support buffered data read
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <b44fc7cd06c295781e2144ae3586eac80b23bea9.1788368334.git.marcelo.schmitt@analog.com>
References: <cover.1788368334.git.marcelo.schmitt@analog.com>
 <b44fc7cd06c295781e2144ae3586eac80b23bea9.1788368334.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 17:38:57 +0000
Message-Id: <20260902173857.7EAC41F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The trigger handler loops up to masklength instead of the physical=
 channel count, causing an out-of-bounds array write and issuing an invalid=
 SPI read for the software timestamp channel.
- [High] The scan buffer is undersized for captures with a timestamp, causi=
ng `iio_push_to_buffers_with_ts()` to always fail with `-ENOSPC`.
- [High] Adding the timestamp channel breaks single-shot reads by causing `=
ad4134_data_read()` to execute 5 SPI transfers instead of 4.
- [High] Removing DMA alignment from `rx_buf` and `tx_buf` causes them to s=
hare a cacheline with `st->scan`, leading to potential DMA data corruption.
- [Low] Buffer compaction logic uses `memcpy` with identically overlapping =
memory regions, triggering Undefined Behavior.
--

commit 923506d627d1a5bd978cd92880886f1fdb5f8bfd
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>
Date:   Wed Sep 2 17:23:42 2026 +0000

    iio: adc: ad4134: Support buffered data read
   =20
    This commit adds buffered data capture support for the AD4134, triggere=
d by
    an IIO trigger device, and introduces a software timestamp channel. It =
also
    enforces direct access mode for single-read operations to prevent
    interference with buffered reads.

> diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> index a1474316e330d..0751b89dec8f3 100644
> --- a/drivers/iio/adc/ad4134.c
> +++ b/drivers/iio/adc/ad4134.c

[ ... ]

> @@ -133,6 +144,7 @@ static const struct iio_chan_spec ad4134_chan_set[] =
=3D {
>  	AD4134_CHANNEL(1),
>  	AD4134_CHANNEL(2),
>  	AD4134_CHANNEL(3),
> +	IIO_CHAN_SOFT_TIMESTAMP(4),
>  };

[Severity: High]
Will adding this timestamp channel break single-shot reads?

Looking at ad4134_data_read(), the loop iterating over this set uses
ARRAY_SIZE(ad4134_chan_set):

    for (i =3D 0; i < ARRAY_SIZE(ad4134_chan_set); i++) {
        ret =3D spi_write_then_read(...)

Since the array size is now 5, this will execute 5 times instead of the
4 times expected by the hardware. Could this clock out invalid data and
disrupt the ADC's data framing state machine?

>  struct ad4134_state {
> @@ -151,7 +163,8 @@ struct ad4134_state {
>  	 * DMA (thus cache coherency maintenance) requires the transfer buffers
>  	 * to live in their own cache lines.
>  	 */
> -	u8 rx_buf[AD4134_SPI_MAX_XFER_LEN] __aligned(IIO_DMA_MINALIGN);
> +	u32 scan[AD4134_NUM_CHANNELS] __aligned(IIO_DMA_MINALIGN);
> +	u8 rx_buf[AD4134_SPI_MAX_XFER_LEN];
>  	u8 tx_buf[AD4134_SPI_MAX_XFER_LEN];
>  };

[Severity: High]
Does the removal of the __aligned(IIO_DMA_MINALIGN) attribute from rx_buf
and tx_buf risk silent DMA data corruption?

Because scan is only 16 bytes (4 channels * 4 bytes), rx_buf and tx_buf
could now share the same cacheline. A concurrent debugfs/sysfs register
read/write could cause cacheline invalidation during a DMA unmap, resulting
in lost CPU writes to the scan buffer during a triggered capture.

Also, is the scan buffer large enough to hold the timestamp? The scan buffer
allocates 16 bytes, but the naturally-aligned 64-bit IIO timestamp appended
by IIO will require an additional 8 bytes of space.

[ ... ]

> @@ -336,6 +349,36 @@ static const struct regmap_config ad4134_regmap_conf=
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
> +	for (unsigned int ch =3D 0; ch < iio_get_masklength(indio_dev); ch++) {
> +		ret =3D spi_write_then_read(st->spi, NULL, 0, &st->scan[ch],
> +					  BITS_TO_BYTES(AD4134_CHAN_PRECISION_BITS));

[Severity: High]
When the software timestamp channel is enabled, does iio_get_masklength()
evaluate to 5?

If so, this loop will exceed the hardware channel count (4) and write out of
bounds to st->scan[4]. This could directly corrupt the adjacent rx_buf field
and issue an invalid SPI read to the device.

> +		if (ret)
> +			goto err_out;
> +
> +		if (test_bit(ch, indio_dev->active_scan_mask))
> +			memcpy(&st->scan[i++], &st->scan[ch], sizeof(st->scan[ch]));

[Severity: Low]
Is it safe to use memcpy() here when the source and destination overlap?

When ch =3D=3D i, the memory regions overlap identically. Since memcpy()
restricts overlapping pointers, this can trigger undefined behavior.

> +	}
> +
> +	iio_push_to_buffers_with_ts(indio_dev, &st->scan, sizeof(st->scan),
> +				    pf->timestamp);

[Severity: High]
Does this fail with -ENOSPC when the timestamp channel is enabled?

The length passed here is sizeof(st->scan), which is 16 bytes. The IIO core
requires 24 bytes (16 bytes data + 8 bytes timestamp) for pushing captures
with a timestamp, which could cause every sample to be rejected and dropped.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788368334.gi=
t.marcelo.schmitt@analog.com?part=3D7
