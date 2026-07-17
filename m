Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1663C13F9
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784280631; cv=none; b=kavciccTYQbMAmx+RrsPvxXhm3Z5JjmOT+esbfgpbetIbSpCIVM/w1XT6eVkuqXXRdx7144Tix919vRkchqk1X1Qf8dXBuTaW95djJb0B6pmi2/OcY5g9jEQ8IUD1GG3qXyC5Kb/PeNbQX+4IdGnIaNZfqCYHir/nmtewGBqYO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784280631; c=relaxed/simple;
	bh=yxhru80BERmn+K3+3L7UNHqX4jqEDBDMiOXXOKx0wDU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TYXVXQ2uehQigVr6hbR8UulRsY6WlRSD7SpitXO+tuxxT+Ycy2/f/cugh0FJ+Re4vkStDv+7FM/wC22vDXNbzyBKraPsfFNk8qfkkkWKB5fI4HEWxMegbCoBKSdNPKLAj2PfkkvrNkBVR//ELjcQ2OPFc2ZRYLdW0jsEoWHHD88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aSxLFIzd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aSxLFIzd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA6381F000E9;
	Fri, 17 Jul 2026 09:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784280630;
	bh=DVP9uy58NDlH96curs5ytICz2hkVCLecnKJpkngEyn8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aSxLFIzdW3H/om3yoHvxVl1WZKIe0sS8Ms7VxuDc9Wn39PZInfJgv3mNLNBn7VoJn
	 +7PY5w9e9JEwrb8iZ5iiPckdymjlJECD1UZnC1CGqbLadTu9mHbxgxDZkaRg1Zouh7
	 hsuGkrohL9r5sVpNLDbWuO87MX8HNEbYcBfy2wGeK0OU0KU1rHmb6RVMonorHeSvoy
	 i1A7HcqZz+66TCz8kWSzb/hdXBE4o6qMtcwfb3zD3nxBV/Lay140OOCqgYrDOZ2j/P
	 2X2Wa3cLQEGpKxAKfml/nr5ulG9E4IvtPTAM9s+wk6bVbZyKBy7iNB+vHbeceEP1v6
	 HThe0QepTQGPA==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 8/9] arm64: dts: rockchip: rk3576: add NPU (RKNN)
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260717085220.3212274-9-gahing@gahingwoo.com>
References: <20260717085220.3212274-1-gahing@gahingwoo.com>
 <20260717085220.3212274-9-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 09:30:29 +0000
Message-Id: <20260717093029.AA6381F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing `aclk_cbuf` and `hclk_cbuf` clocks in `rknn_core_1` node.
- [High] Single power-domain definition for NPU cores causes probe failure =
(`-EEXIST`) and violates hardware constraints.
- [High] The physical register address for `rknn_mmu_1` is incorrectly mapp=
ed to `0x2770a000` instead of `0x27712000`.
--

--- Patch [8]: [RFC PATCH 8/9] arm64: dts: rockchip: rk3576: add NPU (RKNN)=
 nodes ---
commit 5396e10743f01d595779ccc7127139fe5f89e996
Author: Jiaxing Hu <gahing@gahingwoo.com>

arm64: dts: rockchip: rk3576: add NPU (RKNN) nodes
   =20
