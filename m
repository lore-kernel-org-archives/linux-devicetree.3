Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0DF3F4DEB
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 10:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786963781; cv=none; b=n3TjLnGVrLqSYRuWmUQg9DYrdQ9yer03isbcJcsJn9Hi63LJzDIMIKth1XEw6fIWhFtsVddhY2wEyKYtuhbG4kBRFsNVG0Mh6xJN0fbWyfBbBz7TeG5411P78wvSxDAixCkReukRMmIx5pW8fZWBb9IyB1aLDfjfbWYjYu/FcS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786963781; c=relaxed/simple;
	bh=4eB12YnmJ0LZ2FKXqb6nZVQxjVGBKNtib9ksQWF7g2I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hvfE1lj6bue5gzTiX/H2V5mPz8+0T1wjZWwcwdeDSIoPPHLmsNGC22OCbeJ+zgn0hF+1U5TwG86jY+VLHzMh+q/gLS5s0eq6B9XpONk4L25CjEThN7Ks5m3o8BcuzfPzWMqno/RmT12uQtJlDaLy9GvoFueinSB7dPOG0yM4Qes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EINCcgHM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EINCcgHM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C7A01F000E9;
	Mon, 17 Aug 2026 10:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786963777;
	bh=t+/DjiAPlr8Sf7NlP/0OtPQR0efDMe+5BTVvC3RVPi8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EINCcgHMP/pl9LpZyxUVYZgWpTGnLUKLdX88DHOkj6HHDXYw7yV/BaFjSsC9m1uju
	 JVJaf1ql7paG/wFQeT4vxhEg51LCjqvcmY3oP3UZlPTcoqNMuC72eNt0g4gAsu1nzk
	 Wc9+rRPPmJgjgQGGVjRMujbzX1FM8jT5wd16N59l/juR8ZWhmY9Si/PS53TaH/wvoN
	 HBidUM7GabdJ+GYZYxfDNCXQUtXxwpgYk847C+MRsjySujgnypi8g1we/PxohkR5Bg
	 pDJxXUm47tJJShE/FiFoGo7mszhkSTZjnJgeOP3RI8aFr/9KVlQno/PYNV/TwWY23A
	 Nb2+Vkax2Fxbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 3/8] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: linux-i3c@lists.infradead.org, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260817103844.2142802-4-lakshay.piplani@nxp.com>
References: <20260817103844.2142802-1-lakshay.piplani@nxp.com>
 <20260817103844.2142802-4-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 10:49:37 +0000
Message-Id: <20260817104937.7C7A01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The schema fails to restrict the allowed ports and properties fo=
r the 4-port hardware variants (P3H2440/P3H2441), allowing invalid configur=
ations.
- [Medium] The `reg` property constraints for child nodes (`i3c@[0-7]$` and=
 `smbus@[0-7]$`) use an invalid array-level constraint `items: - maximum: 7=
` which silently bypasses port index validation.
- [Medium] The hub acts as a parent to child bus nodes but does not mandate=
 `#address-cells` and `#size-cells` in its required list.
--

--- Patch [3]: [PATCH v15 3/8] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub su=
pport ---
commit 9450f00b16aca24baa4b725459c27c4b2ab2f58c
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support

This commit adds bindings for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2=
841)
multiport I3C hub family. These devices connect to a host via I3C/I2C/SMBus
and allow communication with multiple downstream peripherals.

> diff --git a/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml b/Doc=
umentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> new file mode 100644
> index 0000000000000..6b84ccd8ace0c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
[ ... ]
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,p3h2440
> +      - nxp,p3h2441

[Severity: Medium]
Should there be an allOf conditional block added to constrain the allowed
ports and properties for the 4-port variants?

The 4-port hardware variants are introduced here but lack conditional blocks
restricting their allowed ports, while the patternProperties later in the
schema unconditionally allows up to 8 ports.

Without an allOf block, device tree configurations that describe nonexistent
ports for the 4-port variants could silently pass schema validation.

> +      - nxp,p3h2840
> +      - nxp,p3h2841
[ ... ]
> +required:
> +  - reg

[Severity: Medium]
Should #address-cells and #size-cells be included in this required list?

Since the hub node acts as a parent bus to child target ports, omitting the=
se
properties allows device trees to define child nodes without proper address
sizing, which might bypass schema validation when they shouldn't.

> +
> +patternProperties:
> +  "^i3c@[0-7]$":
> +    type: object
> +    $ref: /schemas/i3c/i3c.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        description:
> +          The I3C HUB Target Port number.
> +        items:
> +          - maximum: 7

[Severity: Medium]
Does this constraint correctly validate the port index?

Because dt-schema parses reg as a matrix (an array of cell arrays), JSON
Schema only applies maximum to numeric types and silently ignores this
constraint on the array element. This could allow an out-of-range port numb=
er
to bypass port index validation.

To correctly validate the single cell, it might need to use maxItems: 1 and
nested items.

[ ... ]
> +  "^smbus@[0-7]$":
> +    type: object
> +    $ref: /schemas/i2c/i2c-controller.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        description:
> +          The I3C HUB Target Port number.
> +        items:
> +          - maximum: 7

[Severity: Medium]
Does this have the same validation issue as the i3c child node above?

Like the i3c node, this constraint might fail to validate the port index
because JSON Schema ignores maximum on array elements.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817103844.2142=
802-1-lakshay.piplani@nxp.com?part=3D3
