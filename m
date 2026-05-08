Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338F8313E1D
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 21:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778276511; cv=none; b=GJsGeTS7e/pGqq5x4HtmlUfuZR6wFFhd2XoDVhW2zGcyKozCEUh+dNTjtW9oQerCqjlIyB7ptSPsbTpa+aTB/YWlBL+tjbKN/E7MvfBWrgx4JIVcpPWIbDrDXSZYxjAtLZkHfUBKynEPtuyMkwpfHQ3rCblKFkqpTi7Z11hcnto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778276511; c=relaxed/simple;
	bh=NsNd9/PnD3eIEdkJxOzeyB6Hy/Jney/mw6eClvaG4nc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sJ0W/nL8mx7qhiPloZsrlcMmWNpc5oEQubzYKSr9AKlarCvX0lb+QtayhLpAcmrEs13iLYrlGHRFWGKLROP/vLOYq1SJJ4x+KOW/QLbCDBeLM7jlEfq4iKyXszbAraT4R0XxvMseXKUP47JAVmZw40ZMZDcjt4Spr3pTgNGZwAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GRDqFOdf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GRDqFOdf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6064C2BCB0;
	Fri,  8 May 2026 21:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778276510;
	bh=NsNd9/PnD3eIEdkJxOzeyB6Hy/Jney/mw6eClvaG4nc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=GRDqFOdf6U8HCkD2qDwX77CYlKLUpV9vbAJ+4T6ZyAZNHqVpA6lD34CL+dGyRQyzu
	 Q/eD2BM1gQszSKQjJVQaojAnAG6V2KKI8kpfhn3IvaEQie5uxGfd6U2VeJntuYaMC8
	 CVkRmPdNPtXvFHBauDW/rX2A59FKMwwhapKvrrWkPeKBWDdp6GinwNfmtMl2Z7Cjic
	 L4jNo9mMyclpxFji05qYooyg/vbq8v+yYGP1cbFEW9MAo6DJ14cyR6PjbqDiN5v9Jp
	 9tYw+y9cgpRhmgImlqY/RRiQaZ47rHoLmGRvAvQVUMH8KIKzg7QbeBcTWJVSJJ5yA1
	 4iW7x67mH/cOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 04/10] clk: realtek: Add support for phase locked
 loops (PLLs)
Reply-To: sashiko@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260508111641.3192177-5-eleanor.lin@realtek.com>
References: <20260508111641.3192177-5-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 21:41:50 +0000
Message-Id: <20260508214150.A6064C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] Missing spinlock release and IRQ restore in `clk_pll_recalc_ra=
te()` error path.
- [High] Severe scheduling latency due to up to 2ms delay in atomic context=
 with interrupts disabled.
- [High] `is_power_on()` masks hardware read errors, leading to silent hard=
ware failures.
- [High] Valid register offset `0x0` is treated as 'no register' in `is_pow=
er_on()`.
- [Medium] `clk_pll_determine_rate()` fails to enforce frequency bounds.
--

commit df23b935aa675a5465a9a387a1eecbe47915033e
Author: Cheng-Yu Lee <cylee12@realtek.com>
clk: realtek: Add support for phase locked loops (PLLs)

This commit introduces support for realtek programmable and fixed or
hardware-managed PLLs. It provides operations for programmable PLLs and
a read-only variant for fixed or hardware-managed PLLs.

> diff --git a/drivers/clk/realtek/clk-pll.c b/drivers/clk/realtek/clk-pll.c
> new file mode 100644
> index 0000000000000..b63f3aa92d3f4
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-pll.c

[ ... ]

> +static int wait_freq_ready(struct clk_pll *clkp)
> +{
> +	u32 pollval;
> +
> +	if (!clkp->freq_ready_valid)
> +		return 0;
> +
> +	return regmap_read_poll_timeout_atomic(clkp->clkr.regmap, clkp->freq_re=
ady_reg, pollval,
> +		(pollval & clkp->freq_ready_mask) =3D=3D clkp->freq_ready_val, 1, TIME=
OUT);
> +}

Is a 2000 microsecond (2ms) timeout safe in an atomic context? wait_freq_re=
ady()
is called from clk_pll_enable() and clk_pll_set_rate(), both of which hold=
=20
clkp->lock and disable interrupts via spin_lock_irqsave(). Spinning for 2ms=
=20
with local interrupts disabled could degrade system responsiveness and trig=
ger=20
NMI watchdogs.

Should multi-millisecond hardware waits be moved to sleepable callbacks (li=
ke
.prepare() instead of .enable()) using mutexes?

> +static bool is_power_on(struct clk_pll *clkp)
> +{
> +	u32 val;
> +
> +	if (!clkp->power_reg)
> +		return true;

Does this check inadvertently treat the valid register offset 0x0 as 'no
register'?

In regmap-based MMIO devices, offset 0x0 is a common and valid register add=
ress.
If a PLL maps its power register to offset 0, will the driver skip reading =
it
and incorrectly assume the clock is powered on?

> +
> +	if (regmap_read(clkp->clkr.regmap, clkp->power_reg, &val))
> +		return true;

Does returning true on a regmap_read() error mask hardware read failures?

If this fails, clk_pll_enable() will interpret the clock as already powered
on, skip the seq_power_on sequence, and return success while the hardware
remains unpowered. Could this lead to silent failures and crashes when
dependent drivers access unclocked registers?

> +
> +	return (val & clkp->power_mask) =3D=3D clkp->power_val_on;
> +}

[ ... ]

> +static int clk_pll_determine_rate(struct clk_hw *hw,
> +				  struct clk_rate_request *req)
> +{
> +	struct clk_pll *clkp =3D to_clk_pll(hw);
> +	const struct freq_table *ftblv =3D NULL;
> +
> +	ftblv =3D ftbl_find_by_rate(clkp->freq_tbl, req->rate);
> +	if (!ftblv)
> +		return -EINVAL;
> +
> +	req->rate =3D ftblv->rate;

Does this callback need to enforce frequency bounds?

The determine_rate callback is generally expected to select a valid frequen=
cy
that satisfies req->min_rate <=3D rate <=3D req->max_rate. It looks like th=
e closest
rate is assigned without checking if it falls within the requested bounds.

> +
> +	return 0;
> +}
> +
> +static unsigned long clk_pll_recalc_rate(struct clk_hw *hw,
> +					 unsigned long parent_rate)
> +{
> +	struct clk_pll *clkp =3D to_clk_pll(hw);
> +	const struct freq_table *fv;
> +	unsigned long flags;
> +	u32 freq_val;
> +
> +	spin_lock_irqsave(&clkp->lock, flags);
> +
> +	if (regmap_read(clkp->clkr.regmap, clkp->freq_reg, &freq_val))
> +		return 0;

Is there a missing spin_unlock_irqrestore() in this error path?

If regmap_read() fails, the function returns immediately, leaving the spinl=
ock
acquired and interrupts disabled. Any future attempt to acquire this lock w=
ould
deadlock.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508111641.3192=
177-1-eleanor.lin@realtek.com?part=3D4
