Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D08A42D763
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628335; cv=none; b=C8oTIpyFO/vDFXN77/ltqFPGidMTssTeljYz++Ch8cv/IWCe6T/Nk9MaYbRw+VX2zQlitsxOi6zWNRnjU4VYl0DFmNRwRsiV5nGYpphe+wYcg4yE7iTLWUaxEt7oBmWCXYApwlWgxWaLPfle7R9WgCFYepj0yNTx7vrYvSkoScg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628335; c=relaxed/simple;
	bh=vjuoKIB6AfAq21FQUvELJo+Md4tC9N1nLZY/BNAVMiQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eZtvp9TfLgAuJWAiPQO88DS/bRdAcIYQ7PxTA+3+zmOeovioVcHpTaIRFb/lMATLVCJuorZfvZOM3NipfJ7Hmfvl/Ust0gzD8yc9Vo4klKmh0aDk6BGYFyZ1a5/tYXkGOGQ2pbBGfUuh1YfSzKowWnqq5vCiHjHKCQFd/GNi4UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/y6BzUM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/y6BzUM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0F461F00A3A;
	Tue, 21 Jul 2026 10:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784628333;
	bh=ee2bE2LqEuuH7uDRXrxkXrcY/EsWPc4GNFc2JYuG9TQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q/y6BzUMJxOCBk6eumMHcroyBzciArM3X3+ZS/ngwR6fzSKF1ZV56CVXgXGyWJ/AY
	 FgOq0ESk+fsxkNgN1CCZPbiwX2w4619v+/CEM24907xKGBu0IQIirRmSXgN3/p2njD
	 5Jial9Szhv86AotKRf9SAunllCIMnovmENA1zomj29x2SNmo4V1j6p3CZClptt8j0F
	 ZrtwgMcePlPjZDq7q0Opp/z+ptCw+SV97SpNisIuGueViZjts6dTFrWcyD98AvVipX
	 wC7nHqWts5FebljzigmbuhzspQc3gUCi2i99tiZ6QDs1U+gCEH/SCv65R0CtaNq/PN
	 9zt/usP3mAE9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 10/18] clk: mediatek: Add MT8189 topckgen clock
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260720-mt8189-clocks-system-base-v3-10-8e6d99ab3ad2@collabora.com>
References: <20260720-mt8189-clocks-system-base-v3-0-8e6d99ab3ad2@collabora.com>
 <20260720-mt8189-clocks-system-base-v3-10-8e6d99ab3ad2@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 10:05:31 +0000
Message-Id: <20260721100532.E0F461F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Teardown asymmetry between manually managed clocks and the devm-ma=
naged clock notifier leads to a Use-After-Free of the clock struct on probe=
 failure or driver removal.
- [Medium] Integer post-dividers (e.g., _d16, _d4_d8) are incorrectly defin=
ed with arbitrary fractional factors (e.g., 61/973, 92/1473, 43/1375) inste=
ad of exact integer division ratios (1/16, 1/32).
--

--- Patch [10]: [PATCH v3 10/18] clk: mediatek: Add MT8189 topckgen clock s=
upport ---
commit c5b259302a4ef0f8df16da71e98a2848bcf8992d
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: clk: mediatek: Add MT8189 topckgen clock support

Add support for the MT8189 topckgen clock controller, which provides
muxes and dividers for clock selection in other IP blocks.

> diff --git a/drivers/clk/mediatek/clk-mt8189-topckgen.c b/drivers/clk/med=
iatek/clk-mt8189-topckgen.c
> new file mode 100644
> index 0000000000000..2473b617e9d62
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-topckgen.c
> @@ -0,0 +1,1025 @@
[ ... ]
> +static const struct mtk_fixed_factor top_divs[] =3D {
> +	FACTOR(CLK_TOP_MAINPLL_D3, "mainpll_d3", "mainpll", 1, 3),
> +	FACTOR(CLK_TOP_MAINPLL_D4, "mainpll_d4", "mainpll", 1, 4),
> +	FACTOR(CLK_TOP_MAINPLL_D4_D2, "mainpll_d4_d2", "mainpll", 1, 8),
> +	FACTOR(CLK_TOP_MAINPLL_D4_D4, "mainpll_d4_d4", "mainpll", 1, 16),
> +	FACTOR(CLK_TOP_MAINPLL_D4_D8, "mainpll_d4_d8", "mainpll", 43, 1375),

[Severity: Medium]
Does this intentionally use an arbitrary fractional factor (43/1375) instead
of the standard integer post-divider ratio (1/32)?

While this might arrive at a specific exact frequency for a static parent r=
ate,
could this break dynamic frequency scaling? If the mainpll frequency change=
s,
applying this fraction instead of an exact 1/32 digital division ratio could
cause the clock framework to calculate incorrect output rates.

I also notice this pattern on other dividers below, such as
CLK_TOP_TVDPLL1_D16 (92/1473) and CLK_TOP_OSC_D16 (61/973).

> +	FACTOR(CLK_TOP_MAINPLL_D5, "mainpll_d5", "mainpll", 1, 5),
[ ... ]
> +/* Register mux notifier for MFG mux */
> +static int clk_mt8189_reg_mfg_mux_notifier(struct device *dev,
> +					   struct clk *clk)
> +{
> +	struct mtk_mux_nb *mfg_mux_nb;
> +
> +	mfg_mux_nb =3D devm_kzalloc(dev, sizeof(*mfg_mux_nb), GFP_KERNEL);
> +	if (!mfg_mux_nb)
> +		return -ENOMEM;
> +
> +	mfg_mux_nb->ops =3D &mtk_mux_clr_set_upd_ops;
> +	mfg_mux_nb->bypass_index =3D 0; /* Bypass to CLK_TOP_MFG_REF_SEL */
> +
> +	return devm_mtk_clk_mux_notifier_register(dev, clk, mfg_mux_nb);

[Severity: High]
Can this teardown asymmetry cause a use-after-free of the clk struct on
probe failure or driver removal?

This registers the notifier using devm_mtk_clk_mux_notifier_register(), whi=
ch
queues up a devres cleanup action to automatically call
clk_notifier_unregister().=20

However, if probe fails or the driver is removed, mtk_clk_simple_probe()
and mtk_clk_simple_remove() explicitly unregister the clocks. This calls
mtk_clk_unregister_muxes() -> clk_hw_unregister() -> clk_unregister(),
which frees the struct clk pointer.

By the time the devres actions are executed and clk_notifier_unregister() is
called, the struct clk pointer is already freed, leading to a dereference of
the freed pointer when modifying its notifier_count.

> +}
> +
> +static const struct mtk_clk_desc topck_desc =3D {
> +	.factor_clks =3D top_divs,
> +	.num_factor_clks =3D ARRAY_SIZE(top_divs),
> +	.mux_clks =3D top_muxes,
> +	.num_mux_clks =3D ARRAY_SIZE(top_muxes),
> +	.composite_clks =3D top_composites,
> +	.num_composite_clks =3D ARRAY_SIZE(top_composites),
> +	.clks =3D top_clks,
> +	.num_clks =3D ARRAY_SIZE(top_clks),
> +	.clk_notifier_func =3D clk_mt8189_reg_mfg_mux_notifier,
> +	.mfg_clk_idx =3D CLK_TOP_MFG_SEL_MFGPLL,
> +	.clk_lock =3D &mt8189_clk_lock,
> +};
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-mt8189-clo=
cks-system-base-v3-0-8e6d99ab3ad2@collabora.com?part=3D10
