Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3D53438B5
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 14:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779631367; cv=none; b=h0KFrJmn4oCaUWwD9zVGpcEQmSKA1bOFXURQfBNhEX25YFp/G6mOw7N6DHRnShv0Ff8BUBZ1Xy+a6PBvEvBvDtVC2PjumCi+5uU2peIpDQp0hiog8cf6fhsqScmZqvuJY+7aWSQY78IQ2GQNz9HVws2PsS7i1YRLL3RUYbH/AvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779631367; c=relaxed/simple;
	bh=ZXNzDFm62SWRLjYreRnhhDfV1DKKhDaBxr4NiCMzl30=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uCM3xA20197t9oaXPr5sD0MVZ6M9Rv6fgTGT+Dzm3u3XpeQHzCiCA5sQ/9t50Vi9lmMp3w4w1sGnV+DANfofaW5Nzgqqy/pAAZWj3JkCvNaMQ6n+fS7mr1eHR+/zxpTnvRgdGUyIzg9ExEtQxbIzFmzvtWY6kEg70ssBu4hoMMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b+LS+s4d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+LS+s4d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA0331F000E9;
	Sun, 24 May 2026 14:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779631366;
	bh=obcD5HBLxoe+zzjlzL5uSAdkamOTGYGrnyuPJ7LFWa8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b+LS+s4dcWLABYH/IQvb2aotxLY7x67BVRqTq7RDSKqN8mvWO0ruA3JBO2UjQhm7H
	 sLqIEd+QyefvmB6QM2Oyu4a9e0jAs+cWW5vYMDVEX/5OQwcf/s+zRaUVA02ajU5D0y
	 2Xf7p8G9TZjFo3nw4rESxD52ewk2vzkEUxZEI3IRlB1tF1zRVZ0giOq/yql00nNBXG
	 4QIMjToELmciX1gTOCfyGEJj/rz//QTu6IqqnTTLAF4Qot5/XnRlm5MzwamLKqYQFJ
	 2eQI08E9p7t2SsLuS4KDxRr6zG4VNTyTBvCV2HpOdZb2ddru1+wY8pH873iPjpY1m3
	 gH86ql8oln4mQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] clk: add support for siflower sf21-topcrm
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chuanhong Guo" <gch981213@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260524-sf21-topcrm-v2-3-4527aae05c3d@gmail.com>
References: <20260524-sf21-topcrm-v2-3-4527aae05c3d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 24 May 2026 14:02:45 +0000
Message-Id: <20260524140245.EA0331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Holding a raw spinlock and disabling interrupts while busy-waiting=
 for up to 1ms.
- [High] Global clock structures are mutated with pointers to dynamically a=
llocated memory, causing dangling pointers on probe failure or driver unbin=
d.
--

commit 479eb0c843e2bfaa965d0cb0f125d0ed4dd0cf0b
Author: Chuanhong Guo <gch981213@gmail.com>

clk: add support for siflower sf21-topcrm

This commit adds a driver for the Toplevel clock and reset controller
found on Siflower SF21A6826/SF21H8898 SoCs. It includes control for 3
PLLs, several clock mux/gate/divider blocks, and a reset register.

> diff --git a/drivers/clk/siflower/clk-sf21-topcrm.c b/drivers/clk/siflowe=
r/clk-sf21-topcrm.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/clk/siflower/clk-sf21-topcrm.c
[ ... ]
> +static int sf21_cmnpll_vco_set_rate(struct clk_hw *hw, unsigned long rat=
e,
> +				    unsigned long parent_rate)
> +{
> +	struct sf_clk_common *priv =3D hw_to_sf_clk_common(hw);
> +	unsigned long fbdiv, refdiv;
> +	u32 val;
> +
> +	rational_best_approximation(rate, parent_rate, FIELD_MAX(PLL_CMN_FBDIV),
> +				    FIELD_MAX(PLL_CMN_REFDIV), &fbdiv, &refdiv);
> +	if (!refdiv || !fbdiv)
> +		return -EINVAL;
> +
> +	guard(raw_spinlock_irqsave)(priv->lock);
> +
> +	sf_rmw(priv, PLL_CMN_CFG1, PLL_CMN_REFDIV | PLL_CMN_FBDIV | PLL_CMN_PD,
> +	       FIELD_PREP(PLL_CMN_REFDIV, refdiv) |
> +		       FIELD_PREP(PLL_CMN_FBDIV, fbdiv));
> +	sf_writel(priv, CFG_LOAD, BIT(CFG_LOAD_CMN_PLL_BIT));
> +	sf_writel(priv, CFG_LOAD, 0);
> +
> +	return readl_poll_timeout_atomic(priv->base + PLL_CMN_LOCK, val, val & =
1,
> +					0, PLL_LOCK_TIMEOUT_US);
> +}

