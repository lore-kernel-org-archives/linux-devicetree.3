Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA86F331ED4
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 05:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786944965; cv=pass; b=guO5xu75kbF/lRn5NjDwgV7Bq/2RkOmTkJrx7CtajvqaJoCZ2im2MVF7iaCvi9Dfp9QdKfssXMEFj3VKWO0Rd2n3FUFTznSmEYQ2fx1TRe4kFW0R7w9nH0QNFD8sotwlLUuwkuJZE7zosLZ3jvvdTqLZo2rR7g3RggnQx5mpnio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786944965; c=relaxed/simple;
	bh=dBqku483Tr8lZOPnGGzRMy6kbH+Bn5fcTfRJaM2LVh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iQg72xUEF2Zq0mnS6RMMacCqxuKL1xtaXCduD8FtZR3/aLq3CDdj/KhOkCkKKx2EorcRCdE1SLocSSZYoCF/pHvtWNvpsYbtVgwlwR34A4WLvdNDfolp5zfljmm+FwMrk6Ce7Hu16VfRMzIZ8RJJ9XYIF8Ix3+8EwxsX6rNrD80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lEqFImoQ; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lEqFImoQ"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39f75e1e9d9so19273741fa.1
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 22:36:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786944961; cv=none;
        d=google.com; s=arc-20260327;
        b=eZScP9FnlBcPigA7g9sw/8LNRBcZZTz//2Jiv0fl5uKrwtgfb4vEbjwdGAps2f70KX
         y7TwzBgJOcvAppqhuZ72yLynj4PsQ3yv0xtdlOZpvMTo04ThlZb6DvVYsrdmFIWAWVo5
         wDqTwNf3lrS73K/51VEYfZPgBPw3TxW/4fL7ey+b4HbBCeTbtbyCm8/vEPZZIMCLQWEf
         AkPcouoifDo56uRLA/WFmXOrcXcBUGcEut+qB2dO30fQXIe11zDbwvdb+hX1KIozF8lK
         9oqxZdQyAal4WeZwBdEh+mC2OHsZa6MzWoHtJoSoTfOMyxPkC1WmyH6FNY+UrU3loNUj
         AktA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iuYx92zoubwFpQjcYMVGvP9XZdEVQ+XxrKAQgWuEjNQ=;
        fh=OVkuqMEqXYVgZIZEtcJTPAlW5g+SdAzMXMS0KxYIg+k=;
        b=dMZdavHcIVZg3o1N++hk+Ei2tEFSFysMLj1/WdwdMpXd616/Idng9jQvmQIkQT5zr2
         eRJbSJxUu9oyjKmtioUvswdRL950OVFWeYvEQNZY9iJQtHNEIoP0Nt1jWbTtOddBEK9E
         IhqwjqI7UEOkIpSK/3V1IU6RdsZarPROLzUan0vauuRd6685Jj+rYbjzSuEUVr/Sv4yw
         qnbKAgVUjKcQFRHo+rAmLDH3X+I0a2wGRhu4Odx4pmnzslm744GFm6TfQ3jw4rRL51uW
         7yVYWAcA8ezqbfo22aHC7eTqwr7XMFOf2Bp62u1HikGU/oAxwB2t1h5QzB2CyjsURd6L
         1ZCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786944961; x=1787549761; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iuYx92zoubwFpQjcYMVGvP9XZdEVQ+XxrKAQgWuEjNQ=;
        b=lEqFImoQhBxRCCPgg/NVBjxiFU6o2CpCuVH/ctq1YKWVxK/9AdJ0Wxk+HXzZjTCliJ
         6rwCJqBI8V/zwxb4WqVcxBTAOC/L8FsYz2dLb29bpDYYkm+zrirbQyACsLXjX+BZw/Y7
         dMGpLJUuDFB6v5aHp8m1+fpsaKdCZTjaJeesfDwJSQ7CJp9GHu2kRjcbX9YseC81H82p
         KKOobjRBmhjFDZ/En3xiQhJU9QyorQJbeBHBjU4GQEFSoyjTyj8+0sU8XYN+eXQpbsax
         WC/4Tzs5moNLEquRXoNLyWEd2s/MCB3dTt6tFvsyn34AQXSMiYxcia5fzf0hyCDjYnmq
         +Ctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786944961; x=1787549761;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iuYx92zoubwFpQjcYMVGvP9XZdEVQ+XxrKAQgWuEjNQ=;
        b=GksvZSydBUxZl1wd1Zk08Cuo5htGkHNmhbCwAvw6kiFr+Ov6xBEfwVAxGq6gptlfwe
         L/Fktn368v3XigFHJYAdR+shZ38dBsG0uH2KfHjhZPbbvaJvSMaD7QmgBQQSS9me5BrI
         EMwjtTqzbKs+lzpsBVQaMsBglWTgZDo7eNYbBUYmCLMcmyOFIYasDIQtfIN7G7y32y4a
         MAeCy0ZF5PIXCRpBtVW9KQFYPzIOjJFD9xAW26UJzJfLsaK7CXvJeOLp2FsJhtRTRLFE
         clq18oG2Q7GHbCvVCtYpvoi4uw+CqZKeKbxkcDYXiNxvYFPWEjFwL7v3Nxi8+lJ8+336
         qzpw==
