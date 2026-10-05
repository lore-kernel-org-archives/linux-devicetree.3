Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DCF23D7E3
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 00:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791161476; cv=none; b=ar9PCYZJa0SPtpvUQaOgLxLYn0y9xr3AB22R5IMEaM7jYAKJGGStsboSxW5sPW7MrQFKEoXigwqX19e+Yp/4uI7UYrvz6KPRDj85F5RQ41Q2lvXzGqMaCCDrTS/Q8L8z5fnNYLtvxa1LKLxVndhx6dDKhbsfTxbo+fMELcsdt0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791161476; c=relaxed/simple;
	bh=ht2t0kmTXlePQ8I6ndsjKSo6EfG0YJfvql7JkFoBniQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ncBMyTnmcfCp0AGdE67AYefnW/0gluuhvc1L5d6MJZwjXLdPlf8Ij90kOHAkELw4BKdihnzUYNjXTGlu9Htuqy5pKjRsy75cuMBv9CI8jG4h7S0YwsU7IKXG5hd+MBfrfutAwICPsHnJpbaNJ9z/RnCFR5rvS5cC6ADE/SFuN48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQENbEXc; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQENbEXc"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-98a903b7e1dso641266241.0
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 17:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791161472; x=1791766272; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a7isb0xGzjL6lMG99IXwS6EH+P9csPknCI8tVz+3n8M=;
        b=TQENbEXcuils9AJC80GLY8jl7CHlpWgQBf0qfh70AiuHF2/oZlfy9qEGl8IPhBsGDj
         jc3vzdyBV4kmKk4T0vPLWasvzF6w1TrIokyafmuEXIcBBgeqe/3Y6X8Fzj6qnoPNmNAU
         6E9tlG+AZGnWobBs1oP1tm5LU28ZgiJ1WlVI330dsyZ2QJrENoFShfbmvVb+Xatf5AEa
         AC35mu5jlxEtUcgivcwt15MImXt3Ej1pUhzxXU9tDtpnTJNfUao41neI8Yhtg32pYdQT
         aRp0xunL7UP0zx98+Ft1MLtlExgwDiSzG2EqG7hMuSwlQwPF2JnQ2Pi+YYT3g3kXxMol
         KLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791161472; x=1791766272;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a7isb0xGzjL6lMG99IXwS6EH+P9csPknCI8tVz+3n8M=;
        b=o+dumBY3TWfuyUyyrAhfKCoAnq4JVPtn72tX8O8I8qnOiAddqnmlvOlZUgdmj2SYgB
         IyJpJtLLaME4yX8Tu6K+zXmip38RRARnIHJ0OT/BwsWLLa90GlKbsZB+aiD9xf9qSwng
         PVZhNZ4iUwz57yCQUlZRFq7b0BuSnSF9a4BzssVJUBlw4a6ky9nk4rInJgxTe5iOSu01
         eM737tSgdp6EyHWexA6oFdJR1RVfXd1Dtn6W+7sEHz77JS39fl0SnI7FnoqZAs8GRbyQ
         uH3d/1uobN749XGiDPw6mV8YzxoOhTF90PGL2L21F2YSkfusXEWOo5lHGikx2QPZrfLF
         qXIQ==
X-Forwarded-Encrypted: i=1; AKwUvBygqkvMI0cWa5HY/O42rPJmKXwmkmP9CfrhqiNL4xpmOtqeIUYy9Cm2L4LCsfOm+EvXk8Vc//9Y8cvd@vger.kernel.org
X-Gm-Message-State: AFq9FYInt4sGYjBTz/Mjid2vlzBSP7VWXthlMU4rEoZiZpq3uIlu1yyC
	8lILdJkB6xFVA+iUwaGQHrRhafRVLuvvnE3ZmehEsv4pmSFV7XSswqCy
