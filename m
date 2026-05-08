Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C767D3358D6
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 18:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778265475; cv=none; b=IZn2q44+mTQ5WzSQqhdZmxtvBAYgIJ20pg6JoIr0JobqDmN/SGap8gr+K1sFYRUtGf0zcFb7KE6QCJJn8FrPHimvNydLXOknYx3tA0qLDvSCpeXMfsYNzJiQmg7yCJD+v4HATRt5BXzUEG0zl0wXglNMO+bg8ZstrdHKOo9W1Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778265475; c=relaxed/simple;
	bh=dDKnX8W8858KuZBpSwqiMnsOCh2eGR1sex5/JVgNRoM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y3uZhQmKUxgoFmJT/01eD3GyZxZtRVsmK8vwC+bm+h+RFi4Qgxajs/Jx1EawkOCd+fxeHrc6PpFln9BrMvUHblMw+6CqdVEMmqypsgpG4/lFj7FU508DXK6xcU7KNOX+aVo+4U4AIObVOTOJQPnCBBFlz9fzZ/57VS0BfUEE/FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UW6NC5Wh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UW6NC5Wh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C191C2BCB0;
	Fri,  8 May 2026 18:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778265475;
	bh=dDKnX8W8858KuZBpSwqiMnsOCh2eGR1sex5/JVgNRoM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=UW6NC5WhuoL8jiZhQdt94yAbCo198xiWLtwi/Yo0MfqcECCshQPT2EGPgQX+riqkS
	 Awq29LquHa65kB/958/6jlQiDdJnKDbDoynJ3GXHPPdpkkhPgWcYYvxEFwVJxhVj55
	 6JcjsbJHHnfMzuyLCLo9iKo4YLo+PWuH92l/ooghgvooer/JSKHzs5l1ypoj31BIUY
	 tuXJkwpJ6Ll6MJsH7VhxEApPzs3clvQxtIJFOppJfxUHBJZTpp51IpGN4Lfo9r5/qm
	 VfTl7j2ruok4bWXd18qpe1E2WeyzJF5CQZY4BDKJ/j6rNGJlGvMO3sManA/tbMwQOL
	 YFYJ5KWlCMKhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 02/15] dt-bindings: net: can: gaisler,grcan: Convert
 to DT schema
Reply-To: sashiko@lists.linux.dev
To: "Arun Muthusamy" <arun.muthusamy@gaisler.com>
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260508070121.6918-3-arun.muthusamy@gaisler.com>
References: <20260508070121.6918-3-arun.muthusamy@gaisler.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 18:37:54 +0000
Message-Id: <20260508183755.2C191C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The `gaisler,grhcan` compatible string is missing from the schem=
a.
- [Medium] Incomplete schema validation for required clock properties.
- [Low] Unused header inclusion in the device tree example.
--

commit e39872eda9f93cf639be07e78cd2690d6ce06614
Author: Arun Muthusamy <arun.muthusamy@gaisler.com>

dt-bindings: net: can: gaisler,grcan: Convert to DT schema

This commit converts the device tree bindings for Gaisler GRCAN, GRHCAN,
and GRCANFD CAN controllers from a text format to YAML format. It removes
the stale systemid property, makes freq optional, adds clocks, and provides
an example.

> diff --git a/Documentation/devicetree/bindings/net/can/gaisler,grcan.yaml=
 b/Documentation/devicetree/bindings/net/can/gaisler,grcan.yaml
> new file mode 100644
> index 0000000000000..8fea97c7319ad
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/can/gaisler,grcan.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/can/gaisler,grcan.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#

[ ... ]

> +properties:
> +  compatible:
> +    enum:
> +      - gaisler,grcan
> +      - gaisler,grcanfd

The commit message, title, and description explicitly state that the binding
supports the GRHCAN CAN controller, and the original text binding also
documented support for it.=20

Does this enum unintentionally omit "gaisler,grhcan"? Without it, device
trees specifying the GRHCAN hardware variant might fail schema validation.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  freq:
> +    $ref: /schemas/types.yaml#/definitions/uint32

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +

The original text binding required the freq property for the CAN controller
to operate. The new schema makes freq optional and introduces clocks, but
neither is required here.=20

Should the schema enforce that at least one clock source is provided using =
an
anyOf constraint, to prevent device trees lacking clock definitions from
silently passing validation?

> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    can@ff400000 {
> +        compatible =3D "gaisler,grcanfd";
> +        clocks =3D <&sysclock>;
> +        reg =3D <0xff400000 0x400>;
> +        interrupt-parent =3D <&plic0>;
> +        interrupts =3D <6>;
> +    };

This isn't a bug, but the example includes irq.h while the interrupts
property is assigned a raw integer <6>. Is this include necessary here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508070121.6918=
-1-arun.muthusamy@gaisler.com?part=3D2