X-Forwarded-Encrypted: i=1; AHgh+Rrh4I8/nGhCe1YSNu6EYZAT/wEFga0qifeWmZekadxHyoIbTOdCJHBMIfPcEpgFk2sM4SKk+VtCIwsT@vger.kernel.org
X-Gm-Message-State: AOJu0YyTupqe96qcg6UA2Fe4DV4YZMU9xyQ2HUNNRSwVFE1oF/34Z87n
	uFV2EIEPekS5h0yaNL8gW9X0AoCq2ovg4FkTlbX6qBGHzBwf45prIM4VE8QUUrouD7xonHZgcMk
	a6rRc5EZkE7CkREZobhxyC1XibfcYObU=
X-Gm-Gg: AR+sD12k82cmVK9I1hysZUUI38BtgK3chMrJKZ125SkPg2bs7RUq8GI/896qb/jrj+J
	wnlJIl/qhVIGZniWtaOOrPRCBl1T0BG0eQfKj+3BdMiOdkmpGxPMK9vD3bg/8jeIwQuSzCqyoFz
	+FPJmdkOx11KfvX+ahEKlwVmvQePekPHTdmnxKokP/OAJpgJJUY2u11O6h1gnxAWyL/y9crFkJa
	cUuxflBa79V7mHvAqQSOFmHZ1yxruP4JczYJBx+pjuYx9nWfhJEt18Vov2IErKi+Ly4kT0lRZSH
	Pa/t9xuSPhhzHcAhHOQb2wKz4ImCeDiSumqSb6NKN9+sUw==
X-Received: by 2002:a2e:a54f:0:b0:39b:15b4:79ef with SMTP id
 38308e7fff4ca-3a13249d4afmr20231811fa.17.1786944961068; Sun, 16 Aug 2026
 22:36:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813-ti-ads112c04-driver-v5-0-79dff9e249cd@gmail.com>
 <20260813-ti-ads112c04-driver-v5-1-79dff9e249cd@gmail.com> <20260813165748.GA2065977-robh@kernel.org>
In-Reply-To: <20260813165748.GA2065977-robh@kernel.org>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Mon, 17 Aug 2026 13:38:54 +0800
X-Gm-Features: AcwNN1Vbhevhud9cKWrmo32hz_ACvcEqPiKW3pQSSAukqHeCRuMkVWcQpNH8veQ
Message-ID: <CAF7HswMiAA454Y1eFA2O1DtGjg-SQXUwLimaM9tVkjkDJSJSuw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: iio: adc: ti,ads112c04: Add binding
 for ADS112C04
