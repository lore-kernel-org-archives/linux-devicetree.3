Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792899837;
	b=B30L2W0d/+p651+WoeVjSv2SHi5eNGjzLN7fkvjhqQwqT238eLEvjrM4ZxoyGhKJB1St
	 Knpukm8YL/8EyCm1CSEoOllhpvRxzaY+3G0UbNUQ/lxK8n4kAKNKZrlZ5aM83Y5kBjVV9
	 mXx0Lkvre/4z/0iocm/FJJTj5XXHpExgLOWlKMUZ6YekV8fyJZ2sUUeR8m9vwO7/FAaff
	 2zM33zcXgRfnLceXjOvfHw+Azazd9qIpPPtYu00g+ErNTuhNLscUnE0B7ejhmy+lyfPRv
	 sCsO5Jmd95AdjaQxjwTA2Yuxjp9c6Njla3rZ85So828WOWdC0j2WpzLt4TwxpnBqF6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792899837;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iW/YLhq4YHP0MhB15W20oNAr9/VuOu4rVY5G+zlEu4U=;
	b=JPiA405N74EbQSqD4Sl4q4LRT4ZrEtmfxbL96T8foj4pNuC+O5vVsMhcubl9HOFjzZO1
	 /JDVo1gCh712TyrnmZeopuEUceDYzOXA4M5+MNwGHgTnqWTq2R4K1v9HiYrgpkxI1YXFr
	 3wTFQjpQ/nsxOoC2BeMuPAZc+B4zxPTc3qzWpYb0wzde5kvv48bjgJFISXC/ifBzRuTKg
	 HN7T8vUtwaKAAOCq4AxAryByQqDxCzgM3SSrfyWch91bIDp42Hz6Nap0AKrw5DF9THzW0
	 9fjqxWR2lQMFK7y3mWYEOHxlAOc1TTrRzdd+NiQskaGhQJWh8HCe80Kf1xn2LWaJI1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hS7gWp3Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861B3606A31A
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 03:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hS7gWp3Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 963341F01825;
	Sun, 25 Oct 2026 03:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792899837;
	bh=iW/YLhq4YHP0MhB15W20oNAr9/VuOu4rVY5G+zlEu4U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hS7gWp3QzPbLRzE+djryIIzelFPMCuF42v+5PmHZdBgu6mtKwARLglsxZYbvOyr6a
	 hGpvorNPbShJC4iMmijuW5ypbnS21TbYw4Gq1UItM2XCwmzwijepIh5Ezuk78XjMet
	 Zis/zpRSmTA6/vkh0GlylC3jdsTY/qlVcEZ1hO48U3umaYdDbDDVmR/t+1mAXr27O8
	 gfjv1fvlKN2LrFWGk3O3ndIWAM/3F2NyUv3zqeKnaq1H+dN3MIzscN71Kt/B5wZOnc
	 S99cppiR4/F5prFdTxxGMsSeGa01nkVtffShhGEz5NWzofiPdztIfz62YqPZ/7Hjpx
	 oo5WPZEtxx7JQ==
Message-ID: <sashiko-outbox-184024@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v22 11/14] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261024-kaanapali-camss-v22-11-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
 <20261024-kaanapali-camss-v22-11-7da3ea49c8a1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 03:43:56 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] arm64: dts: qcom: kaanapali: CSIPHY opp-300000000 mismatches 266.6=
7 MHz RCG
- [Low] arm64: dts: qcom: kaanapali: unused dt-bindings/phy/phy.h include
--

commit 42e005ff9edc4076b7d2be241a23c845a3953115
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

arm64: dts: qcom: kaanapali: Add CAMSS and CSIPHY block definitions

This commit adds the CAMSS and six CSIPHY device tree nodes along with the
CSIPHY OPP table to the Kaanapali SoC device tree.

> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dt=
s/qcom/kaanapali.dtsi
> index e48a179d07220..11df1c7c6e31d 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -20,6 +20,7 @@
>  #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/phy/phy.h>

[Severity: Low]
This isn't a bug, but is the dt-bindings/phy/phy.h include needed here? None
of the PHY_NONE, PHY_TYPE_*, or PHY_POL_* constants from this header appear
to be used in kaanapali.dtsi or its board overlays.

[ ... ]

> @@ -6548,6 +6925,28 @@ pdp_tx: scp-sram-section@100 {
>  		};
>  	};
> =20
> +	csiphy_mxc_opp_table: opp-table-mxc {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-300000000 {
> +			opp-hz =3D /bits/ 64 <300000000>;
> +			required-opps =3D <&rpmhpd_opp_low_svs_d1>,
> +					<&rpmhpd_opp_low_svs_d1>;
> +		};

[Severity: High]
Should this lowest OPP in csiphy_mxc_opp_table be 266666667 Hz instead of
300000000 Hz?

Each csiphy0..csiphy5 node uses CAM_CC_CSIPHYn_CLK as its core clock, which=
 is
parented to cam_cc_cphy_rx_clk_src with CLK_SET_RATE_PARENT. In
drivers/clk/qcom/camcc-kaanapali.c, ftbl_cam_cc_cphy_rx_clk_src only suppor=
ts
266.67 MHz, 400 MHz, and 480 MHz:

static const struct freq_tbl ftbl_cam_cc_cphy_rx_clk_src[] =3D {
	F(266666667, P_CAM_CC_PLL0_OUT_MAIN, 4.5, 0, 0),
	F(400000000, P_CAM_CC_PLL0_OUT_MAIN, 3, 0, 0),
	F(480000000, P_CAM_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
	{ }
};

When phy_qcom_mipi_csi2_power_on() -> phy_qcom_mipi_csi2_set_clock_rates() =
in
drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c runs for a CSI-2 link
frequency where link_freq / 4 <=3D 300000000 Hz:

	opp =3D dev_pm_opp_find_freq_ceil(dev, &opp_rate);
	...
		perf =3D dev_pm_opp_get_required_pstate(opp, pstate);
		pstate +=3D 1;

		ret =3D dev_pm_genpd_set_performance_state(csi2phy->pd_list->pd_devs[i], =
perf);
	...
	ret =3D dev_pm_opp_set_rate(dev, opp_rate);

dev_pm_opp_find_freq_ceil() selects opp-300000000 and votes RPMHPD_MMCX and
RPMHPD_MXC to rpmhpd_opp_low_svs_d1. However, because cam_cc_cphy_rx_clk_src
uses clk_rcg2_shared_ops (ceiling lookup), dev_pm_opp_set_rate(dev, 3000000=
00)
rounds the clock rate up to 400000000 Hz.

Doesn't this leave the CSIPHY core clock running at 400 MHz while MMCX and
MXC are only voted to rpmhpd_opp_low_svs_d1 instead of rpmhpd_opp_low_svs,
and make the 266666667 Hz clock rate unreachable?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-kaanapali-=
camss-v22-0-7da3ea49c8a1@oss.qualcomm.com?part=3D11
