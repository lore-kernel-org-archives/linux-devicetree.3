Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763720;
	b=Uwnyov49nn59YodA4Rjx3aBctIBREAMUKBFXFK+gYi8xBA2iuzeHzmIu4WdWWuvw+liU
	 ZHV9Ttr7gvPQ1uX0ZSCw2xweKB46w3kyteipRzez9I3xma3C79DFpJwZrS0nBnI0FdWgZ
	 8yWYn/DCF0u4CICMr1V22A/DOxChyaVIcxXzmrWw5ySS1Sy2fdPwU9U1tPEvN1yOJO00v
	 L+oVml9nGkNOGbQEp/qmsOeacrRMO0qN1Oiyk7COC752tgWSwsIvUhy4E4UaM2RqX2c84
	 gw70GXQtK2QOLj9X0Op0/FQFQaERpkfyLAuLlV8RbPKAxAqJY2zkZhn/73vYqiehyBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763720;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cWnFRKpZokWkQ5E2c9rJhlVsbvaysRnqtojKqmGnkxo=;
	b=FE0L4C1cQu1kBnwQf/Ssiy+eDHXmFyQOp0vVWkWAOoSS34LePzI58qas2Ub+AAiA9Uoe
	 8LNzpg+tGY6C6GR+706+v2rvzEf2anypwMVcGCQuy1r2YdPPae31hm50LRprP6HXl3miO
	 NWBGNT4D3RuNwmNMeVw5Fx4l+W2NNTIUe5bgNTqZTNEeNfUYFiVHla9GvxEzyPybGBktw
	 u0M5EsaSMYUbs/Xag3jGop1R0LRx8GvhdEcOFUqxwaluuvzbCLZ0KLbm1GMxJOLvL8ZUm
	 c+Fv9WA5FlxkvqTAupjMqvipxNYRUtnjk1BoUCWx7HLyA4qJv+fZ1+wEdMIvTBx8NTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="U/ELI3F4";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C0F606A31B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 03:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U/ELI3F4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A56701F000C1;
	Wed,  4 Nov 2026 03:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793763719;
	bh=cWnFRKpZokWkQ5E2c9rJhlVsbvaysRnqtojKqmGnkxo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U/ELI3F4/9/nErWCZ/+5Y5mbL0qU65EQvMBv0t6TOaCWZcRf93RW+drFMaq2KZ6+o
	 dG1YtYKZOhPnOYfLFBZXKxaHicbVDG4sK7DpuYSKPICtIL1pXO6aIth5hCTpHnEs0r
	 PR/exldeSyG51tGwGVLNJVMJw6TculT7PRoGD27KC/c53aqC1vvBA/0CUOfIUFxPRc
	 i1mF72FF88g6PwLKLDfeRkKCO3phxoqXYH+1irDwbPbYeZUh+L7biC50hVntqjVRXA
	 1ag4UBgrhZ/c8Bqh56hAnNZLujEcAYOEs8egHg/Jabq1RI2kVg83zoyS5zOtMUs7lG
	 N0QF8s6qK79uQ==
Message-ID: <sashiko-outbox-196620@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/5] arm64: dts: qcom: sm8750-lenovo-elden: add the
 Lenovo Legion Y700 Gen4
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104032648.209747-5-xiaqinghuan@mail.ustc.edu.cn>
References: <20261104032648.209747-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261104032648.209747-5-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 03:41:59 +0000
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
- [Medium] arm64: dts: qcom: sm8750-lenovo-elden: unvalidated skeleton boar=
d DTS
--

commit 3e2b204812c71d90f6fa41a9d3a0c687d7154cd7
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

arm64: dts: qcom: sm8750-lenovo-elden: add the Lenovo Legion Y700 Gen4

This commit adds an initial board devicetree for the SM8750-based Lenovo
Legion Y700 Gen4 tablet with the board compatible, chassis type, board
clocks, and firmware-reserved GPIO ranges.

> diff --git a/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts b/arch/arm6=
4/boot/dts/qcom/sm8750-lenovo-elden.dts
> new file mode 100644
> index 0000000000000..821950715c8e4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
> @@ -0,0 +1,50 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2026, Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> + */
> +
> +/dts-v1/;
> +
> +#include "sm8750.dtsi"
> +
> +/ {
> +	model =3D "Lenovo Legion Y700 Gen4";
> +	compatible =3D "lenovo,elden", "qcom,sm8750";
> +	chassis-type =3D "tablet";
> +
> +	clocks {
> +		xo_board: xo-board {
> +			compatible =3D "fixed-clock";
> +			clock-frequency =3D <76800000>;
> +			#clock-cells =3D <0>;
> +		};
> +
> +		sleep_clk: sleep-clk {
> +			compatible =3D "fixed-clock";
> +			clock-frequency =3D <32000>;
> +			#clock-cells =3D <0>;
> +		};
> +
> +		bi_tcxo_div2: bi-tcxo-div2-clk {
> +			compatible =3D "fixed-factor-clock";
> +			#clock-cells =3D <0>;
> +
> +			clocks =3D <&rpmhcc RPMH_CXO_CLK>;
> +			clock-mult =3D <1>;
> +			clock-div =3D <2>;
> +		};
> +
> +		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
> +			compatible =3D "fixed-factor-clock";
> +			#clock-cells =3D <0>;
> +
> +			clocks =3D <&rpmhcc RPMH_CXO_CLK_A>;
> +			clock-mult =3D <1>;
> +			clock-div =3D <2>;
> +		};
> +	};
> +};
> +
> +&tlmm {
> +	gpio-reserved-ranges =3D <39 1>, <74 1>;
> +};

[Severity: Medium]
As reported by Konrad Dybcio on v5 [1], is there a reason to include
arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts in this series before the
base board enablement can be validated on hardware?

In this patch, the root node and tlmm node in sm8750-lenovo-elden.dts only
define the board clocks (xo_board, sleep_clk, bi_tcxo_div2, and
bi_tcxo_ao_div2) needed to satisfy phandles in sm8750.dtsi and the reserved
GPIO ranges, without SPMI PMICs, RPMh regulators, console, or storage.

Even with the follow-up commit ("arm64: dts: qcom: sm8750-lenovo-elden:
describe the WL2868C regulators"), the board devicetree only enables
gpi_dma2, qupv3_2, and i2c10 with pmic@2f (willsemi,wl2868c) and a
wl2868c_vsys fixed regulator, while leaving out the SPMI PMIC regulators
that supply the WL2868C LDO inputs (in-d12-supply, in-d34-supply,
in-d5-supply, and in-d7-supply), any regulator consumers, and base board
peripherals.

Since the WL2868C devicetree usage is already covered in the example in
Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml, should
sm8750-lenovo-elden.dts be deferred to the separate board enablement series
once it can be validated on hardware?

[1] https://lore.kernel.org/r/dddc808a-6407-4db1-aa72-0ebe5652f97c@oss.qual=
comm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104032648.2097=
47-1-xiaqinghuan@mail.ustc.edu.cn?part=3D4
