Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46AE305664
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779706826; cv=none; b=QU3ARdwkugK+zWPuRcs2WnXKv5zLFfpQnD711P6FNf+22Igb8xaiUqC4V5fb/l39pXLSVjAwZhCC6bubYazwhh20QhpBzzhv5tQ+Aoihg5tOeW5xy7/xBray2g4aNj3GQGp6ASz7UyOR8wIcrfXOFIFslmalLMirqYizk3G4FnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779706826; c=relaxed/simple;
	bh=ETHmMXPR1H8uldXCkMLo/T/Pg33TE/RTQ8O8EUrXaXM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fnEaA8EqyqL7nIc9s8g5q8jreOAXv6iuQy27dEN+uuWfBwPJELoSGzOnvFwihIQm5DUehjfETAhSLBK0EIT/hUM8oJGxwZbqlGs8GOX0SPb2dfxFTFp+mU7OaeG9IQRUQD3vUemlRkeEI3lnUK5Z3IAquYJyEQRlQ01oMqt0jis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lDc/redx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lDc/redx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EE4F1F000E9;
	Mon, 25 May 2026 11:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779706824;
	bh=sBp5JJ2iDmlLiKTzT5uaFeXo79Ds++E0Lgi42DivQp8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lDc/redxvXMaknh+33hHRrB6xCK/C93lm7rkJW6MRK+oc5Rmgw4qsfiRchqREX9zZ
	 KGZNoSBwrvP3nZx7UYh/f8q/GzDLuoTvK30iWaldTsvPnB9VNm1vY9+MVEf7PyL2/F
	 K89cGqJBnTg1hQlGqqJLl25BktHuWmleLAmZGl82ehQ+ta4qKPsRQQHIXF2JQ3FFVJ
	 KcoukGEDw6IsbTFTK+EZnkgobkFjvQULiXKK1pF/X9REQMKNAYhPgqWoh6jSleJJIH
	 ld0s8558kVHNPuiNcqT6zIvZatzT2KMSnddClKRhLpJxOumBhqvCSkcD8z2IE2X+Jr
	 +SKq+bls9S/oA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: serial: maxim,max310x: allow per-port
 subnodes for rs485
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tapio Reijonen" <tapio.reijonen@vaisala.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260525-b4-max310x-rs485-dt-v1-2-e6c19b4d5592@vaisala.com>
References: <20260525-b4-max310x-rs485-dt-v1-2-e6c19b4d5592@vaisala.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 11:00:23 +0000
Message-Id: <20260525110024.5EE4F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The binding uses `port@N` subnodes for UART channels and sets `u=
nevaluatedProperties: false` after only referencing `rs485.yaml`. This viol=
ates the standard Devicetree naming convention (which requires `serial` for=
 UART nodes) and makes it impossible to describe standard serial slave devi=
ces (like `bluetooth` or `gnss`) attached to specific ports.
- [Medium] The numeric constraint `maximum: 3` is applied directly to the `=
reg` property. In dt-schema, `reg` is treated as an array type (uint32-matr=
ix), and according to JSON Schema, the `maximum` keyword only applies to nu=
meric types. Therefore, the constraint is silently ignored.
--

commit 9b3598af4d01913809f43c040005125c955bbbe1
Author: Tapio Reijonen <tapio.reijonen@vaisala.com>

dt-bindings: serial: maxim,max310x: allow per-port subnodes for rs485

This commit introduces per-port subnodes (matching the pattern "^port@[0-3]=
$")
for the MAX310x multi-port UART driver. It pulls in properties from rs485.y=
aml
to support configurations where each port has distinct RS485 wiring, while
still accepting top-level properties for compatibility.

> diff --git a/Documentation/devicetree/bindings/serial/maxim,max310x.yaml =
b/Documentation/devicetree/bindings/serial/maxim,max310x.yaml
> index 889eeaca64a02..b7095c9abacde 100644
> --- a/Documentation/devicetree/bindings/serial/maxim,max310x.yaml
> +++ b/Documentation/devicetree/bindings/serial/maxim,max310x.yaml
[ ... ]
> @@ -40,6 +40,34 @@ properties:
>      minItems: 1
>      maxItems: 16
> =20
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^port@[0-3]$":

[Severity: Medium]
Does this node naming convention limit the extensibility of the hardware
representation?

The standard Devicetree naming convention requires "serial" for UART nodes,
while "port" is conventionally reserved for OF graph bindings.

Using "^serial@[0-3]$" and referencing serial.yaml would be the standard
approach.

> +    type: object
> +    description:
> +      Per-port subnode that carries the RS-485 properties from
> +      /schemas/serial/rs485.yaml# for a single UART channel of the
> +      chip. Only those rs485-* properties (and the per-port reg) are
> +      accepted here; device-wide settings stay on the parent node.
> +
> +    allOf:
> +      - $ref: /schemas/serial/rs485.yaml#
> +
> +    properties:
> +      reg:
> +        description: Port number on the chip.
> +        maximum: 3

[Severity: Medium]
Will this numeric constraint be silently ignored?

In dt-schema, the "reg" property is treated as an array type (uint32-matrix=
).
Because JSON Schema only applies the "maximum" keyword to numeric types,
invalid port numbers (e.g. reg =3D <4>) will pass schema validation.

Should this constraint be applied to the array items instead?

> +
> +    required:
> +      - reg
> +
> +    unevaluatedProperties: false

[Severity: Medium]
Does this strict property evaluation prevent describing standard serial sla=
ve
devices?

By setting unevaluatedProperties to false after only referencing rs485.yaml,
valid configurations (such as attaching a bluetooth or gnss device to one of
the UART ports) cannot be described and will fail schema validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525-b4-max310x=
-rs485-dt-v1-0-e6c19b4d5592@vaisala.com?part=3D2
