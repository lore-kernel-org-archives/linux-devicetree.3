Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBDF3B2D38
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 09:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788944888; cv=none; b=VY/3u/nV61q/Y+pFhBMCH0pCoSnrGx/nkjc7yeEdes9N5Orhz5NeG5rX+msw0ImPCfSNMsRxfgcO3CAacxhgeU/DZEgptlqZIOAzDdInJykX4aeR9tIt52N08kvP+p1I7LLpO5BjrhtRFmFQ5BLpKa/MiUKJ0YKujfC0xDI5Ux0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788944888; c=relaxed/simple;
	bh=jDz/DklqyGD9E/HjRZLQibPH0vRAZDlvUmjWJKov/18=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dBGLStu+YSqgpLXZ7xdJBJN1DDNd19w3VQCnJ0aDePSUI+pgkeFAtXdHDfKzkuRuVTStc3+VXAk+7nkF2T5JyowA7n0X2VkafNq7cp7+JpQg/nEXNf0X8HT0uDnz5S6MgGLtDYFREqeXBH2sw27tnHyHj+2bGRb6IjbGAD38LvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oq8Tsq8V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oq8Tsq8V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2299E1F00A3D;
	Wed,  9 Sep 2026 09:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788944886;
	bh=eT8BdiLqWyouV5yENpLZY8lSm0B/ZvJwAtnjv070OEw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Oq8Tsq8VjtLr41lg+biI/xp8OVYyhiTW/qKCUGAc4t5PLCOeKgEppLMGWF++px4uY
	 XLLZuIqlwVXW61wPKDLfkKaFUrT1GyceWaGToETdqWR05EaX/wOPjEaSN+De1iZ6Vf
	 KLEdrvR7GngG4VdGU07CQsFnwchsC0J58KMeuWpZN71kSYuhhJ2j3YnyEdsD5v5JLI
	 KWwl+77/XRAc7Py0zlSpWQ95CtsU9CFaeS2eCNATXX9qa+kzOkrHszfi/F+Yd8DagD
	 0VAMLccWsO6cO3Xe9h8fuV+4EToMd1O4Hx9tLs2kddLgkZTgE5wpGe6EmYdx7RvkLK
	 XEoA8lvFJdanw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] arm64: dts: renesas: r9a08g046: Add USB2.0
 host/phy device nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tommaso Merciai" <tommaso.merciai.xr@bp.renesas.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <0e2d1c3bfad30090784ca52a20f21b001b662527.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
 <0e2d1c3bfad30090784ca52a20f21b001b662527.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 09:08:05 +0000
Message-Id: <20260909090806.2299E1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The device tree node `phyrst: usbphy-ctrl@11e00000` specifies `com=
patible =3D "renesas,r9a08g046-usbphy-ctrl"` without any fallback compatibl=
e string, and this specific string is not supported by any reset driver in =
the tree.
- [High] The VBUS regulators are defined inside a generic `regulators` wrap=
per node, which violates the device tree schema and causes a probe failure =
in the regulator driver.
- [Low] The newly introduced compatible strings `renesas,r9a08g046-usbphy-c=
trl` and `renesas,usb2-phy-r9a08g046` are not documented in the YAML device=
 tree bindings.
--

commit 2f4cbd3dd8ab4b32e48fa0090fc979178999df6f
Author: Biju Das <biju.das.jz@bp.renesas.com>

arm64: dts: renesas: r9a08g046: Add USB2.0 host/phy device nodes

This commit adds USB2.0 device nodes to the RZ/G3L (r9a08g046) SoC DTSI.
It covers the USB PHY controller, OHCI/EHCI host controllers, and USB2 PHYs
for both ports.

> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot=
/dts/renesas/r9a08g046.dtsi
> index 608ba1f9e2f8c..10123281c53c4 100644
> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> @@ -1127,6 +1127,110 @@ queue3 {
>  			};
>  		};
> =20
> +		phyrst: usbphy-ctrl@11e00000 {
> +			compatible =3D "renesas,r9a08g046-usbphy-ctrl";

[Severity: Low]
Is this compatible string documented? It appears to be missing from the sch=
ema
definition in Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-=
ctrl.yaml.

[Severity: High]
Does this node need a fallback compatible string?

Since "renesas,r9a08g046-usbphy-ctrl" is not supported by any reset driver =
in
the tree, the reset-rzg2l-usbphy-ctrl driver will not probe for this device=
 node.

This will cause dependent USB nodes that request resets from this node to f=
ail
with -EPROBE_DEFER indefinitely.

> +			reg =3D <0 0x11e00000 0 0x10000>;
> +			clocks =3D <&cpg CPG_MOD R9A08G046_USB_PCLK>;
> +			resets =3D <&cpg R9A08G046_USB_PRESETN>;
> +			power-domains =3D <&cpg>;
> +			#reset-cells =3D <1>;
> +			status =3D "disabled";
> +
> +			regulators {
> +				usb0_vbus_otg: vbus0 {
> +					regulator-name =3D "usb0_vbus";
> +				};
> +
> +				usb1_vbus_otg: vbus1 {
> +					regulator-name =3D "usb1_vbus";
> +				};
> +			};

[Severity: High]
Will the renesas-usb-vbus-regulator driver be able to probe this structure?

The driver expects exactly one child node named "regulator-vbus":

    of_get_child_by_name(dev->parent->of_node, "regulator-vbus")

Because the child node is named "regulators", the driver will return -ENODE=
V.

The driver is also hardcoded to register only a single regulator instance v=
ia
enable_mask =3D BIT(0), so it cannot support the two separate regulators de=
clared
here.

Additionally, does this violate the renesas,rzg2l-usbphy-ctrl.yaml device t=
ree
schema which forbids the "regulators" wrapper?

> +		};
> +
> +		ohci0: usb@11e10000 {
> +			compatible =3D "generic-ohci";
> +			reg =3D <0 0x11e10000 0 0x100>;
> +			interrupts =3D <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_MOD R9A08G046_USB_PCLK>,
> +				 <&cpg CPG_MOD R9A08G046_USB_U2H0_HCLK>;
> +			resets =3D <&phyrst 0>,

[Severity: High]
Since this controller strictly depends on the "phyrst" reset controller, wi=
ll it
fail to probe due to the missing fallback compatible string in the "phyrst"
node mentioned above?

[ ... ]

> +		usb2_phy0: usb-phy@11e10200 {
> +			compatible =3D "renesas,usb2-phy-r9a08g046";

[Severity: Low]
Is this compatible string documented? It appears to be missing from the sch=
ema
definition in Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788943229.gi=
t.tommaso.merciai.xr@bp.renesas.com?part=3D1
