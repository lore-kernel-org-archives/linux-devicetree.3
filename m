Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CC23563F6
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 22:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780008089; cv=none; b=GVPA1VEgJJFHL2RvSsUUB/pZxOC6toUlRm7YumFEzj3ORQsjo9QXvlYL8kQkvgMFabdudUbH8gb+jaJ4GdP9/8OJ6D2c6eMAluEHNIHmQIzro1rZiXg3P2bfMnL1ekxdfy/X4rI4aWkXQHgEoeDpj+l298bFDvMq1fYTdkdpW7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780008089; c=relaxed/simple;
	bh=DUuDAx/OiYCkhbGfBlTdDDBjfV/R439zUDmaZ/huDR0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=beoJlD828QcJXs791wRxCwe2VfUxV5HDeO9x7vRDL7XiZjb8MmCzN6zygZkbnQxYDO5bEbXoTv5z6q84IU1zVzgiecxDlN4wSbXOZCoYGpNoduhndyFTBzWDzEgyjsA6bnmemgefC2J0qjaYqEDfcbZ6Cd4kuIkWNA7oDUPDOT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jwhvbjFG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jwhvbjFG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 435421F000E9;
	Thu, 28 May 2026 22:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780008087;
	bh=C51zQ7piqtCStePpCIS7xvJ62l6MMZSGPEQEeNHyyIo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jwhvbjFG+DKbWfiwtbLVH5rqHNQeMv3mTUC9EqVBnrsLhoAqRbbBZ/tvSwD/aWtHb
	 poSbbMyTPicidaYGl4ZxgfGLUPZEHw7agumiFYLpYEqM8KAb5gQRI+NmfMU83OW8PS
	 GwrrFMedndOwaytk3BY5MToPpxMkfAao9dbMwSn4pDgZncwRHWea4ZULQ3cBIwY3ex
	 mwB+zGSfLg8AJLz1r6U8lIY54VN3qi71WLTiDBRjttS2CXyvH0Cz5eHNPW3uVQ1eJk
	 V4LtCS3UfDWcouCTOvKDZvXFi0kCJQrih8PrMeVvOQXK0Z7r8i9w3OJSS8QNp312wD
	 kJHhfqG303QCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 3/5] clk: zte: Introduce a driver for zx297520v3
 top clocks and resets.
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260529-zx29clk-v3-3-c7fe54ea388f@gmail.com>
References: <20260529-zx29clk-v3-3-c7fe54ea388f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 22:41:26 +0000
Message-Id: <20260528224127.435421F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Calling a sleeping function `readl_poll_timeout` while holding a s=
pinlock with interrupts disabled.
- [High] `determine_rate` callback fails to update `req->rate`, breaking cl=
ock rate negotiation.
- [High] Missing spinlock protection for shared PLL registers leads to conc=
urrent read-modify-write corruption.
- [High] Inverted logic in the reset controller `.status` callback.
- [High] Multiple paths lead to a division by zero kernel panic during PLL =
rate calculations.
- [Medium] Holding a spinlock with interrupts disabled across a 100us delay.
- [Low] Makefile dependency prevents COMPILE_TEST builds on non-ZTE archite=
ctures.
--

commit 762483ab5f3f25d2d8b51f77a303caa010237fbd
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

clk: zte: Introduce a driver for zx297520v3 top clocks and resets.

This patch introduces a clock and reset controller driver for the
ZTE zx297520v3 SoC, handling core devices like PLLs, timers, and USB.

> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> [ ... ]
> @@ -167,5 +167,6 @@ ifeq ($(CONFIG_COMMON_CLK), y)
>  obj-$(CONFIG_X86)			+=3D x86/
>  endif
>  obj-y					+=3D xilinx/
> +obj-$(CONFIG_ARCH_ZTE)			+=3D zte/

[Severity: Low]
Will this obj-$(CONFIG_ARCH_ZTE) prevent COMPILE_TEST builds from
traversing into the zte/ directory when CONFIG_ARCH_ZTE is not set?

> --- /dev/null
> +++ b/drivers/clk/zte/clk-zx297520v3.c
> @@ -0,0 +1,775 @@
> [ ... ]
> +static int __zx297520v3_rst_deassert(struct reset_controller_dev *rcdev,=
 unsigned long id)
> +{
> +	struct zx29_clk_controller *data =3D container_of(rcdev, struct zx29_cl=
k_controller,
> +							    rcdev);
> +	u32 val;
> +
> +	val =3D readl(data->resets[id].reg);
> +	val |=3D data->resets[id].mask;
> +	writel(val, data->resets[id].reg);
> +
> +	/* This is a special case used only by USB reset */
> +	if (data->resets[id].wait_mask) {
> +		return readl_poll_timeout(data->resets[id].reg + 4, val,
> +					  val & data->resets[id].wait_mask, 1, 100);
> +	}
> +
> +	return 0;
> +}

[Severity: High]
Is it safe to call readl_poll_timeout() here? Since it is called from
zx297520v3_rst_deassert() and zx297520v3_rst_reset() while holding the
reg_lock spinlock with interrupts disabled, the usleep_range() inside
readx_poll_timeout() might sleep in an atomic context.

Should readl_poll_timeout_atomic() be used instead?

