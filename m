Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F93338E5D4
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 04:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780374599; cv=none; b=Gn/AyGckHhty5t79Tzjw4nqGjQ+yM+YGU4/UoZ46gu8bD51WouAUuOUUEQ4bb6F2KSPhOJo6DwYpa2VfAF+yX83/MO+XrUqEMnD6+ljaQ5zmZipF5h7sQy86nHsZJfOpoo6+KxGExiSBOlaIG9Q8YuHJ/vOrAaCEsPHsjRtOClg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780374599; c=relaxed/simple;
	bh=NGo0h+02Adc/D4xoyAteRBgqqXY0wpdTQPi4aVX/K6A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JwXq5+mVuzLL/4vEfwkwbwxD8gweLT2Pe6kCXhnZouq1FLZmcuUIeGK0uWBMv/rNZhiKgn0MfX/hrl2vPQX22NFdOUW+7hiHhphPGLEw+Ho9aCrWrYaGIdAm6V+BkgtBvEIUkOJVOnk9yh/BudTl8rtbmD6sSSGSzaKGpVs6x4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f/2BwWpi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f/2BwWpi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E670A1F00893;
	Tue,  2 Jun 2026 04:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780374598;
	bh=m2tpJxYw8PZgd808gezc+7iRsL2lTcJqpVfv+l3B4Kk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f/2BwWpijOL2NanagURC+A9NzAbHeTx5ukJrJIRZxY8Y1iXMqwxJ+dYD1pcflHxtd
	 bmClAi7bihHv/ugb5QdGXOWzs70PBjuQTdWZWbIpB2kuJnhygDCdiF12sS1QmlnLNW
	 USS/zQoTVFqas9BU4L31BMm1ANh/bCBHBGuqtuLL04F1RDDLb70kKDn29sbO+t9xXX
	 wJI04k3ZXetlynp9HTalSyt7K+kChLWrv8TGka7YndUMmob16I4NPCEunVVqxSZbVJ
	 t/B0oVk7auz+8ZRL0T0aljhuTPMTqhIAdpYZwhQaAqPZ+ovHIfO44LqNtw47LNdpuj
	 uwIPjvP9h23eQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] clk: qcom: Add Global clock controller support
 on Qualcomm Shikra SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Imran Shaik" <imran.shaik@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260601-shikra-gcc-rpmcc-clks-v3-4-76c455f5d579@oss.qualcomm.com>
References: <20260601-shikra-gcc-rpmcc-clks-v3-4-76c455f5d579@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 04:29:57 +0000
Message-Id: <20260602042957.E670A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] P_GPLL9_OUT_MAIN is incorrectly mapped to `&gpll9.clkr.hw` instead=
 of `&gpll9_out_main.clkr.hw` in multiple parent_data arrays.
--

commit 8df3ccae480064b5a00fac346690547cc25ca9a3
Author: Imran Shaik <imran.shaik@oss.qualcomm.com>

clk: qcom: Add Global clock controller support on Qualcomm Shikra SoC

Add support for Global clock controller (GCC) on Qualcomm Shikra SoC.

> diff --git a/drivers/clk/qcom/gcc-shikra.c b/drivers/clk/qcom/gcc-shikra.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-shikra.c
[ ... ]
> +static const struct parent_map gcc_parent_map_7[] =3D {
> +	{ P_BI_TCXO, 0 },
> +	{ P_GPLL0_OUT_EARLY, 1 },
> +	{ P_GPLL8_OUT_EARLY, 2 },
> +	{ P_GPLL10_OUT_MAIN, 3 },
> +	{ P_GPLL8_OUT_MAIN, 4 },
> +	{ P_GPLL9_OUT_MAIN, 5 },
> +	{ P_GPLL3_OUT_EARLY, 6 },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_7[] =3D {
> +	{ .index =3D DT_BI_TCXO },
> +	{ .hw =3D &gpll0.clkr.hw },
> +	{ .hw =3D &gpll8.clkr.hw },
> +	{ .hw =3D &gpll10.clkr.hw },
> +	{ .hw =3D &gpll8_out_main.clkr.hw },
> +	{ .hw =3D &gpll9.clkr.hw },

[Severity: High]
Should P_GPLL9_OUT_MAIN map to &gpll9_out_main.clkr.hw instead of
&gpll9.clkr.hw here in gcc_parent_data_7?

The gpll9 clock represents the early BRAMMO PLL output running at 1152 MHz,
while gpll9_out_main is explicitly defined with a fixed div-2 post-divider,
running at 576 MHz. By mapping P_GPLL9_OUT_MAIN to the early gpll9 output,
the clock framework might assume the source frequency is 1152 MHz instead
of 576 MHz.

This could cause the CCF to calculate a hardware divider that is twice as
large as intended, which would make the physical clock supplied to subsyste=
ms
run at exactly half of its requested frequency.

[ ... ]
> +static const struct clk_parent_data gcc_parent_data_8[] =3D {
> +	{ .index =3D DT_BI_TCXO },
> +	{ .hw =3D &gpll0.clkr.hw },
> +	{ .hw =3D &gpll8.clkr.hw },
> +	{ .hw =3D &gpll10.clkr.hw },
> +	{ .hw =3D &gpll8_out_main.clkr.hw },
> +	{ .hw =3D &gpll9.clkr.hw },

[Severity: High]
Does this also need to map to &gpll9_out_main.clkr.hw to ensure the correct
clock frequency is calculated for gcc_parent_data_8?

[ ... ]
> +static const struct clk_parent_data gcc_parent_data_9[] =3D {
> +	{ .index =3D DT_BI_TCXO },
> +	{ .hw =3D &gpll0.clkr.hw },
> +	{ .hw =3D &gpll8.clkr.hw },
> +	{ .hw =3D &gpll10.clkr.hw },
> +	{ .hw =3D &gpll6_out_main.clkr.hw },
> +	{ .hw =3D &gpll9.clkr.hw },

[Severity: High]
Is the same P_GPLL9_OUT_MAIN mapping issue present in gcc_parent_data_9?

[ ... ]
> +static const struct clk_parent_data gcc_parent_data_14[] =3D {
> +	{ .index =3D DT_BI_TCXO },
> +	{ .hw =3D &gpll0.clkr.hw },
> +	{ .hw =3D &gpll0_out_aux2.clkr.hw },
> +	{ .hw =3D &gpll10.clkr.hw },
> +	{ .hw =3D &gpll8_out_main.clkr.hw },
> +	{ .hw =3D &gpll9.clkr.hw },

[Severity: High]
Could you check if this entry in gcc_parent_data_14 should point to
&gpll9_out_main.clkr.hw as well?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601-shikra-gcc=
-rpmcc-clks-v3-0-76c455f5d579@oss.qualcomm.com?part=3D4
