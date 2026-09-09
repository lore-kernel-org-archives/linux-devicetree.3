Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B461638B7DC
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 06:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788935068; cv=none; b=VtAsGcTFEkb3+AuYP6jl/xCqDF9rMsZ596FJ+8CGSG+gwcaSjueXWOxDrQd9Y1Tosm3XohI6qelil2cB8GUlCO2oBy0FLFFW60/cuoRNwp3U1N6EVrqozcLlc1Ntv094WEslWGYdZDCqtfIWyxqnvt/vl8KmRVX5KQs0iZKQPHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788935068; c=relaxed/simple;
	bh=cno/8cdYsnw72YTHjrwHC8ZIEWftLmAV/J2jv2hTwsI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dPz9HFLQfQ3mNMYOrOX6v8lFoNLjNAcJrU5CuXbMoqGiatyAfRaHe3MaNfBStxn7mMjUd3B05C/lhaLIviLKbw/vEE13OkPNK50/UDOz2EueqaRv8bo6cas/EsB7DAhDi6m9kiHGKK6C3KxjHkUjUlUqwAbdWAltJeINI7ZkTOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aurJeHYL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aurJeHYL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 580E01F00A3E;
	Wed,  9 Sep 2026 06:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788935066;
	bh=kll0CqQw/Meh86PopHF7U9sWYciMW3mfobixxQuhGkk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aurJeHYLbKlT18oZSqzTJ2iKh34M6/kintvASEGH8N+cK/TuOlU8PL/kEYQxRnlZo
	 /IR1A4r6193ZKHqVvXh0y9eTaJ3wfeGq/qgK3InxL7PuzKoEJAcDIvT2QqnrDgQQXp
	 TNJsoy807C2BaJWL9RB+GmhSBnX6mk4r8jHqu3VKfpeJn2keUqDw9yKwa84hvLIv8Y
	 dVd9ySHxJFP1sW9eZ3yEFMP6bvs0fyNNOijZ9d49IBW8p6XJcbGN8c7+XlJ01JbppQ
	 JBD74pjnZQUS7OGY7EacY8aSNoPmuW6Ajc8xukLiY0lwGdC29FeyIceWkncqkJpBrk
	 y56S6ARrek3RQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH PRELIMINARY 2/5] arm64: dts: qcom: shikra: add ethernet
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohd Ayaan Anwar" <mohd.anwar@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260908-shikra_ethernet_dts-v1-2-69c0c5c7c124@oss.qualcomm.com>
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
 <20260908-shikra_ethernet_dts-v1-2-69c0c5c7c124@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 06:24:26 +0000
Message-Id: <20260909062426.580E01F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The 'qcom,shikra-ethqos' compatible string is undocumented in DT b=
indings, lacks a generic fallback, and has no driver support, rendering the=
 nodes dead code.
- [Medium] The ethernet nodes define 6 clocks including 'axi-noc' and 'pcie=
-tile-axi-noc', violating the 4-clock limit in bindings and introducing a c=
opy-paste error.
- [Low] Incorrect interconnect tag macro `QCOM_ICC_TAG_ALWAYS` used for RPM=
-based interconnects.
--

commit ab9a1a40b65e83ff44f2ceb6b0d365afac0a9e34
Author: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

arm64: dts: qcom: shikra: add ethernet nodes

Add the two Gigabit Ethernet controllers present on Shikra (ethernet0
at 0x5d00000, ethernet1 at 0x5d20000). Both nodes are left disabled;
board files supply the PHY details.

> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/q=
com/shikra.dtsi
> index c1f06f692f664..a55e20be83fe2 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi

[ ... ]

