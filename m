Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD722EBDE9
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 23:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784072625; cv=none; b=ioUeLBN+Avo/sCIaFrwRSrRSWkXibNn/pI1xycRsBY4Gn+ZqZjxuabvkecw2n+8nKr2XA5+0nvP/GXOfhrbqPZ8V+aiQtLbCpEKgmO9OVmVCTQ2v1sLiEubA9OB2a44PskTLstTB8HIEBNXBAZK6nyJtaByOzFu/fDqKtK/gEr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784072625; c=relaxed/simple;
	bh=bqYOh03tG/1oYzWrYsdLDikbSfsKraeTuUu0TzpwaMc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lQYnxwSH4XeZRrLgqm9BjYrurihKUPNuT0FooS/DU1Ai+LScWZqpIYUexNaiDBgThkDz+jKCEQ7ETcdbZnzQTgagwby4E8jzyghH0X+0DhRfMMTOOzpmKslKuV/NfDzlL2zuMxeoarINSgTRfP7lw09jNANMXNjG1XyUxIjv87E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OwNeGmxz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OwNeGmxz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E5A1F000E9;
	Tue, 14 Jul 2026 23:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784072624;
	bh=hJ2Szna2BjQmgfLIitU++GbUpekP6iOzJRhruNSevOE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OwNeGmxzoWR9Nr4Cmduow0eR9zpXtIUTmLLj8V6ighL+epapwxa6lqFsH1E0fuQDG
	 oXFdBOgNISWqy8PoA3ZcC/eHsbR8EbExt2g5mh9dgzm6IdWRq4VE1kZ8QyvlWmtsQL
	 IjNVPQA1+lUh61cFrX9R7ZoPw/L5UMuKCd/5DzfnU9UmeWeRetoqY782LQq0GIoi/g
	 7i/936MNjoBQrYg0STJ1SuMBhnyil0HdqUBr/Po9vSqBvfBXUWCPVPf0aI2QeDAMVZ
	 +M6TY7FDANOoZDrAFNivpDR9x8gTwRfmAPZbrfRPgMfyGa3h/K8x0Epq7DTMKdkT2m
	 wVu6gPiaEK9CA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/8] dt-bindings: iio: adc: add ti,ads122c14
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?RGF2aWQgTGVjaG5lciAoVEkp?= <dlechner@baylibre.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260714-iio-adc-ti-ads122c14-v4-5-25f8e3084485@baylibre.com>
References: <20260714-iio-adc-ti-ads122c14-v4-0-25f8e3084485@baylibre.com>
 <20260714-iio-adc-ti-ads122c14-v4-5-25f8e3084485@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 23:43:43 +0000
Message-Id: <20260714234343.F2E5A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Flawed conditional validation for `clocks` and `/DRDY` mutual ex=
clusivity
- [Medium] Missing Required Properties for Provider Capabilities
- [Low] Inconsistent Validation Constraints for `interrupt-names`
--

--- Patch [5]: [PATCH v4 5/8] dt-bindings: iio: adc: add ti,ads122c14 ---
commit 8ec99dd88682486b85d4fece20ce3719cbf6082e
Author: David Lechner (TI) <dlechner@baylibre.com>

dt-bindings: iio: adc: add ti,ads122c14

Add new bindings for ti,ads122c14 and similar devices primarily intended
for use with resistive sensors. The bindings include special properties for
reference voltage sources and current outputs for each measurement channel.

> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads112c14.yaml =
b/Documentation/devicetree/bindings/iio/adc/ti,ads112c14.yaml
> new file mode 100644
> index 0000000000000..b11359c9955e6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads112c14.yaml

[ ... ]

> +  interrupts:
> +    minItems: 1
> +    items:
> +      - description: /FAULT interrupt (GPIO2 pin)
> +      - description: /DRDY interrupt (GPIO3 pin)
> +
> +  interrupt-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      enum: [fault, drdy]

[Severity: Low]
The interrupts property defines a strict positional ordering where the first
item is /FAULT and the second is /DRDY. Does using an unordered enum for
interrupt-names allow the names to be supplied out of order, which would
conflict with the strict ordering of the actual interrupts?

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - avdd-supply
> +  - dvdd-supply

[Severity: Medium]
Since this hardware acts as a GPIO controller (defining gpio-controller and
#gpio-cells), should these properties be included in the required list to
ensure incomplete device tree nodes do not pass validation?

[ ... ]

> +# /DRDY out and CLK in use the same AIN7/GPIO3 pin.
> +if:
> +  properties:
> +    interrupt-names:
> +      contains:
> +        const: drdy
> +then:
> +  properties:
> +    clocks: false

[Severity: Medium]
Will this conditional incorrectly evaluate to true when the interrupt-names
property is completely omitted?

Due to JSON Schema semantics, missing properties trivially pass the check.
This might incorrectly forbid clocks for valid configurations that only use
the /FAULT interrupt but omit interrupt-names entirely.

Also, is it possible to bypass this check by supplying two items in the
interrupts array while only defining interrupt-names as ["fault"]?

Would checking the length of the interrupts array be a more robust way to
enforce this exclusivity?

[ ... ]

> +examples:
> +  - |
> +    i2c {

[Severity: Medium]
If the GPIO controller properties are required for this device to function
as a provider, do they also need to be demonstrated in these examples to
successfully pass dt_binding_check?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-iio-adc-ti=
-ads122c14-v4-0-25f8e3084485@baylibre.com?part=3D5
