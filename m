Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2119D1D54FA
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 00:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778286794; cv=none; b=oakrMEjiEtMtuG+y804LLmCg3GBTxrZnfh2+St1QN/wQFrEU5jm2qeo226dHIquPC00Yte0Af7g1brgn0RTpB11lzWPbmY+0vrBd9v6ft3P9x323zrJe1+Lvd5+V+YBoyDOvghuloPvQFBMjK5dMfArV8RW+R4aiDK08knSdoxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778286794; c=relaxed/simple;
	bh=RtoMKBOvH3wyeeTg8XyNDEEK+wgPQnQzoR57y26oAN4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=spPw6eMbYJk4XEUuw0K2Ubxhr7Ux+a+Vkgp30an7WnshV4+Fpw+az+/OE7K2dTtNomPBjf6Sn6P12maIgEp1i5j+ihowau+r97NpVQ8MTh+z2wSd4kcw5s+i8g0iwjsTCytJuMAw654gePhL4oqT098H4Aic4SXVEvJXqs1Z894=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IN14q4hx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IN14q4hx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8CD3C2BCB0;
	Sat,  9 May 2026 00:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778286794;
	bh=RtoMKBOvH3wyeeTg8XyNDEEK+wgPQnQzoR57y26oAN4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=IN14q4hx9UhbqccJyVwVQ1M1uWbVq66AE8Q2s3RPCV20MHQbtzDu7P8PkBSjLpCjY
	 GK/2Gt8j2HXZIQjN8gl7e6WBVu8m2vNYIwxF46nolzL960/vdEXelC1UfIL6XlmRog
	 9Hfe8WkJOH05Z5n43vZ6gUsDbBnYje8rpLv1H/oZwtDVa8ihERnB5UXPEuQiB9bVsY
	 YQsFWFeM+xi0lemibSVw9dPA/Ah9mCEqvquqRYYYzGXxOcRwkYp/RqH3UYph6lzcCD
	 Vid77y8IKhSe9UaNJh3HbLK0DTWmOLIwODS9XIbU+YnCqkvMN57Xf2971rZvidboyF
	 mrAfWFI7w33Fg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 06/10] iio: frequency: ad9910: add RAM mode
 support
Reply-To: sashiko@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260508-ad9910-iio-driver-v4-6-d26bfd20ee3d@analog.com>
References: <20260508-ad9910-iio-driver-v4-6-d26bfd20ee3d@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 00:33:13 +0000
Message-Id: <20260509003313.C8CD3C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] State Corruption on Hardware Write Failure during RAM mode toggle
- [High] Integer Underflow from negative fraction bypasses bounds checks
- [Medium] Missing IIO_CHAN_INFO_SCALE interface for RAM channel prevents s=
ingle-tone amplitude configuration
--

commit faac9fb534e90f61a8a63acf8162a1789a0da104
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: frequency: ad9910: add RAM mode support

This commit adds RAM control channel support to the AD9910 driver. It
introduces RAM data loading via firmware upload, profile configuration,
and profile parameter caching when RAM mode is active.

> diff --git a/drivers/iio/frequency/ad9910.c b/drivers/iio/frequency/ad991=
0.c
> index d6c88ec51145e..a153cd01e6f58 100644
> --- a/drivers/iio/frequency/ad9910.c
> +++ b/drivers/iio/frequency/ad9910.c

[ ... ]

> @@ -1020,6 +1091,17 @@ static const struct iio_chan_spec ad9910_channels[=
] =3D {
>  				      BIT(IIO_CHAN_INFO_SAMP_FREQ),
>  		.ext_info =3D ad9910_drg_ramp_ext_info,
>  	},
> +	[AD9910_CHAN_IDX_RAM] =3D {
> +		.type =3D IIO_ALTVOLTAGE,
> +		.indexed =3D 1,
> +		.output =3D 1,
> +		.channel =3D AD9910_CHANNEL_RAM,
> +		.address =3D AD9910_CHAN_IDX_RAM,
> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_ENABLE) |
> +				      BIT(IIO_CHAN_INFO_FREQUENCY) |
> +				      BIT(IIO_CHAN_INFO_PHASE) |
> +				      BIT(IIO_CHAN_INFO_SAMP_FREQ),
> +	},
>  };

