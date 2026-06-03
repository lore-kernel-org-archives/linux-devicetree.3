Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC16481667
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 15:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780500352; cv=none; b=FpI4iXzc05RJz+Fka5roOce9ohM84USOTGmbHnJjABVyuOlVAMyHyFnr90yS4xGU/ZTCqW9ToaOgZmOpkv+VCRw+q12ehDfnUOMuQJDRFTdrGPi7O+qWKFOkRqfF6PrR6WxzEhWs4oiJrp8deT76UxnilcZtQF5wqiZhblCHqeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780500352; c=relaxed/simple;
	bh=wTgxak9te5rQ+u1Y/ATQpZ8H1qFL+7vB0OS3CxvBi+0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HSSxqCB/LB1tiarH3YDfzO6DbsBxvUJti7yfYruZqMgFfEmYE9xjZFF5f1AzEkHJNLJe/cgWX81hgLh4YtYnGMnJ/+OOIIBFzfc4lrvssljVIZn6UiDmhyqeKAIvxyOcTVqbRDjk6Esm8LbsXrm3c5YUsulYMFl1vkqnGZ6H+gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Skoi4HOU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Skoi4HOU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 872401F00893;
	Wed,  3 Jun 2026 15:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780500350;
	bh=+uPVwZIQ1rqi6T7Rj5brmQIgeGjLV1aUlYJpcfVPXlo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Skoi4HOUP07uXFB7hREcRKv6AhvQZqL7zvfFTHm1J7vAc5QXYyvSRhyKUQF3ZJZvj
	 Hr4CYv7k3sdWpEezFS2vwRrT6ZLCP0y7q5pJVP/EDuzxbLdxos2mZGbaenBcx5R4uX
	 P3aloO/FMrZSxcTOta2D49kPGqWeLjZXNWtfz2k8oWG257wRugFImPRM3Y2dzE4oUA
	 3A5c7AwbOeKX4237KtzG20J4F5/krfsL2sreFBDx0bSKE5NZwiGkhIL4bGxg6HoBmX
	 gP3KWMzPIQz8IyrNkUqFCU1p0lj6d/d3p+LttGqydbkb/Qz22lbNdR96lAbytLxS28
	 U74xcY0TBYeYA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Add GP M/N clock controller node
 for SA8775P and QCS8300
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260602-pdm_clk_gp_mnd_v1-v1-5-1522662b6c53@oss.qualcomm.com>
References: <20260602-pdm_clk_gp_mnd_v1-v1-5-1522662b6c53@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 15:25:50 +0000
Message-Id: <20260603152550.872401F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Intent Mismatch / Incorrect File Modification
- [High] Missing 'status =3D "disabled";' causes unconditional probe and pi=
n conflict
- [Low] Device Tree Node Sorting violation

Pre-existing issues:
- [High] Hardware Constraint Violation in duty cycle computation
--

commit 6b4f5403f54605460d10e6b912f07451ceb5b128
Author: Taniya Das <taniya.das@oss.qualcomm.com>

arm64: dts: qcom: Add GP M/N clock controller node for SA8775P and QCS8300

This commit adds the GP M/N divider clock controller node to the SA8775P and
QCS8300 device trees. The new node uses the qcom,clk-gp-mnd compatible and =
is
clocked by the PDM XO4 and AHB clocks to expose a single clock output.

> Add the GP M/N divider clock controller node at 0x088d3000 to the
> SA8775P (kodiak, lemans) and QCS8300 (monaco) SoC device trees.

[Severity: High]
Is Kodiak actually an SA8775P variant? Kodiak is typically the core SoC
device tree for the SC7280 family (Snapdragon 7c Gen 3 / QCM6490), while
SA8775P is exclusively Lemans. Does modifying kodiak.dtsi incorrectly apply
this clock controller to the SC7280 family and break its device tree?

> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/q=
com/kodiak.dtsi
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -4412,6 +4412,20 @@ usb2_role_switch: endpoint {
>  			};
>  		};
> =20
> +		gp_mn: clock-controller@88d3000 {

[Severity: Low]
Is this node placed in the correct sorting order? It appears to be inserted
sequentially after the usb@8c00000 node, but 0x088d3000 is less than
0x08c00000, which causes a unit-address sorting violation.

> +			compatible =3D "qcom,clk-gp-mnd";
> +			reg =3D <0x0 0x088d3000 0x0 0xc>;
> +			clocks =3D <&gcc GCC_PDM_XO4_CLK>,
> +				 <&gcc GCC_PDM_AHB_CLK>;
> +			clock-names =3D "pdm_clk", "ahb_clk";
> +			clock-output-names =3D "gp_mn_clk";
> +			#clock-cells =3D <0>;
> +			pinctrl-names =3D "active";
> +			pinctrl-0 =3D <&gp_mn_active>;
> +			assigned-clocks =3D <&gcc GCC_PDM_XO4_CLK>;
> +			assigned-clock-rates =3D <4800000>;
> +		};

[Severity: High]
Should this node include a status =3D "disabled" property? IP blocks that
export signals to external pads are usually disabled by default in SoC dtsi
files.=20

Without it, does the qcom,clk-gp-mnd driver probe unconditionally on every
board, forcibly multiplexing gpio35 to the gp_mn function? This could
potentially break boards that require gpio35 for other functions like
qup_spi8_cs or qup_uart8_rx.

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/q=
com/lemans.dtsi
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -4353,6 +4353,20 @@ opp-384000000 {
>  			};
>  		};
> =20
> +		gp_mn: clock-controller@88d3000 {
> +			compatible =3D "qcom,clk-gp-mnd";
> +			reg =3D <0x0 0x088d3000 0x0 0xc>;
> +			clocks =3D <&gcc GCC_PDM_XO4_CLK>,
> +				 <&gcc GCC_PDM_AHB_CLK>;
> +			clock-names =3D "pdm_clk", "ahb_clk";
> +			clock-output-names =3D "gp_mn_clk";
> +			#clock-cells =3D <0>;
> +			pinctrl-names =3D "active";
> +			pinctrl-0 =3D <&gp_mn_active>;
> +			assigned-clocks =3D <&gcc GCC_PDM_XO4_CLK>;
> +			assigned-clock-rates =3D <4800000>;
> +		};

[Severity: High]
Would it be necessary to add a status =3D "disabled" property here as well =
to
prevent the unconditional multiplexing of gpio35?

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/q=
com/monaco.dtsi
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -4867,6 +4867,20 @@ opp-384000000 {
>  			};
>  		};
> =20
> +		gp_mn: clock-controller@88d3000 {
> +			compatible =3D "qcom,clk-gp-mnd";
> +			reg =3D <0x0 0x088d3000 0x0 0xc>;
> +			clocks =3D <&gcc GCC_PDM_XO4_CLK>,
> +				 <&gcc GCC_PDM_AHB_CLK>;
> +			clock-names =3D "pdm_clk", "ahb_clk";
> +			clock-output-names =3D "gp_mn_clk";
> +			#clock-cells =3D <0>;
> +			pinctrl-names =3D "active";
> +			pinctrl-0 =3D <&gp_mn_active>;
> +			assigned-clocks =3D <&gcc GCC_PDM_XO4_CLK>;
> +			assigned-clock-rates =3D <4800000>;
> +		};

[Severity: High]
Similarly, does this node also need status =3D "disabled" to ensure safe
default behavior?

[ ... ]

While reviewing this change, a pre-existing issue was noticed in the clock
driver itself regarding hardware duty cycle constraints:

drivers/clk/qcom/clk-gp-mnd.c:gp_mnd_clk_set_rate() {
        /*
         * When N =3D 2M + 1 the valid D range [M+1, M] is empty; no duty
         * cycle can satisfy M < D < (N - M).  Reject before touching hw.
         */
        if (n =3D=3D 2 * m + 1)
                return -EINVAL;
        ...
        /* Program the closest-to-50% duty cycle. */
        d_val =3D n / 2;
        ret =3D regmap_write(gp->regmap, GP_MND_DUTY_REG, d_val);
}

[Severity: High]
This is a pre-existing issue, but does the driver fail to fully enforce the
hardware duty cycle constraint M < D < (N - M)?

If req->rate >=3D parent_rate / 2, rational_best_approximation can return M=
=3D1,
N=3D2. In this scenario, N <=3D 2 * M is true, making the check n =3D=3D 2 =
* m + 1
evaluate to false, and the calculation proceeds.

Does the driver then blindly compute d_val =3D N / 2 =3D 1 and program M=3D=
1, D=3D1,
N=3D2 into the hardware, violating the M < D constraint?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602-pdm_clk_gp=
_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com?part=3D5