To: Rob Herring <robh@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 12:57=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Thu, Aug 13, 2026 at 11:06:02AM +0800, Kyle Hsieh wrote:
> > Add device tree binding documentation for Texas Instruments ADS112C04
> > I2C Analog-to-Digital Converters.
> >
> > These devices provide 4-channel, 16-bit delta-sigma ADCs with an I2C
> > interface, programmable gain amplifier (PGA), and data-ready (DRDY)
> > interrupt output.
> >
> > The binding uses child nodes to dynamically define the connected
> > single-ended or differential channels.
> >
> > Excitation current, burn-out current, and reference source properties
> > are also included to fully describe the chip's hardware capabilities,
> > aligned with the ti,ads112c14 binding conventions.
> >
> > Reviewed-by: David Lechner <dlechner@baylibre.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> > ---
> >  .../devicetree/bindings/iio/adc/ti,ads112c04.yaml  | 148 +++++++++++++=
++++++++
> >  MAINTAINERS                                        |   6 +
> >  2 files changed, 154 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yam=
l b/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml
> > new file mode 100644
> > index 000000000000..68a0df21cedd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml
> > @@ -0,0 +1,148 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/iio/adc/ti,ads112c04.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Texas Instruments ADS112C04 ADC
> > +
> > +maintainers:
> > +  - Kyle Hsieh <kylehsieh1995@gmail.com>
> > +
> > +description:
> > +  The ADS112C04 (16-bit) are precision analog-to-digital converters (A=
DCs)
> > +  with an I2C interface. They feature a flexible input multiplexer, a
> > +  low-noise programmable gain amplifier (PGA), two programmable excita=
tion
> > +  current sources, a voltage reference, and a precision temperature se=
nsor.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - ti,ads112c04
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: I2C address of the device.
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +    description: Data ready (DRDY) interrupt output.
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +    description: GPIO connected to the RESET pin. Active low.
> > +
> > +  avdd-supply: true
> > +  dvdd-supply: true
> > +
> > +  refp-supply: true
> > +  refn-supply: true
> > +
> > +  ti,refp-refn-resistor-ohms:
> > +    description: Resistance of the external resistor between REFP and =
REFN.
> > +
> > +patternProperties:
> > +  "^channel@[0-9a-b]$":
> > +    $ref: adc.yaml
> > +    unevaluatedProperties: false
> > +    properties:
> > +      reg:
> > +        items:
> > +          - maximum: 11
> > +
> > +      single-channel:
> > +        maximum: 3
> > +
> > +      diff-channels:
> > +        items:
> > +          maximum: 3
> > +
> > +      excitation-channels:
> > +        maxItems: 2
> > +        items:
> > +          maximum: 5
> > +        description:
> > +          Additionally to AIN0-AIN3, IDAC1/IDAC2 can also be routed to
> > +          REFP0 (4) and REFN0 (5).
> > +
> > +      excitation-current-nanoamp:
> > +        items:
> > +          - enum: [10000, 50000, 100000, 250000, 500000, 1000000, 1500=
000]
>
> Drop 'items'. Just enum is enough.
>
> > +
> > +      burn-out-current-nanoamp:
> > +        items:
> > +          - const: 10000
>
> Just 'const'
>
> > +
> > +      reference-sources:
> > +        items:
> > +          - enum: [internal, external, avdd]
> > +            default: internal
>
> default for an items entry doesn't make sense as the entry has to be
> present. Instead (at the same level as 'items'):
>
> default: [ internal ]
>

Will fix all three in v6, thanks.

> > +
> > +    dependencies:
> > +      excitation-channels: [ excitation-current-nanoamp ]
> > +      excitation-current-nanoamp: [ excitation-channels ]
> > +
> > +    oneOf:
> > +      - required: [ single-channel ]
> > +      - required: [ diff-channels ]
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - avdd-supply
> > +  - dvdd-supply
> > +
> > +dependencies:
> > +  refn-supply: [ refp-supply ]
> > +
> > +oneOf:
> > +  - required:
> > +      - refp-supply
>
> Just to make sure, refp-supply is allowed without refn-supply? If not,
> either this should be refn or the dependencies reversed.

Yes - refp-supply alone is valid when REFN is tied to AVSS/ground, which
is the common single-ended case (and what my board does). The
dependency is one-directional on purpose: refn-supply requires
refp-supply, but not the other way round.

Kyle Hsieh
