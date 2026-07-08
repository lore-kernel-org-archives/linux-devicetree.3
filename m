Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DAD43713B
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 16:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783529397; cv=none; b=WhrvQQi1tCJoFBQkjxi4pb89C01TXuyZMjv1AX98AXc/QC5NHkMoyQu1Xsl0M3TDI19F+/ufReSeJPcjMNNcxKWAyREVH7bf9w2I/GyPik+Mhag8A87w54yBq9SEg04uIWMjzLwvTFyKIH/8kOknj1kpMriqQa8u5c2mrkPoF1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783529397; c=relaxed/simple;
	bh=4yIuYm0sF3Y4hVsI3nq7nbqwG3SXp4KTQ/9LpTR1erc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AAfY0k1tLiOGtGBNhZnf2wQT4JJ9nTEgKsfpj77gbMogGEyZEbRDaTw2NUCF2JXpcowi4DRv/n747BTsBCaamFkSobrDAbFQH2CP78hDr6XqkSFrHgXVwlTPb+CLSkUG1iw7l+VJrAAgKF5IlhAgTuCNXwYyc4/1ZaTDcUSYEpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TmhTV2Yk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TmhTV2Yk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806331F000E9;
	Wed,  8 Jul 2026 16:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783529395;
	bh=PweMsGz6aPYGsFryeW5fByl4FxC1SJwg7JewtfiPETg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TmhTV2Ykc3EVvJlW2jPi/sdMEVVfYcCvV5NV6dYM2WNf/hJrW8hGql0QDU1NrcMrn
	 IQd8l0BEU/WHM19rv7TEo/9Dlo45eSLvU64KHpRR1dV34uW7Um3AHnH6u74UggRdiI
	 ueL4WHVCEH60R2pZm8PJVuMGwWdIcAp8WppoDnWWfOukvH3gDJH2ZjEZu0EdsLtpxW
	 IUBTa/MD/BDYD4ioE7slZ/k9n33WyzDv9/FT4wwEMB/ZRojXmqSTEvM/YlN9wc0XYb
	 d73Y0z2v4BMaks7bomTQ2p27QbhHQZzXCR2BzKuHo9DX++onbc+tyqf+514BRqnt6e
	 sMqr6LN7ZaFgQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r9a09g057: Add PCIe nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org
In-Reply-To: <20260708163311.222176-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260708163311.222176-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260708163311.222176-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 16:49:55 +0000
Message-Id: <20260708164955.806331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The pcie1 node incorrectly re-uses the exact same clocks and reset=
s properties as pcie0, causing a hardware resource conflict.
- [Medium] The `renesas,sysc` property passes an argument to a phandle, but=
 the target `sys` node lacks a `#cells` property.
--

--- Patch [1]: [PATCH v2 1/2] arm64: dts: renesas: r9a09g057: Add PCIe node=
s ---
commit 146b102b21fdb6341d75564293e25310c00c5056
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

arm64: dts: renesas: r9a09g057: Add PCIe nodes
   =20
Add PCIe nodes to Renesas RZ/V2H(P) ("R9A09G057") SoC DTSI.

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot=
/dts/renesas/r9a09g057.dtsi
> index 9581af58024ed..f3199c32423e5 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> @@ -1024,6 +1024,146 @@ rsci9: serial@12803000 {
[ ... ]
> +		pcie0: pcie@13400000 {
> +			compatible =3D "renesas,r9a09g057-pcie";
[ ... ]
> +			#size-cells =3D <2>;
> +			num-lanes =3D <2>;
> +			renesas,sysc =3D <&sys 0>;
                        ^^^^

[Severity: Medium]
Does the target sys node have a #sysc-cells property defined?

If the driver relies on standard of_parse_phandle_with_args() to read the
controller ID (0), the parsing will fail at runtime because the target
node lacks #sysc-cells. If the driver uses of_parse_phandle(), the
argument is simply ignored.

> +			status =3D "disabled";
> +
> +			pcie_port0: pcie@0,0 {
[ ... ]
> +		pcie1: pcie@13410000 {
> +			compatible =3D "renesas,r9a09g057-pcie";
[ ... ]
> +			interrupt-map =3D <0 0 0 1 &pcie1 0 0 0 0>, /* INTA */
> +					<0 0 0 2 &pcie1 0 0 0 1>, /* INTB */
> +					<0 0 0 3 &pcie1 0 0 0 2>, /* INTC */
> +					<0 0 0 4 &pcie1 0 0 0 3>; /* INTD */
> +			clocks =3D <&cpg CPG_MOD 0xc4>, <&cpg CPG_MOD 0xc5>;
> +			clock-names =3D "aclk", "pmu";
> +			resets =3D <&cpg 0xb2>;
                        ^^^^

[Severity: High]
Are these the correct clocks and resets for pcie1?

The pcie1 node re-uses the exact same indices (0xc4, 0xc5, and 0xb2) as
pcie0. The CPG driver (drivers/clk/renesas/r9a09g057-cpg.c) explicitly maps
these to pcie_0_aclk, pcie_0_clk_pmu, and PCIE_0_ARESETN.

Probing pcie1 will request the exact same exclusive reset and clock lines as
pcie0. This will cause the pcie1 probe to fail with -EBUSY due to exclusive
reset acquisition. Alternatively, if the reset is handled as shared, assert=
ing
the reset during pcie1 initialization will unexpectedly reset the active
pcie0 hardware, dropping any attached devices.

> +			reset-names =3D "aresetn";
> +			power-domains =3D <&cpg>;
> +			device_type =3D "pci";
> +			#address-cells =3D <3>;
> +			#size-cells =3D <2>;
> +			num-lanes =3D <2>;
> +			renesas,sysc =3D <&sys 1>;
                        ^^^^

[Severity: Medium]
Does the target sys node have a #sysc-cells property defined?

Similar to pcie0, if the target node lacks #sysc-cells, parsing this
property with of_parse_phandle_with_args() will fail at runtime.

> +			status =3D "disabled";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708163311.2221=
76-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D1
