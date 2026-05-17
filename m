Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1F035FF5B
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 15:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779030561; cv=none; b=DbdZMZNcIIkygFXBuJAkjmGDK3nfn75B95XAAhZvi+OgIdjMlxnxuXEhyDI6TyJRRupqWqnPUnwcvl408k3drsN5yLrIGB29lH7coLMF4AzB90nBCa++cpsVwF+cDVPTZlBUspYTCqMtM1yX3wvxUZky9wfx4/tWXR2IZ/HM21Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779030561; c=relaxed/simple;
	bh=vD8TZMEAyhhH6S0sOlOgyXHvO9yhshNt07JlPYYzgZg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HmrtmhTlGo5Al2Bsy4FXhC+2tTFIHNiWTkukRlMQ7ieXCWpSnQMfIULlGjp92SMZ26CSweKbBUtR41TgtIGe39/GY88ibg1pcQLgCDk8XT+gPhCzRkRt7kCZPEICMeyX+mJDfmceUlin3Hw0BvJJwHssBkw+IsRzRzWY9cLc/L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qwkoM4kf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qwkoM4kf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C65C2BCB0;
	Sun, 17 May 2026 15:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779030561;
	bh=vD8TZMEAyhhH6S0sOlOgyXHvO9yhshNt07JlPYYzgZg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=qwkoM4kfrcqBgEHdUU2fHoDkasaihWndjKDy5Lk6VVn2LSTh6qrvq50/7XPS4aCV4
	 a8SAr2+mIxo4/nEGlMINJQ10f0cuo58FP/RIoZoFbYNzabrhcTWf9GKCifkMVFZBo0
	 C81zxcCLaHIWESpKH23uBSOkqnc6Hrxx6f0rsLuWOvMnC1d7EeDnfNVd9P08Hln2zE
	 lVJ/1QPjUBY0U1qo+ILrNKzmhRcqrxBX3w9XcW+Rj+9y60X3hr0+R9if630uufyHk4
	 K8gNMkCkRghSUzjQW3MDWUXcLvrpqHj3ypqqfhPfBddZjsCnWvIx2P5k6UITSc2gmo
	 ULj929bzzU9GA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] clk: add support for siflower sf21-topcrm
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chuanhong Guo" <gch981213@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260517-sf21-topcrm-v1-4-438f2e0513ff@gmail.com>
References: <20260517-sf21-topcrm-v1-4-438f2e0513ff@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 15:09:20 +0000
Message-Id: <20260517150921.74C65C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Critical] Static initialization of the flexible array in `sf21_hw_clks` =
creates a critical out-of-bounds memory access vulnerability.
- [High] Lock nesting violation on PREEMPT_RT due to `spinlock_t` usage ins=
ide `.enable`/`.disable` callbacks.
- [High] Global static clock definition structures are modified with per-de=
vice dynamically allocated pointers.
- [High] Missing `select RATIONAL` in Kconfig leads to linker errors.
- [Medium] Integer truncation in PLL rate calculations causes precision los=
s.
- [Medium] Silent acceptance of invalid or unsupported soft reset IDs.
--

commit 83e3e7ec9410a85a7d5912f8b3485089ca10bdce
Author: Chuanhong Guo <gch981213@gmail.com>

clk: add support for siflower sf21-topcrm

This commit adds a driver for the toplevel clock and reset controller
found on Siflower SF21A6826/SF21H8898 SoCs. It includes support for
multiple PLLs, mux/gate/divider blocks, and a reset register.

> diff --git a/drivers/clk/siflower/Kconfig b/drivers/clk/siflower/Kconfig
> new file mode 100644
> index 0000000000000..03cbfbdbdb8db
> --- /dev/null
> +++ b/drivers/clk/siflower/Kconfig
> @@ -0,0 +1,22 @@
[ ... ]
> +config CLK_SF21_TOPCRM
> +	tristate "Clock driver for Siflower SF21 toplevel clock & reset module"
> +	depends on ARCH_SIFLOWER || COMPILE_TEST
> +	default ARCH_SIFLOWER
> +	select RESET_CONTROLLER

Should this select RATIONAL? The driver calls rational_best_approximation()
in rate calculations, which could lead to linker errors if RATIONAL is not
enabled during a COMPILE_TEST build.

