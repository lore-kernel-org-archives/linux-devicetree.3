Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF3E44E049
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784906105; cv=none; b=NHNZ8kcJVVTQ4JzEXAU6HyGyDwR7s1T6x8qtPlj8D+64gKKnN/XPjX/6a1UHbDQ9+W3idJP1zEczuO6MYWeUXqyHzCNOeCIPD6Bu8vHT1rGd5LwfwzMOqK6hd3ohPbU9ImmnqBw2ww/uWAn5TuOLTCkVyzjWWHepn3y6afkdCyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784906105; c=relaxed/simple;
	bh=JCPjAMlV7Qz1xLrjQgh8DYx3XpzxF58TA3q5FJTnf+E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Pjo5CDk46lb8Ry06nvx5WjZHO9sKmak89NIE1fo9t2DIQ5KbtJeMQX0W++KN5h7mFGa3ZSzMkukNYJlRfFUcHfJ7N7lzJ2UNUiWMM3cN1Wo6+yW0K/VEbnGx1iE7arVV22AQrumKu63go4dnRKwCfRrqjjOHyj1X6rtyb4j8ItM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hpcs8xoZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hpcs8xoZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E83701F000E9;
	Fri, 24 Jul 2026 15:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784906103;
	bh=GEqOkLP7tzTReuXbdQUpwaEOiiSa6+6m7OImY/v4oLU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hpcs8xoZYYNvR/n17qQRwgiMgCvXKug+Pvr4X7PCuVVZhi6KohF4EzhwH51Q624GL
	 1hYk/hoD/7bbG9T1cEr7KkEP04OXGSC3sRATP1ejg9YtNkp0UOtMI0qj86ChL0huT/
	 JMBqp+pOqMk1cBRyuNHIbNDqeT4MxAYiCfGf3E1TdttgVeEcsaks5Lyolikfj6sD1I
	 1t4u5Ejd3VXJhtG+9OuGLGkjklsHCpeD74d2sCZLYgrEcHZZdft6CoCPI7/RnhpHPu
	 urjSArh/vIsP20XCTbauQgWlEOXGHZleO+w9RNTl3wtMfugqzshxIae77khS9rl+mQ
	 G3vkBMQ7lwAhw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/12] clk: qcom: ipq-cmn-pll: Add NSS clock support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luo Jie" <jie.luo@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724-qcom_ipq5210_cmnpll-v1-4-a8b8679d215f@oss.qualcomm.com>
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
 <20260724-qcom_ipq5210_cmnpll-v1-4-a8b8679d215f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 15:15:02 +0000
Message-Id: <20260724151502.E83701F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] clk_nss_ppe_determine_rate violates the clock framework API cont=
ract when req->rate is 0.
- [Medium] Modifying the NSS clock divider resets the entire CMN PLL block,=
 potentially disrupting other shared fixed-rate clocks.
--

--- Patch [4]: [PATCH 04/12] clk: qcom: ipq-cmn-pll: Add NSS clock support =
---
commit b809b8bd5941993b064f7e68f395a77c3ea61452
Author: Luo Jie <jie.luo@oss.qualcomm.com>

clk: qcom: ipq-cmn-pll: Add NSS clock support

The NSS (network subsystem) clock is derived from the CMN PLL output
divided by 2 and then further divided by a configurable 6-bit divider
with a valid range of 8-63.

> diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pl=
l.c
> index aa319d577871a..3df326c22fbac 100644
> --- a/drivers/clk/qcom/ipq-cmn-pll.c
> +++ b/drivers/clk/qcom/ipq-cmn-pll.c

[ ... ]

> @@ -364,11 +369,105 @@ static struct clk_hw *ipq_cmn_pll_clk_hw_register(=
struct platform_device *pdev)
>  	return &cmn_pll->hw;
>  }
> =20
> +/*
> + * NSS (Network Subsystem) clock operations.
> + * The NSS clock is derived from CMN PLL rate / 2, then divided by
> + * a configurable 6-bit divider (8-63).
> + */

[ ... ]

> +static int clk_nss_ppe_determine_rate(struct clk_hw *hw,
> +				      struct clk_rate_request *req)
> +{
> +	unsigned long div;
> +
> +	if (WARN_ON_ONCE(!req->rate))
> +		return 0;

[Severity: Medium]
When req->rate is 0, this returns 0 (success) without updating req->rate to=
 a
valid boundary or returning an error code like -EINVAL.

Can this regression violate the clock framework API contract by falsely
indicating to consumers that 0 Hz is a supported configuration?

> +
> +	div =3D DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2ULL * req->r=
ate);
> +	div =3D clamp_t(unsigned long, div, CMN_PLL_NSS_PPE_DIV_MIN,
> +		      CMN_PLL_NSS_PPE_DIV_MAX);
> +
> +	req->rate =3D DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2ULL * =
div);
> +	return 0;
> +}
> +
> +static int clk_nss_set_rate(struct clk_hw *hw, unsigned long rate,
> +			    unsigned long parent_rate)
> +{

[ ... ]

> +	ret =3D regmap_update_bits(nss_clk->regmap, CMN_PLL_NSS_PPE_FREQ_CTRL,
> +				 CMN_PLL_NSS_CLK_SEL,
> +				 FIELD_PREP(CMN_PLL_NSS_CLK_SEL, div));
> +	if (ret)
> +		return ret;
> +
> +	return clk_cmn_pll_ana_soft_reset(nss_clk->regmap);

[Severity: Medium]
Does updating the leaf NSS clock divider strictly require a hardware-level
analog reset of the parent PLL block?

Calling clk_cmn_pll_ana_soft_reset() drops the global PLL lock by toggling
CMN_ANA_EN_SW_RSTN:

clk_cmn_pll_ana_soft_reset() {
	...
	ret =3D regmap_clear_bits(regmap, CMN_PLL_POWER_ON_AND_RESET,
				CMN_ANA_EN_SW_RSTN);
	...
}

Will this regression interrupt other derived clocks (e.g., PCIe, WLAN,
SYS_CLK) and cause link drops or system instability whenever the NSS divider
is dynamically updated?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-qcom_ipq52=
10_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com?part=3D4
