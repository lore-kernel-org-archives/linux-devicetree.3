Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880606;
	b=RWxSQqrB90IxCh66bmeA7KjOXJU3dvQRNKWjYjVMoWfuDta51Wi/z8b5qRIeJLz8AQdy
	 YHZDqD9Gb7v19oVQoFyOgeHC4Od5mWQCUj4U64ukeZ9ASVe107Id9MaQFW9Y6USu1oLvl
	 A4SucKdO/qitBtjUQx2Xo+8OqsEGWtWicpu5tSgMS7z1pnXl+kUgHa3HFIDrVxi8KzLcp
	 ktK5CJDQ5KtnCNN/mAL7IR4GmG9TWjSA049X7wqV9y9VP/n2wpumAl5PyJ3kWvGxKmQ7Z
	 pgURORjFkinCGVXMjv/SGAfHqmGLmaGifFaTkzx3FMGP0jrpTL1na/fHeFZGtKwf2aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880606;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tcE7urDLDVrIxVXr/K8ZKOG7lRVu6QT/JCKKGV8GdWI=;
	b=FLGzs1wVP6S9uq0peJzEP8+DSlMO/MEg2EXs3BXTzyAqZKnQ0lX2+afHxLhPc3d4jYNw
	 HdYcpYYxpFOLpvWWLoXONcboL4FeEKv3VZ7Ehw07NFWOPr05d/znblIpOi1arWtSzbH0e
	 XT+C2Y7OSJOvflN3hSky5jNTVHYo2JoSlYgYBzgY1BMdnKtDYKJPi48eS43fkxzT04G6y
	 H7H1oHdg9p2oFoAz7Uhx2pyor22WSn0ORV3ZROS3RrQ6mRseI7Ayw4vB5OEY27Zn7YMcG
	 T6fJhO4ndpYxQb5Wd8SId1FleuQHgBttO8POVfYQQfxhgOrk8a88tIqp1NRkgRcYrPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JsmSLnCV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2241D606EE81
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 12:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JsmSLnCV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EB1F1F000C1;
	Thu,  5 Nov 2026 12:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793880605;
	bh=tcE7urDLDVrIxVXr/K8ZKOG7lRVu6QT/JCKKGV8GdWI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JsmSLnCVgESIgMMVySEGHdLrkqML8ZpbZrnoJZiGFNF83jnlKJXl6XzbJzmTm/rXy
	 EHWyGzd7AxjKAc5NkR3wLJGestbAlP2GoDAu3j9IPfLm4FLjkcdltiQfc5OK75IXtY
	 R0EMF6Z4lFd3od8M9sUw594Lvk2Pl/3UHYarFlNAnC9wg/folCuf1S6E2iMMmn09cD
	 +GUJn10dwedGTjcjCF3LRl3bOODjlWC5JsQ10VopNhys/VmYe5pj5BpoYmL3jLuAXa
	 9jjj/WSI4LE9ccQiAoyZ6Lw2fuVaGg3ECOokxdGsxO+QKF/rKhddQjsFzm5yEprEX5
	 Pyxe2SQDq9u7w==
Message-ID: <sashiko-outbox-198998@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/8] dt-bindings: arm: stm32: allow TAMP nvram child
 node for syscon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Patrice Chotard" <patrice.chotard@foss.st.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105-upstream_nvram_reworked-v5-2-ddf7dbf1b298@foss.st.com>
References: <20261105-upstream_nvram_reworked-v5-0-ddf7dbf1b298@foss.st.com>
 <20261105-upstream_nvram_reworked-v5-2-ddf7dbf1b298@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 12:10:05 +0000
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

commit e6c1079f034dff65c4f96319b3e627caa16315a4
Author: Patrice Chotard <patrice.chotard@foss.st.com>

dt-bindings: arm: stm32: allow TAMP nvram child node for syscon

This commit updates the STM32 syscon DT binding schema to allow an nvram
child node and bus addressing properties (#address-cells, #size-cells, and
ranges) for the st,stm32-tamp compatible.

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
As reported by Sashiko on v4 [1], was a line starting with #address-cells
stripped by git commit in the middle of the second paragraph between "and
only allowed" and "into the DTSI", leaving the sentence incomplete?

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
As reported by Sashiko on v4 [2], does unconditionally requiring
#address-cells, #size-cells, and ranges in allOf whenever compatible
contains st,stm32-tamp cause a validation regression for childless TAMP
nodes and non-MFD TAMP compatibles?

The ^nvram@[0-9a-f]+$ child node is optional, and properties.compatible in
Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml permits bo=
th
the two-item non-MFD form (st,stm32-tamp, syscon) and the three-item MFD fo=
rm
(st,stm32-tamp, syscon, simple-mfd):

  compatible:
    oneOf:
      - items:
          - enum:
              - st,stm32-tamp
              ...
          - const: syscon
      - items:
          - enum:
              - st,stm32-tamp
              ...
          - const: syscon
          - const: simple-mfd

Existing device trees such as arch/arm/boot/dts/st/stm32mp151.dtsi define a
childless tamp@5c00a000 node without #address-cells, #size-cells, or ranges:

		tamp: tamp@5c00a000 {
			compatible =3D "st,stm32-tamp", "syscon", "simple-mfd";
			reg =3D <0x5c00a000 0x400>;
		};

Should #address-cells, #size-cells, and ranges only be allowed (or required
via dependencies when a child node is present) rather than unconditionally
required on all st,stm32-tamp nodes?

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
As reported by Sashiko on v4 [3], does widening the top-level #size-cells in
properties from const: 1 to enum: [1, 2] also relax validation for
st,stm32mp23-syscfg and st,stm32mp25-syscfg so that they now accept
#size-cells =3D <2>, even though their phy@2400 and phy@2800 child nodes on=
ly
use 1 size cell?

Also, since st,stm32-syscon.yaml now accumulates multiple per-compatible
allOf conditional blocks (including this negated multi-compatible if-not
block across st,stm32-tamp, st,stm32mp23-syscfg, and st,stm32mp25-syscfg) f=
or
divergent child nodes and addressing rules, would it be cleaner to split
st,stm32-tamp into its own binding schema document rather than piling more
variant conditionals onto st,stm32-syscon.yaml?

[1] https://lore.kernel.org/r/20261104-upstream_nvram_reworked-v4-2-1440244=
96a44@foss.st.com
[2] https://lore.kernel.org/r/20261104-upstream_nvram_reworked-v4-2-1440244=
96a44@foss.st.com
[3] https://lore.kernel.org/r/20261104-upstream_nvram_reworked-v4-2-1440244=
96a44@foss.st.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-upstream_n=
vram_reworked-v5-0-ddf7dbf1b298@foss.st.com?part=3D2
