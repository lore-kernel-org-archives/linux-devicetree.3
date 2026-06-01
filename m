Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553843EE1E7
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 18:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780339314; cv=none; b=aKhWHgDGYpBZI2x9x3B+3CrIdNa012wogchDS0UCYEV+TCHz8AD6C9lbg+dsPEmSZQw84gDqTPHbi4tynncQ1Wd+04+19OYm9pEc+5vPq+ADfy+RniGLx1bWcym1c4tgMvz9lPR1LmPLTWTQHvza1QPxPs82wCid2fzRrc4X2GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780339314; c=relaxed/simple;
	bh=C4XSTEssLF82Z71j54C2rEy+ymEbLRgc5gBMD8Q06g0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZXvRGoXr7cK7knX3bJRwcGeo8P5vh6NXP4daUO4e1oVLR96bY9N/Objf6wGZx0K2rfMWj25TfVBrvLBJ3ZxRZZ6na5caAqqQj2h44bLmw4si9/P3acpcJUS/NKDScpCoUu5eG2KEovwn/OIrleL8RnP8VMhyeomSQGcMdvbGyQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JlNdXJvQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JlNdXJvQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D0A1F00898;
	Mon,  1 Jun 2026 18:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780339306;
	bh=RXF7PmvdcgzP8fv2+DhB/5IfY480GgEEtJfytkgKuy0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JlNdXJvQrRM8JtXcgytnvg8YP8tSPzauFaWl+/T8xEWA/p+MMHJULZyldaKchsu0h
	 h4kkibeXf5+XOBu/Ut4P+EDRyreXTRY6yOcLJ0DTgQ/6nUFVrfjB/u9aEtNALT6d0R
	 xK595+godSBsiiGPJUSRaH6csGULVnqrqvG1sheyNDG5gtB0XLvSkEhkfdO8y/VGS5
	 Mm/V29Lfp2o7Hpo6oGFBJ2WY9/MoPCpFpM+dfjO0iklEOTryaT2+u5cUlq9/FdVVjN
	 Scv8EnWM0CpWtyNIY/Ts6d2lJxhog/H7XOjMLiAK/2oxp0mHRf6Bc2tX5W/aFDavi5
	 uZqesfwknHBCA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 06/12] clk: qcom: dispcc-qcm2290: Switch to DT index
 based clk lookup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Imran Shaik" <imran.shaik@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260601-shikra-dispcc-gpucc-v3-6-61c1ba3735e8@oss.qualcomm.com>
References: <20260601-shikra-dispcc-gpucc-v3-6-61c1ba3735e8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 18:41:46 +0000
Message-Id: <20260601184146.80D0A1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The DSI1 PHY PLL byte clock input is not wired up in the parent ma=
ppings, making the DSI1 PHY support incomplete.
--

commit 6900a283b3a0edc157171145f5dc5bdc527dae67
Author: Imran Shaik <imran.shaik@oss.qualcomm.com>

clk: qcom: dispcc-qcm2290: Switch to DT index based clk lookup

This commit updates the QCM2290 DISPCC driver to use DT index based
parent clock lookups and fixes the parent data for mdss ahb/mdp clocks.
It also introduces support for the DSI1 PHY PLL input clocks.

> diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-=
qcm2290.c
> index 1c21267ae0f7a..f5dbd19d0a033 100644
> --- a/drivers/clk/qcom/dispcc-qcm2290.c
> +++ b/drivers/clk/qcom/dispcc-qcm2290.c

[ ... ]

> @@ -72,8 +86,8 @@ static const struct parent_map disp_cc_parent_map_0[] =
=3D {
>  };
> =20
>  static const struct clk_parent_data disp_cc_parent_data_0[] =3D {
> -	{ .fw_name =3D "bi_tcxo" },
> -	{ .fw_name =3D "dsi0_phy_pll_out_byteclk" },
> +	{ .index =3D DT_BI_TCXO },
> +	{ .index =3D DT_DSI0_PHY_PLL_OUT_BYTECLK },
>  };

[Severity: High]
The commit message mentions adding DSI1 PHY PLL input clocks support, and
the enums for the DSI1 byte clock are added earlier in the patch.

Should P_DSI1_PHY_PLL_OUT_BYTECLK and DT_DSI1_PHY_PLL_OUT_BYTECLK be added
to disp_cc_parent_map_0 and disp_cc_parent_data_0 as well, similar to how
the DSICLK was added to disp_cc_parent_map_4 below?

Without it, does the hardware lack the ability to select the DSI1 byte
clock for disp_cc_mdss_byte0_clk_src?

[ ... ]

> @@ -101,19 +115,21 @@ static const struct parent_map disp_cc_parent_map_3=
[] =3D {
>  };
> =20
>  static const struct clk_parent_data disp_cc_parent_data_3[] =3D {
> -	{ .fw_name =3D "bi_tcxo" },
> +	{ .index =3D DT_BI_TCXO },
>  	{ .hw =3D &disp_cc_pll0.clkr.hw },
> -	{ .fw_name =3D "gcc_disp_gpll0_clk_src" },
> +	{ .index =3D DT_GPLL0 },
>  };
> =20
>  static const struct parent_map disp_cc_parent_map_4[] =3D {
>  	{ P_BI_TCXO, 0 },
>  	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
> +	{ P_DSI1_PHY_PLL_OUT_DSICLK, 2 },
>  };
> =20
>  static const struct clk_parent_data disp_cc_parent_data_4[] =3D {
> -	{ .fw_name =3D "bi_tcxo" },
> -	{ .fw_name =3D "dsi0_phy_pll_out_dsiclk" },
> +	{ .index =3D DT_BI_TCXO },
> +	{ .index =3D DT_DSI0_PHY_PLL_OUT_DSICLK },
> +	{ .index =3D DT_DSI1_PHY_PLL_OUT_DSICLK },
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601-shikra-dis=
pcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com?part=3D6
