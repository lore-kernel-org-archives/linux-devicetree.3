Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579481;
	b=BNoB0R9ktbLP2j0cfHLVRm+8GGma5OQcvfQWDEWNcpXbsA0RkLDufPyFRQ9KvBSL0LO8
	 oTCDV7shYJPHSnsD5fnEsTOHWLqPOfb5Ymtp5hTPTa4abXk1jKlxLk/goCzUNMwVRilK7
	 QRzEbOYgtjugxo8XknL36ltBPIpliYvRNVYmxcyRRgpa0k/kzKiPDRbeN4+IB9j9v6+f9
	 66vBLsxatqvQYBDOZ+abey7GmTiU5wv1exqhg7kNCcq+Km9Fd/WaqyrWh6EV/Pu1aMFlg
	 snTTthf6HuT96ko7hSCMUMHNUokbWd4uTCvMPRyFkuOEi6/TIwhXxdFEKloZO2f8LAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579481;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xQ5ojqJ9pQ2W81X/8hJiJJ7TXi3U3wm7Fy13ge1ejVc=;
	b=mXt/kczw4+s2TTk159Gnc463urVSAO/KmM6SAtHGfeupA/xpUugZzWRzTKlyIEas5rF3
	 wkhIG4YgUO2+WjiQq8iE0ddhCYAULN+eLVrK64rN/MvrnhrSIif4+x+Zu/aOyhmGIk/+0
	 7YKjYPc/m3CAWxzX8HNrRsAolhzYJ1BkSWO+RPTeATwASkeVdh0rrFTH26/ZL2Fikas9e
	 iUyNIjxcD8PrYS1SoEptA6FQH+aoBJKzjGnGOcLDLan3QSdjmluh7Q3ynwnUQ+H+nMD2k
	 S/OYMOPltq7mskf5x98kAmJOSw7024Gz8W/3wMkLBqxbREMgakZfCyRJFWaB/d1zoBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EeXj2cUw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65367606A31D
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EeXj2cUw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFDA31F000C9;
	Wed, 21 Oct 2026 10:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792579481;
	bh=xQ5ojqJ9pQ2W81X/8hJiJJ7TXi3U3wm7Fy13ge1ejVc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EeXj2cUwpbh+gwb45L9VEK5uEklAyAGzVuqWkGZFkUpm6eeKB/s0242dxa5aZPljN
	 ySPHKOdrvdR7jFXUsReaURN2t0N6hJK115pjcAEVTiE9kQhdFT+bADV83Tl8/7rEOd
	 u+F4HK4z8DbuddZvREXyYYD+5cVXvRUTZKE6MYg7uo0aR3GGbdzXomKmSDrU/ZkiJe
	 Jqkwu1wp8IV/WuXxsJJF1JumGlFvhy9Pw03guVOVHVfwycJ4VtqTimOGacf6XUwGh/
	 WGRvr6tP6hwoUmbM3Sy0J4BZxTyFzxmr6xc1UlOr1Iu7czpxxSQy8FdqhNQISZIt7A
	 daeoEBdLFrDJg==
Message-ID: <sashiko-outbox-180117@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] regulator: dt-bindings: Add TI LM51772 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Louvel" <paul.louvel@bootlin.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261021-paul-lm51772-v1-2-25f0ffbffa8d@bootlin.com>
References: <20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com>
 <20261021-paul-lm51772-v1-2-25f0ffbffa8d@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 10:44:40 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Medium] regulator: dt-bindings: ti,lm51772: missing additionalProperties=
 on regulators
- [Medium] regulator: dt-bindings: ti,lm51772: invalid default: false on bo=
olean properties
- [Medium] regulator: dt-bindings: ti,lm51772: non-standard unit suffixes o=
n vendor properties
- [Medium] regulator: dt-bindings: ti,lm51772: gap in ti,ivp-thres-millivol=
t range
- [Low] regulator: dt-bindings: ti,lm51772: 10x typo in regulator-max-micro=
amp maximum
- [Low] regulator: dt-bindings: ti,lm51772: example fails dt-check-style st=
rict checks
--

commit 791e5dd89a97fb0d36e798526e83309f0104b7b6
Author: Paul Louvel <paul.louvel@bootlin.com>

regulator: dt-bindings: Add TI LM51772 support

This patch adds the devicetree binding schema for the Texas Instruments
lm51772 buck-boost voltage regulator and its auxiliary fixed 5v regulator.

