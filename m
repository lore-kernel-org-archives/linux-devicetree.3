Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522369;
	b=Ck7gqWDnO1zPv2XWL/yAT6kNXxMaRAq9cGpeHD5lcXuAbc2gJ7/mMMTiJUAckinLTHYu
	 btVataUgpWIO29bPh3cRJyaIgAMWnaSf1DZp5LhCwsZxEmXImIIYtrC45GuCVJqE8DNwo
	 KWIBKbmXJba/nH6iY7kWndhyUf11UQI9sKXIvtiIxGPVAobYfn9wwKVFKWy7wOzhlm+Y4
	 37HprXjvbXx7Een2qUVSiuwkmufN0omcK662v0/BnAiwDJNT1NqqRgW0NJ2PJfmJLy+Ko
	 OCrLE0yAgaVRMSQgDKgoce/42nMmofaJXYwvvviU+N6e1QjTcGK5I/8ja/1uBw35wLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522369;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kvjsFKNMRk1R6P9mTGBQSEAArukq0alOKle00+2lcpg=;
	b=MS8iKsFAwMbfIqd0zlgoBkUPSfFeMkGn2fCm3GmyzqO99MKhwYCg25PP4F9NgupgsahM
	 Z3WT129tMXenptuCAHx6uT7nKVoYNBBZ9/V1W1EP7Pk4iGmC7JVaw0jlTgcH9jLS0vAY6
	 ZpBFKFQ68Fub1c4jSVJVDeT5uEmCbL0q1i8LagvQ1TmGrK7eOuWlIUh0Iu/D1+N5x8y6D
	 w8Sk/wRq9lbSPeF5n9ptv5/Nb0sGf6fcYicgKk/e1qUrCM5ecc6XS3D+XOpMM/BrdK8tu
	 L8rjP3Zl4W9IzZHoVzy7ILEeHU7d6e8FfOxWHOczqoTKEC92FzN/XcQtokJo8gXHg0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=isNZcOWZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36318606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=isNZcOWZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27FA81F000C6;
	Tue, 24 Nov 2026 12:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795522368;
	bh=kvjsFKNMRk1R6P9mTGBQSEAArukq0alOKle00+2lcpg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=isNZcOWZulJfGmd3DuxMYjUqTDm/Pt8X7+6FAekuENf+Rc5uQeQXUm5Td7QHxG6EJ
	 eBXxD8vkGXiRNfJTTf7PJutWd7ptyjcfQokxCgq+hx3+DkzUwKIag6cg03TvZq4NJ2
	 3xoiKBc6ljfPaeb8RWyCUkvYMhd419dPc9rr5cmvwFujcmiL6LlxScgN2YrrIL4Plz
	 GbIF8HZF2N8a7ndrYONVoIuGJAlns+lM1800w0PNXZdNev5vFdNuuMDi4xFiC0UBNn
	 Ib9KXoOyJQWMuHCRvXE/XdLlvDuXaAFtDfRt3h4VpQzhHbATJrRDDZ1AUWS2O34VPj
	 tJuYeRghoCPdQ==
Message-ID: <sashiko-outbox-231105@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: display: add CIX Sky1 DisplayPort
 transmitter
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luo Liu" <Luo.Liu@cixtech.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124120114.3273161-2-Luo.Liu@cixtech.com>
References: <20261124120114.3273161-1-Luo.Liu@cixtech.com>
 <20261124120114.3273161-2-Luo.Liu@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 12:12:47 +0000
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
- [Medium] dt-bindings: display: YAML syntax error in cix,sky1-dp.yaml
  description
- [Low] dt-bindings: display: non-canonical interrupts order in
  cix,sky1-dp.yaml
--

commit b6de90c771aaece1d4e8eb9c4dd01a00555577c3
Author: Luo Liu <Luo.Liu@cixtech.com>

dt-bindings: display: add CIX Sky1 DisplayPort transmitter

This commit adds the Device Tree binding schema for the Trilinear
DisplayPort transmitter integrated on CIX Sky1 and its MAINTAINERS entry.

> diff --git a/Documentation/devicetree/bindings/display/cix,sky1-dp.yaml b=
/Documentation/devicetree/bindings/display/cix,sky1-dp.yaml
> new file mode 100644
> index 0000000000000..bc3c0a3a815f8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/cix,sky1-dp.yaml
> @@ -0,0 +1,102 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/cix,sky1-dp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CIX Sky1 Trilinear DisplayPort Transmitter
> +
> +maintainers:
> +  - Luo Liu <Luo.Liu@cixtech.com>
> +
> +description:
> +  Trilinear DisplayPort transmitter on CIX Sky1. The transmitter takes i=
ts
> +  video stream from the display pipeline through a single graph port and
> +  drives the link through a generic PHY.
> +
> +  The USB-C transmitters and the native DP/eDP transmitter use different
> +  RCSU video-adapter register offsets and bit layouts, so each has its o=
wn
> +  compatible: "cix,sky1-usbdp" for the USB-C transmitters and "cix,sky1-=
dp"
> +  for the native DP/eDP one.

[Severity: Medium]
Should description: use a block scalar indicator (description: |)?  Without
it, the multi-line text is parsed as a plain YAML scalar, and the colon-spa=
ce
in 'compatible: "cix,sky1-usbdp"' causes dt_binding_check to fail with a YA=
ML
syntax error.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - cix,sky1-usbdp
> +      - cix,sky1-dp
> +
> +  reg:
> +    items:
> +      - description: DisplayPort transmitter registers.
> +      - description: RCSU video adapter registers used for link setup.
> +
> +  reg-names:
> +    items:
> +      - const: dp
> +      - const: rcsu
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: APB clock of the controller.
> +      - description: Video clock of stream 0.
> +      - description: Video clock of stream 1.
> +
> +  clock-names:
> +    items:
> +      - const: apb
> +      - const: vid0
> +      - const: vid1
> +
> +  resets:
> +    maxItems: 1
> +    description: DisplayPort controller reset.
> +
> +  phys:
> +    maxItems: 1
> +    description: DisplayPort PHY the controller transmits through.
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description:
> +      Video input from the Mali D71 display pipeline (Komeda) that drives
> +      this controller. The link to the sink is through phys (USB-C combo=
 PHY
> +      or the native DP PHY), not a second OF graph port on the DPTX.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - phys
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    dp0: dp@14064000 {
> +        compatible =3D "cix,sky1-usbdp";
> +        reg =3D <0x14064000 0x4000>,
> +              <0x14050000 0x400>;
> +        reg-names =3D "dp", "rcsu";
> +        interrupts =3D <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&dpc0_apb>, <&dpc0_vid0>, <&dpc0_vid1>;
> +        clock-names =3D "apb", "vid0", "vid1";

[Severity: Low]
This isn't a bug, but in canonical DT binding property ordering, interrupts
is placed after clocks and clock-names in properties, required, and example=
s.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124120114.3273=
161-1-Luo.Liu@cixtech.com?part=3D1
