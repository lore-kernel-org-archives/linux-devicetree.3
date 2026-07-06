Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75EE4D2EC5
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329357; cv=none; b=eNqlmgMHfuC/tnlwQcFv1/32uB7IU2oqqsc5//f/vso3b8bGc5MPGady2Vlsyer/EBENJ8o0q9ixshv8zkr8yzpQKKQ1tmCgPH11za+9VTzzekyAI4X+9U2kSVQ5a+JXgysIhtsW7/2lSey6HWNcBGmo6qOjj+dqAab5IN/SIqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329357; c=relaxed/simple;
	bh=KA/dWjsZJSFFeUH36aOWzFL2URO2eE/M+eUJUllT/AI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p5ccEJSWYcBjtfVvapphQClyI6WBZg+nNcrXg+a+f9EtVNX9CFyKAzaP1vRQj+o1fXYK4ZTrRqcxnzobVLSxE6ZjVYrF5F8VYpbyKJ0KSG0wBNmP31e0omk+Ypq4jIUDbv19q6J/HLuJQFschSKIjqBju7QlEplYoOUyr/TEn1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T4RXBxbA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T4RXBxbA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AC7D1F00A3A;
	Mon,  6 Jul 2026 09:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783329350;
	bh=7VHJvpvQWRd0vEcG+/c3Y4EK61g9yCpEJ+S8vR8kKjk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T4RXBxbAscuzHgdri2is0uYSQKHO0PD7kfMMWtCDgwtfav0NKe7fF4kKL2VBD9gBH
	 yPHUX3Vq3Ihtxg77+J5Wpho7DO34T2u9r5NfRt03Jp6xc9ORA4RkDniHzkQlTodJcX
	 dtSmO4MpGcVqiNp9BaLKqM6bp8fjkl/42DH1u1qCJfZvWs2DVutE32LucH9oQcM5Sl
	 0zOiw/KdKeVVpkv3IvVcHHXjH+XfcDaMh9xZqctYRRD1OHn0fnfs65aAsEwpCguj/U
	 ZkJrrkqcldpAN/W3BFrli4EjKD/zE7N08N058wjR8GM7NWCvrjGgFjd6qfX7j8a5Oy
	 csEAXGFjDoYEg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: videocc-nord: Add video clock controller
 driver for Nord
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260706-nord_videocc_camcc-v1-3-bae3be9e9770@oss.qualcomm.com>
References: <20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com>
 <20260706-nord_videocc_camcc-v1-3-bae3be9e9770@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 09:15:49 +0000
Message-Id: <20260706091550.0AC7D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The VIDEO_CC_SLEEP_CLK_SRC clock is exported in the device tree =
bindings but is missing from the video_cc_nord_clocks array.
--

commit dfa98f09ca71a696d1bfc167c512409f26a2ccc8
Author: Taniya Das <taniya.das@oss.qualcomm.com>

clk: qcom: videocc-nord: Add video clock controller driver for Nord

This commit adds support for the video clock controller for video clients to
be able to request videocc clocks on the Nord platform.

> diff --git a/drivers/clk/qcom/videocc-nord.c b/drivers/clk/qcom/videocc-n=
ord.c
> new file mode 100644
> index 0000000000000..ee73e89a01daa
> --- /dev/null
> +++ b/drivers/clk/qcom/videocc-nord.c

[ ... ]

> +enum {
> +	P_BI_TCXO,
> +	P_SLEEP_CLK,
> +	P_VIDEO_CC_PLL0_OUT_MAIN,
> +};

[Severity: Medium]
Is P_SLEEP_CLK intended to be used in any parent_map? It is defined in this
enum but does not appear to be referenced anywhere else in the driver.

[ ... ]

> +static struct clk_regmap *video_cc_nord_clocks[] =3D {
> +	[VIDEO_CC_AHB_CLK_SRC] =3D &video_cc_ahb_clk_src.clkr,
> +	[VIDEO_CC_MVS0_CLK] =3D &video_cc_mvs0_clk.clkr,

[ ... ]

> +	[VIDEO_CC_MVS1_FREERUN_CLK] =3D &video_cc_mvs1_freerun_clk.clkr,
> +	[VIDEO_CC_MVS1_SHIFT_CLK] =3D &video_cc_mvs1_shift_clk.clkr,
> +	[VIDEO_CC_PLL0] =3D &video_cc_pll0.clkr,
> +	[VIDEO_CC_XO_CLK_SRC] =3D &video_cc_xo_clk_src.clkr,
> +};

[Severity: Medium]
Should VIDEO_CC_SLEEP_CLK_SRC be included in this array?=20

It appears to be exported in the device tree bindings but is missing from
the clocks array. If a device tree node requests this clock (e.g.=20
clocks =3D <&videocc VIDEO_CC_SLEEP_CLK_SRC>), will it receive a missing cl=
ock
and fail to probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-nord_video=
cc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com?part=3D3
