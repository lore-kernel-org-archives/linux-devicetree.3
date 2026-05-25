Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54B818EB0
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 13:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779714283; cv=none; b=EXb4g3C+tbOEx2/l2kEv7MIELOE9PsuxQNOpVht5Z+PIRloMuHiftQpLaGO7jTTxnTn+TQT2N2GJhYZx12bXJYlFEX+vz2fHA5TL6vKMxIcQdADI6A20a3ny9YuIghMgxzJJO2UVp0Qc2ioDFHaK4+qzCRzJzVOetrJ9z57R3zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779714283; c=relaxed/simple;
	bh=UMnHkDDnr/z0RY1FZOz1bxk8DvmVvKw762RtMD0LR40=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f0HPu5dASEuFfxbRZlzR9zPsQbZVqec6hsbss3K6zeo5wN5r82qUbR2pQgnf4Zu/Hs6654CxKTczszkCdmGp6hf1hvLYtNz3TIuygvP0sBfAJaIlf8hmeE4N88C3SjzzWK/11FjH57vuIuze3pYvEvAfLMemYCxqXLJEWD4UoGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8RgXmJj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8RgXmJj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 672011F000E9;
	Mon, 25 May 2026 13:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779714281;
	bh=k6xYSsOxe9P0k07Yglq0RNzWOpch657zTv082x8uzNA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q8RgXmJjiVKWX3+tyFmQc/gBI2HsVk9/BSGl4TnbXib/NEpxAVOiwY8AZCsPFDzBa
	 N2TQ2ppzjAuU24Zqoby40ZsNlfuvfnVPiTB4WHc7j6catR3A1ORYifI6q9Y74gKseY
	 Pwkvu7OBwCuwFDZCQkQmqVel+JD4lDZ3PnohGmXxhLGJP8QiGoWdxdgYWFNALu4fH0
	 R5kxt/VNljtKXNFOFYimWE2cvle5KGyFbnsOx/TBVHZhYJqVVTMS+efQHESRfnm3Wj
	 GdLU8ojLya3ZHEhQMMUH8WeE8aQFC00MI6UUFwSlIuTb47oLhJ/Fpn5h9UScs3ppQL
	 WbohR5h4avB7A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/7] clk: qcom: camcc: Add support for camera clock
 controller for Eliza
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-6-a1d125619a5a@oss.qualcomm.com>
References: <20260525-eliza_mm_cc_v2-v5-6-a1d125619a5a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 13:04:40 +0000
Message-Id: <20260525130441.672011F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The `cam_cc_eliza_desc` structure in `camcc-eliza.c` is missing th=
e `.use_rpm =3D true` flag, preventing runtime PM enablement.
- [High] Missing `clk_alpha_pll_postdiv` definition for `cam_bist_mclk_cc_p=
ll0_out_even` causes incorrect rate calculation and hardware configuration.
- [Low] Inconsistent 'default m if ARCH_QCOM' across related Eliza clock co=
nfigs.
--


commit 5422290959f8d7c156105b5bd2ca77def397be5f
Author: Taniya Das <taniya.das@oss.qualcomm.com>

clk: qcom: camcc: Add support for camera clock controller for Eliza

Add support for the Camera Clock Controller (CAMCC) on the Eliza
platform. The CAMCC block on Eliza includes both the primary camera
clock controller and the Camera BIST clock controller.

> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 5641929a3da49..cb44a9972a6a6 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -19,6 +19,17 @@ menuconfig COMMON_CLK_QCOM
> =20
>  if COMMON_CLK_QCOM
> =20
> +config CLK_ELIZA_CAMCC
> +	tristate "Eliza Camera Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	select CLK_ELIZA_GCC
> +	default m if ARCH_QCOM

[Severity: Low]
This isn't a bug, but should this default match the adjacent
CLK_ELIZA_DISPCC config, which does not specify a default?

> +	help
> +	  Support for the camera clock controller on Qualcomm Technologies, Inc
> +	  Eliza devices.
> +	  Say Y if you want to support camera devices and functionality such as
> +	  capturing pictures.
> +
>  config CLK_ELIZA_DISPCC
>  	tristate "Eliza Display Clock Controller"
>  	depends on ARM64 || COMPILE_TEST

[ ... ]

> diff --git a/drivers/clk/qcom/cambistmclkcc-eliza.c b/drivers/clk/qcom/ca=
mbistmclkcc-eliza.c
> new file mode 100644
> index 0000000000000..b65e224a1be90
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

[Severity: High]
Does this code map P_CAM_BIST_MCLK_CC_PLL0_OUT_EVEN directly to the main
PLL hardware instead of a dedicated clk_alpha_pll_postdiv structure? Without
a postdiv structure, the Common Clock Framework will evaluate the EVEN outp=
ut
rate identically to the MAIN output (960 MHz) instead of its physically
divided rate (480 MHz).

> +};

[ ... ]

> +static const struct freq_tbl ftbl_cam_bist_mclk_cc_mclk0_clk_src[] =3D {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	F(24000000, P_CAM_BIST_MCLK_CC_PLL0_OUT_EVEN, 10, 1, 4),

[Severity: High]
With the missing postdiv structure above, this frequency table uses a divis=
or
of 10 to target 24 MHz based on a 960 MHz parent. Since the hardware
actually supplies 480 MHz on the physical EVEN output, applying the same
divisor will result in a physical output of 12 MHz, halving the MCLK
frequency. Should a clk_alpha_pll_postdiv be added and this frequency table
updated to use the correct divisor?

> +	F(68571429, P_CAM_BIST_MCLK_CC_PLL0_OUT_MAIN, 14, 0, 0),
> +	{ }
> +};

[ ... ]

> diff --git a/drivers/clk/qcom/camcc-eliza.c b/drivers/clk/qcom/camcc-eliz=
a.c
> new file mode 100644
> index 0000000000000..b96a2a58b32a7
> --- /dev/null
> +++ b/drivers/clk/qcom/camcc-eliza.c

[ ... ]

> +static const struct qcom_cc_desc cam_cc_eliza_desc =3D {
> +	.config =3D &cam_cc_eliza_regmap_config,
> +	.clks =3D cam_cc_eliza_clocks,
> +	.num_clks =3D ARRAY_SIZE(cam_cc_eliza_clocks),
> +	.resets =3D cam_cc_eliza_resets,
> +	.num_resets =3D ARRAY_SIZE(cam_cc_eliza_resets),
> +	.gdscs =3D cam_cc_eliza_gdscs,
> +	.num_gdscs =3D ARRAY_SIZE(cam_cc_eliza_gdscs),
> +	.driver_data =3D &cam_cc_eliza_driver_data,

[Severity: High]
Is the .use_rpm =3D true flag missing from this structure? In the qcom_cc
framework, this flag instructs qcom_cc_probe() to enable runtime PM.
Omitting it means the power domain remains off, which leads to unclocked
register accesses and causes a Data Abort or bus stall when the driver
attempts to access the registers or GDSCs during probe.

> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525-eliza_mm_c=
c_v2-v5-0-a1d125619a5a@oss.qualcomm.com?part=3D6
