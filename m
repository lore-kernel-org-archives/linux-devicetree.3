Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178B83DB641
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 18:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780339091; cv=none; b=KBO+HfdF4CABK/V0BoTXe7Z+ON61/algwI8qd7D4Lo/t1tISzwg1ja4UWFaXUS1LueqOXZlupX+dvSGFWfHYjXlm2WcNZW2LF4IgXe2HirIvCW6INK1e6VB2HiTYvwC23yzUTDQ5ESicsVNe0+XUwBnwjsUXuV+71+xelVzwJSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780339091; c=relaxed/simple;
	bh=pevBl235T2YvZp8b7104tSITnEG7vyAvaE7bKxG1tas=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VwiVukdp1DN13LBrAkKGJ3WCM+h4PIkAhsJh2UQIRXFLVtpUAR6djXAe/Xr1xxyCmBmkH05zA4DedbIWNlRfyOrqlE0ifP3P15YlTjy5XNFs107ewXy0KuoeJtsAqKg8THqiWKhpnVndNPmG7jZZC6ieJnT7XWMaaLdWLPjKjEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mQhtkJIZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mQhtkJIZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 871C41F00893;
	Mon,  1 Jun 2026 18:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780339089;
	bh=bcvGzlAM8CvFhYzG6RoTm+vfFdSFxpcgweYvAFjiK9I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mQhtkJIZCUN/NDZYvi9wJFIXv4Ova55G+D3mJPc8ZNHPgRHVAL4ra+eUlAGnqMkO8
	 YAoWYPTM42tqq6Lupv0p57G45V38I3fxswLZIT5qmgm9oHF29DYEUV694fdvRjO7Ug
	 8UKGk79lGXkPJBQidX66iehJ1YFFttBkXlNnmf1bRmOi96015k3QMSXN45J2ERKRCV
	 kuHkyuPTEEw1xoTF2+k/gfY0GqdJjkC/9tcewYs0FIDw/mo9Vc3S66bsoQs6LUQpb7
	 HPyH03gd8PuCKN4K6RahwAy4e6nQ2ptViUwt6eyCyypQjxIZDhxKv+Z9evfmi1d9YP
	 Qi2uI52Kds7VQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 03/12] dt-bindings: clock: qcom: Add Qualcomm Shikra
 Display clock controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Imran Shaik" <imran.shaik@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260601-shikra-dispcc-gpucc-v3-3-61c1ba3735e8@oss.qualcomm.com>
References: <20260601-shikra-dispcc-gpucc-v3-3-61c1ba3735e8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 18:38:09 +0000
Message-Id: <20260601183809.871C41F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The `clocks` and `clock-names` properties lack a `minItems` constr=
aint after adding new clocks, breaking validation for legacy device trees.
- [High] Enum indices for GPLL0 parent clocks are swapped compared to the D=
T bindings, causing MDSS clocks to run at half frequency.
- [Medium] The driver globally modifies a static frequency table during pro=
be based on the device compatible string, causing state contamination.
--

Hello,

I am an automated review bot. I have reviewed the patch series and found a
few regressions across the following commits.

commit 85e4a2f46a61d48ee9c66caba34fbc7a3fa61a61
Author: Imran Shaik <imran.shaik@oss.qualcomm.com>

dt-bindings: clock: qcom,qcm2290-dispcc: Add DSI1 PHY and sleep clocks
   =20
Update the QCM2290 DISPCC binding to document additional clock inputs
supported by the hardware, including DSI1 PHY byte/pixel clocks and
the sleep clock, alongside the existing clock list. This is an ABI
extension, and existing clock inputs ordering is unchanged.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.=
yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
> index 4a533b45eec2d..24f2cce033f6e 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
[ ... ]
> @@ -36,6 +39,9 @@ properties:
>        - const: gcc_disp_gpll0_div_clk_src
>        - const: dsi0_phy_pll_out_byteclk
>        - const: dsi0_phy_pll_out_dsiclk
> +      - const: dsi1_phy_pll_out_byteclk
> +      - const: dsi1_phy_pll_out_dsiclk
> +      - const: sleep_clk

[Severity: High]
Is it possible that omitting a minItems constraint for the clocks and
clock-names arrays breaks validation for legacy device trees?

In dt-schema, an items array without minItems defaults to expecting exactly
the maximum number of items. This causes make dtbs_check to strictly require
exactly 9 clocks for the qcom,qcm2290-dispcc compatible.

Could this break schema validation for legacy device trees that legally
provided only the original 6 clocks, violating DT backward compatibility
rules?

commit 6900a283b3a0edc157171145f5dc5bdc527dae67
Author: Imran Shaik <imran.shaik@oss.qualcomm.com>

clk: qcom: dispcc-qcm2290: Switch to DT index based clk lookup
   =20
