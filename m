Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6324141F370
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 12:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785413251; cv=none; b=fJcDOTFVW0X11m/YEt3O2BtWFQYRC0YGfHkm5nfVNpXGXMJguFjV2JxHZg95yfOKUdZjXMrx0DoJKE1Ff5NR9Bp260MY4JK75neCOl0F+732YNX09jqKjKhFkq6o2LE7tKrv/Mp/uBuRstKriGgsQngOVumSzqI+szSOhA86sR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785413251; c=relaxed/simple;
	bh=4c6K0Axrr63mbb/Kj9aegxtnXsqjeU47iuXayFcRuEc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AIjBppMZBrgZFTF1/UVIZiOxtdCBipbwxIitgCHlWSk2hsZzCDfNfDg5kpFuvPRXoc2D79cXq9cOMqGJ6yX2EDzAMte05diLF73OmcTNkuicsSSQrlEAeX7fy0DtaoJAaw25r6sAVLkzfok/h5Os0gc7kM3hfeRNhGmh1AMg/ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kO1RYmSf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kO1RYmSf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 894DE1F000E9;
	Thu, 30 Jul 2026 12:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785413250;
	bh=otYAXF05yNIwj7CK83US0QyOGaUi899SyYJNSmAuIcA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kO1RYmSfQZYHZknF5AJlUvNjIrOO7zgmjB2BZqgU9IpHhuBOk3xqkiD11h+orXSsR
	 RKZTh8wW8FGtzmnOpSiv83rdROQ5/F3JmHuBHhERZ3rh5oH39+2xkPbJ0D42BYLPFy
	 mTszmVVQHpjHGOo+2Fw0j2q1Ry/9ASceOzucMpLA6/bEQa7voscY7XTEFkFZNWS2lS
	 SCyt9d9UftIhldoalreHuXRPhrwgpIo0KKexAeEz5/f1KYVT4hFfFWfucgQr1hloIA
	 thqWo8WHIoqh0jyKIQ1tQSfgPZ5o0qcyfIYqN62JpPPfOX0QMNeOdjNKYTBX/MhaV+
	 q47fjREJR/Ilw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 13/22] arm64: dts: qcom: talos: Fix the PCIe iommu-map
 entries
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260730-iommu-map-fix-v1-13-83405d37ba41@oss.qualcomm.com>
References: <20260730-iommu-map-fix-v1-0-83405d37ba41@oss.qualcomm.com>
 <20260730-iommu-map-fix-v1-13-83405d37ba41@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 12:07:29 +0000
Message-Id: <20260730120729.894DE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Adding the SID mask to `iommu-map` changes the entry size to 5 cel=
ls, which misaligns with the PCIe driver's hardcoded 4-cell parsing struct,=
 causing incorrect hardware configuration.
--

--- Patch [13]: [PATCH 13/22] arm64: dts: qcom: talos: Fix the PCIe iommu-m=
ap entries ---
commit 398a25f1ebfa492fb313949f16b10fc5fb1ad185
Author: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

arm64: dts: qcom: talos: Fix the PCIe iommu-map entries

This commit modifies the PCIe iommu-map entries to add an extra cell (the
SID mask) to match the apps_smmu provider's #iommu-cells property. This
addresses an OF core warning about 1-cell entries targeting 2-cell outputs.

> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qc=
om/talos.dtsi
> index fb1bbc51bb8a4..76b1e86b57b07 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -1349,8 +1349,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  					 &config_noc SLAVE_PCIE_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
>  			interconnect-names =3D "pcie-mem", "cpu-pcie";
> =20
> -			iommu-map =3D <0x0 &apps_smmu 0x400 0x1>,
> -				    <0x100 &apps_smmu 0x401 0x1>;
> +			iommu-map =3D <0x0 &apps_smmu 0x400 0x0 0x1>,
> +				    <0x100 &apps_smmu 0x401 0x0 0x1>;

[Severity: High]
Does adding the SID mask cause a regression in the PCIe controller driver's
parsing of this property?

Looking at drivers/pci/controller/dwc/pcie-qcom.c:qcom_pcie_config_sid_1_9_=
0(),
the driver appears to expect each iommu-map entry to be exactly 4 u32 cells:

	struct {
		u32 bdf;
		u32 phandle;
		u32 smmu_sid;
		u32 smmu_sid_len;
	} *map;

When it reads the property into this array via of_property_read_u32_array(),
the new 5-cell entries will cause the parsing to misalign.

For the second entry (BDF 0x100), the driver will read the previous entry's
length (0x1) as the BDF, the rid-base (0x100) as the phandle, and the phand=
le
as the smmu_sid. Could this result in corrupted hardware programming for do=
wnstream
PCIe devices?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-iommu-map-=
fix-v1-0-83405d37ba41@oss.qualcomm.com?part=3D13
