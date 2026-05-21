Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115A0211A28
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368514; cv=none; b=o5eA1f2xARNObMTmSS4ui8rKOotgnGBzeQm2/0ZbPrRRXpmgtVu1oPP/CAcUYTZNaP+UI0cAxsyufR3gHYH6pDMOjEKu2znmcMWCQNhpAuPwD8AS528G04SY0N2Wp30reRHvSW3xVrXQhno+ZK8o0UoTI3QU4vAwPHNRnZOEPUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368514; c=relaxed/simple;
	bh=gSyFPIMzW7gGnFyTa4xUj2rjKmbvbOkD/5CKgfmGfm8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hXEOxFKtEy69dh/dlTI/yStOaQt+KQbJ9MSrWJ0jZs6yc4VheQMeVCOI42C9a/cuHp3/Z21ouLvd1jaBZohCd41bfqrKHNUd1odus/ANGbMJ+IYJDVVH7QoOca7Dax9DNEJXvOt/FkjB/1KT57w9+liE3tY3LqI1hOLhoBXuPdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kReNXSZW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kReNXSZW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3241F000E9;
	Thu, 21 May 2026 13:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779368512;
	bh=1F1KQJnBnmm78CU8BUiRf5d67L+UrBywzgLO5QErMiU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kReNXSZWwS+dIbz4jefL8yBDUGoSCjd3TYDacByHT9kF8242f5Cijjt5QQ8VD7TvP
	 ORLzdmFLO9cU1DzsViHNoy0MEQBj1ut+Jmvwp7gPm6UBIbVtNp26vf5O+gLdLEkRsX
	 zEXxzK16ycfTZCzpxipTbsP1icFOamurc4EpvBHO3NXUdpUxjQCCt8pMGRQbsmy/jf
	 A62k+rfWUYrnY7ah/pI/Fvc4tu4a3lzdSUNdujbbEaCBYmWM5roMupIisfc9q+R0Pq
	 8gfyNsYyki9X0kWTr19VApn76dg5xBbTW2ez0HF27HmzRsZ6rcsyhFTq5K2Dsd0onI
	 mKQla5sY+Jtzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 12/22] dt-bindings: media: i2c: add MAX9296A,
 MAX96716A, MAX96792A
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan via B4 Relay" <devnull+dumitru.ceclan.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260521-gmsl2-3_serdes-v12-12-b26d92931196@analog.com>
References: <20260521-gmsl2-3_serdes-v12-12-b26d92931196@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 13:01:52 +0000
Message-Id: <20260521130152.BD3241F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [Medium] The i2c-alias-pool property is restricted to a maximum of 2 item=
s, breaking support for standard camera topologies.
- [Medium] Validation constraints for endpoint nodes can be bypassed becaus=
e they are defined as literal properties rather than a pattern.
- [Medium] Missing if-then conditional restrictions for the single-link MAX=
96716A variant.
- [Medium] Missing interrupts property for the INTB pin.
- [Medium] Missing gpio-controller capabilities in the schema properties.
- [Low] The i2c-atr node omits #address-cells and #size-cells from its requ=
ired list.
- [Low] The i2c@[0-1] child nodes omit the reg property from their required=
 list.
- [Low] Invalid JSON Schema constraints applied to the reg property inside =
i2c@[0-1].
- [Low] Incorrect use of additionalProperties: false with an allOf $ref.
--

commit 876d721dbaadb4f3d383ec8e1a846d525f5e14ea
Author: Cosmin Tanislav <demonsingur@gmail.com>

dt-bindings: media: i2c: add MAX9296A, MAX96716A, MAX96792A

This commit introduces the device tree bindings for the Maxim MAX9296A,
MAX96716A, and MAX96792A GMSL2 to CSI-2 deserializers. It defines properties
for ports, i2c alias pool, i2c-atr, and GPIO powerdown.

> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.y=
aml b/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
> new file mode 100644
> index 0000000000000..de6bfcec5dc63
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
> @@ -0,0 +1,242 @@

[ ... ]

> +properties:
> +  compatible:
> +    enum:
> +      - maxim,max9296a
> +      - maxim,max96716a
> +      - maxim,max96792a
> +

