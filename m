Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAEA9463
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 00:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786665725; cv=none; b=JwRZXz5lKiC9DJfq29jvaKKocQiQofehvtj5FQg56h+cVpZWEaZF/WfiAyKVyJOuQExPf6Q7rYBGOnU9jb9bfJQJm8VvuhMv481ezrkgEVSCxhjVDL4xmsWy3TR4Q2idpPSzgdUPFH7dGatXN7HV9LpmU/LeS+e5cDcUy3JQKQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786665725; c=relaxed/simple;
	bh=JLnw89HykUa8y04XPlWoyX70CUTYsfJtbUsePWedmOc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hls7Puv7x87ogVlePqxeDzp7pR+V7R5TLwq/f/SAGMmf4MdGFhaCGhYEy5/hBMsCwTBaz43bDSdwABPe1kHPrq/kK0uYQ6bcjwo4wUQ5V4QfRPnHnfHspLhs5WBHNVc/yGvq1ZJPhzrM8qMHf0L0tzYxcrXg7aOS2vxB6xDvka0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n9kYhaF1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n9kYhaF1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EFA21F000E9;
	Fri, 14 Aug 2026 00:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786665723;
	bh=Qcxv4s+OvqmKIWHUwwknU3ytd63ZnuWHjigY9Lm8Etc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n9kYhaF1xL4wfkz1QDvYqS7udnQ2ehbSajzdwl93qJ1XisTSDW41dCmagolh2cBUw
	 NQNuiGM5WAjwC8aL7HXx2KjM8Urq8cgPXIG6nrP54/O1iqXkVU1dgsVNb7V0Jz5+zC
	 HuTmyOWEGv2Jis330pR9bYHlnijcYQOHOKvmTjFz4cPF/Fr4wRQFUTJrtiXrE7ODXy
	 R1lXqIDPyfPP3LkPm+V7hX4kkfQBeFkqkXXGA2TPK03V3ZbbZUdJjvbI52INRXrUxB
	 0Q8FmLofOoixaea6KTmnXx0gcDtB8g7n7/7bBX7DH0D9k7eOdkmEtsyHz0aphGVBMl
	 zrcdex4t/m+KQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 01/12] ASoC: dt-bindings: renesas,rsnd: Split into
 generic and SoC-specific parts
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Madieu" <john.madieu.xa@bp.renesas.com>
Cc: robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org
In-Reply-To: <20260409090302.2243305-2-john.madieu.xa@bp.renesas.com>
References: <20260409090302.2243305-2-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 00:02:03 +0000
Message-Id: <20260814000203.9EFA21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The extracted common schema silently drops strict validation con=
straints on `dmas` and `dma-names` for the `dvc`, `src`, `ssiu`, and `ssi` =
subnodes.
- [Medium] Validation string pattern constraints for `clock-names` and `res=
et-names` were entirely dropped for Gen1 SoCs.
- [Medium] The `reg` property strict length constraints for Gen2/Gen3 and G=
en4 SoCs were unintentionally relaxed by replacing `minItems` with `maxItem=
s`.
--

--- Patch [1]: [PATCH v4 01/12] ASoC: dt-bindings: renesas,rsnd: Split into=
 generic and SoC-specific parts ---
commit 6e078a2691ebf1fb098584188a1f25bc334a8942
Author: John Madieu <john.madieu.xa@bp.renesas.com>

ASoC: dt-bindings: renesas,rsnd: Split into generic and SoC-specific parts

Refactors the renesas,rsnd.yaml binding by extracting common properties
shared across all SoCs into a dedicated renesas,rsnd-common.yaml schema
to simplify future additions.

> diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd-common.=
yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd-common.yaml
> new file mode 100644
> index 0000000000000..ec6bf644d1a4e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd-common.yaml

[ ... ]

> +  rcar_sound,dvc:
> +    description: DVC subnode.
> +    type: object
> +    patternProperties:
> +      "^dvc-[0-1]$":
> +        type: object
> +        additionalProperties: false
> +        properties:
> +          dmas: true
> +          dma-names: true

[Severity: Medium]
Does this unintentionally drop the validation rules for DMA channels and
names inside the dvc, src, ssiu, and ssi subnodes?

The original schema had explicit constraints for these properties, such as
array boundaries and specific enum lists for dma-names. Setting these
properties to true in the common schema might allow arrays of arbitrary
lengths or string typos to silently pass validation.

> diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/=
Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> index e8a2acb926460..0d989922a5b4b 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml

[ ... ]

>  allOf:
> -  - $ref: dai-common.yaml#
> +  - $ref: renesas,rsnd-common.yaml#
> =20
> -  # --------------------
> -  # reg/reg-names
> -  # --------------------
> -  # for Gen1
>    - if:
>        properties:
>          compatible:
> @@ -295,11 +134,10 @@ allOf:
>            maxItems: 3
>          reg-names:
>            items:
> -            enum:
> -              - sru
> -              - ssi
> -              - adg
> -  # for Gen2/Gen3
> +            - const: sru
> +            - const: ssi
> +            - const: adg
> +

[Severity: Medium]
Are we leaving clock-names and reset-names completely unrestricted for Gen1
SoCs here?

The global else block containing the string pattern validations was moved
to the Gen2/Gen3 conditional block, but it seems to have been omitted
entirely for Gen1.

>    - if:
>        properties:
>          compatible:
> @@ -310,16 +148,34 @@ allOf:
>      then:
>        properties:
>          reg:
> -          minItems: 5
> +          maxItems: 5
>          reg-names:
>            items:

[Severity: Medium]
Could this relax the register mapping length constraints by replacing
minItems with maxItems?

Gen2 and Gen3 previously required exactly 5 regions. A device tree
supplying fewer elements might now silently pass validation since the
schema evaluates successfully if the input array is shorter than the list.

This same minItems replacement appears to have occurred in the Gen4 block
as well.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260409090302.2243=
305-1-john.madieu.xa@bp.renesas.com?part=3D1
