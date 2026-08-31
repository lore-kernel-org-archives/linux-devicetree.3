Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B942D3D3327
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 09:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167108; cv=none; b=VFc6bMjVHbCqxUmSQeXOLMe1vrxVoqcYP5CeCogbev4P6XYKILhSCAM2Vgk2sRLJFjrHFK1PhqtQYUSXdlMokkRrKkC0rUCiRXMJ8+ST0Zt/fN2nlFNZIOnyKFtFq9NixDiTSLuJ7WF3hdnVak1LIO+AVAhGsww2GF3tO+Omz3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167108; c=relaxed/simple;
	bh=pgWfTnt9w7DugbfkkSJFZbLuE4nWkIW8eIhsnLbeQLo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZwDdw8+S6LiJqfoVCzFwERkxs11KbRXez5pXtF/PN0P05ceesoakyp6UUJbhLDmNVHNWYarPZQgTsBN4gDh7Uh8N6Wb+10L4gqAnBuSKO06kOd3xPk7YUfYZtoU/sNri2qvd6heBclgjmzgH2+fBzv4RZp1TV8eF/acuHmGsCnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FIvfOYOD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FIvfOYOD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F3D1F000E9;
	Mon, 31 Aug 2026 09:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788167107;
	bh=OJToWJXDrlRzzZ3w1YKtccTy6w5Wwc5hNTuNv2S2OQI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FIvfOYOD19D6gYwLQHob1S3C81JmhGNJJHJRCb+nLLYaMCZBOimsiBlafTTUoL4Tr
	 0FGMwyCkMK+lAgi269Nzcu9DdKvzdR+oKCQkyYrnBuT7PVsuAUAATAtiSjPYLcruFF
	 aLh3pG3HY0ohU9DZVyR3WZeDyuIK0PsOIbB2mmi0qCtLyl3xNtmOt3LA5SiYUU+FoS
	 9sLKZRqd1VJw5EMuQoxm3xOKKteoBMgRaQQ5uOTc74HCEbMRYLpmcqOg1jGwDzT7uW
	 93XDXhISbnL+r1fEtgpDGF2OZZImDqT/zLOB9uuZJtuc3DJcutyZ5Walo7edpHwq7f
	 dR1kTeiREnY7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 10/14] pmdomain/rockchip: cycle optional
 power-domain resets on power-on
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20260831081956.84871-11-gahing@gahingwoo.com>
References: <20260831081956.84871-1-gahing@gahingwoo.com>
 <20260831081956.84871-11-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 09:05:06 +0000
Message-Id: <20260831090507.54F3D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Resource leak of clock references on of_clk_get failure
- [High] Use-after-free when pm_genpd_remove fails during probe error clean=
up
--

commit c4349e9db6c9eecdba71ab60966e3312c6588638
Author: Jiaxing Hu <gahing@gahingwoo.com>

pmdomain/rockchip: cycle optional power-domain resets on power-on

Some Rockchip domains come out of power-on with their bus interface in
an undefined state. On the RK3576 NPU this shows up as a hang on the
first register access after the domain is switched on, and pulsing the
domain's resets at this point clears it.

Take the domain node's resets if it has any, and pulse them between
releasing idle and restoring QoS. The resets are optional, so domains
that do not list any are unaffected.

> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/ro=
ckchip/pm-domains.c
> index 39988efd86aaa..8f2fd8a83e8e9 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c

[ ... ]

> @@ -861,6 +870,14 @@ static int rockchip_pm_add_one_domain(struct rockchi=
p_pmu *pmu,
>  	if (error)
>  		goto err_put_clocks;

[Severity: High]
This isn't a bug introduced by this patch, but does this code leak the
clocks on of_clk_get() failure?

Looking at rockchip_pm_add_one_domain(), just above this code:

	for (i =3D 0; i < pd->num_clks; i++) {
		pd->clks[i].clk =3D of_clk_get(node, i);
		if (IS_ERR(pd->clks[i].clk)) {
			error =3D PTR_ERR(pd->clks[i].clk);
			dev_err(pmu->dev,
				"%pOFn: failed to get clk at index %d: %d\n",
				node, i, error);
			return error;
		}
	}

If a PM domain has multiple clocks defined in its device tree node, and
of_clk_get() succeeds for the first clock(s) but fails for a subsequent
clock (e.g., returning -EPROBE_DEFER), the function returns the error
directly without calling clk_put() on the successfully acquired clocks.

Could this direct return bypass the err_put_clocks cleanup path and leak
the clocks acquired in previous loop iterations?

> +	pd->resets =3D of_reset_control_array_get_optional_exclusive(node);
> +	if (IS_ERR(pd->resets)) {
> +		error =3D dev_err_probe(pmu->dev, PTR_ERR(pd->resets),
> +				      "%pOFn: failed to get resets\n", node);
> +		pd->resets =3D NULL;
> +		goto err_unprepare_clocks;
> +	}
> +
>  	pd->num_qos =3D of_count_phandle_with_args(node, "pm_qos",
>  						 NULL);

[ ... ]

> @@ -949,6 +967,7 @@ static void rockchip_pm_remove_one_domain(struct rock=
chip_pm_domain *pd)
> =20
>  	clk_bulk_unprepare(pd->num_clks, pd->clks);
>  	clk_bulk_put(pd->num_clks, pd->clks);

[Severity: High]
This is a pre-existing issue, but can this lead to a use-after-free when
pm_genpd_remove() fails during probe error cleanup?

In rockchip_pm_remove_one_domain(), right before this code:

	ret =3D pm_genpd_remove(&pd->genpd);
	if (ret < 0)
		dev_err(pd->pmu->dev, "failed to remove domain '%s' : %d - state may be i=
nconsistent\n",
			pd->genpd.name, ret);

If rockchip_pm_add_subdomain() or pm_genpd_provider_add_of() fails,
rockchip_pm_domain_cleanup() iterates over all domains in reg ID order.
If a child domain has a smaller ID than its parent, the child is removed
first. Because its parent link still exists, pm_genpd_remove() returns
-EBUSY and fails to remove the child from the global gpd_list.

Despite the failure, rockchip_pm_remove_one_domain() returns and the
rockchip_pm_domain structure is freed by devm when the probe fails.

Does this leave a pointer to freed memory in the global gpd_list, leading
to a use-after-free when the list is next accessed (e.g., by
genpd_power_off_unused())?

> +	reset_control_put(pd->resets);
> =20
>  	/* protect the zeroing of pm->num_clks */
>  	mutex_lock(&pd->pmu->mutex);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831081956.8487=
1-1-gahing@gahingwoo.com?part=3D10
