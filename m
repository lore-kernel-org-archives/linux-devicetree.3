Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9487A31F98B
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 07:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781334558; cv=none; b=ABXy1LIoMSAHw2f6r4DNppaXxekrON7JweMkmg24bv1XgwSfcB951UV5UgjHif6HKNwzuSIgMrcg7dMV1djyYCPoqGVjpEpAd6WWE5JX7TXZwXzxoNpRTFawVtqX+sSfTbE/Fdj50lEYxbrZEkpFAf9ode9xr7dm9LIdz/UGv8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781334558; c=relaxed/simple;
	bh=du+XA+/6nUdgAn+L20Xa0DQtvFjxHX+nzoSN7aMYNnk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MQFowRfWV7bvxu2VVKwAEbWFN87lhsdIodrHrh7IAIaUD1JEF3OPm8qceqRZkCVcuPZjpj7N5txp+AnZA6iPmaQEFh00LJlbJ9w+SvV9CRPmhu+WjY0ZaVLmV6OfjSTKi04I5huEHaXATeb9dVjqlWFTQXIBPtQhuZ/30XO7JCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HS0Vt6ou; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HS0Vt6ou"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A362E1F000E9;
	Sat, 13 Jun 2026 07:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781334555;
	bh=UB3uAjFnfhInw5+4dO1bH2vnDbZT3yG6O7bCyCmnOwU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HS0Vt6ouKAIXqUNd2hLd+H6Sgn/LRnTdVMiy/PtJuglpeCFCJE2erTYo8J/CD6VrQ
	 XQVdHm2c++31BxPBMXQRmGCxzyQfaouvaRzS/vbE68pPAodbITePM8tcN1WC4baJJu
	 kRq88kDC+4LYsjHSadxCCK38aptYIGxQIX1W39aGPxPYRC7EgRvZPW9OfvzuDBmYQ/
	 h0gUA8TgSPKfobJGWt6K41mGJtzcMt3loudRpWWddKPQDTq2Xqw57b8/E7/NXRLEB6
	 2/HgqBOm4IAm5zJDxLksKzmsB4yeHDHliSl1HUw2ORRDr7f7mieDg1jlH865ih8mHm
	 HgVPRq0mIcYYw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v4 7/9] arm64: dts: rockchip: rk356x: Add the NPU
 and its IOMMU
Reply-To: sashiko-reviews@lists.linux.dev
To: MidG971 <midgy971@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260613070116.438906-8-midgy971@gmail.com>
References: <20260613070116.438906-8-midgy971@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 13 Jun 2026 07:09:15 +0000
Message-Id: <20260613070915.A362E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incorrect IOMMU compatible string 'rockchip,iommu' is used for the=
 RK3568 NPU IOMMU, which will cause translation faults.
- [High] The assigned clock rates for the NPU AXI bus and compute core are =
swapped, severely overclocking the AXI bus.
--

commit a304190b5b1e8ffa602c7c5d7dbdfed3a2c3dcae
Author: Midgy BALON <midgy971@gmail.com>
Subject: arm64: dts: rockchip: rk356x: Add the NPU and its IOMMU

This patch adds the device tree nodes for the NVDLA-derived NPU and its
associated IOMMU on the RK3568 SoC. It configures the clocks, resets, power
domains, and assigns the PMU syscon to manage the NPU NoC bus-idle. The
configuration also intends to bring up the NPU AXI bus clock at 200 MHz.

> diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk356x-base.dtsi
> index 64bdd8b7754b5..313db59c1aed8 100644
> --- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
[ ... ]
> @@ -572,6 +579,37 @@ power-domain@RK3568_PD_RKVENC {
>  		};
>  	};
> =20
> +	rknn_core_0: npu@fde40000 {
> +		compatible =3D "rockchip,rk3568-rknn-core";
> +		reg =3D <0x0 0xfde40000 0x0 0x1000>,
> +		      <0x0 0xfde41000 0x0 0x1000>,
> +		      <0x0 0xfde43000 0x0 0x1000>;
> +		reg-names =3D "pc", "cna", "core";
> +		interrupts =3D <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks =3D <&cru ACLK_NPU>, <&cru HCLK_NPU>,
> +			 <&scmi_clk SCMI_CLK_NPU>, <&cru PCLK_NPU_PRE>;
> +		clock-names =3D "aclk", "hclk", "npu", "pclk";
> +		assigned-clocks =3D <&scmi_clk SCMI_CLK_NPU>, <&cru CLK_NPU>;
> +		assigned-clock-rates =3D <200000000>, <600000000>;

[Severity: High]
Will this configuration inadvertently overclock the AXI bus?

The commit message states the intent to assign the CRU CLK_NPU so the NPU
AXI bus clock comes up at 200 MHz. However, based on the positional mapping
of assigned-clocks to assigned-clock-rates, this assigns 200 MHz to the SCMI
compute core and 600 MHz to CLK_NPU.

Should the values in assigned-clock-rates be swapped to match the order
in assigned-clocks to prevent bus hangs?

> +		resets =3D <&cru SRST_A_NPU>, <&cru SRST_H_NPU>;
> +		reset-names =3D "srst_a", "srst_h";
> +		power-domains =3D <&power RK3568_PD_NPU>;
> +		rockchip,pmu =3D <&pmu>;
> +		iommus =3D <&rknn_mmu_0>;
> +		status =3D "disabled";
> +	};
> +
> +	rknn_mmu_0: iommu@fde4b000 {
> +		compatible =3D "rockchip,iommu";

[Severity: High]
Does this compatible string correctly identify the v2 IOMMU hardware
present on the RK3568?

Using rockchip,iommu binds to the v1 hardware operations in the Rockchip
IOMMU driver. Because the RK3568 features a v2 IOMMU, configuring it with
v1 driver operations could result in incorrect page table programming and
translation faults when the NPU attempts DMA.

Other IOMMU nodes in rk356x-base.dtsi use rockchip,rk3568-iommu. Should
this node use that compatible string instead?

> +		reg =3D <0x0 0xfde4b000 0x0 0x40>;
> +		interrupts =3D <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
> +		clock-names =3D "aclk", "iface";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260613070116.4389=
06-1-midgy971@gmail.com?part=3D7
