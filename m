Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80483457E53
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246299; cv=none; b=dIBlsQZLeI0MuM8C6r0cWjfsAsliCGywgz7TaoQB5SowDg3LL5NcqkFQjcrnJYvZzSPV1BQApkDU6QWsm5Ow6VkjhK0vkULGod3EcJw3i5jU1Vg+Vtra7O/o3rewe/RXUrrxM4dFQ6zUAAoS4SNu5CQeqcBd4zJZkJePySsKX1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246299; c=relaxed/simple;
	bh=r7BsivqT9BsA+LBfGSPAWjIXqoHqh4RxVKrULtnovvE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=drjuzlxoY4Q6xbVDHqwPnNAVQ7KoNnwtgdGTqsSrk8es5uFaD0JocyzlRSG75Mqm5pyNMDPLN+uxMugCx1794NphXhWr2FFyqJtPZMIrFmlhOwxaC5hxTjYQVpX9odaPIb698IT2ZCLLGRIQph7wVCaH9UXBR5ZKIQfa4gZeiUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SINg0WgR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SINg0WgR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDEAF1F00898;
	Thu, 24 Sep 2026 10:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790246298;
	bh=Wj8cUR+RvjKCblxw1+7VM0iV53zTjqzG2pukU5vPNbA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SINg0WgRu8693Ms0DPAdtSsgEYT2KpbBLo93aeJAYoeyTRgKBNTlsFvFpt9DiPQCJ
	 326ed//xaP8p+EV4s2++fsg8r6R72R81IUB1rCtJRa8TsY6BqLPjsSqn97D5DG0Zkc
	 w+vt+6YOu38+UtAmw49uAsv+PupJqHWpxxJ5v7VaqD+RhMXekd4xXKp3JxgB0DpYlT
	 hfBn8SLNFwYOb9Q5kkbJgSrA/QOxStRATZjIjC/YXe8QiyFSnKC0L5tK0WH84QzL72
	 TXcKParbUaf0jtebuEgDXr6IJAuJVKLVNlojGXqxLg1td3UjKynIk6JKivWdK5r3C8
	 wwOAYPSUssAfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 09/15] pmdomain: rockchip: add optional per-domain
 power-on settle delay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260924102135.92217-10-gahing@gahingwoo.com>
References: <20260924102135.92217-1-gahing@gahingwoo.com>
 <20260924102135.92217-10-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 10:38:17 +0000
Message-Id: <20260924103817.BDEAF1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] pmdomain: rockchip: forced NPU power-off bypasses child QoS save a=
nd state hierarchy
--

commit e61a0d5aec29d1b9ed2c36b6307c8069719a9a05
Author: Jiaxing Hu <gahing@gahingwoo.com>

pmdomain: rockchip: add optional per-domain power-on settle delay

The RK3576 NPU domains need a short settle time after the idle request is
released before the registers behind the domain answer. This patch gives
rockchip_domain_info an optional delay_us and waits for it between releasing
idle and restoring QoS. It also passes true for the regulator argument for
the NPU domain, so it powers off at probe and the delay runs on the first
power-on.

> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/ro=
ckchip/pm-domains.c
> index ba66ae7194289..39988efd86aaa 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c

[ ... ]

> @@ -681,6 +688,10 @@ static int rockchip_pd_power(struct rockchip_pm_doma=
in *pd, bool power_on)
>  		if (ret < 0)
>  			goto out;
> =20
> +		/* Some domains need to settle before the QoS registers answer. */
> +		if (pd->info->delay_us)
> +			udelay(pd->info->delay_us);
> +
>  		rockchip_pmu_restore_qos(pd);

[Severity: High]
Does restoring the QoS registers here lead to zero-overwrites if the bootlo=
ader
leaves the NPU domains active?

When rockchip_pm_add_one_domain() forcefully powers down the parent domain =
at
probe, it physically cuts power to its subdomains before their QoS state ca=
n be
saved. This leaves pd->qos_save_regs zero-initialized.

When the subdomains are finally powered on, this routine restores those
bypassed, zero-initialized arrays into the hardware registers, which could
cause a hardware malfunction.

>  	}

[ ... ]

> @@ -1300,25 +1311,26 @@ static const struct rockchip_domain_info rk3568_p=
m_domains[] =3D {
>  };
> =20
>  static const struct rockchip_domain_info rk3576_pm_domains[] =3D {
> -	[RK3576_PD_NPU]		=3D DOMAIN_RK3576("npu",    0x0, BIT(0),  BIT(0), 0,  =
     0x0, 0,       0,       0,       false),
> -	[RK3576_PD_NVM]		=3D DOMAIN_RK3576("nvm",    0x0, BIT(6),  0,      BIT(=
6),  0x4, BIT(2),  BIT(18), BIT(2),  false),
[ ... ]
> +	/*                                            name    p_offset pwr     =
 status  r_status r_offset req      idle     g_mask   delay wakeup */
> +	[RK3576_PD_NPU]		=3D DOMAIN_RK3576_R("npu",  0x0, BIT(0),  BIT(0), 0,  =
     0x0, 0,       0,       0,       0,    false),

[Severity: High]
Can setting need_regulator =3D true (via DOMAIN_RK3576_R) for the parent NPU
domain cause a state mismatch and fatal probe failure?

This intentionally forces the parent NPU domain to power off at probe time.
However, its subdomains do not enforce the OFF state at probe and retain th=
eir
status register states.

For example, subdomains like RK3576_PD_NPUTOP remain configured without
need_regulator set:

> +	[RK3576_PD_NVM]		=3D DOMAIN_RK3576("nvm",    0x0, BIT(6),  0,      BIT(=
6),  0x4, BIT(2),  BIT(18), BIT(2),  0,    false),
[ ... ]
> +	[RK3576_PD_NPUTOP]	=3D DOMAIN_RK3576("nputop", 0x4, BIT(6),  0,      BI=
T(22), 0x0, 0x18,    0x18,    0x18,    15,   false),

If the child PMU status registers still read as active after the parent pow=
er
is abruptly cut, wouldn't pm_genpd_add_subdomain() encounter a
parent-OFF/child-ON state mismatch and fail with -EINVAL?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924102135.9221=
7-1-gahing@gahingwoo.com?part=3D9
