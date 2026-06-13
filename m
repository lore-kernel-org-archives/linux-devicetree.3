Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0CD221DB6
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 07:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781335316; cv=none; b=CtzdKE7eAvS87qUyTVl7FcLhzouh6zFz86t/MnjGFVGnO6rMMPJDU48GFBEOskO+JE9Y1X4seg0g6ArqSRtq8edodQj2ND/28DnQIl5LO7j5u4Aq9g4ixAFvrxl1SWaVwjZZ+xf3dipG+CzDXlapiDeDQhqgnNcITmvJGU4g2Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781335316; c=relaxed/simple;
	bh=l4KUwkrY92gApD/4Sk4aJZ8YKlEPfhUfGXfhlBmvfUA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rIq4YpRqdTYSetM/yP+aMaPQzoqVmhjbJ4NEaujvQbV9I7I1KJHeqJxkxEUtDj+h36MwS/7ptoTjbdkFjiy+I77A39ojwVgF1tDG2xeramRrKvjeut/ZBw0+Uc7bLUyb7OCZjmPcrdoMtrNQXm7BV/+aOqe/4xBlI3DQJkloWc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DBexUrON; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DBexUrON"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 876DE1F000E9;
	Sat, 13 Jun 2026 07:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781335315;
	bh=lyeoeZB4baecDgPEDL9d2+mnsOQkh9CxE9zeseja7XY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DBexUrONr5lk83nbkKVxlbuaMcQNhcG1emWqTiGGCESf3cUUZ1Ld0q/Hvn23WB0gA
	 5ArqNHaZ0HN3j5+ACCBSB9uUvmO3wK4pxCclRWsh1I0nUmbiFwowuqu+LMdSKXWhpU
	 TbK5EGu/krrBvuQRBkdkPNsmHvDhQ4OUSEe5Bty5sFRhJMEHAP1FpvfmzhxiUWN2RH
	 /ToPqxvLNyyypusmUaZneAPSdJNqbfTzO5uxuOJ9RLODon5ommHuPognHJw3Xjf9nN
	 qa8vU0BCQNSkJMD5D31s/8GVJG9TV1zeE99jKyLoZazkSyXKZRYV1EZcIsNizrMTGU
	 2PxTeRPPWERBA==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v4 9/9] pmdomain: rockchip: Add a regulator to the
 RK3568 NPU power domain
Reply-To: sashiko-reviews@lists.linux.dev
To: MidG971 <midgy971@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260613070116.438906-10-midgy971@gmail.com>
References: <20260613070116.438906-10-midgy971@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 13 Jun 2026 07:21:55 +0000
Message-Id: <20260613072155.876DE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unhandled error from `rockchip_pd_power()` during probe leaves the=
 power domain in an inconsistent state, causing `genpd` to wrongly assume t=
he domain is ON.
--

commit 08758fdfbdda5f83d100c68fb3b2bbe8fd467ea7
Author: Midgy BALON <midgy971@gmail.com>

pmdomain: rockchip: Add a regulator to the RK3568 NPU power domain

This patch gives DOMAIN_RK3568 a regulator parameter, allowing the NPU
domain to set need_regulator. This enables genpd to manage the NPU rail
wired up as the domain's domain-supply instead of marking it always-on.

> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/ro=
ckchip/pm-domains.c
> index 490bbb1d1d8e8..19db307e3811d 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c
[ ... ]
> @@ -1274,15 +1288,15 @@ static const struct rockchip_domain_info rk3562_p=
m_domains[] =3D {
>  };
> =20
>  static const struct rockchip_domain_info rk3568_pm_domains[] =3D {
> -	[RK3568_PD_NPU]		=3D DOMAIN_RK3568("npu",  BIT(1), BIT(2),  false),
> -	[RK3568_PD_GPU]		=3D DOMAIN_RK3568("gpu",  BIT(0), BIT(1),  false),
> -	[RK3568_PD_VI]		=3D DOMAIN_RK3568("vi",   BIT(6), BIT(3),  false),
> -	[RK3568_PD_VO]		=3D DOMAIN_RK3568("vo",   BIT(7), BIT(4),  false),
> -	[RK3568_PD_RGA]		=3D DOMAIN_RK3568("rga",  BIT(5), BIT(5),  false),
> -	[RK3568_PD_VPU]		=3D DOMAIN_RK3568("vpu",  BIT(2), BIT(6),  false),
> -	[RK3568_PD_RKVDEC]	=3D DOMAIN_RK3568("vdec", BIT(4), BIT(8),  false),
> -	[RK3568_PD_RKVENC]	=3D DOMAIN_RK3568("venc", BIT(3), BIT(7),  false),
> -	[RK3568_PD_PIPE]	=3D DOMAIN_RK3568("pipe", BIT(8), BIT(11), false),
> +	[RK3568_PD_NPU]		=3D DOMAIN_RK3568("npu",  BIT(1), BIT(2),  false, true=
),

[Severity: High]
This is a pre-existing issue, but by setting need_regulator to true here,
does this expose the NPU domain to a potential probe failure and system
hang?

Looking at rockchip_pm_add_one_domain(), the return value of
rockchip_pd_power(pd, false) is currently ignored:

drivers/pmdomain/rockchip/pm-domains.c:rockchip_pm_add_one_domain() {
	...
	if (pd->info->need_regulator)
		rockchip_pd_power(pd, false);
	...
}

If the bootloader leaves the PMU MTCMOS register ON but the external
regulator is OFF, rockchip_pd_power() attempts to send an idle request.
Because the IP is physically unpowered, it cannot assert the ACK signal
and the request times out:

drivers/pmdomain/rockchip/pm-domains.c:rockchip_pd_power() {
	...
	ret =3D rockchip_pmu_set_idle_request(pd, true);
	if (ret < 0)
		goto out;
	...
}

Since the timeout error is ignored in rockchip_pm_add_one_domain(), the PMU
MTCMOS register remains ON, which causes pm_genpd_init() to incorrectly
initialize the domain as ON. When the consumer driver later requests power,
genpd assumes the domain is already active and skips enabling the regulator,
causing the driver to access an unpowered IP block.

Should the error handling in rockchip_pm_add_one_domain() be fixed to
properly synchronize the domain state before enabling this feature for the
NPU?

> +	[RK3568_PD_GPU]		=3D DOMAIN_RK3568("gpu",  BIT(0), BIT(1),  false, fals=
e),
> +	[RK3568_PD_VI]		=3D DOMAIN_RK3568("vi",   BIT(6), BIT(3),  false, false=
),
> +	[RK3568_PD_VO]		=3D DOMAIN_RK3568("vo",   BIT(7), BIT(4),  false, false=
),
> +	[RK3568_PD_RGA]		=3D DOMAIN_RK3568("rga",  BIT(5), BIT(5),  false, fals=
e),
> +	[RK3568_PD_VPU]		=3D DOMAIN_RK3568("vpu",  BIT(2), BIT(6),  false, fals=
e),
> +	[RK3568_PD_RKVDEC]	=3D DOMAIN_RK3568("vdec", BIT(4), BIT(8),  false, fa=
lse),
> +	[RK3568_PD_RKVENC]	=3D DOMAIN_RK3568("venc", BIT(3), BIT(7),  false, fa=
lse),
> +	[RK3568_PD_PIPE]	=3D DOMAIN_RK3568("pipe", BIT(8), BIT(11), false, fals=
e),
>  };
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260613070116.4389=
06-1-midgy971@gmail.com?part=3D9
