Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3210B15A864
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 18:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781807578; cv=none; b=K+2My7xGM9CwYJyLc7WM8jauCtm9c/qQDC9cjaoy0W1hLkgPuhs3WphT+OIPpaxBMV2BFlck/SNHVYV0NZKVVd/3WASTpXQosEYAA8A6x92jed26ufx75v5Py4yQGk1Vdhr7k3R+wz/yo5Y2fGfFCBRz/N5eUTVyQorlQ+27AJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781807578; c=relaxed/simple;
	bh=7Dn4397+vh5q9vb8eEuxNCbYfnAvvwl/S9GGwfS9/zA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E4sR9AjO1EkZzZm07WzJoSrbl1aF2qe5dB0GRX6j698KEzHoVqO1LHkjX8cWZeLc9PxdFvYrEeDvKk/olE+n0uFIf4YI9vYdTsm3EJKfrqYvRc2vWLq/UZI/HyKQsxVndwrPl56H7I/vVERdFRxqFs5iW39h4mreLr1IthOxANc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AR9zjQvw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AR9zjQvw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D7691F000E9;
	Thu, 18 Jun 2026 18:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781807576;
	bh=QZ0XdQ6czzh24zr7FWSNxDdAjXdm4guBSpdZbgZ3q5k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AR9zjQvwFKF5BCyTp5FzI0w9+YtkFQxAH3nGPTDuxa5WFNhtY06CDFlKuKR7VAk6b
	 peMTC9jq5jCBVQhF6ljF+lkue4VDOB6P8Wyoz61LZlsH2jUj3LGo2oUynDYmMquzXw
	 s4r2o/EPemjKIEhJ3rH5yBEPbBrnQjOI6WpqPxeVTUkSABv4Ebmt96o+8cjBsZz6IL
	 spAQCUnURapCIxNiVQelaIza4VKI6Kl/RSP8dpq6zh+QS5xi7Y2kn9K6IcUq4ysV/n
	 OIYv3lQ3KRnI/1dEi8He5hmTAnIifJ5LWXgv8z7YaUV/WscRfZEANAa1w0nVeU2vkQ
	 Ipb4T8Vh3N6CA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/5] clk: renesas: r9a09g077: Add LCDC and PLL3 clock
 support for RZ/T2H display pipeline
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: robh@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260618181949.3036280-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260618181949.3036280-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 18:32:56 +0000
Message-Id: <20260618183256.8D7691F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The `.determine_rate` callbacks unlawfully mutate internal driver =
state and break clock encapsulation, violating Common Clock Framework (CCF)=
 semantics.
- [High] Kernel panic due to divide-by-zero in `r9a09g077_cpg_pll3_clk_reca=
lc_rate` if the bootloader leaves the PLL uninitialized.
- [High] Unchecked return values from CCF parent resolution functions lead =
to a kernel panic via NULL pointer dereference.
- [Medium] Passing `unsigned long req->rate` to `mul_u32_u32()` causes sile=
nt 32-bit truncation on 64-bit platforms.
--

commit 1caebb13201d322aab2b2dd055d26412e4129ce0
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

clk: renesas: r9a09g077: Add LCDC and PLL3 clock support for RZ/T2H display=
 pipeline

This commit adds clock definitions and PLL logic for the LCDC blocks on the
RZ/T2H SoC. It introduces a new PLL clock type, implementing rate
recalculation, programming, and locking sequences for PLL3. It also exposes
the LCDC core and module clocks to enable display pipeline integration.

diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a0=
9g077-cpg.c
--- a/drivers/clk/renesas/r9a09g077-cpg.c
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -577,6 +577,276 @@ r9a09g077_cpg_fselxspi_div_clk_register(struct device=
 *dev,
> +static unsigned long r9a09g077_cpg_pll3_clk_recalc_rate(struct clk_hw *h=
w,
> +							unsigned long parent_rate)
> +{
[ ... ]
> +	ctr0 =3D readl(CPG_PLL3_VCO_CTR0(pll_clk->reg));
> +	ctr1 =3D readl(CPG_PLL3_VCO_CTR1(pll_clk->reg));
> +
> +	pdiv =3D FIELD_GET(CPG_PLL3_VCO_CTR0_PDIV, ctr0);
[ ... ]
> +	return DIV_ROUND_CLOSEST_ULL(rate, pdiv);

[Severity: High]
Does this code risk a divide-by-zero if the bootloader leaves the PLL
uninitialized?

If the clock controller block is in a standby state, the register might read
as 0, making pdiv 0. Unconditionally dividing by pdiv via
DIV_ROUND_CLOSEST_ULL() without validation would trigger a fatal kernel
divide-by-zero exception during the clock probe phase.

> +}
> +
> +static int r9a09g077_cpg_pll3_determine_rate(struct clk_hw *hw,
> +					     struct clk_rate_request *req)
> +{
> +	struct pll_clk *pll_clk =3D to_pll(hw);
> +	u64 rate_millihz;
> +
> +	if (req->rate =3D=3D pll_clk->cur_rate)
> +		return 0;
> +
> +	rate_millihz =3D mul_u32_u32(req->rate, MILLI);

[Severity: Medium]
Will this silently truncate req->rate to 32 bits on 64-bit platforms?

mul_u32_u32() accepts 32-bit integers, but req->rate is an unsigned long
(which is 64-bit on architectures like ARM64). If a consumer requests a very
high rate, such as using clk_round_rate(clk, ULONG_MAX) to find the maximum
possible supported rate, the argument will be silently truncated to its
lower 32 bits before multiplication.

> +	if (!rzv2h_cpg_get_pll_pars(pll_clk->limits, &pll_clk->pll_parameters,
> +				    rate_millihz)) {
[ ... ]
> +	}
> +	req->rate =3D DIV_ROUND_CLOSEST_ULL(pll_clk->pll_parameters.freq_millih=
z, MILLI);
> +	pll_clk->cur_rate =3D req->rate;

[Severity: High]
Is it safe to mutate internal driver state like pll_clk->cur_rate and
pll_clk->pll_parameters during a read-only rate query?

Common Clock Framework semantics strictly require .determine_rate() callbac=
ks
to be side-effect free, as they are used by the framework for speculative
evaluations (e.g., clk_round_rate()).

> +
> +	return 0;
> +}
> +
> +static int r9a09g077_cpg_pll3_set_rate(struct clk_hw *hw, unsigned long =
rate,
> +				       unsigned long parent_rate)
> +{
> +	struct pll_clk *pll_clk =3D to_pll(hw);
> +	struct rzv2h_pll_pars *params =3D &pll_clk->pll_parameters;

[Severity: High]
Does this code ignore the passed rate argument and program the hardware
using the cached pll_parameters?

Because .determine_rate() mutates driver-internal state, if the framework
evaluates multiple rates before applying one, the hardware will be programm=
ed
with incorrect values from previous speculative checks.

[ ... ]
> +static int r9a09g077_cpg_lcdc_div_determine_rate(struct clk_hw *hw,
> +						 struct clk_rate_request *req)
> +{
> +	struct r9a09g077_lcdc_div_clk *dsi_div =3D to_lcdc_div_clk(hw);
> +	struct clk_hw *mux_hw =3D clk_hw_get_parent(hw);
[ ... ]
> +	/* index 1 is always .pll3 in sel_clk_pll3[] */
> +	pll_clk =3D to_pll(clk_hw_get_parent_by_index(mux_hw, 1));

[Severity: High]
Can mux_hw be NULL if the current clock is an orphan?

clk_hw_get_parent(hw) can return NULL during intermediate setup phases or
if a parent fails to register. Passing a potentially NULL mux_hw to
clk_hw_get_parent_by_index() unconditionally dereferences hw->core internal=
ly,
causing a kernel panic.

Furthermore, if clk_hw_get_parent_by_index itself returns NULL, to_pll()
performs unsafe pointer arithmetic yielding an invalid address that leads
to a crash later.

[ ... ]
> +	freq_millihz =3D mul_u32_u32(req->rate, MILLI);

[Severity: Medium]
Will this silently truncate the 64-bit req->rate to 32 bits on 64-bit
platforms, similar to r9a09g077_cpg_pll3_determine_rate()?

[ ... ]
> +	req->rate =3D DIV_ROUND_CLOSEST_ULL(dsi_params.div.freq_millihz, MILLI);
> +	req->best_parent_rate =3D req->rate * dsi_params.div.divider_value;
> +	dsi_div->divider =3D dsi_params.div.divider_value;
> +	pll_clk->cur_rate =3D req->best_parent_rate;
> +	pll_clk->pll_parameters =3D dsi_params.pll;

[Severity: High]
Is it safe to mutate internal driver state during this read-only query?

This function mutates both dsi_div->divider and its grandparent PLL3's cach=
ed
parameters (pll_clk->cur_rate and pll_clk->pll_parameters) during a
speculative rate evaluation.

> +
> +	return 0;
> +}
> +
> +static int r9a09g077_cpg_lcdc_div_set_rate(struct clk_hw *hw,
> +					   unsigned long rate,
> +					   unsigned long parent_rate)
> +{
> +	struct r9a09g077_lcdc_div_clk *dsi_div =3D to_lcdc_div_clk(hw);
> +	const struct clk_div_table *clkt;
> +	bool divider_found =3D false;
> +	u32 val, shift;
> +
> +	for (clkt =3D dsi_div->dtable; clkt->div; clkt++) {
> +		if (clkt->div =3D=3D dsi_div->divider) {

[Severity: High]
Does this code rely on the mutated dsi_div->divider state instead of
recalculating the divider from the passed rate argument?

If the Common Clock Framework evaluates multiple rates before applying one,
the divider will hold an incorrect value from the last speculative check.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618181949.3036=
280-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D5
