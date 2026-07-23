Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8A13E49C5
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 20:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784837095; cv=none; b=W0feog3HHK13yJSe5wljAbkJKzjrUCFH946nQhTJu60Fuzv5SdOGPaPO9g9ZeBVZfZQAZp+CicdXKFYzyAxzkrTkBuSLlrOGwg4aJeSW+u5PgKL61Tu23Dd7nMs5KtNdfWHL9D+R7Abh7pymcL0qHMWUkzMhUQO9U8ev/V3Ic8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784837095; c=relaxed/simple;
	bh=tDFoV7JOOAH3Y+ZWaewS0DhlemZ0BJEkHxChC8PyIo8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N6+Ye/pSN9MRyj2IMfKy0GUeaOioxjGQwRvdJETasXnnuWhaP0XAdmdCRxzLY4660GNUZC1ABhwHDJUddDLeP2FWP6dNiQnGvhhx3egK04jlxhkAerNhD5Doj62r0MJNgLcLLIihTR1hTLCKlHukdyLQBGwosHuA6fhu7fLTNLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CqjUlBo8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CqjUlBo8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 082871F00A3D;
	Thu, 23 Jul 2026 20:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784837092;
	bh=XdL193i1tpkEbdA7Wfd7/RR3r/YrxLYUkk/aa6FRL/I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CqjUlBo8HRsAxPn/qSahAp0RM689iEBIIspZUHPn44/z77rh8DYctIkI+kKzJkBzb
	 lKVsancIbUNJCHTlB4bdBdZKBj6I2szycYIkuYmoJv8EjaGBYr2AXg0oIktcct8gRz
	 Uiw8f7pla4m2U7JAS4/bs+CcZ6GiLO0taZ3smcdD17doSn9ZTO2VgL+AEbltd8tpkz
	 Kuo3/Yxfjl8pDkfpPwMSpgCeWcikUUz1MqAKMa34jAkLrHm7V/6X+3Sarxg3a3q+fh
	 poIMvG7LhJKBPdpcs2SYg/xhThO83sfabkXXEPqLfcgSlxcvj2zBxeihQiHPGSdWVD
	 tbK1SzfIW6hMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/5] iio: adc: ltc2378: Add support for LTC2378-20
 and similar ADCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <1c12e37f273d4f99916768e1a9b44dbae30f9d0c.1784835663.git.marcelo.schmitt@analog.com>
References: <cover.1784835663.git.marcelo.schmitt@analog.com>
 <1c12e37f273d4f99916768e1a9b44dbae30f9d0c.1784835663.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 20:04:51 +0000
Message-Id: <20260723200452.082871F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The IIO scale factor exported for the LTC2338-18 is incorrect du=
e to an unaccounted internal resistor divider (missing 2.5x multiplier).
--

--- Patch [2]: [PATCH v8 2/5] iio: adc: ltc2378: Add support for LTC2378-20=
 and similar ADCs ---
commit 79bd7cc98e49057401d7fb8d26685b9092c4787e
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ltc2378: Add support for LTC2378-20 and similar ADCs

Support for LTC2378-20 and similar analog-to-digital converters.

> diff --git a/drivers/iio/adc/ltc2378.c b/drivers/iio/adc/ltc2378.c
> new file mode 100644
> index 0000000000000..107388f870626
> --- /dev/null
> +++ b/drivers/iio/adc/ltc2378.c
[ ... ]
> +static const struct ltc2378_chip_info ltc2338_18_chip_info =3D {
> +	.name =3D "ltc2338-18",
> +	.internal_ref_uV =3D 2048000,
> +	.chan =3D LTC2378_DIFF_CHANNEL(18),
> +};

[Severity: Medium]
Does this chip info need a field to indicate the scale multiplier?

The LTC2338-18 has an internal resistor divider which acts as a 2.5x multip=
lier,
but this struct doesn't currently contain a way to specify it.

[ ... ]
> +static int ltc2378_read_raw(struct iio_dev *indio_dev,
> +			    const struct iio_chan_spec *chan,
> +			    int *val, int *val2, long mask)
> +{
> +	struct ltc2378_state *st =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	switch (mask) {
[ ... ]
> +	case IIO_CHAN_INFO_SCALE:
> +		*val =3D st->ref_uV / MILLI;

[Severity: Medium]
Will this return an incorrect IIO scale factor for the LTC2338-18?

The scale is calculated purely based on the reference voltage here, which d=
oes
not account for the LTC2338-18's internal divider (missing the 2.5x multipl=
ier).
This could lead to incorrect voltage calculations in userspace.

> +		/*
> +		 * For all LTC2378-like devices, the amount of bits that express
> +		 * voltage magnitude depend on the polarity / output code format:
> +		 * - straight binary: All precision/resolution bits are used.
> +		 * - 2's complement: One of the precision bits is used for sign.
> +		 */
> +		if (chan->scan_type.format =3D=3D IIO_SCAN_FORMAT_SIGNED_INT)
> +			*val2 =3D chan->scan_type.realbits - 1;
> +		else
> +			*val2 =3D chan->scan_type.realbits;
> +
> +		return IIO_VAL_FRACTIONAL_LOG2;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1784835663.gi=
t.marcelo.schmitt@analog.com?part=3D2