Add the RK3576 NPU: rknn_core_0/1 and rknn_mmu_0/1, with register
addresses, GIC_SPI 247/248 interrupts, clocks, resets and power-domains.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3576.dtsi
> index e12a2a0cfb891..5033f762840ae 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
[ ... ]
> @@ -1804,6 +1812,72 @@ qos_npu_m1ro: qos@27f22100 {
>  			reg =3D <0x0 0x27f22100 0x0 0x20>;
>  		};
> =20
> +		rknn_core_0: npu@27700000 {
> +			compatible =3D "rockchip,rk3576-rknn-core";
> +			reg =3D <0x0 0x27700000 0x0 0x1000>,
> +			      <0x0 0x27701000 0x0 0x1000>,
> +			      <0x0 0x27703000 0x0 0x1000>,
> +			      <0x0 0x27704000 0x0 0x1000>,
> +			      <0x0 0x27705000 0x0 0x1000>;
> +			reg-names =3D "pc", "cna", "core", "dpu", "dpu_rdma";
> +			interrupts =3D <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cru ACLK_RKNN0>, <&cru HCLK_RKNN_ROOT>,
> +				 <&cru CLK_RKNN_DSU0>, <&cru PCLK_NPUTOP_ROOT>,
> +				 <&cru ACLK_RKNN_CBUF>, <&cru HCLK_RKNN_CBUF>;
> +			clock-names =3D "aclk", "hclk", "npu", "pclk",
> +				      "aclk_cbuf", "hclk_cbuf";
> +			resets =3D <&cru SRST_A_RKNN0>;
> +			reset-names =3D "srst_a";
> +			power-domains =3D <&power RK3576_PD_NPU0>;

[Severity: High]
Does listing a single power domain here cause probe to fail?

The rocket_core_init driver expects both RK3576_PD_NPU0 and RK3576_PD_NPU1 =
on
rknn_core_0 to satisfy a hardware constraint where the CBUF->CMAC read path
requires both.

Because the DT only lists one power domain per core, the kernel platform bus
auto-attaches it and sets dev->pm_domain. When the driver then calls
devm_pm_domain_attach_list(), it will return -EEXIST, which the driver trea=
ts
as a fatal error and aborts probe. Missing RK3576_PD_NPU1 on rknn_core_0 al=
so
breaks runtime PM, leading to AXI lockups.

> +			iommus =3D <&rknn_mmu_0>;
> +			status =3D "disabled";
> +		};
> +
[ ... ]
> +		rknn_core_1: npu@27710000 {
> +			compatible =3D "rockchip,rk3576-rknn-core";
> +			reg =3D <0x0 0x27710000 0x0 0x1000>,
> +			      <0x0 0x27711000 0x0 0x1000>,
> +			      <0x0 0x27713000 0x0 0x1000>,
> +			      <0x0 0x27714000 0x0 0x1000>,
> +			      <0x0 0x27715000 0x0 0x1000>;
> +			reg-names =3D "pc", "cna", "core", "dpu", "dpu_rdma";
> +			interrupts =3D <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cru ACLK_RKNN1>, <&cru HCLK_RKNN_ROOT>,
> +				 <&cru CLK_RKNN_DSU0>, <&cru PCLK_NPUTOP_ROOT>;
> +			clock-names =3D "aclk", "hclk", "npu", "pclk";

[Severity: High]
Will the driver fail to probe here due to missing CBUF clocks?

The rocket_core_init function explicitly requests 6 clocks (aclk, hclk, npu,
pclk, aclk_cbuf, hclk_cbuf) using devm_clk_bulk_get(). Since rknn_core_1 on=
ly
defines 4 clocks, the API will fail with -ENOENT, making the second NPU core
unusable.

> +			resets =3D <&cru SRST_A_RKNN1>;
> +			reset-names =3D "srst_a";
> +			power-domains =3D <&power RK3576_PD_NPU1>;
> +			iommus =3D <&rknn_mmu_1>;
> +			status =3D "disabled";
> +		};
> +
> +		rknn_mmu_1: iommu@2770a000 {
> +			compatible =3D "rockchip,rk3576-iommu", "rockchip,rk3568-iommu";
> +			reg =3D <0x0 0x2770a000 0x0 0x100>,
> +			      <0x0 0x2770a100 0x0 0x100>;

[Severity: High]
Is this physical register address mapped correctly?

It looks like the base address is misplaced by 0x8000 relative to where it
belongs inside the rknn_core_1 memory footprint. The rknn_core_1 registers
span 0x27710000-0x27715000, with a 1-page gap at 0x27712000 for the IOMMU
(which is structurally symmetric to rknn_core_0 having its IOMMU at
0x27702000).

When the IOMMU driver attempts to access 0x2770a000 instead of 0x27712000, =
it
will likely cause a Synchronous External Abort or fail to translate memory
for the NPU.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717085220.3212=
274-1-gahing@gahingwoo.com?part=3D8