X-Gm-Gg: AYBFou1BRR4guwqf4DWgo+OL34rRP9oSJ//WIBw7nQEqG1rt6aMkMCTA4VXgN0vLndW
	4Z4wzbIyGfm3J0I7Vmmvp0KEOjzKHL5w5K9866cDkO2xUolpg6iP4onuf5MIKJ8agR9f6GMKB52
	NEmKh650ierm3U9l6G/KqAnQBmpbWCAUaWHnQ4o9VJFNPsDnMIX4cKcpjTmMt7YtFSpeF4qyNcs
	7zEPqYQHYgGQzYH7UfzPJkPTts3KyRp3sflQITJr8V4rI2C9IXveMYRJRYnZSU4mz8TOGlnkb2l
	GJ7HBCHhGk9W2UdXQEBtAZSa3p+qvEH2iP3pNuMZY1FkfGy2AOlA/uLuU2UM22O7qGk5TF3pQjB
	wMBilNfTnBXY9dNILNDukj2J3/xdSXzq2VnQJ2TAGoJqyX8e81JbxjEtOPt0pAyEQpWEqENSvEI
	3Bos1zM4P6sQ++48df5OYuoapKemIDf/7tSzA9xbM+l5ZNhiWLPAJ/Sgdpx5xWnSvxjlBJEKNH1
	1O7
X-Received: by 2002:a05:6102:8603:10b0:784:a925:3f0c with SMTP id ada2fe7eead31-7bf7df582c6mr2147719137.0.1791161471650;
        Sun, 04 Oct 2026 17:51:11 -0700 (PDT)
Received: from localhost ([2804:30c:96c:bf00:7844:c38c:894:4054])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98c7031853asm2042611241.12.2026.10.04.17.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 17:51:09 -0700 (PDT)
Date: Sun, 4 Oct 2026 21:51:24 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Kanak Shilledar <kanak.shilledar@axis.com>
Cc: Henrik Grimler <henrik.grimler@axis.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>, kernel@axis.com,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 6/6] iio: imu: inv_icm42607: Add accelerometer
 calibbias support
Message-ID: <asL0jC7Qa8YQP0fy@debian-BULLSEYE-live-builder-AMD64>
References: <20261002-b4-inv_icm42370p-v5-0-c65281b745c9@axis.com>
 <20261002-b4-inv_icm42370p-v5-6-c65281b745c9@axis.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261002-b4-inv_icm42370p-v5-6-c65281b745c9@axis.com>

On 10/02, Kanak Shilledar wrote:
> Expose IIO_CHAN_INFO_CALIBBIAS on the accelerometer channels. The
> registers are stored in MREG1. The calibration bias is written to
> OFFSET_USER4 to OFFSET_USER8 registers in MREG1. Reject the out of
> limit calibbias values instead of clamping it.
> 
> Note: The accelerometer functionality is tested with Invensense,
> ICM42370-P development board.
Good to know, but this should probably go below the '---'. Not within the commit
message.

> 
> Datasheet: https://www.invensense.tdk.com/en-us/products/3-axis/icm-42370-p
> Datasheet: https://www.lcsc.com/product-detail/C5129967.html
> Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>
> ---
Here

