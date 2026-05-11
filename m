Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F153E309EFF
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 23:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778541672; cv=none; b=kynYyIrHnPrm7sXDiPDd76ZEznlmbkrULULR578814ej5CkHqhfRwWJN7wZ7wiY2vq3zAezm2A7shwB2kP6HWYnMa5F2YUuXDHLTKlc6UrUdXq3nlSrBcJC9tNXs1ftry2plFi0cBNUBRepIq4xtur6FBFSruDtVYRtJQb1lR/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778541672; c=relaxed/simple;
	bh=3lBpjv4JFIqHiodEsuW+s7C/1EcyVv3QthmAU2JgTZc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AOQ8Rz38y3nk80lAzig5Pv1NItMvYQpIuzUZpeiLiuvUM5vAhb+goFlHh64GoC3JKuVlaUbk1CuKfaqY9pc61b4xnWGXfi5baWtQ/jzvLULSl7qkkAHIELN1v1ATbmObRkoV+YJF2vY3AvGhkSQayZxwZt26QOr60imgzVPzQdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rjbWuO9e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rjbWuO9e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D492C2BCB0;
	Mon, 11 May 2026 23:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778541671;
	bh=3lBpjv4JFIqHiodEsuW+s7C/1EcyVv3QthmAU2JgTZc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=rjbWuO9eFC4+tW+xk6zbH3eed2GJggcZWsU+pR3qh+ObI4CRNDsTQQZpw/+qqQApY
	 QIIwmcalqZG38cG8prwB/4UrHCBzFnmHOD8oHxN3SxCCKphYIRt25otLDj8rKB9XkA
	 rGf23wAJJ1xo47IHP240zbZOr2AbXBma5EHAJWzSPp2AN1Q5Su81bUj91tDZ0pgNAX
	 KexXSPaL/zitUwXSNuQOJsO9CAcjtTPKQ/CwyBKLTNF8S8A7fr3esyAPEkBMabbmgI
	 Hg2hvUyk1iAGRp7qizidR4R8ix1ErEIVdXdoh9UOWZ6TuPtNdETb5/c6JmH2AQL4pk
	 s8Y9aJjc1vM9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 4/4] clk: zte: Introduce a driver for zx297520v3
 LSP clocks and resets.
Reply-To: sashiko@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260511-zx29clk-v2-4-29f0edc300f5@gmail.com>
References: <20260511-zx29clk-v2-4-29f0edc300f5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 23:21:10 +0000
Message-Id: <20260511232111.3D492C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Incorrect error handling for devm_platform_ioremap_resource() caus=
es invalid pointer dereference.
- [High] Missing OF clock provider unregistration causes a Use-After-Free.
- [High] PCLK and WCLK gating shift bits are swapped in the LSP_CLOCK macro.
- [Low] Redundant clock request for "pclk" wastes devres memory.
- [Low] Missing dev_err_probe() for parent clock retrieval.
--

commit 88e590e877696d0919c5c18ec90ab5d2e639c959
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

clk: zte: Introduce a driver for zx297520v3 LSP clocks and resets.

This commit introduces a new clock and reset driver for the ZTE
zx297520v3 low speed peripherals (LSP) block, which includes UART,
timers, watchdogs, I2C, SPI, and other proprietary controllers.

> diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297=
520v3.c
> index d4b683cb63544..05b02c8f266be 100644
> --- a/drivers/clk/zte/clk-zx297520v3.c
> +++ b/drivers/clk/zte/clk-zx297520v3.c
[ ... ]
> +/* LSP clock entries have a common pattern: Bit 0 for PCLK, Bit 1 for WC=
LK. Bit 4 (and sometimes
> + * more) for WCLK mux.
[ ... ]
> +#define LSP_CLOCK(offset, name, mux, div_shift, div_size) {\
> +		ZX297520V3_##name##_RESET, ZX297520V3_##name##_WCLK, ZX297520V3_##name=
##_PCLK,\
> +		#name, offset, 8, offset, 0, 1, "lsp_pclk", offset, 4, 4, mux, ARRAY_S=
IZE(mux),\
> +		offset, div_shift, div_size, 0}

The comment above states 'Bit 0 for PCLK, Bit 1 for WCLK'.

Based on the struct layout:

struct zx297520v3_composite {
    ...
    u32 gate_reg, wclk_gate_shift, pclk_gate_shift;
    ...
}

The macro assigns 0 to wclk_gate_shift and 1 to pclk_gate_shift. Are the ga=
ting
shift bits for the peripheral and work clocks swapped here, preventing the
hardware clocks from being enabled correctly?

[ ... ]
> +static int zx297520_lspclk_probe(struct platform_device *pdev)
> +{
> +	static const char * const parent_names[] =3D { "mpll_d5", "mpll_d4", "m=
pll_d6", "mpll_d8",
> +						     "mpll_d12", "osc26m", "osc32k", "pclk" };
> +
> +	struct zx29_clk_controller *lsp;
[ ... ]
> +	lsp->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	WARN_ON(!lsp->base);

Does this correctly handle the error return value?

devm_platform_ioremap_resource() returns an ERR_PTR on failure, not NULL. W=
ill
this check evaluate to false for an error pointer, causing an invalid point=
er
dereference when lsp->base is used later in zx297520v3_composite()?

> +
> +	/* TODO: Technically we can disable the pclk if all LSP devices are shu=
t down, but that
> +	 * needs custom clk ops to tiptoe around a disabled LSP pclk before att=
empting to access
> +	 * the actual clock. In normal operation it is unlikely that all LSP de=
vices are shut down
> +	 * simultaneously though as UART and NAND are located here.
> +	 */
> +	parent =3D devm_clk_get_enabled(dev, "pclk");
> +	if (IS_ERR(parent)) {
> +		dev_err(dev, "failed to find lsp pclk\n");
> +		return PTR_ERR(parent);
> +	}
> +
> +	for (i =3D 0; i < ARRAY_SIZE(parent_names); ++i) {
> +		parent =3D devm_clk_get(dev, parent_names[i]);

This isn't a bug, but pclk was already requested and enabled earlier via
devm_clk_get_enabled().

Since pclk is also included in the parent_names array, it will be requested=
 a
second time here. Is it intended to take a second devres reference to this
clock?

> +		if (IS_ERR(parent)) {
> +			dev_err(dev, "failed to find lsp %s clock\n", parent_names[i]);

Since devm_clk_get() can return -EPROBE_DEFER if a parent clock is not yet
initialized, will using dev_err() here spam the kernel log during normal pr=
obe
deferral?

Would dev_err_probe() be a better fit to silently handle deferrals?

> +			return PTR_ERR(parent);
> +		}
> +	}
> +
> +	res =3D zx297520v3_composite(dev, lsp->base, lsp->clocks, lsp->resets,
> +				 lsp_clocks, ARRAY_SIZE(lsp_clocks));
> +	if (res)
> +		return res;
> +
> +	res =3D of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get, lsp=
->clocks);
> +	if (res)
> +		return res;
> +
> +	lsp->rcdev.owner =3D THIS_MODULE;
> +	lsp->rcdev.nr_resets =3D ZX297520V3_LSPRST_END;
> +	lsp->rcdev.ops =3D &zx297520v3_rst_ops;
> +	lsp->rcdev.of_node =3D dev->of_node;
> +	return devm_reset_controller_register(dev, &lsp->rcdev);
> +}

If devm_reset_controller_register() fails, or if the driver is unbound late=
r,
does this leave a dangling pointer in the common clock framework?

The lsp->clocks array is managed by devres and will be freed, but the clock
provider registered with of_clk_add_hw_provider() is not automatically
unregistered.

Would using devm_of_clk_add_hw_provider() or adding an error path and a .re=
move
callback prevent a potential use-after-free when another device attempts to
access the clock?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-zx29clk-v2=
-0-29f0edc300f5@gmail.com?part=3D4
