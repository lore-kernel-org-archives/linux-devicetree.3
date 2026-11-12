Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506935;
	b=B3zcO4kcB9PnjJj1o3Dt/wT3EeJD1nyYEaDlocbmziICbbO5zaPsj9E3LvRHLJoPkhwC
	 nBe7CaNWJ1Dv9YXz+JOUZA85MMaltRCf8/bYclIBZx+bYirapFCRvsevQuB3pFELfmZFL
	 FnuWtjiiCu/ebbZKeXnx+ZJp2jB3g5DWFK7ucVK8DNcGvu9DZKH/3/ZFeEHRVtQWXCSE5
	 H8g1OW3S5kY5yaS3NeE8RTsYbHADYfN5YaRgArS1ISZeUlfnwgeK+EwG/u/OhCZ3f5LDF
	 BXSsnbrxZvoaQYPw6oCFr6GZAWt3oaRYfsHFAfEoPNuwy2rVO+wURHk2P8Tt7/2GOMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506935;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QWw9k3pkTp1IeVpQY7p+/Hzksq4KiGfTghB9oxgN11U=;
	b=v9Ljv89xVf4+Ky32g58k19jMZdxMGkdH87gaQL83zp7MQzkk82gHw7v3B8fvHYYLYSB3
	 lOPXY7kojAtr9Dur8pI7R/Z+DB2SdVdEfaT4GeYTa+ABA2S/e+pAG7kY0wbMbWN1fyXHt
	 X6pMVDH4Y4cZ4OAK7zw/nt65vDzUhjrlGR2LYD+pdcOCTCOhYocYV7hf4QdjWBlfTrN73
	 spV64xQFjxyuHmdnp5fPRdfZuuU77cjMBsP7M91e5e66nF0EIICg67r9NWKhFN+uxQipU
	 fJUVREA5wmp6Vw2anmqzSSvNa1IxOffzJkw1ggQULQ7iB9tmZHJ3jh/v3W/LC6Isvxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mKJxUWCR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FDE606A321
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 18:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mKJxUWCR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B90B61F000C4;
	Thu, 12 Nov 2026 18:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794506935;
	bh=QWw9k3pkTp1IeVpQY7p+/Hzksq4KiGfTghB9oxgN11U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mKJxUWCRJcqY5WeTUS5DtbjQVstahNRCRJ0xXfHe5jExJfAB5k59BzeTsK5ZmryWg
	 99VFBTwWfJxhLbJqJi0SdI9ZCcJw6dauPPj9VD7+ADNqI7PG7UcAc2ZoO+Tns6Ff2y
	 SK2+etGvyJuArmhfhlgDPSkzEBO+UQw/zWA9UlYmaLYeoyvFis5U5gPzayyKitcL9C
	 fY+5804TLJ8qKsb2bYCppAKqLtXtcl8Tv5oEFvXhk7b+9Ch1rWi6Q8EEm1jXb2UMqL
	 Ayv5/m36Tc5PWzNMItKFAMb+FlCQf18ErKFFIA76oQbT39RZnprNNhXarPgqNQ3LFW
	 jQjcN3ZO3zpSg==
Message-ID: <sashiko-outbox-211666@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: bus: ti,omap3-l3-smx: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112-ti-l3-noc-v3-2-7281b1af8030@gmail.com>
References: <20261112-ti-l3-noc-v3-0-7281b1af8030@gmail.com>
 <20261112-ti-l3-noc-v3-2-7281b1af8030@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 18:08:54 +0000
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
- [Low] dt-bindings: bus: ti,omap3-l3-smx: non-canonical property order
  and example
--

commit 1d6cabb054788aa85ea27e9a6e910d618ff518a6
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: bus: ti,omap3-l3-smx: Convert to DT schema

This commit splits the TI OMAP3 L3 SMX interconnect binding out of
Documentation/devicetree/bindings/arm/omap/l3-noc.txt and converts it to a =
DT
schema under Documentation/devicetree/bindings/bus/ti,omap3-l3-smx.yaml.

> diff --git a/Documentation/devicetree/bindings/bus/ti,omap3-l3-smx.yaml b=
/Documentation/devicetree/bindings/bus/ti,omap3-l3-smx.yaml
> new file mode 100644
> index 0000000000000..11f0ebb0cdfc2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/ti,omap3-l3-smx.yaml

[ ... ]

> +properties:
> +  compatible:
> +    items:
> +      - const: ti,omap3-l3-smx
> +      - const: simple-bus
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: l3-dbg-irq
> +      - description: l3-app-irq
> +
> +  ti,hwmods:
> +    description: hwmod names for each domain.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    const: l3_main
> +    deprecated: true
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^.*@[0-9a-f]+$":
> +    type: object
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    l3-noc@68000000 {
> +        compatible =3D "ti,omap3-l3-smx", "simple-bus";
> +        reg =3D <0x68000000 0x10000>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +        ranges;
> +        interrupts =3D <9>, <10>;
> +        ti,hwmods =3D "l3_main";
> +    };

[Severity: Low]
Does the example pass scripts/dtc/dt-check-style --mode=3Dstrict?

Placing ranges after #address-cells and #size-cells in the example triggers=
 a
[property-order] warning from scripts/dtc/dt-check-style --mode=3Dstrict, as
Documentation/devicetree/bindings/dts-coding-style.rst orders properties as
compatible, reg, ranges, standard/common properties, and then vendor-specif=
ic
properties.  Per Documentation/devicetree/bindings/writing-schema.rst, the
properties and required sections should follow this same order (moving rang=
es
right after reg, and moving the vendor-specific ti,hwmods to the end of
properties).

Also, in the example, should the node name be a generic name such as
bus@68000000 (instead of l3-noc@68000000, which refers to the OMAP4+ Arteris
NoC) and omit the deprecated ti,hwmods property?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-ti-l3-noc-=
v3-0-7281b1af8030@gmail.com?part=3D2
