Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BA722083
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 00:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778719767; cv=none; b=emRXxhO9RU5CCDRtAET+tJuny4WMU7dyJN5lJhg6cpmtWLWkZi18PCIgmqFfwww+rqzICTqXXy6B/4Sns81QX0/4VDOF0KRNmLXcP0wV4wKQp7qJWI1ymhn5QrzAsKmx/7GWVbeheJtS4QWuu2kRloNS4ICtgi8JxNjTbl0/Cts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778719767; c=relaxed/simple;
	bh=RmAcWCFl94UONFkN+Mal3GzyWw1PWHAlNWWUS5qmvGk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fukwF/J/+AnoxySil+7HBGRzCJe5/nrieQ4vQ7zr1DETq3M+Cj/oUYMkvun0sDN11dVAaqCzd9QXqD9z6ssju4QxU4X8YUeGMiGjOlD2mFzlU40kb7GPwq4ej2EKXnrV6a/92L1XNe0r169Vn2BFoK119rKy6+Ou46GH2yXkm8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bJaTJfXX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bJaTJfXX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204F8C19425;
	Thu, 14 May 2026 00:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778719767;
	bh=RmAcWCFl94UONFkN+Mal3GzyWw1PWHAlNWWUS5qmvGk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=bJaTJfXXuU4HuMG4bi0XSX2nx2jSoXZC9xL9IwVzuQMWc3a5dEWy7EQW+UkfwkoXA
	 5HRv54UG74Pq2uW50YBFmJ2uP7etgtmCao9Y+EE9uDxCIUKNerJ89Nc5DcYzCqqXbN
	 9dxSxJa3rDFhyP7TgYnDifQpjoaqpVODswshdNZAxVfUZ4GH7c6PLRYjOIMIAuwSQX
	 zxm2/puhGplEnMeKebM+KJBTXe2W5yTT8Sxv8UzyIpsFYnAIPued5c3Qa81a1jL56S
	 fdeI4N34cMELGx8bsF6Sps+axOC58qC9lLVnnqSsW5ApUTCzwV3nD7Vw8/dNWpuq9m
	 Kr6FHeYZPV+Jg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 9/9] clk: eyeq: Add EyeQ7H compatibles
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260512-clk-eyeq7-v6-9-0540cce18fb2@bootlin.com>
References: <20260512-clk-eyeq7-v6-9-0540cce18fb2@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 00:49:26 +0000
Message-Id: <20260514004927.204F8C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Integer Truncation and Overflow in PLL Rate Calculation
- [High] DDR Dividers Unsafely Share a Single Hardware Bit
- [Medium] Incorrect Error Code Returned in Probe Functions
- [Medium] Ambiguous Multi-Bit PLL Lock Status Check
--

commit b99f900f43acbf4376533da9957f61a4edd617d5
Author: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

clk: eyeq: Add EyeQ7H compatibles

This commit adds entries for the 14 Other Logic Blocks found in the EyeQ7H
SoC. It also introduces parsing functions for the JFRACR and AINTP PLLs,
which have unique properties and register layouts compared to previous SoC
generations.

> diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
> index 83c6f50024513..c8c924d63bade 100644
> --- a/drivers/clk/clk-eyeq.c
> +++ b/drivers/clk/clk-eyeq.c
[ ... ]
> @@ -71,6 +72,41 @@
>  #define FRACG_PCSR1_DOWN_SPREAD			BIT(11)
>  #define FRACG_PCSR1_FRAC_IN			GENMASK(31, 12)
> =20
> +#define JFRACR_PCSR0_BYPASS			BIT(0)
> +#define JFRACR_PCSR0_PLL_EN			BIT(1)
> +#define JFRACR_PCSR0_FOUTVCO_EN			BIT(2)
> +#define JFRACR_PCSR0_FOUTPOSTDIV_EN		BIT(3)
> +#define JFRACR_PCSR0_POST_DIV1			GENMASK(6, 4)
> +#define JFRACR_PCSR0_POST_DIV2			GENMASK(9, 7)
> +#define JFRACR_PCSR0_REF_DIV			GENMASK(15, 10)
> +#define JFRACR_PCSR0_FB_DIV			GENMASK(27, 16)
> +#define JFRACR_PCSR0_VCO_SEL			GENMASK(29, 28)
> +#define JFRACR_PCSR0_PLL_LOCKED			GENMASK(31, 30)

[ ... ]

