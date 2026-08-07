Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E06472F7A
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 13:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108635; cv=none; b=egR768+vHjHY72T9SA+EivEHYhQlyuE+hwCTGgZVnlSzF7sJR1lHg9HNsHDQOVMMNADgSPwaT69l7kHGRf2m11Qrx15dY9LoisUfGF1VUmqQjU5ZBceUhCaSS8cuCh1/RzKO9ETsVvRPhF7qUP4DW99a6BukgJgqUDiNN/Dy/9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108635; c=relaxed/simple;
	bh=+mMEDD+QcADWahrRjmsnvNtTJMkYwgvlPDt/bATsb5E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QGDRC9ZJe7JPDtZDJ49h0hxy0TYvN8waBXe9XBxQswTTvh+81qPaXmuFbJS4SmzN5P8lItZHCe0A+h6FFPAS+U5Z00g6R8q9v7cWRLR4NOfxFfb0h66kEaBnLlMyiIjFq7p8q04sBQ+G6HkwFx7z93OxzhcVgZEC7rk/2zYPnLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UGWaM1LL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UGWaM1LL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F8261F00A3A;
	Fri,  7 Aug 2026 13:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786108629;
	bh=BA6rzhBMfQvUT6pDURMI0vc5Nu8i0m/HScGo+EXtTyI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UGWaM1LLOtd03cLXl9j88QUC54g/kWQ4e0GUOMCwO11T3Q3rvy0PBPdhTAxlBDhBN
	 pTmRRtJFaoV2hWqywPhTih4XLuLb8I+kcqsIk6N3PzXsasH98AlprD8B9VbAe1rejK
	 RnubFs8dqocKTCtOF1f4LshS3nwFRtZQr96eNI02O/9bmLNgSDAScLXPaurDGwJyVy
	 q5FPe/+fWmefgk/lUKIMCbE63Bkzv6w6ewp1XWbmtm83qZyEiOmE+Y0s4WT8mEpPKq
	 7D7+AZbZhkPbd0ymRVIGd5xmLnWk93t7o6pJvUs3UC7jIGLxDS8QFH7BxEGluJeu74
	 gxrVJBDKQDSIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 02/22] dt-bindings: media: i2c: max96717: add
 support for I2C ATR
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org
In-Reply-To: <20260807-gmsl2-3_serdes-v15-2-7212e9e5156a@analog.com>
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
 <20260807-gmsl2-3_serdes-v15-2-7212e9e5156a@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 13:17:08 +0000
Message-Id: <20260807131709.5F8261F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The `minimum: 0` and `maximum: 1` constraints applied to the `re=
g` property inside `i2c-atr` child nodes are ineffective due to a type mism=
atch.
- [Medium] The newly introduced `i2c-atr` subnode fails to mandate `#addres=
s-cells` and `#size-cells` in its `required` list.
- [Low] The `anyOf` block handling `i2c-atr` and `i2c-gate` contains redund=
ant logic due to a misunderstanding of how JSON schema validates required p=
roperties.
--

--- Patch [2]: [PATCH v15 02/22] dt-bindings: media: i2c: max96717: add sup=
port for I2C ATR ---
commit 2370247b1c65cec955ac152aadb6f3da419613c2
Author: Cosmin Tanislav <demonsingur@gmail.com>

dt-bindings: media: i2c: max96717: add support for I2C ATR

MAX96717 is capable of address translation for the connected I2C slaves.
Add support for I2C ATR while keeping I2C gate for compatibility to
support this usecase.

> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.y=
aml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> index d1e8ba6e368ec..976f6dd2c164c 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> @@ -91,6 +91,30 @@ properties:
>        incoming GMSL2 link. Therefore, it supports an i2c-gate
>        subnode to configure a sensor.
> =20
> +  i2c-alias-pool:
> +    maxItems: 2
> +
> +  i2c-atr:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0

[Severity: Medium]
Are #address-cells and #size-cells supposed to be mandatory for this node?

Without a required list in the i2c-atr object, a device tree could omit the=
se
properties entirely and still pass dt-schema validation, even though they a=
re
necessary to parse the reg properties of the i2c@0 and i2c@1 child nodes.

> +
> +    patternProperties:
> +      '^i2c@[01]$':
> +        $ref: /schemas/i2c/i2c-controller.yaml#
> +        unevaluatedProperties: false
> +        properties:
> +          reg:
> +            items:
> +              minimum: 0
> +              maximum: 1

[Severity: Medium]
Will these constraints actually apply to the integer values?

Because dt-schema parses reg as a matrix (an array of arrays), placing
minimum: 0 and maximum: 1 directly under items applies them to the inner
arrays rather than the underlying integer values. This renders the numeric
limits a silent no-op, allowing out-of-bounds reg values to bypass validati=
on.

[ ... ]

> @@ -98,6 +122,21 @@ required:
> =20
>  additionalProperties: false
> =20
> +allOf:
> +  - $ref: /schemas/i2c/i2c-atr.yaml#
> +
> +  - anyOf:
> +      - oneOf:
> +          - required: [i2c-atr]
> +          - required: [i2c-gate]
> +
> +      - not:
> +          required: [i2c-atr, i2c-gate]

[Severity: Low]
This isn't a bug, but is the oneOf branch needed here?

In JSON Schema, required: [i2c-atr, i2c-gate] evaluates to true only when b=
oth
are present. Therefore, the not: required: [i2c-atr, i2c-gate] branch evalu=
ates
to true when zero or one are present, inherently covering all valid cases a=
nd
subsuming the oneOf branch entirely.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-gmsl2-3_se=
rdes-v15-0-7212e9e5156a@analog.com?part=3D2
