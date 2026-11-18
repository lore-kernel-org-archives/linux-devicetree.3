Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012470;
	b=d+fVpPXRl09GjDTsQd3WEZDdaN6PRBXuvkB/osGI0KW0cjt2LBkmAo/hEHb/DB7Dtv4K
	 oIG9F/2II05Vc+3Obnjisf5KP/0pFIpLqdGBZ+f3qpEgO/56XIb+j64ZkVjFS3zURjxXE
	 nddNpfBZXu17QAzCsaAVsh6cOdw8mUQW+JSJVT1/+3rvnZcu5eCoek/w6+kThSRz//VPl
	 295MKP9f94R+55PdTxTji2TbEAu5LNgfCHNyQcX6UiMdCbVE+gshH/FgzjguewwRgF89h
	 iZR+t2Yry9G9MEomO/FutlzkGkPH9W0XbOu3aeBVD7zrBAD9MTEgqYUr3KPlzrvGV3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012470;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Lr6eLH48BzMjoBBHi4mClxbo07mGp2hhaGJAMqc+FME=;
	b=NVfe5HOT5apfKlxBxngskezQoJ57Obrbmh6EFrd5Lvxw8yV/Qdhf4d3tOCFafKc2P9g/
	 KteyBYUi0j/cFHGqjQfCMD/SyPzMVpBv1rAOdPcEVZuDxppmDTfHKQsxRONMM2B6FrX5m
	 QVldh0aVW2UdvMfYr7cP3jv+kPFFh/QLGgQ/W1fYDdqymoAy4BSAeLyGkxR+TzKE7kcUn
	 2CpuvPH1MRXPSWVkZzViD8qaDR6yyiz+78Rvy9azrRELef5mqODnbwof1PiBKewhuu9DS
	 aruCKLOOl2fkJFKyKjaUzmoITdIdXbPIlu48drizTXIyBZ/3TJ04t9obbleODeopUGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K77qfeqZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CA2606A320
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 14:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K77qfeqZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C84C1F000C5;
	Wed, 18 Nov 2026 14:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795012470;
	bh=Lr6eLH48BzMjoBBHi4mClxbo07mGp2hhaGJAMqc+FME=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K77qfeqZo7fOpz54Yy2jY9XK3InDYkbsXbPGzZYOBCTy/hMPI5zg/0eixww1DvpME
	 9e8uw8wFFU+lr0nB8tZNDBfzvWq49s07CViVUFNwB4ZeIWAlFlbu3Czb1alzoP0XGv
	 VdJ1Q7YbPcZnZ9ci1Z8oJLOZHL6RphrUUMC0EKzxPYYQwWNrnqWxgZYhu9sYJ/kBYM
	 GSUwOTey/zz1ERMDDP1LTZdGDohg8emCgIyqw3EdyV3BOdy0JuYOhagSyMUUITMzA8
	 Nz0Hyk57791F1eUoIEuECowPBJngqrtb6zUKJ5LDHfwGj7g5o1leSVZazNyYpztJ19
	 2799NpzphOXdA==
Message-ID: <sashiko-outbox-221220@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: iio: Support ROHM BD79111
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matti Vaittinen" <matti.vaittinen@linux.dev>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <f69b996cc07fad1712871fb8b0436c71abd435b9.1795009599.git.mazziesaccount@gmail.com>
References: <cover.1795009599.git.mazziesaccount@gmail.com>
 <f69b996cc07fad1712871fb8b0436c71abd435b9.1795009599.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 14:34:29 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] dt-bindings: iio: adc: decimal instead of hex regex for
  channel nodes
- [Low] dt-bindings: iio: adc: duplicate channel patternProperties
  inside allOf
--

commit 1d2b4969234a59de95b2a054fda32ad7ef3510e0
Author: Matti Vaittinen <mazziesaccount@gmail.com>

dt-bindings: iio: Support ROHM BD79111

This commit adds device tree binding support for the 16-channel ROHM
BD79111 ADC/GPIO alongside the 32-channel BD79112.

> diff --git a/Documentation/devicetree/bindings/iio/adc/rohm,bd79112.yaml =
b/Documentation/devicetree/bindings/iio/adc/rohm,bd79112.yaml
> index aa8b07c3fac10..4f105124ee6f6 100644
> --- a/Documentation/devicetree/bindings/iio/adc/rohm,bd79112.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/rohm,bd79112.yaml

[ ... ]

> @@ -37,23 +40,6 @@ properties:
>    "#size-cells":
>      const: 0
> =20
> -patternProperties:
> -  "^channel@([0-9]|[12][0-9]|3[01])$":
> -    type: object
> -    $ref: /schemas/iio/adc/adc.yaml#
> -    description: Represents ADC channel. Omitted channels' inputs are GP=
IOs.
> -
> -    properties:
> -      reg:
> -        description: AIN pin number
> -        minimum: 0
> -        maximum: 31
> -
> -    required:
> -      - reg
> -
> -    additionalProperties: false
> -
>  required:
>    - compatible
>    - reg
> @@ -62,7 +48,49 @@ required:
>    - spi-cpha
>    - spi-cpol
> =20
> -additionalProperties: false
> +unevaluatedProperties: false
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rohm,bd79112
> +    then:
> +      patternProperties:
> +        "^channel@([0-9]|[12][0-9]|3[01])$":
> +          type: object
> +          $ref: /schemas/iio/adc/adc.yaml#
> +          description: Represents ADC channel. Omitted channels' inputs =
are GPIOs.
> +
> +          properties:
> +            reg:
> +              description: AIN pin number
> +              minimum: 0
> +              maximum: 31
> +
> +          required:
> +            - reg
> +
> +          additionalProperties: false
> +    else:
> +      # BD79111 has only 16 channels
> +      patternProperties:
> +        "^channel@([0-9]|1[0-5])$":

[Severity: Medium]
Should the channel unit-address regexes match hexadecimal rather than
decimal ranges?

Devicetree unit addresses and adc.yaml use lowercase hex without leading
zeros, so "^channel@([0-9]|1[0-5])$" rejects valid nodes channel@a through
channel@f on rohm,bd79111 while accepting out-of-range channel@10 through
channel@15.  Likewise, the 32-channel pattern rejects channel@a through
channel@f and channel@1a through channel@1f while accepting channel@20
through channel@31; hex ranges would be "^channel@[0-9a-f]$" and
"^channel@1?[0-9a-f]$".

> +          type: object
> +          $ref: /schemas/iio/adc/adc.yaml#
> +          description: Represents ADC channel. Omitted channels' inputs =
are GPIOs.
> +
> +          properties:
> +            reg:
> +              description: AIN pin number
> +              minimum: 0
> +              maximum: 15
> +
> +          required:
> +            - reg
> +
> +          additionalProperties: false

[Severity: Low]
Could patternProperties stay at the top level with the 32-channel
definition, and have the allOf if/then block for rohm,bd79111 only narrow
reg maximum to 15 and disallow the upper 16 channel patterns?

That avoids duplicating the entire channel sub-schema across both branches
and allows keeping additionalProperties: false at the root level, matching
Documentation/devicetree/bindings/writing-schema.rst.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795009599.gi=
t.mazziesaccount@gmail.com?part=3D1
