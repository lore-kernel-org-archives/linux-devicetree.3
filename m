Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005772;
	b=VDohzxF7hOCgHUDgQQZRfiqYmz6AEU4M+fkyxUr+I+5VVJB9QVJxwBzWtMiUHR1FITY3
	 pbkLtBM5o/xkuWdz0niKpBA07j9WYijaGIcA/0KokFSs0QqMkbUmfasKgffRGtMHpCioF
	 O3CAZyQ0aLSlFZ+/2ShKvuWHWVg5v2WcRevGPYZP3owCS8nF/1vdnSEWrkentn0GprtJX
	 HZi1YJteJegj0qmYRUFsO3IB+iR4DiOEUyPQ19bQo6DvDF2L5wvUnnYImpOZcxJqln6ZL
	 SWEG5zblks7zw8i6nyC8L0wEftuagpamfbDubBgRGNY1DcL+TtKr6bYwSvkG4NVli7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005772;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7e70MCvzKTuo6WkFhB/VjpNPT/a+ThfPTvn2djnGYE8=;
	b=2X7xDGXCLgjd/WX71dlNIqgrdwizoqnA5RnY52eG9uC310fiusPKcm22+VRzXWr8K3Ch
	 q9UFSqQ36wYT7mOYTAou7Ypr7JdtTYJd0REC6I17cHBr5zTecTloKtkVV0u7hnsbw0zJ/
	 Qcz/oOGki/nH+75mIX+EhpRtmhWVHESyamheSgymF4q3s0n+bnoHNLki9a5Y34BplwPt/
	 1KmN6Xqxa6MnwAyQyvShvbbxvanjG4b84PD1WAn7tA0oxrH77Bnbqbn9aT6TDJENZhZ4/
	 k0+s5sHAotpoas9GcGNPQJpUFH+7vbAWb1I2B7auxBSd6ZBgmTTdrIPsm/uay0jlXaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ETsmSQ4H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5050606A32C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ETsmSQ4H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D38C1F000C5;
	Wed, 18 Nov 2026 12:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795005772;
	bh=7e70MCvzKTuo6WkFhB/VjpNPT/a+ThfPTvn2djnGYE8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ETsmSQ4HzTNMARLVp7Q4fQlFZepGgyJVAEfIicKB+bANSrX/uTO8ZlQbSno5y8TPi
	 rgBFuLwf0KXEKKw5j6Cf1vD2PxW9Qt/wPSeFmo0LOOudVPA7xCap52ylrPlOZF6VFS
	 Lz4d9LocXcEYuh0opW6Q7VKymA1CStz4eYy64D5ymwe7VZtD+3NtsYhX40Uquoekwc
	 gfz/nrz2rwK2peUfIWJOp4rxiZAvPCWVFmyr/5/2B+SsFrZhWScGaeoeQ1Muo7yG0Y
	 9gNLOOyq6FUP0HH5+uHyNcvvhuVJGlEd208MhGirlfTxv5l2uml1Rg39rNf8AcIXy6
	 2Fwv5/dqF/Rng==
Message-ID: <sashiko-outbox-220932@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v22 13/15] dt-bindings: net: pcs: Document
 support for Airoha Ethernet PCS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117123956.11981-14-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
 <20261117123956.11981-14-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 12:42:52 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] dt-bindings: net: pcs: airoha,scu conflicts with SCU generic
  PHY binding
- [Low] dt-bindings: net: pcs: unwieldy per-compatible conditionals in
  airoha,pcs.yaml
--

commit a852142e10dc6efd0e13f0e36a05eb4c25e78d50
Author: Christian Marangi <ansuelsmth@gmail.com>

dt-bindings: net: pcs: Document support for Airoha Ethernet PCS

This commit adds the Device Tree binding schema for the Airoha AN7581
Ethernet, PON, PCIe, and USB PCS and SerDes blocks.

> diff --git a/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml b/=
Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
> new file mode 100644
> index 0000000000000..9c1d116c1b016
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
[ ... ]
> +properties:
> +  compatible:
> +    enum:
> +      - airoha,an7581-pcs-eth
> +      - airoha,an7581-pcs-pon
> +      - airoha,an7581-pcs-pcie
> +      - airoha,an7581-pcs-usb
> +
> +  reg:
> +    minItems: 6
> +    maxItems: 15
> +
> +  reg-names:
> +    minItems: 6
> +    maxItems: 15
> +
> +  airoha,scu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to the SCU node required to configure
> +      the serdes line to the correct interface mode.
> +
> +  phys:
> +    maxItems: 1
> +
> +  "#pcs-cells": true
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - "#pcs-cells"
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - airoha,an7581-pcs-eth
> +              - airoha,an7581-pcs-pon

[Severity: Low]
Should this binding be split into separate schema documents instead of
combining all four compatibles here?

Because the eth/pon, pcie, and usb variants do not share a common register
layout (requiring 8, 15, or 6 reg entries respectively), #pcs-cells count, =
or
required properties (airoha,scu vs phys), the top-level properties block on=
ly
sets loose bounds while three large per-compatible if-then blocks redefine
almost every property in the file.

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/phy/phy.h>
> +
> +    pcs@1fa08000 {
> +      compatible =3D "airoha,an7581-pcs-pon";
[ ... ]
> +      airoha,scu =3D <&scuclk>;
> +      #pcs-cells =3D <0>;
> +    };
[ ... ]
> +    pcs@1fa04000 {
> +      compatible =3D "airoha,an7581-pcs-pcie";
> +      reg =3D <0x1fa04000 0x1000>,
[ ... ]
> +            <0x1fa5a000 0x1000>,
> +            <0x1fa5b000 0x1000>,
> +            <0x1fa5c000 0x1000>;
> +      reg-names =3D "pcs_mac0", "hsgmii_an0", "hsgmii_pcs0",
> +                  "multi_sgmii0", "usxgmii0",
> +                  "hsgmii_rate_adp0",
> +                  "pcs_mac1", "hsgmii_an1", "hsgmii_pcs1",
> +                  "multi_sgmii1", "usxgmii1",
> +                  "hsgmii_rate_adp1",
> +                  "pcs_ana", "pcs_pma0", "pcs_pma1";
> +
> +      airoha,scu =3D <&scuclk>;
> +      #pcs-cells =3D <1>;
> +    };

[Severity: Medium]
Does the airoha,scu property duplicate and conflict with the existing gener=
ic
PHY provider on the AN7581 SCU node?

In Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml and
drivers/clk/clk-en7523.c (en7581_serdes_phy_set_mode()), the scuclk node
(airoha,en7581-scu) is not a syscon and already exposes SerDes interface mo=
de
selection via #phy-cells =3D <1>. Requiring airoha,scu =3D <&scuclk> while
setting phys: false on the eth, pon, and pcie variants bypasses the existing
SCU PHY provider and causes syscon_regmap_lookup_by_phandle() on airoha,scu
to fail with -EINVAL when given &scuclk. If Chip SCU registers are needed
instead, existing Airoha bindings such as
Documentation/devicetree/bindings/thermal/airoha,en7581-thermal.yaml use
airoha,chip-scu pointing to &chip_scu.

In addition, pcs_ana (0x1fa5a000), pcs_pma0 (0x1fa5b000), and pcs_pma1
(0x1fa5c000) in the airoha,an7581-pcs-pcie example claim the same MMIO rang=
es
as csr-2l, pma0, and pma1 of phy@1fa5a000 (airoha,en7581-pcie-phy) in
arch/arm64/boot/dts/airoha/en7581.dtsi.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117123956.1198=
1-1-ansuelsmth@gmail.com?part=3D13
