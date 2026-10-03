Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DD828C5B1
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 20:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791059174; cv=none; b=L7rVIKfksuISUcP8sW4xKMOsSQeNXYKOu4OYQGnNXbtuuMO9bD8NdZ5vahZbzZQeWNu58HkP9iaLp+uCR8b+CkNA0xQ8xkcOtOtCsv6lKredk6rzHDn4Yx4hqA2RkfdmSJrv/w93hRp10xdu5/jrlLeietEn2TFkUp9QplEIYfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791059174; c=relaxed/simple;
	bh=weus9dtHNAczbrmelFqiaBQvGUsdMHF6OZC/vUIsutM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=biVWDeH/CflwgZe9m4yDz2c/9P25BLTpDvHlNN9IX5iu/7R9B+Kytm6VxsCzRcnmd0ZNrLEt8mO4etzRIPsXEdwFHqqolxjt6L2UlqsYN9mUxH7rGVeFVKiiNxdjD6miOa3OeOX3xfHK+tdqnYXOZDLfb5tM1NNJNVgQygvuBho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=McJuWvsq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="McJuWvsq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 609B11F0089B;
	Sat,  3 Oct 2026 20:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791059172;
	bh=wcRO0QeJA7p/B4xwNzqkYbp2GekHi1k6ar/oTtpq0XI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=McJuWvsqQV6ZhJE5eh7t+/wWrrHk3XZ60t+SUHd1RhIexZOztXDQG6m0aCtrEVBMn
	 MXwwfp9wA2vYgiE69N0DTVyQmvkbZZM0E0X/yw7yWky1784ZGdWBvyRn9H2oqFAUf5
	 ZXzMG3UvLe6fuzqhiRXjwpa0GN3yjlnMePpnehJfReRbX56Yt7UU8cPxbGcwD4Qgo7
	 J7yRUKCKq7imtGYVRkCT8uKssdX5DPSjNjq16MV5kOmdHbjaM/fU6/Ubei1mfhs4fN
	 zKvepQiG9iWqMpK65P8265iGdvnXm2HbiD8coihcKREjd76DtFg9nMvzOT92lfVyZJ
	 L+Abg03aXuvAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: bus: Add binding for Altera AXI
 Timeout Bridge
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vyacheslav Yurkov" <V.Yurkov.EXT@bruker.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261003-feature-timeout-ip-v1-1-8837c311d571@bruker.com>
References: <20261003-feature-timeout-ip-v1-0-8837c311d571@bruker.com>
 <20261003-feature-timeout-ip-v1-1-8837c311d571@bruker.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Oct 2026 20:26:12 +0000
Message-Id: <20261003202612.609B11F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] dt-bindings: invalid compatible string format altera-timeout-bri=
dge
- [Medium] dt-bindings: erroneous required interrupt-parent breaks inherita=
nce
- [Low] dt-bindings: example node name uses underscores instead of hyphens
- [Low] dt-bindings: unaligned 15-byte reg size in example
--

commit 2cd126fb35ab7ef8e7fe6463a8fed9d0a99d2108
Author: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

dt-bindings: bus: Add binding for Altera AXI Timeout Bridge

This commit adds a device tree binding for the Altera timeout bridge, which
connects an Avalon bus to the HPS and provides an address space for child
devices.

> diff --git a/Documentation/devicetree/bindings/bus/altera-timeout-bridge.=
yaml b/Documentation/devicetree/bindings/bus/altera-timeout-bridge.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/altera-timeout-bridge.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/altera-timeout-bridge.yaml#

[Severity: Medium]
Does this $id field inherit an incorrectly formatted prefix and missing com=
ma
from the filename? The compatible string issues mentioned below seem to have
propagated to both the filename and this path reference.

[ ... ]

> +properties:
> +  compatible:
> +    items:
> +      - const: altera-timeout-bridge

[Severity: Medium]
Does this compatible string violate the standard device tree specification
that mandates the '<vendor>,<device>' format? The standard vendor prefix
for Altera is 'altr', not 'altera', and the missing comma separator breaks
standard pattern matching.

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-parent

[Severity: Medium]
Should 'interrupt-parent' be explicitly required here? By explicitly listing
it as a required property, the schema mandates that every instantiated node
must define it. Does this violate standard Device Tree structural inheritan=
ce,
where interrupt routing is inherited from parent nodes?

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    intc: interrupt-controller {
> +        interrupt-controller;
> +        #interrupt-cells =3D <3>;
> +    };
> +
> +    timeout_bridge_hps@10000 {

[Severity: Low]
This isn't a functional bug, but the example node name uses underscores
instead of hyphens. Could this trigger dtc W=3D1 warnings by violating stan=
dard
Device Tree naming conventions?

> +        compatible =3D "altera-timeout-bridge", "simple-bus";
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +
> +        reg =3D <0x10000 0xF>;

[Severity: Low]
Is this 15-byte window size intentional? MMIO regions are universally align=
ed
to word (4-byte) boundaries, meaning a 15-byte window truncates the final
32-bit register space (ending at 15 instead of 16). Could this be a typo
for 0x10?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261003-feature-ti=
meout-ip-v1-0-8837c311d571@bruker.com?part=3D1
