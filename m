Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7F647ACDE
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 13:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183354; cv=none; b=ug7TWP/irVVdO5Vyoa8VGJ0i5+cv3XcvbNOoXekh3VrRh0TooJUImNw325Vzu6XVFTINEWM0W+rZVnHmlC75J/YjXg8kVKZzZncN0iSGTIP3kGqlT50164vXkcYRzc3zstimBlaW6jlAR69Z8TYnOTlA9f5zXTg9bzjNJDquDLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183354; c=relaxed/simple;
	bh=sA6No51tO8CkFAGoU5h2VYnaU+QRoc80wmWv+Uitr1I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R8sY81RVJEcTgdJob0yH4zIhs+WSfkcQcWcX5Xe+dNFKCpYOcNi2EHzmcB50gtx38FM/nRgBht98Wc2KLk1f8mAYdRNx4Ak1V5sWSNvbZAbfjf3PXOQxpLBPG6lToqRvOAFn3J3UvPPWQEjxGedc9GO48AFWTRkKbEJ90wcBlP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KLfUBkDO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KLfUBkDO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC141F00A3D;
	Mon, 31 Aug 2026 13:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788183352;
	bh=xlNppav3VDK/cfFkOcF4GDAY6YZJ4oVqU2wlsjQrgtA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KLfUBkDO801OIpzJwGhzD7EK1D2Aen8rcM0BR1KuFoQU8UX7WX5Oo5aIDbiP2X78N
	 X8Zhulfhgtr1fZd+6fYNCtlqFg3jfe6HxVuDKURAWrXCBndRng6BPosDuNFxZ/Ry2U
	 SmE8E0lHNEj8KgGqJm4099e/jj0FadDmJAE/DuW6y7Lwgj4eqUeK9PZlNrEQSk11IK
	 Z5oXT1MEsMuYHQJN8Ven6SdKkYAuMGPR4BjUBhceBD6c/DbW6VRdexvoKjm/0ZYwnj
	 pmc02jYXFyR3rZUwLYdr8+L/KKtyuC52Umsxqx3lR+iRbJLsOpSQXc65gglWh8G/qa
	 bT1wdPSuWzhrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 02/22] dt-bindings: media: i2c: max96717: add
 support for I2C ATR
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260831-gmsl2-3_serdes-v16-2-4fa6e08bb514@analog.com>
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <20260831-gmsl2-3_serdes-v16-2-4fa6e08bb514@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 13:35:51 +0000
Message-Id: <20260831133552.2DC141F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Incorrect usage of `items` inside `reg` constraints for the `i2c@[=
01]` nodes, breaking validation.
- [Medium] The `i2c-atr` node fails to require `#address-cells` and `#size-=
cells`.
- [Low] The `anyOf` schema block for mutually exclusive properties is logic=
ally redundant and unnecessarily complex.
--

commit 1d618fec079831fd8bd91f81cfc0fb4aaa69293f
Author: Cosmin Tanislav <demonsingur@gmail.com>

dt-bindings: media: i2c: max96717: add support for I2C ATR

This commit adds I2C Address Translator (ATR) support to the MAX96717=20
bindings. It introduces new properties for `i2c-atr` and `i2c-alias-pool`=20
while maintaining compatibility with the existing `i2c-gate` approach.

> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.y=
aml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> index d1e8ba6e368ec..976f6dd2c164c 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> @@ -91,6 +91,30 @@ properties:
>        incoming GMSL2 link. Therefore, it supports an i2c-gate
>        subnode to configure a sensor.
> =20
> +  i2c-alias-pool:
> +    maxItems: 2
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

[Severity: Medium]
Does this node need to mandate `#address-cells` and `#size-cells` in a
`required` block?

Since the `i2c-atr` subnode expects addressable children (`^i2c@[01]$`),
this typically mandates the presence of `#address-cells` and `#size-cells`
on the parent node. Although the schema restricts their values, omitting
them from the `required` list could allow structurally invalid device tree
nodes missing these properties to pass validation silently.

> +
> +    patternProperties:
> +      '^i2c@[01]$':
> +        $ref: /schemas/i2c/i2c-controller.yaml#
> +        unevaluatedProperties: false
> +        properties:
> +          reg:
> +            items:
> +              minimum: 0
> +              maximum: 1

[Severity: High]
Are these `minimum` and `maximum` constraints placed correctly?

In `dt-schema`, the `reg` property is parsed as a `uint32-matrix` (an array
of tuples). By nesting `minimum` and `maximum` inside `items`, the schema
attempts to apply numeric constraints to the inner arrays (the tuples)
rather than their scalar values. In JSON Schema, numeric constraints applied
to arrays are silently ignored, which means invalid `reg` values like
`reg =3D <5>` will silently pass validation.

[ ... ]

> +allOf:
> +  - $ref: /schemas/i2c/i2c-atr.yaml#
> +
> +  - anyOf:
> +      - oneOf:
> +          - required: [i2c-atr]
> +          - required: [i2c-gate]
> +
> +      - not:
> +          required: [i2c-atr, i2c-gate]

[Severity: Low]
Is this `oneOf` branch logically redundant?

The `not` branch evaluates to true whenever at most one of the properties is
present, which entirely subsumes the `oneOf` branch (which evaluates to true
when exactly one is present). Because the `not` branch covers valid
configurations on its own, the `oneOf` branch appears to be unused and could
unnecessarily complicate the schema.

> +
> +dependentRequired:
> +  i2c-atr: [i2c-alias-pool]
> +  i2c-alias-pool: [i2c-atr]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-gmsl2-3_se=
rdes-v16-0-4fa6e08bb514@analog.com?part=3D2
