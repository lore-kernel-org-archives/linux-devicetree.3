Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C5D2609FD
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 02:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785204868; cv=none; b=kprT11GbQeVPZar3h99redjU0BVXTMmTuBe/M4ZruD1paDK17eC4DAbIaIPI0XpSCfdaI/UkBbKpr0EwXpMY5no4mjQ5sjuxRhJwlWNj76pfCY4mJKyOHNoa+XODr+dRjL9MHnqUabUi2Z0LYnEClAIRptOJxTFBxhpnBH0NNqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785204868; c=relaxed/simple;
	bh=GTTiBc3Gha9COJyWqvAwpFqWgyHuVJgElLT8ggwBNws=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Sw99jfvm8t4e6tNM4oBsRtnk6C7aX03ccBD3iocaIgx+Y2YkIQZYhx+ReD6ZMzjHpQFH1iDcRESB2vLemcZo4lALk7XbehY0IrQCCZ3pXflgkz5PaaEWNwMdfbmctKSrwBwt0AkEETqBXUeynZzU/hgxv47AYCTxFH4BfkAyktE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UeuqdtWl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UeuqdtWl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD0071F000E9;
	Tue, 28 Jul 2026 02:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785204867;
	bh=Ci6qkwKDrpB2xJ5YB4E+GCuPoL+HlDhbbaWA0do6vWI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UeuqdtWl3ohEDy2K7FW/vJrlparRzUIddEssfir990mMrUUY673Ly8PoDXYgYX+8l
	 xW1l6y8WMdQBTPuL28hQgMsm3KkTZkG7dPUVmf7FdKADOM+rvqOCPGp69/JLeyqHo4
	 BnS+1+l1zSv7d0eABwcvJvH00gP6lPjw8Pn7yE77tJpROKZiZ4S4ioNLKXfj65oRks
	 lrciP5fv0X6s8mhmUk30gVV8SiR893WBYcqqR0uJg4ai0SyFYo1FNe5NY/7RZ32lu4
	 Azuk7pUZLd8U8XJBkl+sjOc7QCLgaRLGGTfOsFWXP3yc2YxcUp5aoRkpWyO7EEXN03
	 9DSMTA5l1F6EA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] soc/tegra: pmc: Add Tegra210B01 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaron Kling" <webgeek1234@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727-t210b01-pmc-v4-2-af68a21cd746@gmail.com>
References: <20260727-t210b01-pmc-v4-0-af68a21cd746@gmail.com>
 <20260727-t210b01-pmc-v4-2-af68a21cd746@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 02:14:26 +0000
Message-Id: <20260728021426.CD0071F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Undocumented behavioral change disabling the MBIST workaround (`=
needs_mbist_war =3D false`) for Tegra210B01.
--

--- Patch [2]: [PATCH v4 2/2] soc/tegra: pmc: Add Tegra210B01 support ---
commit 86284ce805fe44e2007af5f83c9d15e2c0fd40d2
Author: Alexandre Hamamdjian <azkali.limited@gmail.com>

soc/tegra: pmc: Add Tegra210B01 support

This commit adds power management controller support for the Tegra210B01=20
stepping. The commit message notes it is similar to the original Tegra210=20
but removes the sata and ve2 powergates.

> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index f419a5395545f..685b2b0f975c3 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
[ ... ]
> @@ -3897,6 +3897,67 @@ static const struct tegra_pmc_soc tegra210_pmc_soc=
 =3D {
>  	.has_single_mmio_aperture =3D true,
>  };
> =20
> +static const char * const tegra210b01_powergates[] =3D {
[ ... ]
> +};
> +
> +static const struct tegra_pmc_soc tegra210b01_pmc_soc =3D {
> +	.supports_core_domain =3D false,
> +	.num_powergates =3D ARRAY_SIZE(tegra210b01_powergates),
> +	.powergates =3D tegra210b01_powergates,
> +	.num_cpu_powergates =3D ARRAY_SIZE(tegra210_cpu_powergates),
> +	.cpu_powergates =3D tegra210_cpu_powergates,
> +	.has_tsense_reset =3D true,
> +	.has_gpu_clamps =3D true,
> +	.needs_mbist_war =3D false,
[Severity: Medium]
The commit message mentions that sata and ve2 are removed, but does not
mention disabling the MBIST workaround. Is this an intentional hardware
fix for the B01 stepping, or was this field accidentally set to false
compared to the original tegra210_pmc_soc?

If it's an intentional change, could the commit message be updated to
reflect this difference from the original Tegra210?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-t210b01-pm=
c-v4-0-af68a21cd746@gmail.com?part=3D2
