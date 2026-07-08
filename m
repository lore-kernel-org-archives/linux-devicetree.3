Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FF247CC63
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 16:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783529971; cv=none; b=rF34bumpNxpQftB6nH/6CyOuZS6E/DYIka07rP4sQyCMd5pF7MgQqcDv8MY0N5IBSn4Mkd5r623z3UsArUCWuIlkKAYhi87M2aXh3FS1cVylMve2j6MPZnzwrXIXkGFgemf5VD7xvcK6LI0zxmHZ1M8UtLMj5rf7Q9u2IZh85Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783529971; c=relaxed/simple;
	bh=pRomMXHI6IVBxIc7vJiZtL1S17pbG+TSAc7HX4EwwRw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OCQUor0CVpvRfmXN8p05WTUFMNX4fZsdYJR4S7yYbJFerP+yjD+KCpq6BMleeaGDZ5iFOu7zMY1NLlud8LtstIx6dpbclNc+IqBf2NwTQ5QigvX8CrvKHlVQQ9nNI/XCpl2Mkx7lMr8EbqyI5G9vPQVl9hSzmtcaZSdHu9J/eIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nNFB65wx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nNFB65wx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F0D61F000E9;
	Wed,  8 Jul 2026 16:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783529965;
	bh=CoH9cGLTRNd7RlF6dEuGQ2aVje7y2W0VBZXTn5NtQLE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nNFB65wxGLej5ShvXpd2FbA9pJiSpjSApxmuSF3VokQPZnH0CqCIPKtcxpnm0xG4Q
	 k+Wi35q9wEyGBQUw5N2A8CzIpDabEZtAqUvbLrceQWxEWknkh6XQmdySpOcc4lX0bI
	 R3kbY8fgRaC8HqnldGlTBwVEWyP+PHejSh0f7PTDzu4PaAYUx6o5DjcMA7p1AIDK1R
	 E5mad7/eS/yBl+HiMX6/UTZj+e6sDEOb+4RtUouJe9m2vsA1tL6WhOAuNcotdA0a2b
	 YK5A2deW0i/ucWnd3qD7tpqUrZDwcafRnB+5+IvbuiHj07sPoh0dO1v05NTiV/D6rf
	 BTBsKUjUtSApw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: net: convert microchip,lan78xx.txt to YAML
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Lukianchikov" <avermoal@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260707165840.107409-1-avermoal@gmail.com>
References: <20260707165840.107409-1-avermoal@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 16:59:25 +0000
Message-Id: <20260708165925.9F0D61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `ethernet-phy` node schema (which validates `microchip,led-m=
odes`) is incorrectly placed at the root level of the ethernet controller s=
chema instead of within the `mdio` node, causing PHY properties to silently=
 bypass validation.
--

--- Patch [1]: [PATCH] dt-bindings: net: convert microchip,lan78xx.txt to Y=
AML schema ---
commit d20f485d326a6780c198391c5453a7f4df19b905
Author: Mikhail Lukianchikov <avermoal@gmail.com>

dt-bindings: net: convert microchip,lan78xx.txt to YAML schema
   =20
Convert the Microchip LAN78xx family (LAN7800, LAN7801, LAN7850) binding
documentation from plain text to DT schema format using YAML.

> diff --git a/Documentation/devicetree/bindings/net/microchip,lan78xx.yaml=
 b/Documentation/devicetree/bindings/net/microchip,lan78xx.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/microchip,lan78xx.yaml

[ ... ]

> +  mdio:
> +    $ref: /schemas/net/mdio.yaml#
> +    unevaluatedProperties: false
> +
> +patternProperties:
> +  "^ethernet-phy(@[0-9a-f]+)?$":

[Severity: Medium]
Should this patternProperties block for the ethernet-phy node be nested
inside the mdio property definition rather than at the root level of the
ethernet controller schema?

Because this rule applies to the root level instead of child nodes of mdio,
properties like microchip,led-modes bypass schema validation. Malformed
property values will silently pass dt_binding_check.

> +    type: object
> +    description: |
> +      PHY node for the embedded or external PHY. The PHY address is
> +      given by the 'reg' property.

[ ... ]

> +                    mdio {
> +                        #address-cells =3D <1>;
> +                        #size-cells =3D <0>;
> +                        ethernet-phy@1 {
> +                            reg =3D <1>;
> +                            microchip,led-modes =3D <

[Severity: Medium]
As correctly shown in this example, the ethernet-phy node resides inside
mdio.=20

Could the schema definition above be updated to match this structure so the
PHY properties are properly evaluated?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707165840.1074=
09-1-avermoal@gmail.com?part=3D1
