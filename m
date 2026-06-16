Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501BF394788
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 20:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781642629; cv=none; b=rFz8/LX3m7OnL1PTw1sBrWSFaxL9jD+DRuEGjpyOjydmXUSbYfd0xfV6Eoy7mk+XJDCwilJZjzvErSdEeqXFFc0f1jiNuJ0YmzFX3ip6ga1KHZ9iMPhUl5CpbQ4vHdlM7x6pPw5q5WOTy1Z4k9uQ/GPX+IEBJLzTJynHTD8Xb4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781642629; c=relaxed/simple;
	bh=dsfqZlkZBJBgbXKC/5Ikg5cMHVvyurjtnVWJaxQy4rM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oYgmEwKrvyVr9LCUVvpREmTjjhXcL0ztaB8BPOuN379xKiXR1XFHy6hPOFEE66GoIa4JWCDjVHRfsluCCDc3m/clLu7SqjadPo6FolSjCKf4bCnBdxXxGbb1eba4GSdtMzisthsfsYAoWH5K7FzOu2Expo1gcVjitk1oyVjrpXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iXIKwWty; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iXIKwWty"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B24EF1F000E9;
	Tue, 16 Jun 2026 20:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781642627;
	bh=djQwAmzY6o5CMihYefFaox+KCqw5qiMKkLPByTmxjHg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iXIKwWtyeF9NBxeYXKh7+j2yaO8LfQFS9cGj1p57Hzo09WwmF+c0cP1VJuiJkbuXT
	 E9veG8lJIf8CoBAyJjc6VWoPZQNtqQ59QeEDkcaUcV04+56/BTx7eA5EtpsKCERK9u
	 4oOwQ3WqkIpYT5W1nWHmfHIzJWrFyxJJGFVVwDd4i4mKkPfChs1C8rSeSd4MpMC+Zd
	 JZMUAlCFaI1bsaBf4hym4Vi2tGEDi/BhbhliX6Sofps3JRKt98sZ/luap9OY2jrmwM
	 tGoOiler9f/1CdGhQF5tR3UShIzaT01anGiEkFwVlCb2ebezXTGLZ1fyHeoq9Tdzdk
	 +bNTCFyWQED1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 05/12] clk: zte: Add zx PLL support
 infrastructure
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260616-zx29clk-v4-5-ca994bd22e9d@gmail.com>
References: <20260616-zx29clk-v4-5-ca994bd22e9d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 20:43:47 +0000
Message-Id: <20260616204347.B24EF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Calling `clk_set_rate` inside the `.init` callback fails silently =
or deterministically due to unestablished clock topology.
- [High] `zx29_pll_determine_rate` dereferences NULL for orphan clocks and =
ignores the dynamic rate propagation requested by the framework.
- [High] `zx29_pll_recalc_rate` returns a negative error code cast to a mas=
sive `unsigned long` on regmap read failure.
- [High] Use-After-Free of `struct auxiliary_device` due to `devm_kzalloc` =
allocation.
- [Medium] If `zx29_pll_prepare` fails to lock the PLL, it returns an error=
 but leaves the hardware permanently enabled.
- [Low] Excessive `dev_warn` and `dev_err` logging during standard rate cal=
culation queries will spam the kernel log.
- [Low] The `pll->dev` pointer is never initialized, causing all driver log=
ging functions to use a NULL device.
--

commit 374687dfee47dfcb141c2ae13759333d3bad3cde
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

clk: zte: Add zx PLL support infrastructure

This patch implements the core PLL infrastructure for ZTE zx platforms.
It provides functions for clock calculation, setting parent rates, and
registering the PLL operations with the Common Clock Framework.

