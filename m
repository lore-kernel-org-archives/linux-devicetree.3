Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795496665;
	b=Uhe5LcIMA/Vgwq9kghWqnF22D/7j7rX64tPBCuzHFXfrFcgtaQdXtCkjOg6wfZSMxtmE
	 8HsdrQY9nWZg4bMDGUG/UrAwQRFaRlPWqP1CJDmvNehilnBYz53RR7/3+q5k/Er9g2s3p
	 XTD5k1l1XehrKBjI+j165rbVb+9o2kWNC/cUSMHU67S8Fy3G9z5AkuuPuW4nL91jHNJUD
	 2V+oULxMKxrcuLLErTjMvEGARYvBUPW7om0ZkVOWXK9wD5rDyvSTrHjNl0z8dgfh4PGfE
	 Fj5v0aV/OvbYZtxMnpH8MAIm45z7EVruG4bWQbgEXd5/KQMQmtRmOkcbJoHdCNNfxCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795496665;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ETfUuQ4AxtqGcr2y0rbBxz81oQugOgatUAkUJjgjwaQ=;
	b=RrOwRctp0WfB754ZBkj8tMQiFfMpkNz7Dz9VpQS2PJHaIfi+QU/rzdYKJlrJ9ejxbffN
	 7BbHuzgSUNm1hVfCSDETzwZJgflupMFRlBHuHl0z4TP0ZX8QD/xh1PMxp1gDLeAhq/V9k
	 QIKoF2vxI+qjEwVUXNEYSx+IvLkiAgUkWHM5nnqTPnnfoqZHz9Q1bYr4fSbjCGMZUFw/Z
	 jI3SeIGde/PNIiI7fEn3987wD5xRiAI5MwaujzB8fr07n/zQNzDBFux6bDDqk1acIbl9B
	 lcrBwSmiqFlnrzDVDT1s5wzBHrXWZTrME5wwJfEtVGKFZn7GDtNirLbYpHRk0PpFPPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eAo62ulL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89887606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 05:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eAo62ulL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 022561F000C4;
	Tue, 24 Nov 2026 05:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795496665;
	bh=ETfUuQ4AxtqGcr2y0rbBxz81oQugOgatUAkUJjgjwaQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eAo62ulLQsv26ryTxGdnaQvc0iIkGLINEddpESEWYQPb9kO/W4BAanE4CouWjYfG6
	 SZNn3wIAhPrvRuxSVcoFRzSp+XPeyWZbBKUyU9VaHH60LBrAm3gImIEB1koInLhllG
	 J0cJ1IfM2eszf5GsV79oVTg4W+541y1cVhHPUu6m4XeVjtnRGgcT2u8cwBSYbeYiUd
	 gkIh1PNGWUo1cw4YaxkkkIW9vdpsLF1l29HA9+CK/TYYQgllcJEJbjYwO+U6pJt39D
	 5jSCaZnGM58pcnItBJLe+eVdxhyDwBbmIJB2lf6dVdO9c+ZuOTn3kKOctz4+oKq2et
	 LMoNl5c2xyt5w==
Message-ID: <sashiko-outbox-230542@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 1/3] dt-bindings: usb: snps,dwc3: describe two
 connectors on one HS data bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124045220.595001-2-xiaqinghuan@mail.ustc.edu.cn>
References: <20261124045220.595001-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261124045220.595001-2-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 05:04:24 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] dt-bindings: usb: snps,dwc3: incomplete endpoint schema under
  port@0
- [Low] dt-bindings: usb: snps,dwc3: inter-version changelog above
  tearline
--

commit a41b1c93c04ec4bc1b950cdd403b91ade72e5b65
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

dt-bindings: usb: snps,dwc3: describe two connectors on one HS data bus

This commit updates the common DWC3 binding schema to describe two USB
connectors multiplexed onto a single High Speed data bus via a mux
controller and two OF graph endpoints under port@0.

> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
>
> Changes since v13:
>  - [sashiko, 2026-11-23, Low] "missing maxItems: 1 on mux-controls".
>    Accepted: the shared data bus is driven by one two-state multiplexer, =
so
>    "mux-controls" now says "maxItems: 1" instead of leaving the number of
>    mux controllers open.

[ ... ]

[Severity: Low]
Should the "Changes since v13:" revision log be moved below the "---"
tearline separator so that git am does not record it in the permanent
commit message?

> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml =
b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> index 6c0b8b6538246..dcfa8c3a81c51 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> @@ -26,8 +26,78 @@ allOf:
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
> +              # A mux'ed High Speed bus has exactly two connectors, as t=
he
> +              # two endpoints of this port; a plain "endpoint" or any fu=
rther
> +              # endpoint would be a third data stream and is not describ=
ed.
> +              properties:
> +                endpoint: false
> +              patternProperties:
> +                '^endpoint@[01]$':
> +                  required: [usb-role-switch, mux-state]
> +                '^endpoint@([2-9]|[1-9a-f][0-9a-f]+)$': false

[ ... ]

> +    else:
> +      # Without a mux the High Speed port keeps the generic graph port
> +      # binding, so single-connector controllers are described as before=
 and
> +      # the per-connector properties have no meaning.
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              patternProperties:
> +                '^endpoint@[01]$':
> +                  properties:
> +                    usb-role-switch: false
> +                    mux-state: false

[ ... ]

> @@ -411,9 +481,37 @@ properties:
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
Does switching port@0 from /schemas/graph.yaml#/properties/port to
$defs/port-base leave plain port@0/endpoint (and endpoint@2+) without
unevaluatedProperties: false when mux-controls is absent?

In dtschema, $defs/port-base validates ^endpoint(@[0-9a-f]+)?$ against
$defs/endpoint-base, which intentionally omits unevaluatedProperties:
false so bindings can extend endpoint properties.  Because port@0 only
sets unevaluatedProperties: false on ^endpoint@[01]$ and the else branch
only forbids usb-role-switch and mux-state on ^endpoint@[01]$, a single-
connector controller using a plain port@0/endpoint node silently accepts
undocumented properties (including usb-role-switch and mux-state).

Also, in the then branch, '^endpoint@([2-9]|[1-9a-f][0-9a-f]+)$': false
omits single-digit hexadecimal unit addresses a through f, allowing
endpoint@a through endpoint@f when mux-controls is present.  Referencing
$ref: /schemas/graph.yaml#/properties/port under port@0 in the else
branch and changing [2-9] to [2-9a-f] in the then branch would close both
gaps.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124045220.5950=
01-1-xiaqinghuan@mail.ustc.edu.cn?part=3D1
