Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795271431;
	b=D5OgS35NorFi0rKShTqMwwPHQOuczs69wGSdoH42PfaFeBGdpvOdu+k5k9mJ2ONANSJl
	 ujv0CgfbNPRyHl/X+Vea6haFmva7O67SEC1WZrCq3AGIHxfk8IHph0/Jig1s5pcnOR5/b
	 ZXRHZIUaq8aNE4oPW7XeoOV14aDejMi8B7fyTyqJejU5CLQ6z5Ap0zmyV3HVToBQOYwSh
	 eO0Hz0hi7iZ5Ht4iKEjT2Ged2IcAHsk9Q9Hazc2U0D8Vm+Rpph0CGz1aSmKdA886sTlel
	 ZUT9/fbO2P54zTBv72rATrB2tgR/aU5nDNACXpndAvADP2lQlMr1blGOPbS28sNEkXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795271431;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=M3meDFiNHXc8JhjD0Ltd3IbB3duW63FlmeXs3F3u0LY=;
	b=BwW+S1PZdpCcfyOUS8sHAVU/sju9BQBF26zgChSjSXYu3BTUpptSo/sU9J7B/mB1deBz
	 tfHhQTfm0DyFGussfICsAT18TTs0A1UpTGuc/56yv5BYsVFWlVAdmrnTlMlM3blwuvnbt
	 ef0/sVEagfASoZLfTcVuGoDn+c6C//sSv/UJDW7W0rXo/YbRh/5hoFObYHkZMpiJaGM0o
	 KfI3OPxeRXFier9gU74fp7WBeDyHuGE3t5GWMlgIeEhpUpESUjsFPr3zfgV6YmXwyWcQa
	 rEt76BtkhCWz2sLdDdaU8EztxIIUk0/L4lN+6So/LRXFrQur4op3QC31Dizl6LL3MEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J48GZXyJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77418606A32A
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 14:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J48GZXyJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CADFC1F000D3;
	Sat, 21 Nov 2026 14:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795271431;
	bh=M3meDFiNHXc8JhjD0Ltd3IbB3duW63FlmeXs3F3u0LY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J48GZXyJqJqga/U4QkZaRfv8Q1E1TB7MKT3MGZ8oLLFQuRVJBwtpkFhDLRnnA1il3
	 ayCySbeZARbI3yUvlgy5UnNg9EzrjGy3bHVDmpV9GptCgB+Y8I0FijBGQ9wQjiqDAj
	 g6KI39JLJwB5sg47p7YUL1yeNzzm51StPfLzDYrP0bZbEdJv7CZh9Gk6KF4AUNwyA1
	 OplrO0zVgl0qX3xeIKofgMWZAw9w5ayEgAzkoiPTzoZr5Pb+PR2WmcUCxUGn1mcv+J
	 tSV0oZGFhEEfpN95M2Y22DIoOpUcpEOOsX/rn0k0J0cNNROvbfyv9N6aQlgECjvydJ
	 1eg1AWCuOr87g==
Message-ID: <sashiko-outbox-227097@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] media: dt-bindings: Add Rockchip IEP2
 deinterlacer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261121-iep2-v4-1-760cf25f322b@gmail.com>
References: <20261121-iep2-v4-0-760cf25f322b@gmail.com>
 <20261121-iep2-v4-1-760cf25f322b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 14:30:30 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: media: rockchip,rk3568-iep2: interrupts listed
  before clocks
--

commit 025585c81c62fe98d43733346b23c19c6b7363de
Author: Arun Iyengar <aiyengar1990@gmail.com>

media: dt-bindings: Add Rockchip IEP2 deinterlacer

This commit adds a Device Tree binding schema for the Rockchip IEP2 image
enhancement processor on RK3568 and RK3588 SoCs, along with a MAINTAINERS
entry.

> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-iep2=
.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-iep2.yaml
> new file mode 100644
> index 0000000000000..0c7666de19f8d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-iep2.yaml
> @@ -0,0 +1,95 @@

[ ... ]

> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: AXI bus clock
> +      - description: AHB bus clock
> +      - description: Core clock
> +
> +  clock-names:
> +    items:
> +      - const: aclk
> +      - const: hclk
> +      - const: sclk

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - iommus
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/rk3588-power.h>
> +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> +
> +    bus {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +
> +      deinterlace@fdbb0000 {
> +        compatible =3D "rockchip,rk3588-iep2", "rockchip,rk3568-iep2";
> +        reg =3D <0x0 0xfdbb0000 0x0 0x500>;
> +        interrupts =3D <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&cru ACLK_IEP2P0>, <&cru HCLK_IEP2P0>,
> +                 <&cru CLK_IEP2P0_CORE>;
> +        clock-names =3D "aclk", "hclk", "sclk";

[Severity: Low]
In the properties block, the required list, and the example node, interrupts
is listed before clocks and clock-names. Could clocks and clock-names be
placed before interrupts in all three places to follow the standard DT
binding property order (compatible, reg, clocks, clock-names, interrupts)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121-iep2-v4-0-=
760cf25f322b@gmail.com?part=3D1
