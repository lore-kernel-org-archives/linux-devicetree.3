Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1FA409106
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 08:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780474116; cv=none; b=S7nWmVUwPKl9RcUkcfkRjOeBWG3GIOv/QLT/aXeOBwL6lLFmvRDy2HHvT/8rxgKImVV/xa2IgGYHTgFk41DGjNtP1RqNT/Tx3As+XGTZnEoWAAHMYqkpISgv4zDxIhekICC34k7tddK2JzUjVlmxp7xwtCaFycWka2Nh0SQ7SlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780474116; c=relaxed/simple;
	bh=gIslxKCpASPdKn/RtTY0A+/JpHtzEz7sBKsnt+nsKNs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ydmna+fXJ0XrykkawqVu+58MZFNwQ6Kr9eRlBNfK+Pxq1K9yRt8MaePxy4/BDpVedexErrJZDIgJ72w4JjOf7fr5tyqqk5vdJOB0PFRfIPQOSsOAEvTS8lkZH/ZacmpZd29HyInCVqQEkHd8FgISj3sWF7ymqsTXAu+Y1wDNpeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jkia4g0V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jkia4g0V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBBED1F00898;
	Wed,  3 Jun 2026 08:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780474115;
	bh=NMGZZdoAyopQDIKLMV68ePVlSufsXsxTlPhCf2ihjYA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jkia4g0Vtbs6QkhkPYqsZz+OBMHy8FZRAPa+HS4+2U33EqswMq0VVxbufaO1kBHAQ
	 MsEhwP9eeLT2vQTa5m656j+cTOEqf6mGMMDoaJjM9lyu0d0vLIGytZaGt0RFqHgQkP
	 NLVNhcps7mAx6RYlRGEGNMeW0Ti7Alb6L4N0goXRw3DMBhwCGQKen2IrdeIaqSMHqS
	 eppIgNEwXC9pjVKtX0rGHltE2sZjLviUbbohLGW9+XIBxWwWsNDM4CwKKBdOqGxblh
	 Kt1/HThCr2e8oZ4Ynt1ygbKGb1OKGenGVrGm+NBCurSlyP6vHkJWXTO84W8mXN5Jnw
	 nkGBYfD37tUDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: mfd: add ti,lm8502 combo LED + haptic
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk" <github.com@herrie.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260603080256.853037-2-github.com@herrie.org>
References: <20260603080256.853037-2-github.com@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 08:08:34 +0000
Message-Id: <20260603080834.DBBED1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The binding describes Linux driver internals (MFD structure) rat=
her than hardware layout by creating artificial 'leds' and 'haptic' sub-nod=
es.
--

commit 25934ec50a44a98662b56dfb64e70a785820fdf7
Author: Herman van Hazendonk <github.com@herrie.org>

dt-bindings: mfd: add ti,lm8502 combo LED + haptic controller

This commit adds a new YAML device tree binding for the TI LM8502, an I2C
combo LED and haptic controller. The device exposes its LED and haptic
functionalities as sub-nodes of the main I2C device.

> diff --git a/Documentation/devicetree/bindings/mfd/ti,lm8502.yaml b/Docum=
entation/devicetree/bindings/mfd/ti,lm8502.yaml
> new file mode 100644
> index 0000000000000..10f2e32a07385
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ti,lm8502.yaml
> @@ -0,0 +1,160 @@
[ ... ]
> +description: |
> +  The TI LM8502 is an I2C combo device with ten constant-current LED
> +  outputs (D1..D10) and an internal H-bridge that drives a vibrator
> +  motor. Pin D10 is shared between the tenth LED channel and the
> +  haptic output; the haptic driver writes D10_CURRENT_CTRL =3D 0 at each
> +  start to mux the pin to the H-bridge path.
> +
> +  The chip is exposed in Linux as an MFD with two children:
> +    - ti,lm8502-leds   - LED-class outputs D1..D10
> +    - ti,lm8502-haptic - EV_FF / FF_RUMBLE input device

[Severity: Medium]
Does this description rely too heavily on Linux driver internals rather than
hardware layout?

Device tree bindings should generally model the physical hardware structure.
Describing how the OS software stack divides the MFD subsystems creates
long-term maintenance debt since DT bindings form a stable hardware
description ABI.

> +
> +  The parent node owns the I2C client, the chip-enable GPIO and the
> +  vcc regulator; children share access to the parent's regmap.
> +
> +properties:
> +  compatible:
> +    const: ti,lm8502
[ ... ]
> +  leds:
> +    type: object
> +    additionalProperties: false
> +    description: LED-class child for outputs D1..D10.
> +
> +    properties:
> +      compatible:
> +        const: ti,lm8502-leds

[Severity: Medium]
Is the ti,lm8502-leds compatible string strictly necessary for hardware
description?

Creating artificial sub-nodes with their own software-specific compatible
strings just to force driver matching for the Linux MFD framework violates
devicetree design principles.

The sub-functions should typically be represented as properties or direct
child nodes of the parent device without requiring separate compatible
strings, unless they are genuinely independently reusable IP blocks.

[ ... ]
> +  haptic:
> +    type: object
> +    additionalProperties: false
> +    description: FF_RUMBLE child for the internal H-bridge vibrator outp=
ut.
> +
> +    properties:
> +      compatible:
> +        const: ti,lm8502-haptic

[Severity: Medium]
Similar to the leds sub-node, would it be possible to omit this artificial
compatible string and represent the haptic function without a dedicated
software-specific node?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603080256.8530=
37-1-github.com@herrie.org?part=3D1
