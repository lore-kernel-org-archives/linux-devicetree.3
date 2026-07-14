Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F7D21ABD7
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784004859; cv=none; b=GVUCyH/HyDBhQIJPfGe3dq1G8HQsR6h6izLu6qlKfE4qS1ZTR9EUNNL0U4D3dHZcnFEOFbGyshkh+Xkr/kadInduXh7fxhDumRfTtWBFYBgN2KtJe0ekGp426UlwqN2RpCX4X1n5vPIsXs+o1QiE6TNdC79eLHfKeqTPQVox5T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784004859; c=relaxed/simple;
	bh=btxMV7rY+AOSS6OB1celApZTpdpEI4VV15pLskd7en8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PFV5rr9Ch4bvJhGX9ueA451N3wE4wueOslGz7LYLuEgx9q7OPnAzERwQKOtJQHyPrVvJC+48VKcfVqaHuK3w1Y2L6jYx0qnJ8Uvodyu9CtY2uhMs/xPpDgPrySGEjRHwYhWtHVkg25cl5mYEpCAu97AsgHewab+gOLmtr0rkv2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UK/Y9Hns; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UK/Y9Hns"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D34441F000E9;
	Tue, 14 Jul 2026 04:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784004858;
	bh=d0cabmj8vT7siRNyfSeEbx/Id+0vI6c/XgfZ3qxAaeQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UK/Y9HnsjrhAa9hcxbMP95LnA47wgJDo1EfUK8h1AVwfFPcwy+hAOnbw1hcbJzCuh
	 wG6S6mgDjuOaFLaxUeVgDpSdRYfOEkYmkp+TI8O36ITNXarVD1NJ5Qm6I81eUeUGwz
	 OHA2C5+YM5RVPKpcgPGn5iUWDmQf/RoZKDw060l+cum/RgWtWEqWWHP5u/7ufUGETY
	 tKfAFKYvKHhL5FntYoPBwYJOe/iG5h6bM+YiQqwDA0TOppNDWXmB0DcBNKM1k5eZQN
	 7rADDRMUIADflmqVyKymHmG9KfOSRbEohZbZuuEmrV8/X58HDA6X6S80XqxDRupcq/
	 rQrRKbHXZefKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: ipq9650: add the PCIe support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kathiravan Thirumoorthy" <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260714-ipq9650_pcie-v1-1-4197749d06bd@oss.qualcomm.com>
References: <20260714-ipq9650_pcie-v1-0-4197749d06bd@oss.qualcomm.com>
 <20260714-ipq9650_pcie-v1-1-4197749d06bd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 04:54:17 +0000
Message-Id: <20260714045417.D34441F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `gcc` node is missing the `#interconnect-cells =3D <1>;` prope=
rty, which causes interconnect parsing for all PCIe controllers to fail.
--

--- Patch [1]: [PATCH 1/2] arm64: dts: qcom: ipq9650: add the PCIe support =
---
commit 568f2d4c0bdec47be174d592deb75c6d379fe4dd
Author: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

arm64: dts: qcom: ipq9650: add the PCIe support
   =20
IPQ9650 has 5 Gen3 PCIe controllers - PCIe0 and PCIe4 are single lane
and the remaining instances are dual lane. Add support for the same.

> diff --git a/arch/arm64/boot/dts/qcom/ipq9650.dtsi b/arch/arm64/boot/dts/=
qcom/ipq9650.dtsi
> index 3d3b317c6a3cc..8301a4090395e 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
[ ... ]
> @@ -216,11 +371,11 @@ gcc: clock-controller@1800000 {
>  			reg =3D <0x0 0x01800000 0x0 0x40000>;
>  			clocks =3D <&xo_board>,
>  				 <&sleep_clk>,
> -				 <0>,
> -				 <0>,
> -				 <0>,
> -				 <0>,
> -				 <0>,
> +				 <&pcie0_phy>,
> +				 <&pcie1_phy>,
> +				 <&pcie2_phy>,
> +				 <&pcie3_phy>,
> +				 <&pcie4_phy>,
>  				 <0>,
>  				 <0>;
>  			#clock-cells =3D <1>;

[Severity: High]
Does this gcc node need an #interconnect-cells =3D <1>; property?

The new PCIe nodes declare interconnects pointing to the gcc node.

When the PCIe controller driver attempts to acquire these interconnects
during probe via devm_of_icc_get(), the core interconnect code calls
of_parse_phandle_with_args().

If the target gcc node lacks the #interconnect-cells property, parsing
fails and returns -EINVAL. This will cause PCIe initialization to fail
entirely for all 5 controllers.

[ ... ]
> @@ -371,6 +526,506 @@ frame@f42d000 {
[ ... ]
> +		pcie3: pcie@30000000 {
> +			compatible =3D "qcom,pcie-ipq9650", "qcom,pcie-ipq9574";
[ ... ]
> +			interconnects =3D <&gcc MASTER_ANOC_PCIE3 &gcc SLAVE_ANOC_PCIE3>,
> +					<&gcc MASTER_CNOC_PCIE3 &gcc SLAVE_CNOC_PCIE3>;
> +			interconnect-names =3D "pcie-mem", "cpu-pcie";
> +
> +			status =3D "disabled";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-ipq9650_pc=
ie-v1-0-4197749d06bd@oss.qualcomm.com?part=3D1
