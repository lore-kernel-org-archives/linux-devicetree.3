Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EF82D2486
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784774476; cv=none; b=KdSfmBjROcpSfCqVKR6M+kUfDA4PKSYMC/htGZe4j8Fc8bUIJMkxd5IqrT8/lfJ2erPpCwkhJ/kcuKLdPF1niQHRheCCRbxjkrCQJbBi7097dFIb2jUcryGK1GUipH3DKKoHsNEeFWm1Rs0E1HNAi9fky8ZV3j5BukMb+z6l9Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784774476; c=relaxed/simple;
	bh=FQRapFzVB6qmSc9NO63TIzvCz3hYgzX7xaqlNkARLO4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uuPx49zhQigXn7/L7Jmc7knIp07c7DwoDEd+clgHWzusTwr29Buadp6OgMfeIcxuCh5uiNEOpFfx2ECTvbqfzOpno/MxYQnUflgrmmF0qWJIDsU4um5YTiNEg58HD9I5rS89ZedKDJl3l7d36Z2VxyOA4jUG/sxPRlQM2bU5jdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dN1G7EcO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dN1G7EcO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 921F01F000E9;
	Thu, 23 Jul 2026 02:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784774475;
	bh=uo6cs1GBIeoh2IxEM1iWgYfpm9Q81pEyiR0+Y2kaLDE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dN1G7EcOnSgaNkq40iDzRzRddmVLiBBDKZdMsaBhxe/KLWoeDbrtzeStHIMxuASVo
	 E6E3ucsGmViiTa5eWl+FWheSLLRbw0CgV3fR8R8+rnb83mYOHX8KGsZqBBgOmG1X/Y
	 XaFnV8PJzVlWB0vKPNctE2KtwGOP8/QSP2Q/tzW1LafYIagzCXsCL6Kn/F6IhqfK1A
	 pKDx3kAgh8DrQKuVx89VnyKO1q5kHku8eCw/mHo3Ga82sy+eco1EuHEsQpS9bWCcH9
	 S9lZvqoZ2esOoqFdHjIE0u+QQDXJoNpS3cWdt+sKdS8UZp3Eu+rqMlreH5ex/VYbGt
	 QTLAYPrbCtAXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/6] arm64: dts: qcom: glymur: Wire PCIe3a/3b to
 shared Gen5x8 PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiang Yu" <qiang.yu@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org
In-Reply-To: <20260722-glymur_linkmode_0722-v6-3-bba8156b8cbb@oss.qualcomm.com>
References: <20260722-glymur_linkmode_0722-v6-0-bba8156b8cbb@oss.qualcomm.com>
 <20260722-glymur_linkmode_0722-v6-3-bba8156b8cbb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 02:41:14 +0000
Message-Id: <20260723024114.921F01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The pcie3a controller is incorrectly configured for an 8-lane PCIe=
 link instead of a bifurcated 4-lane link.
- [Medium] The 32-bit PCI memory window in the `pcie3a` `ranges` property u=
ses an incorrect child address, breaking identity mapping.
- [Medium] The 'pcie3a_port0' root port node is missing the 'compatible =3D=
 "pciclass,0604";' property.
--

--- Patch [3]: [PATCH v6 3/6] arm64: dts: qcom: glymur: Wire PCIe3a/3b to s=
hared Gen5x8 PHY ---
commit 563e57122857b4066dc260031df9a220f41387c4
Author: Qiang Yu <qiang.yu@oss.qualcomm.com>

arm64: dts: qcom: glymur: Wire PCIe3a/3b to shared Gen5x8 PHY

Glymur's PCIe3a and PCIe3b controllers share a single Gen5x8 QMP PHY block
that can be bifurcated into two independent x4 links, rather than each
controller owning its own dedicated PHY. This commit adds a pcie3_phy node
and wires up both controllers.

> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/q=
com/glymur.dtsi
> index f32af66a3f1c8..6355499ee5e50 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi

[ ... ]

> +		pcie3a: pci@1c10000 {
> +			device_type =3D "pci";
> +			compatible =3D "qcom,glymur-pcie", "qcom,pcie-x1e80100";
> +			reg =3D <0x0 0x01c10000 0x0 0x3000>,
> +			      <0x0 0x70000000 0x0 0xf20>,
> +			      <0x0 0x70000f40 0x0 0xa8>,
> +			      <0x0 0x70001000 0x0 0x4000>,
> +			      <0x0 0x70100000 0x0 0x100000>,
> +			      <0x0 0x01c13000 0x0 0x1000>;
> +			reg-names =3D "parf",
> +				    "dbi",
> +				    "elbi",
> +				    "atu",
> +				    "config",
> +				    "mhi";
> +			#address-cells =3D <3>;
> +			#size-cells =3D <2>;
> +			ranges =3D <0x01000000 0x0 0x00000000 0x0 0x70200000 0x0 0x100000>,
> +				 <0x02000000 0x0 0x70000000 0x0 0x70300000 0x0 0x3d00000>,

[Severity: Medium]
Is this 32-bit PCI memory window child address correct?=20

The standard for Qualcomm PCIe controllers in this device tree is to have
identical parent and child addresses for the 32-bit outbound memory window
(like pcie3b). Here it looks like cpu address 0x70300000 is mapped to pci
address 0x70000000, which appears to be copied from the dbi register base.
Could this break the identity mapping convention?

> +				 <0x03000000 0x7 0x00000000 0x7 0x00000000 0x0 0x40000000>,
> +				 <0x43000000 0x70 0x00000000 0x70 0x00000000 0x10 0x00000000>;
> +
> +			bus-range =3D <0 0xff>;
> +
> +			dma-coherent;
> +
> +			linux,pci-domain =3D <3>;
> +			num-lanes =3D <8>;

[Severity: High]
Should this controller be configured for 8 lanes instead of 4?

The commit message explicitly states that the single Gen5x8 PHY block
is "bifurcated into two independent x4 links", and pcie3b correctly requests
4 lanes. By requesting 8 lanes here, and further down setting eq-presets and
an OPP table for 8 lanes, won't this cause the PCIe controller to attempt an
unsupported 8-lane training on the bifurcated PHY?

> +
> +			operating-points-v2 =3D <&pcie3a_opp_table>;

[ ... ]

> +			pcie3a_port0: pcie@0 {
> +				device_type =3D "pci";
> +				reg =3D <0x0 0x0 0x0 0x0 0x0>;
> +				bus-range =3D <0x01 0xff>;
> +

[Severity: Medium]
Is this node missing the compatible =3D "pciclass,0604"; property?

All other PCIe root port nodes in the file (including pcie3b_port0) specify
this string. Omitting it here might break compatibility matching for generic
OF-based PCI bridge drivers.

> +				phys =3D <&pcie3_phy 0>;
> +
> +				#address-cells =3D <3>;
> +				#size-cells =3D <2>;
> +				ranges;
> +			};
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-glymur_lin=
kmode_0722-v6-0-bba8156b8cbb@oss.qualcomm.com?part=3D3
