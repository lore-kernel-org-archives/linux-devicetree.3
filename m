Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F7E3F4835
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 10:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781001433; cv=none; b=nKYQkvw9O2Dkr+QFp0rWKYMB7YA+10972QYZkzMCpWJuSPLSZtIeAN8k0vDkf3qbzt+d+G9QTfieuFmYK6aAssV0cx8N/mFKTEua9S1brJ3DsgzpMbLGa7Ad1vFKIwU9NW4G9g+uuiV474CbpJDmDyU0PkzmCokN91jmWmIuFfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781001433; c=relaxed/simple;
	bh=B2BLgWZjVBRlfduYM1FRQ/mif+V7M+B3Z8snrAfXEIs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K27F0zvpoFLDIUbPxFqqE81s/2AtfgFewL0O9YdvqyxoJKRCJDeDZcRYPS1hjLQPssGWXnQR+L/Upbw0zWWjLUrvH2I7TWlqzktMWFDfuBUXZLhSxRWgOX9SHCOvd7hZ9QJs/M81jlWJO8sEdSpLzml1qMJdVB5GdJV8noN//i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RIWxWnzV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RIWxWnzV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB2831F00893;
	Tue,  9 Jun 2026 10:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781001432;
	bh=BsE/kxptdV5ttOPWKkabuRvAvZtnRHV/XfVn2blDghA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RIWxWnzVFHTJJvXRL9KM3FajxuIwHKrVkgABuL+Jdvctre5gPR97jNCOsK9ujpSoT
	 CJiJIOqGHyGlEkW9L1Wn1DUoZHcCDetIjmeq2hPsCjwDsvHViFKExxM+aRVzsMuDuA
	 yQmcsBVZm53npO9qBWMicHCPSCq2NkAuACbcTaOd/0Iad3j86XTAZ2JyK3HGUUQPBl
	 1G0WO6YAe4rnW0YTtlKh/DQy8PTfT5TAB5vysMHmgJPPpOuPNg4m5FRweVjX4PJSSx
	 mJeIaH0Qy8uNCHYkx4Kd3YHK7JX8L6ciQ9vXVC3k58pYdX6ZHctWjMCOVVcwaKeRhl
	 tm4ck3lAmqwVA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 12/12] iio: dac: ad5686: add gain control support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260609-ad5686-new-features-v2-12-70b423f5c76d@analog.com>
References: <20260609-ad5686-new-features-v2-12-70b423f5c76d@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 10:37:10 +0000
Message-Id: <20260609103711.AB2831F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] ABI Violation: Exposing a writable sysfs attribute to fix a stat=
ic hardware configuration.
- [Medium] State Inconsistency: `st->double_scale` is not rolled back if ha=
rdware synchronization fails.
- [Low] Data Race: Lockless read of `st->double_scale` can race with concur=
rent writes.
--

commit 7fefd2fd08838a6ee5a81a3a819607e02af9d85d
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: dac: ad5686: add gain control support

This commit adds support for a 2x gain multiplier applied to the output
voltage. This provides a gain control through a bit field in the control
register or a dedicated GAIN pin, exposing the scale property as configurab=
le.

> diff --git a/drivers/iio/dac/ad5686.c b/drivers/iio/dac/ad5686.c
> index d9022c6a32016..d49390af71f90 100644
> --- a/drivers/iio/dac/ad5686.c
> +++ b/drivers/iio/dac/ad5686.c

[ ... ]

> @@ -192,9 +196,14 @@ static int ad5686_read_raw(struct iio_dev *indio_dev,
>  			GENMASK(chan->scan_type.realbits - 1, 0);
>  		return IIO_VAL_INT;
>  	case IIO_CHAN_INFO_SCALE:
> -		*val =3D st->vref_mv;
> -		*val2 =3D chan->scan_type.realbits;
> -		return IIO_VAL_FRACTIONAL_LOG2;
> +		if (st->double_scale) {
> +			*val =3D st->scale_avail[2];
> +			*val2 =3D st->scale_avail[3];
> +		} else {
> +			*val =3D st->scale_avail[0];
> +			*val2 =3D st->scale_avail[1];
> +		}
> +		return IIO_VAL_INT_PLUS_NANO;

[Severity: Low]
Is it possible for a data race to occur here?

In ad5686_read_raw(), the mutable software state st->double_scale is read
to determine the returned scale values without holding the st->lock mutex.

Because st->double_scale can be concurrently modified by ad5686_write_raw()
(which properly acquires st->lock), this can lead to reading a prematurely
updated state before the hardware configuration has actually completed.

>  	}
>  	return -EINVAL;
>  }

[ ... ]

> @@ -216,6 +225,63 @@ static int ad5686_write_raw(struct iio_dev *indio_de=
v,
> =20
>  		return ad5686_write(st, AD5686_CMD_WRITE_INPUT_N_UPDATE_N,
>  				    chan->address, val << chan->scan_type.shift);
> +	case IIO_CHAN_INFO_SCALE:
> +		if (val =3D=3D st->scale_avail[0] && val2 =3D=3D st->scale_avail[1])
> +			st->double_scale =3D false;
> +		else if (val =3D=3D st->scale_avail[2] && val2 =3D=3D st->scale_avail[=
3])
> +			st->double_scale =3D true;
> +		else
> +			return -EINVAL;
> +
> +		switch (st->chip_info->regmap_type) {
> +		case AD5310_REGMAP:
> +			return ad5310_control_sync(st);
> +		case AD5683_REGMAP:
> +			return ad5683_control_sync(st);

[Severity: Medium]
Should st->double_scale be restored to its previous value if the hardware
synchronization fails?

In ad5686_write_raw(), st->double_scale is updated before the driver attemp=
ts
to push the change to the DAC via ad5310_control_sync(st) or
ad5683_control_sync(st).=20

If the underlying SPI/I2C write fails, the function immediately returns the
error code without rolling back st->double_scale.

This could cause the driver's cached state to diverge from the actual
hardware configuration, causing future reads of the scale to return the
incorrect updated value.

> +		case AD5686_REGMAP:
> +			/*
> +			 * Even if the gain pin is hardwired on the board, the
> +			 * user is able to control the scale such that it
> +			 * matches the actual gain setting.
> +			 */
> +			gpiod_set_value_cansleep(st->gain_gpio,
> +						 st->double_scale ? 1 : 0);
> +			return 0;

[Severity: Medium]
Does this expose a writable sysfs attribute to fix a static hardware
configuration?

The commit introduces a writable scale sysfs attribute to allow users to ma=
nually
match the software scale to a hardwired gain pin. Static hardware properties
should typically be described via firmware properties (e.g., Device Tree) so
the driver can expose the correct, immutable scale at initialization.

If the GAIN GPIO is absent, writing to the scale attribute returns success =
but
does not change the physical hardware state, leading to a silent desynchron=
ization
between the reported scale and the actual physical DAC output.

Could this mislead generic IIO clients by presenting multiple available sca=
les
that they believe they can dynamically toggle?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-ad5686-new=
-features-v2-0-70b423f5c76d@analog.com?part=3D12
