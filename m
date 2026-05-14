Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA02338F249
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 18:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778784721; cv=none; b=pITYE/qNzhRC1GbMCnitSFB/ZcU8NIun8n2tX6Yc5zftDIWV52B5KmXcjG0gSfYmAWgK55Vey/kgqTjZ6k2YFd4Q89JKd8IO1RDnHCwWYj66abva49n6xpelIDeBNrKGf7uusSRIXWFEG4//+qUhAS7Mc3KIvzNfaw0leAQrXMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778784721; c=relaxed/simple;
	bh=tnVES+Fh/MAUnYBcQu/J486viRWwwpOmHaIguRWIG1k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OyvOyQMoz54uxOyIO/bJrOtrDmzyPgnZ0/xnwwXI57XmBIVQhEQnadmHR67kuF8uwbLkgqMx7VyAyd+vV8s7r2VmJ6PQBZ70gsVRG2eCmQ/q7i0E1g58X4h+XyLGnIIvZ58ny7eNjMU5VammyFNR1/KcnxX/zF+upgD3kjUAPj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V1cY+xC3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V1cY+xC3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B7A6C2BCB3;
	Thu, 14 May 2026 18:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778784721;
	bh=tnVES+Fh/MAUnYBcQu/J486viRWwwpOmHaIguRWIG1k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=V1cY+xC3aRQBdTaqeY3kdvrGxcNSsGyOXkNsNGlPtFN03C/jBGOFBSHxfLdDQT03g
	 DiWwMEqYM74we5dTyPFHZpeMlRdTdLWzQYKyJwZrVqn/aRvY1xztw7w3v2fdyaUoVp
	 o4YswLSYKJBEjN9tWuLU00pf+fiA6a4MxqE3E95B66rQqW7UPoHxmk3pimAenoC5wG
	 /0gNfgrMwycpsc1+hszV6flcuM08ywKlB3tOYJvtzvlN44aJEifpwro5PvrAXbomeP
	 qZRPJjg2HWRfS+SAU8s2IQJxKGGt5ANGmYxul8/h5IB20h4FVui21w+Mi9PHYbmBYC
	 tg8Fjh18NOaMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/6] clk: anlogic: add cru support for Anlogic DR1V90
 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junhui Liu" <junhui.liu@pigmoral.tech>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260514-dr1v90-cru-v5-3-34f3021aab51@pigmoral.tech>
References: <20260514-dr1v90-cru-v5-3-34f3021aab51@pigmoral.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 18:52:00 +0000
Message-Id: <20260514185201.1B7A6C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Global state mutation on probe causes memory corruption upon drive=
r rebind.
- [High] Data race in read-modify-write operations on shared clock register=
s.
- [High] Clocks gated at boot cannot be enabled and rate requests for disab=
led clocks are discarded.
- [High] Kernel panic due to division by zero in `cru_div_gate_determine_ra=
te()`.
- [Medium] `cru_div_gate_recalc_rate()` erroneously reports 0 Hz when the c=
lock is disabled, corrupting the CCF cache.
--

commit 49a46a5cd3719a2e4d6b1b89b13b6a45411cc337
Author: Junhui Liu <junhui.liu@pigmoral.tech>

clk: anlogic: add cru support for Anlogic DR1V90 SoC

The Clock and Reset Unit (CRU) in the Anlogic DR1V90 SoC provides management
for the clock and reset. The driver includes support for generic clocks,
PLLs, and dividers with gating, and registers an auxiliary device for reset=
s.

> diff --git a/drivers/clk/anlogic/cru_dr1.c b/drivers/clk/anlogic/cru_dr1.c
> new file mode 100644
> index 0000000000000..10f8751a88383
> --- /dev/null
> +++ b/drivers/clk/anlogic/cru_dr1.c

[ ... ]

> @@ -48,16 +48,16 @@ static void cru_div_gate_endisable(struct clk_hw *hw,=
 int enable)
>  {
>  	struct cru_div_gate *div_gate =3D hw_to_cru_div_gate(hw);
>  	struct clk_divider *divider =3D &div_gate->divider;
>  	u32 reg;
> =20
>  	reg =3D readl(divider->reg);
>  	reg &=3D ~(clk_div_mask(divider->width) << divider->shift);
> =20
>  	if (enable)
>  		reg |=3D div_gate->val << divider->shift;
> =20
>  	writel(reg, divider->reg);
>  }

Multiple clocks (like qspi, spi, smc, and sdio) share the same MMIO register
0x030.

