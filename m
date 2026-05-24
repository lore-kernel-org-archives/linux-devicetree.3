Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA55233939
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 18:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779648540; cv=none; b=sG7l6P7uOOnXXO0vAsq6iJ07UXMjQbeC3ROb+UNcOZGYZJM19sq3o4MfqbUQqJgkVE8cJ+D0P+diM1YaAplSLkXbw0sLCHZNYE18/bVJEVR7TjCBApgNh3qJHg9Ven19dX0pv7dWpHnpUKuMM+ATwcAUl291/GMIyaBM27vA+Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779648540; c=relaxed/simple;
	bh=vzZVR9eJcLpyNi8IMo/zaS46QW+RlPKAnNUhWmUScEs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hziS7P0urEEgQWxMWx8HE9wqDwqptD1XdH0p6ud6VsdK4DVTGW2vWFBJNyBBAPKNzGBMelc8WAKwlt1K31D/17S/3GG05cCcpGDgECM3uSsXGbE8OgkQ5IYAxm29XQsU10qKAfJIUdT0IzX+ukten4pZ2nMiWYV6nha8fdjttSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nnMiCSka; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nnMiCSka"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61B121F000E9;
	Sun, 24 May 2026 18:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779648538;
	bh=2tbIRgv8XMPUHiHPOj3lt2XqLX2LMHwVV1lDj34ysyc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nnMiCSkajiILiUibBD/WiZiiGmYhMXnrLn45NsQeDpSOSEGAKSenfeTn1mDTDXgTb
	 NMF1BSKNzGU/0uycCwgyzZs/ticKoEfxsM3PuneV1CHupte9hOTzSw7vP9EYGx/NT3
	 OH+PtQXY6tmCGksik6C+cqyJjDQdw4kWyV48Yml8r55gY0BR6QBESsXLgzYzUNSD6R
	 EFsyeHsG+d+de2sNmZpcfSkc7pzw4K9+33q7VzL8PIQnJuuZZpIuD6HcBJSaOPLjvT
	 oTY8wo+o4VoeVXFcp7rrdajxS006nJTUeKRlnIMuIqfyPGK+IRaB7SnlA3tCGqiIGh
	 PvS4KYSjKeE5A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: sound: atmel_ac97c: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manish Baing" <manishbaing2789@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260524183337.111657-1-manishbaing2789@gmail.com>
References: <20260524183337.111657-1-manishbaing2789@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 24 May 2026 18:48:57 +0000
Message-Id: <20260524184858.61B121F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The YAML schema omits the `clocks` and `clock-names` properties,=
 causing validation failures for existing valid device trees.
- [Medium] The `ac97-gpios` property is incorrectly placed in the `required=
` list of the schema, which will break validation for existing device trees.
--

commit 1b5d0ed3017fc9e1dbdb1e38381500e3cc380fb7
Author: Manish Baing <manishbaing2789@gmail.com>
ASoC: dt-bindings: sound: atmel_ac97c: Convert to DT schema

This commit converts the Atmel AC97 controller device tree binding from
plain text format to a YAML schema.

> diff --git a/Documentation/devicetree/bindings/sound/atmel,at91sam9263-ac=
97c.yaml b/Documentation/devicetree/bindings/sound/atmel,at91sam9263-ac97c.=
yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/atmel,at91sam9263-ac97c.yaml
> @@ -0,0 +1,60 @@

[ ... ]

> +properties:
> +  compatible:
> +    const: atmel,at91sam9263-ac97c
> +
> +  reg:
> +    maxItems: 1
> +    description: Address and length of the register set for the device.
> +
> +  interrupts:
> +    maxItems: 1
> +    description: Should contain the AC97 interrupt.
> +
> +  ac97-gpios:
> +    minItems: 3
> +    maxItems: 4
> +    description: |
> +      AC97 link GPIOs- sync, sdata_out, reset, and optional sdata_in.
> +      The driver primarily uses the reset pin.
> +
> +  pinctrl-0: true
> +
> +  pinctrl-names:
> +    const: default

[Severity: Medium]
The driver (sound/atmel/ac97c.c) unconditionally requires a peripheral clock
via clk_get(&pdev->dev, "ac97_clk"). Existing device trees such as
arch/arm/boot/dts/microchip/at91sam9263.dtsi define clocks and clock-names.

Since unevaluatedProperties is set to false below, won't make dtbs_check
flag these valid properties as errors? Should clocks and clock-names be
added to the schema?

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - ac97-gpios

[Severity: Medium]
Is it correct to make ac97-gpios mandatory here?

The driver appears to treat the reset GPIO as optional, and existing device
trees like at91sam9263.dtsi do not define it. Will making it strictly
required cause validation failures for existing hardware configurations?

> +
> +unevaluatedProperties: false
> +
> +examples:

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524183337.1116=
57-1-manishbaing2789@gmail.com?part=3D1
