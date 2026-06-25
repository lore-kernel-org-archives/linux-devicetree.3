Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD7037269C
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 22:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782425547; cv=none; b=KtgHd1VnXUmgJOlEUB85dNY+boBXuPBcY5Z/lbh47wfrJ8AVv04wCwQVnKNiKZWIprx/gFPYCEJZQH/xX0yFp+j292jFDCMRQf4IjtHnm5esFsymDCGG/I+f6Qcxq/9SJlcz4Y5Ou4zSVyoKFXfkse1y1tcVkuJIotfICLbuRBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782425547; c=relaxed/simple;
	bh=loDGdbz0XuoLPROkwZd5g1uMeONWm3Yw3JQhyUrz+CM=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tTmVPEUvwfYvJlz6l7jB9++8Pu7R96z6cjJKgnu+9cooU18MUlyMrrhXhf27j2SwEFs4zvyhtQLcc8wxthHEE6MTMHXG5Aa3i1G5/h9LR819krbd4KI5hdrmr5dfpw+GW6mBT6t8KHMyIP+p5flGtA53iBX5WUflsvE05vQaTwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YUUJU3h5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YUUJU3h5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAF081F000E9;
	Thu, 25 Jun 2026 22:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782425545;
	bh=jnSwEP8Q3FRjK+os5Pzm2lQJo0TgN9vE3KsKW/16pco=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=YUUJU3h5H51UwKrLsQyPg4hBnvTV0ekt3kHrFFC4t0tSiIaYGuYBl2+aqNo0V65Qk
	 IoTolUMg1qBpGpuJE1ulZBoILsHJa9UMZ0IAXaSLh2A38EgDC1It1St8jM0oNhdPtM
	 RFb76PJdifMmFfQMsX3yxHem1kSrVk1CqL11oD4PIWJso/kZTAKA+OAF8wlA9dCFhT
	 2Wt3YCPt4IFqNcafmrUbGNOpYWF3J2K02601B2fDwB6oyvNpFt+VWMUbtVrNLxyvi8
	 hMDas4BvImWCK2Ethb1YWKpNn2/ScS8xYXkl1GtDVbokq3hiFT+EyvP/PY8mmoDySr
	 kzxzk7o8nBzTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/8] dt-bindings: iio: adc: add ti,ads122c14
Reply-To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260625-iio-adc-ti-ads122c14-v2-5-ceb9b0b561cb@baylibre.com>
References: <20260625-iio-adc-ti-ads122c14-v2-0-ceb9b0b561cb@baylibre.com>
 <20260625-iio-adc-ti-ads122c14-v2-5-ceb9b0b561cb@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 22:12:25 +0000
Message-Id: <20260625221225.AAF081F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] The pattern property regex for channel nodes `^channel@[0-7a-f]$` =
omits digits 8 and 9, rejecting valid node addresses.
- [High] The `burn-out-current-nanoamp` property applies an `enum` constrai=
nt directly to an array, which will fail DT validation.
- [Medium] The commit message explicitly claims to reuse the custom 'ti,vre=
f-source' property, but the code actually implements the standard 'referenc=
e-sources' property instead.
- [Medium] The JSON schema reference `$ref: adc.yaml` is missing the `#` fr=
agment or the absolute path.
- [Medium] The `reference-sources` property lacks a `maxItems` constraint a=
nd leaves subsequent elements unvalidated.
- [Low] Strict index ordering in `interrupts` clashes with unordered `inter=
rupt-names`, causing invalid semantics if only one interrupt is used.
--

commit de052c7080b8c89f1a3c4b730b190d119eacb414
Author: David Lechner (TI) <dlechner@baylibre.com>

dt-bindings: iio: adc: add ti,ads122c14

Add new bindings for ti,ads122c14 and similar devices primarily intended for
use with temperature sensors. These bindings introduce channel-specific
properties to handle per-measurement reference voltage and current output
requirements.

> ti,vref-source is reused from ti,tlv320adcx140.yaml (otherwise might
> have preferred an enum of strings).

[Severity: Medium]
The commit message explicitly states it reuses the 'ti,vref-source' propert=
y,
but the schema actually implements the standard 'reference-sources' property
instead. Should the commit message be updated to match the implementation?

> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads112c14.yaml =
b/Documentation/devicetree/bindings/iio/adc/ti,ads112c14.yaml
> new file mode 100644
> index 0000000000000..59ee4d652a087
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads112c14.yaml

[ ... ]

> +  interrupts:
> +    minItems: 1
> +    items:
> +      - description: FAULT interrupt (GPIO2 pin)
> +      - description: DRDY interrupt (GPIO3 pin)
> +
> +  interrupt-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      enum: [fault, drdy]

[Severity: Low]
If a device tree specifies only the DRDY interrupt at index 0, does the str=
ict
ordering in the interrupts list (which expects FAULT at index 0) clash with
the unordered interrupt-names definition?

[ ... ]

> +patternProperties:
> +  ^channel@[0-7a-f]$:
> +    $ref: adc.yaml

[Severity: Medium]
Does the JSON schema reference here need a '#' fragment or an absolute path
to ensure it resolves properly across all tooling versions during validatio=
n?

[Severity: High]
Does the regex pattern ^channel@[0-7a-f]$ omit digits 8 and 9? The reg
property below has a maximum of 15, so a device tree legitimately using
channel@8 or channel@9 would fail schema validation.

> +
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        items:
> +          - maximum: 15 # arbitrary limit, channel@ can be any combinati=
on of AIN0-AIN7

[ ... ]

> +      burn-out-current-nanoamp:
> +        enum: [200, 1000, 10000]

[Severity: High]
Because device tree properties are parsed as arrays, will applying an enum
constraint directly to the property without using the 'items' keyword cause
dt_binding_check to always fail?

> +
> +      reference-sources:
> +        items:
> +          - enum: [internal-2.5v, internal-1.25v, external, avdd]
> +            default: internal-2.5v

[Severity: Medium]
Is a maxItems constraint needed for this array? Without it, JSON Schema only
applies the list validation to the first element, meaning additional items
in the array might silently pass without being checked.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625-iio-adc-ti=
-ads122c14-v2-0-ceb9b0b561cb@baylibre.com?part=3D5
