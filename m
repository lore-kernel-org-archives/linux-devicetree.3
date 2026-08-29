Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3F3288C96
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 20:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788034502; cv=none; b=btMrTzXbNgBY+Dueq7Jph1mZ3ma+Is4fZ4YKXnCmHTEJTUeoICqUeZpzvTT2yv3OO4GaNL4Tz+UNwaMVNGqK3e8+MbhVyZLQm3tES/2AcaohKPZTWiQFZBIiqXnvGkijmjzlinRoRuI7VoF3/j6pFOhs//PT/IbKkfrgDNwdrC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788034502; c=relaxed/simple;
	bh=4+pKllXM3BFaV1ndWHNmBuZ4V+c3gm0CkRx3v4nIIo8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eiRtW6XG0vN2SHJLHKFJ7ZWwopfVdm8+PgnXHo53HawQU3EEUAAZlqDpaHGEgEEDCUBFeZEewxnrrBre6386PXmM5MW8fpXqXbXuFvpjWxogN9y4JEgFPEzDqrRTs/RZDGGx0au//ahMn6piflWlAqcXn1sr/9PZB6iVuBFFPbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X8UMeXiI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X8UMeXiI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 796D31F000E9;
	Sat, 29 Aug 2026 20:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788034500;
	bh=Z9HSNJCOp0EkaUL1Ll5zvr9SQQscvbVTNrjXTlkBLZ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X8UMeXiIAxoylA2bji2rjLpVXfzbyue/PJShZBX1wuo6LA/z1OF7FR9AvJm0ArHjQ
	 wtDbPK6UsW63/IdR4DgGkAa3iIbfLV6dl790/lwasOs1Kyj0NCybzJkds1nAvJJFv6
	 piNR0+WbYbEGvFxG/4MwGnn03J+REgo8P4mAL3fM8OR5ehnzdo4qKmw8uEtjIkDMR3
	 swJd3oqEyJbUzEMyyg9C+bJreoW0KVSq7suiaYQGSkTcyV/l9KjU3djJGIMWN4dGFP
	 WwQPVn6JJXN/OsbyZtcGh/mManb7xD2H4nGCiusTg7UPZ/wz+Fp+w0fVDBO/WRlIvp
	 tC2PgzmY3um4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 1/2] dt-bindings: display: panel: Add bindings for
 Novatek NT51021
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nickolay Goppen" <setotau@mainlining.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20260829-qcom-novatek-nt51021-panels-v1-1-cc1ca61bd261@mainlining.org>
References: <20260829-qcom-novatek-nt51021-panels-v1-0-cc1ca61bd261@mainlining.org>
 <20260829-qcom-novatek-nt51021-panels-v1-1-cc1ca61bd261@mainlining.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Aug 2026 20:14:59 +0000
Message-Id: <20260829201500.796D31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Commit message and schema description contradict the schema's co=
mpatible list by claiming to only support 'boe,tv101wum-nx0' while silently=
 including 'boe,tv080wum-nx2'.
- [Medium] The description for `reset-gpios` incorrectly specifies the pola=
rity as '(active high)', which contradicts the example and typical panel re=
set semantics.
--

commit 4949971c710c300054975d637c238b42bc5c2c75
Author: Nickolay Goppen <setotau@mainlining.org>

dt-bindings: display: panel: Add bindings for Novatek NT51021

This commit introduces device tree bindings for the Novatek NT51021 display
driver IC. It explicitly states support is added for the BOE TV101WUM-NX0
WUXGA video mode panel.

> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt51=
021.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt51021.=
yaml
> new file mode 100644
> index 0000000000000..a3e4ed10e645d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
> @@ -0,0 +1,93 @@
[ ... ]
> +description: |
> +  The NT51021 IC from Novatek is a generic DSI Panel IC used to drive dsi
> +  panels.
> +  Right now, support is added only for a BOE WUXGA LCD display panels wi=
th a
> +  resolution of 1200x1920. They are video mode DSI panels.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - boe,tv101wum-nx0
> +          - boe,tv080wum-nx2

[Severity: Medium]
The commit message and the schema description state that support is added
only for the BOE TV101WUM-NX0 panel, but this adds boe,tv080wum-nx2 to the
compatible list.

Is this regression intended, or should the description and commit message be
updated to reflect support for both panels?

[ ... ]
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: phandle of gpio for reset line - This should be 8mA, gp=
io
> +      can be configured using mux, pinctrl, pinctrl-names (active high)

[Severity: Medium]
Could this description cause regressions for users configuring the reset
line?

The text explicitly specifies (active high) for the reset-gpios polarity,
but typical panel semantics and the example block further down use active
low:

            reset-gpios =3D <&tlmm 62 GPIO_ACTIVE_LOW>;

If users follow this text description instead of the example, could they
drive the physical line incorrectly and prevent the panel from initializing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260829-qcom-novat=
ek-nt51021-panels-v1-0-cc1ca61bd261@mainlining.org?part=3D1
