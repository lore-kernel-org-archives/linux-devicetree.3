Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A3735292A
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 04:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786162098; cv=none; b=ooAIrfjRqUyDatn2hJJfWOQse6ZKkSWrsn0eM5fDHGI49yk09apvv86WrwnJ7nW5gj78WGICuHttZ68g2YaHWx5CRxrqjLQC0s0K55AXgLoXECK9ZcsakuhjJ5h5RRuX8cJoRTleTiMiqy98eV4t+yieHFF/y2E8azsyZ+AEfP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786162098; c=relaxed/simple;
	bh=wEgnz5a+TYgooOn43l9iTd0SBRKHKSpm/FYMntEQL8w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AubiMKH558bo5ACz7oRFAJpYHBEwwTdox1H5Xhr2RPMppApD8ybCSV3pSbYAPMV3j5Jao3ZMm8KEj7JVfGDdACmZgpMJLqEyuRTLoqXb3A/sAl/cfzFmOw0c9jqKhF9135/gWrlZ4h9zhBUnntUfD4EUlGtEnEM+LWGhhuRbtzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f6et17Jn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f6et17Jn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D08CC1F000E9;
	Sat,  8 Aug 2026 04:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786162097;
	bh=W0lFoviJd1cKIzBEQnuKBpJE9u0oEZDg+MuD1qQlHLI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f6et17JnuwNOOscNsvEQrQUDjVgmsoF5FyflphSQkR4Yttrp4K9PZlrO+lixZIkdN
	 2J8KFat2ubWTDTbJydItlob0hUT4BuV35Jnw3XQHEIPSmmUSWY0ryg5CpPa1Q8Cxr/
	 j86uTGe7Pk+cs1im4To3H0TQ1pythHZAZjn7r9DmH4LrZ846DSRHaZ1v8vuXweoRbP
	 DM+iof1q++0vtGYl62uYsNdMHo3dbrqrFqL4Q4X0WMZDUPFPUpjV4N4+T1iDEuXgpu
	 ye7ggZBKj7QMWK4UyENgY7H2Md+/UYp4i+9TRD6KthoZ1HRLISOIjJlFhQGYIDFMFR
	 Qj4tPN7OC0/fw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/9] dt-bindings: iio: adc: support the TI ADS126x
 ADC family
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260807-ads126x-v3-1-f89925d72792@gmail.com>
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
 <20260807-ads126x-v3-1-f89925d72792@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 04:08:16 +0000
Message-Id: <20260808040816.D08CC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The `interrupt-names` constraint incorrectly uses `enum` directly =
instead of `items: enum:`, causing schema validation failures.
- [Medium] The `interrupt-names` property is semantically abused to configu=
re hardware routing instead of naming interrupts.
- [Medium] The compatible string `ti,ads1263` lists `ti,ads1262` as a fallb=
ack, but they have incompatible IIO provider interfaces due to differing `#=
io-channel-cells` requirements.
--

--- Patch [1]: [PATCH v3 1/9] dt-bindings: iio: adc: support the TI ADS126x=
 ADC family ---
commit b073c29433e55e8e8b4d7125bae2d50b6eaba149
Author: Kurt Borja <kuurtb@gmail.com>

dt-bindings: iio: adc: support the TI ADS126x ADC family

The commit adds devicetree bindings for the TI ADS1262 and ADS1263 ADCs.
It defines the required and optional properties, including regulators, input
channels, excitation currents, and interrupts.

> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads1262.yaml b/=
Documentation/devicetree/bindings/iio/adc/ti,ads1262.yaml
> new file mode 100644
> index 0000000000000..c43ba7abb3916
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads1262.yaml
> @@ -0,0 +1,379 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/ti,ads1262.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI ADS1262/ADS1263 analog to digital converter
> +
> +maintainers:
> +  - Kurt Borja <kuurtb@gmail.com>
> +
> +description: |
> +  The ADS1262 and ADS1263 are 38.4-kSPS, delta-sigma (=CE=94=CE=A3) ADCs=
 with an
> +  integrated PGA, reference, and internal fault monitors. The ADS1263 in=
tegrates
> +  an auxiliary, 24-bit, =CE=94=CE=A3 ADC intended for background measure=
ments.
> +
> +  Datasheets:
> +    - ADS126x: https://www.ti.com/lit/ds/symlink/ads1262.pdf
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: ti,ads1262
> +      - items:
> +          - const: ti,ads1263
> +          - const: ti,ads1262

[Severity: Medium]
Since ti,ads1263 dictates #io-channel-cells: const: 2 (lower down in the
binding) and ti,ads1262 dictates const: 1, are they truly ABI compatible?

If an older OS driver only knows ti,ads1262, it will expect 1 cell. When
the IIO subsystem attempts to translate a consumer phandle with 2 cells via
of_xlate, it will reject it due to an invalid argument count, breaking all
IIO consumers.

Should ti,ads1263 just be a standalone compatible string rather than using
ti,ads1262 as a fallback?

[ ... ]

> +  interrupt-names:
> +    description:
> +      Specify which pin should be configured as Data Ready interrupt.
> +    enum: [drdy, dout-drdy]

[Severity: High]
Does this schema validation fail for device trees using interrupt-names?

In JSON schema, DT -names properties are implicitly parsed as arrays of
strings (via the core interrupts.yaml meta-schema). By using enum
directly on the array property instead of items: enum:, the schema checks
if the entire array instance (e.g., ["drdy"]) perfectly matches one of the
scalar string values in the enum list. Since an array is never equal to a
string, this will always evaluate to false, breaking schema validation.

[Severity: Medium]
Is interrupt-names being used here to configure hardware routing rather
than identifying interrupts to the OS driver?

The devicetree specification dictates that interrupt-names is strictly used
to map human-readable names to indices in the interrupts array. It must not
be used as a configuration property to tell the driver which physical pin on
the ADC to route a signal to.

Could a custom property (e.g., ti,drdy-pin) be used for hardware routing
configuration instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-ads126x-v3=
-0-f89925d72792@gmail.com?part=3D1