>  drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c | 194 +++++++++++++++++++++-
>  1 file changed, 192 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c b/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c
> index 9a3ace3e7fcf9..98cef0058b64c 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c
> @@ -13,6 +13,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/types.h>
> +#include <linux/units.h>
>  
...
> +	/* 12 bits signed value */
> +	switch (chan->channel2) {
> +	case IIO_MOD_X:
> +	case IIO_MOD_Z:
> +		offset = sign_extend32(((lo_val & 0xF0) << 4) | hi_val, 11);
> +		break;
> +	case IIO_MOD_Y:
> +		offset = sign_extend32(((hi_val & 0x0F) << 8) | lo_val, 11);
Can the mask and shifting be done with some combination of FIELD_PREP/_GET/_MODIFY?
See comment below.

...
> +static int inv_icm42607_accel_write_offset(struct iio_dev *indio_dev,
> +					   struct iio_chan_spec const *chan,
> +					   int val, int val2)
> +{
> +	struct inv_icm42607_state *st = iio_device_get_drvdata(indio_dev);
> +	struct device *dev = regmap_get_device(st->map);
> +	s32 min, max;
> +	s16 offset;
> +	s64 val64;
> +	int ret;
> +
> +	if (chan->type != IIO_ACCEL)
> +		return -EINVAL;
> +
> +	/* inv_icm42607_accel_calibbias: min - step - max in micro */
> +	min = inv_icm42607_accel_calibbias[0] * (long)MEGA -
> +	      inv_icm42607_accel_calibbias[1];
> +	max = inv_icm42607_accel_calibbias[4] * (long)MEGA +
> +	      inv_icm42607_accel_calibbias[5];
> +
> +	val64 = val * (s64)MEGA;
> +	if (val >= 0)
> +		val64 += val2;
> +	else
> +		val64 -= val2;
> +
> +	if (val64 < min || val64 > max)
> +		return -EINVAL;
> +
> +	/*
> +	 * Convert m/s² to g then to raw value
> +	 * m/s² to g: 1 / 9.806650
> +	 * g to raw 12 bits signed, step 0.5mg: 10000 / 5
> +	 * val in micro (1000000)
> +	 * val * 10000 / (9.806650 * 1000000 * 5)
> +	 */
> +	val64 *= 10000LL;
> +
> +	/* For rounding, add + or - divisor (9806650 * 5) divided by 2 */
> +	if (val64 >= 0)
> +		val64 += 9806650 * 5 / 2;
> +	else
> +		val64 -= 9806650 * 5 / 2;
> +	offset = div_s64(val64, 9806650 * 5);
> +
> +	/* Value is limited to 12 bits signed, return -EINVAL if out of range */
> +	if (offset < -2048 || offset > 2047)
> +		return -EINVAL;
> +
> +	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dev, pm);
> +	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	switch (chan->channel2) {
> +	case IIO_MOD_X:
> +		/* OFFSET_USER4 upper nibble is shared. */
> +		ret = regmap_update_bits(st->map, INV_ICM42607_REG_OFFSET_USER4,
> +					 GENMASK(7, 4), (offset & 0xF00) >> 4);
> +		if (ret)
> +			return ret;
> +
> +		return regmap_write(st->map, INV_ICM42607_REG_OFFSET_USER5,
> +				    offset & 0xFF);
> +	case IIO_MOD_Y:
> +		/* OFFSET_USER7 lower nibble is shared. */
> +		ret = regmap_update_bits(st->map, INV_ICM42607_REG_OFFSET_USER7,
> +					 GENMASK(3, 0), (offset & 0xF00) >> 8);
> +		if (ret)
> +			return ret;
> +
> +		return regmap_write(st->map, INV_ICM42607_REG_OFFSET_USER6,
> +				    offset & 0xFF);
> +	case IIO_MOD_Z:
> +		/* OFFSET_USER7 upper nibble is shared. */
> +		ret = regmap_update_bits(st->map, INV_ICM42607_REG_OFFSET_USER7,
> +					 GENMASK(7, 4), (offset & 0xF00) >> 4);
I see the register map for this chip is a bit odd. The above bit masking and
shifting can be easy to write once one is familiar with the part being
supported. Though, this really looks like one of the cases where we can declare
a bitmask and use FIELD_PREP (or even FIELD_MODIFY). Maybe something like
INV_ICM42607_REG_OFFSET_HIGH	GENMASK(7, 4)
INV_ICM42607_REG_OFFSET_LOW	GENMASK(3, 0)

INV_ICM42607_ACCEL_OFFSET_HB	GENMASK(15, 8)
INV_ICM42607_ACCEL_OFFSET_LB	GENMASK(7, 0)

reg_val = FIELD_PREP(INV_ICM42607_REG_OFFSET_HIGH,
		     FIELD_GET(INV_ICM42607_ACCEL_OFFSET_HB, offset));

Please, also take this suggestion to the other similar mask and shifting above.

> +		if (ret)
> +			return ret;
> +
> +		return regmap_write(st->map, INV_ICM42607_REG_OFFSET_USER8,
> +				    offset & 0xFF);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
...
> @@ -266,6 +454,8 @@ static int inv_icm42607_accel_write_raw_get_fmt(struct iio_dev *indio_dev,
>  		return IIO_VAL_INT_PLUS_NANO;
>  	case IIO_CHAN_INFO_SAMP_FREQ:
>  		return IIO_VAL_INT_PLUS_MICRO;
> +	case IIO_CHAN_INFO_CALIBBIAS:
Minor neat, if we move the line above up one line we can drop the line below.
> +		return IIO_VAL_INT_PLUS_MICRO;
>  	default:
>  		return -EINVAL;
>  	}
