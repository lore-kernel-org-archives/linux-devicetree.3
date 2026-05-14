Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD14039B94B
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 11:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778756490; cv=none; b=FeRn3yX+1fMkBjMMyddYWOJsabE6doxVnyYdFqlhPjV8mEUq8MY2A/41g0xnqlMQrzSGfx7U+FrL6ChACKlsNq5xrZdIuu2QMAmWdnMo4NNCL1bv/cXv3IY0fPrkQ8ylMzW2EKZrd3IyiQ+R3lpPemHTh/a8Wkefwtj6MBaK3Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778756490; c=relaxed/simple;
	bh=fL9V1nM4j0hViGltNBf4/Czdjtvv+LSdVBgoCznzcVk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Qf4FwsgEvy/Zg0+PVKsZSmLBXdfk/IJy5R5Cb06OpYpGchKFo+AU+WvE5kJBXGdAcba0lT9Pi6yPP5WXBBOrUaSXaQtJGfRKPumFZxBWk+RnokJ1xuEMU0HIU97rdhBcOWLSkxM2opZrjfKYOC0/CeT9FfEPXIijzDGTO4BoQM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U6N+GyhL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U6N+GyhL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3CEC2BCB3;
	Thu, 14 May 2026 11:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778756490;
	bh=fL9V1nM4j0hViGltNBf4/Czdjtvv+LSdVBgoCznzcVk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=U6N+GyhLMjlGf485Y1bjkKRvydOWvj2g9T8ByBZsvGSMqRLOQtoK9Odohn7H8JuBw
	 ivDSXZalJM8BqXqMcOilFyPBtaMvHvXWXlD3/wXCcLRutxr0RVFoby1skWLpFZRhSu
	 qTb6vaO0qV4G02VMjWTCFJiykhBS3A12SlgKCLGXfbft3PG3w5rBPfFtrb9YvCMPNF
	 LGViiZaQMVS7PK597SIHihl+SH9vpmkp3ENIeZSHdyrgWyvGlmt3TIrK8ZYVkui+VC
	 R57/Aoh8URvj39wggQndydmAyRziGsmgnVezsQ9IJuopIJnx71e3X5yFlDt/09vEt6
	 jbanscX+KG6TQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/7] clk: qcom: camcc: Add support for camera clock
 controller for Eliza
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260513-eliza_mm_cc_v2-v3-6-b59c370dc281@oss.qualcomm.com>
References: <20260513-eliza_mm_cc_v2-v3-6-b59c370dc281@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 11:01:29 +0000
Message-Id: <20260514110130.0B3CEC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing `.use_rpm =3D true` in `cam_cc_eliza_desc` prevents Runtim=
e PM enablement for the Camera CC domain.
- [High] Missing `clk_alpha_pll_postdiv` for `cam_bist_mclk_cc_pll0_out_eve=
n` leads to a 50% clock rate reduction in hardware.
--

commit f093d67b6e760a407d12b8dbe60badad11296713
Author: Taniya Das <taniya.das@oss.qualcomm.com>

clk: qcom: camcc: Add support for camera clock controller for Eliza

Add support for the Camera Clock Controller (CAMCC) on the Eliza
platform, which includes both the primary camera clock controller and
the Camera BIST clock controller.

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
> +};

Is P_CAM_BIST_MCLK_CC_PLL0_OUT_EVEN pointing to the correct hardware
representation here?

Since it points directly to the main PLL (&cam_bist_mclk_cc_pll0.clkr.hw)
instead of a dedicated clk_alpha_pll_postdiv struct, the framework might
calculate the clock rate using the main PLL's 960 MHz instead of the
physical EVEN output's 480 MHz.

This means F(24000000, P_CAM_BIST_MCLK_CC_PLL0_OUT_EVEN, 10, 1, 4) would
evaluate to 24 MHz in software (960 MHz / 10 * 1/4), but might actually
produce 12 MHz in hardware. Does this need a clk_alpha_pll_postdiv defined
for the EVEN output?

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
> +};

Should .use_rpm =3D true be set here to enable runtime PM?

Without it, qcom_cc_probe() won't call devm_pm_runtime_enable(). This
could cause clk_pm_runtime_get() to trivially succeed without turning on
the required power domain, which might lead to unclocked hardware accesses.

Note that the cambistmclkcc-eliza_desc structure correctly sets this flag.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-eliza_mm_c=
c_v2-v3-0-b59c370dc281@oss.qualcomm.com?part=3D6
