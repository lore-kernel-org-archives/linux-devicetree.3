Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BBD42901F
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 13:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784555479; cv=none; b=E9HqV2Rt7qpxutG0fFloTyva9/19WVScTbMaRc0bdAc4HTA+7Z9Sfzz7MAltdbF/k9VD3tsq2kcNCCQoD9Z4BlCEKrOLKwPjKNkhzOrGtvM+gfII7/Bx1Dz2X8wV0P8P/r4rb7AJxcdHrUlIKlOdv7y5v+vuvyfR1ULca0N2GXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784555479; c=relaxed/simple;
	bh=6WAaxWuoqk7AVbAmdMXch3lHbVYQfyk595hudD3KPMI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L5qut22Buq6ATEWYiSNzsrxQaf+Tz3rFQCO6r8bCkQOkIgpjjUCZEABQW/gVVHv0xUauwQiPXgPHFqZ8q0F1qqHEhu+e30VPdxRJLPw+Y3ypnCOH/J/o3gcP0Ggk2ZwT4/lMoC4Y50S1sXLUf1EUUdaSrENJjbB9MeYQxldDZ2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OuH4+4qU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OuH4+4qU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D11371F00A3A;
	Mon, 20 Jul 2026 13:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784555478;
	bh=vl+waiLUFsqAxuoKy0yDZe4zsC06ZCGSPLE90+2m3Ms=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OuH4+4qUVug58PsSGMmX9JJKZ7706qUudKukR8ROex96Vp9/oJBPOFb+kEzNLUpnD
	 HHbkygIEPN5q0QgtFPeXPKwmEfpjYy97IMLBrq12IAeJhebi5cueLZZFCTadwqr9Z6
	 uaCQq+dLmqLPp120N8Uy73OkGB+n81/1SFI4OIDnU+hydf749xU8V5bArkR6cgX9bd
	 CxCjUeASnTKrLyxkbavsR/qNNwtZNIX5P0vmrk4K+0U+8HQExyI6Rr3Bf2CP2rcwa0
	 RwAauPkr80rHjyT4ki2SIXNp9JSbtgAQbq5nVfAjUOb/zMaIHF0aK/xjHqRyD2KwEc
	 R8soWeEgKek4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 phy-next 3/8] soc: fsl: guts: add a central
 fsl_guts_read() function
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladimir Oltean" <vladimir.oltean@nxp.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, vkoul@kernel.org
In-Reply-To: <20260720133642.136324-4-vladimir.oltean@nxp.com>
References: <20260720133642.136324-1-vladimir.oltean@nxp.com>
 <20260720133642.136324-4-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 13:51:17 +0000
Message-Id: <20260720135117.D11371F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Dereferencing NULL pointer 'soc_dev_attr' on the error path if its=
 memory allocation fails.
--

--- Patch [3]: [PATCH v3 phy-next 3/8] soc: fsl: guts: add a central fsl_gu=
ts_read() function ---
commit cc1312c02ab5c2cd3fed5e2907608e44453c7816
Author: Ioana Ciornei <ioana.ciornei@nxp.com>

soc: fsl: guts: add a central fsl_guts_read() function

This commit adds a central fsl_guts_read() function that handles reading
DCFG registers based on the already determined endianness. This avoids
duplicating the if-else endianness checks across the driver.

> diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
> index a2b4c477b064b..e1b3a054e681b 100644
> --- a/drivers/soc/fsl/guts.c
> +++ b/drivers/soc/fsl/guts.c
> @@ -111,6 +111,14 @@ static struct fsl_soc_guts {
>  	bool little_endian;
>  } soc;
> =20
> +static unsigned int fsl_guts_read(const void __iomem *reg)
> +{
> +	if (soc.little_endian)
> +		return ioread32(reg);
> +
> +	return ioread32be(reg);
> +}
> +
>  static const struct fsl_soc_die_attr *fsl_soc_die_match(
>  	u32 svr, const struct fsl_soc_die_attr *matches)
>  {

[ ... ]

> @@ -209,10 +217,7 @@ static int __init fsl_guts_init(void)
>  	}
> =20
>  	soc.little_endian =3D of_property_read_bool(np, "little-endian");
> -	if (soc.little_endian)
> -		svr =3D ioread32(&soc.dcfg_ccsr->svr);
> -	else
> -		svr =3D ioread32be(&soc.dcfg_ccsr->svr);
> +	svr =3D fsl_guts_read(&soc.dcfg_ccsr->svr);
>  	of_node_put(np);
> =20
>  	/* Register soc device */

[Severity: High]
Does this code trigger a NULL pointer dereference on the error path if memo=
ry
allocation for soc_dev_attr fails?

In fsl_guts_init(), if the kzalloc_obj() allocation for soc_dev_attr fails
just below this block, the code jumps to err_nomem and falls through to the
err label:

fsl_guts_init() {
    ...
	soc_dev_attr =3D kzalloc_obj(*soc_dev_attr);
	if (!soc_dev_attr)
		goto err_nomem;
    ...
err_nomem:
	ret =3D -ENOMEM;
err:
	kfree(soc_dev_attr->family);
	kfree(soc_dev_attr->soc_id);
    ...
}

Since soc_dev_attr is NULL when taking this path, won't calling
kfree(soc_dev_attr->family) dereference the NULL pointer during device
initialization?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720133642.1363=
24-1-vladimir.oltean@nxp.com?part=3D3