[Severity: Medium]
GMSL deserializers such as the MAX9296A typically feature an interrupt pin
(INTB) used to signal events to the host SoC. Because the schema strictly
enforces additionalProperties: false at the top level and omits the
interrupts property, will valid device tree nodes that specify an interrupts
property to describe this hardware connection be erroneously rejected by the
schema validator?

[Severity: Medium]
Maxim GMSL2 deserializers, including the MAX9296A, incorporate GPIO
capabilities. The schema omits gpio-controller and #gpio-cells from the
properties block. Will device trees attempting to use the deserializer as a
GPIO provider fail validation? Should these properties be allowed by the
schema to accurately reflect the hardware's capabilities?

> +  reg:
> +    maxItems: 1
> +
> +  powerdown-gpios:
> +    maxItems: 1
> +    description: Specifier for the GPIO connected to the PWDNB pin.
> +
> +  port0-poc-supply:
> +    description: Regulator providing Power over Coax for GMSL port 0
> +
> +  port1-poc-supply:
> +    description: Regulator providing Power over Coax for GMSL port 1
> +
> +  i2c-alias-pool:
> +    maxItems: 2

[Severity: Medium]
A dual-link GMSL deserializer like the MAX9296A connects to two serializers,
each potentially having multiple sensors or other I2C clients. The Address
Translator (ATR) needs an alias for each remote client. A basic configurati=
on
with 2 serializers and 2 sensors requires at least 4 aliases. Does
restricting i2c-alias-pool to maxItems: 2 limit the system to a maximum of
two remote I2C clients, causing valid hardware configurations to incorrectly
fail schema validation?

> +
> +  i2c-atr:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      '^i2c@[0-1]$':
> +        $ref: /schemas/i2c/i2c-controller.yaml#
> +        unevaluatedProperties: false
> +        properties:
> +          reg:
> +            items:
> +              minimum: 0
> +              maximum: 1

[Severity: Low]
The i2c-atr object defines child nodes with unit addresses (^i2c@[0-1]$).
According to Device Tree specifications, any node with unit-addressed
children must define #address-cells and #size-cells. While these properties
are defined in the schema block, they are not marked as required. Will
structurally invalid device trees missing these properties incorrectly pass
schema validation?

[Severity: Low]
The core DT schema defines reg as a matrix (an array of arrays). Applying
items: { minimum: 0, maximum: 1 } directly under reg applies numeric bounds
to the inner arrays themselves rather than their contents. Should the inner
array bounds be formatted correctly, or should we simply rely on the unit
address regex and standard dtc checks to avoid a JSON schema type mismatch?

[Severity: Low]
The i2c@[0-1] child nodes contain unit addresses in their names. Device tree
specifications require nodes with a unit address to have a matching reg
property. The schema defines the reg property for these nodes but fails to
list it in a required array. Can configurations omitting the reg property
incorrectly pass schema validation?

> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    patternProperties:
> +      '^port@[0-1]$':
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: GMSL Input ports 0-1
> +
> +      '^port@[2-3]$':
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: CSI-2 Output ports 0-1
> +        properties:
> +          endpoint:

[Severity: Medium]
Under port@[2-3], constraints like data-lanes are applied using properties:
endpoint:. However, the standard port-base schema allows endpoints with unit
addresses, such as endpoint@0. If a device tree uses endpoint@0, it will not
match the literal endpoint key, completely bypassing all defined constraint=
s.
Should the schema use patternProperties: "^endpoint(@[0-9a-f]+)?$" to
ensure constraints apply to any valid endpoint node?

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - ports
> +
> +additionalProperties: false

[Severity: Low]
The schema includes an allOf block referencing /schemas/i2c/i2c-atr.yaml#,
but uses additionalProperties: false at the top level. According to dt-sche=
ma
writing guidelines, unevaluatedProperties: false must be used when importing
other schemas via allOf. Does using additionalProperties restrict validation
only to the explicitly listed local properties, breaking inheritance?

> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-atr.yaml#

[Severity: Medium]
The MAX96716A is a single-link device, unlike the dual-link variants.
However, the schema unconditionally allows port@1, port1-poc-supply, and the
i2c@1 child node for all compatible strings. Without an if-then block
restricting these secondary link properties for maxim,max96716a, could
incomplete or incorrect device trees defining a second link for the
single-link hardware improperly pass schema validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-gmsl2-3_se=
rdes-v12-0-b26d92931196@analog.com?part=3D12
