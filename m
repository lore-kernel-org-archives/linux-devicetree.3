Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAE03A1687
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 21:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783631087; cv=none; b=GZnzJwBQw6o/pfRvxUmoZE6eTwXfHiA4bISKQ74ZyaaoDPFmxQQjC6B4bInDwiIDwYJGINt1h9AA+F+lchx//tamNFlfdl9CDjwxMmBlzNszjUaVwk1sGOz4mtYGw6yVUtQ4X7bpOgRmvpMv0JyHccXFCu0aCzingRtSIMmFt7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783631087; c=relaxed/simple;
	bh=ilTdGKtFBTvzXuibG9rk5NTn4jQ5pCUSy1MpX86HoLI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mEorbU91zZm3xrKckonrDg0Z4VpHPcOJty3a5UNTIboGOqA7OGj9lQnyjQGUlB/leCka79uwlQDI0lJE3WXblE9s84i4a02R5VcmSKafrIOIKnhIX2FVOBkBZgIa7KBqRoJClHGfySQI77F2100F2ThTvXj15jvJJ6u8o2AuSiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X8oAILJQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X8oAILJQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C953C1F000E9;
	Thu,  9 Jul 2026 21:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783631082;
	bh=2+Qr36ZP5v05mWZ4AsELaRwJ5FvnUiTx9oy/1XIy4dc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X8oAILJQKov/NNqEqNdZXdO5RhrGhAJK6wnFCHW8RN3RiRmw712chHSDBEIgkdYe6
	 Da5Rbfzka5di8Z2pntmaLOLDYpWNOBUPwMAk7aK00Kd6/UsVNC39pOcouvlHzFUyJu
	 tuw3CV/QQ3jKFneUBLodyPEdoBkahWd6GpTXFB5rZn7l4jND5UsZXPPLKrnflIfk6J
	 A3TbeVUq+tnSioCy42MzbSRfZaaLbpxiX8Awo64gOEY50dnqIcZQOpZn59Y55pgjY1
	 zmE47zCmWVkGG7CvdQ9jV6ZQOw89XH4B4+LtrYckVsNIx4CZM3qGrqv5AcsRiZ+7m6
	 oYvECBaZsNKfQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/4] iio: adc: ltc2378: Add support for LTC2378-20
 and similar ADCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <965e5a31bf10cb49b53f7351266eeed55e8f6bd5.1783629101.git.marcelo.schmitt@analog.com>
References: <cover.1783629101.git.marcelo.schmitt@analog.com>
 <965e5a31bf10cb49b53f7351266eeed55e8f6bd5.1783629101.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 21:04:41 +0000
Message-Id: <20260709210441.C953C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The internal mutex `st->lock` is released before reading the sha=
red SPI transfer buffer, failing to protect the single-sample read procedur=
e.
--

--- Patch [2]: [PATCH v6 2/4] iio: adc: ltc2378: Add support for LTC2378-20=
 and similar ADCs ---
commit 30c9caf90bdc7e619336a9deac3d3aa86c429417
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ltc2378: Add support for LTC2378-20 and similar ADCs

Support for LTC2378-20 and similar analog-to-digital converters.

> diff --git a/drivers/iio/adc/ltc2378.c b/drivers/iio/adc/ltc2378.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/iio/adc/ltc2378.c

[ ... ]

> +static int ltc2378_convert_and_acquire(struct ltc2378_state *st)
> +{
> +	int ret;
> +
> +	guard(mutex)(&st->lock);

[Severity: Medium]
Does the use of guard(mutex) here release the lock before the data is safely
extracted?

The lock is automatically released when this function returns, which means
st->lock drops before ltc2378_channel_single_read() can consume the shared
st->scan.data buffer.

> +	/* Cause a rising edge of CNV to initiate a new ADC conversion */
> +	gpiod_set_value_cansleep(st->cnv_gpio, 1);
> +	fsleep(4);
> +	ret =3D spi_sync_transfer(st->spi, &st->xfer, 1);
> +	gpiod_set_value_cansleep(st->cnv_gpio, 0);
> +
> +	return ret;
> +}
> +
> +static int ltc2378_channel_single_read(const struct iio_chan_spec *chan,
> +				       struct ltc2378_state *st, int *val)
> +{
> +	const struct iio_scan_type *scan_type =3D &chan->scan_type;
> +	u32 sample;
> +	int ret;
> +
> +	ret =3D ltc2378_convert_and_acquire(st);
> +	if (ret)
> +		return ret;
> +
> +	if (chan->scan_type.endianness =3D=3D IIO_BE) {
> +		if (chan->scan_type.realbits > 16)
> +			sample =3D be32_to_cpu(st->scan.data.sample_buf32_be);

[Severity: Medium]
Is this read of st->scan.data properly protected against concurrent access?

Since ltc2378_convert_and_acquire() uses guard(mutex) to manage the lock,
the lock is dropped before returning. This leaves the access to
st->scan.data here unprotected by st->lock.=20

While the IIO core's direct mode mlock currently serializes these calls,
this early release seems to break the intent stated in the commit message
where the single sample read procedure is protected with a mutex.

> +		else
> +			sample =3D be16_to_cpu(st->scan.data.sample_buf16_be);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783629101.gi=
t.marcelo.schmitt@analog.com?part=3D2
