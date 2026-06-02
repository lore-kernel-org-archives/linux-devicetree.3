Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959B623B62B
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 21:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780434250; cv=none; b=fecEgxHTdJly9fv5JdOPlHtgfZzLn0eqHl7hZSNqXotYt74DOBI38m2Fa18QzB4+z/D63RMmGm3US468XKFjnWFCuOIFuAuFdJHxHk/29uZuSlgYO6oaDzEluJReoS29elbVd8AJKvgesI+uS/JxWP5my3Srice7p+sZqWVI9nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780434250; c=relaxed/simple;
	bh=CB4ijYIoQU7PiO6yat+y9PHCiJlLlHDs6S0ocfvHS2U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GMAg93vt+jTy+mj3DiRuOCtExShqTABniL68J1M45eZmFboxFVOrqDHqT1NNJa7LOQGQOGFCfumRrQqa3yoiyHIChQ0Fi9329z36crwAiz7/7cJSIcd5oPwEBQsJqA0Crw6+8LK2qVJwTAQZVdPpKyXaFg0nM8bYrbobut3Hu9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K7cp8Wdu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K7cp8Wdu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A4BE1F00893;
	Tue,  2 Jun 2026 21:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780434249;
	bh=uLbvXBv+rAtHH8wJv7BeoAwxOyUiJ7ll+fnl6WZWzAg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K7cp8WduXtk4g2rzauujKAYmlq7e5bHzQRkgo0tuc45UfW4aHALS64MmTuXikN5pr
	 YZOTXwxR3U8oYXykfTOpoCeEcs2C0r2OujdaNFxpBt59+ub5GsHFGFsE7NTfRqPvE3
	 Odtb4TIR2ku+Lwa2TmoKnOY8hFWRWTPLaDcOEVKsLJixnnK9bPVHoZX4Om1cQxRtuJ
	 WUkJf4Cdru0cJ5c3i0nggf4XUhVB6TlyX+8WEXCwOR6BzQolJGUrv59zQU+Lrf8R5P
	 1yarqr6599xeuWiogorsLFR/3h55kQJeccDibOaVSSyGZVxzI3x67YTm9V7y1GSdvR
	 rqdvSC6X8Vp2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add PCIe nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org
In-Reply-To: <20260602204707.1920839-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260602204707.1920839-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 21:04:08 +0000
Message-Id: <20260602210408.8A4BE1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Hardware Resource Conflict (Clocks and Resets)
- [High] Invalid DT Phandle Argument and System Controller Overwrite
- [Medium] Invalid PCI Address Space Code in dma-ranges
--

commit fa05d51f2639a95f4f5a2df1ac7430cbbe90aa83
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

arm64: dts: renesas: r9a09g057: Add PCIe nodes

Add PCIe nodes to Renesas RZ/V2H(P) ("R9A09G057") SoC DTSI.

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot=
/dts/renesas/r9a09g057.dtsi
> index 9581af58024ed..4aab7b8250c7a 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
[ ... ]
> @@ -1024,6 +1024,146 @@ rsci9: serial@12803000 {
>  			status =3D "disabled";
>  		};
> =20
> +		pcie0: pcie@13400000 {
> +			compatible =3D "renesas,r9a09g057-pcie";
> +			reg =3D <0 0x13400000 0 0x10000>;
> +			ranges =3D <0x02000000 0 0x30000000 0 0x30000000 0 0x8000000>,
> +				 <0x43000000 4 0x40000000 4 0x40000000 6 0x00000000>;
> +			dma-ranges =3D <0x42000000 0 0x40000000 0 0x40000000 4 0x00000000>;

[Severity: Medium]
Is the 32-bit memory space code (0x42000000) correct for a 16 GB DMA range?

A 32-bit memory space mathematically cannot represent a size of 16 GB or=20
addresses above 4 GB.

Should this use the 64-bit memory space code (0x43000000) instead, similar
to what is correctly done in the ranges property above?

[ ... ]
> +			#address-cells =3D <3>;
> +			#size-cells =3D <2>;
> +			num-lanes =3D <2>;
> +			renesas,sysc =3D <&sys 0>;

[Severity: High]
Does the driver actually parse the index argument in this phandle?

If the target sys node lacks a #sysc-cells property, of_parse_phandle()
will ignore the extra 0 or 1 index passed here.

Will this result in both pcie0 and pcie1 applying system controller
configurations using the exact same static register offsets defined in the
driver, causing pcie1 to overwrite pcie0's settings?

> +			status =3D "disabled";
> +
> +			pcie_port0: pcie@0,0 {
[ ... ]
> +		pcie1: pcie@13410000 {
> +			compatible =3D "renesas,r9a09g057-pcie";
> +			reg =3D <0 0x13410000 0 0x10000>;
> +			ranges =3D <0x02000000 0 0x38000000 0 0x38000000 0 0x8000000>,
> +				 <0x43000000 0xa 0x40000000 0xa 0x40000000 5 0xc0000000>;
> +			dma-ranges =3D <0x42000000 0 0x40000000 0 0x40000000 4 0x00000000>;

[Severity: Medium]
Does this dma-ranges property also incorrectly use the 32-bit memory space
code (0x42000000) for a 16 GB range?

[ ... ]
> +			interrupt-map-mask =3D <0 0 0 7>;
> +			interrupt-map =3D <0 0 0 1 &pcie1 0 0 0 0>, /* INTA */
> +					<0 0 0 2 &pcie1 0 0 0 1>, /* INTB */
> +					<0 0 0 3 &pcie1 0 0 0 2>, /* INTC */
> +					<0 0 0 4 &pcie1 0 0 0 3>; /* INTD */
> +			clocks =3D <&cpg CPG_MOD 0xc4>, <&cpg CPG_MOD 0xc5>;
> +			clock-names =3D "aclk", "pmu";
> +			resets =3D <&cpg 0xb2>;

[Severity: High]
Are these clock and reset indices accidentally copied from pcie0?

The pcie1 node reuses the exact same clocks (0xc4, 0xc5) and resets (0xb2)
as pcie0.

When the driver probes or manages power for pcie1, won't it physically
toggle the reset lines and clocks of pcie0, disrupting its operation?

> +			reset-names =3D "aresetn";
> +			power-domains =3D <&cpg>;
> +			device_type =3D "pci";
> +			#address-cells =3D <3>;
> +			#size-cells =3D <2>;
> +			num-lanes =3D <2>;
> +			renesas,sysc =3D <&sys 1>;

[Severity: High]
Does the driver ignore the index 1 here due to a missing #sysc-cells
property on the sys node?

If the index is ignored, will this cause a syscon register collision with
pcie0 as mentioned above?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602204707.1920=
839-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D1
