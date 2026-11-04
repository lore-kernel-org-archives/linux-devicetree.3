Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798899;
	b=cY/ej9qW/SgAmvoUcjMMT+D+WlBxw0Bz0g03maWfa4zjpk224p7s5w09QQZ25iq1ET+M
	 s/ducpm/jhi5qt4bCPx/O3IovREewrdv2ozuQx3WQb5RmVIXhC4zK4kNWbSsjADKZUfUF
	 paOjD7z8TVXLpObteMw821soliSgeA0oTzVSaEOsXJ2pgZ8D5bqp2f9vjBzjzTDIAE9kJ
	 cegTR3pa9m47yey+smf4XkeG9DjTvQslxb6XTJ9wu+TDUYoErKjcEFRHmXTwhaMJkLk4L
	 HQNWWgGZBlRrrcSht/Xm4t5B18O+pbRRrEyIXJvxZNyPJ05ZduorpHquPeNNt0vJCGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798899;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dLoO97kXylEF+wmmHJVIb7WNp0nCA2uUtcTHpKgUgho=;
	b=xaIvTtUI2RFavlhUVP7PGIPcozOWgbTrK6CqeP5hSBGK1opQh5i8anbaDSfNOhBJmIIS
	 jMiPwBQls1uMZQ1nvTEkDY5r49lpXAL+FCURlSfIZY0sUXKNf5s9p1lC4io0AGvbnnQV6
	 ehLBVaItck9+xCfCXRe+BWK/YkKTVwvZDXzFiSd4qHfE1arj7em587lC8RAc/fRdMx1V7
	 7Ng69/cmkA7HbGAjtYuFXzu8ArkVSW5YEJl5BeEXBhA4W6QOAssjI2DbWJ6SiiA8Yo2tY
	 audwqsce8Y7Wim35i3zu1HqIDMTLjnXpiKurgE1p7yyEu3GjC94gBCOd9jzObRKWuow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="S/bTtLFr";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03900606A326
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 13:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S/bTtLFr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76C5F1F000C1;
	Wed,  4 Nov 2026 13:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793798898;
	bh=dLoO97kXylEF+wmmHJVIb7WNp0nCA2uUtcTHpKgUgho=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S/bTtLFrH3O+wOZ50XvgfqJURa21QyQWAQjyn+jdDfi/uWEw57ap43Pq8dydsUS9m
	 Ex/e2T9mN8TgPe8MGSNce6lm7ZHCl+sTEo4/tlIfqw0xNTwIJxeQxKUNcZsi/PW+7M
	 EmWB68H7CxXAQS1rOpmekB27v/sY8kN9/MvId/1XdAZRC090OsnoJLw7teS87grtzQ
	 CCHkoB3B/HhKCYlD4bnhR/buSCX6drqIIF/4Fy7zwrRCeuRyrBsHWHS4YuLCTc85Q2
	 o4fMEAzfPzl2otUt5Wvedr0uXAKIUGM/+JtjfsLrBFmoeEIZlzVsoEV4y6yhKTfHT/
	 sIMVCljPghheQ==
Message-ID: <sashiko-outbox-197341@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] dt-bindings: iio: adc: adi,ad7625: add LTC2387
 and ADAQ2387x
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nicolae-Daniel Deaconescu" <Nicolae-daniel.Deaconescu@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104132143.215581-5-Nicolae-daniel.Deaconescu@analog.com>
References: <20261104132143.215581-1-Nicolae-daniel.Deaconescu@analog.com>
 <20261104132143.215581-5-Nicolae-daniel.Deaconescu@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 13:28:18 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: iio: adc: adi,ad7625: split LTC2387 and ADAQ2387x into=
 separate schema
--

commit c29e24d5cf54c71037786f3f4fd74c43de8e27b1
Author: Sergiu Cuciurean <sergiu.cuciurean@analog.com>

dt-bindings: iio: adc: adi,ad7625: add LTC2387 and ADAQ2387x

This commit adds devicetree bindings for the LTC2387-16, LTC2387-18,
ADAQ23875, ADAQ23876, and ADAQ23878 ADCs to the existing adi,ad7625.yaml
schema. It defines their power supplies, PWM names, and configuration
properties alongside the existing AD762x and AD796x family bindings.

> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7625.yaml b/=
Documentation/devicetree/bindings/iio/adc/adi,ad7625.yaml
> index 8848562af28f2..dbdded88236ca 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad7625.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7625.yaml
[ ... ]
> @@ -109,10 +159,6 @@ properties:
> =20
>  required:
>    - compatible
> -  - vdd1-supply
> -  - vdd2-supply
> -  - vio-supply
> -  - clocks
>    - pwms
>    - pwm-names
>    - io-backends
> @@ -157,6 +203,111 @@ allOf:
>          - required: [ref-supply]
>          - required: [refin-supply]
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - adi,ad7625
> +              - adi,ad7626
> +              - adi,ad7960
> +              - adi,ad7961
> +    then:
> +      properties:
> +        pwm-names:
> +          items:
> +            - const: cnv
> +            - const: clk_gate
> +        vdd-supply: false
> +        vddl-supply: false
> +        ovdd-supply: false
> +        vs-p-supply: false
> +        vs-n-supply: false
> +        adi,use-two-lanes: false
> +        adi,gain-milli: false
> +      required:
> +        - vdd1-supply
> +        - vdd2-supply
> +        - vio-supply
> +        - clocks
> +    else:
> +      # The LTC2387 and ADAQ parts have no EN pins and no clock to descr=
ibe.
> +      properties:
> +        pwm-names:
> +          items:
> +            - const: cnv
> +            - const: clk
> +        vdd1-supply: false
> +        vdd2-supply: false
> +        clocks: false
> +        # REFIN is the bandgap output and the input of the reference buf=
fer.
> +        # An external reference goes to REFBUF, through ref-supply.
> +        refin-supply: false
> +        en0-gpios: false
> +        en1-gpios: false
> +        en2-gpios: false
> +        en3-gpios: false
> +        adi,en0-always-on: false
> +        adi,en1-always-on: false
> +        adi,en2-always-on: false
> +        adi,en3-always-on: false
> +        adi,no-dco: false
> +      required:
> +        - vdd-supply
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - adi,ltc2387-16
> +              - adi,ltc2387-18
> +    then:
> +      properties:
> +        vio-supply: false
> +        vs-p-supply: false
> +        vs-n-supply: false
> +        adi,gain-milli: false
> +      required:
> +        - vddl-supply
> +        - ovdd-supply
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - adi,adaq23875
> +              - adi,adaq23876
> +              - adi,adaq23878
> +    then:
> +      properties:
> +        vddl-supply: false
> +        ovdd-supply: false
> +      required:
> +        - vio-supply
> +        - vs-p-supply
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: adi,adaq23875
> +    then:
> +      properties:
> +        adi,gain-milli: false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - adi,adaq23876
> +              - adi,adaq23878
> +    then:
> +      required:
> +        - adi,gain-milli

[Severity: Low]
This isn't a bug, but since the LTC2387 and ADAQ2387x parts only share
compatible, pwms, io-backends, and optional ref-supply with the AD762x and
AD796x family (while even pwm-names differs on the second entry), combining
them into adi,ad7625.yaml requires removing the top-level required properti=
es
and adding five if-then-else blocks under allOf to make nearly all supplies,
clocks, and device properties mutually exclusive.

Would it be cleaner to split the LTC2387 and ADAQ2387x parts into a separate
binding schema document rather than adding these conditionals to
adi,ad7625.yaml?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104132143.2155=
81-1-Nicolae-daniel.Deaconescu@analog.com?part=3D4
