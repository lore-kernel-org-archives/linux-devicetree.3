Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC0130B509
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 20:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778791387; cv=none; b=ZVkkUe0rYgXBcgdDi7EJ5Rmdxgw5RgOoYYIvibdD65Tf4uQDxGXBW1AnhDlgYuHGAHXjTY3b2kU1EEqDR3VllL5APLoikPlObdsuDW3+ve/hotRO2NjFF/ocJf+MfAsy1PSQ1ZjwzdNK1G28doK///DZuRirBsO3AFVG6JCF8J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778791387; c=relaxed/simple;
	bh=m37QqyjHIDR1o161/a9248QqhebCQ06sgkXcwkRom/8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ox5wVibN03GmqR7xuB16R+hcB2G1bwcyHe86Z7AVsry/QilW0vT+4pGShZCDXTRRHiZ/ej3C95R29I2E1VjZ39Drgq/8nnoIsk0ZRTotBnRcdjUPYK1Qt8W0POeE74U/pe545PhldEl7AHCnEu1baNTswjLenhj0Cugo6Gp0IWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hL0heXQp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hL0heXQp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3121EC2BCB3;
	Thu, 14 May 2026 20:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778791387;
	bh=m37QqyjHIDR1o161/a9248QqhebCQ06sgkXcwkRom/8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=hL0heXQpglnggmbU4wwjKNVThffOJDZuy4XNZcOf0OUD/ypzu282E/1qCB+m4n1iW
	 J6Ins7KTt/Ak5+cKrJ3HA1vmPvVy6bamup8GSIF/DJWcO9uCvitJRI/oOCk21erTzo
	 ZIMh+F/0wLK/5f0VkkkyRTtrnk5/T0CTQkC+2TWbkq+djP0dxevzUSSCYssMLQQ2nT
	 Yf9M52GdyeWjBjDhi4X0FToFZTz9kLj3HbR9DpwNoURBUQ7iNTbLKWqm9iFfn197et
	 pzZPHVkt3tLzeifsGY8GQdA5hn4vGxNoeSXtnmmk+YLr1scNK+XwIqi28C1PIEJMg/
	 yvbJpryxZzidg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/7] dt-bindings: iio: temperature: Add ADT7604
 support to adi,ltc2983
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liviu Stan" <liviu.stan@analog.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260514144712.64374-7-liviu.stan@analog.com>
References: <20260514144712.64374-7-liviu.stan@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 20:43:06 +0000
Message-Id: <20260514204307.3121EC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Device Tree hardware representation violation: Fake `adi,sensor-ty=
pe` values used for new sensors
- [High] Device Tree abstraction violation: Encoding coverage percentage as=
 fake Kelvin temperature
- [Medium] Subsystem Guideline Violation: Missing `adi,adt7604` from genera=
tional conditional block
- [Medium] Incomplete schema validation for repurposed sensor types on ADT7=
604
--

commit 29985f1c91396fb1c61d9d6e8e7e4bc36c38266c
Author: Liviu Stan <liviu.stan@analog.com>

dt-bindings: iio: temperature: Add ADT7604 support to adi,ltc2983

This commit adds device tree bindings support for the ADT7604
multi-sensor temperature system. It introduces new copper trace and leak
detector node types, mapping them to existing hardware capabilities. It also
restricts unsupported node configurations for the ADT7604.

> diff --git a/Documentation/devicetree/bindings/iio/temperature/adi,ltc298=
3.yaml b/Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml
> index a22725f7619b7..c63b69bd95045 100644
> --- a/Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml
> +++ b/Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml

[ ... ]

> @@ -436,6 +441,115 @@ patternProperties:
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
> +      optional custom table).
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

Is it appropriate to use 32 as the sensor type here?

The commit message indicates the hardware repurposes the custom RTD sensor
type 18 for this. Since the hardware channel assignment field for sensor
types is typically 5 bits with a maximum value of 31, does enforcing 32 in
the device tree leak a virtual driver ID into the ABI rather than describing
the actual hardware registers?

[ ... ]

> +  '^leak-detector@':
> +    $ref: '#/$defs/sensor-node'
> +    unevaluatedProperties: false
> +    description: |
> +      Leak detector sensor (some parts only). Outputs resistance in ohms=
 and,
> +      when a custom table is provided, a coverage percentage via
> +      IIO_COVERAGE_PERCENT (raw/1024 =3D coverage %).
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

Similar to the copper trace sensor, the commit message states this
repurposes the custom thermistor type 27. Should this be constrained to 27
instead of 33 to match the hardware register value?

[ ... ]

> +      adi,custom-leak-detector:
> +        description: |
> +          Lookup table mapping resistance to coverage data. Entries must=
 be
> +          in ascending resistance order. The coverage data field encodes=
 the
> +          coverage percentage P as (P + 273.15) expressed in uK, i.e.
> +          (P * 1000000 + 273150000).
> +        $ref: /schemas/types.yaml#/definitions/uint64-matrix
> +        minItems: 3
> +        maxItems: 64
> +        items:
> +          items:
> +            - description: Resistance point in uOhms.
> +            - description: Coverage data point (P + 273150000) in uK.

Does this encode non-temperature measurements with arbitrary Kelvin offsets
into the device tree?

It seems this tightly couples the device tree ABI to internal driver
interpolation logic that expects to subtract 273.15. Could the device tree
store the raw coverage percentage mapping instead?

[ ... ]

> @@ -477,6 +591,22 @@ allOf:
>        patternProperties:
>          '^temp@': false
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: adi,adt7604
> +    then:
> +      patternProperties:
> +        '^thermocouple@': false
> +        '^diode@': false
> +        '^adc@': false
> +        '^temp@': false

The DT bindings subsystem guidelines indicate that when a new compatible
string shares constraints with existing generations, it should be added to
the existing conditional blocks.

Since there is an existing block that already restricts ^temp@ for other
compatible strings, should adi,adt7604 be added to the compatible enum in
that existing block rather than duplicating the ^temp@ restriction here?

Additionally, since types 18 and 27 are repurposed on the ADT7604, does
this schema allow device trees with invalid rtd@ nodes using
adi,sensor-type =3D <18> or thermistor@ nodes using adi,sensor-type =3D <27>
to silently pass validation?

Should the then clause also restrict the sensor types allowed within rtd@
and thermistor@ for the ADT7604?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514144712.6437=
4-1-liviu.stan@analog.com?part=3D6
