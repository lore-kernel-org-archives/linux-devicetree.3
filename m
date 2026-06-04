Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E5E3D332C
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 05:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780552643; cv=none; b=FPZyc2mExlVkrP8STbJATkUIBsAMegdR8NU8hM1H1SXNMu1V37/ibhemUg3+rq+AMXo2rdchEsEzUuvwuUq6nSNHSmCyxQrWTOreZUjv6DUDNaus5QTynjc7ymwZa3SLniFwf9UeGwxJfydgDbq7ayEEqXeed+9AgWCIvPxiGp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780552643; c=relaxed/simple;
	bh=fhqr8uHxmXHLdkkZ4TyzgFf9e1Zeaj6lY8Ni9qwQ11g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GnscNvKBhbmSGAsI3AvqVdhubdlzcG/gBPQUuAkbsvpNYwIb84sXgdGZC3+rYrimDGRuDJcuXKDiiYIWlBiQXSFWc29YB1QKn4x2gIzoji3UYMPI9vyLDbQa1RmAeAAmDu8AAAKjO/lOD+TBAY3Z/UqNz+DXwJyQgm/QBONuWgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KEkGAFfg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KEkGAFfg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A621F00893;
	Thu,  4 Jun 2026 05:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780552641;
	bh=yHhZK6TRyjUPaS/OWGN+IRV4lFpahYMlIArDXT3FbJU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KEkGAFfgLnSyNLLpZBJVuyL/fVTJ/uu7E5ER1c3DZ6guBq1pO+MthGw0FkRJ5kacf
	 5lHSfIJV7hodiaYIAwQ8522dWxngzHTGK0YKEMNZc98ILMshV2Sww8Yf5LStZaBd9G
	 yfIGQEWTWWR2delSQaYG2cTSJuYvy69dgWrGjfJ3Yld4q1xpA+AOEg2vufZox118jC
	 +4/mCWooJ9DKuRcw/OCepVKlfCAmxK5rZKSB9XkHCJQ+LDJ2Kob8p2E4X1yakllXdE
	 SX62MP7dDYatDc/8HkQK0NOSblbuqFtOJB8oU7YCBXJT5Djw/ykSZnzeU9R5+PJCa2
	 tifiq1h/tjolw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] iio: light: isl29018: support cover-glass gain
 compensation via DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk" <github.com@herrie.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260604054723.2983181-2-github.com@herrie.org>
References: <20260604054723.2983181-2-github.com@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 05:57:20 +0000
Message-Id: <20260604055721.58A621F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Multiple 32-bit integer overflows in `isl29018_read_lux()` lead to=
 incorrect, wrapped, or negative sensor readings.
--

commit 190a907a89f0aeaf207c50457cf9f79e29e324c2
Author: Herman van Hazendonk <github.com@herrie.org>

iio: light: isl29018: support cover-glass gain compensation via DT

This commit introduces a new device-tree property, "isil,cover-comp-gain",
to seed the in_illuminance0_calibscale value at probe time. This allows
hardware platforms to compensate for optical loss from tinted or coated
cover glass over the sensor. The default value is set to 1 to maintain
compatibility with existing systems.

[ ... ]

> diff --git a/drivers/iio/light/isl29018.c b/drivers/iio/light/isl29018.c
> --- a/drivers/iio/light/isl29018.c
> +++ b/drivers/iio/light/isl29018.c
> @@ -727,7 +727,16 @@ static int isl29018_probe(struct i2c_client *client)
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
This is a pre-existing issue, but does setting a large calibscale here
exacerbate an integer overflow in isl29018_read_lux()?

In isl29018_read_lux(), the calculations for data_x_range and the final *lux
value rely on 32-bit unsigned arithmetic:

drivers/iio/light/isl29018.c:isl29018_read_lux() {
    ...
	data_x_range =3D lux_data * chip->scale.scale +
		       lux_data * chip->scale.uscale / 1000000;
	*lux =3D data_x_range * chip->calibscale +
	       data_x_range * chip->ucalibscale / 1000000;
    ...
}

The multiplication lux_data * chip->scale.uscale can reach ~64 billion
(e.g., 65535 * 976,562), overflowing UINT_MAX (4,294,967,295) and losing
precision.

Furthermore, the subsequent multiplication data_x_range * chip->calibscale
easily exceeds 2 billion if calibscale is seeded to a high value (like 100,
as the commit message suggests). Because the result is stored in the signed
int *lux, exceeding 2 billion causes the value to wrap, resulting in massive
negative lux values being reported to userspace.

Could these 32-bit multiplications be updated to use 64-bit math or scaled
down to prevent overflow in bright light environments?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604054723.2983=
181-2-github.com@herrie.org?part=3D1
