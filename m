Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157BB38E100
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 07:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785914938; cv=none; b=BVwLXN3prTEI9jjAPyLaHAvbx1Yi35uAmCk3mqKCbF6ari/vp6TquxoORrnA7FKsigVZZOmKdaLlZSa20if6+IbZ3RZpyBsq2ZaGnKLkllgTSqEJeK+uVz/dOlhXYE23opECd1jHPzJzyyLjmQdOd2CyaXJBLhFHWdwXbWUh2sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785914938; c=relaxed/simple;
	bh=rQvgFkUbrZudkPSsoD2D2UC6PW8UQGurH3Eifu8Zr5g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FuKEMp9wcxKeRdsOTUgtP9o1C1UgCQIgptMjpmKSUJfI3i6aLWTc2f5RrvUBccMGlkktPQpbBJBWB42wV2D4YmpqfH5CflS2xKWNP6Zxo8QZthECO7l+QITY9r1Wb4z1m3us0X/yrlC7VTwV9jSaKhbmasfHo/7Mf4iK/P4rptM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=axul6Re8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="axul6Re8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19AD61F000E9;
	Wed,  5 Aug 2026 07:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785914936;
	bh=qCwl+sy+f/4o6tmmDe0w61GrTxSo1IJpm1qzeCTSVcA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=axul6Re8crwXfP8aEJUI0ylNNyafSeBwfzf7tBkiF/HncutsYpzxiO42+OQ+lOax7
	 /i8BPG2EuzTubDmsvSSxM9Tt2wpfUNua9UZOvtmGwCgOTWHZl7X1cwDHLcKpwK8v6U
	 gcihswj/G79lSHcLeJIvfQ1N2ooZ1X7hjKwXd30gWwc0gBozf4nK2CeWR0JkQPoC1E
	 Ppn1W5ZOg/Wts+FfVTmqqWyaYJvj+plQJWXVgCm1cEyx9w1oBdc0epospaWTmC47QM
	 pbIM3SV8PMpBjk0BjBAbI/tO6OcwLCemOXGTkWErvjVxR9CoVjKknl8AATxh/MS1rD
	 O3UmAOaJiM2jg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/3] dt-bindings: iio: dac: Add AD5529R
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260805-ad5529r-driver-v8-2-b41781f5632a@analog.com>
References: <20260805-ad5529r-driver-v8-0-b41781f5632a@analog.com>
 <20260805-ad5529r-driver-v8-2-b41781f5632a@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 07:28:55 +0000
Message-Id: <20260805072856.19AD61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Low] The `default: 0` value for `spi-device-addr` is a scalar integer, w=
hich violates the underlying `uint32-array` type.
- [Low] The `spi-cpol` and `spi-cpha` properties are referenced in dependen=
cies but are omitted from the properties block.
- [Low] The use of `additionalProperties: false` in the channel node incorr=
ectly restricts inherited properties from `dac.yaml`.
- [Low] The `default` annotations inside the `items` array for `output-rang=
e-microvolt` are ineffective.
--

--- Patch [2]: [PATCH v8 2/3] dt-bindings: iio: dac: Add AD5529R ---
commit c7fd92093d1e8febbb573957a72221de0c72a60c
Author: Janani Sunil <janani.sunil@analog.com>

dt-bindings: iio: dac: Add AD5529R

Devicetree bindings for AD5529R 16 channel 12/16 bit high voltage,
buffered voltage output digital-to-analog converter (DAC) with an
integrated precision reference.

> diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5529r.yaml b=
/Documentation/devicetree/bindings/iio/dac/adi,ad5529r.yaml
> new file mode 100644
> index 0000000000000..9c390d460e5ff
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5529r.yaml

[ ... ]

> +  spi-device-addr:
> +    minItems: 1
> +    maxItems: 4
> +    items:
> +      enum: [0, 1, 2, 3]
> +    default: 0

[Severity: Low]
Does this default value need to be an array (e.g., [0]) to conform to the
uint32-array type defined in spi-peripheral-props.yaml? A scalar value might
cause schema validation to fail for bindings relying on this default.

[ ... ]

> +      output-range-microvolt:
> +        description:
> +          Output voltage range for this channel as [min, max] in
> +          microvolts.
> +        oneOf:
> +          - items:
> +              - const: 0
> +                default: 0
> +              - enum: [5000000, 10000000, 20000000, 40000000]
> +                default: 5000000

[Severity: Low]
Should the default keyword be declared at the property level
(e.g., default: [0, 5000000]) rather than inside the items elements?=20

It seems the schema tooling will not provide a default value when the
property is omitted if it is structured this way.

[ ... ]

> +    required:
> +      - reg
> +
> +    additionalProperties: false

[Severity: Low]
Should this be unevaluatedProperties: false instead?

In JSON schema, additionalProperties: false does not see through the $ref to
dac.yaml. This would cause common DAC channel properties inherited from
dac.yaml to be erroneously rejected by validation.

[ ... ]

> +dependencies:
> +  spi-cpha: [ spi-cpol ]
> +  spi-cpol: [ spi-cpha ]
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +unevaluatedProperties: false

[Severity: Low]
Are spi-cpol and spi-cpha missing from the local properties block?

Since they are referenced in dependencies but not explicitly declared, devi=
ce
trees configuring SPI Mode 3 might fail static validation due to
unevaluatedProperties: false not seeing them.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-ad5529r-dr=
iver-v8-0-b41781f5632a@analog.com?part=3D2
