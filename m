Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508DD42A79B
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 12:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785414318; cv=none; b=qcSaCm87/eBzhWyXB8iVPR/UmS9Cn4KYFtadqGr8S9JW3PQGv7epqpBpIYcQ8SG5Liuziv5RovVB/cuqk4sthcjWXEsRF+rsTtAWuCVybOATVWbr/D5L7t4rEIRAAFps7AF/spN/jCtzyrl6YjWm+X9ej4Hh0n51ANvlS7FxI2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785414318; c=relaxed/simple;
	bh=IjI+3/Y6WTLyzE92kTT1YQnJcPqrcJvatvkGO+NMM1o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PSBZs1BHocqCWqnJvZyqKvBWRqiDENowDDPNDg3eGAzu2caMUxHSc7k7uSgiQdFTpN/Via3w06wl2kAONtvJcJQHDnfQOgsJbOgSjh0us4dwvhpZV7UnpFBW4AcC4ijjcOcKmIJ6b1GzITFb5bm7wXW/57GkEE7s4Hljqj/GH50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h9TmmAr/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h9TmmAr/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB6641F00A3A;
	Thu, 30 Jul 2026 12:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785414317;
	bh=pdM4LcpNR0jZfkpAFHDAREcS1+qfYrl4I1ObZjMGXTQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h9TmmAr/ozIX6t532MVJE0YKRswk2YaRossEp01giZNZ85Iw9gixcBKU2DLuwJkty
	 hfm7NGTbRF8AFHsBJ/eYV3/6jnahylXXr0MIqpviaPlSBdNv9JPMEV52JadC75koiN
	 Dj0K0dSGiEvMsxmf7Lir7v0DxIca5imNZOuYrdc4f46/zBQfs9VsxmFa7y2iXQaS99
	 GnDES6mSi1nXE8YaqxQfsmY8FYGLUoljM9uA+YJczVmb+Y8EXsRU7SA8Bwk6/QWoxR
	 yMEHEJCUWmn7eJsEA0JAWzhODszfZqaoA++5DasUZWn8/WqJ/PR9tHerjLRey+Byk5
	 EHGysozB9dKCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 15/22] arm64: dts: qcom: monaco: Fix the PCIe iommu-map
 entries
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730-iommu-map-fix-v1-15-83405d37ba41@oss.qualcomm.com>
References: <20260730-iommu-map-fix-v1-0-83405d37ba41@oss.qualcomm.com>
 <20260730-iommu-map-fix-v1-15-83405d37ba41@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 12:25:16 +0000
Message-Id: <20260730122516.BB6641F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] Incomplete fix for malformed `iommu-map` entries. The patch seri=
es fixes base DTSI files (e.g., `monaco.dtsi`, `lemans.dtsi`) to provide 5-=
cell `iommu-map` entries when targeting an IOMMU with `#iommu-cells =3D <2>=
`. However, it misses board and overlay files that explicitly override `iom=
mu-map` with the old broken 4-cell format. Because these overrides shadow t=
he base DT configuration, compiling these specific boards will still result=
 in the exact same `of: Respect #{iommu,msi}-cells in maps` warning the ser=
ies intends to resolve.
--

--- Patch [15]: [PATCH 15/22] arm64: dts: qcom: monaco: Fix the PCIe iommu-=
map entries ---
commit fe3050666c02dc7e846b1c3b4ae001c0063dea37
Author: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

arm64: dts: qcom: monaco: Fix the PCIe iommu-map entries

This patch updates the PCIe iommu-map entries in monaco.dtsi to use 5 cells,
adding the missing SID mask. This matches the IOMMU provider's
#iommu-cells =3D <2> property and prevents a warning from the OF core.

> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/q=
com/monaco.dtsi
> index e4c8466f941bd..799d13d7558f3 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -2349,8 +2349,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  			interconnect-names =3D "pcie-mem",
>  					     "cpu-pcie";
> =20
> -			iommu-map =3D <0x0 &pcie_smmu 0x0000 0x1>,
> -				    <0x100 &pcie_smmu 0x0001 0x1>;
> +			iommu-map =3D <0x0 &pcie_smmu 0x0000 0x0 0x1>,
> +				    <0x100 &pcie_smmu 0x0001 0x0 0x1>;

[Severity: Medium]
This isn't a bug introduced by this patch, but this fix appears to be
incomplete. Board and overlay files explicitly override iommu-map using the
old 4-cell format, which will shadow this base DT fix and still trigger the
OF core warning.

For example, in arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi:&pcie0:
    iommu-map =3D <0x0 &pcie_smmu 0x0000 0x1>,

In arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso:&pcie0:
    iommu-map =3D <0x0   &pcie_smmu 0x0 0x1>,

And in arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso:&pcie0:
    iommu-map =3D <0x0 &pcie_smmu 0x0 0x1>,

Should these files also be updated to use the 5-cell format?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-iommu-map-=
fix-v1-0-83405d37ba41@oss.qualcomm.com?part=3D15
