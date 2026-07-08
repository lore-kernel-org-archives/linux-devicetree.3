Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8692B3AFCE9
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 10:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783506988; cv=none; b=KSJF4UQJ2Z/vLeHsUQA0pUb3Ts6tAhVwlydmuet+tyGMExsYIfiq/+DGeQaUroOF0sSw3lrzxqHzhQe8t+sqj3jnDRusirOjXrWM/ZP4Pjdy3PlkOvROSNJr3luZZBDvjON1WzTV2ZM4pUkGFMLT3GMSIUcYSJpfvMhK1Zv0n9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783506988; c=relaxed/simple;
	bh=cdOvmLrcn9CVXUeuBsgvFIIIwnlyL+QX713gyvsz5/s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Gw3K0PtzMmhHS8NGkgljb6QRMfXWwACDJGioPrPaHg/I+HSVpvxgCFmA9U9djz2xQSfkmlpwOmuhshbob10sXkbqcNeOiaff5AxKctNUm/uhZrANoA7BuMzof9UBdjlGDM3fvI7owTTvok0qaeAMJchMog51zZOnC/Kmf2SWmSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ayuIc0YP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ayuIc0YP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A28F1F000E9;
	Wed,  8 Jul 2026 10:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783506973;
	bh=nvsFnVElO38aLAcm2uqG5RTBpfu6YI5xeI7nDcTyF1I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ayuIc0YP/0k4KCxCKx5tQflMHmlUoQtFvoXIjACqs5K47HJ2/texhYTcn9iDlE5Ss
	 B5LGsr8lUaIetscnWbSz6xhjRlSSMDxZDSsGniEgkJF2WQFOsbQ4ziKSJ1jNyUWq8J
	 GkIDC+Pv8kKvEOLStOv2DKQ6czFHlVJOCm5p/z8BiZK6sxMzwng1gJVF9vNpL69GdM
	 6hvE78i28f25Li7THpuuF+PT11C5qNffa9B5RuV8O2npTrAMWTtBi+Pd68RDgsZ5EU
	 aGenSkdYVmahiUuGDtoYeXIyyhoq93KVdJiWDvXmel7kGrheENeMsa3ngFQx3BoNRG
	 bm/zi8yG5juMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/6] pmdomain: renesas: Add R-Car X5H MDLC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: wsa+renesas@sang-engineering.com, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <23f979b0903ca11513ac339ab8b6dd40435603c5.1783505142.git.geert+renesas@glider.be>
References: <cover.1783505142.git.geert+renesas@glider.be>
 <23f979b0903ca11513ac339ab8b6dd40435603c5.1783505142.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 10:36:12 +0000
Message-Id: <20260708103613.4A28F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Hardcoded index `0` in `of_parse_phandle_with_args()` breaks consu=
mer devices attached to multiple power domains.
- [High] Use-After-Free of `priv` due to premature release of `r8a78000_mdl=
c_lock`.
- [High] AB-BA deadlock (lockdep splat) between `r8a78000_mdlc_lock` and th=
e global `gpd_list_lock`.
- [Medium] Missing dummy clocks despite claims in the commit message.
--

--- Patch [4]: [PATCH v2 4/6] pmdomain: renesas: Add R-Car X5H MDLC driver =
---
commit 1970ea51b8c9b00b6533ff3db2920ecb99d83f17
Author: Geert Uytterhoeven <geert+renesas@glider.be>

pmdomain: renesas: Add R-Car X5H MDLC driver

This adds a minimal Module Controller driver for the R-Car X5H (R8A78000)
SoC. It provides support for always-on power domains and dummy resets for
the serial console.

> For now this just supports the always-on power domains, and dummy clocks
> and resets for the serial console (which is enabled by the boot loader).

[Severity: Medium]
The commit message mentions adding dummy clocks, but looking at
r8a78000_mdlc_probe(), it appears only the genpd and reset controller
providers are registered. Will consumers defer indefinitely if they
attempt to use this driver as a clock provider?

