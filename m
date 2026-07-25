Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B06F3563D4
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 16:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784997055; cv=none; b=gSjtIfM70nn6R9iSht8v/IiJCWlfeI59q/cCKaqkk48vsujB3O+RhM96WrOvSen3Z5QgDTNRV/oCY213XvMESoZy5ACNli1HAIVgl1G0jSw1RAl3ku4IUBEjQfxc0AGZU3xLDVM7QqDbT0U5OfOzGhPfGkzUIoIr6ThkgfhaDUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784997055; c=relaxed/simple;
	bh=w2QGMzCF92cahn4ZcSGGdK/v/k6TvdJUIiEwp6yznts=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rfv8LiFPkm/IVf4PyBLnR8D3iuHcZa4R3gTiTa2nFrsqoYSIPSyfg5mQOwEMu5/YDBuj7up9sl4j30OoI7nzjKjhg/BrGu9oC89GcBzhhtQoHYdBKEHFE0reU0Jg1UwVpec8SxlCiXkqdZHk92PmMhFlb/Hx51f+0CFvfUu+x7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UhwbBUJ+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UhwbBUJ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B8591F000E9;
	Sat, 25 Jul 2026 16:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784997053;
	bh=ewdGBnobjQGqnGmcnS0zWnQb186lT/c08OKu1s1Y3Qo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UhwbBUJ+Gu5lhYaRGhh0Mhg4fTBpwJSsA2XNGbxekwx2HZZC6UnHqdV4J0xEZU7ry
	 sbdHx1cvMpgcrZwBCL/Ud2fdUqN7JVlnPg4+rglYNFfCkDxACh5FE2PCCAeS8mtOVv
	 cp4TmKbzbC6rCZusQeRZOqG368x3A7p37Rsrtx/T/D5QQPUBtP0IyWhZgQXJoxZHZX
	 BA0IGm6L7D1roFY+X3zrYZjqzJiK/q/kM1IqPhVRWlxqALqAYzIcDZG8osCbgxwBsI
	 lMN3b4DAtR9ZRSWc4u9jmXL9Ib9a4e+JGmzNOVEMee4miPrfJQ+V44oeOvFEr1BIYi
	 JUQedDUe1KwgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: tps6598x: Add sn201202x/ACE3
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260725-tipd-ace3-v1-1-73202d36138a@chaosmail.tech>
References: <20260725-tipd-ace3-v1-0-73202d36138a@chaosmail.tech>
 <20260725-tipd-ace3-v1-1-73202d36138a@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 16:30:52 +0000
Message-Id: <20260725163053.7B8591F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `wakeup-source` property is missing from the binding schema =
despite the hardware supporting wake-up.
- [Low] The `reg` property lacks a `maxItems` boundary constraint.
--

--- Patch [1]: [PATCH 1/3] dt-bindings: usb: tps6598x: Add sn201202x/ACE3 -=
--
commit 9a24f811e68db136afd48ea26f05ded70940e705
Author: Sasha Finkelstein <k@chaosmail.tech>

dt-bindings: usb: tps6598x: Add sn201202x/ACE3

This commit adds a binding for the sn201202x, a variant of the tps6598x
Type-C Power Delivery controller attached to an SPMI bus on Apple M3 device=
s.

> diff --git a/Documentation/devicetree/bindings/usb/apple,sn201202x.yaml b=
/Documentation/devicetree/bindings/usb/apple,sn201202x.yaml
> new file mode 100644
> index 0000000000000..84d230ccccc7f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/apple,sn201202x.yaml
> @@ -0,0 +1,78 @@

[ ... ]

> +properties:
> +  compatible:
> +    enum:
> +      - apple,sn201202x
> +
> +  reg:
> +    minItems: 1

[Severity: Low]
Is a maxItems constraint also needed here?

Without a maxItems limit, the schema might silently accept device trees with
multiple register region entries, even if only one is expected on the SPMI
bus.

> +
> +  interrupts:
> +    items:
> +      - description: Primary irq used for tps6598x events
> +      - description: Logical register selection completed
> +      - description: Standby command completed
> +      - description: Wakeup command completed
> +
> +  interrupt-names:
> +    items:
> +      - const: irq
> +      - const: select
> +      - const: sleep
> +      - const: wake
> +
> +  connector:
> +    $ref: /schemas/connector/usb-connector.yaml#

[Severity: Medium]
Should a wakeup-source property be declared in this properties block?

Because the hardware supports a dedicated wake interrupt, the tps6598x driv=
er
will likely query the wakeup-source property. Since additionalProperties is
set to false below, any board device tree that properly defines wakeup-sour=
ce
will trigger validation errors during dt_binding_check.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260725-tipd-ace3-=
v1-0-73202d36138a@chaosmail.tech?part=3D1
