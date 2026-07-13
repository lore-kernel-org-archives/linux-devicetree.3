Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD22DC8EB
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 16:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783960239; cv=none; b=MDktr6ddf67k4oKd+labrNdHTqxIVTmilMP9kO9EANJQvXLSud5aiH+u5F4aPpzUMXOwsb8O/I5o7BJMIUu9fRbnEUnEXZI3nl8U41PteU730G9E8jXee0TzqkRs0dl1TMD+Mx7y+6u/2ohn4uYvFtQB+qpD86Kd2VP0oh/YmYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783960239; c=relaxed/simple;
	bh=i72sKfmb4zGKElQBUTmEy9kxbid0WMZn26uKqgRxMLw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tMtzfmNkuazY8u2/RXPlvMrKSKVUeSQxuvvmRrpIF1ZGxnO40mooHMmwV6mZDOQe6bfn8HDrD44e5Czuyk5lG1tB9MMLTKGU2gF2rjWPJ5q6s9+K5z0CXph21UgMc05lAfL4vXLLHGZCVIunduAfSSZPWOBJaNREoEQdWDUHTCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GthFSqUw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GthFSqUw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F3071F000E9;
	Mon, 13 Jul 2026 16:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783960238;
	bh=VV1R1MSW7XvwKYv3e3Q82Wie4SxRk3sHo9nACKda5EU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GthFSqUw7EI2Je0nFDxFkiJ1SUibSWvez5D6ExzUYqUaQutWY14vfNdLMMEH8z0Ud
	 eYWpWWFQ0unAV/ATHJSZ7vM1HEtDxz9jfUf8nR+kKzVFRL1DZPVBMcxtEUUdHVU6Qg
	 8o59ciKC43seVKco04iLW6D+/AA1B3EYcDTsBwYVbrILC7JPUznPkStbZvU1QHpQzV
	 RHqMTrVxmBbijlOA6TlMu2ZbHOP0bczDx/WsK2MLI8Y0TjsPGWxxYzUuWbaLyYb7jz
	 Ub4RVE6ayN8mQXPAC7GQkofsvp+mgDekh4AX4ATDDfZFF8NpYRnc74VNDuHrjsjIk0
	 erkHf89MBle8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 08/11] clk: realtek: Add support for MMC-tuned PLL
 clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260713155630.3054636-9-eleanor.lin@realtek.com>
References: <20260713155630.3054636-1-eleanor.lin@realtek.com>
 <20260713155630.3054636-9-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 16:30:37 +0000
Message-Id: <20260713163038.1F3071F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] `clk_pll_mmc_determine_rate` and `clk_pll_mmc_set_rate` violate Co=
mmon Clock Framework guarantees by computing mathematically inconsistent ra=
tes and completely ignoring the requested rate.
- [Medium] Integer overflow in `clk_pll_mmc_determine_rate()` causes severe=
ly miscalculated clock rates on 32-bit platforms.
--

--- Patch [8]: [PATCH v10 08/11] clk: realtek: Add support for MMC-tuned PL=
L clocks ---
commit 227763092de853595ae404163ed7dc1dfbbc5558
Author: Cheng-Yu Lee <cylee12@realtek.com>

clk: realtek: Add support for MMC-tuned PLL clocks

Add clk_pll_mmc_ops for enable/disable, prepare, rate control, and status
operations on MMC PLL clocks.

Also add clk_pll_mmc_phase_ops to support phase get/set operations.

> diff --git a/drivers/clk/realtek/clk-pll-mmc.c b/drivers/clk/realtek/clk-=
pll-mmc.c
> new file mode 100644
> index 0000000000000..eefb0da04823d
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-pll-mmc.c

[ ... ]

> +static int clk_pll_mmc_determine_rate(struct clk_hw *hw, struct clk_rate=
_request *req)
> +{
> +	u32 val;
> +
> +	if (!req->best_parent_rate)
> +		return -EINVAL;
> +
> +	val =3D DIV_ROUND_CLOSEST_ULL((u64)req->rate * 4, req->best_parent_rate=
);
> +	val =3D clamp_t(u32, val, PLL_MMC_VAL_MIN, PLL_MMC_VAL_MAX);
> +	req->rate =3D req->best_parent_rate * val / 4;

[Severity: High]
Could this formula contradict the one in clk_pll_mmc_recalc_rate()?

clk_pll_mmc_recalc_rate() uses:

	base =3D parent_rate / 4;
	rate =3D base * (val + 2);
	rate +=3D div_u64(base * ext_f, 8192);

But here in clk_pll_mmc_determine_rate(), it predicts the rate as
(parent_rate * val / 4).

This mathematical inconsistency could cause the clock framework to record
incorrect achievable rates, confusing consumer drivers like the eMMC contro=
ller
that rely on predictable clk_set_rate() and clk_get_rate() behavior.

[Severity: Medium]
Can this multiplication overflow on 32-bit platforms?

req->best_parent_rate is an unsigned long, and val is a u32. On 32-bit
architectures, their product will be truncated to 32 bits before the divisi=
on
by 4, which would result in a severely miscalculated clock rate if the pare=
nt
rate and requested rate are sufficiently high.

> +
> +	return 0;
> +}
> +
> +static int clk_pll_mmc_set_rate(struct clk_hw *hw, unsigned long rate, u=
nsigned long parent_rate)
> +{
> +	struct clk_pll_mmc *clkm =3D to_clk_pll_mmc(hw);
> +	u32 val =3D PLL_MMC_SSC_DIV_N_VAL;
> +	int ret;
> +
> +	/*
> +	 * The 'rate' and 'parent_rate' are intentionally unused here.
> +	 *
> +	 * Despite receiving various rate requests (e.g., 26MHz, 52MHz, 200MHz),
> +	 * this function consistently configures the hardware for 27MHz (0x1b).
> +	 * This is because these settings reflect the input reference clock
> +	 * frequency to the SSCPLL, not the final PLL output frequency.
> +	 *
> +	 * The actual frequency division to achieve the requested eMMC rate
> +	 * is handled internally by the downstream eMMC host controller.
> +	 */

[Severity: High]
Is it expected to completely ignore the requested rate and unconditionally
program hardcoded values here?

Since clk_pll_mmc_determine_rate() calculates a val, but
clk_pll_mmc_set_rate() ignores it and always writes val=3D27 and ext_f=3D15=
17, this
violates Common Clock Framework expectations where clk_set_rate() should
configure the hardware to match the rate negotiated during determine_rate().

> +
> +	ret =3D regmap_update_bits(clkm->clkr.regmap,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713155630.3054=
636-1-eleanor.lin@realtek.com?part=3D8
