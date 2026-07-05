Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65BE433E7A
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 13:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783258318; cv=none; b=ZndJwFWX3XP57yyvOFFWVBbl9CIO/Lil6+sypsGNhiBZlQKiwif5IdIForUGAxIs2nDpBKNdnFh3zhqSYnrrSWDfvIOUziKtD9CYSP8gLPwo2+KHsbyFXN9ftBephUDyPi8vASU8pUV6llbwGcxTBpji3c/bSEWv7cpNBVuSzEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783258318; c=relaxed/simple;
	bh=PszMH/G350UZYSUvhTRtv5txKIcdX/LvEHKJ/TSt+EM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OmJHphcRRob1mBA/E6f7G4CzpvEQU6/64rSKLIvo2rDz10rTIxQ8fjnmKWdTVjwqQoWS7Kf1SzYqkypEzNypF2xdYSvY9xbby6EuHHuTIMBkXYtE+qcSabxXR97IQW1WywgM7naQYW4rTWAI8vHEEZCumATQBJ3JqyNTdIvuDKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g7YqnInk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g7YqnInk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 490111F000E9;
	Sun,  5 Jul 2026 13:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783258317;
	bh=j186fY07091gVQ/n2m9ceU8j8O46i3P6VRpJMUna2ys=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g7YqnInkHsRGzr47Cw0pf9Q706qdyLM17PExD+5/zI4YrZIXYl3/IUh4ncxYEB7cM
	 KL02xB12L7PlRh9XrnFoWVeG8EouSpDfZlafIQ3ZU8mAiaddqYRjuYK0WvwenStadl
	 WUvoQONZIUtrE0YkEfxeWZmKzpf93gEjy3iMKpX6BG1Bn7UH5B5XRAvaSMYUTzk9v8
	 zdTrpNx/n0eMdbBlvXghvvrO8ZQDLL+RYFwEyFXVTXgo7an9RAdmWZqCG7uO40fd4B
	 /NHLbOyfih8snINQYj7iSjkhPKeIqrCq6Gmt7yYBUsA3/TqRFaepBgIIdYLIP2JuVr
	 NSqnbhjLQqxuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: microchip,pic32mzda-pinctrl:
 Convert to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Udaya Kiran Challa" <challauday369@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260705132521.159522-1-challauday369@gmail.com>
References: <20260705132521.159522-1-challauday369@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 13:31:56 +0000
Message-Id: <20260705133157.490111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The `function` property enum restricts the allowed mux functions t=
o only four UART-related values (`U2TX`, `U2RX`, `U4TX`, `U4RX`), breaking =
validation for all other hardware peripherals.
- [High] The `function` property is missing from the top-level pin configur=
ation node's properties, preventing its use on direct, single-level configu=
ration nodes.
- [High] The regular expressions used in `patternProperties` enforce non-st=
andard, brittle naming conventions and will incorrectly reject valid device=
 tree node names.
--

commit bc456fcb7e299ea733020d3953dfb0867baf36ff
Author: Udaya Kiran Challa <challauday369@gmail.com>

dt-bindings: pinctrl: microchip,pic32mzda-pinctrl: Convert to DT schema
   =20
Convert Microchip PIC32 Pin Controller devicetree binding
from legacy text format to DT schema.

> diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzd=
a-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,pic32m=
zda-pinctrl.yaml
> new file mode 100644
> index 0000000000000..87ac5aace5e36
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinct=
rl.yaml
> @@ -0,0 +1,141 @@
[ ... ]
> +patternProperties:
> +  '^[a-z0-9]+[_-].*$':

[Severity: High]
Does this regular expression inappropriately reject valid and standard
device tree node names?=20

By requiring an underscore or hyphen, this outer regex prevents generic
single-word node names like "spi0" for a pin group container.

> +    type: object
> +    description: |
> +      Pin configuration node with pin muxing and configuration propertie=
s.
> +      Can be either a direct pin configuration node or a container node
> +      with child pin configuration nodes.
> +
> +    properties:
> +      pins:
> +        description: |
> +          List of pins to which the configuration applies.
> +        items:
> +          type: string
> +        minItems: 1
> +
> +      bias-pull-up: true
> +      bias-pull-down: true
> +      input-enable: true
> +      output-low: true
> +      output-high: true

[Severity: High]
Is the "function" property missing from this properties block?=20

Because the patternProperties node defines additionalProperties: false
later on, omitting "function" here forces all users to use a nested
container structure. This seems to contradict the description which states
the node can be a direct pin configuration node.

> +
> +      microchip,digital:
> +        description: Enable digital I/O.
> +        type: boolean
> +
> +      microchip,analog:
> +        description: Enable analog I/O.
> +        type: boolean
> +
> +    patternProperties:
> +      '^[a-z]+[0-9]+-[a-z]+$':

[Severity: High]
Could this inner regular expression impose a brittle naming structure?=20

Because it requires a strict "<alpha><num>-<alpha>" pattern, it will
reject valid node names like "i2c-sda" (no number) or "tx" (no hyphen).

> +        type: object
> +        description: |
> +          Child pin configuration node.
> +
> +        properties:
> +          pins:
> +            items:
> +              type: string
> +            minItems: 1
> +
> +          function:
> +            description: |
> +              A string containing the name of the function to mux pin.
> +            enum: [ U2TX, U2RX, U4TX, U4RX ]

[Severity: High]
Is it intentional to restrict the allowed mux functions to only these
four UART-related values?=20

This enum arbitrarily limits the allowed strings and will break
validation for other hardware peripherals like IC3, SDI1, and OC3 which
are supported by the driver.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705132521.1595=
22-1-challauday369@gmail.com?part=3D1
