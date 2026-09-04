Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2231E35C1B1
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 14:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788532529; cv=none; b=Thn3jM/4gj+CQKd4C4nB0TYDQ6qd4VAElqxsrVl+WJX8FCkq8StoLtnIULGd9XJtRz/53TfCXn5JU20GqoKpjOy5Isa/DpB6xsEE5vV4OhhV9D4nJhE2K2rXqANT3sy048L1JROQKkx2RZU4KsswQJdojekPnlno6Oudactf62s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788532529; c=relaxed/simple;
	bh=MyUFLTE12qB1qkSxkJneVaianYU9BU8T0X2SaCrqIoc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GLQknbiRjeGmkl8lQRSNobcaP2z2xu5P6OTtEzU7oaDMjQNM0f9k3jtqNMd5YPKMnLl4ZwBlF+W04mx0/LTMBWIrHyxQYr32ZiZu7jglANlzfc4p2hSlJDLJawyJGp0otn1hO1SNx/uZriVUqU+VTno67cLmPDw4lIx+2UrzziA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FOpuulV5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FOpuulV5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661101F00A3D;
	Fri,  4 Sep 2026 14:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788532527;
	bh=IN7S42bnpIlwpFjoHP+m364CJI6oqjpmmVq2n67abhU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FOpuulV5EnnOpKCF6apEig932wxUFzvIw+/yw9YFDp9lBWobgg3jfkaksCV26rNiK
	 7Sc+RovAUiVzyfUrQLOnPltf+4oQTQiDW1QbNDONkMYuZ/GonIE+3XPD37U9bQX0T4
	 guPAECRUACWBK+w64kAb/4UDGXSwz8rDasRAWfu5ANpASsF9PQS1dPfRCkVj91Zlkz
	 K/OD6TL1j/+kpaDKTTN9b5y5X9S3I1cxFdpCO5cAuST1RmlzdQC6ByHqU2FlZGOzBh
	 su46wVE4fTwbVD0K8HixJejDsaiw72n93HQYYUo/jnmsBzHEcPx3R9nnHj0LExmXJE
	 kfWLNy1AWw7sA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 13/17] iio: adc: ad7768: Add calibration controls
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260904-ad7768-driver-v6-13-e4378f946bfb@analog.com>
References: <20260904-ad7768-driver-v6-0-e4378f946bfb@analog.com>
 <20260904-ad7768-driver-v6-13-e4378f946bfb@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 14:35:26 +0000
Message-Id: <20260904143527.661101F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The IIO CALIBBIAS attribute incorrectly handles negative offsets, =
breaking two's complement offset calibration and violating the IIO ABI.
--

commit c96b4e9aa2c8a4f4230f53b26b0c87ecec23865f
Author: Janani Sunil <janani.sunil@analog.com>

iio: adc: ad7768: Add calibration controls

This commit exposes the per-channel offset and gain calibration registers
through the IIO calibbias and calibscale attributes.

> diff --git a/drivers/iio/adc/ad7768.c b/drivers/iio/adc/ad7768.c
> index f2c762688fb39..802666f7abd45 100644
> --- a/drivers/iio/adc/ad7768.c
> +++ b/drivers/iio/adc/ad7768.c

[ ... ]

> @@ -798,6 +865,7 @@ static int ad7768_read_raw(struct iio_dev *indio_dev,
>  			   int *val, int *val2, long info)
>  {
>  	struct ad7768_state *st =3D iio_priv(indio_dev);

[ ... ]

> +	case IIO_CHAN_INFO_CALIBBIAS:
> +	case IIO_CHAN_INFO_CALIBSCALE: {
> +		bool is_gain =3D info =3D=3D IIO_CHAN_INFO_CALIBSCALE;
> +		unsigned int base_reg;
> +		unsigned int calib;
> +
> +		base_reg =3D ad7768_get_calib_reg_base(st, chan, is_gain);
> +		ret =3D ad7768_read_calib_value(st, base_reg, &calib);
> +		if (ret)
> +			return ret;
> +
> +		*val =3D calib;

[Severity: High]
Does this assignment correctly handle negative two's complement offsets?

Since calib is an unsigned integer populated from a 24-bit register, reading
a negative offset directly assigns it without sign extension. Will this cau=
se
userspace to see massive positive integers (e.g., 0xFFFFFF) instead of the
actual negative offset, violating the IIO ABI?

> +		return IIO_VAL_INT;
> +	}
>  	default:
>  		return -EINVAL;
>  	}

[ ... ]

> @@ -816,24 +899,45 @@ static int ad7768_read_raw(struct iio_dev *indio_de=
v,
>  static int ad7768_write_raw(struct iio_dev *indio_dev,
>  			    struct iio_chan_spec const *chan,
>  			    int val, int val2, long info)
>  {

[ ... ]

> -	if (info =3D=3D IIO_CHAN_INFO_SAMP_FREQ)
> +	switch (info) {
> +	case IIO_CHAN_INFO_SAMP_FREQ:
>  		return ad7768_set_sampling_freq(indio_dev, val, chan->channel);
> +	case IIO_CHAN_INFO_CALIBBIAS:
> +		if (val < 0 || val > AD7768_CALIB_REG_MSK)
> +			return -EINVAL;

[Severity: High]
Is it expected to explicitly block negative values for the calibration bias?

By returning -EINVAL when val < 0, this rejects valid negative integer
offsets that users or auto-calibration scripts might attempt to write. Shou=
ld
negative values be converted to their 24-bit two's complement representation
instead of being rejected?

>=20
> -	return -EINVAL;
> +		base_reg =3D ad7768_get_calib_reg_base(st, chan, false);
> +		return ad7768_write_calib_value(st, base_reg, val);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-ad7768-dri=
ver-v6-0-e4378f946bfb@analog.com?part=3D13
