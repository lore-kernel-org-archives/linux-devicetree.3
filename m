Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A33480DC0
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 12:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909326; cv=none; b=qMwjm33JhWY64D42nM4kF5Wg0o4NMsM5mxeOw1uZ8BD5Z+q0V/lktaLPOsbk2K7VxbA9V0xbeiG3LyAaeuHlZHQHxvBrCe+P6onOv2NVx11ZhoHmVrwHvPYWCR4FA23AHZqi+Gsk+zGd8Ywqyw4/kJ7L4+kgfLOP5qA+dVVruvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909326; c=relaxed/simple;
	bh=m9OcB9+sP/uQGbkn+xZx7F4mwIuGU2pcbKoW5VyCMoI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lI2sw2lVg4/yzbnmYMJ1WEdvmC0t2i5vOg1gs5p1CmmJjaQSy7aUsV6SfExhYlfH0vYM2sARa5WaTTbv9d+Fxy0upfONuQJ+2DTcXYwRvlUvjOXz3HMhyUrPD5Donuh64tkl11QGFQqodsvlpEXdTEfxo2EgsQYV3hEU1uJRQ24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c64zvmkO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c64zvmkO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C959F1F000E9;
	Wed,  1 Jul 2026 12:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782909325;
	bh=VWTJccjnCSN4pnaWgUK80qLkclOBKuh5lxZ+qC7qrPc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c64zvmkOo6rR2irn4fDdvRHvkujm/1ru+8VGFXnxaHgQ3+0iF/p7b9ea18A8t9BJB
	 FyJnb/aDObrVYHw2A6erqQWTcBJWaaZMmcBySjXA1fXOQ1D9NfuDif73AIC/6dvVWU
	 9Z2j1fWkaSOxyK8U8GItyV7zrjjw9htjR49PnQFJ/UjSSWqjnmad3FNBvM7H0ziLXi
	 L+88uUK1WQwoCObYXDvp1o4isG86yIG/z1jLPDKeYq6XJ+HbKGmJmKgKDxK4vHm22u
	 TbAZGAkKB2regCFtkHXlQoq1ohQ/FVUMEk4TU9lbZOzdtN+dX+u85dDOW/iviXFHvg
	 8Oo3ZiNoPFuWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] pmdomain: mediatek: Respect PD relationships during
 error cleanup
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260701121920.19347-3-angelogioacchino.delregno@collabora.com>
References: <20260701121920.19347-1-angelogioacchino.delregno@collabora.com>
 <20260701121920.19347-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 12:35:24 +0000
Message-Id: <20260701123524.C959F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The return value of pm_genpd_init() is ignored, which leads to a N=
ULL pointer dereference crash during error cleanup if initialization fails.
--

commit 356604344a98472f2a371cddf8d5683735700cda
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

pmdomain: mediatek: Respect PD relationships during error cleanup

This commit allocates a temporary array during probe to track the addition
order of power domains. If an error occurs, it uses this array to clean up
the domains in the exact reverse order, avoiding system freezes.

> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomai=
n/mediatek/mtk-pm-domains.c
> index e1cfd42234734..db543d4b1813c 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
[ ... ]
> @@ -906,6 +907,7 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsy=
s *scpsys, struct device_no
>  	else
>  		pm_genpd_init(&pd->genpd, NULL, false);
> =20
> +	domains_idx[(*num_domains)++] =3D (u8) id;

[Severity: High]
This is a pre-existing issue, but does ignoring the return value of
pm_genpd_init() here lead to a NULL pointer dereference crash during error
cleanup if initialization fails?

If pm_genpd_init() fails (e.g., due to a memory allocation failure), the do=
main
is partially initialized and its gpd_list_node remains zero-initialized.
Because the error isn't caught, the driver still considers the domain
successfully added and tracks it in scpsys->domains.

Later during probe, if an error triggers the cleanup path,
scpsys_domain_cleanup() then invokes scpsys_remove_one_domain() ->
pm_genpd_remove() on this uninitialized domain.

pm_genpd_remove() unconditionally calls list_del(&genpd->gpd_list_node), wh=
ich
attempts to access next->prev on NULL pointers, resulting in a kernel panic.

>  	scpsys->domains[id] =3D &pd->genpd;
> =20
>  	return scpsys->pd_data.domains[id];

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701121920.1934=
7-1-angelogioacchino.delregno@collabora.com?part=3D2
