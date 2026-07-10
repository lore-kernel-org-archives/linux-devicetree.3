Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CE92ECE86
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 15:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783696152; cv=none; b=GBO8gASm4UJ1ChYMcgLI+9SZGqcv8C5Yp2Coh09A+scmewZQDP7ZYJf6Dk0IRGwNhMSDEDMRMwTY/cDA65jgveJwLnMlrOn6GryDIivC7SgBwta18gQTX3pr8j1/qn66PGUoOdQ7HVv+v8hfUUeBq4bVZjqZS2D3jKgiKVROyZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783696152; c=relaxed/simple;
	bh=yJr2jP7KNiwZ5pCk95Q53gopYjymYWGtWsz0LqgL4wU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kIA5OL3KNAuEr6b1B+i/MPYSQYWisw0WMR5Q0eydvWhLdMkaNWhK3ZuUqRgYyNIp1vfQtIFNQGNt8RoeoF3vdCpwlDDuEieeOv+zzsQGVE7OwFHlJqnRr0Jy4V9XJNn2IScN2bp1ZgiMant4hY3Ai59nNsX8PKg76wuqodEwfPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hNC+M9cp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hNC+M9cp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3FA51F01559;
	Fri, 10 Jul 2026 15:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783696150;
	bh=tRntSqQ1pX/aItXx6Re0D3ZNqlon+aXDvBaaE1gNwwM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hNC+M9cp1VAW5NB58AJjm6Z/AYvBytDTzoE3bLVd5fsR+GWOSa6cvxkTYSz6iWRYy
	 XJXorHNthk+pgwLbBBIWxaCAo3VU0S/d2jliqR9j7JnklmvkFYYGDylpzphceMewyx
	 6ZRk0c1zyRivDxB+2xJlVumR/nLK2Tj6o1VJU9kNJjU2GnlASRkaIOdvbaFtKDqzrO
	 silf5OW/7GmXedSbRHOngmPYKmpxO4OSgNM4WJ+XsNWT5xPTjNYbMmkKz56vIoYvCH
	 GqhaB6aAPIazbacKenDnEofqcoNkFOcX8Bor3fVhH5tChNnqzkxf0rU7VStkW8ZXFU
	 BNG0ErXVejatw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/18] clk: mediatek: Add MT8189 topckgen clock
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709-mt8189-clocks-system-base-v2-10-2926da3db6cf@collabora.com>
References: <20260709-mt8189-clocks-system-base-v2-0-2926da3db6cf@collabora.com>
 <20260709-mt8189-clocks-system-base-v2-10-2926da3db6cf@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 15:09:09 +0000
Message-Id: <20260710150909.C3FA51F01559@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free in the clock notifier unregistration path on driver=
 removal.
--

--- Patch [10]: [PATCH v2 10/18] clk: mediatek: Add MT8189 topckgen clock s=
upport ---
commit 5d23b090dfc84556b649dbc1711e28c8f0b06604
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

clk: mediatek: Add MT8189 topckgen clock support

Add support for the MT8189 topckgen clock controller, which provides
muxes and dividers for clock selection in other IP blocks.

> diff --git a/drivers/clk/mediatek/clk-mt8189-topckgen.c b/drivers/clk/med=
iatek/clk-mt8189-topckgen.c
> new file mode 100644
> index 0000000000000..2473b617e9d62
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-topckgen.c

[ ... ]

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

[ ... ]

> +static struct platform_driver clk_mt8189_topck_drv =3D {
> +	.probe =3D mtk_clk_simple_probe,
> +	.remove =3D mtk_clk_simple_remove,

[Severity: High]
This is a pre-existing issue, but does combining
devm_mtk_clk_mux_notifier_register() with mtk_clk_simple_remove() lead to a
use-after-free on driver unbind?

When the driver is unbound, the .remove callback (mtk_clk_simple_remove) is
executed first, which manually unregisters and frees the clocks.

After .remove completes, the devres framework executes its teardown routine=
s.
This triggers the release of the notifier registered via
devm_mtk_clk_mux_notifier_register(), causing clk_notifier_unregister() to =
be
called with the already-freed clk pointer.

Can this sequence cause memory corruption when the freed clock pointer is
dereferenced?

> +	.driver =3D {
> +		.name =3D "clk-mt8189-topck",
> +		.of_match_table =3D of_match_clk_mt8189_topck,
> +	},
> +};
> +module_platform_driver(clk_mt8189_topck_drv);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-mt8189-clo=
cks-system-base-v2-0-2926da3db6cf@collabora.com?part=3D10