> diff --git a/Documentation/devicetree/bindings/regulator/ti,lm51772.yaml =
b/Documentation/devicetree/bindings/regulator/ti,lm51772.yaml
> new file mode 100644
> index 0000000000000..1e72ac13ddfc3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/ti,lm51772.yaml
> @@ -0,0 +1,239 @@

[ ... ]

> +  The peak current limit threshold is programmed through software, betwe=
en 0.5A
> +  to 7A.
> +  The LM51772 also provides an auxiliary fixed 5 V regulator output
> +  (VCC1).
> +
> +properties:
> +  compatible:
> +    const: ti,lm51772
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +    description: Fault / warning irq.
> +
> +  vin-supply:
> +    description: Regulator supply for the chip.
> +
> +  regulators:
> +    type: object
> +    description: List of regulators provided by this PMIC.
> +
> +    properties:
> +      vout:
> +        type: object
> +        $ref: regulator.yaml#
> +        description: Main output voltage.
> +
> +        properties:
> +          ti,active-discharge-strength-milliamp:
> +            description: Discharge current for VOUT.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            multipleOf: 25
> +            minimum: 25
> +            maximum: 75
> +            default: 25
> +
> +          ti,iset-pin:
> +            description: |
> +              Select the ISET pin as the source of the current limit, in=
stead of
> +              the ILIM DAC. When this property is present, the ISET pin =
is forced
> +              in its active configuration and the ILIM DAC is disabled, =
so the
> +              current limit can no longer be programmed through the
> +              dedicated register.
> +            type: boolean
> +            default: false

[ ... ]

> +          ti,sense-res-milliohm:
> +            description: |
> +              Value in milliohms of the current sense resistor connected=
 between the
> +              ISNSP and ISNSN pins, used to translate the ILIM threshold=
 voltage into
> +              a current limit and vice versa.
> +              TI recommands a value of 10 milliohms.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            minimum: 1
> +            default: 10

[Severity: Medium]
In Documentation/devicetree/bindings/regulator/ti,lm51772.yaml,
ti,active-discharge-strength-milliamp, ti,sense-res-milliohm, and
ti,ivp-thres-millivolt use -milliamp, -milliohm, and -millivolt suffixes
with an explicit uint32 type reference.

When running make dt_binding_check, dtschema meta-schemas/vendor-props.yaml
rejects new vendor properties that use deprecated or non-standard unit
suffixes instead of standard suffixes from property-units.yaml (-microamp,
-micro-ohms, and -microvolt, which also provide the uint32 type
automatically).

Could ti,active-discharge-strength-milliamp and ti,ivp-thres-millivolt use
the standard -microamp and -microvolt suffixes, and could
ti,sense-res-milliohm use the standard shunt-resistor-micro-ohms property?

[ ... ]

> +          regulator-min-microamp:
> +            minimum: 500000
> +            maximum: 70000000
> +
> +          regulator-max-microamp:
> +            minimum: 500000
> +            maximum: 70000000

[Severity: Low]
Under properties:regulators:properties:vout in
Documentation/devicetree/bindings/regulator/ti,lm51772.yaml, both
regulator-min-microamp and regulator-max-microamp set maximum to 70000000
(70 amperes), whereas the description at the top of the file states that
the peak current limit threshold is programmable between 0.5A to 7A.

Should maximum on regulator-min-microamp and regulator-max-microamp be
7000000 instead of 70000000 so that invalid current limits above 7 amperes
do not pass schema validation?

> +
> +        unevaluatedProperties: false
> +
> +      vcc1:
> +        type: object
> +        $ref: regulator.yaml#
> +        description: |
> +          LDO regulator for auxiliary use.
> +          It can used to power, for example, a PD controller that will d=
rive this PMIC.
> +
> +        properties:
> +          regulator-min-microvolt:
> +            minimum: 5000000
> +            maximum: 5000000
> +
> +          regulator-max-microvolt:
> +            minimum: 5000000
> +            maximum: 5000000
> +
> +        unevaluatedProperties: false

[Severity: Medium]
In Documentation/devicetree/bindings/regulator/ti,lm51772.yaml,
properties:regulators is defined with type: object and child properties
vout and vcc1, but the regulators object itself does not specify
additionalProperties: false.

Without additionalProperties: false on properties:regulators, running make
dt_binding_check fails meta-schema validation and undocumented child nodes
under regulators silently pass validation. Should additionalProperties: fal=
se
be added to the regulators object?

[ ... ]