> diff --git a/drivers/clk/zte/pll-zx.c b/drivers/clk/zte/pll-zx.c
> index c0475d5441fbc..f077b6b56841e 100644
> --- a/drivers/clk/zte/pll-zx.c
> +++ b/drivers/clk/zte/pll-zx.c
[ ... ]
> +static int zx29_pll_prepare(struct clk_hw *hw)
> +{
> +	struct zx29_clk_pll *pll =3D to_zx29_clk_pll(hw);
> +	u32 val;
> +	int res;
> +
> +	res =3D regmap_clear_bits(pll->map, pll->reg, ZX29_PLL_DISABLE);
> +	if (res < 0)
> +		return res;
> +
> +	/* Lock duration is usually between 300us to 500us */
> +	res =3D regmap_read_poll_timeout(pll->map, pll->reg, val, val & ZX29_PL=
L_LOCKED, 50, 2000);
> +	dev_dbg(pll->dev, "%s: Enable result %u val 0x%08x\n", clk_hw_get_name(=
&pll->hw), res, val);
> +	return res;

[Severity: Medium]
If regmap_read_poll_timeout() times out waiting for the lock bit, does this
leave the hardware permanently enabled? The ZX29_PLL_DISABLE bit is cleared
above, but it does not appear to be restored on this error path. The core
will treat the clock as unprepared and won't call the unprepare operation,
which could leak power and leave the hardware in an unlocked state.

> +}
[ ... ]
> +static unsigned long zx29_pll_recalc_rate(struct clk_hw *hw, unsigned lo=
ng parent_rate)
> +{
> +	struct zx29_clk_pll *pll =3D to_zx29_clk_pll(hw);
> +	u32 val;
> +	int res;
> +
> +	res =3D regmap_read(pll->map, pll->reg, &val);
> +	if (res < 0)
> +		return res;

[Severity: High]
Could this return a massive fake clock rate? Because this function returns
unsigned long, if regmap_read() fails and returns a negative error code
like -EINVAL, the negative integer gets implicitly cast to a very large
unsigned value. Should this return 0 on failure to prevent corrupting rate
calculations across the clock tree?

> +
> +	return zx29_pll_get_rate(pll, parent_rate, val);
> +}
[ ... ]
> +static u32 zx29_pll_calc_values(const struct zx29_clk_pll *pll, unsigned=
 long parent_rate,
> +				unsigned long rate)
> +{
[ ... ]
> +search_done:
> +
> +	if (!postdiv1) {
> +		dev_err(pll->dev, "Did not find a setting for %lu Hz, parent %lu Hz\n",
> +			rate, parent_rate);
> +		return 0;
> +	}

[Severity: Low]
Will this dev_err() flood the kernel log with false positives? The Common
Clock Framework frequently performs exploratory rate queries during normal
tree traversal, so unachievable out-of-bounds rates might be a normal part
of clock negotiation rather than a true device error.

> +
> +	dev_dbg(pll->dev, "%s: parent rate %lu\n", name, parent_rate);
[ ... ]
> +static int zx29_pll_determine_rate(struct clk_hw *hw, struct clk_rate_re=
quest *req)
> +{
> +	struct zx29_clk_pll *pll =3D to_zx29_clk_pll(hw);
> +	unsigned long new_rate, parent_rate =3D clk_hw_get_rate(clk_hw_get_pare=
nt(&pll->hw));

[Severity: High]
Is there a risk of a NULL pointer dereference here? If the clock is an
orphan and has no parent attached yet, clk_hw_get_parent() returns NULL.
Passing NULL into clk_hw_get_rate() will panic when it dereferences hw->cor=
e.
Also, shouldn't this use req->best_parent_rate instead to properly support
dynamic rate propagation?

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

[Severity: Low]
Is it safe to log a warning here? The framework routinely requests inexact
rates during clock rounding operations, so this could also cause excessive
console spam during normal execution.

> +		req->rate =3D new_rate;
> +	}
> +
> +	return 0;
> +}
[ ... ]
> +static int zx29_pll_init(struct clk_hw *hw)
> +{
[ ... ]
> +	if (regmap_test_bits(pll->map, pll->reg, ZX29_PLL_DISABLE) > 0) {
> +		if (pll->init_rate) {
> +			dev_dbg(pll->dev, "%s: Setting to %lu Hz\n", name, pll->init_rate);
> +			res =3D clk_set_rate(pll->hw.clk, pll->init_rate);

[Severity: High]
Does this rate change silently fail? At the time the init callback runs
during device registration, the clock topology is not fully established and
pll->hw.clk is often NULL. Calling clk_set_rate() with a NULL clock will
simply return 0 without applying the expected initial rate to the hardware.

> +			if (res) {
> +				dev_err(pll->dev, "%s: Failed to set rate.\n", name);
> +				return res;
> +			}
> +		}
[ ... ]
> +int zx_clk_register_plls(struct device *dev, struct regmap *regmap,
> +			 const struct zx_pll_desc *desc, unsigned int num,
> +			 struct clk_hw_onecell_data *clocks)
> +{
> +	struct zx29_clk_pll *pll;
> +	unsigned int i, f;
> +	struct clk_hw *hw;
> +	char plldiv[32];
> +	int res;
> +
> +	for (i =3D 0; i < num; ++i) {
> +		struct clk_init_data init =3D {};
> +
> +		pll =3D devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
> +		if (!pll)
> +			return -ENOMEM;
> +
> +		init.name =3D desc[i].name;
> +		init.ops =3D &zx29_pll_ops;

[Severity: Low]
Are we missing an assignment to pll->dev here? Since devm_kzalloc() zeroes
the memory and the dev pointer is never explicitly mapped to pll->dev,
won't all subsequent calls to dev_dbg(), dev_err(), and dev_warn() end up
using a NULL device pointer and breaking debug message filtering?

> +		init.parent_names =3D desc[i].parents;
> +		init.num_parents =3D desc[i].num_parents;
[ ... ]

While reviewing the broader changes in this driver series, I noticed a
regression in zx_clk_probe() inside drivers/clk/zte/clk-zx.c:

[Severity: High]
Can the use of devm_kzalloc() to allocate the auxiliary device (adev) lead
to a Use-After-Free? The devm framework might abruptly free the memory
during unbind, breaking standard device lifetime rules. If another
subsystem is holding a reference to the device, this memory will be freed
out from under it before the core drops the final reference and calls the
proper release callback.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616-zx29clk-v4=
-0-ca994bd22e9d@gmail.com?part=3D5
