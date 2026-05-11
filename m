Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D41383337
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778538848; cv=none; b=WY5hYEpwDgKJ+E61datoNfTV/p7UhBAUpeeTtOBdja+cKlXZimHshbolQc4iuBTTAlByjGeqiGqkG5lLi4CUqpiX9rqTBNHF3bsPXdkN39hAVSzNWpzwLTgHcRcmMDUQEmg4xTj/vKE0vD3du3RP7CdweOsnCAM6MG2gm1So0tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778538848; c=relaxed/simple;
	bh=pMnzZBA+4au+bwNqaXc97scwcb090BWa9uUmKmeXq9M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qE9wvsPm6tBsefIruHhfIc/qxKFLmfLvYsVja7TQXbOxsCnZsAkiqZfhcjliDF8rkvCjlJyVNQEgmIlGSnOHaN3IeYrFtyezi80hR3cseqhqpEBqcDNoZ9Yn7m72G3daD7CZBZZgaYBQ5lNEzr8486jMGAmfYy7rZkq7RRBNs4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hkq2swrt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hkq2swrt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62EDBC2BCB0;
	Mon, 11 May 2026 22:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778538847;
	bh=pMnzZBA+4au+bwNqaXc97scwcb090BWa9uUmKmeXq9M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Hkq2swrtAlJyg0PwpvVnF5ar7c5w3zp4C4oxIy2Ci/IuQdSBFernftZ2AvC2qKOn7
	 WXdRIdgwKAPPPHnCbaLzFM1FgSsaSHVKh8H7bBXzQlXEaidkkQCN6tJ3aHlNWV2cM/
	 Afb2LKj+jqvRsAiUDBCNPHCJym4ivM7mcQDGTHGgL9hP73BND0mlQ7lMtgtWwFJj9w
	 MaS9+HWafM6TTP9DUU6AOtzbXpqJrlR6/7VHgkDcIVISzgWl3oZWVf+HUbxLmH65SX
	 6aXE9mNjClWDlJOqu4VYu/pJ8q+JVALvnktgJ4B+tznZv1xqhbNcOjd1zGgvKcqrZW
	 /OKFa1cR5/47g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 3/4] clk: zte: Introduce a driver for zx297520v3
 matrix clocks and resets.
Reply-To: sashiko@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260510-zx29clk-v1-3-e1bacfffe967@gmail.com>
References: <20260510-zx29clk-v1-3-e1bacfffe967@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 22:34:06 +0000
Message-Id: <20260511223407.62EDBC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] Incorrect error checking for `devm_platform_ioremap_resource()` re=
turn value leads to an invalid pointer dereference.
- [High] The critical `PDCFG` clock shares mux register bits with `EDCP` an=
d defines an invalid mux parent size.
- [High] Missing cleanup for OF clock provider causes a use-after-free on p=
robe failure or module unbind.
- [High] Error codes from clock registration are masked by a hardcoded `-EN=
ODEV`, breaking deferred probing.
- [High] Reset assert and deassert operations perform read-modify-write on =
shared hardware registers without holding locks.
- [Medium] Duplicate DT index mapping for `ZX297520V3_GMAC_RMII` overwrites=
 clock provider array data.
- [Medium] Unchecked return value from `devm_clk_hw_register_mux()` for `td=
m_mux`.
- [Low] Multiple `module_platform_driver()` macros in a single file cause a=
 build error.
- [Low] Unacceptable use of `#if 0` blocks to store dead code.
--

commit 2a00ceb112a3ae2f6a880753c5234263bae84bcf
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>
Date:   Sun May 10 19:01:02 2026 +0000

    clk: zte: Introduce a driver for zx297520v3 matrix clocks and resets.
   =20
    This controls the CPU, DSP, DDR RAM, ethernet, SDIO controllers and a
    few more devices. It also contains a number of clock gates to pass
    clock signals down to the next controller.

> diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297=
520v3.c
> index f73f5c006641f..0c06add433ee9 100644
> --- a/drivers/clk/zte/clk-zx297520v3.c
> +++ b/drivers/clk/zte/clk-zx297520v3.c
[ ... ]
> @@ -579,6 +579,219 @@ static struct platform_driver clk_zx297520v3_topclk=
 =3D {
>  };
>  module_platform_driver(clk_zx297520v3_topclk);
> =20
[ ... ]
> +static const struct zx297520v3_composite matrix_clocks[] =3D {
[ ... ]
> +	ZX_CLK(EDCP,        0x68,  0,  0x64,  2,  1, 0x50, 16, 2, edcp_sel,    =
0,     0, 0),
> +	/* PDCFG. Like PMM, either clock bit will allow the device to function.=
 */
> +	ZX_CLK_CRIT(PDCFG,  0x94, 20,  0x88,  0,  1, 0x50, 16, 2, clk_unknown, =
0,     0, 0),

Can changing the rate or parent of the EDCP clock inadvertently modify the =
PDCFG
parent? Both clocks appear to share the same mux register and shift
(0x50, 16, 2).

Since PDCFG is a critical clock with only a single parent (clk_unknown), wo=
uld
it be safer to use 0, 0, 0 for its mux registers to prevent it from being
accidentally disabled?

[ ... ]
> +static const struct zx297520v3_gate matrix_gates[] =3D {
[ ... ]
> +	{ZX297520V3_GMAC_PCLK,	"gmac_pclk",		"gpll_d4",	0x110,	  0},
> +	{ZX297520V3_GMAC_RMII,	"gmac_rmii",		"gpll_d4",	0x110,	  1},
> +	{ZX297520V3_GMAC_RMII,	"gmac_wclk",		"gmac_rmii",	0x110,	  2},

Does this unintentionally assign the identical ID ZX297520V3_GMAC_RMII to b=
oth
gmac_rmii and gmac_wclk?

During registration, gmac_wclk might silently overwrite gmac_rmii in the
clocks->hws array, making the first clock inaccessible via direct DT provid=
er
lookup.

[ ... ]
> +	/* This code is commented out until the next patch because disabling un=
used clocks without
> +	 * an LSP consumer breaks the UART.
> +	 */
> +#if 0
> +	{ZX297520V3_LSP_MPLL_D5_WCLK,	"lsp_mpll_d5",	"mpll_d5",	0x7c,	  0},
> +	{ZX297520V3_LSP_MPLL_D4_WCLK,	"lsp_mpll_d4",	"mpll_d4",	0x7c,	  1},
[ ... ]
> +	{ZX297520V3_LSP_DPLL_D4_WCLK,	"lsp_dpll_d4",	"dpll_d4",	0x7c,	  9},
> +#endif
> +};

Is it strictly necessary to include this block of code inside an #if 0 bloc=
k?
Usually, code is removed entirely until it is fully functional to adhere to
mainline coding standards.

> +
> +static int zx297520_matrixclk_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	matrix->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	WARN_ON(!matrix->base);

Does this correctly handle failure? devm_platform_ioremap_resource() return=
s an
error pointer like -EINVAL on failure, not NULL.

A WARN_ON(!matrix->base) would evaluate to false, allowing the code to cont=
inue
and subsequently dereference an invalid pointer. Should this check
IS_ERR(matrix->base) instead?

> +
> +	/* One stray mux: The TDM mux is in matrixclk and it is passed to the L=
SP controller. In a
> +	 * way the link gate (LSP_TDM_WCLK) could be considered a matching gate=
, but there is no
> +	 * reset and no pclk.
> +	 */
> +	hw =3D devm_clk_hw_register_mux(dev, "tdm_mux", tdm_sel, ARRAY_SIZE(tdm=
_sel), 0,
> +				      matrix->base + 0x50, 24, 2, 0, &reg_lock);

Is it intentional to ignore the return value of devm_clk_hw_register_mux()?

If this registration fails and returns an error pointer, the error is never
checked, which might silently break clocks depending on tdm_mux as a parent.

[ ... ]
> +	for (i =3D 0; i < ZX297520V3_MATRIXCLK_END; i++) {
> +		if (IS_ERR(matrix->clocks->hws[i])) {
> +			pr_err("zx297520 clk %d: register failed with %ld\n",
> +				i, PTR_ERR(matrix->clocks->hws[i]));
> +			return -ENODEV;
> +		}
> +	}

Will returning a hardcoded -ENODEV break deferred probing?

If a required parent clock is not yet available, masking the actual error c=
ode
from PTR_ERR() prevents -EPROBE_DEFER from propagating to the driver core,
causing the probe to fail permanently.

> +
> +	res =3D of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get, mat=
rix->clocks);
> +	if (res)
> +		return res;

Could this leak the provider registration or cause a use-after-free on probe
failure?

If the subsequent call to devm_reset_controller_register() fails, the
devm-managed matrix->clocks will be freed, but the global OF provider remai=
ns
registered since of_clk_add_hw_provider() doesn't tie cleanup to the driver=
's
lifecycle.

Would devm_of_clk_add_hw_provider() be better suited here?

[ ... ]
> +static struct platform_driver clk_zx297520v3_matrixclk =3D {
> +	.probe =3D zx297520_matrixclk_probe,
> +	.driver =3D {
> +		.name =3D "clk-zx297520v3-matrixclk",
> +		.of_match_table =3D of_match_zx297520v3_matrixclk,
> +	},
> +};
> +module_platform_driver(clk_zx297520v3_matrixclk);

Since module_platform_driver(clk_zx297520v3_topclk) already exists earlier =
in
this file, does adding another module_platform_driver() here cause a build
error?

The macro expands to module_init() and module_exit(), and using it more than
once typically causes a redefinition failure when compiled as a loadable mo=
dule.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-zx29clk-v1=
-0-e1bacfffe967@gmail.com?part=3D3
