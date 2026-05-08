Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243C8368294
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 23:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778284414; cv=none; b=a7MgZ7anj6XSQLyFeo+oh5ATb1TRJO0BXyImHwKw708Kqekyv14E0iQQYKZ6skkAD+C2aBG5XisBJrwoB6AUTjnZvPyugelBqJGUdUPdl1eoytvQL9lElWASuXZ6BvLoxzV4lIeXVGqoyS7B/zHlxTccIcIuADXUWexoPG8gk0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778284414; c=relaxed/simple;
	bh=xj2QPEM659jnGBmrWC/5DKp28mscjfADmzOAPnTRXJ8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KV9XaVepSFsRUTd5uHj8QHOLJDwVnXRy6ZjSYy41DlRu9mFK5npYUFkjEMw4uFrh64GhyR0xoGofmWDNt8QMBxmLCnetVUX51XVuHJEbdVUS4J1abNdesRrXz3sb4n2CpWFeYacLeegHeOpGFx6L7xNX7m03fDkAxfKqfYc5yDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hVvF0CPN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hVvF0CPN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76247C2BCB0;
	Fri,  8 May 2026 23:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778284413;
	bh=xj2QPEM659jnGBmrWC/5DKp28mscjfADmzOAPnTRXJ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=hVvF0CPNwdKMps1mozbLVGo72LAzCvLz9YayGlcUggwupkOLx3nDS1XqT9PA/RdLo
	 Q9OchxWSBy+muyeHWj99T0PztAKqsVJmVJQSLpJMZukmdQxYmDicI41dz3MRdBVjCj
	 mf5UbrFIdxKA2SqX1nosQRX4+Fqyc+L81nOQszgLRwn7SClxX3RdiT7IzqUW9FdNvg
	 hnR0bsv/WPwtidCdNJLyFqtUAhB5Aue8LTSC8IE0Vco5lJur5Cqh/Zr++NKSfUfuOY
	 V9DkCp4NUFMnA5Y/6G9lxqAj45rFJWiAIWw8pgyj18gPUr75jyrm3turkNZ03E6Nnd
	 nRt9sJeDx95jg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 05/10] iio: frequency: ad9910: add digital ramp
 generator support
Reply-To: sashiko@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260508-ad9910-iio-driver-v4-5-d26bfd20ee3d@analog.com>
References: <20260508-ad9910-iio-driver-v4-5-d26bfd20ee3d@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 23:53:32 +0000
Message-Id: <20260508235333.76247C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing bounds check for negative fractional inputs causes integer=
 underflow, silently configuring hardware to maximum limits.
- [Medium] The `IIO_CHAN_INFO_ENABLE` attribute is exposed for DRG ramp cha=
nnels but unconditionally returns `-EINVAL`.
- [Low] Incompatible pointer type mismatch when passing `int *` to `div_u64=
_rem()`.
--

commit 81e59a90f90a26812172e27f2860e2027f281ffb
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>
Subject: iio: frequency: ad9910: add digital ramp generator support

This commit adds Digital Ramp Generator channels with destination selection
based on attribute writes, dwell mode control, configurable upper/lower
limits, step size controlled with rate of change config, and step rate
controlled as sampling frequency.

> diff --git a/drivers/iio/frequency/ad9910.c b/drivers/iio/frequency/ad991=
0.c
> index b069b849e8d72..d6c88ec51145e 100644
> --- a/drivers/iio/frequency/ad9910.c
> +++ b/drivers/iio/frequency/ad9910.c

[ ... ]

