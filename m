Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AE121A42D
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784618330; cv=none; b=Uvc5gEahI4l965O/Nng1eFhd6+D6zZ0O2gwTvHrBgOlhL51qq8deeMFw8m0o7ZZy/LVu7WfWUmeeCJG8Gk8w5SdPgI5D2u8mw5X/DVtNyE6KeVGlpaV4WpUgO4Ox85wxjJEENJEetn7O39mE6Lcg708y9yOU1D2AytxkWUTPJNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784618330; c=relaxed/simple;
	bh=lBYTKnfDXAc0ubzCuQ8t4Xn26xp0x0crENAl7c9TEug=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZbjHLnxvgxfMGufDBYC/viXrIvsgzFjoVlSVEnqkHevDzlXW1pJ76DtgLfbYkEVbL9i2KM5fOP9YaPDaDmWexmB4Yt7S5/UOUQ+gFq4QtJ+zEYLrJKFtLOe8aGTuBi2LZPabApVSeVvnkT1F4Yv3ceUpFZYmNng7557RA20ATwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KgKrnwfF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KgKrnwfF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A16D71F000E9;
	Tue, 21 Jul 2026 07:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784618328;
	bh=pXtQwk5GQkTz0fF9KtOsb6H3sxOIIelIajS96aTWqys=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KgKrnwfFSFJaxMhOmZgKgBC1eMxqJJ1DI2pOJZP+mn7CAHb0GziPJdzsxPFlIbDXI
	 cBVZm4GqZRTpl+lylYVec9v9dpu7OivqZZFKjRaukAGc/CT/5Dxe/ig+PEFAuobHke
	 Lo6ffw5QanNkjy7qG3l/0GUHWTCsfSzQZo4azfaGM9BxR1DY9hE83Km/mI5JCf6Tq0
	 XGP5KU3FYsbfNCdY9suL7StTsWNaQmsJ8h/RoVYXMpBrwj1k2/MEZLMUNm8zNzcxvn
	 uP9x6Xt+FqB238fnPXG/Z3niawRxxi3z42z26CWYjLfl5XYneRdnsWhX8Jysan7lRa
	 UBT7FUlCTS3+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/6] clk: qcom: gpucc: Add Nord graphics clock
 controller support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721-nords_mm_v1-v2-6-17e5a445a512@oss.qualcomm.com>
References: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
 <20260721-nords_mm_v1-v2-6-17e5a445a512@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 07:18:48 +0000
Message-Id: <20260721071848.A16D71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `gpu_2_cc_hub_clk_src` clock incorrectly reuses the frequenc=
y table for `gpu_2_cc_ff_clk_src`.
--

--- Patch [6]: [PATCH v2 6/6] clk: qcom: gpucc: Add Nord graphics clock con=
troller support ---
commit 09ee5a90eabdc23a86ad541e2815981623d9e1fe
Author: Taniya Das <taniya.das@oss.qualcomm.com>

clk: qcom: gpucc: Add Nord graphics clock controller support

This commit adds support for the GPU and GPU2 clock controllers on the
Qualcomm Nord platform. These controllers provide the clocks required for
the graphics subsystem.

> diff --git a/drivers/clk/qcom/gpu2cc-nord.c b/drivers/clk/qcom/gpu2cc-nor=
d.c
> new file mode 100644
> index 0000000000000..a05ff9fa1506e
> --- /dev/null
> +++ b/drivers/clk/qcom/gpu2cc-nord.c

[ ... ]

> +static struct clk_rcg2 gpu_2_cc_hub_clk_src =3D {
> +	.cmd_rcgr =3D 0x91a8,
> +	.mnd_width =3D 0,
> +	.hid_width =3D 5,
> +	.parent_map =3D gpu_2_cc_parent_map_2,
> +	.freq_tbl =3D ftbl_gpu_2_cc_ff_clk_src,

[Severity: Medium]
Is this frequency table correct? It looks like gpu_2_cc_hub_clk_src is
reusing the ftbl_gpu_2_cc_ff_clk_src table (200 MHz), rather than having
its own dedicated frequency table.=20

In gpucc-nord.c, the equivalent hub clock has its own table configured for
300 MHz. Will this reuse cause the GPU2 hub to be underclocked when the
GPU2 subsystem requests its hub clock rate?

> +	.hw_clk_ctrl =3D true,
> +	.clkr.hw.init =3D &(const struct clk_init_data) {
> +		.name =3D "gpu_2_cc_hub_clk_src",
> +		.parent_data =3D gpu_2_cc_parent_data_2,
> +		.num_parents =3D ARRAY_SIZE(gpu_2_cc_parent_data_2),
> +		.flags =3D CLK_SET_RATE_PARENT,
> +		.ops =3D &clk_rcg2_shared_ops,
> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-nords_mm_v=
1-v2-0-17e5a445a512@oss.qualcomm.com?part=3D6
