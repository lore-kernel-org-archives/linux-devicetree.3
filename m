Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C510F3C2BA2
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 07:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789196995; cv=none; b=pUDA1iPJKGUIMeaqIF4QMPWfikRiPQwBIr6zpZxA03dAaSnprjpO6CHWuk62SejIbz4gTLqjVY6SXpy9QVbOV2R3CjE7KofPE4sjn5p68ZJyC2M25GSYGdVm6falgdWSm21uFwbgiNnmWWjSIg2RyhJwqsqz33nQFoB0P8H2wWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789196995; c=relaxed/simple;
	bh=Qf+m5weOQGz8uI1nI0fnL1o4ft4YOsWaKaO5IMiAzAY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lV5+oBBzAMDDBUaitIn/zPu8AQCwoYscUshUqnF+B5hrJGjsgzWxTGRm98d2ayHxeXcabf/RuDcp3MFMlacfMfONaW3gF2+dwe8rg5I9CkSxGVKrq8NNDVGq9KgBd0RhXC65MwUGXn5UqktJiC8sPy68TcjzUMEJMI9JcW/5yGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A315u055; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A315u055"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8DD1F000FF;
	Sat, 12 Sep 2026 07:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789196993;
	bh=HN8A2f2WZBPatBMiGj7oViETlQ+WrRtDcmEXu8cWaz4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A315u055RboUMMuCykrlHaqjlDuxBQt/4dBOVaV/1hz9QRURPeI803SJs69hccNpd
	 4icEiIzFQdwYqnvIYIjZaDtGYqwAydpKBt/EK9qIiw08Eo+6gwwdB+sW6JHEZvHwAN
	 JvCP3e1q2KoPw+rGe2sdzS5Zb7Yxh61qA5ssWY3JFQncBv3GMHDini36ey6x5XtDZL
	 aD5pqTpO6xAqSq7+ncWLYwsUX79ehDOSZzvNc6AqoOqrlO3tg8laSXIu2ccODe5y98
	 6Jg8pmG0wTfA5hTdJNdXMkCmHBjN7HEX/g9AgVFoUC5Kp0Tp2MEaeslk46j5I9y9UP
	 jDgpin3c6l/fA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 09/14] pmdomain: rockchip: add optional per-domain
 power-on settle delay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260912065053.1519165-10-gahing@gahingwoo.com>
References: <20260912065053.1519165-1-gahing@gahingwoo.com>
 <20260912065053.1519165-10-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 07:09:52 +0000
Message-Id: <20260912070953.4F8DD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Forcing the NPU parent domain off at probe bypasses the idle seque=
nce for its child domains, risking AXI bus hangs, and can cause pm_genpd_ad=
d_subdomain() to fail.
- [Medium] Hijacking the need_regulator flag to force a hardware reset at p=
robe is an API abuse that generates intentional, false kernel warnings on u=
naffected boards.

Pre-existing issues:
- [High] Error cleanup path fails to unlink subdomains, causing pm_genpd_re=
move() to fail and leading to a Use-After-Free of devres-managed memory.
--

commit c3ca2f4bcfcc96e94f4eccdb9b209d7e8e746177
Author: Jiaxing Hu <gahing@gahingwoo.com>

pmdomain: rockchip: add optional per-domain power-on settle delay

This patch introduces an optional delay_us to rockchip_domain_info, allowing
domains like the RK3576 NPU to settle before QoS register restoration. It a=
lso
adds a DOMAIN_RK3576_R macro to pass the need_regulator flag, applying it to
RK3576_PD_NPU to force a power-off at probe on boards without a domain-supp=
ly.

> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/ro=
ckchip/pm-domains.c
> index ba66ae7194289..39988efd86aaa 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c
> @@ -258,8 +262,11 @@ struct rockchip_pmu {
>  #define DOMAIN_RK3568(name, pwr, req, wakeup, regulator)		\
>  	DOMAIN_M_R(name, pwr, pwr, req, req, req, wakeup, regulator)
> =20
> -#define DOMAIN_RK3576(name, p_offset, pwr, status, r_status, r_offset, r=
eq, idle, g_mask, wakeup)	\
> -	DOMAIN_M_O_R_G(name, p_offset, pwr, status, 0, r_status, r_status, r_of=
fset, req, idle, idle, g_mask, wakeup)
> +#define DOMAIN_RK3576(name, p_offset, pwr, status, r_status, r_offset, r=
eq, idle, g_mask, delay, wakeup)	\
> +	DOMAIN_M_O_R_G_W(name, p_offset, pwr, status, 0, r_status, r_status, r_=
offset, req, idle, idle, g_mask, delay, wakeup, false)
> +
> +#define DOMAIN_RK3576_R(name, p_offset, pwr, status, r_status, r_offset,=
 req, idle, g_mask, delay, wakeup)	\
> +	DOMAIN_M_O_R_G_W(name, p_offset, pwr, status, 0, r_status, r_status, r_=
offset, req, idle, idle, g_mask, delay, wakeup, true)

[Severity: Medium]
Is hijacking the need_regulator flag here to force a hardware reset at probe
an abuse of the API?=20

Setting this flag on a domain that doesn't physically have a regulator forc=
es
the regulator core to issue a warning. As the commit message mentions, 12 o=
ut
of 13 boards do not describe a domain-supply, which means they will fallbac=
k=20
to a dummy regulator and print a dev_warn on otherwise healthy systems.=20

Could a dedicated boolean flag be used instead to force a probe-time
power-off?

[ ... ]

> @@ -1300,25 +1311,26 @@ static const struct rockchip_domain_info rk3568_p=
m_domains[] =3D {
>  };
> =20
>  static const struct rockchip_domain_info rk3576_pm_domains[] =3D {
> -	[RK3576_PD_NPU]		=3D DOMAIN_RK3576("npu",    0x0, BIT(0),  BIT(0), 0,  =
     0x0, 0,       0,       0,       false),
[ ... ]
> +	/*                                            name    p_offset pwr     =
 status  r_status r_offset req      idle     g_mask   delay wakeup */
> +	[RK3576_PD_NPU]		=3D DOMAIN_RK3576_R("npu",  0x0, BIT(0),  BIT(0), 0,  =
     0x0, 0,       0,       0,       0,    false),

[Severity: High]
Does forcing the NPU parent domain off at probe bypass the idle sequence for
its child domains?

If the bootloader leaves the NPU powered on, rockchip_pm_add_one_domain()
forces this parent domain off because need_regulator is true:

    if (pd->info->need_regulator)
        rockchip_pd_power(pd, false);
       =20
Because the parent RK3576_PD_NPU lacks an idle_mask (set to 0 here), power =
is
cut abruptly without idling its subdomains (NPUTOP, NPU0, NPU1), which risks
AXI bus hangs.=20

Furthermore, if the children's hardware status bits do not instantly clear,
they will be registered as ON, and pm_genpd_add_subdomain() will fail with
-EINVAL because it refuses to link an ON child to an OFF parent.

[Severity: High]
This is a pre-existing issue, but if the probe fails (such as from the
pm_genpd_add_subdomain() failure mentioned above), does the error cleanup
path cause a use-after-free?

In rockchip_pm_domain_cleanup(), the code iteratively attempts to remove
domains but doesn't unlink subdomains first:

    rockchip_pm_remove_one_domain(pd);

Which then calls:

    ret =3D pm_genpd_remove(&pd->genpd);

pm_genpd_remove() detects the active child links on the parent and returns
-EBUSY, failing to remove the parent domain from the global gpd_list.
Devres then frees the struct rockchip_pm_domain memory, leaving dangling
pointers in the core genpd list.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912065053.1519=
165-1-gahing@gahingwoo.com?part=3D9
