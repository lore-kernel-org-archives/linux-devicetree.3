Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2B2315793
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 08:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781598781; cv=none; b=VYV3oUse1DJ4UDqV00mLV7O7IneOgw6iAR41n3/E0DS7b1Bh9Dirpst1QNkXQR0HQZfZ3pPFL9VKSckKnh1jbrYKAZMVh9Y0FZDCDI9O2aqM5N1gqj9t9qJzmfZAZFIky+hSPNbXCHS5UH8GOpEy0wyJ+gR0r2eJfmEPoRk9WdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781598781; c=relaxed/simple;
	bh=RMUOAucSL+ZzhRYiy7RmmQjOQ6CvgKfD0BwB0J/I4kw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DGkogd+b4clBzbvmEZCVDGFpKJLDzqnvc+2Z2UkVJAdF4HjI5JoQo5++F6viGTaTxoEb4eds61zcaNC3kVwU37cJ8St5oNRJcsohZB8OUMP6mdGTVoSWvfvzYmvRRqwrR26oS9q0KH4mu+1i4qidd2Hu3aOntUUsNYNpPqoiHaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9tAI9JN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9tAI9JN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC551F000E9;
	Tue, 16 Jun 2026 08:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781598780;
	bh=p9WcdK7TNKcP0LW2jnyP/r6T1tiMPOINzgD//AM3MMg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b9tAI9JNQv4ibkRyPhGcW9dg3PpVB3VJaRAGZwGS0wv3jv1aRv5o+oblYmz5JgzLd
	 BLTfBcfHaw9ILEx4vlycNdosGWTS+QbVuRdAtMd5ep7C1t6K1TsZ38qszd2SzCtU5Z
	 CG+xuRCclnN47jrvQonaTXujiZxv+krgfS0kSoAtjRv28M/tiydUlY7oGnHOceR7re
	 B4RYvO82gX0mjj42LPDq7gMWiISONJLByWZ0DWfJA+KJEjP5ipcB41AeuNnDWa8wxD
	 ZRnte4+4VkKlOxwgK/IZEKMhklbOEGS0+y0xk+NpU8xvLuvPgxpgA1I1B5zz3bD67J
	 t7idp+ybMm/Zw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/12] dt-bindings: iio: dac: ad5696: add
 reset/ldac/gain support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260616-ad5686-new-features-v3-1-f829fb7e9262@analog.com>
References: <20260616-ad5686-new-features-v3-1-f829fb7e9262@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 08:32:59 +0000
Message-Id: <20260616083259.DCC551F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incorrect use of `unevaluatedProperties: false` without an external=
 schema `$ref`.
--

commit cd7d8addb3fad4751f6c895cad5073c1197387e2
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

dt-bindings: iio: dac: ad5696: add reset/ldac/gain support

This commit adds GPIO properties for RESET, LDAC, and GAIN pins to the=20
adi,ad5696 DAC device tree binding. It introduces conditionally restricted=
=20
support for gain-gpios and adi,range-double based on the compatible string.

> diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml b/=
Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml
> index b5a88b03dc2f0..c55158c464fde 100644
> --- a/Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml
> +++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml

[ ... ]

>  required:
>    - compatible
>    - reg
> =20
> -additionalProperties: false
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            anyOf:
> +              - const: adi,ad5311r
> +              - const: adi,ad5691r
> +              - const: adi,ad5692r
> +              - const: adi,ad5693
> +              - const: adi,ad5693r
> +    then:
> +      properties:
> +        gain-gpios: false
> +
> +unevaluatedProperties: false

[Severity: Low]
This isn't a bug, but is it necessary to change additionalProperties to
unevaluatedProperties here? Because this schema does not reference any
external schemas via a $ref, and the conditionally restricted gain-gpios
property is already explicitly declared in the top-level properties block,
additionalProperties: false is sufficient and usually preferred when no
external schema references are present.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616-ad5686-new=
-features-v3-0-f829fb7e9262@analog.com?part=3D1
