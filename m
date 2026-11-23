Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433347;
	b=FjWYXtFc2zsCO5v2bpk+v945cAIo6alJ1xz5SuSyo4mt4klrQck0ey4xiqbzCuVhOZvW
	 tEKFHRsQLXIsI1JZpXbz5NM/U1ifyl994jXttyV+OYaxfj+cZ+lyPpHyj36ivpTs74Rd0
	 itP5s9wyT4SQ4V9PV3vkvLWBr4/uAmVdICi+Ae9ss/pV5JFsg/tcGj5Gz+sqegqZESfoS
	 Lbx9YlNtQWZxtYmD64bXBvfCtv2fICdZbqP8UbsCcRj8f+z4uC7CaZX4Bum5zxxBZRskl
	 ADVIG8kHRat5vSf6LpcJQlHX8lXxBaeXvPiEMZo671gspRp95NxkoEGf7Togzss5bhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433347;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=830mryBf+S4z4NdNcoRBECCEEeSEM+9Zxm/wZE7aLHE=;
	b=QbWlWMscTkWNldNiu3vBFvnL7tQxN9MaP0Y6CcLn4RQ5jECdYhhDPWTnfnzPCGVy6rYO
	 YWWkdksPJgOSRJCwX75UtlWqRiE08Kdp/vMqauMNLTJlP04G7QzdzJ5Z+tpGv1rh6U8Io
	 7V+GL5oPnRcIJBFd7vP/lJjvjW2epUGC55ZLvEB/9NQETsNKjib0uVkBuTdjSsiaXGmKG
	 V5eflUIMGeDj7KdFz7si3WpdJuwVRI91XbPeala94bUExJN4O4Al3gUCaip43oyb87m5b
	 QPp10vKSsoHmwYGfjgy0Mns6VfIBdwksOrqIMz0Cz1olGbmnW00Z83SXB4N93uJoIPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ByJHnEOi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C41606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ByJHnEOi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 082C21F000D0;
	Mon, 23 Nov 2026 11:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795433347;
	bh=830mryBf+S4z4NdNcoRBECCEEeSEM+9Zxm/wZE7aLHE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ByJHnEOicXr3OLFkQ9GY1ufsngHFYVQNRZPqKHySaTZBHHj2T6p3B6w3+V2oTdHks
	 mI/sMIeUY4WglcFhu6HDiZB7a+WN5jMtaKUUQ0ZhuiPC8qY6JCFEpPrHN6avi2oTxL
	 4Th7F3KlTb2l8kYKfU39HJjARwNdDLA2Uu5TyegIvOiAUqbLKZTzKrDZhOEG5lHt76
	 3qPsc8ixVb2wbczgafR1W+8tCtvzMpAQxTaR1IuJSE3psWFeUl4IgMvtrO9lGFf78n
	 z/YB7nzpPPvjT8fQ3VRxfknVlytugQYv8pGpJ6sXB2PC1IhzGWocTOr8cGRu7TReKy
	 zQfqj/khNLzZA==
Message-ID: <sashiko-outbox-229137@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 1/3] dt-bindings: usb: snps,dwc3: describe two
 connectors on one HS data bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123110858.538884-2-xiaqinghuan@mail.ustc.edu.cn>
References: <20261123110858.538884-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261123110858.538884-2-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 11:29:06 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Low] dt-bindings: usb: snps,dwc3: missing endpoint schema under
  port@0
- [Low] dt-bindings: usb: snps,dwc3: contradictory oneOf and redundant
  mux rules
- [Low] dt-bindings: usb: snps,dwc3: missing maxItems: 1 on mux-controls
--

commit 8c045d25978eb49158ab677f01e251bc1c6cc636
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

dt-bindings: usb: snps,dwc3: describe two connectors on one HS data bus

This commit extends the snps,dwc3-common binding to describe two USB
Type-C connectors multiplexed onto a single High Speed data bus via
mux-controls and two endpoints under port@0.

> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml =
b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> index 6c0b8b6538246..7a9cb5a115a63 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> @@ -26,8 +26,49 @@ allOf:
>        $ref: usb.yaml#
>      else:
>        $ref: usb-xhci.yaml#
> +  - if:
> +      required: [mux-controls]
> +    then:
> +      # A multiplexed High Speed bus only makes sense when the controlle=
r is
> +      # dual-role and both connectors can switch their role independentl=
y.
> +      required: [ports, usb-role-switch]
> +      properties:
> +        dr_mode:
> +          const: otg
> +        ports:
> +          required: [port@0]
> +          properties:
> +            port@0:
> +              required: ['#address-cells', '#size-cells',
> +                         endpoint@0, endpoint@1]
> +              patternProperties:
> +                '^endpoint@[01]$':
> +                  required: [usb-role-switch, mux-state]
> +    else:
> +      # Without a mux the High Speed port keeps the generic graph port
> +      # binding, so single-connector controllers are described as before=
 and
