Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131C2293B5F
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 16:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781107689; cv=none; b=GoRPPmjyuKL+T07K16D9up3rQQu+B8HAOEzq7qIqi9n/pTKE1sYWsrbwXbTBEL1Xgq6j/OKk6T4NzTG0XsJPNhPG/8xYusc4NhRNjxWzeRb5+asIwxrQQ/2H4uB8mVEX/MU2yTVw6lH0ovKtObVmVM6AR+56LLA804mdqr+xNUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781107689; c=relaxed/simple;
	bh=XbAykx9J9u9kOL4GunpqIJmiwXPHP5eFmyt8Vv/0c14=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d6Vr0vvJJN34mAbakB2gTG/dR2fxjm+USEI8QgzSGWyIuA46FQQLUVV/MV8FJoRhrSQ3bFFMkvGh3qeoDz4q5fbUrKgfTmwlZiH4h6jeyUIMre0960pdfZeRdZhBbJ0zTUtxMfQb+CwH3YFw3Okt6AlbzjxWYjoS+S7BXllGbsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=chSHvxKe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="chSHvxKe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7691B1F00893;
	Wed, 10 Jun 2026 16:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781107687;
	bh=zGfZ84wd/x+FTA/N8qM94clHO5B2Kfcq11AmXApjgeg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=chSHvxKeALJM6sgZQIs1dDlvMkASbAmAkZpJBvltAI+Xcbun0LnYepTCrbKF10h2T
	 phPtIMFeLKbGPZXw6SegbRlJwLmSGHP+6/5DYBPBpJU0URX5c6M5ASHAkzLyTWoxBB
	 svi+SH0/JCBpW1oBTtX5kg8KGGQEhNSyGgKb7tk7rZb0vsuLKA6BT6X0uVRv1sn6Ts
	 V2UxB4ysDGXFJ4urDoGZi82r71bxmlBVfAGg/s7QMs8Rejfgx+VlNN3AHwTifdao2C
	 BynkT1mncqcuSV7u7+ksVx/E4NmiVxt2dECFIi1hQZjMMsoEli+QiugnzUaY8Mz6jX
	 8TW6NzinQYCKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: sound: add qcom,wsa885x-i2c
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prasad Kumpatla" <prasad.kumpatla@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260610155708.151067-2-prasad.kumpatla@oss.qualcomm.com>
References: <20260610155708.151067-2-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 16:08:06 +0000
Message-Id: <20260610160807.7691B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] The schema incorrectly uses `additionalProperties: false` while =
including a `$ref` to `dai-common.yaml#`, which will erroneously reject val=
id standard DAI properties.
- [Medium] The binding uses a custom GPIO property (`interrupt-gpios`) to m=
odel a hardware interrupt line instead of the standard `interrupts` propert=
y.
- [Medium] The `qcom,wsa885x-init-table` property inappropriately encodes r=
aw hardware register scripts into the Device Tree.
- [Low] Wildcard ('x') used in the compatible string instead of specific ha=
rdware part numbers.
--

commit 535bce1da75b7ff8bde3534f15f04d5dbbcc99a2
Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

dt-bindings: sound: add qcom,wsa885x-i2c

This commit documents the Qualcomm WSA885X I2C smart amplifier binding. It=
=20
describes the required supplies, powerdown and interrupt GPIOs, battery=20
configuration, and an initialization table for programming the device.

> diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa885x-i2c.yam=
l b/Documentation/devicetree/bindings/sound/qcom,wsa885x-i2c.yaml
> new file mode 100644
> index 0000000000000..1069f470dea5d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,wsa885x-i2c.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,wsa885x-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm WSA885x I2C smart speaker amplifier

[ ... ]

> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,wsa885x-i2c

[Severity: Low]
Is it standard to use a wildcard (x) in the compatible string here?=20

Devicetree typically requires specific hardware part numbers, such as=20
qcom,wsa8850-i2c, to ensure future variant quirks or different tuning=20
requirements can be handled properly without ambiguity.

> +
> +  reg:
> +    maxItems: 1
> +
> +  '#sound-dai-cells':
> +    const: 0
> +
> +  powerdown-gpios:
> +    description: GPIO controlling the SD_N powerdown pin.
> +    maxItems: 1
> +
> +  interrupt-gpios:
> +    description: GPIO used for the codec interrupt output.
> +    maxItems: 1

[Severity: Medium]
Does this hardware interrupt line need to be modeled as a raw GPIO property=
=20
rather than using the standard interrupts and interrupt-parent properties?=
=20

Modeling it as a standard interrupt allows proper subsystem integration and=
=20
routing, whereas interrupt-gpios bypasses the standard IRQ hierarchy.

> +
> +  vdd-1p8-supply: true
> +
> +  vdd-io-supply: true
> +
> +  qcom,battery-config:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Speaker battery configuration, 1 for 1S and 2 for 2S.
> +    default: 1
> +    enum: [1, 2]
> +
> +  qcom,wsa885x-init-table:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 2
> +    maxItems: 256
> +    description: |
> +      Sequence of register/value pairs applied during codec hardware
> +      initialization. Entries are encoded as alternating register addres=
s and
> +      register value cells. The number of entries must be even (register=
/value
> +      pairs); maxItems is 256 (128 pairs).

[Severity: Medium]
Does this property encode raw hardware register scripts directly into the=20
devicetree?=20

The devicetree is generally meant to describe static hardware topology rath=
er=20
than act as a repository for magic register initialization sequences.=20
Typically, this sort of initialization logic resides within the driver code=
=20
itself, keyed off specific compatible strings.

> +
> +required:
> +  - compatible
> +  - reg
> +  - '#sound-dai-cells'
> +  - powerdown-gpios
> +  - interrupt-gpios
> +  - vdd-1p8-supply
> +  - vdd-io-supply
> +
> +additionalProperties: false

[Severity: Medium]
Since this binding includes a reference to dai-common.yaml# in the allOf=20
block above, will using additionalProperties: false cause standard DAI=20
properties to be erroneously rejected?=20

The additionalProperties keyword only accounts for properties explicitly=20
defined in the local schema. The standard approach in this scenario is to=20
use unevaluatedProperties: false so that properties from the referenced=20
schema are correctly validated.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610155708.1510=
67-1-prasad.kumpatla@oss.qualcomm.com?part=3D1
