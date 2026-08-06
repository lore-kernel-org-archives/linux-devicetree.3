Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADBD38757B
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009278; cv=none; b=ZZVH0vg1//lmCZFK/HQCGNwDTSEIWqPyE/NDO+3kx4/Khuw0k8+GxGGpyuNBqT4nIPotTlvV6hzI2oGWg3ASE32P9wf2ed8bcWdacVQQfpfRjoEttUDQRUi+FeJRYYTW0MmqirLX+mBYzpXckQ7uJ3ShQX1NeScejhdobJeJ7B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009278; c=relaxed/simple;
	bh=7dUUwY7FOaqC4XjewtJcD+VQJNzBnJBAYQJa7GsIVWc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hfG/oprNU4bLynuj8hjIJaH1yAeDv6vzWqbrl8v7YeatELuQjjBtpirNTPOW0fFWdt/KjIOn0j796NZ1MRHOTOQAYBEx3R86p8tLKVYGIy5YwO0/mnY7accp8xE7EOIVdCCmHohLZILqExxVRZnHCVWRY6g8L0t8uyn7opqfJxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hynJC1Bw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hynJC1Bw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C3D1F000E9;
	Thu,  6 Aug 2026 09:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786009277;
	bh=wcYfWnAOfmNi4ma4SEl3D12+Wm1vl6yyZ3cxz8z0PHw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hynJC1BwG4+qnSdB7z6SJ2oBYXz/yg5yQHPTls2gdPRllCk47P6yfVFiZkQLv44Yd
	 BBQYkAHK+jzrh2RNjTZGQVR89gmiNo6xuhj7kVOxzwsMPYZIDrPH4B9IgvOhjYw0+K
	 xz4r9lxnu9bRhryPTrLBgNqv/Rt5tq9+iprF3gE78oKO1r+2ZKXfr0trGGPopI6qvw
	 HDdsheoNFx4Yb3wb8jgwZBirA3bm4NrsKZUnoHYY5nOwjySK7ZaMJyDegCKVePVkCV
	 LNq5vJB5FvCbijErrasjH4R/umjdpBwA2r46EPE2FNVyzJ7GUalUeu6zCcyz3lF3ny
	 F/T2c2r+JgVxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/10] dt-bindings: pinctrl: add Ambarella CV75
 pinctrl
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806-longzhao-upstream-cv75-v2-v2-4-6b09707c5fe9@ambarella.com>
References: <20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com>
 <20260806-longzhao-upstream-cv75-v2-v2-4-6b09707c5fe9@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 09:41:16 +0000
Message-Id: <20260806094116.B6C3D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The pin configuration node schema (`^[a-z0-9-]+-pins$`) incorrec=
tly uses `additionalProperties: false` alongside `$ref` schemas, and restri=
ctively hardcodes `function` and `groups` exclusively to `uart0`.
- [Medium] The GPIO child node pattern (`^gpio@[0-9a-f]+$`) incorrectly use=
s `additionalProperties: false` while omitting a reference to standard GPIO=
 schemas, blocking common GPIO properties.
--

--- Patch [4]: [PATCH v2 04/10] dt-bindings: pinctrl: add Ambarella CV75 pi=
nctrl ---
commit 004945278e95f95e4ac87cc90d5d3bc4136ce194
Author: Long Zhao <longzhao@ambarella.com>

dt-bindings: pinctrl: add Ambarella CV75 pinctrl

This commit adds the Ambarella CV75 pin controller device tree binding,
which configures pin multiplexing, bias, and drive strength.

> diff --git a/Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pin=
ctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctr=
l.yaml
> new file mode 100644
> index 0000000000000..3fa30b275e514
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.ya=
ml

[ ... ]

> +patternProperties:
> +  "^gpio@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: false

[Severity: Medium]
Does this strict property boundary prevent the use of standard GPIO propert=
ies
like gpio-line-names or ngpios?=20

Setting additionalProperties to false without referencing
/schemas/gpio/gpio.yaml# typically causes validation to fail when these com=
mon
optional properties are used. Would unevaluatedProperties: false along with=
 a
reference to the standard GPIO schema be more appropriate here?

[ ... ]

> +  "^[a-z0-9-]+-pins$":
> +    type: object
> +    allOf:
> +      - $ref: pinmux-node.yaml#
> +      - $ref: pincfg-node.yaml#
> +    additionalProperties: false

[Severity: Medium]
Does using additionalProperties: false here incorrectly restrict standard
properties inherited from the $ref schemas?=20

This usually requires workarounds like redeclaring properties such as
bias-disable. Would unevaluatedProperties: false be the correct approach wh=
en
using $ref schemas?

> +
> +    properties:
> +      function:
> +        const: uart0
> +
> +      groups:
> +        $ref: /schemas/types.yaml#/definitions/string-array
> +        items:
> +          enum: [uart0tx, uart0rx]

[Severity: Medium]
Does this lock the schema strictly to uart0?=20

Hardcoding the function and groups like this appears to invalidate
configurations for any other hardware functions such as I2C, SPI, or GPIO,
causing device tree validation to fail for them.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-longzhao-u=
pstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com?part=3D4
