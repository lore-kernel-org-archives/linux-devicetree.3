Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECDB2C11DF
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 18:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779733733; cv=none; b=C4tEyQNAYiQLBN5/zV8qHvyRPfWSxOA4Z8D0EYIroMzvvI5oCIgBA7QRoo5vZL2ccFuilW6Zbd32Zqc6Vv3Sm+lvoUsf5tB150ITGNM2EVcVLO18XzS88fYz616eSVsb46ukjFm0fZX7l/burFwCHNw9PQPJzble6g+8FVFQWF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779733733; c=relaxed/simple;
	bh=S7EWFsRe6EFDNRV+q8bJRA/gNPfGogxQ05662wSaYMY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RnV5E8qC6PBJ2xcV75L+oTb5v4Bp5HN5jmC4q0TmP7RbkYQlf5FZ4+fxIWWGbRaWX1/E7+76HR7NDif0dux0GplDXxnTdwOAOycT3GZrsY7SE7wFyLQ2yOxn0EKudBa85RMN5QZjtYfMLVQMo5TnvOseI9/gp6DPbmK9VYk5l6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aaVEsuQ3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aaVEsuQ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEE9C1F000E9;
	Mon, 25 May 2026 18:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779733732;
	bh=nkrZyVurZC0EQyBbkWyy5ijoXUeuhxB3VJvrGwnXnts=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aaVEsuQ3odN7zZM6oyd6U6t6fwtIs0Tv65u36eLtGY/LiDJGKlyLYLe4D7HCNv5FQ
	 IcZSEjEZppU0i3W3dJiZnQmCUdE8UTQtt8cRn6mRTHGN1eJxFbQpo64nLcthCMLcSc
	 QC7EQkynpSZHm3ayvAWrLyXGhrXE1eEoPx3/RaJUwY5wDDAD0YblYVpjUzMXuyxf54
	 WnK0hmH+MKG8+bn8TUbnuX1D/Uqy3sW3Y0kvrcI+CUvwEdeom5LKR29Hz31Lsp/2Jn
	 zJwBh00L2sTd9jF8V0KGZQN7mJBusibFKzD6UfhWsDbrMHmjDFxfwFqv7jaKt1J0qe
	 pcessLeoSwlWg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 8/9] dt-bindings: iio: temperature: Add ADT7604
 support to adi,ltc2983
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liviu Stan" <liviu.stan@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260525164013.118614-9-liviu.stan@analog.com>
References: <20260525164013.118614-9-liviu.stan@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 18:28:51 +0000
Message-Id: <20260525182851.CEE9C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `default: 1000` value on `adi,excitation-current-microamp` con=
flicts with its conditional `false` constraint, breaking schema validation =
for sub-ohm copper-trace nodes.
- [Medium] The device tree binding introduces artificial/virtual sensor typ=
es (32 and 33) instead of using the hardware's actual register values (18 a=
nd 27) for copper trace and leak detector sensors.
--

commit 6b6588f2ffbcb416f3ba3df38f643fdd0a5c9afa
Author: Liviu Stan <liviu.stan@analog.com>

dt-bindings: iio: temperature: Add ADT7604 support to adi,ltc2983

This commit adds support for the ADT7604 to the adi,ltc2983 binding. It
introduces new sensor node types for copper-trace and leak-detector sensors
which repurpose custom RTD and thermistor types on the hardware, and adds
validation constraints specific to the ADT7604.

> diff --git a/Documentation/devicetree/bindings/iio/temperature/adi,ltc298=
3.yaml b/Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml
> index a22725f7619b7..ab77f987ee02d 100644
> --- a/Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml
> +++ b/Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml

[ ... ]

> @@ -436,6 +441,121 @@ patternProperties:
>      required:
>        - adi,custom-temp
> =20
> +  '^copper-trace@':
> +    $ref: '#/$defs/sensor-node'
> +    unevaluatedProperties: false
> +    description: |
> +      Copper trace resistance sensor (some parts only). Two variants exi=
st:
> +      sub-ohm (< 1 ohm, no custom table allowed) and standard (> 1 ohm,
> +      required custom table).
> +
> +    properties:
> +      reg:
> +        minimum: 2
> +        maximum: 20
> +
> +      adi,sensor-type:
> +        description: Sensor type for copper trace sensors.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        const: 32

[Severity: Medium]
Does defining a virtual sensor type (32) conflict with the device tree
principle of describing physical hardware rather than software abstractions?

As noted in the commit message, the hardware repurposes the custom RTD
register value (18) for this sensor. Should the binding use the real
hardware value (<18>) and rely on the node name to distinguish the
configuration instead of extending this property with software-defined valu=
es?

> +
> +      adi,rsense-handle:
> +        description: Associated sense resistor sensor.
> +        $ref: /schemas/types.yaml#/definitions/phandle
> +
> +      adi,copper-trace-sub-ohm:
> +        description:
> +          Select the sub-ohm (< 1 ohm) copper trace variant. Custom table
> +          and excitation current are not allowed in this mode.
> +        type: boolean
> +
> +      adi,excitation-current-microamp:
> +        description:
> +          Excitation current applied to the copper trace. Not used in
> +          sub-ohm mode. The datasheet recommends 1mA for copper trace
> +          sensors due to their typically small resistance.
> +        enum: [5, 10, 25, 50, 100, 250, 500, 1000]
> +        default: 1000
> +
> +      adi,custom-copper-trace:
> +        description:
> +          Resistance-to-temperature table for copper trace sensors with
> +          resistance > 1 ohm. Required when adi,copper-trace-sub-ohm is =
not
> +          set. See Page 36 of the datasheet.
> +        $ref: /schemas/types.yaml#/definitions/uint64-matrix
> +        minItems: 3
> +        maxItems: 64
> +        items:
> +          items:
> +            - description: Resistance point in uOhms.
> +            - description: Temperature point in uK.
> +
> +    required:
> +      - adi,rsense-handle
> +
> +    allOf:
> +      - if:
> +          required:
> +            - adi,copper-trace-sub-ohm
> +        then:
> +          properties:
> +            adi,custom-copper-trace: false
> +            adi,excitation-current-microamp: false

[Severity: High]
Will the default value defined above break schema validation for sub-ohm
copper-trace nodes?

dt-schema injects default values for missing properties before evaluating
conditionals. If a sub-ohm node correctly omits the
adi,excitation-current-microamp property, the value 1000 will be injected
automatically. This injected property would then trigger a validation failu=
re
against the false constraint here.

> +      - if:
> +          not:
> +            required:
> +              - adi,copper-trace-sub-ohm
> +        then:
> +          required:
> +            - adi,custom-copper-trace
> +
> +  '^leak-detector@':
> +    $ref: '#/$defs/sensor-node'
> +    unevaluatedProperties: false
> +    description: |
> +      Leak detector sensor (some parts only). Outputs resistance in ohms=
 and
> +      a coverage percentage via IIO_COVERAGE (raw/1024 =3D coverage %).
> +
> +    properties:
> +      reg:
> +        minimum: 2
> +        maximum: 20
> +
> +      adi,sensor-type:
> +        description: Sensor type for leak detector sensors.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        const: 33

[Severity: Medium]
Similarly to the copper trace sensor, could this be using the actual hardwa=
re
register value (<27>) instead of the software-defined value 33?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525164013.1186=
14-1-liviu.stan@analog.com?part=3D8
