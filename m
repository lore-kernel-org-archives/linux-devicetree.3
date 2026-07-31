Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBC1309EF2
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 04:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785473443; cv=none; b=V8XH/uCZpqhsvgWUkD5tInCpBNAf0kWTY37QDP9ArOhwDX6KutWRpq75YZub1t4PAn9H4RzmxpO7QDyQV3O4pGdgXCOsiGLW0+GD2zWjA+FggsmDts/8h8bSO+DRg/spjWpcUk+KzbBoud3TEHrMzckPUBbnOktGLhCTgM1LCSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785473443; c=relaxed/simple;
	bh=1RicQzsWyO+Aysyfvuovk/4niU0XtRvK5sn2wx6qPqY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TJQWi5MCUIPqN8iQjzRWTsH+rrdC7J7kfSJqPCyhHPR3x8ApL1cFxeHj3Rq/tWlpNgszGlDmC/VIEqvyyzAmhJSJK5XmTc0J7JPnMrOXd45eXpZeH1ezOY5qkVj1e8BX3mabmwctPArnuvNfojw38D41KMBnxPJZ5+P74QMpL4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P7eBy3QL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P7eBy3QL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F69B1F000E9;
	Fri, 31 Jul 2026 04:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785473441;
	bh=h9Iqb8ZaO73Qw5N8l705CQy7jr11HI8Y98F6XzwZDQQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P7eBy3QLZUN72+YEjw//NZtQPeDn8yMWKe1r51+WXAuaH3zRFXInl16ND0WZn5NjB
	 9io0yPCqEuS0LCkTrLl2rhdmdfATb0YCmICrLSQtcXg+OcSAjJGTVbNDsr22CGtgLi
	 DtHXDksEIUCW9U6ExQ5nM1p6Xo1m/Z66M8tUDcjWtiOxvpRK/etvXT3QWaqGYbgmHC
	 c4Y1l8bdulOdhX2sGpMk5NIaXPIPpngfsdPrtWKED1SJqkUTF/FvdQJy2CTJtfH62N
	 8X12bSkRFPiyFnAm31NmkbTOt4hB5wSfzZ6MR42SSuhy5GBvdJ3NcBfGjERRpBHLK7
	 SnlqUJQXhfWlA==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v3 3/6] pmdomain/rockchip: cycle optional
 power-domain resets on power-on
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20260731043507.1832277-4-gahing@gahingwoo.com>
References: <20260731043507.1832277-1-gahing@gahingwoo.com>
 <20260731043507.1832277-4-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 04:50:41 +0000
Message-Id: <20260731045041.9F69B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Low] Using `dev_err()` to log a failure to acquire resets causes log spa=
m when the error is `-EPROBE_DEFER`.

Pre-existing issues:
- [Critical] Critical use-after-free and state corruption due to `pm_genpd_=
remove()` failure during probe error handling.
- [High] Missing cleanup of previously acquired clocks if `of_clk_get()` fa=
ils during initialization.
- [High] Use-after-free on the PM domain's device tree node reference (`pd-=
>node`).
--

--- Patch [3]: [RFC PATCH v3 3/6] pmdomain/rockchip: cycle optional power-d=
omain resets on power-on ---
commit 7b67005dcd951b64c273c1af0e37dfcc0b7586dd
Author: Jiaxing Hu <gahing@gahingwoo.com>

pmdomain/rockchip: cycle optional power-domain resets on power-on

Some Rockchip domains come out of power-on with their bus interface in
an undefined state. On the RK3576 NPU this shows up as a hang on the
first access after a cold power-on; the vendor kernel cycles the
domain's resets at this point and that clears it.

Take the domain node's resets if it has any, and pulse them between
releasing idle and restoring QoS. The resets are optional, so domains
that do not declare any behave exactly as before.

> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/ro=
ckchip/pm-domains.c
> index e1857f8786864..82051f60090f3 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c

[ ... ]

> @@ -857,6 +866,14 @@ static int rockchip_pm_add_one_domain(struct rockchi=
p_pmu *pmu,
>  	if (error)
>  		goto err_put_clocks;

[Severity: High]
This is a pre-existing issue, but does this function leak clock handles if
of_clk_get() fails?

Looking at the loop just before this context:

rockchip_pm_add_one_domain() {
    for (i =3D 0; i < pd->num_clks; i++) {
        pd->clks[i].clk =3D of_clk_get(node, i);
        if (IS_ERR(pd->clks[i].clk)) {
            ...
            return error;
        }
    }
}

If of_clk_get() returns -EPROBE_DEFER for an index > 0, it returns
immediately without calling clk_put() for the clocks successfully acquired =
in
earlier iterations. Should this jump to a cleanup path instead?

[Severity: High]
This is another pre-existing issue in this function, but is it safe to store
pd->node without incrementing its reference count?

In rockchip_pm_domain_probe(), domains are initialized within a loop that
automatically drops the node reference. Later, rockchip_pd_power() uses this
potentially freed node:

rockchip_pm_add_one_domain()
    pd->node =3D node;

rockchip_pd_power()
    devm_of_regulator_get(..., pd->node, ...);

Could this lead to a use-after-free if the node is dynamically removed?

> =20
> +	pd->resets =3D of_reset_control_array_get_optional_exclusive(node);
> +	if (IS_ERR(pd->resets)) {
> +		error =3D PTR_ERR(pd->resets);
> +		dev_err(pmu->dev, "%pOFn: failed to get resets: %d\n", node, error);

[Severity: Low]
Could this dev_err() cause log spam during normal boot?

If of_reset_control_array_get_optional_exclusive() returns -EPROBE_DEFER
because the reset controller hasn't probed yet, this will print an error.
Would dev_err_probe() be better here to suppress the spam and cleanly track
the deferral?

> +		pd->resets =3D NULL;
> +		goto err_unprepare_clocks;
> +	}

[ ... ]

> @@ -945,6 +963,7 @@ static void rockchip_pm_remove_one_domain(struct rock=
chip_pm_domain *pd)
> =20
>  	clk_bulk_unprepare(pd->num_clks, pd->clks);
>  	clk_bulk_put(pd->num_clks, pd->clks);
> +	reset_control_put(pd->resets);
> =20
>  	/* protect the zeroing of pm->num_clks */
>  	mutex_lock(&pd->pmu->mutex);

[Severity: Critical]
This isn't a bug introduced by this patch, but could ignoring the return va=
lue
of pm_genpd_remove() lead to a use-after-free and state corruption?

During probe error paths, rockchip_pm_domain_cleanup() tries to remove
domains. If child links aren't removed first, pm_genpd_remove() fails with
-EBUSY. Since this failure is ignored:

rockchip_pm_remove_one_domain()
    ret =3D pm_genpd_remove(&pd->genpd);
    // ret is -EBUSY, but we continue tearing down

    clk_bulk_unprepare(...);
    reset_control_put(pd->resets);

The domain remains active in the global gpd_list, but its internal resources
are freed, and devm eventually frees the rockchip_pm_domain struct. When the
subsystem later iterates over domains, won't it dereference the freed memory
or the newly dangling pd->resets pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731043507.1832=
277-1-gahing@gahingwoo.com?part=3D3
