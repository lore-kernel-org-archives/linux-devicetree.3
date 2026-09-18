Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FB33D090E
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 02:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789699946; cv=none; b=ebZMrgt0gJ+AAhqwt/cPZYNbqpJsBjcui0oXmXhLVtS4XbNwO9leYVlHBsqh0O0txOEfGporZR5aovw+UelwAi4Gi14pjI6W4oxicflG9G131fxCbP/7B4ZLqMtQw9dFcU+hprOjIzuwDfFIXT8qxrlhsN3AvlGFNBcVnXxgZUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789699946; c=relaxed/simple;
	bh=8XMzSgYJLrTpbS7JYU7EwJNtuwjAEf4lTQgRYszyPVg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Og9jL0xVhXDtCtjbkYznuUUsDPUltOJJmXjsGsClsYl+3TI5y6eoKGDg3nWMQpLU/1wo5KwDzh2NRSPkTFIlTeW6XrpkajF441unX4YzWTVs6ZbY4f6H0V7IAmS7VTQ8/qu2ZFyIGr0n84bQZyXRRl5Os2fj6afMYEeSIWY/TvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F3yO2jlz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F3yO2jlz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9855F1F000FF;
	Fri, 18 Sep 2026 02:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789699934;
	bh=xF1bXWou3rbhYi3+3+xU96VekintK+Av7EP95Qucz7w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F3yO2jlztTjjldaWWgxDoGjjDA6ffq3yg5x3+Kl0Hqh7Cun+Lqey9oePtbZz+Szp/
	 QGgUm0I9HxDCA82M/aAp/AXXVF1eFiSdHbKeTWj5wa+hXDW+PwsG79Turk9piu/DWt
	 o9z9iTDlonoaJ7wI640I1FWTlxoYZo9LzsN0frW626thv8Q+0YeWk59a33AyuS2yOe
	 egcSyOhNhuDokQL6bgMFaCQNBvlu/HI87/SBn0960YCHaTjZTF3GSpfo+kqb250fKE
	 VomJ3y9Lfu4BqT8mhWwnWNUc3e3hdhKEATOyQzlr7azoNFkr/9XHDd8Xi92AE5l+r8
	 I0Ep8y/S3C7HA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] pmdomain: spacemit: Add power domain driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yixun Lan" <dlan@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260918-04-k3-pm-support-v1-2-0acd2b36b96f@kernel.org>
References: <20260918-04-k3-pm-support-v1-0-0acd2b36b96f@kernel.org>
 <20260918-04-k3-pm-support-v1-2-0acd2b36b96f@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 02:52:14 +0000
Message-Id: <20260918025214.9855F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] pmdomain: spacemit: missing .remove callback causes UAF on driver =
unbind
- [High] pmdomain: spacemit: unchecked pm_genpd_init() return leads to NULL=
 deref panic
- [High] pmdomain: spacemit: global gpmu assignment races with consumer pro=
be
- [Medium] pmdomain: spacemit: uninitialized stack variable used if regmap_=
read() fails
- [Low] pmdomain: spacemit: missing architecture dependency in Kconfig
--

commit af62cacb34c99353b794b2101862dcbbf7c19cfb
Author: Yixun Lan <dlan@kernel.org>

    pmdomain: spacemit: Add power domain driver
   =20
    SpacemiT's PMU (Power Management Unit) consist of several power domains
    which can be managed independently, depending on different application
    scenario, each domain can be powered on/off for saving power.

> diff --git a/drivers/pmdomain/spacemit/Kconfig b/drivers/pmdomain/spacemi=
t/Kconfig
> new file mode 100644
> index 0000000000000..4b927beedc7c0
> --- /dev/null
> +++ b/drivers/pmdomain/spacemit/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +menu "SpacemiT PM Domains"
> +
> +config SPACEMIT_PM_DOMAINS
> +	bool "PM Domain driver for SpacemiT SoC"
> +	depends on PM
> +	depends on OF
> +	depends on MFD_SYSCON

[Severity: Low]
Should this also have a dependency on ARCH_SPACEMIT or COMPILE_TEST?

Without it, users configuring kernels for any architecture will be prompted=
=20
to build this SoC-specific driver as long as the other dependencies are met.

[ ... ]

> diff --git a/drivers/pmdomain/spacemit/pm_domains.c b/drivers/pmdomain/sp=
acemit/pm_domains.c
> new file mode 100644
> index 0000000000000..d563e4e4e232e
> --- /dev/null
> +++ b/drivers/pmdomain/spacemit/pm_domains.c
> @@ -0,0 +1,448 @@

[ ... ]

