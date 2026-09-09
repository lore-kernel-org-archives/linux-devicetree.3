Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB34455630
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 08:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788943192; cv=none; b=L0TbE0I5r8RZNdIWAfXUytj8A01CiO+3BJyLf9vPlsdnSxh08GnNIRT3SsljnjptaFHYd7DwuGVhveeq21lxXA9GzqZUuXCeSHG/EW/E6+yqtyI1EtjPhijTmB25PJ8XC2oedWQ/2qSIHQzfmYTce0FmrwbS0h1KDy9UMIB5BfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788943192; c=relaxed/simple;
	bh=F0Dcwa1rX9yvV5UxrUE05zRD3JuK/OWO0/v94o9BP2g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ctj7k1cT/DWbg/jKHor4SuYKGB1gvZQmQuecUMl2KHI5XuLQVyPFZjtPotqqZspyadc3uL/Gv4+JPgF1vNKsrSUIz8oob2X3V9AiiYqrvD/lbFSOHwjKgtl024lBXjWOqcixCQBFS4YjrY8Orii7wFSa52HveutUej2eTSe+g1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Co8P3tWy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Co8P3tWy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 316F11F00A3A;
	Wed,  9 Sep 2026 08:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788943190;
	bh=y/j8xyvbbfrEhZNTG3wKsOe0YtHs9AWlV90li3cDV4w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Co8P3tWyk62s2eFd0jPrr5qbOXI6HSQ1gCUJtwQ4DR9vb/UBiHx1D7olgsmU6apXg
	 otq9Qf1z+7HEYlAlDsuvA9Fjt7WV9nBjg2JDiOv06c/vhTRQ6HX7tIvdYEiD3X03d3
	 Bo5+3LIF62Br9LSslnwnHD0L6y0esHCvHr7rZlY2linE7m1JdNO8COawXFLdowbEOy
	 H9JdGah6w47nK3+9JCCur7TgOpKDGXixVVW2lVP/JXwJWPCEbvSuMD+YyaaNHFDox4
	 YxtXY/Dlc+KoFSlRgpeHp452T+ozB22JWrn4uha4EP8kz3sIkDGjxbtXpbSYAIBset
	 kdeqjOFkvg4aw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] iio: adc: ltc2497: add LTC2499 internal
 temperature channel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrei Stancovici" <andrei.stancovici@analog.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260909082755.366269-3-andrei.stancovici@analog.com>
References: <20260909082755.366269-1-andrei.stancovici@analog.com>
 <20260909082755.366269-3-andrei.stancovici@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 08:39:49 +0000
Message-Id: <20260909083950.316F11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The IIO_TEMP channel scale and offset calculations omit the ADC re=
solution divisor, causing temperature readings to be incorrect by a factor =
of over 16 million.
--

commit 675eebaaf0b1a3975b7d05ae2a5dc9c63db82edc
Author: Andrei Stancovici <andrei.stancovici@analog.com>

iio: adc: ltc2497: add LTC2499 internal temperature channel
   =20
The LTC2499 includes an internal temperature sensor.  Expose it as an
IIO_TEMP channel with raw, scale and offset.

Datasheet: https://www.analog.com/media/en/technical-documentation/data-she=
ets/2499fe.pdf

> diff --git a/drivers/iio/adc/ltc2497-core.c b/drivers/iio/adc/ltc2497-cor=
e.c
> index 2dc5c70442694..6df9c72bd8cf4 100644
> --- a/drivers/iio/adc/ltc2497-core.c
> +++ b/drivers/iio/adc/ltc2497-core.c
[ ... ]
> @@ -95,10 +97,45 @@ static int ltc2497core_read_raw(struct iio_dev *indio=
_dev,
>  		if (ret < 0)
>  			return ret;
> =20
> -		*val =3D ret / 1000;
> -		*val2 =3D ddata->chip_info->resolution + 1;
> -
> -		return IIO_VAL_FRACTIONAL_LOG2;
> +		switch (chan->type) {
> +		case IIO_TEMP:
> +			/*
> +			 * raw is normalised to 2^(resolution + 1), i.e.
> +			 * raw =3D 2 * DATAOUT24, so the PTAT scale (datasheet
> +			 * Vref / 1570 per Kelvin) doubles its denominator and,
> +			 * in m=C2=B0C, becomes Vref_uV / 3140000.
> +			 */
> +			*val =3D ret;
> +			*val2 =3D 3140000;
> +			return IIO_VAL_FRACTIONAL;

[Severity: High]
Does this scale calculation in ltc2497core_read_raw() omit the necessary
division by the ADC resolution (2^25)?

Without the resolution divisor, the temperature readings could be incorrect=
 by
a factor of over 16 million when a userspace application reads the sysfs
attributes and applies the standard IIO formula (raw + offset) * scale.

> +		case IIO_VOLTAGE:
> +			*val =3D ret / (MICRO / MILLI);
> +			*val2 =3D ddata->chip_info->resolution + 1;
> +			return IIO_VAL_FRACTIONAL_LOG2;
> +		default:
> +			return -EINVAL;
> +		}
> +
> +	case IIO_CHAN_INFO_OFFSET:
> +		switch (chan->type) {
> +		case IIO_TEMP:
> +			ret =3D regulator_get_voltage(ddata->ref);
> +			if (ret < 0)
> +				return ret;
> +			if (ret =3D=3D 0)
> +				return -EINVAL;
> +			/*
> +			 * 0 =C2=B0C =3D=3D 273.15 K must map to raw + offset such that
> +			 * (raw + offset) * scale =3D=3D 0 m=C2=B0C, i.e.
> +			 *   offset =3D -273150 / scale
> +			 *          =3D -273150 * 3140000 / Vref_uV
> +			 * Computed in 64-bit to avoid overflow.
> +			 */
> +			*val =3D div_s64(ABSOLUTE_ZERO_MILLICELSIUS * 3140000LL, ret);

[Severity: High]
Since this offset in ltc2497core_read_raw() is calculated based on the
potentially broken scale from above, will this result in an offset that can=
not
correct for the missing resolution divisor?

> +			return IIO_VAL_INT;
> +		default:
> +			return -EINVAL;
> +		}
> =20
>  	default:
>  		return -EINVAL;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909082755.3662=
69-1-andrei.stancovici@analog.com?part=3D2