[ ... ]
> diff --git a/drivers/clk/siflower/clk-sf21-topcrm.c b/drivers/clk/siflowe=
r/clk-sf21-topcrm.c
> new file mode 100644
> index 0000000000000..7d4c5e370d6d2
> --- /dev/null
> +++ b/drivers/clk/siflower/clk-sf21-topcrm.c
> @@ -0,0 +1,1053 @@
[ ... ]
> +struct sf_clk_common {
> +	void __iomem	*base;
> +	/* Serializes register RMW sequences shared by clocks and resets. */
> +	spinlock_t	*lock;

Could this lock nesting cause issues on PREEMPT_RT?

The Common Clock Framework invokes .enable and .disable callbacks while
holding its own enable_lock, which is a raw_spinlock_t. Acquiring a
spinlock_t inside a raw spinlock critical section is a lock nesting
violation and can lead to a scheduling-while-atomic panic on PREEMPT_RT
kernels.

Does this hardware lock need to be a raw_spinlock_t?

> +	struct clk_hw	hw;
> +};
[ ... ]
> +static unsigned long sf21_cmnpll_vco_recalc_rate(struct clk_hw *hw,
> +						 unsigned long parent_rate)
> +{
> +	struct sf_clk_common *priv =3D hw_to_sf_clk_common(hw);
> +	u32 cfg =3D sf_readl(priv, PLL_CMN_CFG1);
> +	unsigned long refdiv =3D FIELD_GET(PLL_CMN_REFDIV, cfg);
> +	unsigned long fbdiv =3D FIELD_GET(PLL_CMN_FBDIV, cfg);
> +
> +	if (!refdiv || !fbdiv)
> +		return 0;
> +
> +	return (parent_rate / refdiv) * fbdiv;

Could this integer division truncate the remainder and cause precision
loss in the reported frequency?

This pattern also appears in other rate calculation functions like
sf21_pciepll_vco_recalc_rate and sf21_ddrpll_postdiv_recalc_rate. Would it
be better to use 64-bit math such as div_u64((u64)parent_rate * fbdiv,
refdiv) or mult_frac()?

> +}
[ ... ]
> +static struct clk_hw_onecell_data sf21_hw_clks =3D {
> +	.num =3D SF21_CLK_MAX,
> +	.hws =3D {
> +		[SF21_CLK_CMNPLL_VCO] =3D &cmnpll_vco.hw,
[ ... ]
> +		[SF21_CLK_PCIE_REFN] =3D &pcie_refclk_n.common.hw,
> +		[SF21_CLK_PCIE_REFP] =3D &pcie_refclk_p.common.hw,
> +	}
> +};

If SF21_CLK_MAX is larger than the number of items explicitly initialized
in this array, could this lead to an out-of-bounds memory read?

When statically initialized, the compiler only allocates space up to the
highest explicitly initialized index (SF21_CLK_PCIE_REFP). If the loop in
the probe function reads up to sf21_hw_clks.num, it could read past the end
of the allocated structure.

[ ... ]
> +struct sf21_clk_ctrl {
> +	void __iomem *base;
> +	/* Serializes register RMW sequences shared by clocks and resets. */
> +	spinlock_t lock;
> +	struct reset_controller_dev rcdev;
> +	const u32 *reset_bits;
> +	unsigned int nr_resets;
> +};
[ ... ]
> +static int sf21_topcrm_reset_update(struct reset_controller_dev *rcdev,
> +				    unsigned long id, bool assert)
> +{
> +	struct sf21_clk_ctrl *ctrl =3D rcdev_to_sf21_topcrm(rcdev);
> +	u32 bit =3D ctrl->reset_bits[id];

Can this accept invalid or unsupported reset IDs? Since the
sf21_topcrm_reset_bits array has unpopulated gaps, bit will evaluate to 0
for unsupported IDs.

If this happens, the code blindly performs reg &=3D ~0 or reg |=3D 0 and
returns success without throwing an error. Should it verify that the bit
is valid and return -EINVAL if not?

> +	unsigned long flags;
> +	u32 reg;
> +
> +	spin_lock_irqsave(&ctrl->lock, flags);
> +	reg =3D readl(ctrl->base + SF21_SOFT_RESET);
> +	if (assert)
> +		reg &=3D ~bit;
> +	else
> +		reg |=3D bit;
> +	writel(reg, ctrl->base + SF21_SOFT_RESET);
> +	spin_unlock_irqrestore(&ctrl->lock, flags);
> +
> +	return 0;
> +}
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
> +	spin_lock_init(&ctrl->lock);
> +
> +	for (i =3D 0; i < sf21_hw_clks.num; i++) {
> +		struct clk_hw *hw =3D sf21_hw_clks.hws[i];
> +		struct sf_clk_common *common;
> +
> +		if (!hw)
> +			continue;
> +		common =3D hw_to_sf_clk_common(hw);
> +		common->base =3D ctrl->base;
> +		common->lock =3D &ctrl->lock;

Could modifying global static clock definitions with per-device pointers
lead to a use-after-free?

If probe defers or fails later, ctrl is freed by devres, leaving the
global clock objects pointing to dangling memory. Subsequent probes could
then encounter corrupted pointers.

> +		ret =3D devm_clk_hw_register(dev, hw);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to register clock %d\n",
> +					     i);
> +	}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260517-sf21-topcr=
m-v1-0-438f2e0513ff@gmail.com?part=3D4
