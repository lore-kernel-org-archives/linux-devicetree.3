Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015923CAA2F
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 07:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786087127; cv=none; b=JZUkLCsGnZSVKynceiK8VJvl4W6Pzb+Upo46BFwQpUi0w7HZCBsJaVZl+u37jT+Mtu3VX6w9dorRUt/HK1NOEufLfEqe4x3/9+uW9f/Z9nLRYjqZuUL9Gt/jk7gUGRC6vKc7PRd+qn5bmI75Wdz2EDtdhIHzUO0oTaB2tMchimM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786087127; c=relaxed/simple;
	bh=OpCqzsnVUMieRAjKFOVdUx0PS7A33lb8mmvNL2oVxKo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q8Z6vJflv/LquIwjpM3zOedLPjpSqfuzZkQazY1dZIYavLTC8fEN9ZlzPIjF6r6ZQiso8zPVdLIkNWVzWqi21ri0viHqpKRK/f7MPm7j4n8dh6+Kr8+lOxvOdgCJ5ujiDKg4X70tSyJhsOgmFd2QVZbv7iCHyVfrV9Ez6Qod8r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ixmHhAAo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ixmHhAAo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C2F1F01559;
	Fri,  7 Aug 2026 07:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786087125;
	bh=Muuk9pyxbQa0DvxfKw4g8GBOqBJ4Ly671y1Zt796VRY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ixmHhAAoWu/jU/xEJrg6pthLmZEbqc3EqDXA2E/ymkVaPxjl7xZT/XOwcn+EVp2K7
	 9s5wZ/TyqO406872rYwUXmvkNpxmj7+PlYkkH7ewJMlANn5t5FKWIT+YQ5bRPI9khf
	 iU7SlajwrxAJX1iUuo1J+12necshZaBV7AyzE/AW+c1/HGP9gema7kxM8LvnJcy6KA
	 Gup2JiAaXHP1aDaAa9gckVvitngnANVWyJp8xKG4w9jnoKekEs6vTZ0ZWKthYxdsiU
	 jk7PPSUbGUqFPENhqmuorVw5S3sUZDR8+J9YWL+SJsaDyen9V7LbZRCv6vdSUxSmxY
	 Xr86/6HZBEjEg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/12] clk: qcom: ipq-cmn-pll: Add NSS clock support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luo Jie" <jie.luo@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806-qcom_ipq5210_cmnpll-v2-5-cce718b8ec17@oss.qualcomm.com>
References: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
 <20260806-qcom_ipq5210_cmnpll-v2-5-cce718b8ec17@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 07:18:44 +0000
Message-Id: <20260807071845.39C2F1F01559@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The NSS clock is unconditionally registered as a fixed-rate cloc=
k, meaning the new divider registration logic is never invoked.
- [Medium] A kernel WARN will trigger during boot if the 6-bit hardware reg=
ister happens to be 0.
--

--- Patch [5]: [PATCH v2 05/12] clk: qcom: ipq-cmn-pll: Add NSS clock suppo=
rt ---
commit 4b97f2d301b3cfbdff0e9b058b5b63be9ee7d0dd
Author: Luo Jie <jie.luo@oss.qualcomm.com>

clk: qcom: ipq-cmn-pll: Add NSS clock support

This patch adds NSS clock support by introducing a new clock registration
type and divider logic. It adds ipq_cmn_pll_regmap_div_register() to handle
the NSS clock divider and updates the clk_cmn_pll structures to specify the
clock type.

> diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pl=
l.c
> index 4fdf78f6829e8..c1b00699eb72d 100644
> --- a/drivers/clk/qcom/ipq-cmn-pll.c
> +++ b/drivers/clk/qcom/ipq-cmn-pll.c

[ ... ]

> @@ -105,6 +123,7 @@ struct clk_cmn_pll {
>  #define CLK_PLL_OUTPUT(_id, _name, _rate) {		\
>  	.id =3D		_id,				\
>  	.name =3D		_name,				\
> +	.type =3D		CMN_PLL_CLK_FIXED_RATE,		\
>  	.rate =3D		_rate,				\
>  }

[Severity: Medium]
Since CLK_PLL_OUTPUT unconditionally assigns CMN_PLL_CLK_FIXED_RATE, and no
other macro is introduced to set CMN_PLL_CLK_NSS, will the NSS clock
actually use the new registration type?

It seems the switch statement in ipq_cmn_pll_register_clks() will only ever
evaluate to CMN_PLL_CLK_FIXED_RATE, leaving the new divider registration lo=
gic
as dead code.

[ ... ]

> @@ -357,11 +376,46 @@ static struct clk_hw *ipq_cmn_pll_clk_hw_register(s=
truct platform_device *pdev)
>  	return &cmn_pll->hw;
>  }
> =20
> +static struct clk_hw *ipq_cmn_pll_regmap_div_register(struct platform_de=
vice *pdev,
> +						      struct regmap *regmap,
> +						      struct clk_hw *cmn_pll_hw,
> +						      const char *name,
> +						      u32 field_mask)
> +{
> +	struct clk_parent_data pdata =3D { .hw =3D cmn_pll_hw };
> +	struct device *dev =3D &pdev->dev;
> +	struct clk_regmap_div *div_clk;
> +	int ret;
> +
> +	div_clk =3D devm_kzalloc(dev, sizeof(*div_clk), GFP_KERNEL);
> +	if (!div_clk)
> +		return ERR_PTR(-ENOMEM);
> +
> +	div_clk->reg =3D CMN_PLL_NSS_PPE_FREQ_CTRL;
> +	div_clk->shift =3D __ffs(field_mask);
> +	div_clk->width =3D hweight32(field_mask);
> +	div_clk->flags =3D CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET;

[Severity: Medium]
Will this trigger a generic clock framework WARN during boot if the
hardware register value happens to be 0?

Since the full 6-bit register range is now allowed, if the bootloader or
hardware leaves the register at 0, clk_regmap_div_ops.recalc_rate will
evaluate a divisor of 0. Without CLK_DIVIDER_ALLOW_ZERO included in the fla=
gs,
divider_recalc_rate() will trigger a WARN.

> +	div_clk->clkr.regmap =3D regmap;
> +	div_clk->clkr.hw.init =3D &(struct clk_init_data){
> +		.name =3D name,
> +		.parent_data =3D &pdata,
> +		.num_parents =3D 1,
> +		.ops =3D &clk_regmap_div_ops,
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-qcom_ipq52=
10_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com?part=3D5