Is BIT(IIO_CHAN_INFO_SCALE) missing from this mask?

ad9910_write_raw_get_fmt() expects AD9910_CHANNEL_RAM to support
IIO_CHAN_INFO_SCALE for single-tone amplitude configuration. Without the bit
set here, and without handling it in ad9910_read_raw() and ad9910_write_raw=
(),
users cannot adjust the single-tone amplitude while RAM mode is enabled.

[ ... ]

> @@ -1207,6 +1306,26 @@ static int ad9910_write_raw(struct iio_dev *indio_=
dev,
>  			return ad9910_reg32_update(st, AD9910_REG_CFR2,
>  						   AD9910_CFR2_DRG_ENABLE_MSK,
>  						   tmp32, true);
> +		case AD9910_CHANNEL_RAM:
> +			if (AD9910_RAM_ENABLED(st) =3D=3D !!val)
> +				return 0;
> +
> +			/* switch profile configs */
> +			for (i =3D 0; i < AD9910_NUM_PROFILES; i++) {
> +				tmp64 =3D st->reg[AD9910_REG_PROFILE(i)].val64;
> +				ret =3D ad9910_reg64_write(st,
> +							 AD9910_REG_PROFILE(i),
> +							 st->reg_profile[i],
> +							 false);
> +				if (ret)
> +					return ret;

Can this loop corrupt the software state if an SPI write fails partway thro=
ugh?

If ad9910_reg64_write() returns an error, the function exits immediately wi=
thout
rolling back the profiles that were already swapped. A subsequent retry wou=
ld
then iterate over the profiles again, swapping the previously swapped profi=
les
back and moving the remaining ones forward. This leaves the hardware and
software caches permanently desynchronized.

> +				st->reg_profile[i] =3D tmp64;
> +			}
> +
> +			tmp32 =3D FIELD_PREP(AD9910_CFR1_RAM_ENABLE_MSK, !!val);
> +			return ad9910_reg32_update(st, AD9910_REG_CFR1,
> +						   AD9910_CFR1_RAM_ENABLE_MSK,
> +						   tmp32, true);
>  		default:
>  			return -EINVAL;
>  		}

[ ... ]

> @@ -1246,6 +1370,8 @@ static int ad9910_write_raw(struct iio_dev *indio_d=
ev,
>  			return ad9910_reg64_update(st, AD9910_REG_DRG_LIMIT,
>  						   AD9910_DRG_LIMIT_LOWER_MSK,
>  						   tmp64, true);
> +		case AD9910_CHANNEL_RAM:
> +			return ad9910_reg32_write(st, AD9910_REG_FTW, tmp64, true);

Does the IIO_CHAN_INFO_FREQUENCY block handle negative fractional inputs
correctly when the integer part is zero?

If a user writes a value like -0.1, IIO parses it as val =3D 0 and
val2 =3D -100000. Earlier in the IIO_CHAN_INFO_FREQUENCY block, the bounds
check only inspects val:

	case IIO_CHAN_INFO_FREQUENCY:
		if (!in_range(val, 0, st->data.sysclk_freq_hz / 2))
			return -EINVAL;

		tmp64 =3D ad9910_rational_scale((u64)val * MICRO + val2, ...);

Since val is 0, the check passes. The mathematical operation then adds a
negative integer to an unsigned 64-bit integer, underflowing to a massive
value. This bypasses the bounds check and silently configures a huge RF
frequency instead of safely returning -EINVAL.

This same underflow pattern appears to affect IIO_CHAN_INFO_SCALE and
IIO_CHAN_INFO_SAMP_FREQ.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-ad9910-iio=
-driver-v4-0-d26bfd20ee3d@analog.com?part=3D6
