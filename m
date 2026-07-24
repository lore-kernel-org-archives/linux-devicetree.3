Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0BC438FF7
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784891515; cv=none; b=Li+zqojDz43XQ1CydJZ9jtBBY0P6KImz5113s8cntndTZvsw00nCfo20EJEMsA+KYzedkCq9wllSnIdcFP+RPMKF7hWolvweXtxfbc0Uo5NCFO+JZsWwo6FU36k+hHp/biH25zTFxd6EJTyXeRFeVTrCfwaqTNIS48oVkDRuQBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784891515; c=relaxed/simple;
	bh=VZAXo8diFqw9Z5WA+tTfGuouyQMdyEuYHGy0g5Z+lvo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rOAVtMiyt3KCuY53FeTwP2dUtIf+UNjlm9Eq+7os19NgevEuyJduNzkdR2PZ6TNSPelItJ+FZH5Joyr7zLNXTcMf+UzLUJqOAD4toZImwohLnmr6+eWshy860xrFITvrArdreBS1Usi1sPRHZP/WUuAcDlQeax6vqYUo3WMY7go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=by8VReAS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="by8VReAS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5496E1F0429A;
	Fri, 24 Jul 2026 11:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784891514;
	bh=vauIDmbEXdk1wi7aBAapxHypN64V9uG2/eddAZKsCqY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=by8VReASVv1FIPkCXBcF8ZW7Y78FgN2OXsAaQU3fCBPzNjmURQSez7VH3TTIRZx9S
	 FyAGmbuxbgo7mYzR1znRRfSsJw5SS1cA5Umnm4p60NqO3WDepPcprC7u5ZeuiUJ2iD
	 l7PWStN0oLdnIKG5AQQypHhCCtPYW+53JfOkFWUw5a0mHfB+wmUZxPECKHV/6ORIu0
	 tvaVRta/iP3USzhU8Rc447MWN29ThL2LELJK7XaRPbsz+wdfvTN3+74/z7ie5BMKTy
	 93fk6Rc86SCM7OCPNh05g4daxJXhxx1mqPc68pNyRviBwyLexDZXjl8IIRHAJxqNdv
	 f+eVUmddGu50w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/6] clk: qcom: Add Nord display clock controller
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260724-nords_mm_v1-v3-4-32b45232217f@oss.qualcomm.com>
References: <20260724-nords_mm_v1-v3-0-32b45232217f@oss.qualcomm.com>
 <20260724-nords_mm_v1-v3-4-32b45232217f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 11:11:53 +0000
Message-Id: <20260724111154.5496E1F0429A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing `clk_alpha_pll_postdiv` object for `PLL1_OUT_EVEN`, resu=
lting in incorrect parent aliasing.
--

--- Patch [4]: [PATCH v3 4/6] clk: qcom: Add Nord display clock controller =
support ---
commit 15bad88e0e41a7dac6339581fa90741a6515e990
Author: Taniya Das <taniya.das@oss.qualcomm.com>

clk: qcom: Add Nord display clock controller support

Add support for the display clock controllers (DISPCC) on the
Qualcomm Nord platform.

> diff --git a/drivers/clk/qcom/dispcc0-nord.c b/drivers/clk/qcom/dispcc0-n=
ord.c
> new file mode 100644
> index 0000000000000..835aba1596136
> --- /dev/null
> +++ b/drivers/clk/qcom/dispcc0-nord.c

[ ... ]

> +static const struct parent_map disp_cc_0_parent_map_7[] =3D {
> +	{ P_BI_TCXO, 0 },
> +	{ P_MDSS_0_DISP_CC_PLL1_OUT_MAIN, 4 },
> +	{ P_MDSS_0_DISP_CC_PLL1_OUT_EVEN, 6 },
> +};
> +
> +static const struct clk_parent_data disp_cc_0_parent_data_7[] =3D {
> +	{ .index =3D DT_BI_TCXO },
> +	{ .hw =3D &mdss_0_disp_cc_pll1.clkr.hw },
> +	{ .hw =3D &mdss_0_disp_cc_pll1.clkr.hw },
> +};

[Severity: Medium]
Will this cause the Common Clock Framework to miscalculate the frequency
if the bootloader leaves the hardware configured to select the OUT_EVEN
parent?

Because both OUT_MAIN and OUT_EVEN alias directly to the main PLL hardware
object without a post-divider object, it appears the CCF will read the
undivided main PLL rate for both. This could result in reporting a
frequency higher than reality, potentially causing downstream display
pipeline underflows or glitches during splash screen handoff.

Does there need to be a separate clk_alpha_pll_postdiv object to
properly model the OUT_EVEN divider?

[ ... ]

> +static const struct parent_map disp_cc_0_parent_map_8[] =3D {
> +	{ P_BI_TCXO, 0 },
> +	{ P_MDSS_0_DISP_CC_PLL0_OUT_MAIN, 1 },
> +	{ P_MDSS_0_DISP_CC_PLL1_OUT_MAIN, 4 },
> +	{ P_MDSS_0_DISP_CC_PLL1_OUT_EVEN, 6 },
> +};
> +
> +static const struct clk_parent_data disp_cc_0_parent_data_8[] =3D {
> +	{ .index =3D DT_BI_TCXO },
> +	{ .hw =3D &mdss_0_disp_cc_pll0.clkr.hw },
> +	{ .hw =3D &mdss_0_disp_cc_pll1.clkr.hw },
> +	{ .hw =3D &mdss_0_disp_cc_pll1.clkr.hw },
> +};

[Severity: Medium]
This struct has the same aliasing of OUT_EVEN to the main PLL hardware as
disp_cc_0_parent_data_7 above.

Could this also miscalculate the mdss_0_disp_cc_mdss_mdp_clk_src frequency
if inherited from the bootloader?

(Note: This exact same pattern appears in drivers/clk/qcom/dispcc1-nord.c
for disp_cc_1_parent_data_7 and disp_cc_1_parent_data_8 as well).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-nords_mm_v=
1-v3-0-32b45232217f@oss.qualcomm.com?part=3D4
