Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806753;
	b=evFA7Z7kiqVwAQO91r+/LEQvPf0iurisk6Sm2Rc/RIhH73HssNpkpTziJ5daitEe/7wL
	 agu5p6fri7XpwEx772KM0ZgB890wgdK9V+scW0M3EK3hoVwzDFATFyQ7rQfXsThGr8YO/
	 5S3RIGfOAlqcyaT/oHlVNzi4f/B/aSinggMWNkMZ09PwS6sUer1TP6SMBrj+yqScHO4zM
	 4s+7DzuVSZ5UJXakya/znfqRAZewEdxVTRV8qSi4dpxQJQOfQd33lNnYdr7jQumSSbYtS
	 yEBtM1hNVZpFJcqAdYp682Nofm2EO+NzFVMJNWEvwprii5rnPXpRJuSZpnB0dKhuTAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806753;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VqTyygYcyL9JjxXhEJLzrY8mAqjnpLWpzC4C5OeUAxs=;
	b=JHX/tZhqYU48Mrh0CcslFzqrlJO8yfGkx/b97KfACrjisCinziIKem3FSsvAtEPyaVZa
	 0Z9GtGwmlx5Ur64cYDWugUAc6nyAREZgBBqEawc6Z0b/rFdOxmMT6EIkJoxMMuv4mGTGJ
	 jlw2LCIQ49XLUy7+79kSA0GxwJwTtXkn3n/0DwvroWcqXZNmTu0lq1mMvielI3wA5IFIu
	 rPBS6ojypr0bdI8ipIC7kiK58IATMUB1agCPEnAAxZLw8hskr1LL4r0y+eRk+ZgX66uNM
	 u9uGrz4HMfqmb+By621agrCXe9HL+mbqs+rSl+RJiKk763ENqvGlzTCkNNji5g16vwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EotTsjAE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EB7606A33A
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 15:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EotTsjAE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C7701F00A18;
	Wed,  4 Nov 2026 15:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793806753;
	bh=VqTyygYcyL9JjxXhEJLzrY8mAqjnpLWpzC4C5OeUAxs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EotTsjAEA4ioV+VPdnf0tfAeSjlXrqj8qN/M2wPGZwkegI3Kyx4+gqshK4MSJVfbC
	 jJpLq3cbF051vZdVtpv6CmVDPXtnnMlP6qoX0MVlCH1lYJNWcKXS/2utYmXeVGJmMZ
	 V3A57bEOUM0xTU5k2hWRPO2Wg4A6WYUm4/n7DbD02LVzx/SL5xYnOtBA4gpXhliBI8
	 MqVf6Ud1RZzSILBp6RlfJp9TfEvv8GFXUZUmhjoF0yQAHFVxauleyxVPPEvu+IXaC9
	 MmTWEMLT1jcmZ82uzj+5oS+FRE5prKJVQwNCI/tD9KIw399kItVSNdSLF43smSyGgL
	 NdlHPIi1nI8qQ==
Message-ID: <sashiko-outbox-197522@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: arm: stm32: allow TAMP nvram child
 node for syscon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Patrice Chotard" <patrice.chotard@foss.st.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104-upstream_nvram_reworked-v4-2-144024496a44@foss.st.com>
References: <20261104-upstream_nvram_reworked-v4-0-144024496a44@foss.st.com>
 <20261104-upstream_nvram_reworked-v4-2-144024496a44@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 15:39:12 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] dt-bindings: arm: stm32: requiring ranges on tamp breaks childle=
ss nodes
- [Medium] dt-bindings: arm: stm32: unwieldy conditionals and #size-cells r=
elaxation
- [Low] dt-bindings: arm: stm32: truncated sentence in commit message
--

commit 955fce49004502ff39ca0c0307ffc1b3b2ac4184
Author: Patrice Chotard <patrice.chotard@foss.st.com>

dt-bindings: arm: stm32: allow TAMP nvram child node for syscon

