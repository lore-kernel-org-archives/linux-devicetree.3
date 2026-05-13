Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90AE383985
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778648515; cv=none; b=WiVe80HRABdGL26Is1aaq2/TlCELxOJ7yYaEb2t2Pg++VQuj6r5d1/T5JBAOnVSjBGV2DajLp9npaA00HD/VZ81jdVtj3n5m6r61bP4Jn1ASnh9667XfPJDe46j4VEfaOUK5bT8Vyhhmu1K7f9DtQVUnz9k9Mqo7caMFjMtiGeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778648515; c=relaxed/simple;
	bh=oq7zEPv3ECSU2LrsXYviFakLLgDXG2cV9cKi4xUupkg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SStq+jeeYbv8RNsvQLwGDZ0ch+HtCN3CkCwhByQq5fuwpw70qFm3ZB4t3ZUqSZ9GGm8qCCTVIjo9dqrCZtiIWdbygRuw4covVFv/u9FqOPqgs9iHFba4LBKQH84jpAZbAz9kftKpTMlsvzYDv6yGkfwi/TCDSH0RmZ/8uPyZvDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZnalon0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZnalon0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 790F6C2BCB7;
	Wed, 13 May 2026 05:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778648515;
	bh=oq7zEPv3ECSU2LrsXYviFakLLgDXG2cV9cKi4xUupkg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=mZnalon0s5yNmPGnBEWYEO+03rcx6Vld6BTwnBDbj51Xf7fmfefZea6NRwtzmdPjI
	 8qIqFGrObUnVJ5qAPF7ocbTFSrY1b4vMFZALwTc7ZvgqkCcsq6J8XzaxW9Igbz80WB
	 Vxq9pf678ojoZzpNLTkiEroipmBf/mP5iDBWItrutrBz/mA+Ryj24S6mzQ2FYfcNVH
	 wSvJXPr7czH+GnxBbuwY1O4xuC3kFKa1QGUx3jVSf9c8tqfmE+YSZzR1x25FyIOLne
	 kWUiCzWcIbClvLTY1/fzh2Idf9NGdiUYAnSBgdlLvwJwtwwfn/ChuAMUhY7SyTOrgx
	 FPLkeTyDFBYfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] clk: qcom: add Global Clock controller (GCC)
 driver for IPQ9650 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kathiravan Thirumoorthy" <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260512-ipq9650_boot_to_shell-v4-2-1e87c8326e59@oss.qualcomm.com>
References: <20260512-ipq9650_boot_to_shell-v4-2-1e87c8326e59@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 05:01:54 +0000
Message-Id: <20260513050155.790F6C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `gcc_qpic_sleep_clk` branch clock is missing its parent clock =
initialization in `clk_init_data`.
- [Medium] The `gpll4` and `gcc_pcnoc_bfdcd_clk_src` clocks use the `CLK_IS=
_CRITICAL` flag, which contradicts the explicit comments stating to use `CL=
K_IGNORE_UNUSED`.
--

commit 066e3207c3655c5fa209013fda4d22eaa8774c6c
Author: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
clk: qcom: add Global Clock controller (GCC) driver for IPQ9650 SoC

This commit adds support for the global clock controller found on the=20
IPQ9650 SoC devices.

> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-ipq9650.c

[ ... ]

> +static struct clk_alpha_pll gpll4 =3D {
> +	.offset =3D 0x22000,
> +	.regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
> +	.clkr =3D {
> +		.enable_reg =3D 0xb000,
> +		.enable_mask =3D BIT(2),
> +		.hw.init =3D &(const struct clk_init_data) {
> +			.name =3D "gpll4",
> +			.parent_data =3D &gcc_parent_data_xo,
> +			.num_parents =3D 1,
> +			/*
> +			 * There are no consumers for this GPLL in kernel yet,
> +			 * (will be added soon), so the clock framework
> +			 * disables this source. But some of the clocks
> +			 * initialized by boot loaders uses this source. So we
> +			 * need to keep this clock ON. Add the
> +			 * CLK_IGNORE_UNUSED flag so the clock will not be
> +			 * disabled. Once the consumer in kernel is added, we
> +			 * can get rid of this flag.
> +			 */
> +			.flags =3D CLK_IS_CRITICAL,

The comment explicitly mentions adding the CLK_IGNORE_UNUSED flag, but the
code sets CLK_IS_CRITICAL instead. Should this be CLK_IGNORE_UNUSED to match
the description and avoid unconditionally forcing the clock on?

[ ... ]

> +static struct clk_rcg2 gcc_pcnoc_bfdcd_clk_src =3D {
> +	.cmd_rcgr =3D 0x31004,
> +	.mnd_width =3D 0,
> +	.hid_width =3D 5,
> +	.parent_map =3D gcc_parent_map_0,
> +	.freq_tbl =3D ftbl_gcc_pcnoc_bfdcd_clk_src,
> +	.clkr.hw.init =3D &(const struct clk_init_data) {
> +		.name =3D "gcc_pcnoc_bfdcd_clk_src",
> +		.parent_data =3D gcc_parent_data_0,
> +		.num_parents =3D ARRAY_SIZE(gcc_parent_data_0),
> +		/*
> +		 * There are no consumers for this source in kernel yet,
> +		 * (will be added soon), so the clock framework
> +		 * disables this source. But some of the clocks
> +		 * initialized by boot loaders uses this source. So we
> +		 * need to keep this clock ON. Add the
> +		 * CLK_IGNORE_UNUSED flag so the clock will not be
> +		 * disabled. Once the consumer in kernel is added, we
> +		 * can get rid of this flag.
> +		 */
> +		.flags =3D CLK_IS_CRITICAL,

There is a similar mismatch here where the comment indicates CLK_IGNORE_UNU=
SED
but the implementation sets CLK_IS_CRITICAL.

[ ... ]

> +static struct clk_branch gcc_qpic_sleep_clk =3D {
> +	.halt_reg =3D 0x32018,
> +	.halt_check =3D BRANCH_HALT,
> +	.clkr =3D {
> +		.enable_reg =3D 0x32018,
> +		.enable_mask =3D BIT(0),
> +		.hw.init =3D &(const struct clk_init_data) {
> +			.name =3D "gcc_qpic_sleep_clk",
> +			.ops =3D &clk_branch2_ops,
> +		},
> +	},
> +};

Does this clock need parent initialization? Other sleep branch clocks in th=
is
driver specify their parent, but this one appears to omit parent_hws and
num_parents. Could this leave the clock unparented in the clock framework?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-ipq9650_bo=
ot_to_shell-v4-0-1e87c8326e59@oss.qualcomm.com?part=3D2
