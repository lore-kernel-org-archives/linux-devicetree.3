Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC1A23FC41
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779452419; cv=none; b=PvkQsLEuQkXlV9VwM+i4kZCY5yExhdYKlh7LJf4qy6sLMR798rRlZHJpqSNC4E4r7vacO8krDrbor1hLaqgZTJv1Y1IhIcCkw/0H6FcoazWWu5DliN4VJWXifpKDtPwKb6CILYZTPCnbNjKgUHUPL+MO/mG0m8XoVP4r5eQwlcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779452419; c=relaxed/simple;
	bh=vXRyVJpjvHpMFNyFLRz16EWdcn0VYwemYvgkkuEp2H0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n4ZFaqMsJ+HEPBi1S0oGqiyPduwIRaUe2qw2bYsdClpQ3eVDAdOqguRKkAEEXiSCb5PMfPDzCQicpMAc+hf3QqfUeQuohJj6SocBulAPXB5rqLdsOa6VGlT47f0A3KH5TeJ/6r5k6FcGczjsC9QEls91P8JlcntCUFmxJPTLzcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nsmhe5TF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nsmhe5TF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3391F00A3D;
	Fri, 22 May 2026 12:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779452418;
	bh=VrTToLzQqzzwpKisIcnE00d50TEYwGEBdyHEPzCpHOc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nsmhe5TFQ3eEd3RIPJgXL0GUKM9ttScU9aUgSY5z7cv9k/j+/qv3LrL8RdkpqEOge
	 /ulHm4VOGMu2O9auDG10dxW+0645rJEJ/GDXP8Om2gVPhjnPp21F4H71XQuDCqiRp6
	 ON1MPDpMpE8roHRr40+YSfc4IFnTqNbV56qJKNd50sFumBm83v6my5EXxv418+LHzN
	 O2cgjZedc7iRb1jKqWBNcj39aJ0RryTwwGATPGh65WTwyj+W6B2hDDCvvf3MTLvf//
	 ig9SyzmRf9qZRCSIGqwUkaHKvEuShqsfS8wk+DDED7FPYykaQgayzSIOUmHv4gKmFK
	 sby6vZ7CGM96g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] iio: adc: ad4080: add support for AD4884
Reply-To: sashiko-reviews@lists.linux.dev
To: "Antoniu Miclaus" <antoniu.miclaus@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260522115337.18188-3-antoniu.miclaus@analog.com>
References: <20260522115337.18188-3-antoniu.miclaus@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 12:20:17 +0000
Message-Id: <20260522122017.CE3391F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect IIO scale calculation results in a factor of 1000 error =
for exposed voltage scales.
--

commit ec9f31937338c4b8462c0623182623b90d6e39ad
Author: Antoniu Miclaus <antoniu.miclaus@analog.com>

iio: adc: ad4080: add support for AD4884
   =20
Add support for the AD4884, a dual-channel, 16-bit, 40 MSPS SAR ADC.

> diff --git a/drivers/iio/adc/ad4080.c b/drivers/iio/adc/ad4080.c
> index 265d85ac171a9..764d49eca9e0e 100644
> --- a/drivers/iio/adc/ad4080.c
> +++ b/drivers/iio/adc/ad4080.c
[ ... ]
> @@ -541,6 +542,11 @@ static const struct iio_chan_spec ad4880_channels[] =
=3D {
>  	AD4880_CHANNEL_DEFINE(20, 32, 1),
>  };
> =20
> +static const struct iio_chan_spec ad4884_channels[] =3D {
> +	AD4880_CHANNEL_DEFINE(16, 16, 0),
> +	AD4880_CHANNEL_DEFINE(16, 16, 1),
> +};
> +

[Severity: High]
This isn't a bug introduced by this patch, but I noticed that when the chan=
nel
exposes the scale attribute, the calculation in ad4080_get_scale() seems
mathematically incorrect:

drivers/iio/adc/ad4080.c:ad4080_get_scale() {
	unsigned int tmp;

	tmp =3D (st->info->scale_table[0][0] * 1000000ULL) >>
		    st->info->channels[0].scan_type.realbits;
	*val =3D tmp / 1000000;
	*val2 =3D tmp % 1000000;

	return IIO_VAL_INT_PLUS_NANO;
}

Since the fraction is calculated by multiplying by 1,000,000 and then using
modulo 1,000,000, val2 holds micro units.

However, IIO_VAL_INT_PLUS_NANO tells the IIO core to format val2 as nano
units (billionths).

Does this mismatch cause the sysfs scale attribute to expose a value that is
exactly 1000 times smaller than intended for these channels?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522115337.1818=
8-1-antoniu.miclaus@analog.com?part=3D2
