Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AA23B3896
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 12:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785413287; cv=none; b=ZpSK2f8omj6u3lOQXF26aJF4vj8uOORo9RMxUUO9luTNR/C8Xw9w6K1NBYooX8j/g7okI4UjC22Lz7s0aSqP4N0ZKnWctBis2Gy5ATjM2I5NELsGGWjIlj8NFitn0yJ05UH4cC2UxVvHmvaUgBSF57H8Ekk4cvsC7PP59xiCr3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785413287; c=relaxed/simple;
	bh=6wOTYvcN9qJirPOxKMIbupz9xGwN5gwK2qV/iG+aJKg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AyFLCa65qQK4CFzVP8mjwgeGaV3P1NwsH3EHPQJwK/uLkn6s7Da/6kEAElqOueN5NjpjSSPzVXAAZ8e0sTZaBsyzjptjqQxfEQbdAsCUK3Gg1g/jijxKoTwD5tSzewah9OYAYDwMe13M1ayCb5gnOHTfmE20Yr25Xq0N6dDnxQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OqxW7SRY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OqxW7SRY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAF6B1F00A3A;
	Thu, 30 Jul 2026 12:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785413286;
	bh=jsgxiSJX7eXQZeXb1n4d0SDu27ZWr1IenJzLyp/hMI4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OqxW7SRYJUKi+dGkmj4NVIEaqnA6tFpUR+JYy4bD1OWvA1/G0bTXf2sfMwAR+3auf
	 Kswbi92PZf7NUnnTRSllnHXZrGOPagpkOb1bEVfL6ywr80PG1ml0nHuEvcNDeMXE3V
	 buzJ/EYLCMB6SBKIW2OULUIWTm2Hx2K2eIMLLiNP+eogtyl7oy/K7PveoWmak6iI31
	 2WE6o4YPK4D0obrlA7LMZyFJBLrdhPetjTi0f0Jd1dWfZoVnGJRGmE1bqBFLm6RfHu
	 tg5igIHkon6+ztsRgB0Sh8qu4nfUWd7mIh2Hdcg0pXAeReuPLkFeCPZcDqKZ0dJ0W/
	 Ztj1vMt5q5UIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/22] arm64: dts: qcom: kodiak: Fix the PCIe iommu-map
 entries
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730-iommu-map-fix-v1-2-83405d37ba41@oss.qualcomm.com>
References: <20260730-iommu-map-fix-v1-0-83405d37ba41@oss.qualcomm.com>
 <20260730-iommu-map-fix-v1-2-83405d37ba41@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 12:08:05 +0000
Message-Id: <20260730120805.DAF6B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Changing the `iommu-map` entries from 4 cells to 5 cells breaks th=
e manual parsing logic in the QCOM PCIe driver, resulting in corrupted BDF-=
to-SID hardware configurations.

Pre-existing issues:
- [Medium] The patch corrects an incorrectly formatted 4-cell `iommu-map` p=
roperty by adding the missing SID mask cell to match the 2-cell `apps_smmu`=
 provider in `kodiak.dtsi`. However, it fails to address the exact same def=
ect present in numerous other Qualcomm SoC device trees and their YAML bind=
ings.
--

--- Patch [2]: [PATCH 02/22] arm64: dts: qcom: kodiak: Fix the PCIe iommu-m=
ap entries ---
commit 3a1ab560afad0b97b3e224b3201d2ab8bc8cd668
Author: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

arm64: dts: qcom: kodiak: Fix the PCIe iommu-map entries
   =20
The IOMMU provider apps_smmu uses '#iommu-cells =3D <2>', but the PCIe
iommu-map entries specify only one cell for the SID, omitting the SID
mask. This went unnoticed until the OF core started warning with commit
ccb2fd725d41. This patch fixes the entries to match the provider's
'#iommu-cells' property.

> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/q=
com/kodiak.dtsi
> index fa540d8c2615d..2eb613dd67165 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -2278,8 +2278,8 @@ pcie0: pcie@1c00000 {
>  				      "aggre0",
>  				      "aggre1";
> =20
> -			iommu-map =3D <0x0   &apps_smmu 0x1c00 0x1>,
> -				    <0x100 &apps_smmu 0x1c01 0x1>;
> +			iommu-map =3D <0x0   &apps_smmu 0x1c00 0x0 0x1>,
> +				    <0x100 &apps_smmu 0x1c01 0x0 0x1>;

[Severity: High]
Will changing this to 5 cells break the manual parsing logic in the QCOM
PCIe driver?

Looking at drivers/pci/controller/dwc/pcie-qcom.c,
qcom_pcie_config_sid_1_9_0() manually casts the raw iommu-map property into
a 4-u32 struct array:

struct {
	u32 bdf;
	u32 phandle;
	u32 smmu_sid;
	u32 smmu_sid_len;
} *map;

If the device tree format is updated to 5 cells, will reading this array
cause out-of-sync reads? For the second entry, map[1].bdf would read the
length cell of the first entry (0x1), and map[1].smmu_sid would read the
phandle of the second entry. This could result in corrupted BDF-to-SID
hardware configurations, causing PCIe devices to use invalid SIDs for DMA.

[Severity: Medium]
This is a pre-existing issue, but does this fix need to be applied to other
Qualcomm SoCs as well?

This patch corrects an incorrectly formatted 4-cell iommu-map property by
adding the missing SID mask cell to match the 2-cell apps_smmu provider in
kodiak.dtsi, but fails to address the exact same defect present in numerous
other Qualcomm SoC device trees.

For example, in arch/arm64/boot/dts/qcom/sm8550.dtsi, pcie0 contains:

iommu-map =3D <0x0   &apps_smmu 0x1400 0x1>,

Other SoCs like sm8650 and sc8180x also seem to omit the SID mask. The OF
core warning will continue to be generated for all other affected Qualcomm
SoCs until they are updated.

(Note that fixing these DTs directly would also break the driver as mention=
ed
above, so the driver must likely be updated first to handle variable-length
cells or use standard OF core parsing before applying these DT changes).

> =20
>  			resets =3D <&gcc GCC_PCIE_0_BCR>;
>  			reset-names =3D "pci";

[ ... ]

> @@ -2424,8 +2424,8 @@ pcie1: pcie@1c08000 {
> =20
>  			dma-coherent;
> =20
> -			iommu-map =3D <0x0 &apps_smmu 0x1c80 0x1>,
> -				    <0x100 &apps_smmu 0x1c81 0x1>;
> +			iommu-map =3D <0x0 &apps_smmu 0x1c80 0x0 0x1>,
> +				    <0x100 &apps_smmu 0x1c81 0x0 0x1>;
> =20
>  			status =3D "disabled";
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-iommu-map-=
fix-v1-0-83405d37ba41@oss.qualcomm.com?part=3D2
