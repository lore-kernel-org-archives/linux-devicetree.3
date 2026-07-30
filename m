Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46064396B70
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 12:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785413385; cv=none; b=mBNZd73KboDYWneuYR2SGn9Y4/zFnge8aUoRefocUo/9mewoVdpFlBF0DvGxNAmTdze2v9tOC/38TTw1qN68eYvhA8Um72k9KGBTDzw48FJQjA+ta0xrX6+XY2fWocy8MF0RxMKfzxlq7llOY6QiFivaZIhvyYwsUAYs6SDzQYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785413385; c=relaxed/simple;
	bh=eVRgHnmKftURE9x91CWCqOJ/tjbC1Zx7Hr9fi6GMDTA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OlVBQQmUXrt8FCOOe9gW0G4o/Ke7GSuzBatetVRehbpQSQF18Es5jNY2zeUSwXdyhTZuN7vUym2fx8/K+2bGi9ouenfTG+2eOPwAfvLnM9C3zzNZKS2VOpK7S2lvwKKese+0i6vAcI7jTUqYzGmz5u4y9NwyZQaIKlqbbyCqt0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FQHkznj7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FQHkznj7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23CA01F000E9;
	Thu, 30 Jul 2026 12:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785413383;
	bh=rqxxP3IyF50ksx0KhWuPrIzfGMDQtlwWtWiIXLUi4SA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FQHkznj7zAChUynK9SBWFGtQ6jrVIcauRjFe6ShKU4RSLHogtvCWvM52qYtxc+Rt8
	 Y/dOfeoNGvz3+iWQ4z1ARRwqhjtD4vByTqoNpzORs7OizQfGd/QlGIpINUzySNChNV
	 obtEh4bJBae4o6UwICKSuxoai/uYWYhzhQGzNdR/SUIq32keyO3OsisFAV2Cir0hAs
	 8X3ryrA+FZC2qm/4nmFSIb4/mvg1fc6T9S8O2SrkofWCoaaqPsqc+gpr7s3kopeV5o
	 1E7GbHy6BAYt+J5UfGspr7tphcI1epmqvoG+JBqiI8cZTP/IFiOtUGKMOt8on+7l/r
	 HZ7YmPVFA6OVA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 17/22] arm64: dts: qcom: monaco-evk-ifp-mezzanine: Fix
 the PCIe iommu-map entries
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730-iommu-map-fix-v1-17-83405d37ba41@oss.qualcomm.com>
References: <20260730-iommu-map-fix-v1-0-83405d37ba41@oss.qualcomm.com>
 <20260730-iommu-map-fix-v1-17-83405d37ba41@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 12:09:42 +0000
Message-Id: <20260730120943.23CA01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] The fix for 4-cell `iommu-map` entries is incomplete across the =
tree. Identical incorrect entries targeting IOMMUs with `#iommu-cells =3D <=
2>` remain in other related device trees (e.g., `lemans-evk-ifp-mezzanine.d=
tso` and `qcs6490-*.dts`).
--

--- Patch [17]: [PATCH 17/22] arm64: dts: qcom: monaco-evk-ifp-mezzanine: F=
ix the PCIe iommu-map entries ---
commit 24efdfda849da979474e77045094935d85b3ae7b
Author: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

arm64: dts: qcom: monaco-evk-ifp-mezzanine: Fix the PCIe iommu-map entries

This commit fixes the iommu-map entries for the pcie0 node in the
monaco-evk-ifp-mezzanine device tree. It adds the missing SID mask cell to
each entry to match the 2-cell requirement of the pcie_smmu provider,
resolving a warning from the OF core during boot.

> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso b/arc=
h/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
> index e6beb4393430b..a6e57ec8a1e14 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
> @@ -50,15 +50,15 @@ nvmem-layout {
>  };
> =20
>  &pcie0 {
> -	iommu-map =3D <0x0   &pcie_smmu 0x0 0x1>,
> -		    <0x100 &pcie_smmu 0x1 0x1>,

[Severity: Medium]
This is a pre-existing issue, but this fix appears to be incomplete across
the tree.

Identical 4-cell iommu-map entries targeting 2-cell #iommu-cells providers
remain in other related device trees, such as:

arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso in pcie0:
    iommu-map =3D <0x0 &pcie_smmu 0x0 0x1>,

arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts in pcie1:
    iommu-map =3D <0x0 &apps_smmu 0x1c80 0x1>,

arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts in pcie1:
    iommu-map =3D <0x0 &apps_smmu 0x1c80 0x1>,

These will likely trigger the same OF core warning mentioned in the commit
message. Should these other files be updated in this patch or a follow-up
series?

> -		    <0x208 &pcie_smmu 0x2 0x1>,
> -		    <0x210 &pcie_smmu 0x3 0x1>,
> -		    <0x218 &pcie_smmu 0x4 0x1>,
> -		    <0x300 &pcie_smmu 0x5 0x1>,
> -		    <0x400 &pcie_smmu 0x6 0x1>,
> -		    <0x500 &pcie_smmu 0x7 0x1>,
> -		    <0x501 &pcie_smmu 0x8 0x1>;
> +	iommu-map =3D <0x0   &pcie_smmu 0x0 0x0 0x1>,
> +		    <0x100 &pcie_smmu 0x1 0x0 0x1>,
> +		    <0x208 &pcie_smmu 0x2 0x0 0x1>,
> +		    <0x210 &pcie_smmu 0x3 0x0 0x1>,
> +		    <0x218 &pcie_smmu 0x4 0x0 0x1>,
> +		    <0x300 &pcie_smmu 0x5 0x0 0x1>,
> +		    <0x400 &pcie_smmu 0x6 0x0 0x1>,
> +		    <0x500 &pcie_smmu 0x7 0x0 0x1>,
> +		    <0x501 &pcie_smmu 0x8 0x0 0x1>;
>  };
> =20
>  &pcieport0 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-iommu-map-=
fix-v1-0-83405d37ba41@oss.qualcomm.com?part=3D17
