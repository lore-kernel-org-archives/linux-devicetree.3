Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAE413A3ED
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 11:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780744802; cv=none; b=BfoLSXxyviAcXnsvjI2j7rCsu8H9J5uBeLQ/1tCk7MsFhwMuaz0KayjvimfEfTDUN8lOVolJk+gtyMjawzEVW1QqOdPqf0n66wcltYOlu0/UhSCTDA09123w70R8Bx9Edu3we1JOuIzKdxyi+V/NieqvxRWlwW2KUch3gk1iteA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780744802; c=relaxed/simple;
	bh=JsB9Jb+ZVFrMHoME4d1KYNSquwITbjhzs/cqRNSfMAU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eq9dngRYMH8ctQoFWCLdeUIcxJXohj1unobrMhLUZSYjoq1KLv9rASX4tGVH6rzDCr3MQ5jHY3XifZd7IJLxC0Hgv03kfjQLfzYLIMJdhut4PZ82bEywtIk+cm7ZyN5YbG5+OFjVCwgqxbRByvo71U7xYNf459AeTmmKxQFb+jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EnmL2ape; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EnmL2ape"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B17B11F00893;
	Sat,  6 Jun 2026 11:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780744801;
	bh=M1eyZfUURpVYrm+oaeCBqPiHnBjBDbEjS0+TC7uJl5Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EnmL2apeVh0wztTfQQdkXJWmkLUjzjMvnNomByrMSywbxBpCy1SAwYTvK4QuF/hwj
	 RlCmTUha0mPWEtJHtMKeaREobyYMtNriZE4VravHHqtJgKec+kukONkQlviIVWZ/SX
	 JNLG8gG7/SVQGd3WPExRyt8mWX3FLngLQrxl1UhG7ANOW6Ho+5Kpf5DVDsTRrQZt9I
	 tUt+pvw5WKlogA73U9ZoI4gytG9qCljGwxYBwMZPyUiIYvZQiazk78pY/mSwRT1xx9
	 5aiFHRFRGSpp1WB7RTA85X1dY2yRO0w5tmGcT3TuS01E34es5AcmeKZI+HjDIZRNBP
	 /Ynm/FlRdi9Ng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] clk: qcom: Add Global clock controller support
 on Qualcomm Shikra SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Imran Shaik" <imran.shaik@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260605-shikra-gcc-rpmcc-clks-v4-4-a0a7bfb44455@oss.qualcomm.com>
References: <20260605-shikra-gcc-rpmcc-clks-v4-4-a0a7bfb44455@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Jun 2026 11:20:00 +0000
Message-Id: <20260606112000.B17B11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Clock parent data structures incorrectly map `P_GPLL9_OUT_MAIN` to=
 the raw PLL `&gpll9.clkr.hw` instead of its post-divider `&gpll9_out_main.=
clkr.hw`.
- [Medium] The clock `gcc_camss_tfe_1_clk_src` is missing the `CLK_SET_RATE=
_PARENT` flag, whereas its sibling clock `gcc_camss_tfe_0_clk_src` has it.
--

commit 4a831d5485683b422aed6cd3f5dbf1ba131e85cc
Author: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: clk: qcom: Add Global clock controller support on Qualcomm Shikra =
SoC

This commit adds support for the Global Clock Controller (GCC) on the
Qualcomm Shikra SoC. It registers the necessary clocks, PLLs, dividers,
and resets for the device.

> diff --git a/drivers/clk/qcom/gcc-shikra.c b/drivers/clk/qcom/gcc-shikra.c
> new file mode 100644
> index 0000000000000..d5222756f214c
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
Should this map to the post-divider output gpll9_out_main.clkr.hw instead of
the raw PLL gpll9.clkr.hw?

The corresponding parent map gcc_parent_map_7 declares index 5 as
P_GPLL9_OUT_MAIN, but the data array maps it to the raw VCO output. This sa=
me
mismatch appears in gcc_parent_data_8, gcc_parent_data_9, and
gcc_parent_data_14. Using the wrong parent hardware clock might cause the
common clock framework to compute incorrect frequencies for downstream
consumers.

[ ... ]

> +static struct clk_rcg2 gcc_camss_tfe_1_clk_src =3D {
> +	.cmd_rcgr =3D 0x52024,
> +	.mnd_width =3D 8,
> +	.hid_width =3D 5,
> +	.parent_map =3D gcc_parent_map_8,
> +	.freq_tbl =3D ftbl_gcc_camss_tfe_0_clk_src,
> +	.hw_clk_ctrl =3D true,
> +	.clkr.hw.init =3D &(const struct clk_init_data) {
> +		.name =3D "gcc_camss_tfe_1_clk_src",
> +		.parent_data =3D gcc_parent_data_8,
> +		.num_parents =3D ARRAY_SIZE(gcc_parent_data_8),
> +		.ops =3D &clk_rcg2_shared_ops,

[Severity: Medium]
Is the CLK_SET_RATE_PARENT flag intentionally omitted here?

The sibling clock gcc_camss_tfe_0_clk_src explicitly sets the
CLK_SET_RATE_PARENT flag in its init data. Without this flag,
gcc_camss_tfe_1_clk_src might be unable to propagate rate changes to its
parent clock, potentially leading to frequency mismatches for the TFE_1 blo=
ck.

> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605-shikra-gcc=
-rpmcc-clks-v4-0-a0a7bfb44455@oss.qualcomm.com?part=3D4
