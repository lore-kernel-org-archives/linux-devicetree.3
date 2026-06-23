Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4DC3D3480
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782212790; cv=none; b=if0VNlHCNtilebQnQdY1g07sFCck8KuFZHHmxB0jTx8TgphtV4pmL1ICsJpX+6CTwZ83F5q0YhqE7I9vxQpOov7hajH9J1gCcbJA3pN2q5IlFzfmauyirJRcuDoo+MEsWsKuQk/8HI00ZhoDu/k1K/z5kOUQpU/Laz4y9eA9Ypw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782212790; c=relaxed/simple;
	bh=11oFm0euNrQbR4DetHHJzEEED0da1PrO59npuLhSVYU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iwCZjjuK/D8ueMtbLlk5ynpWlbArd3GzJNFc8j9xkf/5eE0B8x8Z1v30VovZWrDQ5pydvjLWGJmCqjJkh6vgZczgicn0mJAfTyUhMH2XVdF97iKOK/dapAr7Noel3TTwcUulfa7pXJN/AhhYub21DKLWKMT8NAwaC3y5oyLFIkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2wuO7wT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2wuO7wT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E001F00A3A;
	Tue, 23 Jun 2026 11:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782212788;
	bh=grtapEY7AyzcravMbgyc8KR3+yHaU3UDpzL2Iw8tFPY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U2wuO7wTBGQl3Af48wXj4qc8VjzDWNVsorlUKAfIlAfQHoTaEi2yR6iMUnYTWajCC
	 i36Wt1ESviIXyJbtGhzLSGg1KoH7yPosJUtIyvE73lVA9P7bcKFwZc3di4WXhhFBDR
	 a/WZ/A43F6szAWPFe+g5mbxJN6PabaXW2+dsc+EaMOH7Wgxhb6PZrtp6/BhBA0MXWS
	 cgOG2XfIJrL8uK5BEHa9Pr4qk2Isn+ydYrUX8fmf4xdrGZHzIa6juLeKjaAHKL2J1m
	 K4QdWstrvycymNeYfDu9nfGrv6z4P8QTc8IehIeuycx9/vMyKPm27j+5N4jOqHu3O6
	 7B9iQeOp6+J/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/6] clk: qcom: gpucc: Add Nord graphics clock
 controller support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260623-nords_mm_v1-v1-6-860c84539804@oss.qualcomm.com>
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
 <20260623-nords_mm_v1-v1-6-860c84539804@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 11:06:27 +0000
Message-Id: <20260623110628.86E001F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Incorrect frequency table reused for gpu_2_cc_hub_clk_src.
- [High] Missing resets in gpu_cc_nord_resets leading to potential PLL corr=
uption, and missing AHB divider in GPU2CC.
- [Medium] Mismatched clock halt_check flags between GPUCC and GPU2CC contr=
ollers.
--

commit b571fd2818fe3ed8089ed7cac4ad63964b0b6f76
Author: Taniya Das <taniya.das@oss.qualcomm.com>

clk: qcom: gpucc: Add Nord graphics clock controller support

Add support for the GPU clock controllers (GPUCC) on the Qualcomm
Nord platform. The platform includes two GPU clock controller instances,
GPUCC and GPU2CC, which provide clocks required for the graphics subsystem.

> diff --git a/drivers/clk/qcom/gpu2cc-nord.c b/drivers/clk/qcom/gpu2cc-nor=
d.c
> new file mode 100644
> index 0000000000000..d1baf019704c4
> --- /dev/null
> +++ b/drivers/clk/qcom/gpu2cc-nord.c
[ ... ]
> +static struct clk_rcg2 gpu_2_cc_hub_clk_src =3D {
> +	.cmd_rcgr =3D 0x91a8,
> +	.mnd_width =3D 0,
> +	.hid_width =3D 5,
> +	.parent_map =3D gpu_2_cc_parent_map_2,
> +	.freq_tbl =3D ftbl_gpu_2_cc_ff_clk_src,

[Severity: High]
Is it intentional to use ftbl_gpu_2_cc_ff_clk_src for the hub clock
frequency table?

Could this cause incorrect frequency configurations, such as using the
ff clock's frequency settings instead of a dedicated hub frequency table?

> +	.hw_clk_ctrl =3D true,
> +	.clkr.hw.init =3D &(const struct clk_init_data) {
[ ... ]
> +static struct clk_branch gpu_2_cc_ahb_clk =3D {
> +	.halt_reg =3D 0x90cc,
> +	.halt_check =3D BRANCH_HALT_VOTED,

[Severity: Medium]
Does this halt_check mismatch with the equivalent clock in gpucc?

This branch uses BRANCH_HALT_VOTED, but looking at gpu_cc_ahb_clk in
gpucc-nord.c, it uses BRANCH_HALT_DELAY.

Could an incorrect halt check cause the common clock framework to improperly
wait for clock status changes during enable/disable operations?

> +	.clkr =3D {
> +		.enable_reg =3D 0x90cc,
> +		.enable_mask =3D BIT(0),
> +		.hw.init =3D &(const struct clk_init_data) {
> +			.name =3D "gpu_2_cc_ahb_clk",
> +			.parent_hws =3D (const struct clk_hw*[]) {
> +				&gpu_2_cc_hub_clk_src.clkr.hw,

[Severity: High]
Are we missing the hub divider block in the parent chain here?

The parent is set directly to gpu_2_cc_hub_clk_src, whereas the equivalent
gpu_cc_ahb_clk in gpucc-nord.c is parented to a gpu_cc_hub_div_clk_src
divider block.

> +			},
> +			.num_parents =3D 1,
> +			.flags =3D CLK_SET_RATE_PARENT,
> +			.ops =3D &clk_branch2_ops,
> +		},
> +	},
> +};
[ ... ]
> diff --git a/drivers/clk/qcom/gpucc-nord.c b/drivers/clk/qcom/gpucc-nord.c
> new file mode 100644
> index 0000000000000..407cf7e5ad437
> --- /dev/null
> +++ b/drivers/clk/qcom/gpucc-nord.c
[ ... ]
> +static const struct qcom_reset_map gpu_cc_nord_resets[] =3D {
> +	[GPU_CC_ACD_BCR] =3D { 0x92f8 },
> +	[GPU_CC_CB_BCR] =3D { 0x9340 },
> +	[GPU_CC_CX_BCR] =3D { 0x90e4 },
> +	[GPU_CC_FAST_HUB_BCR] =3D { 0x9384 },
> +	[GPU_CC_GFX3D_AON_BCR] =3D { 0x91ac },
> +	[GPU_CC_GX_BCR] =3D { 0x9058 },
> +	[GPU_CC_XO_BCR] =3D { 0x9000 },
> +};

[Severity: High]
Are we missing entries for GPU_CC_FF_BCR and GPU_CC_GMU_BCR in this list?

Since qcom_reset_map uses sparse static array initialization, any
uninitialized IDs below the maximum enum value will default to 0x0.

If a client attempts to assert these missing resets, could it inadvertently
write to offset 0x0 and corrupt the gpu_cc_pll0 state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623-nords_mm_v=
1-v1-0-860c84539804@oss.qualcomm.com?part=3D6
