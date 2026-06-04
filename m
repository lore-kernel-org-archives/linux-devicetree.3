Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC84259C80
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 14:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780582305; cv=none; b=O2DHfiCNCLd1G9s7NwhRs9irZ00dmBhv2p+Nr7yBergZMwWxQUmnc7PX29IFmnAOSziy8pXmdF1jcRZYNKTJ46cI6dULS3oQBLEQH1ZpiKvQmB0tqgHFeZNMmbHYEsFUPt/nibik/T37++lV83YFabuf/F9bnUrHj8YF8A3GLeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780582305; c=relaxed/simple;
	bh=RGn7HbrFyAt47FBYl5ZGQfywJ4vY002qYKf3eSFothc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K+O90jU4eTsnEXDrR0M1xgVFU7cs75sgY6h9IXulukVCYYWP5V2GskHXeGmBmlZhWZZa7AsR2BAClN587KBaXjGiHjcL6K6oq+wn7AkwHFzgILHJRGTMcSeApDrYOkMi2FXnCe9+kn5vp2DFqTG+j33ApuwCLvyjqyB8S84c+LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QOV+uKdU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QOV+uKdU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B1E81F00893;
	Thu,  4 Jun 2026 14:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780582302;
	bh=MH5p5UiRGIxma5jv4p3iiLlreHzJsU1eQo5K+b7v1QA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QOV+uKdUZO2+uB77cd6Dbj+5LJDwYmxGF1aOY8WnsOxw3NqBEMS11ys0lUTDsEaaF
	 amwB82L94bLw6d3hlx+7hnDEwv5sebJGTJJBpS8SUSP2xQv3Dzw0Z3Fm6MW44AVOoS
	 AxKR32yQe9WGh6SGb0Z4Mb2Vg0TrVV/JE7fLXse+ypnD0NuTwxFbNCbaZRCLQOEGRO
	 R1u9Nrd4BUTZIlnbUvpfIo99RCOW5Ei9QWUIAe9Z0V/qKbumeaDCU6Jow9oFP9BlqO
	 9HQpXzcXryHJFt+WV8XPrG+SJVkiWxNv+3Pfs6QKWjMObQQ0PMZtDWN8OMTD04v/Mu
	 qbAOX/879e1sg==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v3 8/9] arm64: dts: rockchip: rk356x: Add the NPU
 and its IOMMU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Midgy BALON" <midgy971@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260604135255.62682-9-midgy971@gmail.com>
References: <20260604135255.62682-9-midgy971@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 14:11:42 +0000
Message-Id: <20260604141142.7B1E81F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The NPU node simultaneously defines `power-domains` and `rockchip,=
pmu`, causing the generic power domain framework and the NPU driver to conc=
urrently manipulate the same PMU power and idle registers.
- [Low] Device tree nodes `npu@fde40000` and `iommu@fde4b000` are not sorte=
d by unit address.

Pre-existing issues:
- [Critical] The driver calls `devm_clk_bulk_get` without initializing the =
`.id` fields of the clock bulk data array, causing all clock requests to in=
correctly default to the first clock in the device tree node.
--

commit dff3ba648a490ef1a1c6644d672ca0b9e1d68360
Author: Midgy BALON <midgy971@gmail.com>

arm64: dts: rockchip: rk356x: Add the NPU and its IOMMU

This commit adds the NPU and its associated IOMMU device tree nodes to the=
=20
RK3568 base devicetree. It also configures the necessary clocks, resets, and
power domain for the NPU.

> diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk356x-base.dtsi
> index 64bdd8b7754b5..50ce5a5e4fc24 100644
> --- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi

[ ... ]

> @@ -948,6 +955,37 @@ qos_rga_wr: qos@fe158300 {
>  		reg =3D <0x0 0xfe158300 0x0 0x20>;
>  	};
> =20
> +	rknn_core_0: npu@fde40000 {
[Severity: Low]
This isn't a bug, but should the npu@fde40000 and iommu@fde4b000 nodes be
ordered alphanumerically by unit address? They appear to be inserted after
qos@fe158300 rather than being placed right before gpu@fde60000.

> +		compatible =3D "rockchip,rk3568-rknn-core";
> +		reg =3D <0x0 0xfde40000 0x0 0x1000>,
> +		      <0x0 0xfde41000 0x0 0x1000>,
> +		      <0x0 0xfde43000 0x0 0x1000>;
> +		reg-names =3D "pc", "cna", "core";
> +		interrupts =3D <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks =3D <&cru ACLK_NPU>, <&cru HCLK_NPU>,
> +			 <&scmi_clk SCMI_CLK_NPU>, <&cru PCLK_NPU_PRE>;
[Severity: Critical]
This is a pre-existing issue, but enabling this node exposes a bug where
devm_clk_bulk_get() is called without initializing the .id fields in
rocket_core_init().

Since the connection ID is NULL, does clk_get() implicitly fall back to
of_clk_get(np, 0) for each loop iteration, mapping all four clock array
entries to ACLK_NPU?

Later, when rk3568_noc_init() dynamically scales the SCMI clock rate to
1 GHz:

    clk_set_rate(core->clks[ROCKET_RK3568_SCMI_CLK].clk, 1000000000UL);

Does this mistakenly configure the rate of ACLK_NPU instead, which could
overclock the AXI bus and lead to immediate hardware instability?

> +		clock-names =3D "aclk", "hclk", "npu", "pclk";
> +		assigned-clocks =3D <&scmi_clk SCMI_CLK_NPU>;
> +		assigned-clock-rates =3D <200000000>;
> +		resets =3D <&cru SRST_A_NPU>, <&cru SRST_H_NPU>;
> +		reset-names =3D "srst_a", "srst_h";
> +		power-domains =3D <&power RK3568_PD_NPU>;
> +		rockchip,pmu =3D <&pmu>;
[Severity: High]
Could setting both power-domains and rockchip,pmu cause a race condition
with TF-A and corrupt hardware state?

The generic power domain framework inherently manages power gating and NoC
bus idle requests for this domain, and explicitly protects these PMU
transitions with pmu->mutex.

Concurrently, the rocket driver's rk3568_noc_init() issues direct, un-polled
regmap_write() operations to the exact same PMU offsets:

    regmap_write(pmu, 0xa0, BIT(1 + 16));
    ...
    regmap_write(pmu, 0x50, BIT(2 + 16));

Does bypassing GenPD's tracked state machine and the pmu->mutex lock create
a layering violation here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604135255.6268=
2-1-midgy971@gmail.com?part=3D8