> @@ -716,6 +986,40 @@ static const struct iio_chan_spec ad9910_channels[] =
=3D {
>  		.info_mask_separate =3D BIT(IIO_CHAN_INFO_ENABLE),
>  		.ext_info =3D ad9910_pp_ext_info,
>  	},
> +	[AD9910_CHAN_IDX_DRG] =3D {
> +		.type =3D IIO_ALTVOLTAGE,
> +		.indexed =3D 1,
> +		.output =3D 1,
> +		.channel =3D AD9910_CHANNEL_DRG,
> +		.address =3D AD9910_CHAN_IDX_DRG,
> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_ENABLE),
> +	},
> +	[AD9910_CHAN_IDX_DRG_RAMP_UP] =3D {
> +		.type =3D IIO_ALTVOLTAGE,
> +		.indexed =3D 1,
> +		.output =3D 1,
> +		.channel =3D AD9910_CHANNEL_DRG_RAMP_UP,
> +		.address =3D AD9910_CHAN_IDX_DRG_RAMP_UP,
> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_ENABLE) |

The channel definition for AD9910_CHAN_IDX_DRG_RAMP_UP and
AD9910_CHAN_IDX_DRG_RAMP_DOWN includes BIT(IIO_CHAN_INFO_ENABLE) in the
info_mask_separate.

However, in ad9910_read_raw() and ad9910_write_raw(), only
AD9910_CHANNEL_DRG is handled for IIO_CHAN_INFO_ENABLE.

Will reads and writes to the ramp channels' enable attributes fall
through to the default case and unconditionally return -EINVAL? Should
the enable bit be removed from the ramp channels' info mask?

> +				      BIT(IIO_CHAN_INFO_FREQUENCY) |
> +				      BIT(IIO_CHAN_INFO_PHASE) |
> +				      BIT(IIO_CHAN_INFO_SCALE) |
> +				      BIT(IIO_CHAN_INFO_SAMP_FREQ),
> +		.ext_info =3D ad9910_drg_ramp_ext_info,
> +	},

[ ... ]

> @@ -767,6 +1092,26 @@ static int ad9910_read_raw(struct iio_dev *indio_de=
v,
>  			*val =3D tmp32 / MICRO;
>  			*val2 =3D tmp32 % MICRO;
>  			return IIO_VAL_INT_PLUS_MICRO;
> +		case AD9910_CHANNEL_DRG_RAMP_UP:
> +			ret =3D ad9910_drg_destination_assert(st, AD9910_DEST_PHASE);
> +			if (ret)
> +				return ret;
> +
> +			tmp64 =3D FIELD_GET(AD9910_DRG_LIMIT_UPPER_MSK,
> +					  st->reg[AD9910_REG_DRG_LIMIT].val64);
> +			tmp64 =3D (tmp64 * AD9910_PI_NANORAD) >> 31;
> +			*val =3D div_u64_rem(tmp64, NANO, val2);

Here val2 is provided by the IIO core as an int *, but div_u64_rem()
expects its third argument to be a u32 *remainder.

Does passing a signed integer pointer to a function expecting an unsigned
integer pointer cause a compiler warning or strict aliasing violation?
Should a local u32 variable be used to capture the remainder before
assigning it to *val2?

> +			return IIO_VAL_INT_PLUS_NANO;

[ ... ]

>  	case IIO_CHAN_INFO_SAMP_FREQ:
> -		return ad9910_set_sysclk_freq(st, val, true);
> +		if (chan->channel =3D=3D AD9910_CHANNEL_PHY)
> +			return ad9910_set_sysclk_freq(st, val, true);
> +
> +		tmp64 =3D ((u64)val * MICRO + val2) * 4;

If a negative fractional string like "-0.5" is provided by userspace, the
IIO core sets val to 0 and val2 to a negative value (like -500000).

Since val2 is signed and (u64)val * MICRO is unsigned, won't adding them
together cause a sign-extended underflow, resulting in a very large tmp64
value that is then clamped to the hardware maximums?

Should there be a bounds check to ensure val2 >=3D 0, or an in_range()
check for these attributes before calculating tmp64?

> +		if (!tmp64)
> +			return -EINVAL;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-ad9910-iio=
-driver-v4-0-d26bfd20ee3d@analog.com?part=3D5
