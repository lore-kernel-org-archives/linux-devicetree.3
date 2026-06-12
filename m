Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651B93E7BCD
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 11:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781264039; cv=none; b=IauAM6VHiX79Cjv9FwRS2HjXojp3VEt+tMrsAhDW0Kx8y+Ii1cLmMPD6UkWblmXySr37UX1p6cgOdJ0DReSJ56sicC9IvcR4W1l0Q/MPj4Re9zTFCofdBUMFWGD+zknNtseT4xRdWgWJl7gImuUYK7U4ZsI9U0+GHvA1qMtR1d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781264039; c=relaxed/simple;
	bh=JaDbjhkWvyThib1i7DjiSRWaR68zkvpJBEMOQS4gvcg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HdsJeuhKGks6gZnprG3k+XpXu8FH8bdE9bZVfPYt4EhRaxwNyPp0ye3qF6uFAfSf+k9mO3/VRhJ55nbEZjE0v24zEP1vB5QXmYHtkIcHyW6aAuSPLUlndoqyFtGqS8EkqElAGuHUvkTv7MMZvIvgJeiwtQUv7KCCarcy9jMBwSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g6/9ijNH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g6/9ijNH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14AA31F000E9;
	Fri, 12 Jun 2026 11:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781264034;
	bh=M4rNj4QcWLEHQGUaBLQEwMisVeEKG2/d81qhNxHTVhY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g6/9ijNHtW5JG6Rob/EwpmNb67m9kQC1sX/bAvcZFgczW/RaMfb4EWP3cG9kkMyh6
	 U5yC9awE3FLd0zu1sKr3oyXe19B0295CWURoRMo22u61WdeWtEqB5OVJy0aKOTrR2w
	 XI9UM7KSiRevWa8o5bqs3bVGQlDKr6bvu3J8MCahjzBFNmcZaQZsp9k/6a8EOgeK/e
	 ZvJkWrBsTTnGRQxd5RhfECevDjzzOz9guq0+ar4PkA5zDob09LmQ//tqmY+EpQVNDp
	 EkBfqvsctyhGsqr2jsVAcr2mEUewi5Pul+9dVVKyG3a5ULVc2CCutCPNlnkD3LV7Ue
	 KR0PYgfNDldKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 4/9] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <20260612111816.3688240-5-lakshay.piplani@nxp.com>
References: <20260612111816.3688240-5-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 11:33:53 +0000
Message-Id: <20260612113354.14AA31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing GPIO provider properties and constraints in the DT bindi=
ng schema, violating subsystem guidelines.
- [Medium] Missing compatible strings and port constraints for the document=
ed 4-port hardware variants (P3H2440/P3H2441).
--

commit cfd8cd31027f9ddcdd30fe595d5d947dc8bae49b
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support

Adds bindings for the NXP P3H2x4x multiport I3C hub family. These devices
connect to a host via I3C/I2C/SMBus and allow communication with multiple
downstream peripherals.

> diff --git a/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml b/Doc=
umentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> new file mode 100644
> index 0000000000000..c080eeb0eeaa8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> @@ -0,0 +1,291 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2025 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/nxp,p3h2840.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP P3H2X4X I3C HUB

[ ... ]

> +description: |
> +  P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841) is a family of multiport I3C
> +  hub devices that connect to:-
> +  1. A host CPU via I3C/I2C/SMBus bus on upstream side and connect to mu=
ltiple
> +     peripheral devices on the downstream  side.
> +  2. Have two Controller Ports which can support either
> +     I2C/SMBus or I3C buses and connect to a CPU, BMC or SOC.
> +  3. P3H2840/ P3H2841 are 8 port I3C hub with eight I3C/I2C Target Port.
> +  4. P3H2440/ P3H2441 are 4 port I3C hub with four I3C/I2C Target Port.
> +     Target ports can be configured as I2C/SMBus, I3C or GPIO and connec=
t to
> +     peripherals.

[Severity: Medium]
If the target ports can be configured as GPIO, should the schema include the
corresponding provider properties (such as gpio-controller and #gpio-cells)?
Without these properties defined, device trees attempting to use the
documented GPIO capabilities will be strictly rejected due to
unevaluatedProperties: false at the top level.

> +
> +properties:
> +  compatible:
> +    const: nxp,p3h2840

[Severity: Medium]
The description mentions support for the P3H2440 and P3H2441 4-port hardware
variants, but the compatible property is restricted strictly to nxp,p3h2840.
Should the compatible strings for the 4-port variants also be included here?

[ ... ]

> +patternProperties:
> +  "^i3c@[0-7]$":
> +    type: object
> +    $ref: /schemas/i3c/i3c.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        description:
> +          The I3C HUB Target Port number.
> +        maximum: 7

[Severity: Medium]
The maximum port number is currently hardcoded to 7 for all variants. If the
4-port variants (P3H2440/P3H2441) are supported, wouldn't we need condition=
al
if-then constraints to restrict the reg maximum to 3 for the 4-port hubs?
Otherwise, invalid device trees defining non-existent ports on 4-port hubs
might pass validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612111816.3688=
240-1-lakshay.piplani@nxp.com?part=3D4
