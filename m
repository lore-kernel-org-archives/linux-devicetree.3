Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C0F3E5A21
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 12:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779970466; cv=none; b=qJQMXCk89ftHLsk9dbzfPi05c44cxYWQf8Ry3JjfrShwmQueT1QgM3sP6ltDPzVtW2vyyHemkZs4sh2U1FZvfV1d0PBNLu/AMbDJtuHoPaf4vd2hTb81+zuS3HC4VTWZcrA9XxcwnoZ8gPUY0uHxrB3kKdkbTPDFR1x5Z3f0TwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779970466; c=relaxed/simple;
	bh=g/f5WK2bXMCJQGW0AS2dfPknPJJp3gvrucI5XrzUMEU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D80zJopUmlxKcHEfZsdRUNt9NnWLhl7fViyKz04+RWwlTmIkrMIFRwhKwWOxZk9AevVLajnKMslSJG9xPRmojFVeTeAadDlJSHg9JVEQZsFXIMM/SQSYrwajrp4BWGSCX3ImVwG433K04ESdJy3/FKWvHlH/VT1IrbgR8F7iEKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JN8b6xq5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JN8b6xq5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 968C21F00A3A;
	Thu, 28 May 2026 12:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779970464;
	bh=ZSRFDyj9lL125Hfw7wGRAAjZBK72Bv8D1eql6MvttEY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JN8b6xq5UqDxNuDxKRiF7CQg2Y75FIkt8Uv+8xvTSsb8akR4wlcZE3y4aLz+gY7AI
	 TYJCA0vg30or5anqKL7hrBxmVoq6+9MCeWmMh3+MbbyWjupR9nP+9uWEY8ukxMjPN2
	 0ZmJ9wg1IyXaYveim94J5/GJlAC4+ce26YCwrf3wXN1hVFEAzIz1Si7Q0Tj3ptw91a
	 j7w6Abrv/FlIsmjK2HRlYDSo1dW8GFqLtdQnUEEBUdDTDmkseaE+Zj5whO3axqvP8a
	 oTbVJAW25nt0E3kz0q8oLKAtqkWkfv8HkN4pqKO8gav2YgQQ/Y4BeXYLgppQgPmPdN
	 6sjK5ZNg73eBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/5] clk: qcom: gcc-qcm2290: Drop modelling of
 critical clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Imran Shaik" <imran.shaik@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260528-shikra-dispcc-gpucc-v2-1-953f246a0fbb@oss.qualcomm.com>
References: <20260528-shikra-dispcc-gpucc-v2-1-953f246a0fbb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 12:14:24 +0000
Message-Id: <20260528121424.968C21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Device Tree ABI breakage causing consumer drivers to fail probing
- [Medium] Inaccurate commit message regarding the previous state of the re=
moved clocks
- [Low] Misuse of `qcom_branch_set_clk_en` macro for an APCS vote register
--

commit fe7153ece7b1b29e7cf0efe410ca1855c6dc922e
Author: Imran Shaik <imran.shaik@oss.qualcomm.com>

clk: qcom: gcc-qcm2290: Drop modelling of critical clocks

This patch drops the modeling of certain clocks on the QCM2290 SoC, instead
enabling them unconditionally from probe to simplify PM clock handling in
consumer drivers.

> Drop the modelling of critical GCC clocks on QCM2290 SoC, and keep them
> enabled from probe as per the latest convention. This helps to drop the

[Severity: Medium]
Is this description completely accurate? Several of the removed clocks, such
as gcc_gpu_iref_clk, gcc_video_ahb_clk, and gcc_video_xo_clk, did not have
the CLK_IS_CRITICAL flag set in their init data.=20

Could the commit message be clarified to reflect that both critical and
non-critical clocks are being dropped?

> diff --git a/drivers/clk/qcom/gcc-qcm2290.c b/drivers/clk/qcom/gcc-qcm229=
0.c
> index 6684cab63ae11..937db68a45b17 100644
> --- a/drivers/clk/qcom/gcc-qcm2290.c
> +++ b/drivers/clk/qcom/gcc-qcm2290.c

[ ... ]

> @@ -2775,8 +2642,6 @@ static struct clk_regmap *gcc_qcm2290_clocks[] =3D {
>  	[GCC_BOOT_ROM_AHB_CLK] =3D &gcc_boot_rom_ahb_clk.clkr,
>  	[GCC_CAM_THROTTLE_NRT_CLK] =3D &gcc_cam_throttle_nrt_clk.clkr,
>  	[GCC_CAM_THROTTLE_RT_CLK] =3D &gcc_cam_throttle_rt_clk.clkr,
> -	[GCC_CAMERA_AHB_CLK] =3D &gcc_camera_ahb_clk.clkr,
> -	[GCC_CAMERA_XO_CLK] =3D &gcc_camera_xo_clk.clkr,

[Severity: High]
Does removing these clocks completely from the provider array break Device
Tree ABI compatibility? Older device trees specify these clocks in the
'clocks' property of their consumer nodes (e.g., qcom,qcm2290-mdss requests
GCC_DISP_AHB_CLK).

When these consumer drivers boot with a newer kernel using the old DT,
functions like devm_clk_bulk_get_all() might fail with -ENOENT when they
encounter a missing clock index.=20

Should these indices remain populated with a dummy clock or a basic AON clo=
ck
to prevent consumer driver probe failures?

[ ... ]

> @@ -2990,6 +2848,17 @@ static int gcc_qcm2290_probe(struct platform_devic=
e *pdev)
>  	if (ret)
>  		return ret;
> =20
> +	/* Keep some clocks always-on */
> +	qcom_branch_set_clk_en(regmap, 0x17008); /* GCC_CAMERA_AHB_CLK */
> +	qcom_branch_set_clk_en(regmap, 0x17028); /* GCC_CAMERA_XO_CLK */
> +	qcom_branch_set_clk_en(regmap, 0x1700c); /* GCC_DISP_AHB_CLK */
> +	qcom_branch_set_clk_en(regmap, 0x1702c); /* GCC_DISP_XO_CLK */
> +	qcom_branch_set_clk_en(regmap, 0x36004); /* GCC_GPU_CFG_AHB_CLK */
> +	qcom_branch_set_clk_en(regmap, 0x36100); /* GCC_GPU_IREF_CLK */
> +	qcom_branch_set_clk_en(regmap, 0x79004); /* GCC_SYS_NOC_CPUSS_AHB_CLK */

[Severity: Low]
Is qcom_branch_set_clk_en() the correct macro for GCC_SYS_NOC_CPUSS_AHB_CLK?
This macro sets the CBCR_CLOCK_ENABLE bit (BIT(0)) in a standard Clock Bran=
ch
Control Register. Register 0x79004 is an APCS vote register, not a CBCR.

While it functionally works because this specific clock's vote mask is also
BIT(0), using a CBCR-specific macro for an APCS vote register might be
brittle.=20

Should direct regmap_update_bits() be used instead?

> +	qcom_branch_set_clk_en(regmap, 0x17004); /* GCC_VIDEO_AHB_CLK */
> +	qcom_branch_set_clk_en(regmap, 0x17024); /* GCC_VIDEO_XO_CLK */
> +
>  	clk_alpha_pll_configure(&gpll10, regmap, &gpll10_config);
>  	clk_alpha_pll_configure(&gpll11, regmap, &gpll11_config);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528-shikra-dis=
pcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com?part=3D1
