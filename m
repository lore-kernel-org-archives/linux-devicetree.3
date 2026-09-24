Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD8F4FC8CF
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 23:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790293399; cv=none; b=HFgxjlEzTVNLFI+AcwTFGoWsiEU42i10+nwpDTHbYhpI9HAo15TArbzIRgz1hrYR/V0E5NH+mRDwXW95FXPNcA6UlSFFY22kg8/fSdzq8rGIHE2WeOZYflFXQsJlCzg8a/SRUKJKsRNz1XYoFF7ZV9htZnHWJ9fSrRdLmEircDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790293399; c=relaxed/simple;
	bh=xxz8TyhW9xOWqkyBj4jvzszV2F3RENFiZrFzNJmLH5Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iFWl9k52sBd+re5/boAY3e7URITDWPbBxHBvJXiTPpJVyb3deL3bHkogHo8iLK5NiFVCKEaBH2jf1WfMiOOwIbP4T5gtF8pVeyKlFtClLBeJxoU7zIxGx710/qbx/q8mfpd2hWbKfCE/HohIfuZYg4N/O2yvLstSBBdUlZHGCaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gi9Wu02B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gi9Wu02B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD8EB1F000FF;
	Thu, 24 Sep 2026 23:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790293398;
	bh=+lyToerZ5v8sjXQJAK8usUgCZ8zJY83TGuVkbTsUlWg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gi9Wu02BZkGx86rbfj1VjRY1akFkA1nPVb3RMjvO/pssDA0tPh3SS3i/XSD9GYDGw
	 XAho0/j1QYq3TNBdGpQUNy3NLzRt3zwZXcrX4IC22Dn+1j5+5E9IBhKQxORmx+jCI6
	 TueMjBc4Dve5k6LXjzSq9Xj6BfNYHg/r46lT8kChbvciGQ5CniQWWfVtJLlR0ApHJG
	 bu8wnxN0ppjnNpMoANlvMnYVsYFVXKcMo7Aj9E4qRVRWYIFKvZzRxU87Psf3rYDSTS
	 Toe7kmIt7FnEi4YEZJLVW6P5r9nJaa9DbMvPuiOqLRXNNrfobwEvMslS05t+Jwssp0
	 SINsEAmTZhxlQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2] dt-bindings: pinctrl: convert nsp-gpio binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260924233541.126868-1-rosenp@gmail.com>
References: <20260924233541.126868-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 23:43:17 +0000
Message-Id: <20260924234317.DD8EB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dt-bindings: validation failure due to top-level additionalPropert=
ies restricting scalar properties
- [Medium] dt-bindings: missing constraint in nsp-gpio-pinconf bypasses typ=
o validation
--

commit 7f4d084d5f13cdd135dd4287165b9406e5c21963
Author: Rosen Penev <rosenp@gmail.com>

dt-bindings: pinctrl: convert nsp-gpio binding

The brcm,nsp-gpio-a compatible used by the NSP GPIO controller was only
documented in the legacy text binding, so dtbs_check reported "failed to
match any schema" for the gpio@20 node present in the bcm958625 and
related broadcom boards.

> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.yaml=
 b/Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.yaml
> new file mode 100644
> index 0000000000000..d7f9a1eb3b93d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.yaml

[ ... ]

> +$defs:
> +  nsp-gpio-pinconf:
> +    type: object
> +    allOf:
> +      - $ref: pincfg-node.yaml#
> +      - $ref: pinmux-node.yaml#

[Severity: Medium]
Will this allow misspelled or unsupported properties inside pin configurati=
on
child nodes to pass validation?

Because neither additionalProperties: false nor unevaluatedProperties: false
is specified in this definition, the object schema relies on default JSON
schema behavior, which permits arbitrary undefined properties. Properties l=
ike
bias-pullup (typo) or slew-rate (unsupported) will pass dtbs_check
without warning.

[ ... ]

> +additionalProperties:
> +  $ref: '#/$defs/nsp-gpio-pinconf'

[Severity: High]
Does this inappropriately apply pinconf constraints to all unmatched top-le=
vel
properties?

In JSON Schema, this forces all properties not explicitly listed in the
properties block to conform to $defs/nsp-gpio-pinconf. Since that reference
enforces type: object and requires a pins property, scalar or array
properties will unconditionally fail.

Device trees utilizing this controller and standard generic properties (like
pinctrl-names or implicit ones like phandle) will fail schema validation.

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    gpio@18000020 {
> +        compatible =3D "brcm,nsp-gpio-a";
> +        reg =3D <0x18000020 0x100>,
> +              <0x1803f1c4 0x1c>;
> +        #gpio-cells =3D <2>;
> +        gpio-controller;
> +        ngpios =3D <32>;
> +        gpio-ranges =3D <&pinctrl 0 0 31>;
> +        interrupt-controller;
> +        #interrupt-cells =3D <2>;
> +        interrupts =3D <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        /* Pin configuration node applied as a pinctrl state */
> +        pinctrl-names =3D "default";
> +        pinctrl-0 =3D <&led>;

[Severity: High]
Will these standard properties in the example fail validation?

Because of the additionalProperties directive restricting scalar properties,
pinctrl-names and pinctrl-0 will fail validation because they are not
objects and lack a pins property.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924233541.1268=
68-1-rosenp@gmail.com?part=3D1
