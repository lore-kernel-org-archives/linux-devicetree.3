Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B723EDACC
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 09:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587821; cv=none; b=OvKzt3t1rb8+qeCaAmpcZWkAi/1XkisGhbahFypVD9MQhYSOrxzOlM8K9ikv2br8klUV6ASCLaLaiZEP/yzMbAYupX2m+f+fhB5v+w8EsTIkLOKMbqPeZBvn/5skXJ4GAcfqiF6qLW8bvjbTdEdoxIgBiigv7t4ys+3CbENMek0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587821; c=relaxed/simple;
	bh=Zl72qEz8Au9Wve3syQWjDvysrFKXDH5Fj7tPMKlB97g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uTcYTkrc3zCUX8ZxKb8mA1TW9UJeWvNyJnc6lP08wTuTPa78ckKin/Y6q9UlYcDdRSj/YxvgwZxmVZ7E8zeIz8vV1FlX4WQcf7kXjOObmaTFgyt60zC5SWenIqip3CbliAK8fDAMXh/1bnckblRP9ZaWlZhX8pr/sRoWn9uHwQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bnn2Rn1V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bnn2Rn1V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34CA71F000E9;
	Thu,  9 Jul 2026 09:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587819;
	bh=1nnfAmMEwJ5SPq/YjAF6W0+XHyhL4GvlqR44a2mBP1k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bnn2Rn1VnciLJqhjS/o5b1A/KqsJ73dfcYkdj9N5TSrw22hy9AV5rc9O5rGhpWi4C
	 1VPKfWjTsCfWlOr/vEqrdghkcn0xZ4e2ENmYotm6UPJmKtkRtNA2GkCZfJK+66/hrP
	 WYDh/77/J5d7cSzdRT/Uv2QKbV0r9NhdBfFZw4J5sEaV5kcWuz4sxKosFt62/iapf9
	 YwY04L97x56mpyCGtMCeh7nwuydmqTPZFQeCNf33y7vKv4435gu9m9RbLUuOHNK/5i
	 1nsD31lc/5Ppguw1w0gR/bq80JwB/6BIWct1qMVp/R3eI5I7IAc3yWsJPiYC+Y2r3c
	 Q31IKkMETPsnQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/5] pmdomain: mediatek: Fix possible nullptr KP in
 HWV cleanup/on-check
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260709084635.24912-3-angelogioacchino.delregno@collabora.com>
References: <20260709084635.24912-1-angelogioacchino.delregno@collabora.com>
 <20260709084635.24912-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 09:03:38 +0000
Message-Id: <20260709090339.34CA71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Sleeping in atomic context in HW_VOTER power domain callbacks
- [High] Use-After-Free during probe error cleanup due to incorrect teardow=
n order
- [High] Unbalanced clock and regulator disable during error cleanup for do=
mains initialized with MTK_SCPD_KEEP_DEFAULT_OFF
--

--- Patch [2]: [PATCH v3 2/5] pmdomain: mediatek: Fix possible nullptr KP i=
n HWV cleanup/on-check ---
commit 6f66af4cf25683016b57cc9dd8c70be44004a959
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: pmdomain: mediatek: Fix possible nullptr KP in HWV cleanup/on-check

This commit fixes a possible NULL pointer dereference in the cleanup and
on-check paths for HW_VOTER type power domains during probe failure. It che=
cks
the MTCMOS type and calls the appropriate functions for checking status and
powering off.

> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomai=
n/mediatek/mtk-pm-domains.c
> index e1cfd42234734..f0a6339affd75 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -393,9 +393,8 @@ static int scpsys_hwv_power_on(struct generic_pm_doma=
in *genpd)
>  	return ret;
>  };
> =20
> -static int scpsys_hwv_power_off(struct generic_pm_domain *genpd)
> +static int scpsys_hwv_power_off_internal(struct scpsys_domain *pd)
>  {

[Severity: High]
This isn't a bug introduced by this patch, but can calling sleeping functio=
ns
here cause a kernel panic due to scheduling while atomic?

The driver sets GENPD_FLAG_IRQ_SAFE for HWV domains in scpsys_add_one_domai=
n().
This causes the genpd framework to acquire a spinlock and disable interrupts
before calling scpsys_hwv_power_off() and scpsys_hwv_power_on().

However, these functions then call sleeping functions like
clk_bulk_prepare_enable() and scpsys_regulator_enable(), which would trigger
a scheduling while atomic BUG.

> -	struct scpsys_domain *pd =3D container_of(genpd, struct scpsys_domain, =
genpd);
>  	const struct scpsys_hwv_domain_data *hwv =3D pd->hwv_data;
>  	struct scpsys *scpsys =3D pd->scpsys;

[ ... ]

> @@ -973,6 +992,7 @@ static int scpsys_add_subdomain(struct scpsys *scpsys=
, struct device_node *paren
> =20
>  static void scpsys_remove_one_domain(struct scpsys_domain *pd)
>  {
> +	struct scpsys *scpsys =3D pd->scpsys;
>  	int ret;
> =20
>  	/*
> @@ -984,8 +1004,14 @@ static void scpsys_remove_one_domain(struct scpsys_=
domain *pd)
>  		dev_err(pd->scpsys->dev,
>  			"failed to remove domain '%s' : %d - state may be inconsistent\n",
>  			pd->genpd.name, ret);

[Severity: High]
This is a pre-existing issue, but does ignoring this failure leave a dangli=
ng
pointer and cause a use-after-free?

During a probe error, scpsys_domain_cleanup() loops backwards by ID to tear
down domains. If the DT topology places a parent domain at a higher reg ind=
ex
than its child, the loop will attempt to remove the parent first.

When this happens, pm_genpd_remove() will fail with -EBUSY because the child
is still linked (the driver doesn't explicitly unlink subdomains first).
Because the error is ignored here, devres will eventually free the
struct scpsys_domain memory while the domain is still linked in the global
gpd_list.

> -	if (scpsys_domain_is_on(pd))
> -		scpsys_power_off(&pd->genpd);
> +
> +	if (scpsys->soc_data->type =3D=3D SCPSYS_MTCMOS_TYPE_HW_VOTER) {
> +		if (scpsys_hwv_domain_is_enable_done(pd))
> +			scpsys_hwv_power_off_internal(pd);
> +	} else {
> +		if (scpsys_domain_is_on(pd))
> +			scpsys_power_off_internal(pd);
> +	}

[Severity: High]
This isn't a bug introduced by this patch, but could this underflow the clo=
ck
and regulator refcounts during error cleanup?

For domains with MTK_SCPD_KEEP_DEFAULT_OFF, the driver skips calling power_=
on()
during initialization in scpsys_add_one_domain(). This means clocks and
regulators are never prepared or enabled by the driver.

If probe fails and the hardware was left ON by the bootloader, this check s=
ees
the hardware is on and forcibly calls scpsys_hwv_power_off_internal() or
scpsys_power_off_internal(). This will unconditionally disable the clocks a=
nd
regulators, underflowing the refcounts for resources the driver never acqui=
red.

> =20
>  	clk_bulk_put(pd->num_clks, pd->clks);
>  	clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709084635.2491=
2-1-angelogioacchino.delregno@collabora.com?part=3D2
