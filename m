Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2223F6614
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 10:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786013225; cv=none; b=lauu5RTlCCyDBJb+z5uBW+mOAfWlvUxthK7AYQXNtRLI8qmHLSquGNEkLlO/hc97CiR+UChLMtRYgmmOardHkVu6hs95tnIPkrxWhAcGyHBTLHZYutGKzDM+wlK7s/LcLgCvIRPbqbtuJ99sLlItZy7sKmExxi1HCt/obmMG8jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786013225; c=relaxed/simple;
	bh=NAabhPRsesaQMg2Wn+dY0BapVk3eoU1w7dtXkIcX6eo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oKAwTDwJbNBpHu9dTThL30Aaqo6R5FI4VBX2WbrKLhBwKSmiduccovXf1oPJ7eTw9Sx6XADKcKwjLbiI+voANEFPhOhVjnmmagmjTfEgnET7CbmyMJ4igpXZ8GAswtwAK4qolJk0/PLskUDsePQVLWSb1vDtJ3S7+UkybTnC3vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GJ2pQr/W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GJ2pQr/W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD701F000E9;
	Thu,  6 Aug 2026 10:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786013222;
	bh=AJTaXOd0TgddcTmhZFl16ToduvfrJdHH3rOljWMkdm4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GJ2pQr/WlZHD6apZoDnW+oewgWIxYFzVN/1wgaFxlR2eh9uqPivGcJHDwnxbNGPD9
	 ER/jec6B65r2f0Z5G2TpidnqLeg9ByAKNNiTCOtmmYx8OyE1FkFuMSL9nnlPRuDddY
	 ZBIvHVsIO5inK0ah7LK2HOe08nl5L5Pf4ILHCItgmKJDVjtOzeov1uLsIyJZf+THf6
	 viPBkXI6PspoU6zvJ7DWFNYUFCLoQqL7yDTz/aPaW1PEx66KEdIf71et0JKjqQsUD9
	 HVZ3mYDc9JogCuStKlopaIJMgjZiclowU/MMlkOgbZ73pfnHQXeqO/WAZMI1oKHXYI
	 YEc0dFKg0HnSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 10/10] arm64: dts: qcom: eliza: Add support for MM
 clock controllers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260806-eliza-mm-cc-v9-v10-10-6ba52dd14343@oss.qualcomm.com>
References: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
 <20260806-eliza-mm-cc-v9-v10-10-6ba52dd14343@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 10:47:01 +0000
Message-Id: <20260806104701.EDD701F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Device tree nodes for gpucc, videocc, and camcc are inserted out of=
 unit-address sorting order.
--

--- Patch [10]: [PATCH v10 10/10] arm64: dts: qcom: eliza: Add support for =
MM clock controllers ---
commit 1e9fc02b64bc332e46fe1a0e852faed44bcbabfb
Author: Taniya Das <taniya.das@oss.qualcomm.com>

arm64: dts: qcom: eliza: Add support for MM clock controllers

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, videocc, gpucc) for Qualcomm Eliza SoC.

> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qc=
om/eliza.dtsi
> index 66ea4aaafd73a..94297e05677ae 100644
> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
[ ... ]
> @@ -2893,6 +2914,60 @@ mdss_dp0_out: endpoint {
>  			};
>  		};
> =20
> +		gpucc: clock-controller@3d90000 {

[Severity: Low]
Are the newly added nodes (gpucc@3d90000, videocc@aaf0000, camcc@ade0000)
inserted out of unit-address sorting order here?

They appear to be placed after the mdss@ae00000 node which has a higher unit
address. Does this violate the device tree convention requiring child nodes
to be sorted by unit address in ascending order?

> +			compatible =3D "qcom,eliza-gpucc";
> +			reg =3D <0x0 0x03d90000 0x0 0xa000>;
> +
> +			clocks =3D <&bi_tcxo_div2>,
> +				 <&gcc GCC_GPU_GPLL0_CPH_CLK_SRC>,
> +				 <&gcc GCC_GPU_GPLL0_DIV_CPH_CLK_SRC>;
> +
> +			power-domains =3D <&rpmhpd RPMHPD_MX>,
> +					<&rpmhpd RPMHPD_CX>;
> +			required-opps =3D <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;
> +			#clock-cells =3D <1>;
> +			#reset-cells =3D <1>;
> +			#power-domain-cells =3D <1>;
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-eliza-mm-c=
c-v9-v10-0-6ba52dd14343@oss.qualcomm.com?part=3D10
