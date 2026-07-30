Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5093B3896
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 12:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785413483; cv=none; b=oHZmQerDVfXBfixtufjBmloEeJ/UWcKzrUdpGlwaK1+foKJIr8l8CIfZi1c3675UjcbqYUr+6+I8YL+15tO8dgN+RjvfVBT0j96OBnl5DdQ0vN+5f9KynfY+P5nAz0fXSlyis1jLhjK9kHWQmNAGpWzOPULFbtpgjk9bYRGhjlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785413483; c=relaxed/simple;
	bh=UsQqr3uoQq0t4TVlaZjkGOzyS+DyNat+T+K1C1Loa6U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CHv8w74UTmXTv//o1lbmBOrvdOIZP9yYOYEZvkTfetAJ7yoFk1M6qS7YFeKdFUYib3kltH/bS84y76Xwjh0fMBpdc2E/Qc9idSrNnH0zb3Ce/m82Q/1QczpWsbkzFwuC7xCCV+KzULMic06q6s0ffRkboSmi/n4iSmigY73Hnh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z0oNbWPh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z0oNbWPh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA651F000E9;
	Thu, 30 Jul 2026 12:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785413481;
	bh=bxKwsVoaVKzXqUAOiXQPuCsMyMrgcNCkLlTURv7wLNQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z0oNbWPh3p4Bu6tFje412cjeTtq0rqW86dMCV+rgEuhRaxk+faIPkAdcW2yo/zWBK
	 f+c+luX6IuwBxmlll7DdJdqc73+BCMmcFhHC+75TDfU+trXO+JjvZ1DztYYQEhkRji
	 nlI9GfA3rd6qdihJSdgaCfvI4YXxdT7fGxr4W9il38cDfKj08JD9PJxEI1JtsjMrS8
	 HjOI5uhjo+ooizTzShlz4onaoPieiN7YiLBgdyAFxiu+isxxCPDphq8R68FwpZjWQf
	 D7RcbGv8YZU98nSBXy0bLAe/6eO5vz0YORBc3XuPuYKDzNgTJm3f8wFEJwHfJeRHyq
	 nQ/4D+VFZx1pw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/22] arm64: dts: qcom: sc8180x: Fix the PCIe iommu-map
 entries
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260730-iommu-map-fix-v1-4-83405d37ba41@oss.qualcomm.com>
References: <20260730-iommu-map-fix-v1-0-83405d37ba41@oss.qualcomm.com>
 <20260730-iommu-map-fix-v1-4-83405d37ba41@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 12:11:21 +0000
Message-Id: <20260730121121.6EA651F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Fixing `iommu-map` to use 5 cells breaks rigid 4-cell parsing in t=
he `pcie-qcom.c` driver, corrupting PCIe SID translation.
--

--- Patch [4]: [PATCH 04/22] arm64: dts: qcom: sc8180x: Fix the PCIe iommu-=
map entries ---
commit 2707161425e0efca5af00d7a068414771d8112e9
Author: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

arm64: dts: qcom: sc8180x: Fix the PCIe iommu-map entries

This commit fixes the PCIe iommu-map entries to match the apps_smmu
provider's #iommu-cells =3D <2> property. It adds the missing SID mask cell=
 to
prevent warnings from the OF core about 1-cell entries targeting 2-cell
outputs.

> diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/=
qcom/sc8180x.dtsi
> --- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> @@ -1767,8 +1767,8 @@ pcie0: pcie@1c00000 {
>  			assigned-clocks =3D <&gcc GCC_PCIE_0_AUX_CLK>;
>  			assigned-clock-rates =3D <19200000>;
> =20
> -			iommu-map =3D <0x0   &apps_smmu 0x1d80 0x1>,
> -				    <0x100 &apps_smmu 0x1d81 0x1>;
> +			iommu-map =3D <0x0   &apps_smmu 0x1d80 0x0 0x1>,
> +				    <0x100 &apps_smmu 0x1d81 0x0 0x1>;

[Severity: High]
Does this change break the manual iommu-map parsing in the PCIe driver?

Looking at qcom_pcie_config_sid_1_9_0() in
drivers/pci/controller/dwc/pcie-qcom.c, the driver assumes a rigid 4-cell
length for iommu-map entries:

drivers/pci/controller/dwc/pcie-qcom.c:qcom_pcie_config_sid_1_9_0() {
    ...
	struct {
		u32 bdf;
		u32 phandle;
		u32 smmu_sid;
		u32 smmu_sid_len;
	} *map;
    ...
	of_property_read_u32_array(dev->of_node, "iommu-map", (u32 *)map,
				   size / sizeof(u32));
    ...
}

By increasing the iommu-map property to 5 cells per entry, will this misali=
gn
the array when the driver parses multiple entries?

For the second entry here, map[1].bdf would read the 5th cell of the first
entry (length), map[1].phandle would read the BDF of the second entry, and
map[1].smmu_sid would read the phandle pointer.

Does this corrupt the SID translation and lead to IOMMU faults for downstre=
am
PCIe endpoints?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-iommu-map-=
fix-v1-0-83405d37ba41@oss.qualcomm.com?part=3D4
