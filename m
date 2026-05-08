Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A72F2E1EFC
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 23:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778282343; cv=none; b=mUXoJKsaLk1xhRgOw3mt0LtfwiTUG1qL4qw6xfPjFfod/05wSxn/f96dJu95z7hPn3cULQfTkkzWwWlEg0sWNv1FoTyS1q47MuZwFo+OH6YVlV8dKh2YZ7OlpLcCxEZnwYZwQ7az6yhLhOzBdYSTZ1ZCZkEWT6cjQeMsOxZXRKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778282343; c=relaxed/simple;
	bh=FWhB/rQHS5VEZMek7e4mzbpPURvM+6YCO7g24LmO284=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rpgjlfFBvcvbOE3dPK/7QhZmWanpDEwkbPebI8b6ml/0ZUAEOrHxY930aipPYKDVyuAN5xHPq4WwL9pnPmJp0cVIiUftgbgkTxxH9oDRGQzCJSEIA+1QBsCJCfe0d+niJEwZYfIJD2iS6H0d2L2gU7/nX08iGulW7T2WcrCchlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ebUAPoan; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ebUAPoan"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C3C8C2BCB0;
	Fri,  8 May 2026 23:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778282342;
	bh=FWhB/rQHS5VEZMek7e4mzbpPURvM+6YCO7g24LmO284=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ebUAPoanN3wW5GYJ2VNoKqwu+AJ38IiD95EcQV8QNlGG/IP1qZquX8ngd6rIxS65x
	 jUqU0Zhrj9qyfbcT2u+cSG5oiL2QPYMnU+GUUDD+MWAeSxe0S8dAjq63A6KhWsIUuN
	 8jhGdVsgDlckLTgPaX/45cfULlk5O3xP1ePDp9lKvWG7O2U1L5LtVb5lOoSH1ICnq2
	 DFPJSFAmLYUWAgY6fSlIivA42udL3vDe56l+dojJctNPTXcfzqTk+OBPm1n6ePG8nF
	 v9NN/20gfC9aetem+pUe4hnYbcZMihj7QPGstAvaONRPuXhqTqzA1Kupct8qCyPQ+m
	 3cEbisOu5b/Kw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 04/10] iio: frequency: ad9910: add basic parallel
 port support
Reply-To: sashiko@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260508-ad9910-iio-driver-v4-4-d26bfd20ee3d@analog.com>
References: <20260508-ad9910-iio-driver-v4-4-d26bfd20ee3d@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 23:19:01 +0000
Message-Id: <20260508231902.7C3C8C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The AD9910_PP_FREQ_OFFSET write function fails to reject negative =
fractional values when the integer part is 0, causing a massive integer und=
erflow when computing the frequency tuning word.
- [Medium] The parallel port channel exposes an `enable` sysfs attribute bu=
t lacks support in raw accessors, causing read/write operations to uncondit=
ionally return `-EINVAL`.
--

commit 6d64943a7cb666034a2bfe3e59647d035b7c3fb6
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: frequency: ad9910: add basic parallel port support

This commit adds a parallel port channel to the AD9910 driver with frequency
scale, frequency offset, phase offset, and amplitude offset extended
attributes. Enabling and disabling parallel mode will be implemented later
with buffer setup ops.

> diff --git a/drivers/iio/frequency/ad9910.c b/drivers/iio/frequency/ad991=
0.c
> index c75f2ef178c25..b069b849e8d72 100644
> --- a/drivers/iio/frequency/ad9910.c
> +++ b/drivers/iio/frequency/ad9910.c

[ ... ]

> @@ -511,6 +528,121 @@ static ssize_t ad9910_ext_info_write(struct iio_dev=
 *indio_dev,
[ ... ]
> +static ssize_t ad9910_pp_attrs_write(struct iio_dev *indio_dev,
> +				     uintptr_t private,
> +				     const struct iio_chan_spec *chan,
> +				     const char *buf, size_t len)
> +{
> +	struct ad9910_state *st =3D iio_priv(indio_dev);
> +	int val, val2;
> +	u32 tmp32;
> +	int ret;
> +
> +	ret =3D iio_str_to_fixpoint(buf, MICRO / 10, &val, &val2);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	switch (private) {
> +	case AD9910_PP_FREQ_OFFSET:
> +		if (!in_range(val, 0, st->data.sysclk_freq_hz / 2))
> +			return -EINVAL;
> +
> +		tmp32 =3D ad9910_rational_scale((u64)val * MICRO + val2, BIT_ULL(32),
> +					      (u64)MICRO * st->data.sysclk_freq_hz);

If a negative fraction between 0 and -1 is parsed (for example, "-0.5"),
won't iio_str_to_fixpoint() set val to 0 and val2 to a negative number like
-500000?

Since the bounds check only verifies the integer part (val), 0 passes. Could
the offset calculation (u64)val * MICRO + val2 then underflow to an enormous
unsigned value when adding the negative signed integer to 0ULL?

It looks like this would write a mathematically incorrect, out-of-bounds
frequency tuning word to the device hardware. Should there be an explicit
check for negative values here?

> +		ret =3D ad9910_reg32_write(st, AD9910_REG_FTW, tmp32, true);
> +		if (ret)
> +			return ret;
> +		break;

[ ... ]

> @@ -564,6 +707,15 @@ static const struct iio_chan_spec ad9910_channels[] =
=3D {
[ ... ]
>  	[AD9910_CHAN_IDX_PROFILE_7] =3D AD9910_PROFILE_CHAN(7),
> +	[AD9910_CHAN_IDX_PARALLEL_PORT] =3D {
> +		.type =3D IIO_ALTVOLTAGE,
> +		.indexed =3D 1,
> +		.output =3D 1,
> +		.channel =3D AD9910_CHANNEL_PARALLEL_PORT,
> +		.address =3D AD9910_CHAN_IDX_PARALLEL_PORT,
> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_ENABLE),

Does this expose an enable sysfs attribute that unconditionally returns
-EINVAL when accessed?

Looking at ad9910_read_raw(), the IIO_CHAN_INFO_ENABLE case only handles the
profile channels:

case IIO_CHAN_INFO_ENABLE:
	switch (chan->channel) {
	case AD9910_CHANNEL_PROFILE_0 ... AD9910_CHANNEL_PROFILE_7:
		[ ... ]
		break;
	default:
		return -EINVAL;
	}

If parallel mode enabling is planned for the future with buffer setup ops as
noted in the commit message, should this attribute bit be omitted for now to
avoid userspace enumeration tool failures?

> +		.ext_info =3D ad9910_pp_ext_info,
> +	},
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-ad9910-iio=
-driver-v4-0-d26bfd20ee3d@analog.com?part=3D4