Since .set_rate runs under a global mutex (prepare_lock) and .enable runs
under a global spinlock (enable_lock), could concurrent calls to
cru_div_gate_set_rate() and cru_div_gate_endisable() on different clocks
mapped to the same register cause a data race and corrupt the hardware state
here?

Should there be a spinlock protecting these read-modify-write sequences?

[ ... ]

> @@ -86,17 +86,17 @@ static unsigned long cru_div_gate_recalc_rate(struct =
clk_hw *hw,
>  					      unsigned long parent_rate)
>  {
>  	struct cru_div_gate *div_gate =3D hw_to_cru_div_gate(hw);
>  	struct clk_divider *divider =3D &div_gate->divider;
>  	unsigned int val;
> =20
>  	val =3D readl(divider->reg) >> divider->shift;
>  	val &=3D clk_div_mask(divider->width);
> =20
>  	if (val < div_gate->min)
>  		return 0;

Does returning 0 here corrupt the CCF rate cache when the clock is gated?

The CCF expects .recalc_rate() to return the operational structural frequen=
cy
of the clock, which is persistently cached. If a gated clock returns 0, will
clk_get_rate() erroneously report 0 Hz even after the clock is enabled?

> =20
>  	return divider_recalc_rate(hw, parent_rate, val, divider->table,
>  				   divider->flags, divider->width);
>  }

[ ... ]

> @@ -107,15 +107,15 @@ static int cru_div_gate_determine_rate(struct clk_h=
w *hw,
>  				       struct clk_rate_request *req)
>  {
>  	struct cru_div_gate *div_gate =3D hw_to_cru_div_gate(hw);
>  	struct clk_divider *divider =3D &div_gate->divider;
>  	unsigned long maxdiv, mindiv;
>  	int div =3D 0;
> =20
>  	maxdiv =3D clk_div_mask(divider->width) + 1;
>  	mindiv =3D div_gate->min + 1;
> =20
>  	div =3D DIV_ROUND_UP_ULL(req->best_parent_rate, req->rate);

Can req->rate be 0 here?

If the clock framework or userspace requests a target rate of 0 Hz (e.g., v=
ia
clk_round_rate(clk, 0)), does this cause an immediate division-by-zero kern=
el
panic?

>  	div =3D div > maxdiv ? maxdiv : div;
>  	div =3D div < mindiv ? mindiv : div;

[ ... ]

> @@ -128,14 +128,14 @@ static int cru_div_gate_set_rate(struct clk_hw *hw,=
 unsigned long rate,
>  				 unsigned long parent_rate)
>  {
>  	struct cru_div_gate *div_gate =3D hw_to_cru_div_gate(hw);
>  	struct clk_divider *divider =3D &div_gate->divider;
>  	int value;
>  	u32 reg;
> =20
>  	if (!__clk_is_enabled(hw->clk))
>  		return 0;

If cru_div_gate_set_rate() returns early when the clock is disabled, the
cached div_gate->val isn't updated.

If the clock was disabled by the bootloader (so the cached value initialized
in cru_div_gate_init() is 0), and a consumer calls clk_set_rate() followed =
by
clk_enable(), will cru_div_gate_enable() write 0 to the hardware and silent=
ly
leave the clock gated forever?

> =20
>  	value =3D divider_get_val(rate, parent_rate, divider->table,

[ ... ]

> @@ -176,14 +176,14 @@ int dr1_cru_clk_register(struct device *dev, void _=
_iomem *base,
>  			 const struct cru_clk *clks, int nr_clks)
>  {
>  	struct clk_hw_onecell_data *priv;
>  	int i, ret;
> =20
>  	priv =3D devm_kzalloc(dev, struct_size(priv, hws, nr_clks), GFP_KERNEL);
>  	if (!priv)
>  		return -ENOMEM;
> =20
>  	for (i =3D 0; i < nr_clks; i++) {
>  		const struct cru_clk *clk =3D &clks[i];
> =20
>  		if (clk->reg)
>  			*(clk->reg) +=3D (uintptr_t)base;

Will this permanently modify the static global clock structures during prob=
e?

If probe deferral occurs or the driver is unbound and rebound, wouldn't base
be added a second time to the already-modified address, leading to invalid
memory pointer dereferences?

> =20
>  		ret =3D devm_clk_hw_register(dev, clk->hw);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514-dr1v90-cru=
-v5-0-34f3021aab51@pigmoral.tech?part=3D3
