Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447C4370D6B
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 01:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790991192; cv=none; b=Swp3jFSr8UBpZf9alE4LgWi7RUqpSYA1+kWUt6MyUnOoy5Uiw/UVhp4g15F9w49IQabETLhkLzHXDYzmC2BwWYn0tZqJYTlii+yvknIpxj2OxuZ6qq1b5Pq0SCxNTxUgSNVuaBS0AwoiI5mxAd8UJBIOihroi9t9tT7gyR4C6Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790991192; c=relaxed/simple;
	bh=PaNuTxuQEXdVMJ0NcN/R6Cpt619hQgYY21dPSfhcW8k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Muz8WD7oTONIcQ9eAeAaDiHWmVB5cZ0NYMz9EihcfcgplPnADiMXHDwZv73J2uH6eB25q0PqtjcEfBI3SreQarMMi/3xl42GN4AlWCvWHOCVSgEgOCOIHBOO77xMburHXQyJumd3vPfTirSt+kVZMXPLk9hkG6n/7RmZ+plGWC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ait3xdju; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ait3xdju"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D30A61F000FF;
	Sat,  3 Oct 2026 01:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790991191;
	bh=BiYKwNy+2OHvvwVImDdjFefxqrDOm3KwW8sv6kkusYE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ait3xdjuU56xqfszwYObTRPM4J8/fnwEfm5j4DVFskavTUI5pwszS1CPnLZ+helso
	 o5NA4bS3VZQLgDfG0vprGI8Y7iCycs2lngojK9nSWpcBNEc4VLHCQkeLHSomGcWbVI
	 3dzPyEJWTo10BPx5Wbd9Y6IxU8dkP3EYNuNxdd5PzIEyqV2t4j14N+bRpbe4rWIdwl
	 fKRx6cu62fO04w4Js6zHdg0FgEluCb1UV1I5kU8AamvonYsbTDUN3AGsOicgrSGvB2
	 fSbcOki75g2hDECohonXDkPnqvn9O8EwcQ1l+stia9QwpBY+hEAr0SU7ExFGwgayCt
	 4yxmmmurrdzaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 04/12] dt-bindings: net: dsa:
 renesas,rzn1-a5psw: Add RZ/T2H and RZ/N2H ETHSW support
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261001154326.754314-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261001154326.754314-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261001154326.754314-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Oct 2026 01:33:10 +0000
Message-Id: <20261003013310.D30A61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: net: dsa: a5psw: globally requiring interrupts brea=
ks backward ABI
- [Low] dt-bindings: net: dsa: a5psw: missing port count restriction for ET=
HSW variant
--

commit ac61e34c73e390592b92437f35f98d8807997f55
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

dt-bindings: net: dsa: renesas,rzn1-a5psw: Add RZ/T2H and RZ/N2H ETHSW supp=
ort

This commit extends the A5PSW DSA binding to cover the ETHSW variant used on
newer Renesas SoCs. It updates the schema with new compatible strings, modi=
fies
interrupt and clock properties, and accounts for the 4-port topology.

> diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw=
.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> index fab6aa6237e93..863633185912f 100644
> --- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
[ ... ]
> @@ -73,14 +145,48 @@ properties:
>                phandle pointing to a PCS sub-node compatible with
>                renesas,rzn1-miic.yaml#
> =20
> -unevaluatedProperties: false
> -
>  required:
>    - compatible
>    - reg
>    - clocks
>    - clock-names
>    - power-domains
> +  - interrupts
> +  - interrupt-names

[Severity: Medium]
Does adding interrupts and interrupt-names to the top-level required array
cause a regression by breaking backward compatibility for legacy device tre=
es?

Existing device trees for the older renesas,rzn1-a5psw hardware that do not
specify the interrupts property will now fail validation. Since the Linux
driver does not currently utilize interrupts, it is perfectly valid and
functional for older device trees to omit them.

Should these properties only be required conditionally within the then block
for the new hardware variant?

> +
> +allOf:
> +  - $ref: dsa.yaml#/$defs/ethernet-ports
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g077-ethsw
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 24
> +        interrupt-names:
> +          minItems: 24
> +        clocks:
> +          minItems: 3
> +        clock-names:
> +          minItems: 3
> +      required:
> +        - resets

[Severity: Low]
Does this conditional block need to restrict the port count for the new
ETHSW variant?

The global patternProperties for ethernet-ports allows
"^(ethernet-)?port@[0-4]$", which globally permits up to 5 ports. This is
correct for the older A5PSW variant but incorrect for the new 4-port ETHSW
variant.

Without a port count restriction here (e.g., overriding and disabling port@=
4),
device trees with invalid 5-port configurations for the new variant will
silently pass schema validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001154326.7543=
14-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D4
