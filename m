Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EB33EC6BF
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 09:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785144565; cv=none; b=MxBn5j1yEL3ZchLHllnqdpZbuKhE5jBcAZydab56WImaQYgu7C2CZfwU5MP8U0oAH1xgAAUNEAxjVVxaQYx1fK7C4Ibgh9Bp3NrheBoHTKefxgsUtRzcH7UcU5bDPbVuyBLRPXMdVJv9HsF3ixmNNkcrgavOSMMFnoL1bQ4WF3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785144565; c=relaxed/simple;
	bh=qNFqreD8PMLI8beDvR3qNk8DYT+3cayWyfyd0Si8YmA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Esh4vgSDASrqlHprRPtqDHS8iH4vpo9+J6N9BxLPNAlC8nb9LPUkQDp3sILYZvQ9Gl5JCNfC2txX7gzXAe81ZsozmQdLPAEAgcpoNtslDWEhi0YuTbAt2hdmjBL7Vvl2xlN7REK6GXveEbxJ1y4INYoYBKT4PXSrQRtMIOeHR5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oVjmNhKP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oVjmNhKP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB4E61F000E9;
	Mon, 27 Jul 2026 09:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785144564;
	bh=rhrg8umYyEU0zIFbi4moZGfUGw17qdz3LIsVQ3AKmNc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oVjmNhKPkMX4Q+mu6qBpysn2+qtITFA/QP6tgt1szjwv11hiktqLKC30jETV114kw
	 6p0G8sPdYxmwXfC4BB5Tdtz0LapW5L63SOweO1tSF/YMMjW3c0dqN9DLuZyzgCviEE
	 niNou/zbFMXhBAFm0aL7ObJs6/j7oIZeRxn1QUlQ4WMal+59u03LicES/nz68H15Ae
	 DTUCG2QASeWIezgL0BKmaY4hIyAstNxOF0gLNbnLSzperRUuH/O0QQzbnKPsvSnD/H
	 hZpmG1+V6k192CY6TZlfP5oIbqxV5gcNY+copnqZKe3Wjlzt5TLO7Rr1Z6P/QYD55z
	 lcdFnkHlxe36g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/5] clk: mediatek: Add mt8173-mfgtop driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20260727091555.1023910-3-wenst@chromium.org>
References: <20260727091555.1023910-1-wenst@chromium.org>
 <20260727091555.1023910-3-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 09:29:23 +0000
Message-Id: <20260727092923.CB4E61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Using asynchronous pm_runtime_put() in the probe error path races =
with devres pm_runtime_disable(), leaving the parent power domain permanent=
ly active.
- [Medium] Selecting PM_GENERIC_DOMAINS_OF without inheriting its OF depend=
ency causes a Kconfig unmet direct dependency warning.
- [Medium] The OF node reference for the parent power domain is leaked when=
 the driver is removed.
--

--- Patch [2]: [PATCH v3 2/5] clk: mediatek: Add mt8173-mfgtop driver ---
commit 508299c34f75893862a63235dcb101d72591479d
Author: Chen-Yu Tsai <wenst@chromium.org>

clk: mediatek: Add mt8173-mfgtop driver

The MFG (GPU) block on the MT8173 has a small glue layer, named MFG_TOP
in the datasheet, that contains clock gates, some power sequence signal
delays, and other unknown registers that get toggled when the GPU is
powered on.

> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -537,6 +537,16 @@ config COMMON_CLK_MT8173_IMGSYS
>  	help
>  	  This driver supports MediaTek MT8173 imgsys clocks.
> =20
> +config COMMON_CLK_MT8173_MFGTOP
> +	tristate "Clock and power driver for MediaTek MT8173 mfgtop"
> +	depends on COMMON_CLK_MT8173
> +	depends on PM
> +	default COMMON_CLK_MT8173
> +	select PM_GENERIC_DOMAINS
> +	select PM_GENERIC_DOMAINS_OF

[Severity: Medium]
Will this select cause an unmet dependency warning? Since
PM_GENERIC_DOMAINS_OF depends on OF, but COMMON_CLK_MT8173_MFGTOP
doesn't explicitly depend on OF, selecting it could force it on even
when its OF dependency isn't met (e.g., during COMPILE_TEST builds
without OF).

[ ... ]

> diff --git a/drivers/clk/mediatek/clk-mt8173-mfgtop.c b/drivers/clk/media=
tek/clk-mt8173-mfgtop.c
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8173-mfgtop.c
[ ... ]
> +static int clk_mt8173_mfgtop_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	data->child_pd.np =3D node;
> +	data->child_pd.args_count =3D 0;
> +	ret =3D of_parse_phandle_with_args(node, "power-domains", "#power-domai=
n-cells", 0,
> +					 &data->parent_pd);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to parse power domain\n");
[ ... ]
> +put_26m_clk:
> +	clk_put(data->clk_26m);
> +unregister_clks:
> +	mtk_clk_unregister_gates(mfg_clks, ARRAY_SIZE(mfg_clks), data->clk_data=
);
> +put_pm_runtime:
> +	pm_runtime_put(dev);

[Severity: High]
Could this asynchronous pm_runtime_put() leave the device in an incorrect
power state if the probe fails?=20

When probe returns an error, devres will call pm_runtime_disable() which
synchronously cancels any pending async suspend requests. Because the
suspend is cancelled, the device would remain in the RPM_ACTIVE state,
which may cause dev_pm_domain_detach() to fail with -EAGAIN. Should
this use pm_runtime_put_sync() instead?

> +put_of_node:
> +	of_node_put(data->parent_pd.np);
> +	return ret;
> +}
> +
> +static void clk_mt8173_mfgtop_remove(struct platform_device *pdev)
> +{
> +	struct mt8173_mfgtop_data *data =3D platform_get_drvdata(pdev);
> +	struct device_node *node =3D pdev->dev.of_node;
> +
> +	of_genpd_remove_subdomain(&data->parent_pd, &data->child_pd);
> +	of_genpd_del_provider(node);
> +	pm_genpd_remove(&data->genpd);
> +	of_clk_del_provider(node);
> +	clk_put(data->clk_26m);
> +	mtk_clk_unregister_gates(mfg_clks, ARRAY_SIZE(mfg_clks), data->clk_data=
);

[Severity: Medium]
Does this code leak the OF node reference?

In clk_mt8173_mfgtop_probe(), of_parse_phandle_with_args() acquires a
reference to the parent power domain OF node (data->parent_pd.np).
While this reference is released in the probe error paths, it doesn't
appear to be released here in the remove function. Should there be an
of_node_put(data->parent_pd.np) call here?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727091555.1023=
910-1-wenst@chromium.org?part=3D2
