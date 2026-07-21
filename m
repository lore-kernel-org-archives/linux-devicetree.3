Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FEA390CBF
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784624307; cv=none; b=Ui3ylueLkOyAioAVXYLWdnBcc1JBDaKbHs7hlM8ixTqIRdBxlajhaVN1Dg8yBLTYzsiTdejA9qCmrZEHtTaRSrQ8PO7gWIIAu6mrJy/mYUpFO9X/XN+iX7XkD3scfgZ2ukub7VtjWdjL8oc6z3BWkCniBJzBb6ZccYSeUtLU/L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784624307; c=relaxed/simple;
	bh=dTTBGwz6Bs1fjY1vD7aVdAsQs5DyIH3258w06q05eEY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JBIljrxCm7jj3A7Dy9OMadIXcMvW9uk3GfJ3WX8SVP81iWetPr/kMWv+A0yk/ZP1IYcdelRIj+HTKKQ4U0U5N26r8XqWFQe0eCjkJG/pxc/S4oK/qUiK4mJXSvgCo0eq2qU6ywKpoO4pquXxDBlzkD0w8up7Zu5nEbpDGGzCVEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PexKYz2t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PexKYz2t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7803D1F000E9;
	Tue, 21 Jul 2026 08:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784624306;
	bh=J/C8+whpT+MQfq1YbnY85ts2y26nYGviYRktOT5QA50=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PexKYz2thy6yFOUPR+8I7oXNxSioHrAakD4MoViuTacL/Gs8Hk2fwwruz848O2Gq0
	 CfR1WHRckZB6FMUS1C2TDCbwk0P3dZp/SQTqmlypvUCZJAYwrSUVpBWMrC3/nrnOa8
	 pbpz/vOmLd2MKVZXyPx9cbFmb9TIrMlfJ4Yuev01Dx8H8J11xg67YB9aV5ePsvE3P2
	 rHQGiQaHDYOUwMcrrRaStRYKmwyZQ2M/OVGdBc6jCNYcDXgmG49Mu0Qv/2Kky6T6IG
	 Y0q4JUbRh3TPVqHEd/nnWl9vqkl+1MZjFZXHAqGpJQNelCHf2rzyo6Hm49flYsueEs
	 i9vGSQ954ag+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] iio: dac: ad3530r: add support for
 AD5710R/AD5711R
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kim Seer Paller" <kimseer.paller@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721-iio-ad5710r-upstream-v2-4-324949dc72da@analog.com>
References: <20260721-iio-ad5710r-upstream-v2-0-324949dc72da@analog.com>
 <20260721-iio-ad5710r-upstream-v2-4-324949dc72da@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 08:58:26 +0000
Message-Id: <20260721085826.7803D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `powerdown_mode` sysfs attribute is exposed with write permissi=
ons despite being read-only, causing write attempts to fail unconditionally=
 with `-EINVAL`.
--

--- Patch [4]: [PATCH v2 4/4] iio: dac: ad3530r: add support for AD5710R/AD=
5711R ---
commit 3c7f6e84bbb3d2178089f97875a1f7dc3599d417
Author: Kim Seer Paller <kimseer.paller@analog.com>

iio: dac: ad3530r: add support for AD5710R/AD5711R

This patch adds support for the AD5710R/AD5711R 8-channel configurable=20
IDAC/VDAC parts. The new devices are folded into the ad3530r driver as=20
they share the same register map and access model.

> diff --git a/drivers/iio/dac/ad3530r.c b/drivers/iio/dac/ad3530r.c
> index 97483534f8c33..935b3a832d8e9 100644
> --- a/drivers/iio/dac/ad3530r.c
> +++ b/drivers/iio/dac/ad3530r.c

[ ... ]

> @@ -194,6 +210,26 @@ static const struct iio_enum ad3532r_powerdown_mode_=
enum =3D {
>  	.set =3D ad3530r_set_powerdown_mode,
>  };
> =20
> +static int ad5710r_get_powerdown_mode(struct iio_dev *indio_dev,
> +				      const struct iio_chan_spec *chan)
> +{
> +	struct ad3530r_state *st =3D iio_priv(indio_dev);
> +	unsigned int val;
> +	int ret;
> +
> +	ret =3D regmap_read(st->regmap, AD5710R_CHN_VMODE_EN, &val);
> +	if (ret)
> +		return ret;
> +
> +	return !(val & AD5710R_CHN_VMODE_EN_BIT(chan->channel));
> +}
> +
> +static const struct iio_enum ad5710r_powerdown_mode_enum =3D {
> +	.items =3D ad5710r_powerdown_modes,
> +	.num_items =3D ARRAY_SIZE(ad5710r_powerdown_modes),
> +	.get =3D ad5710r_get_powerdown_mode,
> +};
> +

[ ... ]

> @@ -419,6 +506,17 @@ static const struct iio_chan_spec_ext_info ad3532r_e=
xt_info[] =3D {
>  	{ }
>  };
> =20
> +static const struct iio_chan_spec_ext_info ad5710r_ext_info[] =3D {
> +	{
> +		.name =3D "powerdown",
> +		.shared =3D IIO_SEPARATE,
> +		.read =3D ad5710r_get_dac_powerdown,
> +		.write =3D ad5710r_set_dac_powerdown,
> +	},
> +	IIO_ENUM("powerdown_mode", IIO_SEPARATE, &ad5710r_powerdown_mode_enum),

[Severity: Low]
Does using the IIO_ENUM macro here incorrectly expose the attribute as writ=
able?

Since ad5710r_powerdown_mode_enum lacks a .set callback, any writes to the
powerdown_mode sysfs attribute will fail unconditionally with -EINVAL.=20

However, the IIO_ENUM macro automatically assigns iio_enum_write to the .wr=
ite=20
callback, which grants write permissions in sysfs. Should this attribute be=
=20
manually defined in the ext_info array without a .write callback to properl=
y=20
enforce read-only semantics at the VFS layer?

> +	{ }
> +};
> +
>  #define AD3530R_CHAN(_chan, _ext_info)				\
>  {								\
>  	.type =3D IIO_VOLTAGE,					\

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-iio-ad5710=
r-upstream-v2-0-324949dc72da@analog.com?part=3D4
