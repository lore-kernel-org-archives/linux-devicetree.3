Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7A035AC0E
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 13:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781790119; cv=none; b=UZKhFyxiwM3M6d1iiYcPOcSDn7CXJl+3BhPUWg1aGlw2oc2WTUHJRQFUc3rXY21kt5kaOWDjdEL56D3uEfCcGX4TIZuDku9Bu9V5UEErYrw4/UuiP0Px/0mybdroFHiC+THKzbrcymxiV1iEfP7j7BOUnPfLOp3IZWMust7VUsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781790119; c=relaxed/simple;
	bh=iNUU12dly5WvKGPikGabyZysIye2LmaB2hq6R5CyABM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RXjtCELg34PmovVi0Ozn/X+yJx7UEOkGEjlXy/qwre3PQsnjlsY6OTOPeX1EiM84EzW+6Py59B8lm1x+QTrF9V7GuCXFSumnxnc9IR+W/4+12Asa+kIcKuDZljq3o2accFeqsa/emGU6grMrsZt7CZAfS6VeNg82lx1QePvtwCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VYde2Jwj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VYde2Jwj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0DEC1F000E9;
	Thu, 18 Jun 2026 13:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781790118;
	bh=U81m4BhaW1u44W7B05K2A9OJq/T0nR7PzlUnZVlWtOA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VYde2JwjaKkKGpRwmp7BUh46BszLIc0ybAqhArrkH/h9NLZapPsorYcssd51XN78C
	 rJQXwFIL7Fxhmtif+FCTXQnT2Po8XsE8tVPZpZwkpSLhaat87y6EUxIXOYtuemgO9q
	 bWhEhOKWCceTCg55Nun45PQch1Msrpnh+iRU8LAXEZPrBFd6vJk0DUNb60rPTopUrY
	 d3Vsy5GVj1ME87fJb1Cmxmn8OlCcNKyX8jwiP27zEsBlH9zuuNj0eVGCaX3+kgnOBf
	 uvQL3+HEuflZsSlLJLrl4fuQQj8gtxHg4I+HRIS8/xjxVyl9ZNbxmHx8LOmnpHU98O
	 fEYwa5XvA8esA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 10/16] iio: frequency: ad9910: add basic parallel
 port support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260618-ad9910-iio-driver-v6-10-79125ffbe430@analog.com>
References: <20260618-ad9910-iio-driver-v6-0-79125ffbe430@analog.com>
 <20260618-ad9910-iio-driver-v6-10-79125ffbe430@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 13:41:57 +0000
Message-Id: <20260618134157.B0DEC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Medium] 32-bit truncation in the parallel frequency scale calculation ca=
uses incorrect readback.
- [Medium] 64-bit integer overflow in parallel frequency offset calculation=
 circumvents U32_MAX capping.
- [Medium] `roundup_pow_of_two` truncates 64-bit scale calculation on 32-bi=
t architectures.
- [Medium] Integer overflow when reading and writing the frequency offset f=
or the parallel frequency channel.

Pre-existing issues:
- [High] Kernel panic due to division by zero if the reference clock rate i=
s zero.
--

commit 5740831576c6dff0dd6ca6d5b5930978950cfff8
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: frequency: ad9910: add basic parallel port support

Add parallel port support with amplitude, phase and frequency channels.
Those will be buffered capable channels, but only basic control of offset
and scale are implemented at this point.

> diff --git a/drivers/iio/frequency/ad9910.c b/drivers/iio/frequency/ad991=
0.c
> index 95b01295e4a0a..262702b62738d 100644
> --- a/drivers/iio/frequency/ad9910.c
> +++ b/drivers/iio/frequency/ad9910.c

[ ... ]

