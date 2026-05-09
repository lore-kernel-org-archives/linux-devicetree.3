Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4463C13DDAE
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 01:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778288882; cv=none; b=Vrnx5MZdCzyzFy08jAj8WFSVkP77m6UAItAefwyxAtO07QZ/N7Mo8jbBPG9sbi7ESKvedp47p2RgSGKmdDz/c+ffNAQYMuo7SncwTOqqJj7VwWZuTvqhStzJ0hSZhuzFFMJmw6+Q8+2ZOfW27dAaq9Rs7d+fcLknGBaxBCH0rPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778288882; c=relaxed/simple;
	bh=LQaMAFCBzS+bnsjpMO3mCf3ioiq847oANzskkHfRFzI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ozhDFmypTjrFrWwHCklr80Be3MZNvxF1QMPoBz3c+T1ytCT7URLpV1EWZgYVDQL9nzYkfq1Xx1W8FVoJBJteoNNMNii9dcFqb148MCj3HARmOO1D+aKGm71NQ2Nijbdx69dm3apc4j18ONf3YZWV9sJjue/hj9PKcs17nllsjb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nuZQu9G/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nuZQu9G/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF50BC2BCB0;
	Sat,  9 May 2026 01:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778288881;
	bh=LQaMAFCBzS+bnsjpMO3mCf3ioiq847oANzskkHfRFzI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=nuZQu9G/6C/Uz+k4oZGoZYdXlXQwHl4hcOTElaRYQCZiD9q6AtEt5XVKek1JoK592
	 UoNp8Gfl1g4Yy5KnzWN7DywOILZN5HHPvDFzuEKcI1bY6K8Zw5H7ZtBXen41UlTtQu
	 xdTq+hi8ClWCqQ93cvbrHQ8qBm8TEZaFW0q6hD/P2vjvi0bW4RVTvLZymc5BOx3fp7
	 NDFLpoEnqvfG1k7OgAohhT4AOlfOVt9w9ruH6+x2dD1CuSC27tvjTdu7VwBhHvEiQS
	 27Y93DnonrdaN/nHeJwg8sloWqCZHWyqzZdgTfm67Uea8aVO41PpsjGNoH7eS3XXZu
	 pcRpaDf40h7ng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 07/10] iio: frequency: ad9910: add output shift
 keying support
Reply-To: sashiko@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260508-ad9910-iio-driver-v4-7-d26bfd20ee3d@analog.com>
References: <20260508-ad9910-iio-driver-v4-7-d26bfd20ee3d@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 01:08:01 +0000
Message-Id: <20260509010801.AF50BC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The OSK channel cannot be scaled because ad9910_write_raw_get_fmt(=
) does not support AD9910_CHANNEL_OSK.
- [Medium] Integer wrap-around on 32-bit platforms leads to incorrect scale=
_roc configuration for out-of-bounds user inputs.
- [Medium] Writing non-standard truthy values to the OSK enable attribute t=
urns the channel off instead of on.
- [Low] The scale_roc_available sysfs attribute is incorrectly created with=
 write permissions.
--

commit d92799d64693d2c01054913b1a546994813e0150
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>
Subject: iio: frequency: ad9910: add output shift keying support

Add OSK channel with amplitude envelope control capabilities.

> diff --git a/drivers/iio/frequency/ad9910.c b/drivers/iio/frequency/ad991=
0.c
> index a153cd01e6f58..1fdbaba356d73 100644
> --- a/drivers/iio/frequency/ad9910.c
> +++ b/drivers/iio/frequency/ad9910.c
> @@ -980,6 +985,134 @@ static ssize_t ad9910_drg_attrs_write(struct iio_de=
v *indio_dev,
>  	return len;
>  }
> =20

[ ... ]

