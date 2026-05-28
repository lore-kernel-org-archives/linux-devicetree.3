Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5962E3368A4
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 19:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779995424; cv=none; b=DC8mZoXFcXJJ1OxbjZoTfiTZLzd1vJUqpzIxIwrzuRU2baet6EKnDIu8NQAACGfNGHepNYmtAFPxWMu3gqIOSWiwMcaYAGh/xNdpMiR5HR4+lDJrVPDNeAAwzCTARE8Ehy8UfB23951gw/WUbSjP8TtBclUDnm0bYPBcYnhjpsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779995424; c=relaxed/simple;
	bh=fma1e7KGExuinaDKv023SCXg8nNbi6NYwN2Ay1JkPYI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aYR3IKYjUI7+sWMOSQFCKUyiKy4Tg97R3Gna39AhGvCM/qbB12OV6oH1iQhnDGFHQy4U1gTWVC0YWevZc3d8xiPn/V+tgRqRdLI2Yj2LQ+fNw4Eky9Qvtie4N5K8OJXcUDD+/tnTOrZFJDs7MXSBHkJ0oqddVpMkMzwuiSYzQFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dLxw4un6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dLxw4un6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B15641F000E9;
	Thu, 28 May 2026 19:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779995423;
	bh=H/xgvEtUxV2bSyYOWtiS9uHemgyhU4w2HbWrqAnGZPQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dLxw4un66YphEzEv51+urR2onliLhfF7550E6TjVsFYETGDOhQJISD+wwtpTZGrLo
	 squ9AqEP4QH4DemB27a2d3grhr1xSFQGNJf2x6PIokyxtJuVqF72vL4qZX7yFESM37
	 4EkJLKre8kdXIYjnrY3hgucDVJwwpc94CLiecQIc+2tkix8egI1p8wbsFWglORiOl7
	 4ps9BeBY+FZLQu+QPRBEtbMAW5ljTX/MXOkMRtFyCG5S+uJTmc8DdVhDYV18ufzdET
	 QwVZkO/RVIE9El0bw4Q6zAC1CbPZSHcxErNOSEygYn/oKp4Cn0bG3OfwNy0dbOccC0
	 hODKJw7xgFiZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: clock: airoha: Document support for
 AN7583 clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260528190000.9164-2-ansuelsmth@gmail.com>
References: <20260528190000.9164-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 19:10:22 +0000
Message-Id: <20260528191022.B15641F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The new compatible string 'airoha,an7583-scu' is missing from th=
e conditional `if-then` blocks defining `reg` constraints.
- [Low] Inconsistent naming and formatting for the MDIO reset definitions.
--

commit 9e967d083029b29362d6e7b62c4a330c47bee22b
Author: Christian Marangi <ansuelsmth@gmail.com>

dt-bindings: clock: airoha: Document support for AN7583 clock

This commit documents support for the Airoha AN7583 clock based on the
EN7523 clock schema, adding the "airoha,chip-scu" requirement. It also
adds an additional binding for extra clock and reset lines.

> diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.ya=
ml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> index eb24a5687639e..6c3c887985153 100644
> --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
[ ... ]
> @@ -50,12 +51,29 @@ properties:
>      description: ID of the controller reset line
>      const: 1
> =20
> +  airoha,chip-scu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to Chip SCU
> +
>  required:
>    - compatible
>    - reg
>    - '#clock-cells'
> =20
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: airoha,an7583-scu
> +
> +    then:
> +      required:
> +        - airoha,chip-scu
> +
> +    else:
> +      properties:
> +        airoha,chip-scu: false
> +
>    - if:
>        properties:
>          compatible:

[Severity: Medium]
Since the AN7583 shares the same register layout as the EN7581, shouldn't
"airoha,an7583-scu" also be added to the if-then conditional block further
down that enforces maxItems: 1 for the reg property?

Omitting it leaves the reg property unconstrained for this new hardware
generation, which bypasses validation constraints.

> diff --git a/include/dt-bindings/reset/airoha,an7583-reset.h b/include/dt=
-bindings/reset/airoha,an7583-reset.h
> new file mode 100644
> index 0000000000000..7ff07986f8ba2
> --- /dev/null
> +++ b/include/dt-bindings/reset/airoha,an7583-reset.h
> @@ -0,0 +1,62 @@
[ ... ]
> +#define AN7583_TDMA_RST			19
> +#define AN7583_EMMC_RST			20
> +#define AN7583_SOE_RST			21
> +#define AN7583_XFP_MAC_RST		22
> +#define AN7583_MDIO0                    23
> +#define AN7583_MDIO1                    24

[Severity: Low]
Are the _RST suffixes intentionally omitted from AN7583_MDIO0 and
AN7583_MDIO1?

They seem to be missing the suffix used by all other reset constants in this
file, which might cause ambiguity with the matching clock macros.

Could these also be updated to use tabs instead of spaces for value alignme=
nt
to match the rest of the file?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528190000.9164=
-1-ansuelsmth@gmail.com?part=3D1
