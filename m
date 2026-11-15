Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739519;
	b=NfiiqAV9GV59lSHUlXhGjn84sZXkz8aT3rTivyzTY2lNIBi8zXH5VYOIx41GTl/+MKfw
	 0dVKohVPsEw6fp7ouIPZZTLHax7V94uYSMdI40xxNNnMBbfvd13UyLfeytsD3kCSYm43F
	 ksY7YLDIPiwJmjI/vUoYZoJufnJqG2F2xeZgG25vH52m3/IYjWkIzcADFBFTc9uRdv2eg
	 mRA7/yYQqKpN6ZQedjLN5aJKC0KNTK+/dV2AQjiOg/oGJuvpL4IG/EapoqgOqTZ4Zjo4O
	 0UWzDD2kmpAxCkNH8uXKyzIF9VjNzO113lyHsuJ/62wqyNAiFf+sjLGijl3n8nkPeqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739519;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=syYlghrU8wFEsDBUMhZo05Ni9+E+uj4CRbngMkxp8yA=;
	b=LKdzUMcrasWXA513V1nhoL7b6TrlFU/m1DKrCtEM31lNlHc4XQDNIVwDX+URIbmw+uTP
	 srU5TKfmSxuQ9V7teNhAID9+qXbPg609U23t8I7bQf/1L7AvOjxwdZBqm73pP18TP5krl
	 VSGzmNbCIzq6AfM3VtBzezpVJ2fV8p4M4b3UyjKkqUwXYCGRpGMjVeeUpuwAPnIeos6qm
	 YwQdzUoyV2k2hrlBhzH+w5Uwq3Cp7rPJczX1yGlAhPm5XlsnFKqrE2Op7/o1D9Pkt9ttJ
	 Ahn9cpMT4zv84uoGbjtRuKkLa7l5oDDr7a18oGzfG11Z+JRuVYsXaKqbGs296Dyx3YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hQQDPWkm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3465E606A31A
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 10:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hQQDPWkm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD0971F000CB;
	Sun, 15 Nov 2026 10:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739519;
	bh=syYlghrU8wFEsDBUMhZo05Ni9+E+uj4CRbngMkxp8yA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hQQDPWkmb+O20eA0UQD4CipBeaxQW/Lfp1ex/5rfsIrTdy3siA/XiZ/4VFoEzvJUC
	 x+Tni0YogGKdxI3ozn8gm6y/TFdZwOhb7dysudWNnaFRsF/CRdqUughBGq7kwD1HQH
	 FoKhfi3WTpCjIIJea2ndJGaNcxwIuAVE3Erk2Z37RhkAYriXuN6bIw+dRGMOuojFhs
	 +PI4QjImXkMy0sVvBNlDEG/A4HYqxmsY2Gb8WBd4TJRxfJRG+WI5nIYZTjCAfZ1a3k
	 6+wsiCqcMPu+6aTeDoQzzT4XaenqT5+GPErxzHMGEaEtKxKYxTJecel/ZJuUv8dJSf
	 dTaZlIhxVydoQ==
Message-ID: <sashiko-outbox-215403@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 13/15] dt-bindings: net: pcs: Document
 support for Airoha Ethernet PCS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261114104426.235620-14-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
 <20261114104426.235620-14-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 10:45:18 +0000
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

commit 7c02c1d65d1b1089188d04c1629d9473870df4bb
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
> @@ -0,0 +1,261 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/pcs/airoha,pcs.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha Ethernet PCS and Serdes
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +description:
> +  Airoha AN7581 SoC expose multiple Physical Coding Sublayer (PCS) for
> +  the various Serdes port supporting different Media Independent Interfa=
ce
> +  (10BASE-R, USXGMII, 2500BASE-X, 1000BASE-X, SGMII).
> +
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

[Severity: Medium]
Should the Ethernet, PON, and PCIe PCS nodes use the standard phys property
instead of introducing a custom airoha,scu phandle to &scuclk for SerDes
interface mode selection?

In Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml and
drivers/clk/clk-en7523.c (en7581_serdes_phy_set_mode()), the airoha,en7581-=
scu
node (scuclk) is not a syscon and already exposes SerDes port mode switching
via a generic PHY provider (#phy-cells =3D <1>).  For the separate Chip SCU
syscon (airoha,en7581-chip-scu), existing bindings such as
Documentation/devicetree/bindings/thermal/airoha,en7581-thermal.yaml use
airoha,chip-scu pointing to &chip_scu.

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
Should these variants be split into separate binding schema files instead of
combining all four compatibles into a single generic airoha,pcs.yaml?

Because the eth/pon, pcie, and usb blocks have different register sets (8,
15, or 6 reg entries), different #pcs-cells values (0 vs 1), and mutually
exclusive required properties (airoha,scu vs phys), the top-level properties
can only state loose bounds while three large if-then blocks under allOf
redefine almost the entire schema for each variant.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114104426.2356=
20-1-ansuelsmth@gmail.com?part=3D13
