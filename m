Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282CA3D3309
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 12:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785413062; cv=none; b=Hh2oRPFnYhKeO2J9WGBeJh3P+PGb65/v3mSv87b4Z5IwzlhC1waFF//TkWMsF7XpMNwJErl4u2E8A1ZBfsaBrp+oTgZAihKocVSux1C/D4Q525QYKDyZYgkjS2y7bTADOIQwLSXk5KNHSrhENdGvWHF+dKDpwULaKPTWy68+GdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785413062; c=relaxed/simple;
	bh=lbYX/DlaJD8119xhJqFj6IsNxVcNf8PMZ6EYD/2V/mM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q7HA71L6qAeIsKrSD+vrYkeKvT1fKLWzGIqsDu7QcaXvK0CEXSlfHHECBbeuib+JDcCir8hPgLPz9htVo8sNARaAn0mG+RNv20rLyCzeteSoj1QEsR2Nul50cTmxVw/B1fzIxOLNK0o1azBInq+/B6uKcMjJ1oLRXKotqJbOrm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BElxvG4P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BElxvG4P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AACEF1F000E9;
	Thu, 30 Jul 2026 12:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785413059;
	bh=/6XcQK9ff7BE7s+KYe+dE2TqsQHAqQ9OQCF5URpmkvI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BElxvG4P1/2DdLf4L7vqaEn2COblVDWBlZnusa1+SQF1nYdMvEJ7IovVdlW1aVZlM
	 oo82buTAU91uOBV+ZoNdp/xaDeMSQPCUk0yVpfioYeqSbi+1MSyMl1Q1zr+cSXHFKi
	 O8XwGdjwBQEV8tnPIhxf/quXuXWNPc1hArH2cWGEqqg/1q7fyopfS/o92mhNSYTg6m
	 fzTkw1YLlBDr+QcrhZ6aIhMbrlnysU8s0o6Jloz2jolpcaPft55y+MDH1DFSDlH8zH
	 1GKS0d5mlkdMlLmrybYnWINoVMzabuIxk10XXr9kgQiW+5STzrqGFarDKz9EsETZin
	 TKihIlPkaYZoA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/22] arm64: dts: qcom: sm8450: Fix the PCIe iommu-map
 entries
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730-iommu-map-fix-v1-9-83405d37ba41@oss.qualcomm.com>
References: <20260730-iommu-map-fix-v1-0-83405d37ba41@oss.qualcomm.com>
 <20260730-iommu-map-fix-v1-9-83405d37ba41@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 12:04:18 +0000
Message-Id: <20260730120418.AACEF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Adding the SID mask cell to the `iommu-map` property breaks the Qu=
alcomm PCIe driver's BDF-to-SID mapping configuration, leading to IOMMU fau=
lts for downstream PCIe endpoints. The driver (`drivers/pci/controller/dwc/=
pcie-qcom.c`) manually parses `iommu-map` using a hardcoded 4-element struc=
ture (`struct { u32 bdf; u32 phandle; u32 smmu_sid; u32 smmu_sid_len; }`) a=
nd a single `of_property_read_u32_array` call. Because the driver assumes e=
ach entry is exactly 16 bytes (4 cells), updating the device tree to pass 5=
 cells per entry (to comply with `#iommu-cells =3D <2>`) misaligns the driv=
er's iteration for any entry after the first. For example, in the second en=
try of `sm8450`, the driver reads the 5th cell of the first entry as the BD=
F, and the phandle of the second entry as the SID, programming the hardware=
 translation table with garbage.

Pre-existing issues:
- [Medium] The `iommu-map` cell-count mismatch bug is still present in seve=
ral other Qualcomm device trees targeting `apps_smmu`, which were missed in=
 this patch series. While patches were provided for platforms like sm8450 a=
nd sc8180x, other files such as `qcs6490-radxa-dragon-q6a.dts`, `qcs6490-rb=
3gen2.dts`, `sm8550.dtsi`, and `sm8750.dtsi` still contain the malformed 4-=
cell `iommu-map` entries targeting the 2-cell provider `&apps_smmu`.
--

--- Patch [9]: [PATCH 09/22] arm64: dts: qcom: sm8450: Fix the PCIe iommu-m=
ap entries ---
commit c8ad1d0139272d52fede75b2bf1bed447374969b
Author: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

arm64: dts: qcom: sm8450: Fix the PCIe iommu-map entries

This commit updates the iommu-map property in the sm8450 device tree to
include the SID mask cell, ensuring it matches the #iommu-cells =3D <2>
property of the apps_smmu IOMMU provider. This resolves warnings generated
by the OF core regarding cell count mismatches.

> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/q=
com/sm8450.dtsi
> index 56cb6e959e4ee..18ab94de4ac9e 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -2023,8 +2023,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  				      "aggre0",
>  				      "aggre1";
> =20
> -			iommu-map =3D <0x0   &apps_smmu 0x1c00 0x1>,
> -				    <0x100 &apps_smmu 0x1c01 0x1>;
> +			iommu-map =3D <0x0   &apps_smmu 0x1c00 0x0 0x1>,
> +				    <0x100 &apps_smmu 0x1c01 0x0 0x1>;

[Severity: High]
Does this change break the Qualcomm PCIe driver's BDF-to-SID mapping?

Looking at the driver in drivers/pci/controller/dwc/pcie-qcom.c,
qcom_pcie_config_sid_1_9_0() parses the iommu-map property by reading it
into an array of a hardcoded 4-element structure:

	struct {
		u32 bdf;
		u32 phandle;
		u32 smmu_sid;
		u32 smmu_sid_len;
	} *map;

Because the driver assumes each entry is exactly 4 cells (16 bytes), updati=
ng
the device tree to pass 5 cells per entry misaligns the driver's iteration =
for
any entry after the first.

For example, when reading the second entry, will the driver read the 5th ce=
ll
of the first entry as the BDF, and the phandle of the second entry as the S=
ID,
programming the hardware translation table with garbage?

[Severity: Medium]
This is a pre-existing issue, but other Qualcomm device trees targeting
apps_smmu seem to still have the malformed 4-cell iommu-map entries that we=
re
missed in this patch.

For instance, in arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts:

	iommu-map =3D <0x0 &apps_smmu 0x1c80 0x1>;

and similarly in qcs6490-rb3gen2.dts. Will these unpatched device trees
continue to trigger the OF core parsing warnings on boot?

> =20
>  			resets =3D <&gcc GCC_PCIE_0_BCR>;
>  			reset-names =3D "pci";

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-iommu-map-=
fix-v1-0-83405d37ba41@oss.qualcomm.com?part=3D9
