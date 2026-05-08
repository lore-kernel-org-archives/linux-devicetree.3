Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA1F388395
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 22:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778280133; cv=none; b=Ruk/QQvQQ9B7wrejzD6dSUc5bskNXZaBBplN949sSHul9LideO3+qU0pRKrtWlMJ8/Lf2xssw2BGoekJU/1R6cGArIbeZtuL35uM9VjuLq0JQ8tUtgToTearMsDIEbL7deOzsaijf1EhoE62t2R+0NcWyr82QcXHJSO1Wf4bZLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778280133; c=relaxed/simple;
	bh=7vrS6Z1NKtr23IeFETheMlyctIVgkJRzI3vT80DorH0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T2bP80SUpeD7imjK/MzWUdf9LCjBwuYI0YW+5YAqvbE55nJxstRsmKH2cF750R2Lj6pgTVz4UG1SBOeikS5Bgu9ithM21qFHiMioFVT3uHSGG73rhtTeQpLrQiJP4raueK8+dKloKR20b5ddk2GfANeZw/Nl4T6XUhDmlw27/tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aqfrDOEA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aqfrDOEA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A87EC2BCB0;
	Fri,  8 May 2026 22:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778280133;
	bh=7vrS6Z1NKtr23IeFETheMlyctIVgkJRzI3vT80DorH0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=aqfrDOEAX3tQ/hD+FGP05FCNcZF30+VWz+Zqceaa9Wt2ekcVIyxWS55WdEW1v1LTX
	 KccCKsYiWDXw78IrYh8emSC6n1nMX7pUBmdq/W8Mv/pSvC9O6OjcVeSt+UnRUohNzn
	 aSiFICPMSfkCUJ8UaZHPlvs/7pyUPXXlKs3+WZpuDIFdVPGbfuKHidgYWS46LBxW9t
	 5MtfbjnsydDktXbMV0F6IWFphRPVYG/VhPONO3v2Edgg3P2/lgCTO/CArIv7iE44Ak
	 VBFuvM/eNnioVkjujda3zTQVSkgtNQCfMyB06BylLtf8PSwg09gUpjXmnw6b749o/S
	 kMXan+rFQMtUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 07/10] clk: realtek: Add support for MMC-tuned PLL
 clocks
Reply-To: sashiko@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260508111641.3192177-8-eleanor.lin@realtek.com>
References: <20260508111641.3192177-8-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 22:42:12 +0000
Message-Id: <20260508224213.3A87EC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] `set_phrt0` uses an incorrect mask in `regmap_update_bits`, breaki=
ng clock enable/disable.
- [High] `clk_pll_mmc_set_rate` ignores the requested rate and hardcodes th=
e hardware configuration.
- [High] `clk_pll_mmc_recalc_rate` improperly propagates negative error cod=
es as unsigned clock rates.
- [Medium] Clock rate calculation in `clk_pll_mmc_recalc_rate` overflows 32=
-bit integers.
- [Medium] `clk_pll_mmc_phase_get_phase` invokes undefined behavior via inv=
alid pointer subtraction.
--

commit 8ee4cf67f3b23e7f96645f8fb8d616be9378d545
Author: Cheng-Yu Lee <cylee12@realtek.com>

clk: realtek: Add support for MMC-tuned PLL clocks

Add clk_pll_mmc_ops for enable/disable, prepare, rate control, and status
operations on MMC PLL clocks.

> diff --git a/drivers/clk/realtek/clk-pll-mmc.c b/drivers/clk/realtek/clk-=
pll-mmc.c
> new file mode 100644
> index 0000000000000..998ab853ffbb7
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-pll-mmc.c

[ ... ]

> @@ -0,0 +1,453 @@
> +// SPDX-License-Identifier: GPL-2.0-only

[ ... ]

> +static inline int set_phrt0(struct clk_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC1_=
OFFSET,
> +				  PLL_PHRT0_MASK, val << PLL_PHRT0_SHIFT);
> +}

regmap_update_bits internally performs a bitwise AND of the value and the
mask. Since PLL_PHRT0_MASK is BIT(0) and the value is shifted by
PLL_PHRT0_SHIFT (which is 1), will this operation always evaluate to 0?

Should the mask be passed as PLL_PHRT0_MASK << PLL_PHRT0_SHIFT so the clock
can actually be enabled and disabled?

[ ... ]

> +static int clk_pll_mmc_phase_get_phase(struct clk_hw *hw)
> +{
> +	struct clk_hw *hwp;
> +	struct clk_pll_mmc *clkm;
> +	int phase_id;
> +	int ret;
> +	u32 val;
> +
> +	hwp =3D clk_hw_get_parent(hw);
> +	if (!hwp)
> +		return -ENOENT;
> +
> +	clkm =3D to_clk_pll_mmc(hwp);
> +	phase_id =3D (hw - &clkm->phase0_hw) ? 1 : 0;

Does subtracting pointers to distinct struct members invoke undefined
behavior here, since they do not belong to the same array?

Could this be replaced with an equality check like
(hw =3D=3D &clkm->phase0_hw) ? 0 : 1, similar to how it is handled in
clk_pll_mmc_phase_set_phase?

[ ... ]

> +static unsigned long clk_pll_mmc_recalc_rate(struct clk_hw *hw, unsigned=
 long parent_rate)
> +{
> +	struct clk_pll_mmc *clkm =3D to_clk_pll_mmc(hw);
> +	u32 val, ext_f;
> +	int ret;
> +
> +	ret =3D get_ssc_div_n(clkm, &val);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D get_ssc_div_ext_f(clkm, &ext_f);
> +	if (ret)
> +		return ret;

If get_ssc_div_n or get_ssc_div_ext_f fail and return a negative error code,
does this function return that error code directly? Since the return type
is unsigned long, could this result in an astronomically large positive
clock rate being reported to the Common Clock Framework?

> +
> +	return parent_rate / 4 * (val + 2) + (parent_rate / 4 * ext_f) / 8192;
> +}

On 32-bit architectures, could the expression (parent_rate / 4 * ext_f)
overflow if parent_rate is a typical clock frequency like 24 MHz and ext_f
is up to 8191? Should this math be performed using u64 to prevent silent
overflow?

[ ... ]

> +static int clk_pll_mmc_set_rate(struct clk_hw *hw, unsigned long rate, u=
nsigned long parent_rate)
> +{
> +	struct clk_pll_mmc *clkm =3D to_clk_pll_mmc(hw);
> +	u32 val =3D PLL_MMC_SSC_DIV_N_VAL;
> +	int ret;

Does this completely ignore the requested rate and parent_rate parameters
and always program the hardware with the hardcoded PLL_MMC_SSC_DIV_N_VAL?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508111641.3192=
177-1-eleanor.lin@realtek.com?part=3D7
