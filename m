Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4903D37BE93
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 06:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784789507; cv=none; b=n0zQ+n6ATZsPPdxBxQ5qR9Aqe4kpQ9jTWCm5M8x5nt3XkXMO1X/F21EBryQAR8LP/+ffjsVh5tkVTJo722Ug+Vil/vVh3Xp9piRZgylOLudJ+jea69YErnUIvU3qGXF9geZzUmM4DZtfLNYf0mBhr0NBEiwUGXfCUwp2wWb995s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784789507; c=relaxed/simple;
	bh=4Hfo6sHIuAaSekBcD/cp7fbSL25BMuhmeZ1g2JOvbPo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FY5d6ku0UHck91t9jV5wq+cjDdjxY07F/2pGpFUSPzUlCmTWO3yXYVn4bI6mRbAt30KHTjAWGkOnZitsBvca9n8ym7HgLggC9yNYFKWscDWP+dCrBugypnj9g2H8D1afmFF23xaJFJdty4k6b+Kot4FMM+dxOkAXIbY5E5DUZy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 743431F000E9;
	Thu, 23 Jul 2026 06:51:45 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] spi: dt-bindings: amlogic: spisg: Document
 A9-specific properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20260723-a9-spisg-v2-1-9fc39106b7e2@amlogic.com>
References: <20260723-a9-spisg-v2-0-9fc39106b7e2@amlogic.com>
 <20260723-a9-spisg-v2-1-9fc39106b7e2@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 06:51:44 +0000
Message-Id: <20260723065145.743431F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Setting `default` values on properties that are conditionally fo=
rbidden (`false`) causes device tree schema validation to fail on valid old=
er nodes.
--

--- Patch [1]: [PATCH v2 1/4] spi: dt-bindings: amlogic: spisg: Document A9=
-specific properties ---
commit 5cdfe189c3095f9606a5c72f8f2856e0d4d26388
Author: Xianwei Zhao <xianwei.zhao@amlogic.com>

spi: dt-bindings: amlogic: spisg: Document A9-specific properties

This commit documents the Amlogic A9 SPISG controller and adds the
"amlogic,a9-spisg" compatible string. It also defines the A9-specific
"amlogic,mo-idle-output" and "amlogic,word-gap" properties.

> diff --git a/Documentation/devicetree/bindings/spi/amlogic,a4-spisg.yaml =
b/Documentation/devicetree/bindings/spi/amlogic,a4-spisg.yaml
> index 9bfb8089f7ea2..ddef92f3f3b66 100644
> --- a/Documentation/devicetree/bindings/spi/amlogic,a4-spisg.yaml
> +++ b/Documentation/devicetree/bindings/spi/amlogic,a4-spisg.yaml
[ ... ]
> @@ -35,6 +34,23 @@ properties:
>    resets:
>      maxItems: 1
> =20
> +  amlogic,mo-idle-output:
[ ... ]
> +    enum: [0, 1, 2]
> +    default: 0
> +
> +  amlogic,word-gap:
[ ... ]
> +    enum: [0, 1, 2, 3]
> +    default: 1
> +
[ ... ]
> +allOf:
> +  - $ref: spi-controller.yaml#
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - amlogic,a9-spisg
> +    then:
> +      properties:
> +        amlogic,mo-idle-output: false
> +        amlogic,word-gap: false

[Severity: Medium]
Does setting a default value on properties that are conditionally forbidden
cause device tree schema validation to fail on valid older nodes?

The dtschema validation tool injects top-level default properties into a
parsed node before evaluating allOf blocks. For the amlogic,a4-spisg
compatible, it will inject the defaults (0 and 1) for the missing
properties.=20

Then the allOf block will enforce the false schema constraint. Since the
properties were injected, the schema evaluates to false, causing validation
errors for any existing or example a4-spisg node.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-a9-spisg-v=
2-0-9fc39106b7e2@amlogic.com?part=3D1
