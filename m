Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7484837267C
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 07:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787816691; cv=none; b=skwezIy1+jq1SFdDxtnYSF/GCKXRNFea3NnGN9ZeI5OivXjjRSiWf3Pwkzx09fDjYUR9TNPY3q2Dv1JCx9YYhnzc6O/k9UoMIC9CKhu6O9BQ6Z022k37RiYHml7o+/vkwb926B6M6/xjiIWTvgg/+kEv+OOlXqhVz4BTzxmpL4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787816691; c=relaxed/simple;
	bh=tEAblH+ZtGLun5yy7dXXZHmxIiPRwiz1eD6P092lNI8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DfiJvR3pJO1hK8s8dZibtajABxmZgLYWl0hRgZwWd1j2lR7+cauXSVM7BS2JJ+PiImoZ5QtiYijKWtDh3gNiS7nJEMBuMsoJpS2bw0UMW+IOnZypfi7ZKsKMSExN9ANYgL5gtD+1fYSg1+JYNHhfZVFUHr4KoTZPmUcaj7CnLgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvVrvfNp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JvVrvfNp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B3F1F000E9;
	Thu, 27 Aug 2026 07:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787816690;
	bh=MmSHuwyhsu3i9hN5/fKpQUVmb4UzKjhLQMYtFtKJqfc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JvVrvfNp0fhuWizyCdPHd4asYhO+aB2DoM2s4/2Z09u9xggoOQvpru8/xHeQZ+ax3
	 jD0p2XHDTVPElXM4AxHTJ1vLQjcx26r4VE27IElQYRA+ouvM/TNcI6nlKNbzCUuvTU
	 jB/cq1ExyoFiH1EhFXpDP++/O/riBlFXbvyjf9U3zDXHxcL62hmTTHdfQ/cRzXyfDH
	 /vqJhEybNTDVmeG4kT4CblNAlsmHVPFkECR6R3DaHyye1wANs59Vgm0zxoJ+ttfAea
	 4ALSbDVmk0lhOIt5atqSY+dPpbspjPFR328yZZV5yJMbAKoE6jwuEY5KQ/o2bgug3Q
	 O2Cd22NnUTk/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/3] dt-bindings: iio: dac: Add AD5529R
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260827-ad5529r-driver-v10-2-38f2be07b824@analog.com>
References: <20260827-ad5529r-driver-v10-0-38f2be07b824@analog.com>
 <20260827-ad5529r-driver-v10-2-38f2be07b824@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 07:44:49 +0000
Message-Id: <20260827074449.C4B3F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Schema type mismatch for `spi-device-addr` default value.
- [Low] Schema inheritance blocked by `additionalProperties: false` in chil=
d node `patternProperties`.
--

commit 2a10366a840751ddbc9e8abde9e46cd15e15f671
Author: Janani Sunil <janani.sunil@analog.com>

dt-bindings: iio: dac: Add AD5529R

This commit introduces device tree bindings for the AD5529R 16-channel
12/16-bit high voltage digital-to-analog converter.

> diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5529r.yaml b=
/Documentation/devicetree/bindings/iio/dac/adi,ad5529r.yaml
> new file mode 100644
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
Will this default value cause a dt_binding_check validation failure?

The spi-device-addr property inherits its base type from
/schemas/spi/spi-peripheral-props.yaml#, which defines it as a uint32-array.
However, adi,ad5529r.yaml sets its default value to a scalar integer 0 inst=
ead
of a JSON array like [0]. dt-schema enforces type matching on default value=
s,
so this will cause a schema compilation and validation error.

> +    description:
> +      Hardware address of each device, selected by the ID0 and ID1 pins.
> +      Up to four AD5529R devices can share a single SPI chip select.
[ ... ]
> +patternProperties:
> +  "^channel@([0-9a-f]{1,2})$":
> +    $ref: dac.yaml
> +    type: object
> +    description: Child nodes for individual channel configuration
> +
> +    properties:
> +      reg:
> +        description:
> +          Flattened channel number across all AD5529R devices sharing th=
e chip
> +          select. Within each 16-channel block, the physical channel num=
ber is reg % 16.
> +        minimum: 0
> +        maximum: 63
> +
> +      output-range-microvolt:
[ ... ]
> +    required:
> +      - reg
> +
> +    additionalProperties: false

[Severity: Low]
Does this block properties inherited from the referenced dac.yaml schema?

The patternProperties block for child nodes uses additionalProperties: false
alongside $ref: dac.yaml. In JSON Schema, additionalProperties only applies=
 to
properties explicitly defined in the local properties block, so it will rej=
ect
any standard properties inherited from dac.yaml (such as label) unless
unevaluatedProperties: false is used instead.

> +
> +required:
> +  - compatible

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827-ad5529r-dr=
iver-v10-0-38f2be07b824@analog.com?part=3D2
