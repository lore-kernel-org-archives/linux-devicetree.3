Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793330604;
	b=ZHHjd6Pap7Pgv5URPl8asrgmRilRY110UGkYQAyE3qpAJaUll1PU/GvPq6sBFHARvsnl
	 7NyaM+CWhSbLRNsCozeN++/dpL9omiqtn7h8BkkvfDV1caeXyNk6GE4G9kT0PNxEd/Obr
	 dztLVMN/umDYCoDHmF/6BEkB5+6GXLK5hi9jtil+ldcHgmZzNosI1g8c4RuFWO9iBQtPR
	 zqnM8Fpt9Dv2elfc1TrbUAAn1+hb/d3CCkrhf/qiVzhjQ+aq/IuHz2gkRUDOD4Ccn02Cs
	 Dl6lH7Ns0KqbEev01TklmnYJkjVoP4Vyz1AQbf44Rk+fM0gzL2IgnaJJvlBStplrWMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793330604;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9jPY7uG0ceVJFJPV9vaaa9pWoeHXXPYo8zKBnk7Vpss=;
	b=MQAkTWwqpKkSBV//+7baJwSJaj7msjRGnLayFul4oOJKzuipTuH9MYdiA4FFkMWeVNRe
	 tE8E+1HzFUAVinoK4xTF0UGCAXazoL6kwMrHElJGcTIntJgU9qMVr2gzwyzxlhqVhy3so
	 tKURvSR6puV7wGiE8ReMES9YdccvBlgfZe3Gp1WPMHc2QvAMZRh6PNQESXacF7z2qrlXQ
	 soBUy0/YCHjg8U7seKG66Wts3r6Mj4q7jQjq7dDYeFkaZoK3Pzmz8jfKiMafqLLwmPneJ
	 JIFXojpgOJKM22cAGgMbpdcEqPxmFLd2ldH4d9tgTQlPrFSgyhUYxrw0HXtZIenz3VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=juSNNJLL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A3B606A31A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 03:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=juSNNJLL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53DD01F000C1;
	Fri, 30 Oct 2026 03:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793330603;
	bh=9jPY7uG0ceVJFJPV9vaaa9pWoeHXXPYo8zKBnk7Vpss=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=juSNNJLLgfOQBz3S1Nq6IYVFhqco66i44mdAwGRpHe5UY72DBGnzsFLojeanI7kpX
	 z+fL6G5jdiLwnuDr2TJ1NHfCsJfVd+B7KxKEil+5kKPTsRNtf9/cbN6fcC3xb/EjMj
	 CobbpG5IzefmOIjarOWwblhxqImRu6OhRR7WKk4uGSCtQYoRqt/cCVuOGK8pzSl0Zj
	 EIUwwZvqJlXxDj99YVQMzznX3xgf//fozHC+PW00oGXFbP/3Sn1WU8m4bvTHvTJ7WW
	 SxtYTH3URtIxvUCqwU8hrW15TyhXpZYbbaNAN98BVy1vo2YfXCzQY2B7p7kMaj30tQ
	 qBJQhmR5fMTTQ==
Message-ID: <sashiko-outbox-190221@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chi-Wen Weng" <cwweng.linux@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261030031501.130290-2-cwweng.linux@gmail.com>
References: <20261030031501.130290-1-cwweng.linux@gmail.com>
 <20261030031501.130290-2-cwweng.linux@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 03:23:22 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: iio: adc: channel schema inverts adc.yaml different=
ial semantics
- [Medium] dt-bindings: iio: adc: incomplete channel property restriction w=
ith adc.yaml
--

commit f0823504c40ee953b211fa5196cd4cbe1be6611c
Author: Chi-Wen Weng <cwweng@nuvoton.com>

dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC

This commit adds the devicetree binding schema for the Nuvoton MA35D1
Enhanced Analog-to-Digital Converter (EADC), describing its interrupts,
clocks, resets, reference supply, DMA support, and channel child nodes.

> diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-ead=
c.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
> new file mode 100644
> index 0000000000000..97144a8eeb5c1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml

[ ... ]

> +patternProperties:
> +  '^channel@[0-7]$':
> +    type: object
> +    $ref: /schemas/iio/adc/adc.yaml#
> +    unevaluatedProperties: false
> +    description: |
> +      External EADC channel description.
> +
> +      For a single-ended channel, single-channel specifies the external
> +      analog input number (0 through 7), while reg provides the logical =
IIO
> +      channel index.
> +
> +      For a differential channel, omit single-channel. The reg value sel=
ects
> +      one of the four fixed hardware differential pairs: reg 0 selects 0=
-4,
> +      reg 1 selects 1-5, reg 2 selects 2-6 and reg 3 selects 3-7.
> +
> +    properties:
> +      reg:
> +        maximum: 7
> +
> +      single-channel:
> +        maximum: 7
> +
> +      # Differential pairs are fixed in hardware and are selected by reg.
> +      diff-channels: false
> +
> +      bipolar: false
> +
> +      common-mode-channel: false
> +
> +      settling-time-us: false
> +
> +      oversampling-ratio: false

[Severity: Medium]
Does using unevaluatedProperties: false here leave other unsupported
properties from Documentation/devicetree/bindings/iio/adc/adc.yaml permitted
in channel@[0-7] child nodes?

Because adc.yaml is referenced with unevaluatedProperties: false and only
five properties are explicitly set to false above, the remaining properties
defined in adc.yaml (reference-sources, input-chopping, excitation-channels,
excitation-current-nanoamp, and burn-out-current-nanoamp) will still pass
schema validation.

Should patternProperties.'^channel@[0-7]$' use additionalProperties: false
instead and list only the supported properties from adc.yaml?

> +
> +    allOf:
> +      - if:
> +          not:
> +            required:
> +              - single-channel
> +        then:
> +          properties:
> +            reg:
> +              maximum: 3

[Severity: Medium]
Doesn't forbidding diff-channels and using the omission of single-channel to
select differential pairs invert the standard semantics in
Documentation/devicetree/bindings/iio/adc/adc.yaml?

In adc.yaml, properties.single-channel specifies:

  single-channel:
    $ref: /schemas/types.yaml#/definitions/uint32
    description:
      When devices combine single-ended and differential channels, allow the
      channel for a single element to be specified, independent of reg (as =
for
      differential channels). If this and diff-channels are not present reg
      shall be used instead.

Under adc.yaml, a child node with neither single-channel nor diff-channels
(such as channel@1 with only reg =3D <1> in the example) represents a
single-ended channel on input reg, whereas this schema treats it as
differential pair 1-5.

Additionally, for single-ended channels, reg (0 through 7) acts as a logical
channel index independent of the input pin selected by single-channel, while
for differential channels reg (0 through 3) is forced to act as both the
child node unit address and the hardware differential pair selector. Because
sibling devicetree nodes cannot share the same reg value, a board that uses
reg =3D <0> for a single-ended channel on another input (for instance,
channel@0 with reg =3D <0> and single-channel =3D <2>) cannot also describe
hardware differential pair 0-4, which requires reg =3D <0>.

Could differential channels use diff-channels constrained to the four valid
hardware pairs (<0 4>, <1 5>, <2 6>, and <3 7>) so that reg remains purely
the logical channel index?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030031501.1302=
90-1-cwweng.linux@gmail.com?part=3D1
