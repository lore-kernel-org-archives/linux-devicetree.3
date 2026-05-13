Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1F5356A0A
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 01:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778634793; cv=none; b=mHrprPgCzU2cegjRYfUGa5CGXXPg6e25XlAtW2zcF3dvdyIdtvhBU1BMZv49Xh1rBoguBk2VQQcAOMis9FzcuOwmho1dZPbNTraxcbAO9zjaAAmWL9XjLKZLN0vrshDEo8pj9Tk4aDzZnJsaXxPT7sGj2pq94iVt7jMPAL2XrLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778634793; c=relaxed/simple;
	bh=9Hw5toboAAbJRHSVjxCOIFv2Fqty/7FZUQi2XrqmFGw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gX87yvxDcg4AKmw6+6iWQG/jFdYabIuqd0yE03DD9oGylnQcucgqM4pgUGzaTvmoiE3vlA0zZ8RnErxj2HR6DFWgW15e5jv4okVbhI6kxTuvURCrYGVjIU5YNS7uF7PTQhiSpWabK+jKxh8XdK2UEwkPTiNs4FJ+WO7OvJgjmkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TDgJ8QfZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TDgJ8QfZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 412FAC2BCB0;
	Wed, 13 May 2026 01:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778634792;
	bh=9Hw5toboAAbJRHSVjxCOIFv2Fqty/7FZUQi2XrqmFGw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=TDgJ8QfZMLeCWeOF+XvGv49VbSiRzo9smlI7bmej6T8VALf5Wd+M/6V4VI6FRB1T9
	 sFu1ckVfNH/kcHBMMN7tU3+fLfhf+zuBLt9UpdUOs18V325sZPm25MMp06xMII8Nbd
	 uDsdIRowxI6bl0m/ZMrfAP8FzldfYt+R5lxN6ULh4AJso5dPgLuF//pvKb34iGPxzA
	 a4Lxza2OGQQWNZZDOm1rd6XwhbNqVNf4CQapyxPOh/N0eOvLk20QRK/VtvNvnV+xM0
	 TGBx/STVutIzxD2kfFAQ8e1oly0+MmjiZmsGWaKUxNWNT0FBTwRlyNVllxy18z65FH
	 RhzVqqSf5VKXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 v8 11/11] iio: adc: hx711: add support for HX710B
Reply-To: sashiko-reviews@lists.linux.dev
To: "Piyush Patle" <piyushpatle228@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260511174342.123820-12-piyushpatle228@gmail.com>
References: <20260511174342.123820-12-piyushpatle228@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 01:13:11 +0000
Message-Id: <20260513011312.412FAC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect scale returned for the HX710B supply monitor channel (=
channel 2).
--

commit 7c73b66947438720fd9e5f95112049924938a086
Author: Piyush Patle <piyushpatle228@gmail.com>

iio: adc: hx711: add support for HX710B
   =20
Add support for the AVIA HX710B ADC, which shares the HX711 GPIO interface =
but
uses trailing PD_SCK pulses to select the active mode. Model the HX710B with
variant-specific channel tables and IIO info, and track the active channel
across conversions.

> diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
> index 8ec4dee1f451e..49c14489d5ec4 100644
> --- a/drivers/iio/adc/hx711.c
> +++ b/drivers/iio/adc/hx711.c
> @@ -463,6 +502,10 @@ static const struct iio_info hx711_iio_info =3D {
>  	.attrs			=3D &hx711_attribute_group,
>  };
> =20
> +static const struct iio_info hx710b_iio_info =3D {
> +	.read_raw		=3D hx711_read_raw,
> +};
> +
[ ... ]
> @@ -495,6 +538,68 @@ static const struct iio_chan_spec hx711_chan_spec[] =
=3D {
>  	IIO_CHAN_SOFT_TIMESTAMP(2),
>  };
> =20
> +/*
> + * HX710B channels (Table 3 in datasheet).
> + * 25 pulses (1 trailing): differential input, 10 SPS -> channel 0
> + * 26 pulses (2 trailing): DVDD-AVDD supply monitor, 40 SPS -> channel 2
> + * 27 pulses (3 trailing): differential input, 40 SPS -> channel 3
> + * .address stores the trailing pulse count for hx711_set_hx710b_channel=
().
> + * Channel 2 is used for the supply monitor to avoid aliasing the
> + * channel2 terminal of the first differential pair.
> + */
> +static const struct iio_chan_spec hx710b_chan_spec[] =3D {
[ ... ]
> +	{
> +		.type =3D IIO_VOLTAGE,
> +		.channel =3D 2,
> +		.indexed =3D 1,
> +		.address =3D 2,
> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |
> +				      BIT(IIO_CHAN_INFO_SCALE),
> +		.scan_index =3D 1,
> +		.scan_type =3D {
> +			.sign =3D 'u',
> +			.realbits =3D 24,
> +			.storagebits =3D 32,
> +			.endianness =3D IIO_CPU,
> +		},
> +	},

Could this regression result in an incorrect scale being returned for the
HX710B supply monitor channel?

The driver defines BIT(IIO_CHAN_INFO_SCALE) in info_mask_separate for the
HX710B channels, advertising a separate scale per channel.

However, looking at hx711_read_raw(), when mask =3D=3D IIO_CHAN_INFO_SCALE =
the
chan parameter is ignored and the scale is unconditionally returned using
hx711_data->gain_set:

    case IIO_CHAN_INFO_SCALE:
        *val =3D 0;
        mutex_lock(&hx711_data->lock);

        *val2 =3D hx711_get_gain_to_scale(hx711_data->gain_scale,
                        hx711_data->gain_set);

For the HX710B, hx711_data->gain_set is fixed at 128.

Because channel 2 is a DVDD-AVDD supply monitor, it typically bypasses the
PGA and has an effective gain of 1 rather than 128.

Returning the scale for a gain of 128 causes userspace to calculate a volta=
ge
that is 128 times too small.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511174342.1238=
20-1-piyushpatle228@gmail.com?part=3D11