Update the QCM2290 DISPCC driver to use the DT index based parent clock
lookup to align with the latest convention. While at it, fix the parent
data of mdss ahb/mdp clocks to use GPLL0 main output as per HW clock plan,
and update frequency table accordingly. Also, add the DSI1 PHY PLL input
clocks support.

> diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-=
qcm2290.c
> index 1c21267ae0f7a..f5dbd19d0a033 100644
> --- a/drivers/clk/qcom/dispcc-qcm2290.c
> +++ b/drivers/clk/qcom/dispcc-qcm2290.c
> @@ -24,6 +24,18 @@
>  #include "gdsc.h"
>  #include "reset.h"
> =20
> +enum {
> +	DT_BI_TCXO,
> +	DT_BI_TCXO_AO,
> +	DT_GPLL0_OUT_DIV,
> +	DT_GPLL0,
> +	DT_DSI0_PHY_PLL_OUT_BYTECLK,
> +	DT_DSI0_PHY_PLL_OUT_DSICLK,
> +	DT_DSI1_PHY_PLL_OUT_BYTECLK,
> +	DT_DSI1_PHY_PLL_OUT_DSICLK,
> +	DT_SLEEP_CLK,
> +};
> +
[ ... ]
>  static const struct parent_map disp_cc_parent_map_2[] =3D {
>  	{ P_BI_TCXO_AO, 0 },
> -	{ P_GPLL0_OUT_DIV, 4 },
> +	{ P_GPLL0_OUT_MAIN, 4 },
>  };
> =20
>  static const struct clk_parent_data disp_cc_parent_data_2[] =3D {
> -	{ .fw_name =3D "bi_tcxo_ao" },
> -	{ .fw_name =3D "gcc_disp_gpll0_div_clk_src" },
> +	{ .index =3D DT_BI_TCXO_AO },
> +	{ .index =3D DT_GPLL0 },

[Severity: High]
Are the enum indices for the GPLL0 parent clocks swapped compared to the DT
bindings?

The DT binding qcom,qcm2290-dispcc.yaml lists the main clock at index 2
(gcc_disp_gpll0_clk_src) and the div clock at index 3
(gcc_disp_gpll0_div_clk_src).

However, the enum mapping defines DT_GPLL0_OUT_DIV at index 2 and DT_GPLL0
at index 3. Due to this mismatch, DT_GPLL0 fetches the div clock instead
of the main clock.

By setting .index =3D DT_GPLL0, disp_cc_parent_data_2 incorrectly maps to t=
he
divided output, halving the expected frequency for the MDSS AHB clocks.

[ ... ]
>  static const struct parent_map disp_cc_parent_map_3[] =3D {
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

[Severity: High]
Could this also incorrectly map MDP clocks to the div clock because of the
swapped enum index?

commit 6798f69afeb9c9f6942dbf7fe2d0b171657b2f8f
Author: Imran Shaik <imran.shaik@oss.qualcomm.com>

clk: qcom: Add support for Qualcomm GPU Clock Controller on Shikra
   =20
The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
hardware block, with minor differences. Hence add support for Shikra
GPUCC by extending the QCM2290 GPUCC driver.

> diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qc=
m2290.c
> index 6e696cf672923..f43dd8231fb20 100644
> --- a/drivers/clk/qcom/gpucc-qcm2290.c
> +++ b/drivers/clk/qcom/gpucc-qcm2290.c
[ ... ]
> @@ -357,12 +368,16 @@ static const struct qcom_cc_desc gpu_cc_qcm2290_des=
c =3D {
> =20
>  static const struct of_device_id gpu_cc_qcm2290_match_table[] =3D {
>  	{ .compatible =3D "qcom,qcm2290-gpucc" },
> +	{ .compatible =3D "qcom,shikra-gpucc" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, gpu_cc_qcm2290_match_table);
> =20
>  static int gpu_cc_qcm2290_probe(struct platform_device *pdev)
>  {
> +	if (device_is_compatible(&pdev->dev, "qcom,shikra-gpucc"))
> +		gpu_cc_gx_gfx3d_clk_src.freq_tbl =3D ftbl_gpu_cc_gx_gfx3d_clk_src_shik=
ra;
> +

[Severity: Medium]
Could updating the global static structure here cause state contamination?

If the compatible string is qcom,shikra-gpucc, it permanently mutates
gpu_cc_gx_gfx3d_clk_src.freq_tbl for the entire driver module. If the driver
is unbound and rebound to a different compatible device, or in a theoretical
multi-instance scenario, the frequency table remains permanently overwritte=
n.

Would it be better to pass a device-specific qcom_cc_desc using
of_device_id.data or dynamically allocate the clock structure to avoid
static state contamination?

>  	return qcom_cc_probe(pdev, &gpu_cc_qcm2290_desc);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601-shikra-dis=
pcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com?part=3D3
