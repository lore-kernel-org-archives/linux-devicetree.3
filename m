Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D6D3FC5BD
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785240881; cv=none; b=VKpQmotukzKkFBHj/W2j2wlQfgExjFX12gi2O8mpMh43BlJ1/9C2hEdgRQ5uNz55SAuhgHFWF1Y5O38y2Rrvd+eeK/SrUZ884JV3Y+XaU/IPTODU6L/Gi33PjDSuqsHB7aQTmRDdUK+u9H5OQNiQ3NGpGN0Ga6n9b4Q/PG78nh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785240881; c=relaxed/simple;
	bh=nwtxjaGTVzUJ/+HLtSNPaEK3PLblyrqIYPo2g3sTJI0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oKoJCA4Q44GVJstmChcFoGjhy9TySd5Hgi6JvL6nnjReVlVNOsN0266uh+B3B4b+JvgbEXKqLUKgbw4LaeZWgMUPWY0igSEzUGhpvp6XNXAMdqQAmEvw6lTavOhag4YZh6cp4Da81MquaQURewez/XglgTKFoFauT6Vt+Zg4MbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lFFVgFZh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFFVgFZh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D2851F000E9;
	Tue, 28 Jul 2026 12:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785240879;
	bh=0Ym5B8f2TUJY9TqsIKryxaV5VbgFfml+CEB28VISMGo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lFFVgFZhk4MSGmd6fYM+x1ynkES0IIX3FkN18u2epBJOfYKl3bxCkMx345q9rDQeO
	 GCPi+EIDqvQFTxhtaVCloyUnyU+sX5zn+bu3gcwP+olzoKLHHzKVOKs8wYvj+fSDz7
	 PrfRZx3ZowEbghLxtGb15NjiNfHjv6Uw4StF+VbYPc0rhNheZNrn2Dr8gzZ/cV3alC
	 7eNFkdBVl46bVdttytRHi6Z4W7Ry2GbKZzt5janUZbLC5soCYbDeZsKf/DynXsiMsZ
	 yslSDuCfEcWJG4ib8OG3GPSaGmkHqk5hZcDIafNR/q6R7tt4I4YmMRdyhdqB60uDpg
	 p7Qb6qz2nRhrw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: adc: add support for PAC1711
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728-pac1711-v2-1-609bc026093c@microchip.com>
References: <20260728-pac1711-v2-0-609bc026093c@microchip.com>
 <20260728-pac1711-v2-1-609bc026093c@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 12:14:38 +0000
Message-Id: <20260728121439.0D2851F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Incomplete array constraint for `interrupt-names` restricts the =
property to a single item.
- [Medium] The `pattern` keyword is used directly on the `compatible` prope=
rty array, causing the conditional blocks to always evaluate to true.
--

--- Patch [1]: [PATCH v2 1/2] dt-bindings: iio: adc: add support for PAC171=
1 ---
commit 77f3bdc33ee2d8c631ae6a4bc6e945119e803da5
Author: Ariana Lazar <ariana.lazar@microchip.com>

dt-bindings: iio: adc: add support for PAC1711

This is the device tree schema for Microchip PAC1711, PAC1721, PAC1811 and
PAC1821 single-channel power monitor with accumulator. The devices use
12-bit or 16-bit resolution for voltage and current measurements.

> diff --git a/Documentation/devicetree/bindings/iio/adc/microchip,pac1711.=
yaml b/Documentation/devicetree/bindings/iio/adc/microchip,pac1711.yaml
> new file mode 100644
> index 0000000000000..846e7801a1667
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/microchip,pac1711.yaml

[ ... ]

> +  interrupts:
> +    description:
> +      Could be triggered by overvoltage, undervoltage, overcurrent, over=
power,
> +      undercurrent, step limit, accumulator overflow and accumulator cou=
nt
> +      overflow.
> +    minItems: 1
> +
> +  interrupt-names:
> +    items:
> +      - enum: [alert0, alert1]

[Severity: Medium]
Does this constraint restrict the interrupt-names property to a single item?

In JSON Schema and dt-schema, providing a list to items defines a tuple,
which implicitly bounds the maximum array length to 1. Since the hardware
supports two independent alert lines, this prevents device trees from
configuring the hardware with both of its supported interrupt alert lines
(alert0 and alert1).

Could this be defined with minItems: 1, maxItems: 2, and an unnested
items: enum: [alert0, alert1] to allow valid configurations using both
lines?

[ ... ]

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          pattern: "^microchip,pac1[78]11$"

[Severity: Medium]
Will this condition always evaluate to true?

In Device Tree schemas, compatible is an array of strings. The JSON Schema
pattern keyword only applies to strings, so when the instance is an array,
pattern is ignored and evaluates to true.

To correctly match array elements, should the condition use contains, such
as contains: pattern: "^microchip,pac1[78]11$"?

> +    then:
> +      properties:
> +        microchip,vbus-input-range-microvolt:

[ ... ]

> +  - if:
> +      properties:
> +        compatible:
> +          pattern: "^microchip,pac1[78]21$"

[Severity: Medium]
Does this block suffer from the same pattern matching issue on the
compatible array?

Since both if conditions evaluate to true, the schema will enforce mutually
exclusive oneOf constraints for microchip,vbus-input-range-microvolt
(max 42V vs 9V). Validation will always fail for any device tree using this
property.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-pac1711-v2=
-0-609bc026093c@microchip.com?part=3D1