This commit updates Documentation/devicetree/bindings/arm/stm32/st,stm32-sy=
scon.yaml
to allow addressing properties (#address-cells, #size-cells, and ranges) and
an nvram child node on st,stm32-tamp nodes.

>     dt-bindings: arm: stm32: allow TAMP nvram child node for syscon
>    =20
>     The STM32 TAMP node (compatible "st,stm32-tamp", "syscon", "simple-mf=
d")
>     exposes its backup registers through an nvram child node described by
>     nvmem/st,stm32-tamp-nvram.yaml. That requires the TAMP node to carry
>     "#address-cells", "#size-cells", "ranges" and an "nvram@..." child.
>    =20
>     st,stm32-syscon.yaml uses "additionalProperties: false" and only allo=
wed
>     into the DTSI made "make dtbs_check" fail on every STM32MP TAMP node:
>    =20
>       tamp@5c00a000 (st,stm32-tamp): 'nvram@5c00a100', 'ranges' do not ma=
tch
>       any of the regexes: '^pinctrl-[0-9]+$'
>    =20
>     Allow the addressing properties and the nvram child, gated on the
>     st,stm32-tamp compatible so the other syscon variants stay strict.
>     "#size-cells" may be 1 or 2: the STM32MP21 soc bus uses two size cells
>     (an empty "ranges" requires the node to match its parent) while the
>     other STM32MP SoCs use one.
>    =20
>     Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

[Severity: Low]
This isn't a bug, but it looks like a line starting with #address-cells was
stripped as a comment by git commit in the second paragraph, leaving a
truncated sentence ("and only allowed into the DTSI made").

> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.=
yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> index a559f8b03b842..51cb565e05edb 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> @@ -43,13 +43,19 @@ properties:
>      const: 1
> =20
>    "#size-cells":
> -    const: 1
> +    enum: [1, 2]
> +
> +  ranges: true
> =20
>  patternProperties:
>    "^phy@2[48]00$":
>      type: object
>      $ref: /schemas/phy/st,stm32-usb2phy.yaml
> =20
> +  "^nvram@[0-9a-f]+$":
> +    type: object
> +    $ref: /schemas/nvmem/st,stm32-tamp-nvram.yaml
> +
>  required:
>    - compatible
>    - reg
> @@ -84,11 +90,37 @@ allOf:
>          - phy@2800
>      else:
>        properties:
> -        '#address-cells': false
>          '#clock-cells': false
> -        '#size-cells': false
>          phy@2400: false
>          phy@2800: false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32-tamp
> +    then:
> +      required:
> +        - "#address-cells"
> +        - "#size-cells"
> +        - ranges

[Severity: Medium]
Does unconditionally requiring #address-cells, #size-cells, and ranges for
st,stm32-tamp cause a dtbs_check regression on existing device trees without
child nodes?

In arch/arm/boot/dts/st/stm32mp151.dtsi, the tamp@5c00a000 node has no child
nodes and does not specify #address-cells, #size-cells, or ranges:

		tamp: tamp@5c00a000 {
			compatible =3D "st,stm32-tamp", "syscon", "simple-mfd";
			reg =3D <0x5c00a000 0x400>;
		};

Additionally, properties.compatible in st,stm32-syscon.yaml allows the
two-item form without simple-mfd:

      - items:
          - enum:
              - st,stm32-tamp
              ...
          - const: syscon

where bus addressing properties would not apply when no child node is
present. Should #address-cells, #size-cells, and ranges remain optional (or
only be required when child nodes are present) so childless st,stm32-tamp
nodes stay valid?

> +    else:
> +      properties:
> +        ranges: false
> +      patternProperties:
> +        "^nvram@[0-9a-f]+$": false
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - st,stm32-tamp
> +                - st,stm32mp23-syscfg
> +                - st,stm32mp25-syscfg
> +    then:
> +      properties:
> +        '#address-cells': false
> +        '#size-cells': false

[Severity: Medium]
Because top-level #size-cells in properties was widened from const: 1 to
enum: [1, 2] without restricting 2 to st,stm32-tamp, doesn't this also allow
#size-cells =3D <2> on st,stm32mp23-syscfg and st,stm32mp25-syscfg?

Also, with st,stm32-tamp now needing its own ranges, nvram@... child patter=
n,
and #size-cells rules alongside the existing USB2 PHY conditionals for
st,stm32mp23-syscfg and st,stm32mp25-syscfg, would it be cleaner to split
st,stm32-tamp into a separate binding schema document rather than adding mo=
re
per-compatible if-then blocks to st,stm32-syscon.yaml?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-upstream_n=
vram_reworked-v4-0-144024496a44@foss.st.com?part=3D2
