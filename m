Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB1D54774
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 22:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786918781; cv=none; b=FJCTVHOMc3XCJQ2U+NO4pBB3VMjOgmdNBez9wuhTEv+9okDkMau2NNYGZRvKsl2BZMBAiVWYe0tbnJakQBdXYVQS+QWliwcc0PzWK03j8JV63LgP646dyJjHuCRcVvrjEyrZBEhMTyN7Ex/8Vnbti1PClBV/h1kB//J0qvEc/Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786918781; c=relaxed/simple;
	bh=Gilbo3I/gaq9gWUDHscZZB2WuH0b2XHPjRJf432rCfs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nGktmbbH3kYvC2dkWFQVwBLiiEZaFJb3/Mu4onFH86Xn65LUu2bc9Rn/nAtwA4XOkZwyFUWAFoG/QXQPr36NRN5nehDq1zFhuAUsndtzf0BPYgG6aoLbBafbHGfXDpSK972SFRLTqdczlP78BVRoqeLB5lV+rNVzavc11cp9tAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i4UC0bXP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i4UC0bXP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F111F000E9;
	Sun, 16 Aug 2026 22:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786918780;
	bh=vGE8WhN3TGJoOMRlmICfj0csaZWwfnxKprzj99mjZuY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i4UC0bXPhEITEc9yu3oByL4bt9tOuPnPNSRnyUQPxwv1RjPaozZu6ao4RFitRCUx9
	 crfkGJv5m0QMpzPEuyyZyK9FrVLAlJJgxJMQKAB1hk8Dzug1IZV9HBVfNYiBcTprB2
	 8nfOKlVHXi78jUzAgsx/7zbj0EXwvfzw1gx11k5i3IvGvqmCzKWK9z9+/X0CPEOD1L
	 efxqMQGK+Mf3MCNFigIxvKJVY3kM6Ukt16L6bpC0ImSuc2qTVlN0Eok1upkXFKSf93
	 GY5PfrS9JIOU1eNPWwOrdYAV+Cw6IerFG/TlZOwWoxec7ylJZTPhIQ1C4nFidSttYl
	 wmhunVOjRG5Aw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 2/3] dt-bindings: dpll: add SiTime SiT95316
 clock generator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260815221919.64226-3-arouhi@sitime.com>
References: <20260815221919.64226-1-arouhi@sitime.com>
 <20260815221919.64226-3-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 22:19:39 +0000
Message-Id: <20260816221939.B4F111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The DT binding example uses a VCO frequency that falls outside the =
hardware's documented valid bands.
--

--- Patch [2]: [PATCH net-next v7 2/3] dt-bindings: dpll: add SiTime SiT953=
16 clock generator ---
commit 410e36c99d7032772301b076a8bb386cf2186fe9
Author: Ali Rouhi <arouhi@sitime.com>

dt-bindings: dpll: add SiTime SiT95316 clock generator

This commit adds device tree binding documentation for the SiTime SiT95316
and SiT95317 DPLL clock generators.

> diff --git a/Documentation/devicetree/bindings/dpll/sitime,sit95316.yaml =
b/Documentation/devicetree/bindings/dpll/sitime,sit95316.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dpll/sitime,sit95316.yaml
[ ... ]
> +  sitime,pll-fvco:
> +    $ref: /schemas/types.yaml#/definitions/uint64-array
> +    minItems: 4
> +    maxItems: 4
> +    description:
> +      Per-PLL VCO frequency in Hz for PLLA, PLLB, PLLC, PLLD.  Neither
> +      standard frequency suffix fits.  The VCO bands are 4915.2 MHz to
> +      5898.24 MHz and 6875 MHz to 7812.5 MHz, so every valid value
[ ... ]
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        dpll@68 {
> +            compatible =3D "sitime,sit95316";
> +            reg =3D <0x68>;
> +            clocks =3D <&xo2>;
> +            clock-names =3D "xtal";
> +            reset-gpios =3D <&gpio 78 GPIO_ACTIVE_LOW>;
> +            interrupts =3D <12 IRQ_TYPE_LEVEL_LOW>;
> +            dpll-types =3D "eec", "eec", "eec", "eec";
> +            sitime,pll-fvco =3D /bits/ 64 <6251500000 0 0 0>;

[Severity: Low]
Does the example VCO frequency of 6251500000 (6251.5 MHz) fall into the
unsupported gap between the two valid operating bands?

The property description defines the valid bands as 4915.2 to 5898.24 MHz
and 6875 to 7812.5 MHz. Is there an additional supported frequency range
missing from the description, or should the example be updated to use a
value within the documented hardware limits?

> +            sitime,output-pll-map =3D <0 0 0 0 0 0 0 0 0 0 0 0>;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260815221919.6422=
6-1-arouhi@sitime.com?part=3D2
