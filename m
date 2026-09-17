Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3377352FE27
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 13:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651949; cv=none; b=bN2Sjqi0rtdlmWZa0ZKE1hnRYkw3YHxVXAHbzOpbgTlCPpGnmlvGwdZKobW4o2dKbHc3rQb3891Ay8QzuvmFBvaRTpbjXY4xM769FzBBpyqbsx3ktR+bsug07N2IUEXaR0nxCo90pUqcqQj9VHaQzgZaz+7zYWsJiSmasSSvs+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651949; c=relaxed/simple;
	bh=I6YvJjHTYqDjJMILHU4GKUb9gzCgTtUn/W3h08q5+3w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kUC7ryq1Ay8D/gYG2LJJ+I4tTty8R7zDxRbppgpesKBNcl1PqEudjmgKFktC492+GwiT5crwTEpgdAdeoIxnbnAx/iwPSr4RiBx3ZAMQ/L6NBYIP+Qlzv9Qftes0ygi8fDoYpqGAguKPGoK4puZcFu3O29Nn6pHc2VdYOlyRHqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l252lavY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l252lavY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D3341F000FF;
	Thu, 17 Sep 2026 13:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789651946;
	bh=RUEKfyrzVqa5OwAxant9TlUALU3leHf4+Ve8ViFccYg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l252lavYpryZgqddXVs1Jfy3KQlyi7V0d5JZo8Fs6uCTsiBlkhAJT1v42Dqb/Rxca
	 CjZbxIX1rxAwyj8Xg1+u0ZEgz2m2qsgMEY40GK/ZcOBCdK5O3ZITKp8TR8mQHgPWYB
	 zYger5YrjTaH9Lg+NqyN4EDDNeW8R31DB2cOk4WOJbKT4H6vtfnbQ/XN/appVfkuWQ
	 FnkY/AVdcejcwT2vVAMgCZGL4/DlWh986376xtDRSv8cfHQRM8h6tBrkQjG88HMskJ
	 IHn9FW2ZEAUErN2PjMgnDOlT4TrT64CMuLTFzml5kHAhSfNAmmeSdT2rh7rBU2PDw6
	 5AR4Aa8wvKEZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 04/12] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260917-x1e-camss-csi2-phy-dtsi-v7-4-1a63eb35838b@linaro.org>
References: <20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org>
 <20260917-x1e-camss-csi2-phy-dtsi-v7-4-1a63eb35838b@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 13:32:25 +0000
Message-Id: <20260917133226.2D3341F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] arm64: dts: qcom: redundant standalone csiphy nodes claim same r=
esources as camss
- [Low] arm64: dts: qcom: code defines 3 CSID blocks but commit message cla=
ims 2
- [Low] arm64: dts: qcom: required-opps and power-domains mismatch in csiph=
y nodes
--

commit 74737ca93583e7d3d3b8f9b8c33d075ed4ae954e
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

arm64: dts: qcom: x1e80100: Add CAMSS block definition

This commit adds a dtsi fragment to describe the x1e80100 CAMSS block,
defining the CSIPHY, TPG, CSID, IFE, and VFE components.

> arm64: dts: qcom: x1e80100: Add CAMSS block definition
>=20
> Add dtsi to describe the x1e80100 CAMSS block
>=20
> 4 x CSIPHY
> 3 x TPG
> 2 x CSID

[Severity: Low]
The commit message explicitly lists "2 x CSID", but the device tree code
declares three CSID blocks ("csid0", "csid1", "csid2"). Is this description
in the commit message accurate?

> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qc=
om/hamoa.dtsi
> index 8ac3392b2d747..73bbaa49adf7d 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -668,6 +668,50 @@ smem_mem: smem@ffe00000 {
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

[ ... ]

> +	csiphy_mxa_opp_table: opp-table-mxa {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-300000000 {
> +			opp-hz =3D /bits/ 64 <300000000>;
> +			required-opps =3D <&rpmhpd_opp_low_svs_d1>,
> +					<&rpmhpd_opp_low_svs_d1>;
> +		};

[ ... ]

> +		camss: isp@acb7000 {
> +			compatible =3D "qcom,x1e80100-camss";
> +
> +			reg =3D <0 0x0acb7000 0 0x2000>,
> +			      <0 0x0acb9000 0 0x2000>,
> +			      <0 0x0acbb000 0 0x2000>,
> +			      <0 0x0acc6000 0 0x1000>,
> +			      <0 0x0acca000 0 0x1000>,
> +			      <0 0x0acb6000 0 0x1000>,
> +			      <0 0x0ace4000 0 0x2000>,
> +			      <0 0x0ace6000 0 0x2000>,
> +			      <0 0x0ace8000 0 0x2000>,
> +			      <0 0x0acec000 0 0x2000>,

[ ... ]

> +			reg-names =3D "csid0",
> +				    "csid1",
> +				    "csid2",
> +				    "csid_lite0",
> +				    "csid_lite1",
> +				    "csid_wrapper",
> +				    "csiphy0",
> +				    "csiphy1",
> +				    "csiphy2",
> +				    "csiphy4",

[ ... ]

> +		csiphy0: phy@ace4000 {
> +			compatible =3D "qcom,x1e80100-csi2-phy";
> +			reg =3D <0 0x0ace4000 0 0x2000>;

[Severity: Medium]
Will this lead to resource conflicts during device tree parsing?=20

The standalone csiphy0 node natively claims the exact same memory region
(0x0ace4000) and interrupts as the monolithic camss node defined above.
Upstream Qualcomm CAMSS drivers map and manage the PHY intrinsically, so
does defining these separate phy nodes risk -EBUSY errors or structure
conflicts during boot?

> +
> +			clocks =3D <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>;
> +			clock-names =3D "core",
> +				      "timer",
> +				      "ahb";
> +
> +			operating-points-v2 =3D <&csiphy_mxc_opp_table>;
> +
> +			interrupts =3D <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +					<&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;

[Severity: Low]
Does this configuration map correctly in the OPP core?=20

The csiphy_mxc_opp_table defines two required-opps handles, but three
power-domains are declared here. This mismatched configuration can cause
the OPP core to improperly attempt to apply the first RPMh performance
state to the CAM_CC_TITAN_TOP_GDSC domain.

[ ... ]

> +		csiphy4: phy@acec000 {
> +			compatible =3D "qcom,x1e80100-csi2-phy";
> +			reg =3D <0 0x0acec000 0 0x2000>;

[ ... ]

> +			operating-points-v2 =3D <&csiphy_mxa_opp_table>;
> +
> +			interrupts =3D <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +					<&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;

[Severity: Low]
Is this the intended power domain mapping? The csiphy4 node is configured
to use the mxa OPP table (csiphy_mxa_opp_table), but it binds to RPMHPD_MXC
here instead of RPMHPD_MXA.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-x1e-camss-=
csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org?part=3D4
