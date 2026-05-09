Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12412853F3
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 02:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778293115; cv=none; b=MGCG+yWq1gdsk5+PDHrthVJ3NiwE80hzyO9t9r2ct5xlrAXf2AMtpTcOS6Xe6CdJqIKgSn9C86TN0glcjyXbrLuJquTPE+uFPDzbtPwTOMG3J3m7BE7kjGVK4DNvoBFUsHH4EIuKrNR1RVCy5BkNtgLC4ylGB+XcUAVlhIjDY4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778293115; c=relaxed/simple;
	bh=E/CxGmt6mKfp0HgU1/0n55IzC8PwXYKBh1B0kHFnrXg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ycejaa6aN30H4d1RuVcv/Dk4Ohc+oCszrjCeRRwN63gpC7gobmeYFvmAX6azUjDuzNNMF8m1RCOe/F6MN8PPq6G8zWSzdKCt9ja1XlrbO529PoAyj2LKgLSM9gbuxXBOsXe4j5TeqkVOSSAshEEn+goLsrTYHmSg5+bu9HZ+Inc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bQowcyzd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bQowcyzd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F462C2BCB0;
	Sat,  9 May 2026 02:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778293114;
	bh=E/CxGmt6mKfp0HgU1/0n55IzC8PwXYKBh1B0kHFnrXg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=bQowcyzd8Y8tmmEwCm36urhS2WB7Whl9EFOZy1WHQog/NQYwv4sYduOo8PvIrZmRp
	 0UtygCGlvwdDbqu8WJ50pTv8ANReGjdSTLsl0r2HE9DdKAAxoiLlzE/u+mGyiwaJju
	 I7dqWhxzLkgIbvwk1LGaK/7ZjeVbRQe7Eynkv9y8rwiojvLRhslSgab3qWEaUpXY/m
	 19yqQ83gReLHc4TZ2URUvVgRowWruEztVy/+aeJJG14hZ4syBP1HSydOt1nuKBV7ta
	 Zm2UDX+boBRV+gzz2wGeuw9MLbzWN9IPdUin0yrS7UsI0fx/sONDWdNQNbVASxo0QI
	 cEJaah1pU960A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 08/14] media: iris: Rename clock and power domain
 macros to use vcodec prefix
Reply-To: sashiko@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260509-glymur-v5-8-7fbb340c5dbd@oss.qualcomm.com>
References: <20260509-glymur-v5-8-7fbb340c5dbd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 02:18:33 +0000
Message-Id: <20260509021834.3F462C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Stale goto labels were not renamed to match the newly introduced `V=
CODEC` and `AXI_CTRL` terminology, leaving the refactoring incomplete.
--

commit f3b910e5c28a152c2333978c6b950a8247d50b04
Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

media: iris: Rename clock and power domain macros to use vcodec prefix

This commit renames the generic clock and power domain macros in the
iris driver to use a 'vcodec' prefix. This accommodates secondary core
enums and provides more meaningful names.

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/medi=
a/platform/qcom/iris/iris_vpu4x.c
> index 02e100a4045fc..92c0b06bbbff4 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
[ ... ]
> @@ -162,15 +163,15 @@ static int iris_vpu4x_enable_hardware_clocks(struct=
 iris_core *core, u32 efuse_v
>  {
>  	int ret;
> =20
> -	ret =3D iris_prepare_enable_clock(core, IRIS_AXI_CLK);
> +	ret =3D iris_prepare_enable_clock(core, IRIS_AXI_VCODEC_CLK);
>  	if (ret)
>  		return ret;
> =20
> -	ret =3D iris_prepare_enable_clock(core, IRIS_HW_FREERUN_CLK);
> +	ret =3D iris_prepare_enable_clock(core, IRIS_VCODEC_FREERUN_CLK);
>  	if (ret)
>  		goto disable_axi_clock;

This isn't a bug, but should the disable_axi_clock label be renamed to
match the new IRIS_AXI_VCODEC_CLK macro name?=20

> =20
> -	ret =3D iris_prepare_enable_clock(core, IRIS_HW_CLK);
> +	ret =3D iris_prepare_enable_clock(core, IRIS_VCODEC_CLK);
>  	if (ret)
>  		goto disable_hw_free_run_clock;

[ ... ]

> @@ -198,11 +199,11 @@ static int iris_vpu4x_enable_hardware_clocks(struct=
 iris_core *core, u32 efuse_v
>  disable_bse_hw_clock:
>  	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
>  disable_hw_clock:
> -	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_VCODEC_CLK);

Similarly, would it make sense to update labels like disable_hw_clock
to reflect the VCODEC terminology?

>  disable_hw_free_run_clock:
> -	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_VCODEC_FREERUN_CLK);
>  disable_axi_clock:
> -	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
> =20
>  	return ret;
>  }

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers=
/media/platform/qcom/iris/iris_vpu_common.c
> index f1f9e04b7c31f..73c094bc4311e 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
[ ... ]
> @@ -400,7 +401,7 @@ int iris_vpu35_vpu4x_power_on_controller(struct iris_=
core *core)
>  err_disable_ctrl_free_clk:
>  	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
>  err_disable_axi1_clk:
> -	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_AXI_CTRL_CLK);

Could this err_disable_axi1_clk label also be renamed to match the new
IRIS_AXI_CTRL_CLK macro?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509-glymur-v5-=
0-7fbb340c5dbd@oss.qualcomm.com?part=3D8
