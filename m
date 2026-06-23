Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2765D34404A
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782213188; cv=none; b=fs/O7h/qzpjlNm/rDLvCiY1zLdrBzW0Xx2AaF3NTOpE8kDxL8v+FLVtzu9qeIJDQBW1rjEPb8Yrt2ZOY/ANcXZjYHho4506uZK2qllchX+wgBuLF5FEtTagMZNGBYiggzjdEQyyZf+mrjrEjl98T3c8cJA9MjwcdQ1XGxThh5cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782213188; c=relaxed/simple;
	bh=7vI8Xzhxk55d22MT/kHNZaW9qsXPNs5U2g5Jsfu7lfY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EURi5wj4yKwyjoR/jEdTzZVmUAs2W/8KJBo5lzjK7NCfOkFhKpmOOg+U11+l16MzZ0f0CcA8YeIhWhTPHaOo8sdN/cvtldTgz4IzM3CGfMPPxowY+xpGmSW8ee8r+PEn0e69jFMAfHFRwafOSRO8LkI0/P6PKfaCdk4hIFvvzjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UO/cSUO2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UO/cSUO2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC2AA1F000E9;
	Tue, 23 Jun 2026 11:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782213186;
	bh=ziem1jLMY+Fv7rt3l7+jYnprjTLOVCtw9FudhXfwy00=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UO/cSUO2R+pLOWefGH78MeuoPJ8qcO8TAA9uSNDkno8mF5ic1pGaWGhgS0SF1IX+/
	 mXHPPm0rW9w8dgAIkBZcaYgoFRGv7jrxPsUUy5F0KmA/d+gZPhRNhHrqcAvYvVzjSu
	 LeDDpZ/XXufaHJJ/m0ffznPAt6FyVMEEf8e3NGnVxdkO9MFLB7D3p562XxPDSKkdDA
	 LsesbYeCCq/mLUUIR4C6sF3WnigooSk8yay7nPYyeHTS3bXEgrUh7YIkpyV/LWgiXO
	 Kt5gq0CMLtkGMHgA7RVpQxUX49mlComBsbyCJpmUXZJCPqApaso8pC0RK2d9Vc8Tac
	 4Bcv8A7hHQAkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 12/12] iio: dac: ad5686: add gain control support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260623-ad5686-new-features-v4-12-28962a57db0f@analog.com>
References: <20260623-ad5686-new-features-v4-0-28962a57db0f@analog.com>
 <20260623-ad5686-new-features-v4-12-28962a57db0f@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 11:13:04 +0000
Message-Id: <20260623111304.EC2AA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Data race in `ad5686_read_avail()` due to lockless access of `st=
->double_scale`, which is temporarily mutated in `ad5686_write_raw()`.
--

commit 7b5b8c7fbbe74efe7dd9f093ff8593661667e614
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: dac: ad5686: add gain control support

Adds gain control support to the ad5686 driver, allowing a 2x multiplier
to be applied to the output voltage either via a dedicated GAIN pin or
a control register bit field. It exposes available scales to userspace
and adds tracking of the double scale state.

> diff --git a/drivers/iio/dac/ad5686.c b/drivers/iio/dac/ad5686.c
> index 4dc681eb077d6..bad214b89257f 100644
> --- a/drivers/iio/dac/ad5686.c
> +++ b/drivers/iio/dac/ad5686.c
[ ... ]
> @@ -217,6 +229,84 @@ static int ad5686_write_raw(struct iio_dev *indio_de=
v,
> =20
>  		return ad5686_write(st, AD5686_CMD_WRITE_INPUT_N_UPDATE_N,
>  				    chan->address, val << chan->scan_type.shift);
> +	case IIO_CHAN_INFO_SCALE:
> +		if (val =3D=3D st->scale_avail[0] && val2 =3D=3D st->scale_avail[1])
> +			double_scale =3D false;
> +		else if (val =3D=3D st->scale_avail[2] && val2 =3D=3D st->scale_avail[=
3])
> +			double_scale =3D true;
> +		else
> +			return -EINVAL;
> +
> +		if (st->double_scale =3D=3D double_scale)
> +			return 0; /* no change */
> +
> +		st->double_scale =3D double_scale;
> +		switch (st->chip_info->regmap_type) {
> +		case AD5310_REGMAP:
> +			ret =3D ad5310_control_sync(st);
> +			break;
> +		case AD5683_REGMAP:
> +			ret =3D ad5683_control_sync(st);
> +			break;
> +		case AD5686_REGMAP:
> +			if (!st->gain_gpio) {
> +				ret =3D -EINVAL;
> +				break;
> +			}
> +
> +			ret =3D gpiod_set_value_cansleep(st->gain_gpio,
> +						       st->double_scale ? 1 : 0);
> +			break;
> +		default:
> +			ret =3D -EINVAL;
> +		}
> +		if (ret)
> +			st->double_scale =3D !double_scale; /* revert on failure */
> +		return ret;
[ ... ]
> +static int ad5686_read_avail(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan,
> +			     const int **vals, int *type, int *length,
> +			     long mask)
> +{
> +	struct ad5686_state *st =3D iio_priv(indio_dev);
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_SCALE:
> +		*type =3D IIO_VAL_INT_PLUS_NANO;
> +
> +		if (st->chip_info->regmap_type =3D=3D AD5686_REGMAP && !st->gain_gpio)=
 {
> +			/*
> +			 * GAIN pin is board-strapped, so only the current
> +			 * scale is available.
> +			 */
> +			*vals =3D st->double_scale ? &st->scale_avail[2] :
> +						   &st->scale_avail[0];

[Severity: Medium]
Is there a potential data race on st->double_scale here?

In ad5686_write_raw(), st->double_scale is temporarily modified and then
reverted on failure under st->lock. However, ad5686_read_avail() accesses
st->double_scale without holding st->lock.

If a sysfs read on in_voltage_scale_available happens concurrently with a
failing sysfs write on in_voltage_scale for a board-strapped device, could
the read observe the temporary invalid state of st->double_scale before
it is reverted and returned to userspace?

> +			*length =3D 2;
> +			return IIO_AVAIL_LIST;
> +		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623-ad5686-new=
-features-v4-0-28962a57db0f@analog.com?part=3D12
