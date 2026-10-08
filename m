Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38A7768EA
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 03:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791431755; cv=none; b=Ml47DH5Ta0aK39f8gIikl2lNde8kTXMwSL63uIsBLHhIuRpSdMM9afF3bQFZkTCVGPg0GlZZKbyu00l+f556oKX/jC9iBtKXvxsIgoJh1sbvl0cefACQWt7xXrPp9VbyPpqCwcr05OnNXAeduABPx+tPYFsVQz3keRY6XrVDOTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791431755; c=relaxed/simple;
	bh=B32dum00P7LfwTc5NUC2/cdbWUEMOR40lgx4HxnYF78=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Hf46wF4f+ybO0n5NJiMWqo6ocxYq2kR+kYx2zbnn0cNKY+bHfcvcvHcO5VipG+lqXIT4f+080DqYZL/RfHM1zILG/N8G3T8kzvT6dVYc2dXAeZfP2svkEPsixbZVjiLshWCm01UqEnadrsw2Ao55gAMH/kgOBSkeFfWkwehnAfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OU6ZNjTl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OU6ZNjTl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21D7F1F000FF;
	Thu,  8 Oct 2026 03:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791431754;
	bh=LHD/nQpYwmBO6snOTI2XV5hwOIGqAmNoRdeK9znR/4Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OU6ZNjTlCpAWbbvp58epMVZP8gT6vBJiAlr/bnxI1+3jDdK7Y25ZFGMjhC7pNUrWe
	 93AtBmYxuqwtgkAHwDllaTtH6cXIkc5k0bcL1p5HcnoVNAidjwvvSM2GnOVYH/n/hO
	 zeL2XG6rq9tpQGwt8OVlIS2twaH0Yt8XFyBRmw/fUHMw9RkBT5oNgeXiYFRMH4ktuI
	 gl3tAwwiEvzizYhJ5WDjn6TT7+jzicL5+v0WeITzK3AVixjcmHliYnLsuqfPSzh2O+
	 261lM1sR+0it9LdXUSpiozIBx7ubQqNKGIdx6KuM5k22gzP4aZIJ0t6LH+lB+o7rUZ
	 BNMokEhYb33AQ==
Message-ID: <sashiko-outbox-163593@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] pmdomain: spacemit: Add power domain driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yixun Lan" <dlan@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261008-04-k3-pm-support-v2-2-6f778a53dd2d@kernel.org>
References: <20261008-04-k3-pm-support-v2-0-6f778a53dd2d@kernel.org>
 <20261008-04-k3-pm-support-v2-2-6f778a53dd2d@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 03:55:53 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] pmdomain: missing .remove callback causes UAF on driver unbind
- [High] pmdomain: probe fails unconditionally if ALWAYS_ON domain is power=
ed off
--

commit ce2204cb1ba682f1391fc6691c412bb036ad43ca
Author: Yixun Lan <dlan@kernel.org>
Date:   Thu Oct 8 03:44:30 2026 +0000

pmdomain: spacemit: Add power domain driver

This commit introduces a Generic PM Domain driver for SpacemiT SoCs. It
provides support for managing power domains across different application
scenarios through software or hardware control modes.

> diff --git a/drivers/pmdomain/spacemit/spacemit-pm-domains.c b/drivers/pm=
domain/spacemit/spacemit-pm-domains.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/pmdomain/spacemit/spacemit-pm-domains.c

[ ... ]

> +static int spacemit_pm_add_one_domain(struct spacemit_pmu *pmu, int id,
> +				      const struct spacemit_pm_domain_param *param)
> +{
> +	struct spacemit_pm_domain *pd;
> +	int ret;
> +
> +	pd =3D devm_kzalloc(pmu->dev, sizeof(*pd), GFP_KERNEL);
> +	if (!pd)
> +		return -ENOMEM;
> +
> +	pd->pm_index        =3D id;
> +	pd->param           =3D param;
> +	pd->gpmu            =3D pmu;
> +	pd->genpd.name      =3D param->name;
> +	pd->genpd.flags     =3D param->flags;
> +	pd->genpd.power_off =3D spacemit_pd_power_off;
> +	pd->genpd.power_on  =3D spacemit_pd_power_on;
> +
> +	ret =3D pm_genpd_init(&pd->genpd, NULL, !spacemit_pm_get_state(pmu, pd)=
);

[Severity: High]
Will this unconditionally fail probe if the bootloader leaves the audio
domain powered off?

The k3_domain_params define the audio domain with GENPD_FLAG_ALWAYS_ON, but
here pm_genpd_init() is called with the inverse of the current hardware
state (is_off =3D !spacemit_pm_get_state()).

If the hardware happens to be off, is_off evaluates to true. However, the
genpd core explicitly rejects initializing always-on domains in the off
state:

drivers/pmdomain/core.c:pm_genpd_init() {
    ...
    /* Always-on domains must be powered on at initialization. */
    if ((genpd_is_always_on(genpd) || genpd_is_rpm_always_on(genpd)) &&
            !genpd_status_on(genpd)) {
        pr_err("always-on PM domain %s is not on\n", genpd->name);
        return -EINVAL;
    }
    ...
}

Since a failure here aborts spacemit_pm_domain_probe(), does the driver
need to explicitly power on always-on domains before passing them to the
genpd framework?

> +	if (ret)
> +		return ret;
> +
> +	pmu->domains[id] =3D pd;
> +
> +	return 0;
> +}

[ ... ]

> +static int spacemit_pm_domain_probe(struct auxiliary_device *adev,
> +				    const struct auxiliary_device_id *id)
> +{
> +	struct spacemit_ccu_adev *rdev =3D to_spacemit_ccu_adev(adev);
> +	const struct spacemit_pm_aux_data *data;
> +	struct device *dev =3D &adev->dev;
> +	struct spacemit_pmu *pmu;
> +	int err, i;
> +
> +	data =3D (const struct spacemit_pm_aux_data *)id->driver_data;
> +
> +	pmu =3D devm_kzalloc(dev, sizeof(*pmu), GFP_KERNEL);

[Severity: High]
Could this cause a use-after-free on module unload or driver unbind?

The driver dynamically allocates the pmu structure and domain entries using
devres APIs like devm_kzalloc() and devm_kcalloc(). During probe, these
domains and the provider are registered with the genpd core using
pm_genpd_init() and of_genpd_add_provider_onecell().

However, the spacemit_pm_domain_driver below lacks a .remove callback. When
the driver is unbound, devres will automatically free the allocated pmu and
domain memory, but pm_genpd_remove() and of_genpd_del_provider() are never
called.

Does this leave dangling pointers in the core gpd_list and
of_genpd_providers lists that could panic the kernel when accessed?

> +	if (!pmu)
> +		return -ENOMEM;

[ ... ]

> +static struct auxiliary_driver spacemit_pm_domain_driver =3D {
> +	.probe          =3D spacemit_pm_domain_probe,
> +	.id_table       =3D spacemit_pm_domain_ids,
> +};
> +module_auxiliary_driver(spacemit_pm_domain_driver);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-04-k3-pm-s=
upport-v2-0-6f778a53dd2d@kernel.org?part=3D2
