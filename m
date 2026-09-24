Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F5C22A4EE
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790244145; cv=none; b=FTjg5ixU8JOkBu68/FC9jgDlg99adY/3UC1dVlEamE60y9Vvz6pwY8yOPsq5DIHPeixiD9g9L+x66znpJ3GR5bg0GHY/s8/URQMFZvkqzGr6CRcLR7Lsiu0AfMLRXkcZA36+fD2CmI9MvXsJoTXM/OhJbV/FVchzGOP7REpyDLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790244145; c=relaxed/simple;
	bh=ibKRPJf8XSO0iaOh+FNfRVK63xe0vJ/Mj/U2I9xhA3U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iFrKZy5XsAuk9IJsAleidsSRl7nsj9r5IAHo3/e49RIUCQNCLGb2LNGXBji9QVjV3RcZKlJW2T+EeLZtb9Dmyp2jzI6MJN/NEnpE+VA/B5TzE99Zx/Wu+lixrk9EoOGMZYAg4ETHNFnJSctZd/EdR2KzPriPoXthhn5HIxJUSkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gtspIRct; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gtspIRct"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1A1C1F000FF;
	Thu, 24 Sep 2026 10:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790244133;
	bh=ZSxzVA39HjBXXY9PvGuI1PyJWqK0AjYyHaES0VrujF0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gtspIRctMMOm1tWdu0nxACnTuLj4CqHNOYz8y+YGeKQs5bATYRtDqhd3pgPgIU8OR
	 10PYpdvQlJx3tpKhqhDtWQkFyBjZh3b1czxeZgetzRlDSodEw/dDMwQqVxmwRuokDl
	 dZ63cFyNE3CRVgpAAvfa7izGgboAOwSV51A2vR9+Hmq7K1uSx2oDbyi/oVCWpe2JSG
	 ixQC/bFyLpoIh3x8xpeuZLIF5FuYyNCPUXAuUsWhgntLrr45DLkGeHipBsQ194qSpM
	 DifOzJY+xK8+SzH1ib0TqKxKFREQmsK6A8mOfsMugEJcMJSz6PlpEioWmEkKWYASrV
	 jrBHd+upp94BQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: nord: Add more clock controller
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260924094448.1030807-1-shengchao.guo@oss.qualcomm.com>
References: <20260924094448.1030807-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 10:02:12 +0000
Message-Id: <20260924100212.D1A1C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dts: qcom: nord: videocc clocks array missing sleep clock expected=
 by driver
- [Medium] dts: qcom: nord: missing dt-bindings include for qcom,nord-gpu2cc
--

commit 50b73c21a4d9dbed8364bdbdaafc468f32d0f651
Author: Taniya Das <taniya.das@oss.qualcomm.com>

arm64: dts: qcom: nord: Add more clock controller nodes

This commit adds the GPU, camera, video, and display clock controller nodes=
=20
for the Qualcomm Nord SoC. It also adds their required dt-bindings includes.

Link: https://lore.kernel.org/all/20260920081049.2183845-1-shengchao.guo@os=
s.qualcomm.com/

> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boo=
t/dts/qcom/nord-embedded.dtsi
> index 568fe68cd1859..1ab7d9bc3cfed 100644
> --- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> @@ -3,7 +3,11 @@
>   * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
> =20
> +#include <dt-bindings/clock/qcom,glymur-videocc.h>
> +#include <dt-bindings/clock/qcom,nord-camcc.h>
> +#include <dt-bindings/clock/qcom,nord-dispcc.h>
>  #include <dt-bindings/clock/qcom,nord-gcc.h>
> +#include <dt-bindings/clock/qcom,nord-gpucc.h>

[Severity: Medium]
Should there be an include for <dt-bindings/clock/qcom,nord-gpu2cc.h> in
this list?

The commit adds the gpu2cc node further down in the file, but without the
corresponding dt-bindings header, any future consumer nodes referencing the
gpu2cc clock identifiers will fail to compile.

[ ... ]
> @@ -814,6 +829,99 @@ nwgcc: clock-controller@8b00000 {
[ ... ]
> +	gpu2cc: clock-controller@9890000 {
> +		compatible =3D "qcom,nord-gpu2cc";
> +		reg =3D <0x0 0x09890000 0x0 0xa000>;
> +		clocks =3D <&bi_tcxo_div2>,
> +			 <&negcc NE_GCC_GPU_2_GPLL0_CLK_SRC>,
> +			 <&negcc NE_GCC_GPU_2_GPLL0_DIV_CLK_SRC>;
> +		#clock-cells =3D <1>;
> +		#reset-cells =3D <1>;
> +		#power-domain-cells =3D <1>;
> +	};
[ ... ]
> +	videocc: clock-controller@aaf0000 {
> +		compatible =3D "qcom,nord-videocc";
> +		reg =3D <0x0 0x0aaf0000 0x0 0x10000>;
> +		clocks =3D <&bi_tcxo_div2>,
> +			 <&nwgcc NW_GCC_VIDEO_AHB_CLK>;

[Severity: High]
Will the common clock framework fail to resolve the parent for the sleep cl=
ock
here?

The videocc-glymur.c driver defines DT_SLEEP_CLK as index 2 and uses it as
the parent for video_cc_sleep_clk_src. Because this device tree node only
provides two clocks, index 2 will be out of bounds, resulting in a parent
resolution failure (-EINVAL).

Also, mapping the AHB clock to index 1 appears to be incorrect, because the
driver maps index 1 to DT_BI_TCXO_AO, which isn't actively used as a parent
here.

> +		power-domains =3D <&rpmhpd RPMHPD_MMCX>,
> +				<&rpmhpd RPMHPD_MXC>;
> +		required-opps =3D <&rpmhpd_opp_low_svs>,
> +				<&rpmhpd_opp_low_svs>;
> +		#clock-cells =3D <1>;
> +		#reset-cells =3D <1>;
> +		#power-domain-cells =3D <1>;
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924094448.1030=
807-1-shengchao.guo@oss.qualcomm.com?part=3D1