[Severity: High]
Does this code hold the raw spinlock with interrupts disabled for up to 1ms
while polling for the PLL to lock?

Because guard() releases the lock at the end of the variable's scope, the
lock remains held during the readl_poll_timeout_atomic() call. Tightly
spinning for 1ms with interrupts disabled could cause system latency spikes
or RCU stalls.

Would it be better to use scoped_guard() for the sf_rmw() and sf_writel()
calls so the lock is dropped before the polling loop?

[ ... ]
> +static int sf21_pciepll_vco_enable(struct clk_hw *hw)
> +{
> +	struct sf_clk_common *priv =3D hw_to_sf_clk_common(hw);
> +	u32 val;
> +
> +	guard(raw_spinlock_irqsave)(priv->lock);
> +	sf_rmw(priv, PLL_PCIE_CFG1, 0, PLL_PCIE_PLLEN);
> +	sf_writel(priv, CFG_LOAD, BIT(CFG_LOAD_PCIE_PLL_BIT));
> +	sf_writel(priv, CFG_LOAD, 0);
> +	return readl_poll_timeout_atomic(priv->base + PLL_PCIE_LOCK, val,
> +					 val & 1, 0, PLL_LOCK_TIMEOUT_US);
> +}

[Severity: High]
This appears to have the same issue mentioned above where a raw spinlock
is held with interrupts disabled during a 1ms polling loop.

[ ... ]
> +static struct sf_clk_common cmnpll_vco =3D {
> +	.hw.init =3D CLK_HW_INIT_PARENTS_DATA("cmnpll_vco", sf21_ref_parent,
> +					    &sf21_cmnpll_vco_ops, 0),
> +};
[ ... ]
> +static struct clk_hw_onecell_data sf21_hw_clks =3D {
> +	.num =3D SF21_NUM_CLKS,
> +	.hws =3D {
> +		[SF21_CLK_CMNPLL_VCO] =3D &cmnpll_vco.hw,
[ ... ]
> +static int sf21_topcrm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct sf21_clk_ctrl *ctrl;
> +	int i, ret;
> +
> +	ctrl =3D devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
> +	if (!ctrl)
> +		return -ENOMEM;
> +
> +	ctrl->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(ctrl->base))
> +		return dev_err_probe(dev, PTR_ERR(ctrl->base),
> +				     "failed to map resources\n");
> +
> +	raw_spin_lock_init(&ctrl->clk_lock);
> +	spin_lock_init(&ctrl->rst_lock);
> +
> +	for (i =3D 0; i < sf21_hw_clks.num; i++) {
> +		struct clk_hw *hw =3D sf21_hw_clks.hws[i];
> +		struct sf_clk_common *common;
> +
> +		if (!hw)
> +			continue;
> +		common =3D hw_to_sf_clk_common(hw);
> +		common->base =3D ctrl->base;
> +		common->lock =3D &ctrl->clk_lock;
> +		ret =3D devm_clk_hw_register(dev, hw);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to register clock %d\n",
> +					     i);
> +	}

[Severity: High]
Does this setup mutate the global static clock structures (like cmnpll_vco)
with pointers to the dynamically allocated ctrl memory?

If probe() fails later or the driver unbinds, devm_kzalloc will free ctrl,
potentially leaving dangling pointers in the global clock structures. This
could result in a use-after-free or corrupt the clock framework's internal
tree if the driver is probed again later.

Should the clock structures be dynamically allocated per-device or embedded
in a driver-private struct instead of using global state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524-sf21-topcr=
m-v2-0-4527aae05c3d@gmail.com?part=3D3
