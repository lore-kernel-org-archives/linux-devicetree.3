Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794549479;
	b=RpZqtbu/+wRiMTcpAMZavVbTBLOFafqTAxR95c2b6xTczLnHc3BRf3W96SJ/+68LJXMi
	 KS9VY17N6wt3nYmhazMpS9ePvG60RhA8gYQfPBndakMSwZSwfAIXEoBdNSVeFIdeKAYMU
	 dpgwnzMoUDpUvgLuYOJss50AOq5PKHrP8WfWXAnr47be+HgxDgotkZkvJhOUYI/eRGYv7
	 5kNKhqk1IngthieItx95N4eEqmGkBTgWywaSpYTpQRgqaYf7CR11ulPjZbZUKr6GiLwsa
	 adf56CgiIK485PFamzZZERMmceYKlm7s3rxeUBr/jdsdW9L44hH/INjQr/zrLWbcZ9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794549479;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7TFBvxJfw2BulY8oeHSN+/KEJ4bz66fs7mTRvIFpvC8=;
	b=uThfob79vQ094OIhCurvisQwABgIvMg2ZTLnSIYR+SHbO7yogrtSW9L6qOwW76LwDRax
	 daB3pAIeMb0eW3YMm+tLKgdSWg24CqEnwiEe9UopdJhPvtadulyBYTaLshRAhqvh1AXNX
	 vtuvAo4gxaZ2f7c+dPRQRzlAwAt4v9h7nm5/H/0D6HxJCLxSmuDToKU9kGzjE78t8npUa
	 ige++3VclcNwlpJKpKuTEvX2xSVLQZ8GjvpETwSHBG91NNkGPM61ftZ3YLbXAtXwx+HRf
	 OvaeOqFuG5GrMsTDfbVOZmrQGrsDUZN2erl7GGvltnw+ow24ZNWrWbKXiLMhZdeCXLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GLPBlqfd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94221606A886
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GLPBlqfd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B88DF1F000C5;
	Fri, 13 Nov 2026 05:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794549479;
	bh=7TFBvxJfw2BulY8oeHSN+/KEJ4bz66fs7mTRvIFpvC8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GLPBlqfd72xsuNhGbYBBBy3pyWOASf9KDAcQ2DGeb8jDsATFA01CnkitMul4q3EHT
	 EZzhaqRByl7FFi0+wN9Dw3Fu7mocXEoKnBWDYg0TZ8r7Jp0c7dBfgilffJe7MKX/xQ
	 v0fmzhTkIdi2joPNWQscScOStcMEIJQc8g636Qn8qAL1gddbN4g2oa/pNDufBm4MDd
	 v45O5/PlxuA5HLfTyBtn8Y7kx4DZb93LroadkS+Cdu55kIfqGhTFrhjfZ09DszU5yq
	 fYXomGP/lbfPLldwgupqsf8Qr7gblqoMe4agA6CT4X+Cw4UqeEm85l4On4+Dy7tA5x
	 pqss1iiGssIAw==
Message-ID: <sashiko-outbox-212261@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v25 12/15] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261112-kaanapali-camss-v25-12-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
 <20261112-kaanapali-camss-v25-12-1d709f57f370@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 05:57:58 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] arm64: dts: qcom: kaanapali: csiphy_mxc_opp_table uses invalid
  300 MHz OPP
- [Low] arm64: dts: qcom: kaanapali: unused phy.h include and
  opp-table-mxc order
--

commit befb433d501b587990306f1fbc874552415d638d
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

arm64: dts: qcom: kaanapali: Add CAMSS and CSIPHY block definitions

This commit adds the CAMSS, CSIPHY0..5, and CSIPHY OPP table device tree no=
des
for the Qualcomm Kaanapali SoC.

> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dt=
s/qcom/kaanapali.dtsi
> index 9f04a5ad75f21..23406698370fb 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -20,6 +20,7 @@
>  #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/phy/phy-qcom-qmp.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>

[ ... ]

> @@ -6566,6 +6943,28 @@ pdp_tx: scp-sram-section@100 {
>  		};
>  	};
> =20
> +	csiphy_mxc_opp_table: opp-table-mxc {

[Severity: Low]
This isn't a bug, but dt-bindings/phy/phy.h is not used in this file, and
opp-table-mxc is placed after soc@0 instead of in alphabetical order by node
name between memory@a0000000 and pmu.

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

The CSIPHY core clocks (CAM_CC_CSIPHY0_CLK..CAM_CC_CSIPHY5_CLK) parent to
cam_cc_cphy_rx_clk_src, which uses clk_rcg2_shared_ops (ceiling rate lookup)
and only supports 266.67 MHz, 400 MHz, and 480 MHz:

drivers/clk/qcom/camcc-kaanapali.c:
static const struct freq_tbl ftbl_cam_cc_cphy_rx_clk_src[] =3D {
	F(266666667, P_CAM_CC_PLL0_OUT_MAIN, 4.5, 0, 0),
	F(400000000, P_CAM_CC_PLL0_OUT_MAIN, 3, 0, 0),
	F(480000000, P_CAM_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
	{ }
};

When a sensor streams with link_freq / 4 <=3D 300 MHz,
phy_qcom_mipi_csi2_set_clock_rates() selects opp-300000000, votes the MMCX =
and
MXC power domains to rpmhpd_opp_low_svs_d1, and calls dev_pm_opp_set_rate()
for 300 MHz.  Because 300 MHz exceeds 266666667 Hz, the RCG rounds the CSIP=
HY
core clock up to 400 MHz while leaving MMCX and MXC under-volted at
rpmhpd_opp_low_svs_d1 instead of rpmhpd_opp_low_svs, and the 266.67 MHz rate
can never be selected.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-kaanapali-=
camss-v25-0-1d709f57f370@oss.qualcomm.com?part=3D12
