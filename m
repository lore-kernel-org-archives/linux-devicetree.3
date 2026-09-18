Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E57451AFDE
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 17:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789751296; cv=none; b=XhKhvEI+oZqqIjPP4zd3ntJ6BZqb/y44Tl8kOW1NWF4zU9fg3JgSRCEF0HexTOwmIZTbQKPCXGjfXmimGAz9cKl4m25LqmdDLv2kGRdbMjhHOY8UBcUYv/VTjIf+bldSUpoNOdn9HycAwV4bTWyqDFwxOIBIuzZudzo9cYkNfPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789751296; c=relaxed/simple;
	bh=8V+CI++wd2hRR/8f0kE0wDzpS3pN6AlEwwsZ1swc41g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZX5JclZ+CjHSLqq0fzaL8oDudhgPXOI/eSIeTLbomTYS/X92jN0/ITXGMFeXcO/kCYWpSSJoRGkwbwpnzEbuAGxgI9VDgTa/xqn4Q0OE8oS71Yq3UvFA8oOM3gs110jl/v5g7rrSmZ0LPTDx+Lj9DkSCtYJ4sA6BVupfZr0vTWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2nNK2rc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2nNK2rc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF651F00898;
	Fri, 18 Sep 2026 17:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789751290;
	bh=FlmK4jIvYzuKrd9bMxPXILBV9xAV8wyKPyiAXRj8Ns8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S2nNK2rccapEk40xZacNGh0dCPf60rKpYfIhh+BFjeQdFJ/HvejFvTyjz1214+BWx
	 sncDvy6Kgh6tg/8phL6/ONhqF+AKLrbXAigm52qsyk0RutxjyG7EwM6utvnMqDerKk
	 jY+zGBkkT8L4BP+1ix67AgkltkIFWo9AveIcGXtMEhas6KzP8oj8pWXaZb7S47yNqT
	 kg1gmOi0c3zZkFvOSU+6f4fYuWqrVA6OfHaDw2sAty2iPZ9B/nMdhiO0+dVKnz6mYM
	 iDCsAVAMs53dgE93L7jr11UmBhyivt/9owXBdDtCS+FOQ9SmV5ZsPthdW1j7NxbwRj
	 jFAiw6KLl5I1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: power: supply: ab8500: Add AB8505
 charger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260918-ab8500-charger-dt-v2-1-5f17c332a2a7@kernel.org>
References: <20260918-ab8500-charger-dt-v2-0-5f17c332a2a7@kernel.org>
 <20260918-ab8500-charger-dt-v2-1-5f17c332a2a7@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 17:08:09 +0000
Message-Id: <20260918170810.0FF651F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] power: supply: ab8500: driver probe fails on AB8505 due to 9-inter=
rupt schema constraint
- [Medium] dt-bindings: power: supply: ab8500: missing io-channels variant =
constraints
- [Medium] dt-bindings: power: supply: ab8500: autopower_cfg missing varian=
t restriction
--

commit 1fff99ca786343bf578c093a179ec7f5838e1bb0
Author: Linus Walleij <linusw@kernel.org>

dt-bindings: power: supply: ab8500: Add AB8505 charger

AB8500 and AB8505 expose different charger interrupt sets. Add a unique
AB8505 charger compatible with the AB8500 compatible as its fallback.
Use the variant-specific string to require the fourteen main and USB
charger interrupts on AB8500 and the nine USB charger interrupts on
AB8505.

> diff --git a/Documentation/devicetree/bindings/power/supply/stericsson,ab=
8500-charger.yaml b/Documentation/devicetree/bindings/power/supply/stericss=
on,ab8500-charger.yaml
> index 4f19744844e9c..73f5df2d7a36b 100644
> --- a/Documentation/devicetree/bindings/power/supply/stericsson,ab8500-ch=
arger.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/stericsson,ab8500-ch=
arger.yaml
> @@ -12,10 +12,58 @@ maintainers:
> =20
>  allOf:
>    - $ref: power-supply.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: stericsson,ab8505-charger
> +    then:
> +      properties:

[Severity: Medium]
Should there be an io-channels variant constraint for AB8505 here?

A device tree could specify the stericsson,ab8500-charger compatible but on=
ly
provide 2 IO channels (vbus_v and usb_charger_c).

This would pass the global schema check since io-channels allows between 2 =
and
4, but the driver strictly requires 4 channels (including main_charger_v) f=
or
AB8500 hardware:

drivers/power/supply/ab8500_charger.c:ab8500_charger_probe() {
	if (!is_ab8505(di->parent)) {
		di->adc_main_charger_v =3D devm_iio_channel_get(dev, "main_charger_v");
		if (IS_ERR(di->adc_main_charger_v)) {
            ...
}

Should the schema enforce minItems: 4 for AB8500 and maxItems: 2 for AB8505
within these new variant conditional blocks to prevent invalid configuratio=
ns
from passing schema validation but failing during probe?


[Severity: Medium]
Does the autopower_cfg property need to be restricted to false in this AB85=
05
conditional block?

If a device tree for an AB8505 system incorrectly includes this property, t=
he
schema allows it because it's defined globally but not restricted here.

The driver would then read it and later call
ab8500_enable_disable_sw_fallback(), writing to bit 0 of register 0x03
(AB8500_SW_CONTROL_FALLBACK).

Since the commit message explicitly states this bit is reserved on AB8505,
could writing to it cause undefined behavior?

> +        interrupts:
> +          minItems: 9
> +          maxItems: 9

[Severity: High]
Does this break the probe of the ab8500-charger driver on AB8505 hardware?

A device tree for an AB8505 system conforming to this newly introduced sche=
ma
would provide only 9 USB charger interrupts.

During driver probe, the driver unconditionally iterates over its hardcoded
ab8500_charger_irq array of 14 interrupts:

drivers/power/supply/ab8500_charger.c:ab8500_charger_probe() {
	for (i =3D 0; i < ARRAY_SIZE(ab8500_charger_irq); i++) {
		irq =3D platform_get_irq_byname(pdev, ab8500_charger_irq[i].name);
		if (irq < 0)
			return irq;
    ...
}

When it calls platform_get_irq_byname() for the missing main charger
interrupts, won't it receive an error code (e.g., -ENXIO) and immediately
return it, aborting the probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-ab8500-cha=
rger-dt-v2-0-5f17c332a2a7@kernel.org?part=3D1