> diff --git a/drivers/pmdomain/renesas/r8a78000-mdlc.c b/drivers/pmdomain/=
renesas/r8a78000-mdlc.c
> new file mode 100644
> index 0000000000000..ed367e921a334
> --- /dev/null
> +++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
[ ... ]
> +static int r8a78000_mdlc_attach_dev(struct generic_pm_domain *domain,
> +				    struct device *dev)
> +{
> +	struct device_node *np =3D dev->of_node;
> +	struct r8a78000_mdlc_priv *priv;
> +	struct of_phandle_args pd_spec;
> +	const struct mod_map *map;
> +	unsigned int id;
> +	int ret;
> +
> +	ret =3D of_parse_phandle_with_args(np, "power-domains",
> +					 "#power-domain-cells", 0, &pd_spec);

[Severity: High]
Is it possible for a consumer device to have multiple power domains
configured in its device tree (e.g., <&sysc 1>, <&mdlc 2>)? If the
MDLC domain is not the first one in the property, won't this hardcoded
index of 0 fail to find the correct provider and cause the consumer
probe to fail with -ENODEV?

> +	if (ret < 0)
> +		return ret;
> +
> +	if (pd_spec.args_count !=3D 2) {
> +		of_node_put(pd_spec.np);
> +		return -EINVAL;
> +	}
> +
> +	scoped_guard(mutex, &r8a78000_mdlc_lock) {
> +		hlist_for_each_entry(priv, &r8a78000_mdlc_list, link) {
> +			if (priv->np =3D=3D pd_spec.np)
> +				break;
> +		}
> +	}
> +
> +	if (!priv) {
> +		dev_err(dev, "%s: MDLC %pOF not found\n", __func__, pd_spec.np);
> +		of_node_put(pd_spec.np);
> +		return -ENODEV;
> +	}
> +
> +	id =3D pd_spec.args[1];
> +	of_node_put(pd_spec.np);
> +
> +	map =3D mod_map_find(priv->mod_map, id);

[Severity: High]
Could priv be freed before we dereference it here? The lock protecting
the r8a78000_mdlc_list is released at the end of the scoped_guard() block
above.

If the provider's probe fails or the driver is unbound concurrently,
r8a78000_mdlc_unlink() will acquire the lock, remove priv from the list,
and free the memory. Since we access priv->mod_map here without holding
the lock, does this introduce a use-after-free window?

> +	if (!map) {
> +		dev_err(dev, "Unknown module 0x%x\n", id);
> +		return -ENOENT;
> +	}
[ ... ]
> +static int r8a78000_genpd_always_on_singleton(struct device *dev)
> +{
> +	struct generic_pm_domain *genpd;
> +	int ret;
> +
> +	guard(mutex)(&r8a78000_mdlc_lock);
> +
> +	if (r8a78000_genpd_always_on)
> +		return 0;
> +
> +	genpd =3D kzalloc_obj(*genpd);
> +	if (!genpd)
> +		return -ENOMEM;
> +
> +	genpd->name =3D "always-on";
> +	genpd->attach_dev =3D r8a78000_mdlc_attach_dev;
> +
> +	ret =3D pm_genpd_init(genpd, &pm_domain_always_on_gov, false);

[Severity: High]
Will this sequence trigger a lockdep splat?

During this first probe, r8a78000_genpd_always_on_singleton() acquires
r8a78000_mdlc_lock and calls pm_genpd_init(), which acquires the global
gpd_list_lock. This establishes r8a78000_mdlc_lock -> gpd_list_lock.

Later, when a consumer device attaches, the PM domain core calls
r8a78000_mdlc_attach_dev() with gpd_list_lock held. That function then
acquires r8a78000_mdlc_lock via the scoped_guard() block, completing an
inverse lock order.

Should pm_genpd_init() be called outside the r8a78000_mdlc_lock critical
section to avoid this?

> +	if (ret) {
> +		kfree(genpd);
> +		return dev_err_probe(dev, ret,
> +				     "Failed to create always-on domain\n");
> +	}
> +
> +	r8a78000_genpd_always_on =3D genpd;
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783505142.gi=
t.geert+renesas@glider.be?part=3D4
