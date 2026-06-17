Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C5538398F
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 08:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781684035; cv=none; b=QPBTRo/x3fUcpYJy3wZSnNUs/HtJlNH0XWGe8Jg8vYxxzhS4rGBtii4HANO9876otJoVM8sUh7fdCP/6RLB6Gwz30btK1Nje0c/BoYDHpOaaLMZh94TO2OYF390/6srE6GSf4LCF5S045ki4HQqPd676Oyz15A6uJjBZGbWme5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781684035; c=relaxed/simple;
	bh=4sk+1hdtTmUbkmgS4e9uj1Cj8O3uL797c+qgy1e68xI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a2RBVKma14dVDcKy0EX6aUQLToOkBu7DHnv0N9R1meqJfXSrh8dLmXe9sV2qW5lEVia9quFJ5jPYzDyFstbH/o1tFCa+616zUS0PD7TJQtjVNMOm5TngQI4uDAi/4wiwlCOqKR3AQ50D+2fXX1t6Jn5n24vzWu05dobeV1bail0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hR5wCeFo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hR5wCeFo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA7031F000E9;
	Wed, 17 Jun 2026 08:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781684034;
	bh=veNgmkNgD4Mlhfw1pfIiMjy0SLfb/093aag2YW45KAg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hR5wCeFo1kTisiw88P6sOGM7XjTRmbhVoAWzN+YZmO3yQIiHj/iF+cKfEtWzJaB5/
	 Gs9Vs3bzS4b+3XR6w0PQssZ2cJ0r+Xj6t4aOnohMpBSsK1apwVHuLMTDlg2zDrcsfl
	 NfSbqjXxUjSzZGdNTbEOXdi+mNXTxdzTPYayKFtbU95GE2vWvj6xlbc8TTkpQsNiQ/
	 EuWWOJlz2MA+otQsOOnfGO9D18xqJKPkWJB4oe6+7iusuwvO0fBaitDEnmo4XkY7TF
	 gC9b66Xt5IOq2MfAnWHbE1N7nNIy6SZCCD7T98E01+zwTnPVPidw+79PWlOMp2QE1B
	 MXzpzADY4mZkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 01/14] dt-bindings: leds: Document TI LM3533 LED
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260617080031.99156-2-clamor95@gmail.com>
References: <20260617080031.99156-1-clamor95@gmail.com>
 <20260617080031.99156-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 08:13:53 +0000
Message-Id: <20260617081353.DA7031F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] DT Schema Validation Failure due to strict property restrictions.
- [Low] Ineffective Schema Constraints on `reg` property array.
--

commit 69694c121b5fef16f95b87bbf30e28ee4fb13044
Author: Svyatoslav Ryhel <clamor95@gmail.com>

dt-bindings: leds: Document TI LM3533 LED controller

Document the LM3533 - a complete power source for backlight, keypad and
indicator LEDs in smartphone handsets.

> diff --git a/Documentation/devicetree/bindings/leds/backlight/ti,lm3533-b=
acklight.yaml b/Documentation/devicetree/bindings/leds/backlight/ti,lm3533-=
backlight.yaml
> new file mode 100644
> index 0000000000000..a25846e9b3752
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/ti,lm3533-backligh=
t.yaml
[ ... ]
> +properties:
> +  compatible:
> +    const: ti,lm3533-backlight
> +
> +  reg:
> +    description: Control bank selection (0 =3D bank A, 1 =3D bank B).
> +    maximum: 1

[Severity: Low]
Are these constraints effective? In Device Tree JSON representations, reg is
decoded as an array of arrays of integers (cells).

Numeric validation keywords like maximum are silently ignored when applied
directly to arrays instead of being nested under items.

[ ... ]
> diff --git a/Documentation/devicetree/bindings/leds/ti,lm3533-leds.yaml b=
/Documentation/devicetree/bindings/leds/ti,lm3533-leds.yaml
> new file mode 100644
> index 0000000000000..d8dbefef3323e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/ti,lm3533-leds.yaml
[ ... ]
> +properties:
> +  compatible:
> +    const: ti,lm3533-leds
> +
> +  reg:
> +    description:
> +      Control bank selection (2 =3D bank C, 3 =3D bank D, 4 =3D bank E, =
5 =3D bank F).
> +    minimum: 2
> +    maximum: 5

[Severity: Low]
Similar to the reg property in the backlight binding, should these numeric
constraints be nested under items? As written, they apply to the array itse=
lf
and will be ignored during schema validation.

[ ... ]
> diff --git a/Documentation/devicetree/bindings/leds/ti,lm3533.yaml b/Docu=
mentation/devicetree/bindings/leds/ti,lm3533.yaml
> new file mode 100644
> index 0000000000000..bdc05a9f3d663
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/ti,lm3533.yaml
[ ... ]
> +  light-sensor:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      compatible:
> +        const: ti,lm3533-als
[ ... ]
> +examples:
> +  - |
[ ... ]
> +            light-sensor {
> +                compatible =3D "ti,lm3533-als";
> +
> +                interrupt-parent =3D <&gpio>;
> +                interrupts =3D <80 IRQ_TYPE_LEVEL_LOW>;

[Severity: Low]
Will this fail make dt_binding_check? The light-sensor definition uses
additionalProperties: false but doesn't explicitly list interrupt-parent
in its properties block.

Since the example uses interrupt-parent, it seems this will cause a schema
validation failure. Should the schema include interrupt-parent: true, or
perhaps drop additionalProperties: false?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617080031.9915=
6-1-clamor95@gmail.com?part=3D1