> +static ssize_t ad9910_osk_attrs_write(struct iio_dev *indio_dev,
> +				      uintptr_t private,
> +				      const struct iio_chan_spec *chan,
> +				      const char *buf, size_t len)
> +{

[ ... ]

> +	switch (private) {
> +	case AD9910_OSK_AUTO_ROC:
> +		nstep =3D ad9910_rational_scale((u64)val * NANO + val2, rate,
> +					      st->data.sysclk_freq_hz);
> +		idx =3D find_closest(nstep, ad9910_osk_nstep,
> +				   ARRAY_SIZE(ad9910_osk_nstep));

Is there a chance that a very large nstep value could cause issues on 32-bit
platforms here?

The find_closest() macro internally assigns the input to a local long varia=
ble.
If nstep is a u64 that exceeds LONG_MAX, it could wrap around to a negative
number, matching the 0th index instead of the maximum step size.

[ ... ]

> @@ -997,6 +1130,9 @@ static ssize_t ad9910_drg_attrs_write(struct iio_dev=
 *indio_dev,
>  #define AD9910_DRG_EXT_INFO(_name, _ident) \
>  	AD9910_EXT_INFO_TMPL(_name, _ident, IIO_SEPARATE, drg_attrs)
> =20
> +#define AD9910_OSK_EXT_INFO(_name, _ident) \
> +	AD9910_EXT_INFO_TMPL(_name, _ident, IIO_SEPARATE, osk_attrs)
> +
>  static const struct iio_chan_spec_ext_info ad9910_phy_ext_info[] =3D {
>  	AD9910_EXT_INFO("powerdown", AD9910_POWERDOWN, IIO_SEPARATE),
>  	{ }
> @@ -1018,6 +1154,12 @@ static const struct iio_chan_spec_ext_info ad9910_=
drg_ramp_ext_info[] =3D {
>  	{ }
>  };
> =20
> +static const struct iio_chan_spec_ext_info ad9910_osk_ext_info[] =3D {
> +	AD9910_OSK_EXT_INFO("scale_roc", AD9910_OSK_AUTO_ROC),
> +	AD9910_OSK_EXT_INFO("scale_roc_available", AD9910_OSK_AUTO_ROC_AVAIL),
> +	{ }
> +};
> +

Does scale_roc_available end up with write permissions here?

The AD9910_OSK_EXT_INFO macro uses AD9910_EXT_INFO_TMPL, which assigns both
the .read and .write callbacks. This will cause the IIO core to create
the scale_roc_available sysfs attribute with 0644 permissions, but available
attributes are typically read-only.

[ ... ]

> @@ -1102,6 +1244,17 @@ static const struct iio_chan_spec ad9910_channels[=
] =3D {
>  				      BIT(IIO_CHAN_INFO_PHASE) |
>  				      BIT(IIO_CHAN_INFO_SAMP_FREQ),
>  	},
> +	[AD9910_CHAN_IDX_OSK] =3D {
> +		.type =3D IIO_ALTVOLTAGE,
> +		.indexed =3D 1,
> +		.output =3D 1,
> +		.channel =3D AD9910_CHANNEL_OSK,
> +		.address =3D AD9910_CHAN_IDX_OSK,
> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_ENABLE) |
> +				      BIT(IIO_CHAN_INFO_SCALE) |
> +				      BIT(IIO_CHAN_INFO_SAMP_FREQ),
> +		.ext_info =3D ad9910_osk_ext_info,
> +	},
>  };

Since AD9910_CHANNEL_OSK is added with IIO_CHAN_INFO_SCALE here, does
ad9910_write_raw_get_fmt() also need to be updated to support this channel =
type?

If ad9910_write_raw_get_fmt() falls through to the default case and returns
-EINVAL, it looks like the IIO core might abort write operations for the sc=
ale
attribute before ad9910_write_raw() is even called.

[ ... ]

> @@ -1326,6 +1493,11 @@ static int ad9910_write_raw(struct iio_dev *indio_=
dev,
>  			return ad9910_reg32_update(st, AD9910_REG_CFR1,
>  						   AD9910_CFR1_RAM_ENABLE_MSK,
>  						   tmp32, true);
> +		case AD9910_CHANNEL_OSK:
> +			tmp32 =3D FIELD_PREP(AD9910_CFR1_OSK_ENABLE_MSK, val);
> +			return ad9910_reg32_update(st, AD9910_REG_CFR1,
> +						   AD9910_CFR1_OSK_ENABLE_MSK,
> +						   tmp32, true);
>  		default:
>  			return -EINVAL;
>  		}

If val is a non-standard truthy value (like 2), wouldn't FIELD_PREP() mask =
it
to 0 and inadvertently disable the channel instead of enabling it?

Should this use !!val to sanitize the input, similar to how the RAM channel
does it?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-ad9910-iio=
-driver-v4-0-d26bfd20ee3d@analog.com?part=3D7
