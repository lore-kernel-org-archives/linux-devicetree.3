Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5A33BCD34
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 07:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780556458; cv=none; b=aJtAIOi3/Ju7TYvqQlNrZXqbiZfWj3gJGvJaPpme5g0X+RklfWylsDMXQ55bIIFD3KFi/TQYLuuVtUduQWTtv/sgC8kl5G3NynuY16nPEswoR9KbhRQ9fzsbc02Eg3MimjKSAZhFIeuqpHkHLin4wpl2knkJM/ieSLC+Y+os35I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780556458; c=relaxed/simple;
	bh=a5zYY27gY/EcXs4o/sNZQUJ0dMSuoEGPE4bV2pMWm/M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CXM65uYXKKbeMpHDYoD6Fq6MnDMpn5MHy345ZYxLsnIuH1CYDouTzd9PZbzjEoNTvdu+aNO2lRqIEIf8tA67aQlruXsmLskZE0HNxcvnJkDaPFeNYgi+CLavslsJoW8tzbWJ8Uiu8jTG+UMzA8iVfb2PMz+d68+nIjKfNPw8vfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ledpMPJR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ledpMPJR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A7021F00893;
	Thu,  4 Jun 2026 07:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780556456;
	bh=hQlbF7Kqc2gxFqh1TlRgm4I/26yG/fUmniEVKZiEcKI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ledpMPJRrhqqpG4IkfPrkjJJdItmRk4xi3CMsPrYxlPkEbfN6tfG0TzUvWd/Vv0Fc
	 /XACwJrGd36oLVWZtjAquzHSEvuuM40cfboPjgtlKXFxV3jvei0txdXO5O9osIXr4o
	 afgmUNRNscHN0EO8OERzcI0Zctu8UUpboPhkMEQe2pseUOhW6HvYYcPFdsU1p6VvMo
	 DW6a6JnUWYJJ6Mw5hPhH45cH22kdOg2n/WqOB9h9b2LVWu0vtv0LurrAV7q+dJRuPM
	 6Ngl+PJrKT1500s6Svsfn7iiO5yYK/Wf7jAksA9H3+cxhC+xqP2mDF/7zqvz3+4RIO
	 f3HmJzXRa/4bA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] iio: light: isl29018: support cover-glass gain
 compensation via DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk" <github.com@herrie.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260604064925.3097108-3-github.com@herrie.org>
References: <20260604064925.3097108-3-github.com@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 07:00:56 +0000
Message-Id: <20260604070056.7A7021F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Truncating the intermediate lux value before applying the calibrat=
ion scale (`cover-comp-gain`) causes massive precision loss, rendering the =
sensor wildly inaccurate for large gains.
--

commit 602cf7dfe3433fd4740e367b31d5116c92d21c70
Author: Herman van Hazendonk <github.com@herrie.org>

iio: light: isl29018: support cover-glass gain compensation via DT

This commit adds a new device-tree property isil,cover-comp-gain to the
isl29018 sensor driver. It allows initializing the calibscale parameter
directly from firmware, compensating for optical loss when the sensor is
mounted behind tinted cover glass.

> diff --git a/drivers/iio/light/isl29018.c b/drivers/iio/light/isl29018.c
> index 927018c531e8d..1d6a011c92625 100644
> --- a/drivers/iio/light/isl29018.c
> +++ b/drivers/iio/light/isl29018.c
[ ... ]
> @@ -728,7 +728,16 @@ static int isl29018_probe(struct i2c_client *client)
>  	mutex_init(&chip->lock);
> =20
>  	chip->type =3D dev_id;
> +	/*
> +	 * Allow boards that mount the sensor behind tinted / coated cover
> +	 * glass to bake the optical-loss compensation into firmware via
> +	 * "isil,cover-comp-gain", following the precedent set by
> +	 * tsl2563.c. The value seeds calibscale (default 1), so userspace
> +	 * can still retune through in_illuminance0_calibscale.
> +	 */
>  	chip->calibscale =3D 1;
> +	device_property_read_u32(&client->dev, "isil,cover-comp-gain",
> +				 &chip->calibscale);

[Severity: High]
This is a pre-existing issue, but adding the isil,cover-comp-gain
device-tree property encourages using large calibration gains from boot, wh=
ich
exposes an existing flaw.

In isl29018_read_lux(), the division by 1000000 drops the fractional part of
the base lux reading before applying the calibration scale:

drivers/iio/light/isl29018.c:isl29018_read_lux() {
    ...
    data_x_range =3D (u64)lux_data * chip->scale.scale +
                   (u64)lux_data * chip->scale.uscale / 1000000;
    result =3D data_x_range * chip->calibscale +
             data_x_range * chip->ucalibscale / 1000000;
    ...
}

With a dark cover glass requiring a large gain (for example, 100), the sens=
or
operates at very low raw lux levels. Dropping the fractional part before
multiplying by calibscale causes all raw readings below 1 lux to truncate to
0, resulting in an output of 0 lux.

When the raw reading reaches 1.0, the output will abruptly jump to 100 lux.

Could the division by 1000000 be delayed until after the calibscale
multiplication to preserve accuracy?

>  	chip->ucalibscale =3D 0;
>  	chip->int_time =3D ISL29018_INT_TIME_16;
>  	chip->scale =3D isl29018_scales[chip->int_time][0];

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604064925.3097=
108-1-github.com@herrie.org?part=3D2
