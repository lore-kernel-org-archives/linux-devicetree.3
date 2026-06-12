Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C6D388E4E
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 22:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781304785; cv=none; b=VErKLq1VbyTsM+NBkgNh4dc0RHyyjvNPLQM/u+KL3XToE6WA+B0Y73HsjCxwvk3RFA68YG+dfrVPCEbzZCEa/XNVwbKduHcIXBirmsbkM5fLjw5DMX9/FYaIeV9PXI0ZeQcOx2D44MA29LVzw+q3k553WSmUJ37IbLDDxNtI1e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781304785; c=relaxed/simple;
	bh=jcLma5JrpQTrpGn44S8LCgAytLJr/b9kFWjuCe4EoWg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LCXLbks+jFKD2cxuy3f1nk2lFuvWOHFYMGAfzByUcy6HX+uQGDZtyoBA+ZHls588GsGTvzg8aX1o5HIbb6o0tddd8tM9JwRLyoQdIOQ5zY2zPNI5yC5z4T7iNN5cUuQpaWSAmg0cjXlc433xSbVTf+AchB1qJpA5heXZKzeaec0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QUFbDz/8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QUFbDz/8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC8551F000E9;
	Fri, 12 Jun 2026 22:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781304784;
	bh=jNuPqkXl2JQZ4IZ/AprPazUu42ThaGRlZInNn7LVAOY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QUFbDz/83YKqEiFHcbjYY9GMm8kwCtyR/p0rjEoLTRAV2pS8ikvDY1MHPi4FOO9mR
	 JTOTr+EFj4stCnRjEQKhUlaXor8jzBCFPbY/F7U5NJ2gL+UFqbWeR6TGxB9WNEMvLW
	 w2U4tySjprWVeeTt8KMmjzwvFZlwRp2HrpPIRK8vVkrIghMWTu2eLlCH44nokRQ+kL
	 JZikuI/VqqFG/J006GRx1OYcrbROjFA4sqTEOLGUQbzEz7gSLtvR3XWEafbKPIpvFV
	 xxEZEp5RwUy4yDk+842zZqGoTYoGb/CzaJ8cvbK5A7EMvTlLMFYAGJXG9uoMJll7IW
	 JO/33g39cZmRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: iio: adc: Add TI ADS126x ADC family
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260612-ads126x-v1-1-894c788d03ed@gmail.com>
References: <20260612-ads126x-v1-1-894c788d03ed@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 22:53:03 +0000
Message-Id: <20260612225303.DC8551F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] Missing required GPIO properties in schema and examples
- [Medium] ADC2 child node is not conditionally restricted to the ads1263 c=
ompatible string
- [Medium] Contradictory schema definition for ADC2 child nodes
- [Medium] Incorrect schema property restriction blocking standard ADC prop=
erties
--

commit 42c82a528b0caecd291df843ad4bb9b4822940a2
Author: Kurt Borja <kuurtb@gmail.com>

dt-bindings: iio: adc: Add TI ADS126x ADC family

This commit adds the devicetree bindings documentation for the TI ADS1262
and ADS1263 ADCs. It defines the main ADC schema, the properties for the
ADC channels, and includes a separate schema for the ADS1263 auxiliary ADC2.

> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads1262.yaml b/=
Documentation/devicetree/bindings/iio/adc/ti,ads1262.yaml
> new file mode 100644
> index 0000000000000..1c4fde94f6c75
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads1262.yaml
> @@ -0,0 +1,308 @@

[ ... ]

> +  '#io-channel-cells':
> +    const: 1
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  adc:
> +    $ref: /schemas/iio/adc/ti,ads1263-adc2.yaml#

[Severity: Medium]
The auxiliary ADC2 is only available on the ADS1263 variant, but the schema
allows the adc child node for all variants. Should an allOf block with an
if-then condition be added here or below to forbid the adc node when the
compatible string is ti,ads1262?

> +
> +required:
> +  - compatible
> +  - reg
> +  - avdd-supply
> +  - dvdd-supply
> +  - '#address-cells'
> +  - '#size-cells'

[Severity: Medium]
Since the binding provides GPIO controller capabilities, should the
gpio-controller and #gpio-cells properties be included in this required
list to ensure incomplete device tree nodes don't silently pass validation?

> +
> +unevaluatedProperties: false
> +
> +patternProperties:
> +  "^channel@[0-9]+$":
> +    $ref: /schemas/iio/adc/adc.yaml#
> +    additionalProperties: false

[Severity: Medium]
Does using additionalProperties: false here incorrectly prevent the use of
standard shared ADC channel properties from the referenced adc.yaml schema?
Should this be unevaluatedProperties: false instead to allow properties
evaluated by the referenced schema?

[ ... ]

> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    spi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        adc@0 {
> +            compatible =3D "ti,ads1263";
> +            reg =3D <0>;
> +            spi-max-frequency =3D <8000000>;
> +            spi-cpha;
> +            avdd-supply =3D <&avdd>;
> +            dvdd-supply =3D <&dvdd>;
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            reset-gpios =3D <&gpio 18 GPIO_ACTIVE_LOW>;

[Severity: Medium]
If gpio-controller and #gpio-cells are added to the required properties, do
they also need to be demonstrated in this example node to pass the
dt_binding_check validation?

[ ... ]

> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads1263-adc2.ya=
ml b/Documentation/devicetree/bindings/iio/adc/ti,ads1263-adc2.yaml
> new file mode 100644
> index 0000000000000..9dd5577589b1c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads1263-adc2.yaml
> @@ -0,0 +1,49 @@

[ ... ]

> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  '#io-channel-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false

[Severity: Medium]
The #address-cells and #size-cells properties imply the node expects child
nodes, but additionalProperties: false is specified globally and forbids th=
em.

Since the driver dynamically derives ADC2 channels from the parent node rat=
her
than parsing children from the ADC2 node, should the cell properties
#address-cells and #size-cells be removed to avoid this contradiction?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-ads126x-v1=
-0-894c788d03ed@gmail.com?part=3D1
