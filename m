Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2432A481FCA
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 08:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784710185; cv=none; b=ECJmj4aNKbNeO/vMngxl/fZVIQgvHGPvVlUmm2y2vo+ICnJYks12JvZs8o2UUwltoU4VFQZ4r0UZnyv2xNBeCqEbtBgL86tVzxAavXyz9qUml8k1V35SUU7gev8u7bl01OOMOn0AD2EyUzMvjCbnwLg67lLMGFpngxRwYRhT5Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784710185; c=relaxed/simple;
	bh=lUS0L71NvW4GhJEvgwq1ekzB2a5qLBwxFi1PTgMoB14=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RXEV8pl3dAb+NN8/Bsv0iIM3UQekRcfB5QwOBg9E1RYWSr9WZFan3mFMvlN3BJG0Ae8VFC7gD/PhNgUdJTl6y+y27efwcGsTAt/hL26pRipzY/D/CUsXt0dQr53S1QFi31uTUThB4k0K0he4Grj3Cr+YRRkh7OUpm9KCttqtGug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lO02uZ5L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lO02uZ5L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DA081F000E9;
	Wed, 22 Jul 2026 08:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784710183;
	bh=F5s3g1MeLbxf1gwfxm8R7xj+QFBkRoVjIue3b+RtU78=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lO02uZ5LXe8fKk8gmQF5vqtRi5fWbyJY2eWV8gDsb9p35B+FpLp/7EbfJf3ZKyHvA
	 qmBj0NyfI8qN/Ar3H4QFlNvsOU8CzF66BOLstqjD3j2MDKUXwa4zG1qW5INST0WAhE
	 HVLU1zfXLfDgswHU7jhE0WE0N9Pzk7S3+xid9IGsNPM+u/I9dPRM3i9aJc8f/pMP90
	 Rqtfv38iKCR586/AJnwUhcogaaSn732i49jA4lvcHJ3JPEEoPNxie9TSek7p6ifcUY
	 uSw0h2K+iqz7iLt159lrFMctNthFpLTHNYhpc0cIopgOaZ2n2yaFMIkNwYguhLqOsV
	 qEfCVHUJcCdmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] pmdomain: amlogic: Add support for A9 power domains
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: robh@kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260722-a9-pm-v1-2-1fe20a44bf2d@amlogic.com>
References: <20260722-a9-pm-v1-0-1fe20a44bf2d@amlogic.com>
 <20260722-a9-pm-v1-2-1fe20a44bf2d@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 08:49:42 +0000
Message-Id: <20260722084943.4DA081F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free due to missing .remove callback for meson_secure_pw=
rc driver
--

--- Patch [2]: [PATCH 2/3] pmdomain: amlogic: Add support for A9 power doma=
ins controller ---
commit 0074a5ab9b85f84325bfc2bf14c8fb48fcd14fb0
Author: Xianwei Zhao <xianwei.zhao@amlogic.com>

pmdomain: amlogic: Add support for A9 power domains controller

This commit adds support for the A9 power controller in the Amlogic
secure power domain driver. It introduces the A9 domain descriptors
and adds the corresponding compatible string to the match table.

> diff --git a/drivers/pmdomain/amlogic/meson-secure-pwrc.c b/drivers/pmdom=
ain/amlogic/meson-secure-pwrc.c
> index 1d2f371d2d7f0..133549956efa4 100644
> --- a/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> +++ b/drivers/pmdomain/amlogic/meson-secure-pwrc.c

[ ... ]

> @@ -468,6 +533,10 @@ static const struct of_device_id meson_secure_pwrc_m=
atch_table[] =3D {
>  		.compatible =3D "amlogic,a5-pwrc",
>  		.data =3D &amlogic_secure_a5_pwrc_data,
>  	},
> +	{
> +		.compatible =3D "amlogic,a9-pwrc",
> +		.data =3D &amlogic_secure_a9_pwrc_data,
> +	},
>  	{
>  		.compatible =3D "amlogic,c3-pwrc",
>  		.data =3D &amlogic_secure_c3_pwrc_data,
>  	},

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing these
changes I noticed a pre-existing issue with the platform driver registratio=
n:

static struct platform_driver meson_secure_pwrc_driver =3D {
        .probe =3D meson_secure_pwrc_probe,
        .driver =3D {
                .name           =3D "meson_secure_pwrc",
                .of_match_table =3D meson_secure_pwrc_match_table,
        },
};

Does meson_secure_pwrc_driver lack a .remove callback?

If this driver is unbound via sysfs or unloaded as a module, it seems=20
pm_genpd_remove(), pm_genpd_remove_subdomain(), and of_genpd_del_provider()=
=20
are never called to deregister the domains.

Since the driver core's devres cleanup will free the memory allocated for=20
the generic power domains upon removal, couldn't this leave dangling pointe=
rs=20
in the global gpd_list and of_genpd_providers lists, causing a Use-After-Fr=
ee=20
when the power domain framework traverses them?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-a9-pm-v1-0=
-1fe20a44bf2d@amlogic.com?part=3D2
