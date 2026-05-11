Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A78C3D3B3
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778540370; cv=none; b=npNKYyMENgLxDrR6UpdxU+MviLm06I+nlD2u5cUzSvrUV92gkUKTcTLnAioS+ntdIYVm7ZhMr89foZCsbKm6QC34sLOE4Pohzjl9uJcbUmH/jdVfUI6wrWF5r1n8MUgC/Is0y3BpYE6+yQSTIoo+b5Jrlelct0Z42nmZTN3XcGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778540370; c=relaxed/simple;
	bh=PWZZij8CJYmcsxvonQWwD4ibz2I2WDm3iney5Vrwmvw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lPAWhVJJOroeM1YuX2vsMNq3HUW0ts72+D4LHsDv1tqs1xwBlodPFuFNtcj8Q6ta3juOgNAZveVK7st+hbc2KAEvkpRZ25MTYwKZyuLgbItAuFo6/3Iu6HviCOLRaOgW8geHlyzeXr94Gy9e/vE9e1RjgZO2S2IuvUBgQnU5cz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E/p1R/YB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E/p1R/YB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB39BC2BCB0;
	Mon, 11 May 2026 22:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778540370;
	bh=PWZZij8CJYmcsxvonQWwD4ibz2I2WDm3iney5Vrwmvw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=E/p1R/YBvYpYnIMsXC3Aw1D2ooTf3EFswv6qE4v0P1qMUWcePC6QocV/3B34uGuOO
	 9pH3fb+8Kgrn0O5ouNvINb3Bne4v1LqJBinuor7qjByoJx2S1kHVFCpBIPhCOK75rR
	 jb277xCA4KXIAI0LvPnwyBUEjik4rNMzE78mnmFmL2JZlB+HXxsvbnfINKBcSgXNUv
	 SArja9rV406tMqPtDOIiwCntOIuVAsIdslwdMHq1EnMImxI+liDxj9Dl7/b7iRZB53
	 QuyDeRXa7+ZUtuM9Jpx9qcFjiXdNeu/E+lbOM+8wI1dMnqxww7l77S4bedltuYP79K
	 v+LFN4QmcgL0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 4/4] clk: zte: Introduce a driver for zx297520v3 LSP
 clocks and resets.
Reply-To: sashiko@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260510-zx29clk-v1-4-e1bacfffe967@gmail.com>
References: <20260510-zx29clk-v1-4-e1bacfffe967@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 22:59:29 +0000
Message-Id: <20260511225929.BB39BC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Incorrect error checking for devm_platform_ioremap_resource() lead=
ing to kernel panic.
- [High] The clock provider is registered without devres, leading to a Use-=
After-Free.
- [High] PCLK and WCLK gate shifts are swapped in the LSP_CLOCK macro.
- [High] Unprotected read-modify-write data race on shared LSP hardware reg=
isters.
- [Low] Incompatible pointer type for parent_names array.
--

commit a23190a3a7795f784d87109b7d775267f0845b7b
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

clk: zte: Introduce a driver for zx297520v3 LSP clocks and resets.

"LSP" is ZTE's term for this part of the SoC, I suspect it stands for
"low speed peripherals". The main UART is here, together with the flash
controller and more surplus proprietary timers.

> diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297=
520v3.c
> index 0c06add433ee9..e69be686c1b1d 100644
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

The comment above states that Bit 0 is for PCLK and Bit 1 is for WCLK.
However, passing 0 and 1 to this macro seems to map to wclk_gate_shift and
pclk_gate_shift in struct zx297520v3_composite.

Does this accidentally assign wclk_gate_shift to 0 and pclk_gate_shift to 1,
swapping the gate controls?

Also, the clock gate, mux, and reset controls are assigned to the exact same
memory offset (a shared 32-bit register).

The clock framework uses reg_lock for read-modify-write operations. Do the
reset controller operations (like zx297520v3_rst_assert) use the same lock?
If they read and write these registers locklessly, could concurrent clock
and reset operations cause a data race resulting in lost writes?

> +static const struct zx297520v3_composite lsp_clocks[] =3D  {
[ ... ]
> +};
> +
> +#undef LSP_CLOCK
> +
> +static int zx297520_lspclk_probe(struct platform_device *pdev)
> +{
> +	static const char * const *parent_names[] =3D { "mpll_d5", "mpll_d4", "=
mpll_d6", "mpll_d8",
> +						      "mpll_d12", "osc26m", "osc32k", "pclk" };

Does this array declaration use an incompatible pointer type?

The array is declared as an array of pointers to const char *, but is
initialized directly with string literals. When parent_names[i] is passed to
devm_clk_get() below, it passes a pointer-to-pointer instead of a string.
This can trigger build errors on compilers like GCC 14.

Should this be declared as static const char * const parent_names[] instead?

> +
> +	struct zx29_clk_controller *lsp;
[ ... ]
> +	lsp->clocks =3D devm_kzalloc(dev, struct_size(lsp->clocks, hws,
> +				   ZX297520V3_LSPCLK_END), GFP_KERNEL);
> +	if (!lsp->clocks)
> +		return -ENOMEM;
> +	lsp->clocks->num =3D ZX297520V3_LSPCLK_END;
> +
> +	lsp->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	WARN_ON(!lsp->base);

Since devm_platform_ioremap_resource() returns an ERR_PTR on failure rather
than NULL, this WARN_ON() will not catch failures because an ERR_PTR
evaluates to true.

If the invalid error pointer is then passed into zx297520v3_composite()
as the base address, will this lead to a kernel panic when read/write
operations occur?

Should this use IS_ERR() and return PTR_ERR() instead?

> +
> +	/* TODO: Technically we can disable the pclk if all LSP devices are shu=
t down, but that
[ ... ]
> +	res =3D zx297520v3_composite(dev, lsp->base, lsp->clocks, lsp->resets,
> +				 lsp_clocks, ARRAY_SIZE(lsp_clocks));
> +	if (res)
> +		return res;
> +
> +	res =3D of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get, lsp=
->clocks);

Since lsp->clocks is allocated using devm_kzalloc(), it will be
automatically freed if devm_reset_controller_register() fails later or if
the driver is unbound.

Because the clock provider is registered with of_clk_add_hw_provider()
instead of the managed devm_of_clk_add_hw_provider(), could the provider
remain registered to the device node after lsp->clocks is freed?

Will this leave a dangling pointer that triggers a use-after-free upon the
next clock lookup?

> +	if (res)
> +		return res;
> +
> +	lsp->rcdev.owner =3D THIS_MODULE;
> +	lsp->rcdev.nr_resets =3D ZX297520V3_LSPRST_END;
> +	lsp->rcdev.ops =3D &zx297520v3_rst_ops;
> +	lsp->rcdev.of_node =3D dev->of_node;
> +	return devm_reset_controller_register(dev, &lsp->rcdev);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-zx29clk-v1=
-0-e1bacfffe967@gmail.com?part=3D4