> +static int spacemit_pd_power_on(struct generic_pm_domain *domain)
> +{
> +	struct spacemit_pm_domain *spd =3D container_of(domain, struct spacemit=
_pm_domain, genpd);
> +	const struct spacemit_pm_domain_param *p =3D spd->param;
> +	unsigned int val;
> +	int ret =3D 0;
> +
> +	regmap_read(gpmu->regmap, APMU_POWER_STATUS_REG, &val);
> +
> +	if (!p->use_hw && (val & BIT(p->bit_pwr_stat))) {

[Severity: Medium]
What happens if regmap_read() fails and returns an error code?

If regmap_read() fails here, the output parameter val will remain completel=
y=20
uninitialized. The uninitialized stack variable will then be evaluated to
determine the current power state.

Would it be better to check the return value of regmap_read(), or at least
initialize val to zero?

[ ... ]

> +static bool spacemit_pm_get_state(struct spacemit_pmu *pmu,
> +				  struct spacemit_pm_domain *pd)
> +{
> +	const struct spacemit_pm_domain_param *p =3D pd->param;
> +	u32 reg, bit;
> +
> +	regmap_read(pmu->regmap, APMU_POWER_STATUS_REG, &reg);
> +
> +	bit =3D p->use_hw ? BIT(pd->param->bit_hw_pwr_stat) :
> +		BIT(pd->param->bit_pwr_stat);
> +
> +	return !!(reg & bit);
> +}

[Severity: Medium]
Similarly here, if regmap_read() fails, the uninitialized variable reg
is used to return the power state.

> +
> +static int spacemit_pm_add_one_domain(struct spacemit_pmu *pmu, int id,
> +				      const struct spacemit_pm_domain_param *param)
> +{
> +	struct spacemit_pm_domain *pd;
> +
> +	pd =3D devm_kzalloc(pmu->dev, sizeof(*pd), GFP_KERNEL);
> +	if (!pd)
> +		return -ENOMEM;
> +
> +	pd->pm_index        =3D id;
> +	pd->param           =3D param;
> +	pd->genpd.name      =3D param->name;
> +	pd->genpd.power_off =3D spacemit_pd_power_off;
> +	pd->genpd.power_on  =3D spacemit_pd_power_on;
> +
> +	pm_genpd_init(&pd->genpd, NULL, !spacemit_pm_get_state(pmu, pd));
> +
> +	pmu->domains[id] =3D pd;
> +
> +	return 0;
> +}

[Severity: High]
Does this code need to check the return value of pm_genpd_init()?

If pm_genpd_init() fails (for example, due to a memory allocation failure=20
inside genpd_alloc_data()), the failure is ignored and the uninitialized=20
domain is still stored in the domains array.

> +
> +static void spacemit_pm_domain_cleanup(struct spacemit_pmu *pmu)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < pmu->num_domains; i++) {
> +		if (pmu->domains[i])
> +			pm_genpd_remove(&pmu->domains[i]->genpd);
> +	}
> +}

[Severity: High]
If a domain previously failed initialization in pm_genpd_init() but was sti=
ll
added to the array, will this unconditionally call pm_genpd_remove() on it?

Because pm_genpd_remove() calls list_del(&genpd->gpd_list_node), running it
on a domain with a zero-filled uninitialized list node will cause an immedi=
ate
NULL pointer dereference kernel panic.

[ ... ]

> +	err =3D of_genpd_add_provider_onecell(dev->of_node, &pmu->genpd_data);
> +	if (err) {
> +		dev_err(dev, "failed to add provider: %d\n", err);
> +		goto err_out;
> +	}
> +
> +	gpmu =3D pmu;

[Severity: High]
Could a consumer device probe race with the global gpmu assignment?

The call to of_genpd_add_provider_onecell() registers the PM domains and ma=
kes
them visible to consumers. Once this returns, deferred consumer devices can=
=20
immediately probe and attempt to power on the domain by calling=20
spacemit_pd_power_on(), which dereferences gpmu->regmap.

Since gpmu =3D pmu happens after the provider registration, is there a wind=
ow=20
where a concurrent consumer probe could see gpmu as NULL and trigger a
NULL pointer dereference?

[ ... ]

> +static struct platform_driver spacemit_pm_domain_driver =3D {
> +	.probe =3D spacemit_pm_domain_probe,
> +	.driver =3D {
> +		.name           =3D "spacemit-pm-domain",
> +		.of_match_table =3D spacemit_pm_domain_dt_match,
> +	},
> +};

[Severity: High]
Is it safe to allow this driver to be unbound without a .remove callback or=
=20
setting .suppress_bind_attrs =3D true?

If a root user manually unbinds the driver via sysfs:
/sys/bus/platform/drivers/spacemit-pm-domain/unbind

All devres managed memory (like the struct spacemit_pm_domain allocations)=
=20
will be automatically freed. Because the driver lacks a .remove callback, i=
t=20
fails to unregister the PM domains from the generic PM domain framework=20
(pm_genpd_remove) and the device tree provider list (of_genpd_del_provider)=
.=20

This leaves the framework with dangling pointers to the freed memory, causi=
ng a
use-after-free upon any subsequent access.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-04-k3-pm-s=
upport-v1-0-0acd2b36b96f@kernel.org?part=3D2
