Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443FC3D16EF
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405936; cv=none; b=oCdIXUS/jOnNPlvk5Fu0cPRBdreipx3n1m36Hk3BonMH/+NkX9ye6uKqtMoyroW7WinBS7EgcnsUH3agi+tCezT2+ZdefZQn/gTeNXTzH1c66D2jTl/qvDWAfOwkNXVhSUSrGwLzQf32nJJBPlEKzjdvIBzG8c5qPV82AnwAd/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405936; c=relaxed/simple;
	bh=3860ngiMkGQ/P8mVkX92CwEwLrVukyOzZC2wblkwsn4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nhsQ2qfPEuUJJT8Zivyvnau1FjjtHo0ayJCXvleLLNpo1SnJCdmp8SB73b3P+Z7AVSLwuos0+lF/dhUk0/vohxSnN/bpXOXZgb7gYh7gtUiXnpOn2aVoFEzTaABgKVMdpwGraggKzn5C9W+0PjA82sdwcPRgj/57i/rU+wuaRzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iuDGAlh+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iuDGAlh+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE4EA1F00A3A;
	Thu, 30 Jul 2026 10:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785405935;
	bh=Z/QsGkqDD0KDUSh1QTFAM1jVQWIap5royB5p0E3adY4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iuDGAlh+/beE3cGfatpNcgYgJoXsv6hGSKs7oWroytbzmbYuCGXVC8ZBWxW4Eilpc
	 /A/MinbpI5WqibwQ+lLvoM87cZ+4xcIXwiLVYYMJne0oBqOxznU4CsnocIicuEnZi/
	 O7zTaJIt4+6SOT65pJ4sowGJg1SoD94SZF/O22QH23KbrAXatJkCeJ6gzMJd3Jbw1v
	 nSWiziMnqKV4ZWikDJdfqdSgCPWK60aZWyz/LIn2FJmcyWAKmVYIosJD6hN1Hm0BNJ
	 1Sore8QtPqG2q7+oTH0Lf8KhQLzMSh/gLZAzYj4Mz4ofyhqCB7LwEKoKbqUnPC9fii
	 nGBeJ4xPddSNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 24/24] clk: mediatek: Add MT8189 ufs clock support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260729-mt8189-clocks-system-base-v4-24-e356b813a64c@collabora.com>
References: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
 <20260729-mt8189-clocks-system-base-v4-24-e356b813a64c@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 10:05:34 +0000
Message-Id: <20260730100534.DE4EA1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing `of_clk_del_provider()` in the error path of `__mtk_clk_si=
mple_probe()` when reset controller registration fails, leading to a Use-Af=
ter-Free.
--

--- Patch [24]: [PATCH v4 24/24] clk: mediatek: Add MT8189 ufs clock suppor=
t ---
commit 73843c3d7b6ae3d2d34edc45116556bb9d3c1e8b
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

clk: mediatek: Add MT8189 ufs clock support

Add support for the MT8189 ufs clock controller, which provides clock
gate control for Universal Flash Storage.

> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-ufs.c

[ ... ]

> +static const struct mtk_clk_desc ufscfg_ao_reg_mcd =3D {
> +	.clks =3D ufscfg_ao_reg_clks,
> +	.num_clks =3D ARRAY_SIZE(ufscfg_ao_reg_clks),
> +	.rst_desc =3D &ufscfg_ao_rst_desc,
> +};

[ ... ]

> +static struct platform_driver clk_mt8189_ufs_drv =3D {
> +	.probe =3D mtk_clk_simple_probe,
> +	.remove =3D mtk_clk_simple_remove,
> +	.driver =3D {
> +		.name =3D "clk-mt8189-ufs",
> +		.of_match_table =3D of_match_clk_mt8189_ufs,
> +	},
> +};

[Severity: High]
This isn't a bug introduced by this patch, but since this new driver uses
mtk_clk_simple_probe() and registers a reset controller (rst_desc), it
exposes a pre-existing issue in the error handling path of
__mtk_clk_simple_probe().

If mtk_register_reset_controller_with_dev() fails, the code jumps to
unregister_clks:

drivers/clk/mediatek/clk-mtk.c:__mtk_clk_simple_probe() {
    ...
    if (mcd->rst_desc) {
        r =3D mtk_register_reset_controller_with_dev(&pdev->dev,
                                                   mcd->rst_desc);
        if (r)
            goto unregister_clks;
    }
    ...
unregister_clks:
    ...
free_data:
    mtk_free_clk_data(clk_data);
}

Does this cleanup path leave a dangling pointer in the OF clock provider li=
st?

It appears to free clk_data but fails to call of_clk_del_provider() to remo=
ve
the successfully registered clock provider.

If another driver attempts to look up a clock via the device tree after
probe failure, could of_clk_hw_onecell_get() dereference the freed clk_data
and cause a use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-mt8189-clo=
cks-system-base-v4-0-e356b813a64c@collabora.com?part=3D24
