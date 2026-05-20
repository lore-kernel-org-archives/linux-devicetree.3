Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B70B3A254E
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 22:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779314421; cv=none; b=ElUezH7PveNteHvbjhjMReI05WgL8Tw5ubW12GsLc5OXo0gXaUPZsIL12bvU937ksaMqusd19wwSfFaIucwUu1SysxBc5aK0kgjWRGcf/gxeR4b6c6+aHdDf8zwmxuB2RNRY8xlKvIeG8Nmw6foF1thhQom232maoRMgwRvowrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779314421; c=relaxed/simple;
	bh=99c7CQKboq7587BoJguFBCWTq38xxH+86eYrvp6T0y0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m6/GO9r/do3aIMzGUcTjUWUtpD6ZUtJIYB8OXC1kX4IO+O4W8ykbfjbMqhyM/uGZilcUr7kf8ysKpbGjDrcuvUK9XA9eF53/WJF+oFoIXQvRKrukFLYj8SfGXNt4j6klpK3aPWCu5FfPkqkdlY2HDqBevUN1SYRe2fo2DIQBq68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o1nToCXU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o1nToCXU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 422D51F000E9;
	Wed, 20 May 2026 22:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779314417;
	bh=BP7FIfKpp9T5L6OlF430htJp9NtcSypwqTnvYnAARSQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=o1nToCXUiSGwa5lMo3Ti7b584nKfvKMcHzhkmYxKmIe7YfHw0nafyQDd1bMZntdtg
	 PseXuokvma+QC2k01ru+AFiJc+aUUIfRgutFD0BPADmOLJHNvx/ZbVAG0ePj7GzUDe
	 M+7j7t9FPYnUQ8BYh3LM7AyVxnlHyDtXoyEg7KuPTv3KtAa/XK12Y1ozKMDdfRRCcA
	 vyuPfN0/b9FRTL5FOcL/6ka9NUL9pVnJcvRXQnLxtw6WDxg0eaa4/5P13WWJDJF3m+
	 Y9gagzHtREjPnQ0xE+lTU5HLI2W24V+u9y99DH7MjV5/xKvYXtazG2kU5cbUeH2SWL
	 QUcnenoTI8Pdg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] iio: light: veml3328: add support for new device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Crofts" <joshua.crofts1@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260520-veml3328-v2-2-a57f0d9e28d4@gmail.com>
References: <20260520-veml3328-v2-2-a57f0d9e28d4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 22:00:16 +0000
Message-Id: <20260520220017.422D51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Signed 32-bit integer overflow in the lux scale calculation due to=
 large multiplication.
- [Medium] Inconsistent handling of the IIO_LIGHT channel scale across read=
, write, and available attributes breaks the IIO ABI.
- [Medium] The scale attribute for IIO_INTENSITY channels incorrectly retur=
ns the hardware gain multiplier instead of the true IIO scale factor.
--

commit 9edb449d4e1325159429ae7e39210b37d222a175
Author: Joshua Crofts <joshua.crofts1@gmail.com>

iio: light: veml3328: add support for new device

Add support for the Vishay VEML3328 RGB/IR light sensor communicating
via I2C (SMBus compatible).

> diff --git a/drivers/iio/light/veml3328.c b/drivers/iio/light/veml3328.c
> new file mode 100644
> index 0000000000000..fdfa8fd1666b6
> --- /dev/null
> +++ b/drivers/iio/light/veml3328.c

[ ... ]

> +static const struct iio_chan_spec veml3328_channels[] =3D {
> +	{
> +		.type =3D IIO_LIGHT,
> +
> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |
> +				      BIT(IIO_CHAN_INFO_SCALE),
> +		.info_mask_shared_by_all =3D BIT(IIO_CHAN_INFO_INT_TIME),
> +		.address =3D VEML3328_REG_DATA_G,
> +	},

[Severity: Medium]
Is the in_illuminance_scale_available sysfs attribute missing here because
info_mask_shared_by_all_available does not include the scale bit for the
IIO_LIGHT channel?

[ ... ]

> +static int veml3328_read_raw(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan,
> +			     int *val, int *val2, long mask)
> +{

[ ... ]

> +	case IIO_CHAN_INFO_SCALE:
> +		ret =3D regmap_read(regmap, VEML3328_REG_CONF, &reg_val);
> +		if (ret)
> +			return ret;
> +
> +		if (chan->type =3D=3D IIO_LIGHT) {
> +			int it_inx, gain_inx;
> +			int it_us, scale_u;
> +
> +			it_inx =3D FIELD_GET(VEML3328_CONF_IT_MASK, reg_val);
> +			gain_inx =3D FIELD_GET(VEML3328_CONF_GAIN_MASK, reg_val);
> +
> +			if (it_inx >=3D ARRAY_SIZE(veml3328_it_times) ||
> +			    gain_inx >=3D ARRAY_SIZE(veml3328_scale_vals))
> +				return -EINVAL;
> +
> +			it_us =3D veml3328_it_times[it_inx][1];
> +
> +			/*
> +			 * Equation for calculating ambient light scale:
> +			 * Scale =3D 0.384 * (50000 / Current_IT) * (1x / Current_Gain)
> +			 */
> +			scale_u =3D 384 * USEC_PER_MSEC;
> +			scale_u =3D scale_u  * 50000 / it_us;

[Severity: High]
Does this code overflow scale_u?

Since scale_u is initially set to 384,000 (384 * 1000) and is a 32-bit sign=
ed
integer, the multiplication by 50000 evaluates to 19,200,000,000. This exce=
eds
the maximum positive value of 2,147,483,647 for a signed 32-bit int.

> +			switch (gain_inx) {

[ ... ]

> +		}
> +
> +		reg =3D FIELD_GET(VEML3328_CONF_GAIN_MASK, reg_val);
> +		if (reg >=3D ARRAY_SIZE(veml3328_scale_vals))
> +			return -EINVAL;
> +
> +		*val =3D veml3328_scale_vals[reg][0];
> +		*val2 =3D veml3328_scale_vals[reg][1];
> +		return IIO_VAL_INT_PLUS_MICRO;

[Severity: Medium]
For IIO_INTENSITY channels, this returns the hardware gain multiplier direc=
tly
from veml3328_scale_vals. Will this instruct userspace to multiply an alrea=
dy
increased raw value by the hardware gain again?

Should the scale instead return the inverse (1 / gain) to correctly normali=
ze
the readings?

[ ... ]

> +static int veml3328_write_raw(struct iio_dev *indio_dev,
> +			      struct iio_chan_spec const *chan,
> +			      int val, int val2, long mask)
> +{

[ ... ]

> +	case IIO_CHAN_INFO_SCALE:
> +		for (i =3D 0; i < ARRAY_SIZE(veml3328_scale_vals); i++) {
> +			if (val =3D=3D veml3328_scale_vals[i][0] &&
> +			    val2 =3D=3D veml3328_scale_vals[i][1])
> +				break;
> +		}

[Severity: Medium]
For the IIO_LIGHT channel, veml3328_read_raw() dynamically calculates a lux
scale, but this write function compares the input against the raw hardware
gain multipliers in veml3328_scale_vals without verifying the channel type.

Does this mean writing the read scale value back will fail with -EINVAL?

Writing a valid gain value here seems to succeed and modify the hardware
gain, which would change the lux scale to something entirely different.
Could this inconsistent behavior break the expected IIO ABI principle of
being able to write back the values that were read?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520-veml3328-v=
2-0-a57f0d9e28d4@gmail.com?part=3D2
