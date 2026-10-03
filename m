Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D931E8826
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 09:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791019190; cv=none; b=QS9oDVvGIYUUe4UI4/DXUrug1cUK5boffnH1Zlm58IYo0B16J++1H2FVba40U7xWXkudpfuo1wuTEFCkuukboENeFLwtkPoq+PmuXK7TNhkCv5E7MkBlYQGVkAub+pJ1U6GWZLhBnWVPUxs3rW0QUTvPX7qPWfoU3gKXTamYewI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791019190; c=relaxed/simple;
	bh=kEVTo4cr+D55aRyhWUPXH7XWQHSmiVHYyDaDFarQ6Rw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nRjALrOzFiMNn91kNAv1eklWr9B3JHNU/k+krgUMAoR6ZYEevezP6R8k981X0eIrffcSRn0k9+qQdN7Ro8NPGS9kDXXnVywX5etc8TMLQ35IU3USwgKDl12qQqzcywBnSks7bgmQeEQB1/E3JancOZdRTgIJUrJSECvXCVrgnaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ERq+vjy4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ERq+vjy4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF9A01F0089B;
	Sat,  3 Oct 2026 09:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791019189;
	bh=ysZOVVqX9okszL2Y+UGZpDNVGZvBDm9/l6jRH3C3RHs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ERq+vjy4HXWMT8Y7k0DEI1uBOkdj3Y4iNwySMAzNfYhPMPTXLRDcgKHCPCdeEzY5O
	 OXor894XsgbtnKHAKjp2z3j5jEXyN7atW1hHt+gZiwnBiauR6YHz4ayfeEefoAqihq
	 5IyolUYxTrFZAM5egpMzzwKDTfzzooUNT7tP4jmwOWV4Na+Ay3m/zbbjjQHl6p3juE
	 O4mWncgSRHeT8w4F5CY8FLjdGFDN7luze2gQWFfEaYUSqXMmCufeXs5WSWv6nemlLe
	 yZU5DsXyEcOfMHCskISvY5L4fiSCDBgeNPUWLtlzNwQMWChHYY3bgbRtasZ2JEREGS
	 wLR0P8wuVAcTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 09/11] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: neil.armstrong@linaro.org, media-ci@linuxtv.org, conor+dt@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, vkoul@kernel.org
In-Reply-To: <20261003-kaanapali-camss-v18-9-87ba4ebe0db1@oss.qualcomm.com>
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
 <20261003-kaanapali-camss-v18-9-87ba4ebe0db1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Oct 2026 09:19:48 +0000
Message-Id: <20261003091948.AF9A01F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dt-bindings: pm: mismatch between power-domains and required-opps =
in csiphy nodes
- [Medium] dt-bindings: media: missing internal SoC OF graph links between =
camss and csiphy
--

commit 14fbcf150a21f3b840f99ac0a615d5f91a887f84
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

arm64: dts: qcom: kaanapali: Add CAMSS and CSIPHY block definitions

Describe the CAMSS and CSIPHY blocks on Kaanapali so that camera pipelines
can be enabled by board device trees.

> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dt=
s/qcom/kaanapali.dtsi
> index e48a179d07220..7e5106865e7ee 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
[ ... ]
> +		camss: isp@9253000 {
> +			compatible =3D "qcom,kaanapali-camss";
[ ... ]
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				port@0 {
> +					reg =3D <0>;
> +				};
> +
> +				port@1 {
> +					reg =3D <1>;
> +				};

[Severity: Medium]
Will the camera subsystem data path break without endpoint nodes connecting
these CAMSS ports to the respective CSIPHY outputs?

The CAMSS driver checks for endpoints to discover non-legacy PHY nodes, so
missing them here could cause the CSIPHYs to fail to initialize during
probe. Should endpoints be added here to complete the internal SoC OF graph
links?

[ ... ]
> +		csiphy0: phy@9523000 {
> +			compatible =3D "qcom,kaanapali-csi2-phy";
> +			reg =3D <0x0 0x09523000 0x0 0x2000>;
> +
> +			clocks =3D <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>;
> +			clock-names =3D "core",
> +				      "timer",
> +				      "ahb";
> +
> +			interrupts =3D <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> +
> +			operating-points-v2 =3D <&csiphy_mxc_opp_table>;
> +
> +			power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +					<&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;

[Severity: High]
Since this node declares 3 power domains but relies on an OPP table with on=
ly
2 required-opps, does this break index alignment?

The genpd framework maps required-opps positionally to the PM domains
specified in power-domains. This mismatch might cause incorrect performance
states to be applied to the wrong power domain (e.g. voting on a GDSC
instead of MMCX), leading to PM framework errors or hardware hangs.

Also, shouldn't there be a ports definition in this CSIPHY node to link
back to the CAMSS controller?

> +			power-domain-names =3D "top",
> +					     "mmcx",
> +					     "mx";
> +
> +			status =3D "disabled";
> +		};
[ ... ]
> +	csiphy_mxc_opp_table: opp-table-mxc {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-300000000 {
> +			opp-hz =3D /bits/ 64 <300000000>;
> +			required-opps =3D <&rpmhpd_opp_low_svs_d1>,
> +					<&rpmhpd_opp_low_svs_d1>;

[Severity: High]
Does this required-opps array need to be padded to align with the 3 power
domains specified in the CSIPHY nodes above?

To correctly skip the GDSC at index 0, should it be padded like:
<0>, <&rpmhpd_opp_low_svs_d1>, <&rpmhpd_opp_low_svs_d1> ?

> +		};
> +
> +		opp-400000000 {
> +			opp-hz =3D /bits/ 64 <400000000>;
> +			required-opps =3D <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261003-kaanapali-=
camss-v18-0-87ba4ebe0db1@oss.qualcomm.com?part=3D9
