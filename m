Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795485750;
	b=IwTS7/u88ZbUV65lVg2G/Dj0STau29jkYLNhm3zvr1iDLJSWW/n8uZw47IYfj413CghY
	 1cR7XNa0LL8Iej2ephjPA6hV3QFkwb/845+Y/eL8u/vTVGARniDGNKrv55Z2tvYk1oDmc
	 2RN+WCm0ldUNMD7rkRAzIl4QRD1D9awb8QKWoFJ3IgD0lraSG3duv0Cik6DBt+1o2Ncf4
	 Z65WYbUtjRsD+30Y7kx171Bm510T9s8hw2W1FG/y44wjbf7Bhv4h9PfWonqVKnhEiWDEi
	 iQfzaqsjh72XVwY0Zv86C+Lvs/mh9zLunNU2zpejgPgbgvH8vErEve8/0vXK5/BPXhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485750;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Rz6Wja+P7WL+jPBSqK9f0WgDjHamb0qRBc39Gv4Al5Y=;
	b=PN+hb6/4U6wpR8dnG4RaqNJOL/al4ASxVkVzy1LlSezu4PvlRSsiv1+QEZnpLhNKsW1P
	 Yld0ss68y3E61Ryr+T8lB95587q7QOgfUf1DUFlAcEeiDoiE3xUiuUZTG25iqF5xwa7Hi
	 ls/KTIviPzZ0Wm5d4c8+Zof/1Hx9WUMkDUlNMmByRmeEOo8pHuXMPYiwIwFN/GYcOikQQ
	 cEZFIg//9pPo8JHHeoJa5VekNdtUJjHR/PS7ryYw0+v37UbY0BEMKrfH9Ks4nyGifZTat
	 +S8wncBB9cQTM32ASrEZptTAaUCmyBXFWDiKxp2awHd+GMdQwp/8BaqG76JBtcefuVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VSdpmqvA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B090F606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VSdpmqvA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F14951F000C4;
	Tue, 24 Nov 2026 02:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795485750;
	bh=Rz6Wja+P7WL+jPBSqK9f0WgDjHamb0qRBc39Gv4Al5Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VSdpmqvAZXfCF3qNNf81PM/ZHVVmcX421vZq1pIO0p3jpFL88xXQqarG5EoIBteMo
	 SukoQwxAt2/QSDtVUDATbW6f5mFGCI+SQdAUNbQp42Qbrij7p/O+HhXKhKSBAJwgCL
	 Whq4qwRzTJ5GrcW93AHvo3896S4r18JE559qXZ6/Yst+1CAXCiVXgHP8MRt/sc0xPZ
	 b4H1Cyx77ruDcmEgEFg/K8F0ZQsmjBJP1BY5Qh589M0OlCcFzIAU64JGsVeaIIpHIi
	 kX2dXDbP1WFgdtLGOoXHUTYkiCGidHr/n+D1a2xw2SuLUTIY2uHRdOBjYYmn0iiTM0
	 /uWFmirf13VDg==
Message-ID: <sashiko-outbox-230368@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 1/3] dt-bindings: usb: snps,dwc3: describe two
 connectors on one HS data bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124015002.1426767-2-xiaqinghuan@mail.ustc.edu.cn>
References: <20261124015002.1426767-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261124015002.1426767-2-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 02:02:29 +0000
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

commit 30bef4a2b887532802ddeda2f9088011cea77c35
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

dt-bindings: usb: snps,dwc3: describe two connectors on one HS data bus

This commit extends the DWC3 common DT binding to describe two USB
connectors multiplexed onto a single High Speed data bus via mux-controls
and endpoint@0/endpoint@1 under port@0.

> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
>
> Changes since v13:
>  - [sashiko, 2026-11-23, Low] "missing maxItems: 1 on mux-controls".
>    Accepted: the shared data bus is driven by one two-state multiplexer, =
so
>    "mux-controls" now says "maxItems: 1" instead of leaving the number of
>    mux controllers open.

[Severity: Low]
Should the "Changes since v13:" block be placed below the "---" separator
so it is not recorded in the permanent git commit log?

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
$defs/port-base drop unevaluatedProperties: false validation for plain
port@0/endpoint nodes when mux-controls is absent?

$defs/port-base matches ^endpoint(@[0-9a-f]+)?$ against
$defs/endpoint-base, which intentionally omits unevaluatedProperties:
false, and port@0 only sets unevaluatedProperties: false on
^endpoint@[01]$.  When mux-controls is absent, the else branch only
forbids usb-role-switch and mux-state on ^endpoint@[01]$, so a plain
port@0/endpoint node (or endpoint@2+) on a single-connector controller
accepts undocumented properties.  Also, in the mux-controls branch, the
pattern '^endpoint@([2-9]|[1-9a-f][0-9a-f]+)$': false omits single-digit
hexadecimal unit addresses a-f, allowing endpoint@a through endpoint@f.

Referencing $ref: /schemas/graph.yaml#/properties/port under port@0 in
the else branch and changing [2-9] to [2-9a-f] in the then branch pattern
would close both gaps.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124015002.1426=
767-1-xiaqinghuan@mail.ustc.edu.cn?part=3D1
