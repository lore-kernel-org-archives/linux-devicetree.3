Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CDD194AE6
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 07:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779004691; cv=none; b=uqaShtRPhftXPdkYTReUJ2LWjxA3dRGUZkpH8kUtWS2tvOPQHOJ1yrcNwjupOXuUuXRWjeICcNQdDKRRArM9Ep3DgrK8PS83qgfoHBhYbQSB4q2QJWImqpFMWAFQL8CBnxHwZJuxoZjZGT8qqz4EtvS41bI3pztIvOOyMt7rAnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779004691; c=relaxed/simple;
	bh=5kTxoMJD9jCXd6WQNiXaw72ODvqT6ywboOAWlpTg80k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f5ugR+k7rreIEGpuNdGxuVY7oYOUEnSjlAtfHWmviQ0jHe4cGx1Fe50LZQbgkeQWfyRXW2OSSBUyFNgEo8Gi1zasqQf1aLalKbDo8XujrbJEOOkT7vObzHwiWG75Z3mbckBsYc3/SnK9m82Cn4j9f2UxLvPq1ohBPH3vuzfwDMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hsZAZIoY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hsZAZIoY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5108EC2BCB0;
	Sun, 17 May 2026 07:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779004691;
	bh=5kTxoMJD9jCXd6WQNiXaw72ODvqT6ywboOAWlpTg80k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=hsZAZIoYUSO0Tx096ugbZRZ7LSJU/Ipoh3cBB9pUMuQVqSRwmpMFNoth4piEtLs8k
	 95N6R5jzgoSciwbqGr1nRkUoRZk3DPmrbTODD3K08E5zG1hBc/tgmbHHcSqKNzgp7o
	 akIrPCcAuDbdlomJJIBWbS1oDh6dhlj+fudVuitXahhfRJUablu/Kt6pc0vnAKTkua
	 IQ69NkHunzVL4S5xRdMkGTJdFbuKnw18/FqMNZyXRYeYZx4rWoB7lyU4X9aS6uxBsy
	 qkPjR86nspmflEdoFBVUj+Z+f6SP08PFZBWZ5X8b1YhIdgaSsYe2etG2lmiFxYlLqk
	 wUaToHUGRAIOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/6] dt-bindings: leds: Document TI LM3533 LED
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260517074306.30937-2-clamor95@gmail.com>
References: <20260517074306.30937-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 07:58:10 +0000
Message-Id: <20260517075811.5108EC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The top-level `ti,lm3533.yaml` mandates the presence of all sub-no=
des through the `required` list, which is an anti-pattern for optional hard=
ware blocks.
- [High] The `ti,lm3533-backlight.yaml` schema uses standard LED properties=
 (`led-sources` and `led-max-microamp`) without defining their types or pul=
ling them in from the core LED schema.
- [High] The `light-sensor` node will fail `dt_binding_check` because `addi=
tionalProperties: false` rejects standard properties like `interrupt-parent=
`.
- [Medium] The `led-sources` item constraint in `ti,lm3533-leds.yaml` allow=
s an out-of-bounds index due to an off-by-one error.
- [Medium] The parent node `ti,lm3533.yaml` enforces child nodes with unit =
addresses but fails to require `#address-cells` and `#size-cells`.
--

commit 79de640d527303f53ad8d32d99e560b245a95df7
Author: Svyatoslav Ryhel <clamor95@gmail.com>

dt-bindings: leds: Document TI LM3533 LED controller

Document the LM3533 - a complete power source for backlight, keypad and
indicator LEDs in smartphone handsets.

> diff --git a/Documentation/devicetree/bindings/leds/backlight/ti,lm3533-b=
acklight.yaml b/Documentation/devicetree/bindings/leds/backlight/ti,lm3533-=
backlight.yaml
> new file mode 100644
> index 0000000000000..866b0fb8ed047
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/ti,lm3533-backligh=
t.yaml
> @@ -0,0 +1,68 @@
[ ... ]
> +allOf:
> +  - $ref: /schemas/leds/backlight/common.yaml#
> +
> +properties:
> +  compatible:
> +    const: ti,lm3533-backlight
> +
> +  reg:
> +    description: Control bank selection (0 =3D bank A, 1 =3D bank B).
> +    maximum: 1
> +
> +  led-max-microamp:
> +    description: maximum current in uA with a 800 uA step.
> +    minimum: 5000
> +    maximum: 29800
> +    default: 5000
> +
> +  led-sources:

The common backlight schema does not define types for led-sources or
led-max-microamp. Since this schema neither includes leds/common.yaml nor
provides explicit type references, will this lack strict type validation and
potentially cause dt_binding_check to fail? Should this include a reference
to /schemas/leds/common.yaml#?

[ ... ]
> diff --git a/Documentation/devicetree/bindings/leds/ti,lm3533-leds.yaml b=
/Documentation/devicetree/bindings/leds/ti,lm3533-leds.yaml
> new file mode 100644
> index 0000000000000..a582d7d2f955b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/ti,lm3533-leds.yaml
> @@ -0,0 +1,66 @@
[ ... ]
> +  led-sources:
> +    description: |
> +      LVLED associated with this control bank. May be more than 1 source=
 per bank.
> +        0 - LVLED1
> +        1 - LVLED2
> +        2 - LVLED3
> +        3 - LVLED4
> +        4 - LVLED5
> +    minItems: 1
> +    maxItems: 5
> +    items:
> +      maximum: 5

The description explicitly defines the valid LVLED source indices as 0
through 4. Does the maximum constraint of 5 allow an invalid index of 5 to
pass schema validation? Should it be restricted to maximum: 4?

[ ... ]
> diff --git a/Documentation/devicetree/bindings/leds/ti,lm3533.yaml b/Docu=
mentation/devicetree/bindings/leds/ti,lm3533.yaml
> new file mode 100644
> index 0000000000000..2e200f1724004
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/ti,lm3533.yaml
> @@ -0,0 +1,190 @@
[ ... ]
> +  light-sensor:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      compatible:
> +        const: ti,lm3533-als
> +
> +      interrupts:
> +        maxItems: 1

This object uses additionalProperties: false but does not list standard
properties like interrupt-parent in its properties block. Will this cause
schema validation to fail when processing device trees that use
interrupt-parent, as shown in the example later in this binding?

[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - light-sensor
> +  - backlight@0
> +  - backlight@1
> +  - led@2
> +  - led@3
> +  - led@4
> +  - led@5

Are all of these sub-nodes physically required for every device tree?

Including backlight@0, backlight@1, led@2 through led@5, and light-sensor in
the required list forces every device tree to instantiate them even if they
are unconnected or unused on the board.

Since this parent node hosts multiple subnodes that utilize the reg propert=
y,
shouldn't #address-cells and #size-cells also be included in the required
array to ensure they are always present when child nodes are defined?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260517074306.3093=
7-1-clamor95@gmail.com?part=3D1
