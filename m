Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA3B17A309
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 09:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587781; cv=none; b=h5wbcD4qO5UA5smNTbSO7MF7ED9BVC7m1bOwJDzY1mUn91GB1RbJA08iZxYVwv7F6tiIzUJWe0z6GrGNgYD3PzmXkwi+Cm2odWViSECilEFRVXvpdv9T9wUtPKwn9VsR6tTMUFiDAOcBzkZy4BYNf72Fw76GZS3416PpcScb1HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587781; c=relaxed/simple;
	bh=jKODCUAtN5KhMnz1ZNmmVPGd//JxHyvPKRqwn261wGU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N9Kud9mymlMLZxdv61j9PJV1AaSDXNF4DVf1tRYk1bX4KzMoAYVIh7pDvbmzJRDW+eRnMQuuzivuqev3n4aZv/HncaU/olYuA21S4MwtrZ3tsku21Oifu4zJzz1aiz6ieQ4YdWALkwVWScjnOmV+OrW6fqByTb/UesWOfyoiIbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wd3zWTMh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wd3zWTMh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48D5C1F000E9;
	Thu,  9 Jul 2026 09:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587779;
	bh=DAhdLMw9XO1Mz5Zu4xbRE3NYdCYyTOPOtGn8gnjsgZY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wd3zWTMhy857gHQOrQRI1twC6AskYASpevQiVOXSyT5UPtlWzeIYDJX9h19DKFdl6
	 r35fF/YPjXj30JEJZmSOKct4aB3P48NRq0EzdliqS/V3DcUGVEEGFqB+iwsi/r0voK
	 L3gNwm1G/TLr4gFbwE1HojZE2HifNJXfBeNWiwgtHrfmNEprMnYVjNioeOxlWRxLCm
	 1Bi4sTgvY3VYV5a7Ch3IDDa0jKRRi7X8u++lMjjBSrEOFCgs9M2qAROJpkVmsSByaD
	 jprvKbK04fqzv2TcMCEO2Q/PIzbmE+bIThGqfgCpok0qmRdG93xF8LTYFpqKIiSLhD
	 evd+ybyjH3bJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/5] pmdomain: mediatek: Respect PD relationships
 during error cleanup
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260709084635.24912-4-angelogioacchino.delregno@collabora.com>
References: <20260709084635.24912-1-angelogioacchino.delregno@collabora.com>
 <20260709084635.24912-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 09:02:58 +0000
Message-Id: <20260709090259.48D5C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unbalanced clock and regulator disables during error cleanup for d=
omains with MTK_SCPD_KEEP_DEFAULT_OFF.
--

--- Patch [3]: [PATCH v3 3/5] pmdomain: mediatek: Respect PD relationships =
during error cleanup ---
commit 197bd2fa3c14c60d9b5f2423843880328e47fbc9
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: pmdomain: mediatek: Respect PD relationships during error cleanup

In case any probe error occurs (usually, a probe deferral) the
power domains shall be cleaned up while respecting their child
to parent relationship, or the system may freeze.

> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomai=
n/mediatek/mtk-pm-domains.c
> index f0a6339affd75..8d49d9ee3cd29 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c

[ ... ]

> @@ -1017,14 +1020,16 @@ static void scpsys_remove_one_domain(struct scpsy=
s_domain *pd)
>  	clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
>  }
> =20
> -static void scpsys_domain_cleanup(struct scpsys *scpsys)
> +static void scpsys_domain_cleanup(struct scpsys *scpsys, u8 *domains_idx=
, u8 num_probed)
>  {
>  	struct generic_pm_domain *genpd;
>  	struct scpsys_domain *pd;
>  	int i;
> =20
> -	for (i =3D scpsys->pd_data.num_domains - 1; i >=3D 0; i--) {
> -		genpd =3D scpsys->pd_data.domains[i];
> +	for (i =3D num_probed - 1; i >=3D 0; i--) {
> +		u8 pd_idx =3D domains_idx[i];
> +
> +		genpd =3D scpsys->pd_data.domains[pd_idx];
>  		if (genpd) {
>  			pd =3D to_scpsys_domain(genpd);
>  			scpsys_remove_one_domain(pd);

[Severity: High]
This is a pre-existing issue, but does the error cleanup path cause unbalan=
ced
clock and regulator disables for default-off domains?

In scpsys_add_one_domain(), if a domain is configured with
MTK_SCPD_KEEP_DEFAULT_OFF, it intentionally skips turning on the domain,
meaning clk_bulk_prepare_enable() and scpsys_regulator_enable() are never
called by the driver during initialization.

However, if a probe deferral occurs later in scpsys_probe(), this cleanup p=
ath
calls scpsys_remove_one_domain(). If the domain was left ON by the bootload=
er,
scpsys_remove_one_domain() unconditionally invokes the internal power-off
functions:

drivers/pmdomain/mediatek/mtk-pm-domains.c:scpsys_remove_one_domain() {
    ...
    if (scpsys->soc_data->type =3D=3D SCPSYS_MTCMOS_TYPE_HW_VOTER) {
        if (scpsys_hwv_domain_is_enable_done(pd))
            scpsys_hwv_power_off_internal(pd);
    } else {
        if (scpsys_domain_is_on(pd))
            scpsys_power_off_internal(pd);
    }
    ...
}

Since the driver never successfully enabled these resources, will these
unconditional power off calls decrement their usage counts below zero,
potentially leading to kernel warnings or system crashes from unintentional=
ly
disabling shared clocks or regulators?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709084635.2491=
2-1-angelogioacchino.delregno@collabora.com?part=3D3