> +static int eqc_pll_parse_jfracr(void __iomem *base, unsigned long *mult,
> +				unsigned long *div, unsigned long *acc)
> +{
> +	unsigned long spread;
> +	u32 r0, r1, r2;
> +	u64 val;
> +
> +	val =3D readq(base);
> +	r0 =3D val;
> +	r1 =3D val >> 32;
> +	r2 =3D readl(base + 8);
> +
> +	if (r0 & JFRACR_PCSR0_BYPASS) {
> +		*mult =3D 1;
> +		*div =3D 1;
> +		*acc =3D 0;
> +		return 0;
> +	}
> +
> +	if (!(r0 & JFRACR_PCSR0_PLL_LOCKED))
> +		return -EINVAL;

JFRACR_PCSR0_PLL_LOCKED is defined as a 2-bit mask. Does this check incorre=
ctly
evaluate to true if only one of the two bits is set? Usually a multi-bit fi=
eld
represents specific states rather than just checking for any non-zero value.

> +
> +	*mult =3D FIELD_GET(JFRACR_PCSR0_FB_DIV, r0);
> +	*div =3D FIELD_GET(JFRACR_PCSR0_REF_DIV, r0);
> +
> +	/* fractional part on 24 bits */
> +	if (r1 & JFRACR_PCSR1_DSM_EN) {
> +		*div *=3D (1ULL << 24);
> +		*mult =3D *mult * (1ULL << 24) + FIELD_GET(JFRACR_PCSR1_FRAC_IN, r1);
> +	}

On 32-bit architectures, unsigned long is 32 bits. Does assigning the 64-bit
calculation to *mult silently truncate the result since FB_DIV allows the
multiplier to reach up to 4095, which requires up to 36 bits?

> +
> +	if (!*mult || !*div)
> +		return -EINVAL;
> +
> +	if (r2 & (JFRACR_PCSR2_RESET | JFRACR_PCSR2_DIS_SSCG)) {
> +		*acc =3D 0;
> +		return 0;
> +	}

If spread spectrum is disabled, the function returns early here. Does this =
skip
calling eqc_pll_downshift_factors()? If skipped, would the function pass a
potentially 36-bit value into clk_hw_register_fixed_factor_pdata(), which
accepts unsigned int and silently discards the top 4 bits?

> +
> +	/* spread spectrum is identical to FRACG PLL */
> +	spread =3D FIELD_GET(JFRACR_PCSR2_SPREAD, r2);
> +	*acc =3D DIV_ROUND_CLOSEST(spread * 1000000000, 1024 * 2);

Could the accuracy calculation spread * 1000000000 overflow a 32-bit intege=
r on
32-bit systems, since spread can be up to 31?

[ ... ]

> +static int eqc_probe_pll_aintp(struct device *dev, struct device_node *n=
p,
> +			       const struct eqc_clock *clk, void __iomem *base,
> +			       struct clk_hw_onecell_data *cells)
> +{
> +	struct clk_parent_data parent_data =3D { };
> +	unsigned long mult, div;
> +	struct clk_hw *hw;
> +	int ret;
> +
> +	ret =3D eqc_pll_parse_aintp(base + clk->pll.reg, &mult, &div);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D eqc_fill_parent_data(clk, cells, &parent_data);
> +	if (ret)
> +		return ret;
> +
> +	hw =3D clk_hw_register_fixed_factor_pdata(dev, np, clk->name, &parent_d=
ata,
> +						0, mult, div, 0, 0);
> +
> +	if (IS_ERR(hw))
> +		return IS_ERR(hw);

Is this returning 1 on failure instead of the actual negative error code li=
ke
-ENOMEM? Could this be changed to use PTR_ERR(hw) so the caller logs the
correct error code?

> +
> +	cells->hws[clk->index] =3D hw;
> +	return 0;
> +}

[ ... ]

> +static int eqc_probe_pll_jfracr(struct device *dev, struct device_node *=
np,
> +				const struct eqc_clock *clk, void __iomem *base,
> +				struct clk_hw_onecell_data *cells)
> +{
[ ... ]
> +	hw =3D clk_hw_register_fixed_factor_pdata(dev, np, clk->name, &parent_d=
ata, 0, mult,
> +						div, acc, CLK_FIXED_FACTOR_FIXED_ACCURACY);
> +	if (IS_ERR(hw))
> +		return IS_ERR(hw);

Same issue here. Does this return 1 instead of PTR_ERR(hw)?

> +
> +	cells->hws[clk->index] =3D hw;
> +	return 0;
> +}

[ ... ]

> +static const struct eqc_clock eqc_eyeq7h_ddr0_clks[] =3D {
> +	PLL_AINTP(EQ7HC_DDR_PLL, PARENT_BY_FWNAME, "pll-ddr0", "ref", 0x0),
> +
> +	DIV(EQ7HC_DDR_DIV_APB, EQ7HC_DDR_PLL, "div-ddr0_apb", NULL,
> +	    0x08, 10, 1, eqc_eyeq7h_ddr_apb_div_table),
> +	DIV(EQ7HC_DDR_DIV_PLLREF, EQ7HC_DDR_PLL, "div-ddr0_pllref", NULL,
> +	    0x08, 10, 1, eqc_eyeq7h_ddr_ref_div_table),
> +	DIV(EQ7HC_DDR_DIV_DFI, EQ7HC_DDR_PLL, "div-ddr0-dfi", NULL,
> +	    0x08, 10, 1, eqc_eyeq7h_ddr_dfi_div_table),
> +};

These three clocks use the exact same register (0x08), shift (10), and width
(1). Because they are registered as independent dividers, does changing the=
 rate
of one silently alter the hardware state for the other two?

If so, will this desynchronize the CCF's internal state from the actual
hardware configuration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-clk-eyeq7-=
v6-0-0540cce18fb2@bootlin.com?part=3D9
