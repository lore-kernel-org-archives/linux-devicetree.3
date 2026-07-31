Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423D319E968
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 07:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785483225; cv=none; b=FDXHUgtz5e12fkGX/iVyyYi/q2VQqR5H03XRwLZBia7cyyXhlW0RHv72kpB+6n/i8TTsvEPLuFgmWj6QdLjkvRGZndzd0gREeYO9wXZcGJj8TiDh18lDCYoVrefRh+vsl1hh/uZy5CgjINRmpA9LdbvNz5UOYattYEz8SGNLbrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785483225; c=relaxed/simple;
	bh=uV54C9CSSVCPMVoCAh0jUKtolK9/WDNIeidCKy1DDpw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fwVKD+7YLtVK+dG8Bl8JyBwiYfxtgsH8ptNXr2OSz2J8fAuUlc4j9w0uBoueMEU3TTna/J/Zw3obakwwh/yM9XN3ypSLrwclvKfb/4djVGrLjOLfD+iHTgzzPollWUnNa4MhM4H8dRzYclxeVh+38AqdVOQ0XhDxbhoEkIrC7ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FqRWT7Pz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FqRWT7Pz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9416B1F000E9;
	Fri, 31 Jul 2026 07:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785483223;
	bh=zYqpY02UzaBNb3YtM6Otx8IiBZuxtWC/CFdsdX1xnMc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FqRWT7PziqdXKy8+/vTA6lJkvLWoEFvIjpYzMgOhRZv2dZc1bqdgy125yClOeu2Vq
	 H+H7ry1j5xg9NNXqyFGEKg1W3sOJFxAcjSiaFrLlvyiyeX+lSs0shjgPdQXEOrfN5Y
	 vIsvpI07RpuM3bUSCkvzntVeFOgLwC3bLgekK28aRpmPF59XiNrShAU5d7Jgm4G7ld
	 SievtOL7EWzyzB+mfkCdDbgVQzN4jGPNVxCjl4J5Rr8VSaKs8xoH0AKMImQTDLgSqJ
	 a1TMzT/cT1ytY7NvXFEd72FM96cr/kKgElcMg+zSmxRmIs2Eu2JXW20NDLXKEn6jSE
	 lhWNJdUdXrN4Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/8] clk: clocking-wizard: Fix division by zero and
 unbounded register write
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubhrajyoti Datta" <shubhrajyoti.datta@amd.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260731072049.957624-8-shubhrajyoti.datta@amd.com>
References: <20260731072049.957624-1-shubhrajyoti.datta@amd.com>
 <20260731072049.957624-8-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 07:33:43 +0000
Message-Id: <20260731073343.9416B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Divide-by-zero vulnerabilities remain in multiple callback functio=
ns for rate =3D=3D 0.
- [High] Computed divisor in clk_wzrd_determine_rate() is silently truncate=
d, leading to incorrect clock rates.
- [High] Missing upper bounds check in clk_wzrd_ver_dynamic_reconfig() caus=
es register corruption.
- [High] Missing lower bounds check allows 0 to be written to hardware divi=
sor registers.
- [High] Unchecked large rates cause hardware to be programmed with 0, lead=
ing to divide-by-zero during recalc.
- [High] High atomic latency and preemption stall during dynamic reconfigur=
ation.
--

--- Patch [7]: [PATCH v3 7/8] clk: clocking-wizard: Fix division by zero an=
d unbounded register write ---
commit 5e3507219b53560de47af4a3c5f59ba7a3f31a01
Author: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Subject: clk: clocking-wizard: Fix division by zero and unbounded register =
write

This commit addresses a division by zero in clk_wzrd_determine_rate and
adds checks for zero rates in divisor calculations. It also fixes an
unbounded register write in clk_wzrd_dynamic_reconfig by capturing the
result of the min_t calculation.

> diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xil=
inx/clk-xlnx-clock-wizard.c
> index 4ddcb41353061..b16656a11f4b5 100644
> --- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> +++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> @@ -296,7 +296,7 @@ static int clk_wzrd_dynamic_reconfig(struct clk_hw *h=
w, unsigned long rate,
>  	value =3D DIV_ROUND_CLOSEST(parent_rate, rate);

[Severity: High]
This is a pre-existing issue, but if a consumer requests a clock rate of
0, won't DIV_ROUND_CLOSEST() evaluate a division by zero here?

The patch successfully identifies this issue in clk_wzrd_get_divisors(),
but it appears other callbacks like clk_wzrd_dynamic_reconfig() and
clk_wzrd_ver_dynamic_reconfig() still pass rate directly as a divisor.

[Severity: High]
This is also a pre-existing issue, but does this need a lower bounds check?

If a consumer requests a rate significantly larger than the parent rate,
value evaluates to 0. It bypasses the upper bound and writes 0 directly to
the clock wizard hardware divisor registers.

[Severity: High]
This isn't a bug introduced by this patch, but while you added a cap for
value here, clk_wzrd_ver_dynamic_reconfig() seems to still lack an upper
bounds check.

A small rate there yields a large value, causing the regh variable to
exceed its 8-bit mask and overflow when shifted by WZRD_CLKFBOUT_H_SHIFT,
corrupting adjacent hardware register values.

[Severity: High]
This is a pre-existing issue, but could a similar problem cause a panic
in the fractional clock callbacks?

clk_wzrd_determine_rate_f() is an empty stub that fails to bound req->rate.
As a result, clk_wzrd_dynamic_reconfig_f() can divide by rate, evaluate
to 0, and program a 0 divisor. Later, clk_wzrd_recalc_ratef() reads this 0
from the register and calls mult_frac() with 0 as the divisor, which would
crash the system.

> =20
>  	/* Cap the value to max */
> -	min_t(u32, value, WZRD_DR_MAX_INT_DIV_VALUE);
> +	value =3D min_t(u32, value, WZRD_DR_MAX_INT_DIV_VALUE);

[ ... ]

> @@ -334,6 +334,8 @@ static int clk_wzrd_determine_rate(struct clk_hw *hw,
>  	 * achievable
>  	 */
>  	div =3D DIV_ROUND_CLOSEST(req->best_parent_rate, req->rate);

[Severity: High]
This is a pre-existing issue, but does this still evaluate a division by
zero if req->rate is 0?

[Severity: High]
This is a pre-existing issue, but won't div be silently truncated here?

Since div is declared as a u8 at the top of clk_wzrd_determine_rate(), if
the requested rate yields a divisor of 256 or larger, it truncates. For
example, 256 truncates to 0, and the new if (!div) logic below will
incorrectly force it to 1, returning a massive clock rate.

Should div be declared as a u32 and correctly capped at the hardware limit
instead?

> +	if (!div)
> +		div =3D 1;
> =20
>  	req->rate =3D req->best_parent_rate / div;

[ ... ]

> @@ -348,6 +350,9 @@ static int clk_wzrd_get_divisors_ver(struct clk_hw *h=
w, unsigned long rate,
>  	u32 m, d, o;
>  	u32 mmin, mmax, dmin, dmax, omin, omax;
> =20
> +	if (!rate)
> +		return -EINVAL;
> +

[Severity: High]
This is a pre-existing issue, but does this function cause severe
scheduling latency?

When called from clk_wzrd_dynamic_all_ver() or clk_wzrd_dynamic_all(), an
IRQ-disabled spinlock is held across the nested loops in this function
which run for over 50,000 to 100,000 iterations. Performing this massive
search space with 64-bit integer divisions inside a spin_lock_irqsave()
critical section could stall the CPU for milliseconds.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731072049.9576=
24-1-shubhrajyoti.datta@amd.com?part=3D7
