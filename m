Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C0A44E02C
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628336; cv=none; b=jgpcO7/CSR6BMLtTJyfedNN5k/sNm2PGfMQqGrRSyu+4zbAB1Z6Kq5ZcTVvGOACULFAbmSOJq2+9erMlWlCPhtxJs+hbjauhSY4JsvFJ6OUaF2OdhZPcre4foVyj3BzZepNZ4z4bG2+XKX6RJej32dXuwd+pm76FVq91e2nZOHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628336; c=relaxed/simple;
	bh=EfqonCMf2vHOldAItQBU+QJk7JZ/RZ62003/mz2u5gA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s6jrMNow2ShLzMXvugwuPBoDbcbYxWlBOyLgLjBNxEznFUXrN2Kn9SDVrnFKZ/aKkcVFlS+7kS+eGSrHrZxGnDCczjHqlXV398AgNd5PUXey6x9+9xNWnHUQKLBQCkKAPIcH7Gac4QkDrWGLnYKBrg1jeKZVPKkpGHIJ5ro8U/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CXg9ZSbz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CXg9ZSbz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B9DD1F00A3A;
	Tue, 21 Jul 2026 10:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784628335;
	bh=dV5QoTRwhjHyRYz1G+SJp2x+eWKK8db3uIxcnt1HVIk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CXg9ZSbzZgomCejLWE6rRWQwLUb4VwRjc6Y47cwkbMNw2G0t5uqDBTUuHHNuIWlcH
	 rGhLPtNPp5pFuix5lGoRshZHjEBk0xgjgkpmjn+7S2gXyea/meDm/wVPQYUmlfbdda
	 NE+qND6N0eNmKF7rvGw3/9KsQBbAmRgrpDGPX9SHHoiRvfJNyUi3OYt+jcS0steuOt
	 8zZQgwKi4FeGTJA2hcoR3L4MOKaV6rqCAMvpEKLY/1gswongmnwiIyIbX9IkhzFowa
	 qwWTYrHqjWNI6XyvljWDG/6Gnhyt4wXWZNHyeLc85rENth04B9jHY3OeUb8HkyBnOj
	 zGeZ/GBz04diA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 18/18] clk: mediatek: Add MT8189 ufs clock support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260720-mt8189-clocks-system-base-v3-18-8e6d99ab3ad2@collabora.com>
References: <20260720-mt8189-clocks-system-base-v3-0-8e6d99ab3ad2@collabora.com>
 <20260720-mt8189-clocks-system-base-v3-18-8e6d99ab3ad2@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 10:05:34 +0000
Message-Id: <20260721100535.3B9DD1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing `of_clk_del_provider()` in the probe error path leads to a=
 Use-After-Free on `clk_data`.
--

--- Patch [18]: [PATCH v3 18/18] clk: mediatek: Add MT8189 ufs clock suppor=
t ---
commit 3f4a4ae78ea13a3a95925571f6bdf7f9cc1c1ea8
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

clk: mediatek: Add MT8189 ufs clock support

Add support for the MT8189 ufs clock controller, which provides clock gate
control for Universal Flash Storage.

> diff --git a/drivers/clk/mediatek/clk-mt8189-ufs.c b/drivers/clk/mediatek=
/clk-mt8189-ufs.c
> new file mode 100644
> index 0000000000000..85afab04420f8
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-ufs.c

[ ... ]

> +static const struct of_device_id of_match_clk_mt8189_ufs[] =3D {
> +	{ .compatible =3D "mediatek,mt8189-ufscfg-ao", .data =3D &ufscfg_ao_reg=
_mcd },
> +	{ .compatible =3D "mediatek,mt8189-ufscfg-pdn", .data =3D &ufscfg_pdn_r=
eg_mcd },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, of_match_clk_mt8189_ufs);
> +
> +static struct platform_driver clk_mt8189_ufs_drv =3D {
> +	.probe =3D mtk_clk_simple_probe,

[Severity: High]
This is a pre-existing issue, but by using mtk_clk_simple_probe() with a
reset descriptor (ufscfg_ao_rst_desc and ufscfg_pdn_rst_desc), this driver
exposes a missing cleanup step in the error handling path.

If mtk_register_reset_controller_with_dev() fails inside
__mtk_clk_simple_probe(), it jumps to the unregister_clks label:

drivers/clk/mediatek/clk-mtk.c:__mtk_clk_simple_probe() {
    ...
        r =3D mtk_register_reset_controller_with_dev(&pdev->dev,
                                                   mcd->rst_desc);
        if (r)
                goto unregister_clks;
    ...
unregister_clks:
        if (mcd->clks)
                mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data=
);
free_data:
        mtk_free_clk_data(clk_data);
        return r;
}

Since of_clk_add_hw_provider() was called earlier in the probe sequence,
jumping to unregister_clks frees the clk_data structure without calling
of_clk_del_provider().

Could this leave a dangling pointer in the OF clock provider list, resulting
in a use-after-free on subsequent clock lookups?

> +	.remove =3D mtk_clk_simple_remove,
> +	.driver =3D {
> +		.name =3D "clk-mt8189-ufs",
> +		.of_match_table =3D of_match_clk_mt8189_ufs,
> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-mt8189-clo=
cks-system-base-v3-0-8e6d99ab3ad2@collabora.com?part=3D18
