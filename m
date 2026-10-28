Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202132;
	b=ud2mLQldBx8EDaMAHZ3HudPSMy64jq/nL6F+uiwVQLQ91UDFVCQocXndq0FaNEp7zuaL
	 FZHOTINR92Jt9sjsT23CAGDqDFwyNmKBc6Lfg862yNvsVFLqaoIifE2xik0NNQV1C9555
	 XEdbsNEWT9XZSvRe1QMNDeSyq9sTaMys0rrTQsXoTVIdWj/ao79nGt65GrzjBEB0x05kd
	 f8TwnfA2vyXih9gNHawa4vAy/3/z+NXO7h7bQRA7WDkBURm4bA1PsjJNgjoCObyB8dnii
	 kmlLI6KzxaHp0sBPtmMcCK7HqIYhe909YHkptDUjbr16hIe3ZuZhWCxClQ0XuerAJjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202132;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mmc1A2QB0Cixr0/n1LGttHhxMhAVpjNFSaTPqJwmkZ0=;
	b=3cQsaJItqy4a9n2OPkfL8dwx4U+zdl03UQpgaYoohDLlwdOi3ImkHZIXzQ7iVbnxNroN
	 Ivok6FAMiSRE3pmuEKQxdutF+rxx8glmfk4PBG83hfdS4//RnKsRnflGIdv6X6cK/rC0b
	 dwA0pR9AblusY2ZWS9COmFRAwLbt43KW7aeobIjIb/zn9tZRR0db0bup/Dj5SDyFS3cVA
	 VYerDB82+EgQMhe5wh7VnU69Dx6SdGrCDAKo8IsApDKOwRwmm71rnC/wAJNnmldOnvZ4R
	 TF4IJzmA0mTeIJNlYU9/yTk1CkdDZine7Y8Uu5D716F+Hpa+SwDeCC5prwgaKoXSH4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R5ma+i7u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AAA606A31C
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R5ma+i7u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEBA71F01825;
	Wed, 28 Oct 2026 15:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793202132;
	bh=mmc1A2QB0Cixr0/n1LGttHhxMhAVpjNFSaTPqJwmkZ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R5ma+i7uR4MB6hvHOJrsaM0HsSmLIxohGoZb8nr/GlnlPakLFln6nJa5u/y+Ufvr9
	 g0DEGjsekPsvojFEP7hZphfrSMinqB0yyIGCL4jYdLJPkK8X10FKyHujapZnfXOrV8
	 R5Zo97401pHouriRRJV4oGMlzBnapYTdY5+Jn1k9qdUkHzkR3u2nfqqqF1enI0YI9z
	 A1VTRD4vSDZhcTax/LfUZSwLrUG8UTSB0fUiTKpT/S87SYEYj7hV4IuIx/IlIGEV74
	 A8lzhkzaIDggYVzR+9ppN4BiW9bUTS7udlNmLfQpWaZrMiECWyg30Wmzo6iR4dgtYx
	 TGVAy/wdfGaeQ==
Message-ID: <sashiko-outbox-188068@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 12/15] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261028-kaanapali-camss-v23-12-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-12-95f250b18612@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 15:42:11 +0000
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
- [High] arm64: dts: qcom: kaanapali: csiphy_mxc_opp_table uses invalid 300=
 MHz OPP
--

commit 0cfa3a0207d1730d9c7ff716309df9aad06f00ba
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

arm64: dts: qcom: kaanapali: Add CAMSS and CSIPHY block definitions

This commit adds device tree definitions for the CAMSS ISP, six CSIPHY bloc=
ks,
and the associated CSIPHY MXC operating points table on the Qualcomm Kaanap=
ali
platform.

> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dt=
s/qcom/kaanapali.dtsi
> index e48a179d07220..0c8fd7da55b78 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
[ ... ]
> @@ -6548,6 +6927,28 @@ pdp_tx: scp-sram-section@100 {
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
> +
> +		opp-400000000 {
> +			opp-hz =3D /bits/ 64 <400000000>;
> +			required-opps =3D <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;
> +		};

[Severity: High]
Should the lowest operating point in csiphy_mxc_opp_table be 266666667 Hz
instead of 300000000 Hz?

In drivers/clk/qcom/camcc-kaanapali.c, the parent RCG for
CAM_CC_CSIPHY0_CLK through CAM_CC_CSIPHY5_CLK uses clk_rcg2_shared_ops
(which rounds up via qcom_find_freq()) and defines the following frequency
table:

static const struct freq_tbl ftbl_cam_cc_cphy_rx_clk_src[] =3D {
	F(266666667, P_CAM_CC_PLL0_OUT_MAIN, 4.5, 0, 0),
	F(400000000, P_CAM_CC_PLL0_OUT_MAIN, 3, 0, 0),
	F(480000000, P_CAM_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
	{ }
};

When a sensor connected to csiphy0..csiphy5 configures a link frequency of
1.2 GHz or lower (so opp_rate =3D link_freq / 4 <=3D 300000000 Hz),
phy_qcom_mipi_csi2_configure() -> phy_qcom_mipi_csi2_set_clock_rates() in
drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c looks up the ceiling OPP and
votes the power domains before setting the clock rate:

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

Because csiphy_mxc_opp_table lists 300000000 Hz,
phy_qcom_mipi_csi2_set_clock_rates() selects opp-300000000, votes
RPMHPD_MMCX and RPMHPD_MXC to rpmhpd_opp_low_svs_d1, and then calls
dev_pm_opp_set_rate(dev, 300000000).

Won't requesting 300000000 Hz skip the 266.67 MHz frequency and round the
CSIPHY core clock up to 400000000 Hz while leaving MMCX and MXC at
rpmhpd_opp_low_svs_d1 instead of the rpmhpd_opp_low_svs corner required for
400 MHz?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028-kaanapali-=
camss-v23-0-95f250b18612@oss.qualcomm.com?part=3D12