> +  ti,ivp-thres-millivolt:
> +    description: |
> +      Input Overvoltage Protection and Regulation Threshold.
> +      It shall avoid any damage to the device in case the current flows =
from the
> +      output to the input and the input source cannot sink current.
> +      This threshold is used for IVP (Input Voltage Protection) and IVR =
(Input
> +      Voltage Regulation).
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    oneOf:
> +      - multipleOf: 125
> +        minimum: 4750
> +        maximum: 23250
> +      - multipleOf: 250
> +        minimum: 23750
> +        maximum: 50000
> +    default: 50000

[Severity: Medium]
In Documentation/devicetree/bindings/regulator/ti,lm51772.yaml, the oneOf
constraints on properties:ti,ivp-thres-millivolt cover 4750 to 23250 in
steps of 125 and 23750 to 50000 in steps of 250, which leaves a gap at
23500.

In drivers/regulator/lm51772-regulator.c (from commit "regulator: Add TI
LM51772 support"), lm51772_of_parse() defines the hardware linear ranges
as:

  LINEAR_RANGE(4750000, 0x00, 0x94, 125000),
  LINEAR_RANGE(23500000, 0x95, 0xff, 250000)

where selector 0x94 is 23250 millivolts and selector 0x95 is 23500
millivolts. Should the minimum of the second oneOf branch be 23500 (or
23500000 microvolts) so that the valid 23.5 volt threshold is not rejected
by schema validation?

> +
> +  ti,ivp:
> +    description: Enable the IVP feature of the regulator.
> +    type: boolean
> +    default: false
> +
> +  ti,ivr:
> +    description: Enable the IVR feature of the regulator.
> +    type: boolean
> +    default: false
> +
> +  ti,nint:
> +    description: |
> +      Configures the nFLT/nINT pin to act as an interrupt pin.
> +
> +      nFLT mode: The pin remains low until the cause of the status chang=
e ceases.
> +      In this mode use an level irq trigger.
> +
> +      nINT mode: The pin is asserted low to signal a status change.
> +      In this mode use an edge irq trigger.
> +    type: boolean
> +    default: false
> +
> +  ti,cable-drop-compensation:
> +    description: |
> +      The cable drop compensation feature helps to keep the output volta=
ge at the
> +      nominal value over a wide range of load current without the need f=
or
> +      additional remote sensing. The cable drop compensation measures the
> +      current and offsets the output voltage proportionally to the measu=
red
> +      current.
> +    type: boolean
> +    default: false

[Severity: Medium]
In Documentation/devicetree/bindings/regulator/ti,lm51772.yaml, the boolean
properties ti,iset-pin, ti,ivp, ti,ivr, ti,nint, and
ti,cable-drop-compensation all specify default: false alongside
type: boolean.

Because dtschema meta-schemas/boolean.yaml sets additionalProperties: false
and does not allow the default keyword on boolean flag properties, running
make dt_binding_check fails validation on these five properties. Should the
default: false lines be removed from ti,iset-pin, ti,ivp, ti,ivr, ti,nint,
and ti,cable-drop-compensation?

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        pmic@6a {
> +            compatible =3D "ti,lm51772";
> +            reg =3D <0x6a>;
> +            interrupt-parent =3D <&irqc>;
> +            interrupts =3D <1 IRQ_TYPE_EDGE_FALLING>;
> +
> +            ti,nint;
> +
> +            regulators {
> +              vout {
> +                  regulator-name =3D "vout";
> +                  regulator-min-microvolt =3D <5000000>;
> +                  regulator-max-microvolt =3D <20000000>;
> +                  regulator-ov-protection-microvolt =3D <1000000>;
> +                  regulator-min-microamp =3D <1000000>;
> +                  regulator-max-microamp =3D <5000000>;
> +                  regulator-temp-warn-kelvin =3D <368>;
> +              };
> +
> +              vcc1 {
> +                  regulator-name =3D "vcc1";
> +                  regulator-min-microvolt =3D <5000000>;
> +                  regulator-max-microvolt =3D <5000000>;
> +              };
> +            };
> +        };
> +    };

[Severity: Low]
In the examples section of
Documentation/devicetree/bindings/regulator/ti,lm51772.yaml, the vout and
vcc1 child nodes under regulators are indented by 2 spaces instead of 4
spaces relative to regulators, and the child nodes and regulator-*
properties are not in canonical sort order.

Running scripts/dtc/dt-check-style --mode=3Dstrict reports indent-consisten=
t,
child-name-order, and property-order warnings here. Could the example node
indentation and ordering be aligned with dt-check-style?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-paul-lm517=
72-v1-0-25f0ffbffa8d@bootlin.com?part=3D2
