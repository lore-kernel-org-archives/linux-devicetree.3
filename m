Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FBE3E0090
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 08:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906542; cv=none; b=GPD78DQ+1TZzq/Cfgc7NdCiCoZhALbFH/ODDpy5pzJ7jS2u/PPOiaNuI/oSs+KCEI5vpUJ0rxz2+AiYkrB1I8Fgynly1Cx+2xsgt/85zOAlpzs8hS0Ex+4h57xaOv4Hw3zwcmZExtc+sprjcLJMI4Rt1SQR4HDCnKxYkejKJsqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906542; c=relaxed/simple;
	bh=8pzLfvKaJ3dBLRI3oaxA3rcmIJhgmqBPU+KkxdM+YUw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NmnVnNbKZ+hWyaPMMZ9dUy0jdJgXojlk70NYuM68kpMBUkAV/+uxly4Z+YszNa02UnuVj+JN0HEU6kb1oABjKbKRFomUUCrIyx8m3qSb864Yoq1ER9eNQ+GZmj+0wn/FR4e5+4lvdCxVa8aRjWU4VmjJvjQvEHML0mUZoop14W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oRNJXIMm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oRNJXIMm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64E111F000E9;
	Fri, 28 Aug 2026 08:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787906539;
	bh=0FE9DbMoF1z8whj8BKt/RIVNAtXvgukQPvfooxgRTvY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oRNJXIMmM/t9U/7WDwYopswoT7O8js4I9mBY87rjNAUE2dcbZVQA2EQ7B1vGIwedK
	 t8Ttr5k/9vvtKpdB4X81yLMCRiwKc6VB4pA5RBRYcLvzHhaHTkFgD2HRDaaIB5mCvL
	 Tsbc0WTZVY8WtnPYjxb13YOpPcMn53IulTqac/vvh5rOi5wZbEbCBufn7WG9rlsSmx
	 BFFGTkEG1e5OOAa8aHS1qm2pryr1tYyf6ldAXZweRjbzHHH1A8drIZUawY+x1cd+gc
	 WhoKebWa4DAwUGAtHGf2oP5eqKxkno6Cs2Dp+zbJKmk4AbKXUNssvwC8TK/TNRxinP
	 9hGt/j8bxQoQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/2] iio: adc: add MAX40080 current-sense amplifier
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefan Popa" <stefan.popa@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260828083119.54495-3-stefan.popa@analog.com>
References: <20260828083119.54495-1-stefan.popa@analog.com>
 <20260828083119.54495-3-stefan.popa@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 08:42:18 +0000
Message-Id: <20260828084219.64E111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Uninitialized stack memory usage and info leak due to unhandled sh=
ort reads in `max40080_read_iv_once`.
- [Medium] Data race on `st->oversampling_ratio` leading to undefined behav=
ior.
--

commit 418c131d1154e54b37ec3c4163c36804417d0225
Author: Stefan Popa <stefan.popa@analog.com>

iio: adc: add MAX40080 current-sense amplifier driver

The MAX40080 is a bidirectional current-sense amplifier with an
integrated 12-bit ADC and an I2C/SMBus interface.

> diff --git a/drivers/iio/adc/max40080.c b/drivers/iio/adc/max40080.c
> new file mode 100644
> index 0000000000000..1a6568eabcaa0
> --- /dev/null
> +++ b/drivers/iio/adc/max40080.c
[ ... ]
> +static int max40080_read_iv_once(struct max40080_state *st, u32 *iv)
> +{
> +	__le32 buf;
> +	int ret;
> +
> +	ret =3D i2c_smbus_read_i2c_block_data(st->client, MAX40080_REG_IV,
> +					    sizeof(buf), (u8 *)&buf);
> +	if (ret < 0)
> +		return ret;
> +
> +	*iv =3D le32_to_cpu(buf);

[Severity: High]
Can a short read here result in uninitialized stack memory being leaked to
userspace?

The ret variable receives the number of bytes read from
i2c_smbus_read_i2c_block_data(). If the device returns fewer bytes than
requested (0 <=3D ret < sizeof(buf)), this bypasses the ret < 0 check.

Does this mean the function will process uninitialized bytes from the stack
array buf and expose them to userspace during sensor reading calculations?

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
> +
> +	return 0;
> +}
[ ... ]
> +static int max40080_read_raw(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan,
> +			     int *val, int *val2, long mask)
> +{
> +	struct max40080_state *st =3D iio_priv(indio_dev);
> +	unsigned int range;
> +	int ret;
> +
> +	switch (mask) {
[ ... ]
> +	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
> +		*val =3D st->oversampling_ratio;
> +		return IIO_VAL_INT;

[Severity: Medium]
Is this safe from data races against concurrent sysfs writes?

The oversampling_ratio is read here without holding st->lock and without
READ_ONCE(). Meanwhile, max40080_write_raw() updates the value under
st->lock by calling max40080_set_oversampling_ratio().

Should this use READ_ONCE() (similar to how st->range is protected earlier
in this function) or lock serialization to avoid undefined behavior?

> +	default:
> +		return -EINVAL;
> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828083119.5449=
5-1-stefan.popa@analog.com?part=3D2
