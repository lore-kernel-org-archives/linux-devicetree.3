Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015871;
	b=fnFdSRUev/D6BB+OKy3KT/jmYSpAc9FtMpE12w84W6d2GR2N88QKw7IyOcdOLTaJgzkI
	 ix3PSispdr8OGhG5t1jQu1F5aOCnXjaF1KTQ0/YQUwWigqrUXqt6Rftfd4NWQgyrNVPI9
	 gZi9fH5qTUeWTR0PLv5kZODiqBlebO5rKcRPw6QwCYp3NAkRkun3sicUrJNyXr0G8LT3Q
	 DYcNpVDJl1qjTfSlbOzOHCON4R+mLYEpPNDzBr9yUtYxtVOaB23pw5/Msu14O4uJun4ch
	 CybYhPDR/HgoBAC8PUVSo/S1vXlx0cQ0tCYcnSUkko15uicCcdF5ZbjdCOUTWmHnrlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015871;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5XuzblHE2CHIZMfcr9sOlhUhkJBZmb2vSPxxzElW0yI=;
	b=ba4L90WMYOCNKEav4HqiXCJgDGPYshdAPjoLxzIZTyVEMpCue7QnrhwHpeVf92eiOx7t
	 68PwwPB5U1prwU21ofblQqDLDNRneSNtn+vqwlxNSLfh489wO5wk7cZ2kcIFoMYEFVaLN
	 LWzEhfhzy1vXs0QRvmV3QkNy1or8osn+iy+cWdgSQfyH5QJPqo6ygPzw5q0n2qETFs0ia
	 ug/HoTAxvfyGvDOmcV2eT+s/FIodWIxHH6EygzAbSL2I+FEGbVB+aupoMsOHC+e2nKVt+
	 0H+oCbykct1cBhNpKAxzangbRzF8WpeIkExQvkjLcAEKtdAoyqex13aeH0fcQlidFfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EzC7esF2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A46F606A31B
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EzC7esF2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0947C1F01825;
	Mon, 26 Oct 2026 11:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793015871;
	bh=5XuzblHE2CHIZMfcr9sOlhUhkJBZmb2vSPxxzElW0yI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EzC7esF2fLIDXfRMSDXeAk5yYnWDXpRrMbhD+KWvL+35uthdxOWn73Lpp3iz1Aar+
	 sdtprUCoQAWJXXNIbwuMpCl384WGOC/rUW3vVQxXEX8AlsjQNUdZj3h8R9PYiAwqkK
	 8tMkxVeo71tHqjc6hqWH11203yUNhsuzXJvi5IVxflWc2x9OqDzw9vp+7FlpxnFlzq
	 ExJnZ93hS/YPcYXoH7djkUOn50LfHEPLYbEbpe/qQS0LqBkU4dTPs9/ltuwF7jpAmT
	 XrPhna7i7BcnIH5WiU3TMXVor1yip9LC2yuvRGBYqAmh+3M+MjepGnHVQtmWVdvlHC
	 B7Ah4RaQMGtYw==
Message-ID: <sashiko-outbox-185142@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 9/9] arm64: dts: airoha: en7581: add integrated switch
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261026095727.31708-10-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
 <20261026095727.31708-10-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 11:57:50 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] arm64: dts: airoha: missing interrupts property on en7581 intern=
al switch PHYs
- [Low] arm64: dts: airoha: invalid #address-cells/#size-cells on en7581 sw=
itch node
- [Low] arm64: dts: airoha: misplaced phy-mode property on en7581 ethernet-=
phy nodes
--

commit f50b3495d44d1f59372ccf1eb2beb38da392948c
Author: Christian Marangi <ansuelsmth@gmail.com>

arm64: dts: airoha: en7581: add integrated switch node

This patch adds the integrated switch node for the Airoha EN7581 SoC,
including its ports, internal MDIO bus, internal PHY nodes, and PHY LED
subnodes.

> diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts=
/airoha/en7581.dtsi
> index f214fa3a3e2bb..83ae41271f96f 100644
> --- a/arch/arm64/boot/dts/airoha/en7581.dtsi
> +++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
> @@ -4,6 +4,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/en7523-clk.h>
>  #include <dt-bindings/reset/airoha,en7581-reset.h>
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/thermal/thermal.h>
> =20
>  / {
> @@ -470,6 +471,152 @@ fixed-link {
>  			};
>  		};
> =20
> +		switch: switch@1fb58000 {
> +			compatible =3D "airoha,en7581-switch";
> +			reg =3D <0 0x1fb58000 0 0x8000>;
> +			resets =3D <&scuclk EN7581_GSW_RST>;
> +
> +			interrupt-controller;
> +			#interrupt-cells =3D <1>;
> +			interrupt-parent =3D <&gic>;
> +			interrupts =3D <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			status =3D "disabled";
> +
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;

[Severity: Low]
Should #address-cells and #size-cells be dropped from switch@1fb58000?

The binding schema in
Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml sets
unevaluatedProperties: false and only allows #address-cells and #size-cells
inside the ports and mdio child nodes, not on the top-level switch node.

In addition, because switch@1fb58000 has no ranges or dma-ranges property a=
nd
its direct children (ports and mdio) do not use reg or ranges,
check_avoid_unnecessary_addr_size() in scripts/dtc/checks.c warns about
unnecessary #address-cells/#size-cells when building with W=3D1.

> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				gsw_port1: port@1 {
> +					reg =3D <1>;
> +					phy-mode =3D "internal";
> +					phy-handle =3D <&gsw_phy1>;
> +				};

[ ... ]

> +			mdio: mdio {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				gsw_phy1: ethernet-phy@9 {
> +					compatible =3D "ethernet-phy-ieee802.3-c22";
> +					reg =3D <9>;

[Severity: Medium]
Are gsw_phy1 through gsw_phy4 missing interrupts properties referencing the
switch interrupt controller?

Above, switch@1fb58000 is configured as an interrupt-controller wired to
GIC_SPI 31, and mt7530_setup_irq() registers the switch regmap_irq_chip
domain. However, in drivers/net/dsa/mt7530.c:mt7530_setup_mdio():

	if (priv->irq_domain && !mnp)
		mt7530_setup_mdio_irq(priv);

	ret =3D devm_of_mdiobus_register(dev, bus, mnp);

when an explicit mdio child node (mnp) is present in the device tree,
mt7530_setup_mdio_irq() is skipped (and only covers PHY addresses 0..4 in a=
ny
case). Instead, devm_of_mdiobus_register() calls
fwnode_mdiobus_phy_device_register() -> fwnode_irq_get(child, 0) on each
ethernet-phy node.

Without interrupts properties on gsw_phy1, gsw_phy2, gsw_phy3, and gsw_phy4,
fwnode_irq_get() fails and all four internal PHYs fall back to PHY_POLL
instead of using the switch's link-change interrupts.

> +					phy-mode =3D "internal";

[Severity: Low]
Is phy-mode =3D "internal" intended on the ethernet-phy@9 through
ethernet-phy@c nodes (gsw_phy1..gsw_phy4)?

The phy-mode property is a MAC/DSA port property defined in
Documentation/devicetree/bindings/net/ethernet-controller.yaml and is alrea=
dy
present on the corresponding switch port nodes gsw_port1..gsw_port4, whereas
Documentation/devicetree/bindings/net/ethernet-phy.yaml does not define
phy-mode on PHY nodes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026095727.3170=
8-1-ansuelsmth@gmail.com?part=3D9
