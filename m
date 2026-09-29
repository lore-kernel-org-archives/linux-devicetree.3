Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DEA2E7397
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 23:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790723130; cv=none; b=GzU3ksi5zANpkg/XkzEPSR6XLvaCGmBQSm4jL0PUScyH2yg5Ev8pRPs+hilqJyIgGghks+PdaeV9dEIMu0XcY48w2BYlCSVdbkYITATVyHuG22VpPC64mt+kt05etO9346gbk7zb4iOaYvSM0KD29qdnea5qvzHqsNWNRu09EXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790723130; c=relaxed/simple;
	bh=RGx7OYnQ+dj+tcf8BQAmKHlOeJfx+eWBhM/VVN74ZPQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jKVhzFX9NyfsKR5bqrdFEoDu/8bhCiCjZ9C4eiTOpoh18Huyq6mQyUJFYH1bbyN6MwmM2wFzDv3JT35s3iR+yEa32BwFFIZ3B4UShe+p9j5ntD2ZQwkaB1mxDfsD3IXRMhsaozaESsSarzGsYUTX/0/PQhOIk2Yt2JhP6xLIUSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fV4+Eh6x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fV4+Eh6x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8861C1F000FF;
	Tue, 29 Sep 2026 23:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790723128;
	bh=ltxjmwK/T9b9OMUof8IYqmZbHhy5VMIy/2O+pHEhAtM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fV4+Eh6xqj4OoDt3OpFOGURx7otvKYfk9Dg+6EOy2MWS6rghes4rDa+0e9E38/Ojf
	 fw2Krx+6fTPS8VcrU4NgYBMR+hiiL5F5Qpv7TWWalYalsSvkCvf0vXbzxQtSZ+7K7o
	 3evkkxpxXRh+cldXGDrRSE4NvPa/sn5VHqj9ICNt+FHNo6GsN9k801tJLs6eph+Kpf
	 Qp6FuwT60WjBapoFfmgZY80NELwnj5H5rsP3d47W86fUl5N5rvIHpOUC7zpLxhyC2r
	 6+LSVwD+8YsH8ybsxnXFRiUOGNfU3NUsUGfQhqTNn6nfS2JOjU8+FL9hh0YbzlKk0b
	 rJz8F8Jtk/Liw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/13] iio: adc: ad4134: Support buffered data read
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <095cea21f1a9fc39aa0a81b990e87c1046bb3dc9.1790719424.git.marcelo.schmitt@analog.com>
References: <cover.1790719424.git.marcelo.schmitt@analog.com>
 <095cea21f1a9fc39aa0a81b990e87c1046bb3dc9.1790719424.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 23:05:28 +0000
Message-Id: <20260929230528.8861C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] mm: concurrent use of shared DMA buffers st->rx_buf and st->tx_buf
- [High] spi: cs_off =3D true in triggered buffer breaks 4-wire mode commun=
ication
- [High] iio: ADC output frame resets due to looped SPI transfers
--

commit 29f8197d694e692f78d7a5142e0a389309c577b0
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

    iio: adc: ad4134: Support buffered data read
   =20
    Enable users to run buffered data captures triggered by IIO trigger dev=
ice.
    Add an IIO timestamp channel so each data scan is provided with measure=
ment
    time information. Require single-read operations to be in IIO device di=
rect
    access mode to prevent buffered and single-shot data captures to disrupt
    each other.

> diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> index 14996a0d1fe88..f0196126515e6 100644
> --- a/drivers/iio/adc/ad4134.c
> +++ b/drivers/iio/adc/ad4134.c

[ ... ]

> @@ -333,6 +344,43 @@ static const struct regmap_config ad4134_regmap_conf=
ig =3D {
>  	.max_register =3D AD4134_CH_VREG(ARRAY_SIZE(ad4134_chan_set) - 1),
>  };
> =20
> +static irqreturn_t ad4134_trigger_handler(int irq, void *p)
> +{
> +	IIO_DECLARE_BUFFER_WITH_TS(u32, channels, AD4134_NUM_CHANNELS) =3D { };
> +	struct iio_poll_func *pf =3D p;
> +	struct iio_dev *indio_dev =3D pf->indio_dev;
> +	struct ad4134_state *st =3D iio_priv(indio_dev);
> +	struct spi_transfer xfer =3D {
> +		.rx_buf =3D st->rx_buf,

[Severity: High]
If userspace reads or writes ADC registers via debugfs while the triggered
buffer is running in minimum I/O mode (NO_CS), ad4134_debugfs_reg_access()
can run concurrently with ad4134_trigger_handler().

Because the trigger handler does not acquire any locks to protect the shared
DMA buffers, and while regmap acquires st->access_lock, this lock is
explicitly not held during buffer capture in NO_CS mode (as setup_ops is
NULL), both threads can use the shared st->rx_buf and st->tx_buf
simultaneously.

Does this concurrent use cause DMA buffer corruption, potential kernel pani=
cs
during concurrent DMA mappings, or incorrect data reads?

> +		.cs_off =3D true,

[Severity: High]
When the driver is configured in 4-wire mode (adi,spi-mode =3D "4-wire") and
falls back to the software trigger handler, this flag explicitly instructs
the SPI controller to leave the chip select line inactive (high) for the
duration of the transfer.

Since the AD4134 requires an active (low) chip select to frame the data in
4-wire mode, does this setting break 4-wire mode communication and prevent
the device from outputting valid sample data?

> +		.len =3D BITS_TO_BYTES(AD4134_CHAN_PRECISION_BITS),
> +	};
> +	int ret;
> +
> +	gpiod_set_value_cansleep(st->odr_gpio, 1);
> +	fsleep(1);
> +	gpiod_set_value_cansleep(st->odr_gpio, 0);
> +
> +	/* Execute transfers for all channels so the entire data frame is read.=
 */
> +	for (int ch =3D 0, i =3D 0; ch < AD4134_NUM_CHANNELS; ch++) {
> +		ret =3D spi_sync_transfer(st->spi, &xfer, 1);

[Severity: High]
In 4-wire mode, the AD4134 resets its data output frame if the chip select
goes high or if the DCLK is idle for more than 250ns.

Does calling spi_sync_transfer() in a loop for each channel introduce
software delays far exceeding 250ns and toggle the CS line between calls?

Could this violate the device's continuous clocking and CS timing
requirements, causing the frame to reset on every iteration and reading
Channel 0 repeatedly instead of streaming consecutive channels?

Should a single bulk SPI transfer be used here instead of a loop?

> +		if (ret)
> +			goto out;
> +
> +		if (!test_bit(ch, indio_dev->active_scan_mask))
> +			continue;
> +
> +		channels[i++] =3D get_unaligned_be24(st->rx_buf);
> +	}
> +
> +	iio_push_to_buffers_with_ts(indio_dev, channels, sizeof(channels),
> +				    pf->timestamp);
> +
> +out:
> +	iio_trigger_notify_done(indio_dev->trig);
> +	return IRQ_HANDLED;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790719424.gi=
t.marcelo.schmitt@analog.com?part=3D7