> [ ... ]
> +static int zx297520v3_rst_reset(struct reset_controller_dev *rcdev, unsi=
gned long id)
> +{
> +	unsigned long flags;
> +	int res;
> +
> +	spin_lock_irqsave(&reg_lock, flags);
> +
> +	res =3D __zx297520v3_rst_assert(rcdev, id);
> +	if (res)
> +		goto unlock;
> +	udelay(100);

[Severity: Medium]
Does holding a spinlock with local IRQs disabled across a 100-microsecond
delay risk causing severe scheduling latency spikes or triggering
soft-lockup detectors? Could the lock be dropped during the delay?

> +	res =3D __zx297520v3_rst_deassert(rcdev, id);
> +
> +unlock:
> +	spin_unlock_irqrestore(&reg_lock, flags);
> +	return res;
> +}
> +
> +static int zx297520v3_rst_status(struct reset_controller_dev *rcdev,
> +			       unsigned long id)
> +{
> +	struct zx29_clk_controller *data =3D container_of(rcdev, struct zx29_cl=
k_controller,
> +							    rcdev);
> +	u32 val;
> +
> +	val =3D readl(data->resets[id].reg);
> +
> +	return val & data->resets[id].mask;
> +}

[Severity: High]
Does this return value invert the reset controller framework's semantics?

Since __zx297520v3_rst_assert() clears the bit and
__zx297520v3_rst_deassert() sets the bit, the reset appears to be active-lo=
w.
Returning val & mask produces a non-zero value when the line is
deasserted, but the framework expects .status to return non-zero when
asserted.

> --- /dev/null
> +++ b/drivers/clk/zte/pll.c
> @@ -0,0 +1,450 @@
> [ ... ]
> +static int zx29_pll_enable(struct clk_hw *hw)
> +{
> +	struct zx29_clk_pll *pll =3D to_zx29_clk_pll(hw);
> +	u32 val;
> +
> +	val =3D readl(pll->base);
> +	val &=3D ~ZX29_PLL_BYPASS;
> +	writel(val, pll->base);
> +
> +	val =3D readl(pll->base + ZX29_PLL_REG2_OFFSET);
> +	val &=3D ~ZX29_PLL_POSTDIV_OUT_DISABLE;
> +	writel(val, pll->base + ZX29_PLL_REG2_OFFSET);
> +
> +	return 0;
> +}

[Severity: High]
Are these read-modify-write sequences safe against concurrent
modifications?

The Common Clock Framework protects .enable/.disable with
a global spinlock and .prepare/.set_rate with a mutex. Since callbacks
like zx29_pll_enable() and zx29_pll_set_rate() can run concurrently on the
same hardware register, is a driver-specific spinlock needed here?

> [ ... ]
> +static unsigned long zx29_pll_get_rate(const struct zx29_clk_pll *pll, u=
nsigned long parent_rate,
> +				       u32 setting)
> +{
> +	unsigned long refdiv, fbdiv, postdiv1, postdiv2, freq;
> +	const char *name =3D clk_hw_get_name(&pll->hw);
> +	u64 vco;
> +
> +	refdiv =3D (setting & ZX29_PLL_REFDIV_MASK) >> ZX29_PLL_REFDIV_SHIFT;
> +	fbdiv =3D (setting & ZX29_PLL_FBDIV_MASK) >> ZX29_PLL_FBDIV_SHIFT;
> +	postdiv1 =3D (setting & ZX29_PLL_POSTDIV1_MASK) >> ZX29_PLL_POSTDIV1_SH=
IFT;
> +	postdiv2 =3D (setting & ZX29_PLL_POSTDIV2_MASK) >> ZX29_PLL_POSTDIV2_SH=
IFT;
> +	dev_dbg(pll->dev, "%s: reference clock %lu HZ, PLL setting 0x%08x\n",
> +		name, parent_rate, setting);
> +
> +	vco =3D div_u64((u64)parent_rate * fbdiv, refdiv);
> +	freq =3D div_u64(div_u64(vco, postdiv1), postdiv2);

[Severity: High]
Can this sequence cause a divide-by-zero kernel panic?

If the hardware register initially contains 0, or if zx29_pll_calc_values()
returns 0, refdiv, postdiv1, and postdiv2 could evaluate to 0, which would =
be
passed as divisors to div_u64().

> [ ... ]
> +static int zx29_pll_determine_rate(struct clk_hw *hw, struct clk_rate_re=
quest *req)
> +{
> +	struct zx29_clk_pll *pll =3D to_zx29_clk_pll(hw);
> +	unsigned long new_rate, parent_rate =3D clk_hw_get_rate(clk_hw_get_pare=
nt(&pll->hw));
> +	u32 setting;
> +
> +	setting =3D zx29_pll_calc_values(pll, parent_rate, req->rate);
> +	if (!setting)
> +		return -EINVAL;
> +
> +	new_rate =3D zx29_pll_get_rate(pll, parent_rate, setting);
> +	if (new_rate !=3D req->rate) {
> +		dev_warn(pll->dev, "Did not find an exact match. Want %lu, got %lu\n",
> +			 req->rate, new_rate);
> +	}
> +
> +	return 0;
> +}

[Severity: High]
Does this callback need to assign the negotiated new_rate back to
req->rate?

The Common Clock Framework uses the rate updated in req->rate
when executing .set_rate. Without this assignment, the framework might
request the exact original rate, which zx29_pll_set_rate() strictly
validates against and could reject with -EINVAL.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-zx29clk-v3=
-0-c7fe54ea388f@gmail.com?part=3D3