> @@ -640,11 +702,60 @@ static int ad9910_read_raw(struct iio_dev *indio_de=
v,
>  			return -EINVAL;
>  		}
>  	case IIO_CHAN_INFO_SCALE:
> -		tmp64 =3D (u64)st->data.output_current_uA *
> -			AD9910_NANO_MILLIAMP_PER_MICROAMP;
> -		*val =3D 0;
> -		*val2 =3D tmp64 >> 14;
> -		return IIO_VAL_INT_PLUS_NANO;
> +		switch (chan->address) {
> +		case AD9910_CHAN_IDX_PHY:
> +			tmp64 =3D (u64)st->data.output_current_uA *
> +				AD9910_NANO_MILLIAMP_PER_MICROAMP;
> +			*val =3D 0;
> +			*val2 =3D tmp64 >> 14;
> +			return IIO_VAL_INT_PLUS_NANO;
> +		case AD9910_CHAN_IDX_PARALLEL_PHASE:
> +			*val =3D 0;
> +			*val2 =3D AD9910_PI_NANORAD >> 15;
> +			return IIO_VAL_INT_PLUS_NANO;
> +		case AD9910_CHAN_IDX_PARALLEL_FREQ:
> +			tmp32 =3D FIELD_GET(AD9910_CFR2_FM_GAIN_MSK,
> +					  st->reg[AD9910_REG_CFR2].val32);
> +			tmp64 =3D st->data.sysclk_freq_hz << tmp32;

[Severity: Medium]
Will this 32-bit shift overflow before being assigned to the 64-bit tmp64?

Since sysclk_freq_hz is typically around 1 GHz and tmp32 can be up to 15,
this operation appears to be strictly 32-bit and could wrap around, resulti=
ng
in a corrupted readback.

> +			tmp64 =3D ad9910_rational_scale(tmp64, NANO, BIT_ULL(32));
> +			*val =3D div_s64_rem(tmp64, NANO, val2);
> +			return IIO_VAL_INT_PLUS_NANO;
> +		case AD9910_CHAN_IDX_PARALLEL_POLAR_AMP:

[ ... ]

> +	case IIO_CHAN_INFO_OFFSET:
> +		switch (chan->address) {
> +		case AD9910_CHAN_IDX_PARALLEL_FREQ:
> +			tmp64 =3D (u64)st->reg[AD9910_REG_FTW].val32 * MICRO;
> +			tmp64 >>=3D FIELD_GET(AD9910_CFR2_FM_GAIN_MSK,
> +					    st->reg[AD9910_REG_CFR2].val32);
> +			*val =3D div_s64_rem(tmp64, MICRO, val2);

[Severity: Medium]
Does this operation overflow the signed 32-bit pointer val?

The Frequency Tuning Word (FTW) is an unsigned 32-bit register capable of
holding values up to 4,294,967,295. If the offset exceeds INT_MAX, the
assignment could overflow, leading to a negative value on readback.

> +			return IIO_VAL_INT_PLUS_MICRO;
> +		case AD9910_CHAN_IDX_PARALLEL_POLAR_AMP:

[ ... ]

> @@ -737,12 +848,63 @@ static int ad9910_write_raw(struct iio_dev *indio_d=
ev,
>  	case IIO_CHAN_INFO_SAMP_FREQ:
>  		return ad9910_set_sysclk_freq(st, val, true);
>  	case IIO_CHAN_INFO_SCALE:
> -		if (val !=3D 0 || val2 < 0)
> +		switch (chan->address) {
> +		case AD9910_CHAN_IDX_PHY:
> +			if (val !=3D 0 || val2 < 0)
> +				return -EINVAL;
> +
> +			tmp32 =3D DIV_U64_ROUND_CLOSEST((u64)val2 << 14,
> +						      AD9910_NANO_MILLIAMP_PER_MICROAMP);
> +			return ad9910_set_dac_current(st, tmp32, true);
> +		case AD9910_CHAN_IDX_PARALLEL_FREQ:
> +			if (val < 0 || val2 < 0)
> +				return -EINVAL;
> +
> +			tmp64 =3D ad9910_rational_scale((u64)val * NANO + val2, BIT_ULL(32),
> +						      (u64)st->data.sysclk_freq_hz * NANO);

[Severity: High]
This is a pre-existing issue, but can sysclk_freq_hz be zero here? If the
reference clock returns 0 from clk_get_rate(), the driver initializes
sysclk_freq_hz to 0 without validation.

If sysclk_freq_hz is 0, the denominator passed to ad9910_rational_scale()
is 0:

drivers/iio/frequency/ad9910.c:ad9910_rational_scale() {
    return mul_u64_add_u64_div_u64(input, scale, reference >> 1, reference);
}

This forwards the zero denominator into mul_u64_add_u64_div_u64(), leading
to a kernel panic from division by zero, which is now triggerable from user
space via the newly added parallel frequency scale attribute.

> +			tmp64 =3D roundup_pow_of_two(max(tmp64, 1ULL));

[Severity: Medium]
Will roundup_pow_of_two() truncate the 64-bit tmp64 calculation on 32-bit
architectures?

The roundup_pow_of_two() macro explicitly casts its argument to unsigned
long. On 32-bit systems, this will drop the upper 32 bits, causing the scale
input to be incorrectly configured.

> +			tmp32 =3D min_t(u32, ilog2(tmp64), FIELD_MAX(AD9910_CFR2_FM_GAIN_MSK)=
);
> +			tmp32 =3D FIELD_PREP(AD9910_CFR2_FM_GAIN_MSK, tmp32);
> +			return ad9910_reg32_update(st, AD9910_REG_CFR2,
> +						   AD9910_CFR2_FM_GAIN_MSK,
> +						   tmp32, true);
> +		default:
> +			return -EINVAL;
> +		}
> +	case IIO_CHAN_INFO_OFFSET:
> +		if (val < 0 || val2 < 0)
>  			return -EINVAL;
> =20
> -		tmp32 =3D DIV_U64_ROUND_CLOSEST((u64)val2 << 14,
> -					      AD9910_NANO_MILLIAMP_PER_MICROAMP);
> -		return ad9910_set_dac_current(st, tmp32, true);
> +		switch (chan->address) {
> +		case AD9910_CHAN_IDX_PARALLEL_FREQ:
> +			tmp64 =3D (u64)val * MICRO + val2;

[Severity: Medium]
Is it possible to set the Frequency Tuning Word to its full unsigned 32-bit
range?

The IIO subsystem's parser restricts the val parameter to INT_MAX. This
limitation seems to prevent users from accessing or configuring the upper
half of the device's tuning word range when FM_GAIN is 0.

> +			tmp64 <<=3D FIELD_GET(AD9910_CFR2_FM_GAIN_MSK,
> +					    st->reg[AD9910_REG_CFR2].val32);

[Severity: Medium]
Can this unbounded left shift trigger a 64-bit overflow?

If val is a large value up to INT_MAX, tmp64 can be around 5.63e14. Shifting
this left by an FM_GAIN of 15 would yield a value greater than UINT64_MAX,
which wraps around to a small positive value.

Because the wrapped value is small, it would bypass the subsequent U32_MAX
cap check below, resulting in arbitrary wrapped-around garbage being written
to the hardware.

> +			tmp64 =3D min_t(u64, DIV_U64_ROUND_CLOSEST(tmp64, MICRO),
> +				      U32_MAX);
> +			return ad9910_reg32_write(st, AD9910_REG_FTW, tmp64, true);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618-ad9910-iio=
-driver-v6-0-79125ffbe430@analog.com?part=3D10
