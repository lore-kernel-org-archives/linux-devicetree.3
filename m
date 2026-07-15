Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3809544C67C
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 12:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118996; cv=none; b=Ju4+uoLjQsKQOfv4rI5tP47g8hJb9WHpAvRlqiAi9l4NXVxq29kmLkBvfyMWaoa4X4BA0HaboQcTUcGkAvqjHMwDGeM8nxKOsU90dkzZYpe21vJXlqCyZq3FDM6V+LUXwUzNV3lT3TlSNdMXm4S0NTVc+Rjnp7tkB5wTfvsgTx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118996; c=relaxed/simple;
	bh=IPbHGtpAtXb8LuqnTyec5xS5OjJjBkq46vCk9P5zrXk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jPwTBJ4rGu7OEnhhkt5quhOeOTrn0NHx/Z4MQ2lB1O5Aht8iTMnrdPxj8cWUUMy+ypYhv7c614vOO2VjQ6JTFMFjS9UdvQChSMRAqjiMUmb9+q8fh5XmdiwlTXPs7jsujBIBE5DAffvXqNWhNdT1/qHD4VtrZ3McIm+Tjdg5dLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EPHuEB3X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EPHuEB3X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A525F1F00A3D;
	Wed, 15 Jul 2026 12:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784118994;
	bh=PdfNTg/xQCkNmHLPOTgZjuel6NzD/yMTitZRD+2zVd8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EPHuEB3X1nI6mag1r82gfShnNBP4G50BZnHM7NOJ7tK0JVdJADRTqmLJZlC+7UaMJ
	 6k9pDR4eikD8dxtdN+dhlE+wpIkuXT58pG+5t1igSHn7u+Xih/HDdE/QANmvl47cpN
	 NUN7u2188jhIMVkU6oJRxyWdaeSu37H5KpLtfiHeNWdMLQ6yjAvpmO/Mfa23AuO0Ed
	 OTX7oaU14Rx7q8iVWLO6cojmlQ3h1XQixruPSZMElRLQt/m922Mr2UjMKqnAPabIlj
	 /+DPlJgI1x573dV5sIeJtb+vlsD/vgRDR5U2zU0DBM28CGIwBnn2opCbjNUK25GPZw
	 Oaq1D6zu855Rw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] soc: mediatek: pwrap: use correct log level
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260715-6572-pwrap-v2-2-bea1d801c81b@protonmail.com>
References: <20260715-6572-pwrap-v2-0-bea1d801c81b@protonmail.com>
 <20260715-6572-pwrap-v2-2-bea1d801c81b@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 12:36:34 +0000
Message-Id: <20260715123634.A525F1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Child devices created by `of_platform_populate()` are not cleaned =
up on driver unbind, leading to orphaned devices and potential Use-After-Fr=
ee.
--

--- Patch [2]: [PATCH v2 2/3] soc: mediatek: pwrap: use correct log level -=
--
commit ce26f7b3ff3bc3d17adce977d882bf0f6118ba23
Author: Roman Vivchar <rva333@protonmail.com>

soc: mediatek: pwrap: use correct log level

This commit simplifies the error paths in the pwrap driver probe function
by replacing dev_dbg calls with dev_err_probe, ensuring the correct log
level is used on failure.

> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/=
mtk-pmic-wrap.c
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c

[ ... ]

> @@ -2593,11 +2584,9 @@ static int pwrap_probe(struct platform_device *pde=
v)
>  		return PTR_ERR(wrp->regmap);
> =20
>  	ret =3D of_platform_populate(np, NULL, NULL, wrp->dev);

[Severity: High]
This is a pre-existing issue, but does this code leave child devices
populated on driver unbind?

Since devm_regmap_init() is used earlier, the regmap will be automatically
freed when the driver unbinds. If devm_of_platform_populate() isn't used
here, will child PMIC drivers remain bound and attempt to use the freed
parent regmap, leading to a use-after-free?

> -	if (ret) {
> -		dev_dbg(wrp->dev, "failed to create child devices at %pOF\n",
> -				np);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(wrp->dev, ret,
> +				     "failed to create child devices at %pOF\n", np);
> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-6572-pwrap=
-v2-0-bea1d801c81b@protonmail.com?part=3D2
