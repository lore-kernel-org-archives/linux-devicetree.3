Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617074;
	b=dksXvlIN5T5Hhd0sAn3KZiXCEqLc9vQO4mIKuFqCTZkH7qpRvhJ2A2VhniW2P0Rhg8Lh
	 +Dgydb2mJnI1YE8V/+TdzS4SAZ+B9qkXjyjk4wbpI4hgSgwYgqUq3CNfInvbo97dXfdIV
	 IAGbp8cj9yZjTaDu4Nn/P1zDHOduinswmKF8AZpazvBFr+4NUdr9f+uxdE9RHG/jLwnSt
	 oRXQdgZ3XyLpUuTYrEn28FTf/sZqgMLKzsuUYB3leDNzHijsGhH5nPEHOPdv5PurG4LCf
	 0Owgv0JkYFR6UpIY2O7GpwTpMgtQdxSpf8wZRfHxjL8Xd+YhUuWdYz/OODGr13qJGhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617074;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Qt69dui3vM1hwfTQp40iWXN67/TizZiz9/GxVsOWtr0=;
	b=ZY/JGtndcMgeTHsf0UbYLepJ6hl2NW8eXYyGTN+pfnh093ed/aUfyOGBgjE75ukYdIbm
	 rJQBh6FcSqiWwfheERJSNDRukEHVmDR0tFvw9RgIWZ/aH1QXql04JBGN18yTcJW9xJwYH
	 Cqk1NNpiIsTYzL3NxhTxtxL2Mt4TdHkFDZF91Kyj73Ad4Z6L02CmGUcwfNRMNegY7VBAx
	 lGBOPvRs6DjpcU/+W+dV2wSN9CH0SVNe7CcsLwBoLp02JY5W5zfMuZE41GHxbdJAnS9Z2
	 3P25miwh2N0dYmrukB7RfjS8aVuI/XS3Hir3zG6iSO7smpVDaa750tVHaIXuQv0CEjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fMbdkBFf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6887660A2601
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 10:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fMbdkBFf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AD831F00A17;
	Mon,  2 Nov 2026 10:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793617074;
	bh=Qt69dui3vM1hwfTQp40iWXN67/TizZiz9/GxVsOWtr0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fMbdkBFf2z4tPwm/mjEERGxtwXgw1RXkhFJM+BoORC16ZP+vyV9CYKP4yCPy3yoZN
	 S5k+GuvR13ysPsQiaCTCub9eEKa6CZkrDjWxboTbE/D74hlbA/ZVfgPWRFwyUEHhQD
	 AF5aW+yvAcyk9gh1k1rDyLY+1T8s0zU2hkmAjlLHuSWazTe74WIigYKbWchBOiSW+G
	 KOLF2obC//1bosiv5+8PWCVjanPF9mwa765MNJpb6yQumwnvDvdRsXJ4AEE/W4ByWh
	 tZUxkclBCls47yRde14Y/4AFVP0Knz0z4FSKI+D+cbXsKPxATOzvhW02JruFpk8P6j
	 /U26gRwn9MyZQ==
Message-ID: <sashiko-outbox-193302@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v24 12/15] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261102-kaanapali-camss-v24-12-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
 <20261102-kaanapali-camss-v24-12-d6b8f3f6f66f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 10:57:53 +0000
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
- [High] arm64: dts: qcom: kaanapali: csiphy_mxc_opp_table uses invalid 300=
 MHz OPP
- [Low] arm64: dts: qcom: kaanapali: unused include of dt-bindings/phy/phy.h
--

commit e55da6889b7174ae815f4ae6f06a71a14f566861
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

arm64: dts: qcom: kaanapali: Add CAMSS and CSIPHY block definitions

This commit adds device tree nodes for the CAMSS camera subsystem, six CSIP=
HY
instances, and the CSIPHY OPP table on the Qualcomm Kaanapali SoC.

> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dt=
s/qcom/kaanapali.dtsi
> index e48a179d07220..e107bcdf0f8ef 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -20,6 +20,7 @@
>  #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/phy/phy.h>

[Severity: Low]
This isn't a bug, but is the dt-bindings/phy/phy.h include needed here? None
of the macros from that header appear to be used in kaanapali.dtsi.

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
As reported by Sashiko on v23 [1], should this lowest OPP in
csiphy_mxc_opp_table be 266666667 Hz (opp-266666667) instead of 300000000 H=
z?

The CSIPHY core clocks (CAM_CC_CSIPHY0_CLK through CAM_CC_CSIPHY5_CLK) on
Kaanapali are sourced from cam_cc_cphy_rx_clk_src, which only supports
266666667 Hz, 400000000 Hz, and 480000000 Hz and uses clk_rcg2_shared_ops:

drivers/clk/qcom/camcc-kaanapali.c:
static const struct freq_tbl ftbl_cam_cc_cphy_rx_clk_src[] =3D {
	F(266666667, P_CAM_CC_PLL0_OUT_MAIN, 4.5, 0, 0),
	F(400000000, P_CAM_CC_PLL0_OUT_MAIN, 3, 0, 0),
	F(480000000, P_CAM_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
	{ }
};

When phy_qcom_mipi_csi2_power_on() -> phy_qcom_mipi_csi2_set_clock_rates() =
is
called with a link frequency where link_freq / 4 <=3D 300000000 Hz,
dev_pm_opp_find_freq_ceil() selects opp-300000000 and sets the RPMHPD_MMCX =
and
RPMHPD_MXC power domains to rpmhpd_opp_low_svs_d1:

drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c:phy_qcom_mipi_csi2_set_clock=
_rates() {
	...
	opp =3D dev_pm_opp_find_freq_ceil(dev, &opp_rate);
	...
	for (i =3D 0; i < csi2phy->pd_list->num_pds; i++) {
		...
		perf =3D dev_pm_opp_get_required_pstate(opp, pstate);
		pstate +=3D 1;

		ret =3D dev_pm_genpd_set_performance_state(csi2phy->pd_list->pd_devs[i], =
perf);
		...
	}
	dev_pm_opp_put(opp);

	ret =3D dev_pm_opp_set_rate(dev, opp_rate);
}

Because clk_rcg2_shared_ops rounds up via qcom_find_freq(..., CEIL), calling
dev_pm_opp_set_rate() with opp_rate =3D 300000000 skips 266666667 Hz and ro=
unds
the CSIPHY core clock up to 400000000 Hz. Does this leave the 266.67 MHz ra=
te
unreachable and run the CSIPHY core clock at 400 MHz while MMCX and MXC rem=
ain
at rpmhpd_opp_low_svs_d1 instead of rpmhpd_opp_low_svs?

[1] https://lore.kernel.org/r/20261028-kaanapali-camss-v23-12-95f250b18612@=
oss.qualcomm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-kaanapali-=
camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com?part=3D12