> +      # the per-connector properties have no meaning.
> +      properties:
> +        mux-controls: false
> +        ports:
> +          properties:
> +            port@0:
> +              patternProperties:
> +                '^endpoint@[01]$':
> +                  properties:
> +                    usb-role-switch: false
> +                    mux-state: false
> =20
>  properties:
> +  mux-controls:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      Phandle to the multiplexer that selects which of the two connectors
> +      drives the controller's shared High Speed data bus, e.g. a
> +      "gpio-mux" controller.  Each connector is described by the endpoin=
t@0
> +      or endpoint@1 of "port@0", and the endpoint of that connector carr=
ies
> +      its own role-switch input and the "mux-state" it is reached in.

[Severity: Low]
Should mux-controls specify maxItems: 1 instead of repeating $ref:
/schemas/types.yaml#/definitions/phandle-array?

mux-consumer.yaml already defines the phandle-array type for mux-controls
globally, and without maxItems: 1 the schema leaves the number of mux
controllers unconstrained even though the binding describes a single
two-state multiplexer.

> @@ -411,9 +452,65 @@ properties:
> =20
>      properties:
>        port@0:
> -        $ref: /schemas/graph.yaml#/properties/port
> +        # The High Speed port carries the controller's HS data stream.  =
Two
> +        # receptacles sharing one HS D+/D- pair are two mux'ed data stre=
ams of
> +        # that one stream, so they are two endpoints of this port and no=
t two
> +        # ports.  A single-connector controller describes the plain "end=
point"
> +        # of the graph binding and is unaffected.
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
>          description: High Speed (HS) data bus.
> =20
> +        patternProperties:
> +          '^endpoint@[01]$':
> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +            unevaluatedProperties: false

[Severity: Low]
Does switching port@0 to /schemas/graph.yaml#/$defs/port-base without an
explicit properties: endpoint: schema leave plain endpoint nodes without
unevaluatedProperties: false?

In graph.yaml, port-base matches ^endpoint(@[0-9a-f]+)?$ against
endpoint-base, which intentionally omits unevaluatedProperties: false so
bindings can extend endpoint properties.  Because port@0 only sets
unevaluatedProperties: false on ^endpoint@[01]$, a single-connector
controller using a plain port@0/endpoint node can carry arbitrary
undocumented properties (including usb-role-switch or mux-state when
mux-controls is absent) without failing dtbs_check.  In addition, because
port-base evaluates any endpoint@[0-9a-f]+ node, port@0's
unevaluatedProperties: false does not reject endpoint@2, endpoint@3, or
specifying a plain endpoint alongside endpoint@0 and endpoint@1.

> +
> +            properties:
> +              usb-role-switch:
> +                type: boolean
> +                description:
> +                  This connector has its own USB role switch, registered
> +                  against this endpoint.
> +
> +              mux-state:
> +                $ref: /schemas/types.yaml#/definitions/uint32
> +                enum: [0, 1]
> +                description:
> +                  State of the High Speed data bus multiplexer which con=
nects
> +                  this connector to the controller.  The two connectors =
of one
> +                  controller must use different states.
> +
> +            required: [reg]
> +
> +            dependentRequired:
> +              usb-role-switch: [mux-state]
> +              mux-state: [usb-role-switch]
> +
> +        if:
> +          required: [endpoint@0, endpoint@1]
> +        then:
> +          # The two connectors must claim opposite mux states.
> +          oneOf:
> +            - properties:
> +                endpoint@0:
> +                  properties:
> +                    mux-state:
> +                      const: 0
> +                endpoint@1:
> +                  properties:
> +                    mux-state:
> +                      const: 1
> +            - properties:
> +                endpoint@0:
> +                  properties:
> +                    mux-state:
> +                      const: 1
> +                endpoint@1:
> +                  properties:
> +                    mux-state:
> +                      const: 0

[Severity: Low]
Does this oneOf fail validation whenever endpoint@0 and endpoint@1 are
used without mux-controls?

The else branch of if: required: [mux-controls] allows endpoint@0 and
endpoint@1 under port@0 while forbidding mux-state on them.  In JSON
Schema, a properties constraint evaluates to true when the property is
absent, so when mux-state is omitted both branches of this oneOf match at
the same time and oneOf validation fails.

Also, since the top-level if/then/else already requires both
usb-role-switch and mux-state when mux-controls is present and forbids
both when it is absent, dependentRequired here and mux-controls: false in
the else branch of if: required: [mux-controls] are redundant.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123110858.5388=
84-1-xiaqinghuan@mail.ustc.edu.cn?part=3D1
