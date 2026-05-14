Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E038425393E
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 11:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778757398; cv=none; b=Osb9qZmNXBz49iOZ6yoQFvr8lw2y/VWduj+DFScUgvYiVzzmTyFfbjcq2V10t1gWIZdZN88S4HLrqUJOR82TbNxOFbRnqGHFSAdWYMhoq2x6/dF7XwnaHeqvTa8xXIrls606UWejLdHWzklijjRF/QUqSHgCLYGFCT5bHhrwVxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778757398; c=relaxed/simple;
	bh=HpUP8RrtIjNHfEy8ZEjtTOkThMQaZ2/Zr5enStYWiIg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gL9T7ruDFUUDzS4Gi6VWmToQXbIdiOtVQe7/OYeY9U6+9vul2bRjlxkhf91VGuL+AoSJNopwLz4Y6Rdr5tiSmpqSKV+tMpmYZnlobJd1rTGOM5GtAO/sLggfd7LjkE8G7Vd9DtBGYVKfQZ35l0WQNRzUOs5l/MphL+h9Y6cUOwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XBogNe3I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XBogNe3I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56715C2BCB8;
	Thu, 14 May 2026 11:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778757398;
	bh=HpUP8RrtIjNHfEy8ZEjtTOkThMQaZ2/Zr5enStYWiIg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=XBogNe3IgfdPF2N6KUZkbjbPU3Q9tANj+B01Jatz5uzuqlbB+ISrelp7gZ3hbuQra
	 GpteyQV5m7iUpd4t2b1122m42kpaWD214TvU1dnSoOAhQ0hnNtHAZFValDjht9woZD
	 RjnUrEDAVSPfudZl68cOvg7UO0DBERLEAhcf1iE1y+ggpoFwwL3Bff+t9IFjFJJdiz
	 GerTVXFM4zlrfWyHTbDGD3YLBX1s3ye0MYEPXKlttAvymrlvC2Pj0SxUID64teI3Hg
	 mKSIpYrzGcNiw+qqV8ujk4nTVkeHbbGpC8bptBWLuJgUfgRtGD73ZPL9WSaybhU17E
	 E3OSjT71WzMNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/7] clk: qcom: camcc: Add support for camera clock
 controller for Eliza
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260513-eliza_mm_cc_v2-v4-6-e61b5434e8d9@oss.qualcomm.com>
References: <20260513-eliza_mm_cc_v2-v4-6-e61b5434e8d9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 11:16:29 +0000
Message-Id: <20260514111638.56715C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing `clk_alpha_pll_postdiv` clock definition for `cam_bist_mcl=
k_cc_pll0_out_even` causes MCLKs to run at half their expected frequency.
- [High] Missing `.use_rpm =3D true` flag in `cam_cc_eliza_desc` in `camcc-=
eliza.c`.
--

commit 73f30968a3f7986f1c040a35702d04172dba6a67
Author: Taniya Das <taniya.das@oss.qualcomm.com>

clk: qcom: camcc: Add support for camera clock controller for Eliza

Add support for the Camera Clock Controller (CAMCC) on the Eliza
platform. The CAMCC block includes both the primary camera clock
controller and the Camera BIST clock controller.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

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

Will mapping both P_CAM_BIST_MCLK_CC_PLL0_OUT_EVEN and
P_CAM_BIST_MCLK_CC_PLL0_OUT_MAIN to the exact same hardware object cause
frequency miscalculations?

Hardware PLLs physically divide their OUT_EVEN output by 2. Without an
explicit postdiv structure modeled in the clock tree, the Common Clock
Framework might treat both inputs as supplying the undivided 960 MHz VCO
rate.

Since the ftbl_cam_bist_mclk_cc_mclk0_clk_src table configures the RCG
assuming a 960 MHz parent to yield 24 MHz, but the hardware actually
provides 480 MHz on the even output, could this result in a 12 MHz
output and break downstream camera operations?

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

Should this struct include the .use_rpm =3D true flag, similar to how it is
configured for cam_bist_mclk_cc_eliza_desc in this same patch?

If this flag is omitted, the driver might attempt to read and write hardware
registers during probe without voting for the required CX and MX power
domains to be active. Can this lead to synchronous external aborts during
probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-eliza_mm_c=
c_v2-v4-0-e61b5434e8d9@oss.qualcomm.com?part=3D6
