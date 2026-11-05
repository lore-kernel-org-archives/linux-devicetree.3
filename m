Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862968;
	b=WvZq2gN//TLYQOXeM3z3aRb6k4dLRhrojy3HeiNxm7eIDDcPgl6F5DttHrIhreQgW6lo
	 R1KZ80/w2kuK0UK0k7wEvMomtyIGQV27vTH/6fwATfhZa2NKKtVK4dgt1XPNjatqjGL1u
	 /Mm6wd6H6MdTqB9y0X5nBPig2nn0kP0tuu/igrVtobfYHt0dgmDtG+zTErveyhgj55EeR
	 bxv+ECyOIqjXFwLYtAnRU5wPMVMn6YeZSMxhHk0dkxFUeuw1CuY4rpPFB9hnpHgpLDg73
	 RKc0IkOUf243jBFdO8M77x7BCh9h5MjcH8ShYEuD2eeV5K8djwd/cj2ORSLz5Byxqgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862968;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+FmY+mgxFgqwkq7YPaDsVj4gsernncOhtiWLO4wZPi0=;
	b=Du+Y5oKl50hy1UN6yJkoxZCd9MlMyHs55Dcw72C4BTLjYcpSzjwsQZRq1nw18+npWso6
	 1h2oIM48MKEKiDRLy98nKKn6mJFk/2OzjM8Q7lWNYTkpehGutQN/lBcWW1lXlZXDV79eu
	 E9r5BGB56CqY7VIwWAMURHQrxuKpOI/t7mgqA4QxgLQF1gdXngp6Qg/e0xMhUmYzTwwIJ
	 GN9sjGfQy7uCrLUaBlXO2S4EKonCWwQAw7ljILK8FnpEHp53kOekP6IaXNc2YI8aIdQkn
	 I3CKBNjtpZr5ktPgtW23zdoWlJJhZXDGTtkdGKmAEoJvQiuK6xLWkTWcgRpshXD+WNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l5b4vtSV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7F3606A326
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 07:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l5b4vtSV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65FB71F000C1;
	Thu,  5 Nov 2026 07:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793862967;
	bh=+FmY+mgxFgqwkq7YPaDsVj4gsernncOhtiWLO4wZPi0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l5b4vtSV/90aJHUM3xrKMCIAqAO/NIuQ/jMMeVcTqfqqIDDN0R5GTkoyvbGadgBSP
	 +kYlVdgcWFEkvWTB2OYpLUjUUxIE56QSRfeRn+2+NlSn9cY2c6cj/joJup6tGyfxlA
	 CQEFPgjsFEaE5Q2u5n5+c/RvWRSNtz0vaG4rsPKnQc7Tpgk/iSsuv8PDT/EptfU+Zk
	 9EwICWm1oYQg8eph/ICuofTPf1C5zMLFykNgtg9i4vLbMQX1uOfST44UqXq5KqWaP2
	 UT9Ube4sAySuhBoXWo8t4aK7YXfn7KCba5o7RkTLF+vb+8OvG4Rtu5GQyKqr6UQmbE
	 3H40vehTv6O2A==
Message-ID: <sashiko-outbox-198649@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: dsa: lantiq,gswip: add
 reset-gpios
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104-mxl-gsw1xx-reset-v1-1-53839bf5c88e@telaak.dev>
References: <20261104-mxl-gsw1xx-reset-v1-0-53839bf5c88e@telaak.dev>
 <20261104-mxl-gsw1xx-reset-v1-1-53839bf5c88e@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 07:16:07 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: net: dsa: lantiq,gswip: split GSW1xx into separate sch=
ema
--

commit 436a7ee0b7ce4df05ec852987339de64af0a633a
Author: Joseph Telaak <joseph@telaak.dev>

dt-bindings: net: dsa: lantiq,gswip: add reset-gpios

This commit adds the reset-gpios property to the lantiq,gswip DSA switch
binding for standalone GSW1xx switches and disallows it on SoC-integrated
GSWIP variants.

> diff --git a/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml =
b/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml
> index 49af5573e452d..9a74ea2a6dcdd 100644
> --- a/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml
> @@ -40,6 +40,11 @@ properties:
>        - const: mdio
>        - const: mii
> =20
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO connected to the hardware reset input of a standalone switch.
> +
>    mdio:
>      $ref: /schemas/net/mdio.yaml#
>      unevaluatedProperties: false
> @@ -173,6 +178,7 @@ allOf:
>          mdio:
>            required:
>              - compatible
> +        reset-gpios: false

[Severity: Low]
This isn't a bug, but Documentation/devicetree/bindings/net/dsa/lantiq,gswi=
p.yaml
combines two distinct hardware integration models: SoC-integrated MMIO
switches (lantiq,xrx200-gswip, lantiq,xrx300-gswip, lantiq,xrx330-gswip) and
standalone MDIO-attached switches (intel,gsw150, lantiq,peb7084, and
maxlinear,gsw1xx).

Because these two families sit on different buses and use different resourc=
es,
nearly every top-level property outside compatible and ports (reg, reg-name=
s,
mdio, gphy-fw, and now reset-gpios) has to be conditionally constrained or
disallowed in the allOf if-then-else block:

  if:
    properties:
      compatible:
        contains:
          enum:
            - lantiq,xrx200-gswip
            - lantiq,xrx300-gswip
            - lantiq,xrx330-gswip
  then:
    properties:
      reg:
        minItems: 3
        maxItems: 3
      mdio:
        required:
          - compatible
      reset-gpios: false
  else:
    properties:
      reg:
        maxItems: 1
      reg-names: false
      gphy-fw: false

Instead of adding more variant-specific exclusions to this conditional, wou=
ld
it make sense to split the standalone GSW1xx and SoC-integrated GSWIP bindi=
ngs
into separate schema files?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-mxl-gsw1xx=
-reset-v1-0-53839bf5c88e@telaak.dev?part=3D1
