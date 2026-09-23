Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F7E490BEC
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 20:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790193925; cv=none; b=AKmbU2rn6qcls0nHEzpzJdafJR00uxbtxScssJJD28GrITOGgX97JM+5LqKfZE8iNvcQlqg5X0COjeGYp1AZMUJEhOIlKIy4VY9plQYYdVenDMiMTwQtSwaIuCr+XczDI77AlhjUx0/EtIZuM2x3i401sNNsTBdvFt+CXFqADIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790193925; c=relaxed/simple;
	bh=fJNg5sMiF5H1lLngikq5gfCkS9uR2QRgeSxb/PWgJQ0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lF5DJPgI8niMGFica224x7BRBf+Y63WCqkeam6LPSiqAk9GAZx6LEm6EFS+EsiLAU44+nP/ef325tPkvM4tjkiRQU4TTRFMqUvI0vz/qnNk9V4XuacUY4Ict2pVSdbZmiSlg9lC/ds+xlmorvscwUYotNo/VuiC3NDJm+rkHqWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P7E/NrBV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P7E/NrBV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 283221F00893;
	Wed, 23 Sep 2026 20:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790193923;
	bh=7dwa7jH4CKOlaiXla7W5D/VkPOOHCAAejqwvLBwyJzc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P7E/NrBVQ9iqIPbzKu0Uzx/RFm/wey9mKRLyVZdvz/6tjhgkMup7PQBZZlM6lQAuC
	 3AneeIXBxhWWDFWNhYjjCeICzM1SIAK8w3riOif+QtDWLmdiV4NiCaUD0AMzUEiwld
	 E/C1W1m6sMFgeDZbi3a/NGGyczu5B0RgSUjogdBUw7G3DzeKHWTsJAHMg6Dpzkudkm
	 B+j7LTGY7rcrls/S9c0SD57BYGzXYT4xG/0OEVb5Yaze32UIZk3y2x6QJ028KeZxE4
	 Pq1nvZriW5eZyM51u85QtRKmS1znGSFgPX2eEH7Ka++8Cpre9CW9B3L/+tL3Hscive
	 ucy5cDRP1fWSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v10 05/11] arm64: dts: rockchip: rk3568: add
 XPCS and fixed-clock nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, olteanv@gmail.com, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, vkoul@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260922200336.2201212-6-coiaprant@gmail.com>
References: <20260922200336.2201212-1-coiaprant@gmail.com>
 <20260922200336.2201212-6-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 20:05:22 +0000
Message-Id: <20260923200523.283221F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] arm64: dts: missing required phys and phy-names in xpcs node
- [Low] arm64: dts: invalid status property in ethernet-pcs-mii subnodes
--

commit f7f429813cd82e99b5d810d46e4c1e52b84d1623
Author: Coia Prant <coiaprant@gmail.com>

arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes

This commit adds the XPCS device node, its PCS-MII sub-nodes, and fixed-clo=
ck
nodes for GMAC reference clocks to the RK3568 SoC device tree.

> The XPCS node requires a reference to the appropriate Naneng Combo PHY
> via the phys property.  dtbs_check only validates required properties
> for enabled nodes, so the SoC dtsi does not provide phys/phy-names:

[Severity: Low]
The commit message states that dtbs_check only validates required properties
for enabled nodes, but is this accurate?=20

The dt-schema validates all matching nodes against the
rockchip,rk3568-xpcs.yaml schema, regardless of their status property. Since
the schema defines phys and phy-names as unconditionally required, will this
cause make dtbs_check to emit missing-property warnings for every RK3568
board that does not explicitly provide these properties?

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3568.dtsi
> index 3bc653f027f1f..2cea108b31a4e 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi

[ ... ]

> +	xpcs: ethernet-pcs@fda00000 {
> +		compatible =3D "rockchip,rk3568-xpcs";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		reg =3D <0x0 0xfda00000 0x0 0x200000>;
> +		clocks =3D <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
> +		clock-names =3D "csr", "eee";
> +		power-domains =3D <&power RK3568_PD_PIPE>;
> +		status =3D "disabled";
> +
> +		xpcs_mii0: ethernet-pcs-mii@0 {
> +			reg =3D <0>;
> +			status =3D "disabled";

[Severity: Low]
Does adding the status property here cause undocumented property warnings
during dtbs_check?=20

The rockchip,rk3568-xpcs.yaml schema defines the ethernet-pcs-mii subnodes
using patternProperties with additionalProperties: false, but does not
explicitly include status in its allowed properties, nor does it reference a
core schema that would bring it in.

Since disabling the parent xpcs node is sufficient, is the status property
redundant in these child nodes?

> +		};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922200336.2201=
212-1-coiaprant@gmail.com?part=3D5