> @@ -1977,6 +2027,222 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
>  			};
>  		};
> =20
> +		ethernet0: ethernet@5d00000 {
> +			compatible =3D "qcom,shikra-ethqos";

[Severity: High]
Does this compatible string exist in the dt-bindings and does it have driver
support?

Without a standard fallback string like "qcom,sc8280xp-ethqos" and no driver
support in dwmac-qcom-ethqos.c, won't these nodes fail to probe and remain
completely uninitialized when board files try to enable them?

> +			reg =3D <0x0 0x05d00000 0x0 0x10000>,
> +			      <0x0 0x05d16000 0x0 0x100>;
> +			reg-names =3D "stmmaceth", "rgmii";
> +
> +			interrupts =3D <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH 0>;
> +			interrupt-names =3D "macirq";
> +
> +			clocks =3D <&gcc GCC_EMAC0_AXI_CLK>,
> +				 <&gcc GCC_EMAC0_AHB_CLK>,
> +				 <&gcc GCC_EMAC0_PTP_CLK>,
> +				 <&gcc GCC_EMAC0_RGMII_CLK>,
> +				 <&gcc GCC_EMAC0_AXI_SYS_NOC_CLK>,
> +				 <&gcc GCC_PCIE_TILE_AXI_SYS_NOC_CLK>;
> +			clock-names =3D "stmmaceth", "pclk", "ptp_ref", "rgmii",
> +				      "axi-noc", "pcie-tile-axi-noc";

[Severity: Medium]
Does the qcom,ethqos.yaml binding allow 6 clocks?

The binding strictly limits the clocks array to 4 items. Additionally, does=
 it
make sense to assign a PCIe clock to the Ethernet MAC? NOC clock scaling is
usually handled by the interconnect framework via the interconnects propert=
y,
so this might be a copy-paste error that breaks static validation.

> +
> +			power-domains =3D <&gcc GCC_EMAC0_GDSC>;
> +			resets =3D <&gcc GCC_EMAC0_BCR>;
> +			iommus =3D <&apps_smmu 0x0380 0x0007>;
> +
> +			interconnects =3D <&mem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
> +					 &config_noc SLAVE_EMAC0_CFG QCOM_ICC_TAG_ALWAYS>,

[Severity: Low]
Is QCOM_ICC_TAG_ALWAYS the correct tag macro here?

The Shikra SoC uses an RPM-based interconnect provider, which expects tags
from <dt-bindings/interconnect/qcom,rpm-icc.h> such as RPM_ALWAYS_TAG.
QCOM_ICC_TAG_ALWAYS is an RPMh macro defined in
<dt-bindings/interconnect/qcom,icc.h>.

[ ... ]

> +		ethernet1: ethernet@5d20000 {
> +			compatible =3D "qcom,shikra-ethqos";

[Severity: High]
Does this compatible string exist in the dt-bindings and does it have driver
support?

Without a standard fallback string like "qcom,sc8280xp-ethqos" and no driver
support in dwmac-qcom-ethqos.c, won't these nodes fail to probe and remain
completely uninitialized when board files try to enable them?

> +			reg =3D <0x0 0x05d20000 0x0 0x10000>,
> +			      <0x0 0x05d36000 0x0 0x100>;
> +			reg-names =3D "stmmaceth", "rgmii";
> +
> +			interrupts =3D <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH 0>;
> +			interrupt-names =3D "macirq";
> +
> +			clocks =3D <&gcc GCC_EMAC1_AXI_CLK>,
> +				 <&gcc GCC_EMAC1_AHB_CLK>,
> +				 <&gcc GCC_EMAC1_PTP_CLK>,
> +				 <&gcc GCC_EMAC1_RGMII_CLK>,
> +				 <&gcc GCC_EMAC1_AXI_SYS_NOC_CLK>,
> +				 <&gcc GCC_PCIE_TILE_AXI_SYS_NOC_CLK>;
> +			clock-names =3D "stmmaceth", "pclk", "ptp_ref", "rgmii",
> +				      "axi-noc", "pcie-tile-axi-noc";

[Severity: Medium]
Does the qcom,ethqos.yaml binding allow 6 clocks?

The binding strictly limits the clocks array to 4 items. Additionally, does=
 it
make sense to assign a PCIe clock to the Ethernet MAC? NOC clock scaling is
usually handled by the interconnect framework via the interconnects propert=
y,
so this might be a copy-paste error that breaks static validation.

> +
> +			power-domains =3D <&gcc GCC_EMAC1_GDSC>;
> +			resets =3D <&gcc GCC_EMAC1_BCR>;
> +			iommus =3D <&apps_smmu 0x03a0 0x0007>;
> +
> +			interconnects =3D <&mem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ALWAYS
> +					 &config_noc SLAVE_EMAC1_CFG QCOM_ICC_TAG_ALWAYS>,

[Severity: Low]
Is QCOM_ICC_TAG_ALWAYS the correct tag macro here?

The Shikra SoC uses an RPM-based interconnect provider, which expects tags
from <dt-bindings/interconnect/qcom,rpm-icc.h> such as RPM_ALWAYS_TAG.
QCOM_ICC_TAG_ALWAYS is an RPMh macro defined in
<dt-bindings/interconnect/qcom,icc.h>.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-shikra_eth=
ernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com?part=3D2
