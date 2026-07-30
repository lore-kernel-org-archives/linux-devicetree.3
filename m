Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DD54195B5
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 12:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785414565; cv=none; b=EyTNQ581pwdlnSiQ2ctlZE1SV2/DpyIlJIZX6VA8MMqE79+HvMsFaoEtx1ui4lBMPItf4ytUgLeq4qlQuqaMdFtzye9cekm7mMLSC50+y8a1YZfUv85IBJi4eOnhFyXvP6vvkXOVNjnhsh9I6GyF5C+/wLdZThBDCP261C7PBgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785414565; c=relaxed/simple;
	bh=zVnVD+uTm2J1cADEZclX3BawdLxne7yT7O/HeFAzn2Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EEYsTQoPWHfzU1yVtc1p4G3fG0N+tShKdSQFEGhosrbCc+e2ashia+QyHW/EqqGgoqtmilYfgywpPaR9W1hUTZ3ddTQwZg8GNpGGBLKbmExB6tM/dkpYFCGH4m77yEL8n8zT+24Rf6fYR/C3cNpxhuMB221nrtPiDakQrWaW33o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZVdYpowl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZVdYpowl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F2A21F000E9;
	Thu, 30 Jul 2026 12:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785414562;
	bh=BPQwdGXmJYlmkXd/e4pksGZSTA1//4gtR4JzJv+hOS8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZVdYpowlQU+uR+oC0GfT/jjV+p/G/bH0GbLlB7EGyniKvc1fzGSRtrbPx+7ZP4htK
	 HB+qezriBdfojrMgy+HG3mDTu5BhH6janMwAaKle/oray+PQMJ1mXoiy4Bp8WbJYEX
	 8B9Yqe88vHEngzvDv65gP6S2Oa/Ks0+n77ueTIS7tbeTEZhkJRvoW7BWqbMoNgkUu0
	 Apux3y6O+rP2O83RIJ7ezu6Ik6LFnLz2rOz1y/mKq89tO7+wsrlhmw5yCSijVMo+JT
	 Si6h83sa9wwW1V7rTMzUFlqMnRfzpp3C+jkjGW40ZUanBabyPw3VJjsuUI1H4TfIfd
	 D9LvuFzF6urIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 20/22] arm64: dts: qcom:
 qcs6490-thundercomm-minipc-g1iot: Fix the PCIe iommu-map entries
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260730-iommu-map-fix-v1-20-83405d37ba41@oss.qualcomm.com>
References: <20260730-iommu-map-fix-v1-0-83405d37ba41@oss.qualcomm.com>
 <20260730-iommu-map-fix-v1-20-83405d37ba41@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 12:29:22 +0000
Message-Id: <20260730122922.8F2A21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] The patch series successfully fixes incomplete `iommu-map` prope=
rty entries for `qcs6490-thundercomm-minipc-g1iot.dts` and several other bo=
ards, but completely misses identical 4-cell entries targeting a 2-cell IOM=
MU provider in sibling board and devicetree files. The OF core will continu=
e treating these maps as 1-cell output and emit warnings.
--

--- Patch [20]: [PATCH 20/22] arm64: dts: qcom: qcs6490-thundercomm-minipc-=
g1iot: Fix the PCIe iommu-map entries ---
commit 8f2a940116e71ca780253365df0150f683e455ed
Author: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

arm64: dts: qcom: qcs6490-thundercomm-minipc-g1iot: Fix the PCIe iommu-map =
entries

The IOMMU provider apps_smmu uses '#iommu-cells =3D <2>', but the PCIe
iommu-map entries specify only one cell for the SID, omitting the SID
mask. This went unnoticed until the OF core started warning with commit
ccb2fd725d41 ("of: Respect #{iommu,msi}-cells in maps").

> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dt=
s b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
> --- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
> @@ -711,15 +711,15 @@ &pcie1 {
>  		    <&pcie1_wake_n>;
>  	pinctrl-names =3D "default";
> =20
> -	iommu-map =3D <0x0 &apps_smmu 0x1c80 0x1>,
> -		    <0x100 &apps_smmu 0x1c81 0x1>,
[ ... ]
> +	iommu-map =3D <0x0 &apps_smmu 0x1c80 0x0 0x1>,
> +		    <0x100 &apps_smmu 0x1c81 0x0 0x1>,
> +		    <0x208 &apps_smmu 0x1c84 0x0 0x1>,
> +		    <0x210 &apps_smmu 0x1c85 0x0 0x1>,
> +		    <0x218 &apps_smmu 0x1c86 0x0 0x1>,
> +		    <0x300 &apps_smmu 0x1c87 0x0 0x1>,
> +		    <0x400 &apps_smmu 0x1c88 0x0 0x1>,
> +		    <0x500 &apps_smmu 0x1c89 0x0 0x1>,
> +		    <0x501 &apps_smmu 0x1c90 0x0 0x1>;

[Severity: Medium]
This is a pre-existing issue, but since you are fixing the missing SID mask
for this board, should the identical malformed entries in other sibling boa=
rds
and devicetree files also be updated?

For example, in arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts for pcie1:

	iommu-map =3D <0x0 &apps_smmu 0x1c80 0x1>,
		    <0x100 &apps_smmu 0x1c81 0x1>,

In arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso for p=
cie0
and pcie1:

	iommu-map =3D <0x0 &apps_smmu 0x1c00 0x1>,
		    <0x100 &apps_smmu 0x1c01 0x1>,

And in arch/arm/boot/dts/qcom/qcom-sdx55.dtsi for pcie_rc:

			iommu-map =3D <0x0   &apps_smmu 0x0200 0x1>,
				    <0x100 &apps_smmu 0x0201 0x1>,

Leaving these unfixed will continue to trigger the OF core warning about
1-cell entries targeting 2-cell #iommu-cells. Would it make sense to
include fixes for these files as well?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-iommu-map-=
fix-v1-0-83405d37ba41@oss.qualcomm.com?part=3D20
