Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793936193;
	b=G74PKFU5nTalnbFTd6bI1sZsLNs7VOSSAMKoYdjEn10ImxquH6uu4+ZibdEg4B6YJfim
	 t+S4R5Pi9i7+UxZAezTjPF585avmUb5OAXPFjURBdts66P5vrb9XbzdoUyRVnfIaTO0KR
	 ihrE6PMassmTIPoSw6j4GYxXvoCDK9RBvUYe7KZUtruBvPNYnQAsT1IeCNR7mmF4pHK3P
	 HQS//xu901AQgSpTxe1UXjpOOLKrWaTY2uAoLfNPiZ0jPcWXkLneJ1+Gbt5AIZrutBxVR
	 sv0OgaT/j1o9KBBTYIQU2dL62ygU/JbBuRjUPjntgB1d//+0/eT7C9Og+wz5i6QDGxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793936193;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QWCK/N0uHutoEs0dmQsQxMNkwEJhG7IGFg92et2Y7SE=;
	b=k0/rX1KEv4mFH7cE6Psr9/KnFVk7rY/3vWYiLNWciJ7F8Vuc40pxvt2x7YFMhqyDsQ6m
	 KoFLC8IaMOUInnLi5vrnwVs/J63udnnmiCu9oKHSJF5USkaU8Sq/XcZsfn0jfcKMcyXCF
	 UYTwQ1ogkIK9ATwfOVrEqN0OJ4UlBnGFvubSxXgiVq3geprCbI+91ic9bVo8ed4MwvXm6
	 ELxELTKGE+pvLAIXSH98AbhuBNmYMQip5LQFlRsxf7XXdvAmBeVT3FVBBLTbtEKo4m299
	 v/QhPGqW+pP0HQ3Lbp11ed1tDnZedsSc25q5t+W3gf0uZYJBKC5ZHv5ODnBKttSvuoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TLKDY9Jh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119C0606A31B
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 03:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TLKDY9Jh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6178D1F0089F;
	Fri,  6 Nov 2026 03:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793936192;
	bh=QWCK/N0uHutoEs0dmQsQxMNkwEJhG7IGFg92et2Y7SE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TLKDY9JhSEyNrWMyHn28CRph2eC4nmyXNkil6hRhVquGWLfaapkFZXA/Jj7iiam1H
	 vEQQk7F0K/kZ3RcTyMh2KVvhF/PDLw8RTDVGQGCDMrsP1xnPO3Z2xqocbFHz1kopLG
	 pzhJj2oleJamLBk8U+jc5X4eDxIXMPuKz5oDqD3PswIXCCvMcp3GcsynGgFpMhzRuo
	 lm59sS31T7EgzcYUQTUVKBudsMq4m+FlCDpFv1rC4KEexfMQ4lU+GDt0c9ugaqt4ze
	 dniXDpg9xzJ8Io38IahwvXc8/gRdTe6XA/WOP4gMG9bMluZuoGdJy7vZc+7bzLOtQ9
	 KrRrHA4lWx0dg==
Message-ID: <sashiko-outbox-200652@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] media: qcom: camss: Match VFE lite clocks by
 name prefix
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrew Gigena" <mail@andrewgigena.dev>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261106-sm8150-v7.4-rc1-camss-v2-3-39ee37787b00@andrewgigena.dev>
References: <20261106-sm8150-v7.4-rc1-camss-v2-0-39ee37787b00@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v2-3-39ee37787b00@andrewgigena.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 03:36:31 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: qcom: camss: vfe_match_clock_names() matches vfe_lite_* clo=
cks
--

commit 6c95d1dba299c3fc78f8daef87dbf333ccf58408
Author: Andrew Gigena <mail@andrewgigena.dev>

media: qcom: camss: Match VFE lite clocks by name prefix

This commit updates vfe_match_clock_names() to match any clock starting
with "vfe_lite" when the VFE is a lite instance, so that numbered VFE-lite
clocks (such as vfe_lite0 and vfe_lite1) have their rates configured even
when vfe->id does not match the lite instance index.

> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 2680a9914765f..9866ac09eefd7 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -914,6 +914,7 @@ static int vfe_match_clock_names(struct vfe_device *v=
fe,
>  	return (!strcmp(clock->name, vfe_name) ||
>  		!strcmp(clock->name, vfe_lite_name) ||
>  		!strcmp(clock->name, "vfe_lite") ||
> +		(vfe->res->is_lite && !strncmp(clock->name, "vfe_lite", 8)) ||

[Severity: High]
Does an 8-byte prefix match on "vfe_lite" in vfe_match_clock_names() also
match auxiliary VFE-lite clocks such as "vfe_lite_src", "vfe_lite_ahb",
"vfe_lite_csid", and "vfe_lite_cphy_rx" (whereas full VFE instances only
match exact "vfe%d" names and ignore "vfe%d_src", "vfe%d_fast_ahb",
"vfe%d_csid", and "vfe%d_cphy_rx")?

When starting a VFE-lite stream, vfe_get() calls vfe_set_clock_rates() on
initial power-up and vfe_check_clock_rates() on subsequent calls, and both
treat every clock matching vfe_match_clock_names() with non-zero
clock_rate entries as a core VFE clock that must support min_rate.

On SDM845, vfe_res_845 in drivers/media/platform/qcom/camss/camss.c lists
"vfe_lite_src" after "vfe_lite":

	.clock =3D { "camnoc_axi", "cpas_ahb", "slow_ahb_src",
			"soc_ahb", "vfe_lite",
			"vfe_lite_src", "csi2",
			"csi2_src"},
	.clock_rate =3D { { 0 },
			{ 0 },
			{ 80000000 },
			{ 0 },
			{ 19200000, 100000000, 320000000, 404000000, 480000000, 600000000 },
			{ 320000000 },

In drivers/clk/qcom/camcc-sdm845.c, cam_cc_ife_lite_clk ("vfe_lite") is a
child branch of cam_cc_ife_lite_clk_src ("vfe_lite_src") with
CLK_SET_RATE_PARENT. Because "vfe_lite_src" now matches
vfe_match_clock_names():
- When min_rate >=3D 320 MHz, vfe_set_clock_rates() finds no frequency above
  min_rate in the single-entry { 320000000 } table for "vfe_lite_src" and
  fails with -EINVAL ("Pixel clock is too high for VFE").
- When min_rate < 320 MHz or min_rate =3D=3D 0 (where "vfe_lite" picks 600
  MHz), the subsequent loop iteration for "vfe_lite_src" calls
  clk_set_rate() with 320 MHz on the parent RCG, overwriting the rate just
  set via "vfe_lite".

Similarly, on SM8550 (vfe_res_8550), SA8775P / QCS8300 (vfe_res_8775p),
and X1E80100 (vfe_res_x1e80100), the VFE-lite resource tables define
non-zero clock_rate entries for "vfe_lite_ahb", "vfe_lite_csid", and
"vfe_lite_cphy_rx" capping at 400 MHz while "vfe_lite" goes up to 480 MHz
or 600 MHz:

	.clock =3D { "cpas_ahb", "gcc_axi_hf", "cpas_vfe_lite",
		   "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx",
		   "vfe_lite", "camnoc_axi"},
	.clock_rate =3D {
		{ 0 },
		{ 0 },
		{ 0 },
		{ 300000000, 400000000, 400000000, 400000000 },
		{ 400000000, 400000000, 400000000, 400000000 },
		{ 400000000, 400000000, 400000000, 400000000 },
		{ 480000000, 600000000, 600000000, 600000000 },

This causes two issues on those platforms:
- When min_rate > 400 MHz, vfe_set_clock_rates() fails with -EINVAL
  because those auxiliary clocks have no rate above 400 MHz.
- In drivers/clk/qcom/camcc-sm8550.c and drivers/clk/qcom/camcc-sa8775p.c,
  cam_cc_ife_lite_ahb_clk ("vfe_lite_ahb") is parented to
  cam_cc_slow_ahb_clk_src, which maxes out at 80 MHz in hardware. When
  vfe_get() is called a second time while vfe->power_count > 0 (for
  example from csid_set_power() -> parent_dev_ops->get() during
  v4l2_pipeline_pm_get(), or when enabling a second RDI line),
  vfe_check_clock_rates() checks clk_get_rate(clock->clk) < min_rate on
  "vfe_lite_ahb", sees 80 MHz, and returns -EBUSY whenever min_rate > 80
  MHz.

Would it be safer to ensure the character following "vfe_lite" is not '_'
(e.g. checking clock->name[8] !=3D '_' or isdigit(clock->name[8])) so that
only "vfe_lite" and numbered "vfe_liteN" clocks are matched?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-sm8150-v7.=
4-rc1-camss-v2-0-39ee37787b00@andrewgigena.dev?part=3D3
