Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EC93D3486
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405935; cv=none; b=icPnsZ4fDR8uNtdFIAZcL1Fos/1j7rjZeTVHC9Uj72yuOaXeXwt/9H6gmZMhwDMspZhtDc8C/rEbrqf2BQ0FNtJWP8gnwbanO1JIEmtUaUK9HO0N0Ix1txjY5xuOPCAxYnIypQ5auUfk57A2g+2ysP2Q0MQtBatDXa304O2c6HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405935; c=relaxed/simple;
	bh=k3ecpC+0DHHNM+qFAUdrThP7j/+DAozYpUbEYDhmz10=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QC5+9a8uoY8Tjwe3xQ3ROmEpCMvM+h0ft8YW6lWCEgi1JzpxNhaoUBNz5VcYRNQs92puw6AfL0qXWMXkD5Y/ZvtKZhf9cqA7ny2afa+Ow4660Heb0AqFPj6CvJvpiW47Hp9bp2XaqaAb8/oHfqm80+xNNckJxqXGEP7Ou1GioSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=btUL8KGc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="btUL8KGc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C2091F000E9;
	Thu, 30 Jul 2026 10:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785405934;
	bh=ubKxIyiAwptL0+jPqFnHlFMLzTKCNU+4YRaNhgIvkDI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=btUL8KGc4HxkIJGBqqm46t7iCStOW17IduJA0zCpgCe2Z3mr+YFf66SWtixLoiLlO
	 MJDwUVLRmeHEiXVnQBnuWBHl69ORhmBoI9C33HNL4DafgYUM2+uA1+W0OXPX1uU+9Y
	 hcyNDebJiaaFi/9+ue4Vywz/WAOMQdHEsE2FgY/sRDsNBRUJDe21mNkgq2avc1S0ES
	 m5/9ezIUK9l99150SpH3y1NisLJXOc5rtO4JrqRQhlCshuzjDkcGiDyPFmXIkTpqUh
	 V8Okj9wdFpfD0vZGHwU8Mw/6M2Oa4Cacz/aA9TuJShZnWqA78XQBoLPuqak9nwyrbZ
	 EwBLonfhLDz+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 16/24] clk: mediatek: Add MT8189 topckgen clock
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260729-mt8189-clocks-system-base-v4-16-e356b813a64c@collabora.com>
References: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
 <20260729-mt8189-clocks-system-base-v4-16-e356b813a64c@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 10:05:33 +0000
Message-Id: <20260730100534.1C2091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free of `struct clk` during probe error path and device =
removal due to asymmetric teardown between devm and manual unregistration.
--

--- Patch [16]: [PATCH v4 16/24] clk: mediatek: Add MT8189 topckgen clock s=
upport ---
commit 1a2a1cefef48aac7c733656cfc07df67d4760fe4
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

clk: mediatek: Add MT8189 topckgen clock support

Add support for the MT8189 topckgen clock controller, which provides
muxes and dividers for clock selection in other IP blocks.

> diff --git a/drivers/clk/mediatek/clk-mt8189-topckgen.c b/drivers/clk/med=
iatek/clk-mt8189-topckgen.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-topckgen.c

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
> +}

[Severity: High]
This is a pre-existing issue, but does using=20
devm_mtk_clk_mux_notifier_register() here introduce a use-after-free during
driver unbinding or probe failure?

If mtk_clk_simple_probe() fails after registering this notifier, or when
the module is removed via mtk_clk_simple_remove(), the manual teardown
functions like mtk_clk_unregister_muxes() execute immediately. This calls
clk_hw_unregister(), which frees the struct clk object.

Later, the driver core initiates devres cleanup and invokes
devm_clk_notifier_release(). This function will call
clk_notifier_unregister() using the already freed clk pointer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-mt8189-clo=
cks-system-base-v4-0-e356b813a64c@collabora.com?part=3D16
