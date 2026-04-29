Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC28B1DD0D4;
	Wed, 29 Apr 2026 00:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777423071; cv=none; b=fneqOkp5pWXQkqBXDnxCYtUwVpCfucQOxI2aMwJ5b1Tev71h7e4njrinCqCvmM9pzQ7XgM9B+HG/MuTPrWEYSNN6/RKLg1WZm1iLGH6kdXl6UD1AAbweKGW80afzaMP41NSk8CeKXSV79dD0bMv1OI1dQSKgR+i+VcXtjcZvuiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777423071; c=relaxed/simple;
	bh=HbG/VaDb9xBOEjgmn4RdkcPmTgkBbJqZfQSvC83OcoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VkHGOUYHOCtuE23UBKxK/i7/x7qJ25PzekRhQbhbrX+YCATE+Hgivt428GqFIbbAGi/hm8o2G139BBCcrbOoNLn5qtJwXfKCjg7gls3VwWvvfaLS2tGaziMbP5/w0TTLu1NUmpI/a7EwvHs31ntxHckShhXuTMKN9o5yVWSYPKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fTgFZWRC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fTgFZWRC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A92C2BCAF;
	Wed, 29 Apr 2026 00:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777423071;
	bh=HbG/VaDb9xBOEjgmn4RdkcPmTgkBbJqZfQSvC83OcoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fTgFZWRCVtmrCT6V8ccR5nPg49TnRgZu/JFZ086Q98VUsLfsYZ7TToIEbnuEY0kow
	 LeAYbpEeU7WG1pNv+8suHVfCMxmHFnA2o5vCsi7fYggfs2cSYzAg62nAdY32ExdRx3
	 ffx/aROOywMvyQQIWXx+AhcaaFG5mLt2khpn2J2IY3AxzgrcqOo6uCWBuYt7OvmgO7
	 V0uiX5Fhk4KwZ3s8VbouKbeYU9Lm5mVJICSjexOjcAIPooVn9EsrldeHYhIlKslimZ
	 6DVLVGKsv504vMamEClmd91Zp2lqYudJD61AW7VTn7M7DLpS4HYiE8ymnfUcFLIzes
	 30mxSjM0z7iDA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 14C701AC584A; Wed, 29 Apr 2026 01:37:49 +0100 (BST)
Date: Wed, 29 Apr 2026 09:37:49 +0900
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, KancyJoe <kancy2333@outlook.com>
Subject: Re: [PATCH 2/2] regulator: add SGM3804 Dual Output driver
Message-ID: <afFS3W5hokXy3T7x@sirena.co.uk>
References: <20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-v1-0-1d8dc7620256@linaro.org>
 <20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-v1-2-1d8dc7620256@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xw/fYsY5Qg3Y6Kd0"
Content-Disposition: inline
In-Reply-To: <20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-v1-2-1d8dc7620256@linaro.org>
X-Cookie: 667:


--Xw/fYsY5Qg3Y6Kd0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 03:52:06PM +0200, Neil Armstrong wrote:
> From: KancyJoe <kancy2333@outlook.com>
>=20
>=20
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: KancyJoe <kancy2333@outlook.com>

Your signoff should appear at the bottom of the list here.

> @@ -0,0 +1,280 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * SGMicro SGM3804 regulator Driver
> + *
> + * Copyright (C) 2025 Kancy Joe <kancy2333@outlook.com>
> + * Copyright (C) 2026 Linaro Limited
> + * Author: Neil Armstrong <neil.armstrong@linaro.org>
> + */

Please make the entire comment a C++ one so things look more
intentional.  The authorship overall appears a bit confused?

> +/*
> + * The registers are only writable when the gpio is enabled, so we
> + * can't use the regulator regmap helpers & internal gpio handling
> + * so we need to track the state and apply the state at enable time.
> + */
> +struct sgm3804_data {
> +	struct regmap *regmap;
> +	bool active_discharge[SGM3804_RAIL_COUNT];
> +	unsigned int sel[SGM3804_RAIL_COUNT];
> +	struct gpio_desc *gpios[SGM3804_RAIL_COUNT];
> +};

> +static int sgm3804_enable(struct regulator_dev *rdev)
> +{

> +       ret =3D regmap_write(ctx->regmap, rdev->desc->vsel_reg,
> +                          ctx->sel[rdev_get_id(rdev)]);
> +       if (ret)
> +               goto err;
> +
> +       ret =3D regulator_set_active_discharge_regmap(rdev,
> +                                                   ctx->active_discharge=
[rdev_get_id(rdev)]);

It seems like this should be a regcache sync then only the enable and
disable operations need to be custom?  There is a register cache and it
covers these registers, without it the _active_discharge wouldn't work
since it does a regmap_update_bits() and all the registers are marked
unreadable.

> +MODULE_DESCRIPTION("SGMicro SGM3804 regulator Driver");
> +MODULE_AUTHOR("Kancy Joe <kancy2333@outlook.com>");
> +MODULE_LICENSE("GPL");

More author information here not looking joined up.

--Xw/fYsY5Qg3Y6Kd0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnxUtwACgkQJNaLcl1U
h9CL9gf/fyvEAOl69Qw/lYh1Bf7865wjIiRR23PzHiSz2D02FvdGdHdXk71Ryb09
UzyMh1lWLyrFymxPTOAqsw44DWpbkXXl9lXgvQOj5B3GwMz8InY226WgrFdmQDIC
OOxVsEqGjnMY9bw1jfYbtV+Q49iHQF+vp5A2nHZHf2sLQhOzo+/9WLk7A6FRgaQR
jJGa0Pm11kx74gdwVoy8vefuTEq1fHiOCZU+cHW17+uaGF9sXqsmC9d/WTm5nXrv
MXSMwgac208XUQ9kqyy9aG5QkBFlpIKez/KjBazfXJLUUWH0s3ECIvMPX0xYPfxT
oEBTO8u2jkFpmGBn6ZbKw+yqpK0lEg==
=RKbD
-----END PGP SIGNATURE-----

--Xw/fYsY5Qg3Y6Kd0--
