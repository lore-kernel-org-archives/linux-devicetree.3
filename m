Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1FC397E89
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 07:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786086245; cv=none; b=KP3aLKHfBRJ1pSEXaMdowB1lf33Y1NcmYYfopRMEO46tnWNA1ogzVPIylom87oh0GRCDWAqSxrAQDaZnsRUoK4w7LNpRf7zjRiZbSBdxvaNFjghFQznudry+crJ3hsNgENbRCIuams1XoRtqjz4xAygYTrAhpsURwwzfKxpLW4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786086245; c=relaxed/simple;
	bh=JRuZHTKtl4kNks2yZBX2KoidafBCZ9jolAcMnG/wrdk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rTWysmmk1h+eawqsMUNB91kr5qpsFpe+mH27U4DxqdwcTEnURFEdXwMBiW5ko1TtDOoDj0pPZpFUH+6SjFI9rhbmA/evl1bL4JMR99DeZZ4N6E3Iqun53vT42xp6qAeyehhmOQtSZsyZB1II0QIRoZH0Pd6FdSjZ857jGtP6cLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RiBgSPuB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RiBgSPuB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E711F1F00A3E;
	Fri,  7 Aug 2026 07:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786086240;
	bh=2z9pffxrfdJDA5NJRf+hp0GtrT9sgH5/rn4znYwxy7o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RiBgSPuBPLLICuj5AhLH6FhBI6//geeJ3Am39bQhRN4Rdbg05I1BFwAOORgaNxw6B
	 nzjV1NTurmzok4GFsMEnB5o6j1soYaKHNp1hEgAYbwIwXCInw4Xq/Ti1dVu7W138PW
	 KcPOuL/oCtaQN3eaypwCnp5OGdmCSGEK68ZhmXGNtzKAdqKQSBYo1qeiOu6Kewc/Bv
	 uBVAVPjIfve0FO7T0qpF0pLJNa+pLRFFKu9nQQdoRhHQb7/2we433zh/Tbf+NiJ+Xn
	 jG+nHscJjDAHYasVJTxrmQd5LlTMlalFS3x05xerBaizunf3oFho+QzmuVv48xrjtk
	 lew8fQgezdVaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/12] clk: qcom: clk-regmap-divider: Support
 CLK_DIVIDER_* flags
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luo Jie" <jie.luo@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806-qcom_ipq5210_cmnpll-v2-4-cce718b8ec17@oss.qualcomm.com>
References: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
 <20260806-qcom_ipq5210_cmnpll-v2-4-cce718b8ec17@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 07:03:59 +0000
Message-Id: <20260807070359.E711F1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Type correctness regression: left shift of a signed integer without=
 casting
--

--- Patch [4]: [PATCH v2 04/12] clk: qcom: clk-regmap-divider: Support CLK_=
DIVIDER_* flags ---
commit 8da3393b838b4e4b6fe1ccda790022d6a599db23
Author: Luo Jie <jie.luo@oss.qualcomm.com>

clk: qcom: clk-regmap-divider: Support CLK_DIVIDER_* flags

This commit adds a flags field to struct clk_regmap_div and passes it to
clock divider functions to support CLK_DIVIDER_* behavior variants. It also
updates div_set_rate() to handle negative error codes from divider_get_val()
by changing the div variable from an unsigned to a signed integer.

> diff --git a/drivers/clk/qcom/clk-regmap-divider.c b/drivers/clk/qcom/clk=
-regmap-divider.c
> index 672e82caf2050..fe4542b5bd580 100644
> --- a/drivers/clk/qcom/clk-regmap-divider.c
> +++ b/drivers/clk/qcom/clk-regmap-divider.c

[ ... ]

> @@ -43,10 +44,12 @@ static int div_set_rate(struct clk_hw *hw, unsigned l=
ong rate,
>  {
>  	struct clk_regmap_div *divider =3D to_clk_regmap_div(hw);
>  	struct clk_regmap *clkr =3D &divider->clkr;
> -	u32 div;
> +	int div;
> =20
>  	div =3D divider_get_val(rate, parent_rate, NULL, divider->width,
> -			      CLK_DIVIDER_ROUND_CLOSEST);
> +			      CLK_DIVIDER_ROUND_CLOSEST | divider->flags);
> +	if (div < 0)
> +		return div;
> =20
>  	return regmap_update_bits(clkr->regmap, divider->reg,
>  				  (BIT(divider->width) - 1) << divider->shift,
>  				  div << divider->shift);

[Severity: Low]
Since div was changed to a signed int to handle error codes, should it be c=
ast
to an unsigned type before being shifted here?=20

Left-shifting a signed integer without casting can trigger static analysis
warnings, or technically undefined behavior in standard C if the value
overflows into the sign bit.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-qcom_ipq52=
10_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com?part=3D4
