Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC3041F7D7
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 12:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785413555; cv=none; b=EhHIWyRiIOD5eb8u4texiEQOztal2duibm8dyCu1wwBlFpbhzbjZWMo33DueiEXKb7TClMNsu+dvwXYVNTDm258Gcc0tdR8nITDU4qbkZnn9X/5DFAvstV3IFnJJzae8xj9qk6DTW2YGhNW0+TlPYpG+g2ujm+3em4ShxJIjd6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785413555; c=relaxed/simple;
	bh=iOYB91hne6uKWD0qwuQgeWJCmE7ytPgfhumBCtUliUg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tFu7cGe4ToCFd5xvJfzXsSCLbNtU4FCa/O4YxjDRnkj5mxgMsCYqyxEnaE4M6DSFFU9zC4cwNmMRNOSMQqN9B7vtwp5GxgYQ+Q33ikbXuH+q8eLV1qS3wHPy7u7zPfAw53+ecIc7S1dVEH7G64sIR9V48UWbUb74lRgxjk11hjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N6mgSn5v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6mgSn5v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E3E1F000E9;
	Thu, 30 Jul 2026 12:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785413554;
	bh=LFj7CDvmdgR8LTOfKVbXb2b9JBYBuU5KbXklt7FN6lA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N6mgSn5vs46CNEPe+4QM07XM4r8S+j4TYmfgTjxJazpoyHzi93+qgO2+Cz0P3SEqi
	 kCYvUnNQ5J/HR+bNYplAt+Kg7sda4FthSpvfxDo7QcHG9aeNuCZOYF9V1Js7TwVc72
	 Uh521+u0INwPHIVaruaJWDGHXh9xt3iASuJBmrOVgioU5cqybPy5H5+pgFAZoUwbDn
	 fqDzsyOyPwwTcLIs2vF5rIKgZLPjV2B8OVBVUOWekh8eaJKN9twYc+xQ90z+lqaShW
	 wbWrlMeZ949MDfUwnzguKMYiUil3JBha5Dk+VjvpngPnfr4Vm+9p31rX3gld6T/Knr
	 1z0OWRSfa8BzQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 21/22] arm64: dts: qcom: qcs6490-rb3gen2: Fix the PCIe
 iommu-map entries
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730-iommu-map-fix-v1-21-83405d37ba41@oss.qualcomm.com>
References: <20260730-iommu-map-fix-v1-0-83405d37ba41@oss.qualcomm.com>
 <20260730-iommu-map-fix-v1-21-83405d37ba41@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 12:12:33 +0000
Message-Id: <20260730121234.44E3E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] The fix for malformed `iommu-map` entries is incomplete because =
it misses the `qcs6490-rb3gen2-industrial-mezzanine.dtso` overlay, which co=
ntains identically malformed entries.
--

--- Patch [21]: [PATCH 21/22] arm64: dts: qcom: qcs6490-rb3gen2: Fix the PC=
Ie iommu-map entries ---
commit b18d2572691fe332011993576c307feac443dbbf
Author: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

arm64: dts: qcom: qcs6490-rb3gen2: Fix the PCIe iommu-map entries

This commit fixes malformed iommu-map entries for PCIe nodes in the
qcs6490-rb3gen2 device tree by adding the missing SID mask cell to match
the apps_smmu provider's 2-cell requirement.

> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/bo=
ot/dts/qcom/qcs6490-rb3gen2.dts
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts

[ ... ]

> @@ -846,15 +846,15 @@ &pcie1 {
>  	pinctrl-0 =3D <&pcie1_reset_n>, <&pcie1_wake_n>, <&pcie1_clkreq_n>;
>  	pinctrl-names =3D "default";
> =20
> -	iommu-map =3D <0x0 &apps_smmu 0x1c80 0x1>,
> -		    <0x100 &apps_smmu 0x1c81 0x1>,

[ ... ]

> +	iommu-map =3D <0x0 &apps_smmu 0x1c80 0x0 0x1>,
> +		    <0x100 &apps_smmu 0x1c81 0x0 0x1>,

[Severity: Medium]
This is a pre-existing issue, but does this fix also need to be applied to
the qcs6490-rb3gen2-industrial-mezzanine.dtso overlay?

Looking at the mezzanine overlay file, it appears to contain identically
malformed iommu-map entries missing the 0x0 mask cell for both &pcie0
and &pcie1:

arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso:&pcie0 {
	...
	iommu-map =3D <0x0 &apps_smmu 0x1c00 0x1>,
	...
}

arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso:&pcie1 {
	...
	iommu-map =3D <0x0 &apps_smmu 0x1c80 0x1>,
	...
}

Will the OF core still warn and potentially misparse these entries when
booting a device with the industrial mezzanine overlay applied?

> +		    <0x208 &apps_smmu 0x1c84 0x0 0x1>,

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-iommu-map-=
fix-v1-0-83405d37ba41@oss.qualcomm.com?part=3D21
