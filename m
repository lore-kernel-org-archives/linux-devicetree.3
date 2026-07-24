Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8E231D362
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784906371; cv=none; b=DG1VXTBqGeCEvGBvZBPszYDjiIrK/TwXYPbHwH77ZdFrnRoFnORrmJFIvRANv2FYVSDlrhZbi1YeNd+A8zbHAVU6oJk0Lzdx/jAJT6j37KnTmT/eeby39WSwjceBT4eepSfaGcr4JrVaVX+VgWvzcITii+pG/JWwQN1YbO6tezE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784906371; c=relaxed/simple;
	bh=jjsjS9rSDCtzkY5VwDv/Bax2TP/ma3oX9LjmK9DT/44=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kkuPwi1316ut9fHD2FG6O+SDFw+VAmUCOxLCoa4tukqA7/XeD8lQwHnkMJ3A1f42bnhVJGnazrQjHA4qLVOu4opnrR8aroSLNW7XjKtpWOrB/c6x0YEg5MEWQV6GYoKeuC+DzbIxizZDti712paUtp32xGEIaXAKs0tUTSN+E4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LRo76tX7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LRo76tX7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC1A1F000E9;
	Fri, 24 Jul 2026 15:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784906369;
	bh=w5E3uCCitxOy18gMSWbkLXp5m4NWFcXF9pwB9Y9UZ3g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LRo76tX79DNaoh0T5LO/g/q9aoiCgNsbNR6RBN8qvcf+2zIB5bLSlJDjctJa46V2Y
	 tU25JUXwKA5TRJ1I1hQPGIKr698R3OMMFQ8eeGf7LhM8o3FGHBJNOzhFV69lE1Rqbc
	 6ZvxboM0v780LWvyb8gXRoIRfv09lgThzC8BB9vNaqlHUGYuZHXIV2vlqLMa6+U6QA
	 oLPXR3GWF5NJtx/JiBFCxmmJLNWJZg6sUR1FuI0+U1G6Rtky4udNjDdY9kgrmzD2XS
	 wLVde+vUZG+wVW1aloO+33GXrdx0g/lb13zjN3VWNUJU08j0Ay6l6C67GZalgjOK2S
	 R/dYnT4svaJbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/12] clk: qcom: ipq-cmn-pll: Add PPE clock support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luo Jie" <jie.luo@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260724-qcom_ipq5210_cmnpll-v1-5-a8b8679d215f@oss.qualcomm.com>
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
 <20260724-qcom_ipq5210_cmnpll-v1-5-a8b8679d215f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 15:19:28 +0000
Message-Id: <20260724151928.CFC1A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Using DIV_ROUND_CLOSEST_ULL() with a 64-bit divisor causes a divid=
e-by-zero kernel panic due to 32-bit truncation.
--

--- Patch [5]: [PATCH 05/12] clk: qcom: ipq-cmn-pll: Add PPE clock support =
---
commit aed5f1938300824fb26726205b9e4ce2ebf415fa
Author: Luo Jie <jie.luo@oss.qualcomm.com>

clk: qcom: ipq-cmn-pll: Add PPE clock support

This commit adds support for the PPE (packet process engine) clock,
which is derived from the CMN PLL output. It uses a configurable 6-bit
divider and shares a frequency control register with the NSS clock.

> diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pl=
l.c
> index 3df326c22fbac..020ad12ca1f2b 100644
> --- a/drivers/clk/qcom/ipq-cmn-pll.c
> +++ b/drivers/clk/qcom/ipq-cmn-pll.c

[ ... ]

> @@ -462,6 +463,83 @@ static struct clk_hw *ipq_cmn_pll_nss_register(struc=
t platform_device *pdev,
>  	return &nss_clk->hw;
>  }
> =20
> +/*
> + * PPE (Packet Process Engine) clock operations.
> + * The PPE clock is derived from CMN PLL rate / 2, then divided by
> + * a configurable 6-bit divider (8-63).
> + */

[ ... ]

> +static int clk_ppe_set_rate(struct clk_hw *hw, unsigned long rate,
> +			    unsigned long parent_rate)
> +{
> +	struct clk_cmn_pll *ppe_clk =3D to_clk_cmn_pll(hw);
> +	unsigned long div;
> +	int ret;
> +
> +	if (rate =3D=3D 0)
> +		return -EINVAL;
> +
> +	div =3D DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2ULL * rate);

[Severity: High]
Does this code overflow the 32-bit divisor limit of DIV_ROUND_CLOSEST_ULL?

DIV_ROUND_CLOSEST_ULL relies on the kernel do_div() macro, which strictly
truncates the divisor to 32 bits on all architectures. If a caller requests
a large rate (e.g. 2,147,483,648 Hz), 2ULL * rate will have its lower 32
bits as 0. Could this regression cause the divisor to truncate to 0 and
trigger a direct divide-by-zero kernel panic?

> +	if (div < CMN_PLL_NSS_PPE_DIV_MIN || div > CMN_PLL_NSS_PPE_DIV_MAX)
> +		return -EINVAL;
> +

[ ... ]

> +static const struct clk_ops clk_ppe_ops =3D {
> +	.recalc_rate =3D clk_ppe_recalc_rate,
> +	.determine_rate =3D clk_nss_ppe_determine_rate,
> +	.set_rate =3D clk_ppe_set_rate,
> +};

While clk_ppe_set_rate might be protected if the clock framework previously
clamps the rate via determine_rate, this patch also points to the shared
clk_nss_ppe_determine_rate.=20

Can unconstrained rates passed into clk_nss_ppe_determine_rate from the
clock framework (such as via debugfs or a malformed device tree) cause a
similar truncation and kernel panic during rate calculation?

> +static struct clk_hw *ipq_cmn_pll_ppe_register(struct platform_device *p=
dev,
> +					       struct regmap *regmap,
> +					       struct clk_hw *cmn_pll_hw)
> +{

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-qcom_ipq52=
10_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com?part=3D5
