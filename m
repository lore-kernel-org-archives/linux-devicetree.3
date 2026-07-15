Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0D8322C67
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784098007; cv=none; b=j+gvgOQRjggwXwartZ49mlBGIy2tmX08E6qIgzvoctvO1m8Et32vf31qq91vaAj9VXydAejq+47s33EAGi19kQdXodgEn94AbQcyHrSwXDouECxX1lYNiCpoXUacBBKj7tQBMi5p4eQ8fXeb9uxrme8eaxpdNDpnyU1Qzc6T2lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784098007; c=relaxed/simple;
	bh=r70gIHOCa96xm3osPf5o2O+aRbf4jADYvT4CupW/ceo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fiVB234w8us8yFEOebLSXbVuELu1m9uCi6Uoa4sYx5oqIGvom9TlVt8LzTDaK0QyFChlAWbtfHX9LwVYaf88n4ZomE0D2gTdnnDhMvVTAi9h3XATz0PzIVpKYSDJx9FZqRinbBkrjuIgnsGhWnSmSWSgYZLcjAWoCJF2DGleYb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cCrbJzJ4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cCrbJzJ4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F02291F000E9;
	Wed, 15 Jul 2026 06:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784098005;
	bh=CpKTe8r58YwfttiBhK9s4R4YHWTzZie/YmvY10WlbnE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cCrbJzJ4XuBkAaBNjiUwMBircLcWQNcPPL0S7YM/2k8A6TZH0Y7VqOlWYnioWokMt
	 Bg2mWDNJZ4GwkABxA+X2D7mV/pxOkdZkVjQaWRUqRTNDvkqfUtF4JHKU5SHSgJTCHw
	 po4A8bXBNpIayAl1NRCjet0N/CQuvfbkZ8kckeOL248MxMb9yUqo5syOrOf0TXXa+9
	 s8CFdeiD8aLePJ9JYDNb8L1GKm09JWuf6QdbKrZeIS1pPTlk2pHEPfG334Oj43YX6o
	 p8OtjngKr5/MocMu1ECTn+ohJH/cFkn6sZUUsx23m+kT3/42joqYm8I+RuBHa0/VeT
	 YzFkYWE0TINRQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] iio: adc: add MAX40080 current-sense amplifier
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefan Popa" <stefan.popa@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260715063652.368501-3-stefan.popa@analog.com>
References: <20260715063652.368501-1-stefan.popa@analog.com>
 <20260715063652.368501-3-stefan.popa@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 06:46:44 +0000
Message-Id: <20260715064644.F02291F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing lock protection around `st->range` and `st->oversampling=
_ratio` updates causes hardware state desynchronization and torn reads.
--

--- Patch [2]: [PATCH v3 2/2] iio: adc: add MAX40080 current-sense amplifie=
r driver ---
commit 6f9d9d6fa7d25018a7143edc9a8c9183463f1900
Author: Stefan Popa <stefan.popa@analog.com>

iio: adc: add MAX40080 current-sense amplifier driver

The MAX40080 is a bidirectional current-sense amplifier with an
integrated 12-bit ADC and an I2C/SMBus interface. It measures the
voltage across an external shunt resistor and the input bus voltage,
storing the results in an internal FIFO.

Link: https://www.analog.com/media/en/technical-documentation/data-sheets/M=
AX40080.pdf

> diff --git a/drivers/iio/adc/max40080.c b/drivers/iio/adc/max40080.c
> new file mode 100644
> index 0000000000000..a0c1144cfda7c
> --- /dev/null
> +++ b/drivers/iio/adc/max40080.c
[ ... ]
> +static int max40080_set_range(struct max40080_state *st, unsigned int ra=
nge)
> +{
> +	int ret;
> +
> +	ret =3D max40080_update_bits(st, MAX40080_REG_CFG, MAX40080_CFG_RANGE_M=
SK,
> +				   FIELD_PREP(MAX40080_CFG_RANGE_MSK, range));
> +	if (ret)
> +		return ret;
> +
> +	st->range =3D range;

[Severity: Medium]
Could a race condition here cause the software cache to become desynchroniz=
ed
with the hardware state?

Since max40080_update_bits() releases st->lock before returning, concurrent
writes to the scale attribute could interleave their hardware updates and
software cache updates, leaving the hardware set to one range and the cache
set to another.

> +
> +	return 0;
> +}
[ ... ]
> +static int max40080_set_oversampling_ratio(struct max40080_state *st, in=
t val)
> +{
> +	int filter;
> +	int ret;
> +
> +	filter =3D max40080_oversampling_to_filter(val);
> +	if (filter < 0)
> +		return filter;
> +
> +	ret =3D max40080_update_bits(st, MAX40080_REG_CFG, MAX40080_CFG_FILTER_=
MSK,
> +				   FIELD_PREP(MAX40080_CFG_FILTER_MSK, filter));
> +	if (ret)
> +		return ret;
> +
> +	st->oversampling_ratio =3D val;

[Severity: Medium]
Similar to st->range above, could st->oversampling_ratio become desynchroni=
zed
with the hardware state due to being updated outside the lock?

> +
> +	return 0;
> +}
> +
> +static int max40080_read_raw(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan,
> +			     int *val, int *val2, long mask)
> +{
> +	struct max40080_state *st =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	switch (mask) {
[ ... ]
> +	case IIO_CHAN_INFO_SCALE:
> +		/*
> +		 * The selectable current-sense range is exposed through
> +		 * scale: each RANGE setting has its own precomputed
> +		 * mA-per-code value. Userspace picks the range by writing
> +		 * the matching scale.
> +		 */
> +		switch (chan->type) {
> +		case IIO_CURRENT:
> +			*val =3D st->current_scale[st->range][0];
> +			*val2 =3D st->current_scale[st->range][1];

[Severity: Medium]
Can this cause a torn read if st->range is updated concurrently?

Since st->range is used twice as an array index without taking st->lock,
concurrent writes could cause val and val2 to be mixed from different range=
s.

> +			return IIO_VAL_INT_PLUS_NANO;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715063652.3685=
01-1-stefan.popa@analog.com?part=3D2
