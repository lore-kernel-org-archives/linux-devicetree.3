Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751EE2C11D6
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 13:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781790146; cv=none; b=EpuI/kjD6buOGpB80VS06vdC+cnA9yHJVaW1FY+kAkyLSQJ7akEAP5lRqRWbWHSmHmtCzh9NgdRSDO54FLSBQVPqijzKZmgLtrmkRu1yXiEJiVM9QT0OUQRw6jHRE0eV4pR0wWksvfcAYCL+26oSqNqXeTdb5HmeNCGufv6wDss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781790146; c=relaxed/simple;
	bh=6wMXg6cHw90u7L3R7voMvsTiGk7FYAvxROVU7ayB/mM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aejppWB0HZ+UyKNw9xtv2qB5+FQjy1HSP6q6SOZ2s12oXdzOPE957YN/qtp9McQO/oh4Wc6MW3vOt0Injn39cRdj0xP3jl+L/oliJJg/Y47PxFjxv2vHgH1yCY34192y3Xew0AeJRkWUAArfBvIlcEj+DBdFhI+PAXRY5gb262k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/2kOZPS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/2kOZPS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2140E1F000E9;
	Thu, 18 Jun 2026 13:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781790145;
	bh=IaEzptdp2hhhnU6LO6c12OKkN4zdcTfNSB/m7+Fpru0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O/2kOZPSj/PP9SBMA7azgYsm5zVTVaL/1WckccwOqWDiFRuBLtOxGbdyzQeXpM5rb
	 4FWbo4VpnS1C8K4Qo3ycatzP1CcDAlY6IKYf2QJqUw12BzihluY8tW2CQ3r3Xuphsu
	 vPf5/HFqvHAtYS1xv8vq7CQZI0aGD4M8NWqgFq5P2gEcvBbQu5ulTd3ldkH2KiGRai
	 LG1frEdM1dV/p0xOuPAxXrlLlQzo5XwW7sGYUxys6E6G2pso3UeOrv1BCZfoPzIzsA
	 xY37GXojRZH/pXzO1GA18wtydCfJlav5jGgJ/sdWYv3Rjlil2GBsyrtGEGNaQRzEVw
	 SF2Xkc0hUqodQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 11/16] iio: frequency: ad9910: add digital ramp
 generator support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260618-ad9910-iio-driver-v6-11-79125ffbe430@analog.com>
References: <20260618-ad9910-iio-driver-v6-0-79125ffbe430@analog.com>
 <20260618-ad9910-iio-driver-v6-11-79125ffbe430@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 13:42:24 +0000
Message-Id: <20260618134225.2140E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Negative values written to DRG_RAMP_UP or DRG_RAMP_DOWN raw attr=
ibutes are silently converted and clamped to U32_MAX instead of returning a=
n error.
--

commit add95ac7476587b7d5eda18e659f33df4cc8cb31
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: frequency: ad9910: add digital ramp generator support

This patch adds support for Digital Ramp Generator channels to the AD9910
driver. It includes configuration for destination selection, dwell mode,
limits, step sizes, and step rates.

> diff --git a/drivers/iio/frequency/ad9910.c b/drivers/iio/frequency/ad991=
0.c
> index 262702b62738d..3fe97aa887c3a 100644
> --- a/drivers/iio/frequency/ad9910.c
> +++ b/drivers/iio/frequency/ad9910.c

[ ... ]

> @@ -831,22 +1108,62 @@ static int ad9910_write_raw(struct iio_dev *indio_=
dev,
>  			return -EINVAL;
>  		}
>  	case IIO_CHAN_INFO_RAW:
> -		if (val < 0)
> -			return -EINVAL;
> -
>  		switch (chan->channel) {
>  		case AD9910_CHANNEL_PROFILE_0 ... AD9910_CHANNEL_PROFILE_7:
> +			if (val < 0)
> +				return -EINVAL;
> +
>  			tmp32 =3D chan->channel - AD9910_CHANNEL_PROFILE_0;
>  			tmp64 =3D FIELD_PREP(AD9910_PROFILE_ST_ASF_MSK,
>  					   min_t(u64, val, AD9910_ASF_MAX));
>  			return ad9910_reg64_update(st, AD9910_REG_PROFILE(tmp32),
>  						   AD9910_PROFILE_ST_ASF_MSK,
>  						   tmp64, true);
> +		case AD9910_CHANNEL_DRG_RAMP_UP:
> +			tmp64 =3D iio_val_s64_compose(val, val2);
> +			tmp64 =3D min_t(u64, tmp64, U32_MAX);

[Severity: Medium]
When a negative value is written to the DRG_RAMP_UP or DRG_RAMP_DOWN raw
attributes, does this bypass error checking?

Since iio_val_s64_compose() returns an s64, a negative input will be
implicitly cast to u64 when assigned to tmp64. This causes it to wrap to a
large positive number, which min_t() will then clamp to U32_MAX rather than
rejecting the invalid negative input.

Should we check for negative values before calling iio_val_s64_compose(),
similar to what is done for the profile channels?

> +			tmp64 =3D FIELD_PREP(AD9910_DRG_LIMIT_UPPER_MSK, tmp64);
> +			return ad9910_reg64_update(st, AD9910_REG_DRG_LIMIT,
> +						   AD9910_DRG_LIMIT_UPPER_MSK,
> +						   tmp64, true);
> +		case AD9910_CHANNEL_DRG_RAMP_DOWN:
> +			tmp64 =3D iio_val_s64_compose(val, val2);
> +			tmp64 =3D min_t(u64, tmp64, U32_MAX);
> +			tmp64 =3D FIELD_PREP(AD9910_DRG_LIMIT_LOWER_MSK, tmp64);
> +			return ad9910_reg64_update(st, AD9910_REG_DRG_LIMIT,
> +						   AD9910_DRG_LIMIT_LOWER_MSK,
> +						   tmp64, true);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618-ad9910-iio=
-driver-v6-0-79125ffbe430@analog.com?part=3D11
