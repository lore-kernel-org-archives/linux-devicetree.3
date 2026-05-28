Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FD53F39EA
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 13:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779974150; cv=none; b=ngMlrUOTm0BoBi58RvF65RQugalhnIVkmmHOJxdTYrBnUV85B/b6ROfBhMQcqJ72P9rjUI0Iv33I4CnnN8EMQSiIRV0eEEvHqSZNE4YzcuF4f6ay7ro/DD98Hu4a4Ui+J5KteLtoiDMj865i1e6SUQnv2xXCDzdzqlyKgFfRA80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779974150; c=relaxed/simple;
	bh=NkZMuBR9onp543W9ukVfm7wwNYKaFFZ2oZCZ1zwP4XE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VUTExfibl+v5PWo1mBio8aXjJ48wjnXCEO6Au4e7WOftrMJkaSxKh/E6Z1+ilCptLGszbidPOVEKFPSDG8B7ZzKFxKaNbTkRpj6z20BxWxjEkwe46oD2RxUcIhMv0NIbWZ6wD/oDgCwTZ7DCV8XYVzz8/mRin36ypJMcUtN0KMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n16enElD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n16enElD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07D941F000E9;
	Thu, 28 May 2026 13:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779974149;
	bh=OOo8mWBHoA42dfqiGsORyUpVuhWTgO6+q0Hk1hgUAWc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n16enElDL7eTRyvBlmEMv2jNrY8YGn95whjNNRsWPAjC4TlpdkEfzBdgIWggKd2y2
	 5b0X05NjuBvYkzrpVa+VMB27tta7YhmnCYiPYOq4U7KpxHkgles9HhRuyzGJregEhu
	 c6hbQHfGQVd70+K1156KCS3x6JEiO4br6DtAGNBDFdXINZSrNgm34hXYPB0NvDRf3S
	 o0mxlhaChfuZdCS7pF54qHy+Mft1gafEMEw8yt+RXpl1xYEczL4O2KYIp5vH+rl69d
	 xDuOuGe9TYJjgrWXklu+11ehlwmWZorvJ3cls7btJH7XBtlnGc6avLTE0bQOrB8Lt0
	 F1SyxiOpg7oLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] clk: qcom: dispcc-qcm2290: Add support for
 Qualcomm Shikra DISPCC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Imran Shaik" <imran.shaik@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260528-shikra-dispcc-gpucc-v2-4-953f246a0fbb@oss.qualcomm.com>
References: <20260528-shikra-dispcc-gpucc-v2-4-953f246a0fbb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 13:15:48 +0000
Message-Id: <20260528131549.07D941F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing parent clock for DSI1 byte clock breaks DSI1 display opera=
tion.
- [Low] Semantic mismatch and dead code regarding GPLL0 divided clock.
--

commit f4a6601cc643cfa42c191307206d5dca13a8299a
Author: Imran Shaik <imran.shaik@oss.qualcomm.com>

clk: qcom: dispcc-qcm2290: Add support for Qualcomm Shikra DISPCC

This commit updates the Qualcomm Shikra Display clock controller parent
data for mdss ahb/mdp clocks. It corrects the GDSC wait values and flags,
and introduces support for the DSI1 PHY source.

> diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-=
qcm2290.c
> index 6d88d067337fa..19c997f3fe9f1 100644
> --- a/drivers/clk/qcom/dispcc-qcm2290.c
> +++ b/drivers/clk/qcom/dispcc-qcm2290.c
[ ... ]
> @@ -84,7 +87,7 @@ static const struct clk_parent_data disp_cc_parent_data=
_1[] =3D {
> =20
>  static const struct parent_map disp_cc_parent_map_2[] =3D {
>  	{ P_BI_TCXO_AO, 0 },
> -	{ P_GPLL0_OUT_DIV, 4 },
> +	{ P_GPLL0_OUT_MAIN, 4 },
>  };
> =20
>  static const struct clk_parent_data disp_cc_parent_data_2[] =3D {

[Severity: Low]
Does this change create a mismatch between the enum and the clock source?

The map now uses P_GPLL0_OUT_MAIN, but disp_cc_parent_data_2 still referenc=
es
gcc_disp_gpll0_div_clk_src. This change also appears to leave P_GPLL0_OUT_D=
IV
entirely unused in the codebase.

> @@ -101,17 +104,19 @@ static const struct parent_map disp_cc_parent_map_3=
[] =3D {
>  static const struct clk_parent_data disp_cc_parent_data_3[] =3D {
>  	{ .fw_name =3D "bi_tcxo" },
>  	{ .hw =3D &disp_cc_pll0.clkr.hw },
> -	{ .fw_name =3D "gcc_disp_gpll0_clk_src" },
> +	{ .fw_name =3D "gcc_disp_gpll0_div_clk_src" },
>  };

[Severity: Low]
Similar to the map above, disp_cc_parent_data_3 now points to the divided
clock source, but its corresponding map continues to use P_GPLL0_OUT_MAIN.

Is it intended for P_GPLL0_OUT_MAIN to represent the divided clock for
both multiplexers?

>  static const struct parent_map disp_cc_parent_map_4[] =3D {
>  	{ P_BI_TCXO, 0 },
>  	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
> +	{ P_DSI1_PHY_PLL_OUT_DSICLK, 2 },
>  };
> =20
>  static const struct clk_parent_data disp_cc_parent_data_4[] =3D {
>  	{ .fw_name =3D "bi_tcxo" },
>  	{ .fw_name =3D "dsi0_phy_pll_out_dsiclk" },
> +	{ .fw_name =3D "dsi1_phy_pll_out_dsiclk" },
>  };

[Severity: High]
Does the DSI1 PHY source also require parent data for the byte clock?

The P_DSI1_PHY_PLL_OUT_DSICLK source is added to disp_cc_parent_map_4 and
disp_cc_parent_data_4 here. However, P_DSI1_PHY_PLL_OUT_BYTECLK was added
to the enum earlier in this patch but omitted from disp_cc_parent_map_0 and
disp_cc_parent_data_0.

Since a DSI interface structurally requires both a pixel clock and a
synchronously derived byte clock from the same active PHY, could this omiss=
ion
prevent the hardware from configuring the byte and escape clocks to use the
DSI1 PHY, resulting in broken DSI1 functionality?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528-shikra-dis=
pcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com?part=3D4
