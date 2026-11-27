Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795817251;
	b=EyBf+7Z+YGoP24LbsIr1Mq32zqQSccgi442gPD9811chI9itHzAmlL4pUkQBeuIlb1tz
	 p7+vfTUGv+lHFdyDKy3MTzt1MbeQZY9pzA7qRvdmnOYuKcBEteXoqJ4Q0TtRll2Bzp0Of
	 2T/D01JN9gMusubAHO+Ib1HGOqM/TIheOTT7c+r3uzoX3FYHAEZCnwTflu+uB9iPJYTWa
	 ty3faC17GnWafTkElbQNTxiBPRXanyIL/U0Eeq8UojS+yjpsxB4GtkFrQSZZj8PyUBdis
	 bpOJEwJK91UZafKn3TJkOHRSBdACfgn/HGNRe+7DxHQH1MoBTblobOoF/6NJsu3YwTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795817251;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=b+TEcgQcMJk+dw72zXulogEackjisSyttnHoLvscCVU=;
	b=ikNJYp4yrIgljHDjpq9Hn1V0FqOTXYyFClVR7Dw0VmWKwALu31B96vrZ/fTUPHT06BJe
	 5yLBnl9aenGamJzyL2SmnLEyoRJIG/0Ebe6njZGy99JM8DzyL7vrPC4xYbbm5OwsD6nZ5
	 9Ax175gxTMvol4o0qycN93eINBZ8vujVNTeLtb7D0aHozzBgA7oJLxJpcIIuJ/9yIJdT3
	 AxDSFvyKDsgcicpu39HYXTwJcySssDD3OTEIvB3mDStARG19wEV78fTND/3LeOl3TVymu
	 /jSALDClvf/thTr2vlm3TWNi2u/Q6vCDsRPCx2SJjA2kjtxEEShCveQTRc3kFPkzY9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WoM0rNHq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8821606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 22:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WoM0rNHq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 513EE1F00897;
	Fri, 27 Nov 2026 22:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795817250;
	bh=b+TEcgQcMJk+dw72zXulogEackjisSyttnHoLvscCVU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WoM0rNHq5hvKp6QxopGbVzPQ4WSBF/jIoSRxpl02QiM6nsevzC1CNgO0y4kQd+WIt
	 MimWKphcG6AUzhSB+y+SS+RasHGMutXRi2tFtlzZdtjUZOkTawnIIfnzlIyh8WOrE9
	 Fdoqm1/vV2zxWLiqgwOCPfUKvSfSDeUl6ZTo6u+/v4CcCa/RsrCSomn/EePKzwKiot
	 3hVb1E9SoBHHKgkIRkdeA0X1ZW9Cpcos7WUT2TCgSC0Rkm0wnIl72DjepHWSJMYg04
	 L/tqOO+Dnm9DtXQrgnqpIMbtA7+le9rPCTdBayzo4Ia/uX/yYDWpc6sxPSnlRsIiN0
	 bUq+xBjk9+h9g==
Message-ID: <sashiko-outbox-238319@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] dt-bindings: iio: adc: Add ADA4355
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <8813d3f0e71d8917d13db74e4432002bb57548af.1795816065.git.marcelo.schmitt@analog.com>
References: <cover.1795816065.git.marcelo.schmitt@analog.com>
 <8813d3f0e71d8917d13db74e4432002bb57548af.1795816065.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 22:07:29 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [Low] dt-bindings: iio: adc: missing maxItems on single-pin GPIO
  properties
- [Low] dt-bindings: iio: adc: typo in adi,lfp-gpios property name for
  low-pass filter
- [Low] dt-bindings: iio: adc: adi,gsel-gpios uses minItems/maxItems
  instead of items
- [Low] dt-bindings: iio: adc: copy-pasted pulsar_lvds URL in
  io-backends description
- [Low] dt-bindings: iio: adc: non-canonical property ordering in
  adi,ada4355.yaml
--

commit d52bd9771b5186971c4b9ce320e630e432350d61
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

dt-bindings: iio: adc: Add ADA4355

This commit adds the Device Tree binding schema for the Analog Devices
ADA4355 and ADA4356 transimpedance current-to-bits receivers and adds a
corresponding entry in MAINTAINERS.

> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ada4355.yaml b=
/Documentation/devicetree/bindings/iio/adc/adi,ada4355.yaml
> new file mode 100644
> index 0000000000000..d169619fef25a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ada4355.yaml
> @@ -0,0 +1,104 @@

[ ... ]

> +  adi,vld-en-gpios:
> +    description: GPIO connected to the VLDEN pin for VLD output enable.

[Severity: Low]
Does adi,vld-en-gpios need maxItems: 1 (and similarly adi,lfp-gpios
below)?  In dtschema, *-gpios properties must specify their length via
maxItems or items, otherwise make dt_binding_check fails meta-schema
validation.

> +
> +  adi,gsel-gpios:
> +    description:
> +      GPIOs connected to the GSEL0 and GSEL1 pins, in that order, for
> +      transimpedance gain selection.
> +    minItems: 2
> +    maxItems: 2

[Severity: Low]
Since adi,gsel-gpios has a fixed two-entry list for GSEL0 and GSEL1,
should it use an items list with per-entry descriptions instead of
enumerating the pins in a free-form description with minItems and
maxItems?

> +
> +  adi,lfp-gpios:
> +    description:
> +      GPIO connected to FSEL for internal low pass filter bandwidth sele=
ction.

[Severity: Low]
Is adi,lfp-gpios a typo for adi,lpf-gpios (low-pass filter) or
adi,fsel-gpios (matching the FSEL pin name)?

> +
> +  io-backends:
> +    description:
> +      The AXI ADC IP block connected to the D+/- and DCO+/- lines of the
> +      ADC. An example backend can be found at
> +      http://analogdevicesinc.github.io/hdl/projects/pulsar_lvds/index.h=
tml.
> +    maxItems: 1

[Severity: Low]
Should this URL point to
https://analogdevicesinc.github.io/hdl/library/axi_ada4355/index.html
(from commit "dt-bindings: iio: adc: Add AXI ADA4355 IP CORE") instead
of the PulSAR LVDS project?

> +
> +required:
> +  - compatible
> +  - reg
> +  - vcc-supply
> +  - spi-3wire
> +  - spi-cpha
> +  - clocks
> +  - adi,vld-en-gpios
> +  - adi,gsel-gpios
> +  - adi,lfp-gpios
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    spi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        adc@0 {
> +            compatible =3D "adi,ada4355";
> +            reg =3D <0>;
> +            spi-max-frequency =3D <100000>;
> +            spi-3wire;
> +            spi-cpha;
> +            vcc-supply =3D <&supply_3_3V>;
> +            clocks =3D <&ref_clk>;
> +            adi,vld-en-gpios =3D <&gpio0 89 GPIO_ACTIVE_HIGH>;
> +            adi,gsel-gpios =3D <&gpio0 86 GPIO_ACTIVE_HIGH>,
> +                             <&gpio0 87 GPIO_ACTIVE_HIGH>;
> +            adi,lfp-gpios =3D <&gpio0 88 GPIO_ACTIVE_HIGH>;
> +            io-backends =3D <&axi_adc>;
> +        };
> +    };

[Severity: Low]
This isn't a bug, but the property order across properties, required and
examples does not follow the canonical DT binding sequence: clocks
belongs right after reg, standard properties such as io-backends go
before vendor-specific adi,* properties, and required lists vcc-supply
before spi-3wire and spi-cpha unlike properties and examples.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795816065.gi=
t.marcelo.schmitt@analog.com?part=3D4
