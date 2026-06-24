Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9B53D812C
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 15:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782313702; cv=none; b=c75JOo4i7r1c1AmyofJJ3ppOJOaEK+GNgi8RliY6ZxvJIPLygYCIPYNlLMXFT/CFvnNndAyqwxipNPM/BoebyZ/WpHeFlMCKiV42uAH1EiHhsBJfPXVRb69gIymzBmsA2+Hterl/zKNQVZvsDdWHYRATR11vvv+/9E6VUSMChfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782313702; c=relaxed/simple;
	bh=y6W1l/ctuaYu/07jGUqsKgjCSbQzxzC94DENBrhA0gw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ESoID5XPJZ7lfoTvQl4QWAEUTgoHVARNKSZispZrBPEcs2OsmobsPLeXD0TUOsCg+EC0vOAxgSmlGEZwFZzv6WnEPdBrozG1C14k94Le0tiX83LpzkDftousPZ4Nez5NcwFEIVbq1Q6NKDLzuKVxPEaYuNtE+KYUTl1n3GZ/Kd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UlK/xv2t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UlK/xv2t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 087681F00A3A;
	Wed, 24 Jun 2026 15:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782313701;
	bh=NGAoVbb237xYoFOPZ9bacjP2m8desinG7A/MRwUJSw8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UlK/xv2tFXbH/uidHdoZ3PMUUhlPwGcZL9rr8kSgqMNjkDH88pdGMUj7aVeSsb0FZ
	 kZ4PQrdiysIYyDvACq7avR+VP1aBOQgQvwwCttOO59Hyw2nV1+SqTDLih/Z4ZF7ASo
	 3GSs9FzUci25TUN+JBgNkhZIWaOQc9wii5g2rdRBogw5CKtK/uEfJckDjhJU50Y5bP
	 sjotQcqEHWVwN3zCYLFkBn9erBUTjlbjAzWSVz5EPYcACNMztKF73cVSWwE6nRnemU
	 lqiG2Y+soZUgto2OkfRyRgWuXVh6O7Xf+K5V9Ua0o4KdVRvpcYKGN6X+gfQq0a+1bk
	 VXLLzu0P1iuKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] clk: qcom: camcc-glymur: Add camera clock
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jagadeesh Kona" <jagadeesh.kona@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260624-glymur_camcc-v5-2-a321df74b1a1@oss.qualcomm.com>
References: <20260624-glymur_camcc-v5-0-a321df74b1a1@oss.qualcomm.com>
 <20260624-glymur_camcc-v5-2-a321df74b1a1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 15:08:20 +0000
Message-Id: <20260624150821.087681F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incorrect register offsets for CSI4 clocks due to a copy-paste err=
or.
- [High] Missing `cam_cc_pll2_out_even` struct definition resulting in inco=
rrect CCF frequency calculation for EVEN PLL output.
--

commit 4ff3f366f401331dcb96c0eb65a3236a34345740
Author: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

clk: qcom: camcc-glymur: Add camera clock controller driver

Add support for the camera clock controller for camera clients
to be able to request for camcc clocks on Glymur platform.

> diff --git a/drivers/clk/qcom/camcc-glymur.c b/drivers/clk/qcom/camcc-gly=
mur.c
> new file mode 100644
> index 0000000000000..a80f05b7bc484
> --- /dev/null
> +++ b/drivers/clk/qcom/camcc-glymur.c
[ ... ]
> @@ -0,0 +1,2280 @@
[ ... ]
> +static const struct parent_map cam_cc_parent_map_1[] =3D {
> +	{ P_BI_TCXO, 0 },
> +	{ P_CAM_CC_PLL2_OUT_EVEN, 3 },
> +	{ P_CAM_CC_PLL2_OUT_MAIN, 5 },
> +};
> +
> +static const struct clk_parent_data cam_cc_parent_data_1[] =3D {
> +	{ .index =3D DT_BI_TCXO },
> +	{ .hw =3D &cam_cc_pll2.clkr.hw },
> +	{ .hw =3D &cam_cc_pll2.clkr.hw },

[Severity: High]
Does this code miss the cam_cc_pll2_out_even struct definition?

Index 1 should point to &cam_cc_pll2_out_even.clkr.hw to represent the divi=
ded
EVEN output of the PLL. The duplicated pointer results in the Common Clock
Framework seeing the raw PLL rate without division. When a clock relying on=
 this
parent map switches to the EVEN hardware mux, the framework might calculate=
 the
downstream clock is running at twice its actual hardware frequency.

> +};
[ ... ]
> +static struct clk_rcg2 cam_cc_csi4phytimer_clk_src =3D {
> +	.cmd_rcgr =3D 0x15124,

[Severity: High]
Are these register offsets correct for the CSI4 PHY timer clock source?

On identical or highly similar reference hardware designs, offsets 0x15124,
0x15250, and 0x15254 map to the CSI2 PHY branch and timer clocks, while
CSI4 is typically mapped to 0x1538c, 0x154b8, and 0x154bc.

Writing configuration to these offsets for CSI4 might incorrectly modify CS=
I2
clock registers, preventing the CSI4 camera interface from being clocked
properly and potentially inducing unintended behavior on the CSI2 IP block.

> +	.mnd_width =3D 0,
> +	.hid_width =3D 5,
> +	.parent_map =3D cam_cc_parent_map_0,
> +	.freq_tbl =3D ftbl_cam_cc_csi0phytimer_clk_src,
[ ... ]
> +static struct clk_branch cam_cc_csi4phytimer_clk =3D {
> +	.halt_reg =3D 0x15250,
> +	.halt_check =3D BRANCH_HALT,
> +	.clkr =3D {
> +		.enable_reg =3D 0x15250,

[Severity: High]
Could this offset be incorrect as well? As mentioned above, 0x15250 usually
corresponds to the CSI2 PHY timer branch clock.

> +		.enable_mask =3D BIT(0),
> +		.hw.init =3D &(const struct clk_init_data) {
> +			.name =3D "cam_cc_csi4phytimer_clk",
[ ... ]
> +static struct clk_branch cam_cc_csiphy4_clk =3D {
> +	.halt_reg =3D 0x15254,
> +	.halt_check =3D BRANCH_HALT,
> +	.clkr =3D {
> +		.enable_reg =3D 0x15254,

[Severity: High]
Is this the correct offset for the CSI4 PHY branch clock? It seems this mig=
ht
also be pointing to the CSI2 PHY branch clock.

> +		.enable_mask =3D BIT(0),
> +		.hw.init =3D &(const struct clk_init_data) {
> +			.name =3D "cam_cc_csiphy4_clk",

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624-glymur_cam=
cc-v5-0-a321df74b1a1@oss.qualcomm.com?part=3D2
