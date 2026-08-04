Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDADC3F20E8
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 18:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785869851; cv=none; b=oaesrgodRz8Kej6ZChYLYtX81dIxqX/OzRGGztzEU8ba+Ml1Vg3BnMuHtRQUvk31CFp6s2o1wlKDB2Lgd24lh3qdqhX0W80seI6GqEXb2fuH1u3275J3/Y0yR6lAMobwpKRxsocW/PsSolj1nXOHcj8/q/e9fbfILFokPA2ARoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785869851; c=relaxed/simple;
	bh=+X4WE+Kao6sLGoLfo4YAPYvdEKUSQn1gbfSrWy3naTU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UADipX6P8f0S891walfuGmI4HW11h3VOO7Ky9TKitCdFTDs59xBbRZZANkSzXvbF6ul05kna36AyYJiIutMX0vn8y5M8I3bjvTwp1E8dmeziGWgObn8J43WTNeQCQv/8dBV2swcJ63KkGPIGrhgWyS4orebwSCyiIyJZgqSHugU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VGhLbXOY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VGhLbXOY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A44E1F000E9;
	Tue,  4 Aug 2026 18:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785869850;
	bh=EzfHREVagwmt1EaO5jjy7VTq3TXilp5XjNhtl+ysXWk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VGhLbXOYw4Yapat1YHuH9bEiEB30v74sfdEqBPb/7xbdAUvXOhx92/RhIpu1KSCKY
	 e/8eQkU7wLPWAa82oNRrcOPcBDTWGQ7wK6p4D4f3O+7j2iWgxKCP69KyTd0q47BnsN
	 46lpRVITisS27V87o/bIoGKgrh8lD896TKVlAnKR9dEIN/jPX7tQE9BZwQZsGprshO
	 26S2aPJcQAnXDLHA/HlZ+dMc/j0QC5FEBdej0laYC15E9TWE3ZIiRgYE/P/NWeRtu/
	 mZG4ctuTZvuKWdJ4YkUj8rWojV16lZWCC+f5JJzTRty72pC8gzEATtgau7seh5SVVP
	 P/Y3tJSBCIS6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 09/10] clk: qcom: camcc: Add support for camera clock
 controller for Eliza
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260804-eliza-mm-cc-v9-v9-9-39067760dc3c@oss.qualcomm.com>
References: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
 <20260804-eliza-mm-cc-v9-v9-9-39067760dc3c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 18:57:29 +0000
Message-Id: <20260804185730.4A44E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing post-divider clock definition for `cam_bist_mclk_cc_pll0_o=
ut_even` causes incorrect RCG frequency calculations.
--

--- Patch [9]: [PATCH v9 09/10] clk: qcom: camcc: Add support for camera cl=
ock controller for Eliza ---
commit 8a0c7a74e032d685c7765438594ec88ec68d1f8a
Author: Taniya Das <taniya.das@oss.qualcomm.com>

clk: qcom: camcc: Add support for camera clock controller for Eliza

Add support for the Camera Clock Controller (CAMCC) on the Eliza platform,
which includes both the primary camera clock controller and the Camera BIST
clock controller required for functional MCLK operations.

> --- /dev/null
> +++ b/drivers/clk/qcom/cambistmclkcc-eliza.c
[ ... ]
> +static const struct parent_map cam_bist_mclk_cc_parent_map_0[] =3D {
> +	{ P_BI_TCXO, 0 },
> +	{ P_CAM_BIST_MCLK_CC_PLL0_OUT_EVEN, 3 },
> +	{ P_CAM_BIST_MCLK_CC_PLL0_OUT_MAIN, 5 },
> +};
> +
> +static const struct clk_parent_data cam_bist_mclk_cc_parent_data_0[] =3D=
 {
> +	{ .index =3D DT_BI_TCXO },
> +	{ .hw =3D &cam_bist_mclk_cc_pll0.clkr.hw },
> +	{ .hw =3D &cam_bist_mclk_cc_pll0.clkr.hw },
> +};

[Severity: High]
Is a post-divider definition missing here for the OUT_EVEN path?

Both the OUT_EVEN and OUT_MAIN paths currently point directly to the base
PLL (cam_bist_mclk_cc_pll0). Without a separate clk_alpha_pll_postdiv
definition for OUT_EVEN, the clock framework cannot read the hardware
post-divider and will assume the rate is the full 960 MHz instead of the
divided rate (e.g., 480 MHz).

[ ... ]
> +static const struct freq_tbl ftbl_cam_bist_mclk_cc_mclk0_clk_src[] =3D {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	F(24000000, P_CAM_BIST_MCLK_CC_PLL0_OUT_EVEN, 10, 1, 4),

[Severity: High]
Will this result in an incorrect output frequency for the 24 MHz MCLK?

Because the framework assumes the P_CAM_BIST_MCLK_CC_PLL0_OUT_EVEN input
is 960 MHz, it calculates a division factor of 40 (pre_div=3D10, n=3D4) to
achieve 24 MHz. If the actual hardware parent rate is 480 MHz, dividing by
40 would result in an MCLK frequency of 12 MHz instead, which could cause
camera sensor initialization or streaming to fail.

> +	F(68571429, P_CAM_BIST_MCLK_CC_PLL0_OUT_MAIN, 14, 0, 0),
> +	{ }
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-eliza-mm-c=
c-v9-v9-0-39067760dc3c@oss.qualcomm.com?part=3D9
