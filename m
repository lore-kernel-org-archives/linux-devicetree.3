Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9C93368B4
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 12:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776429046; cv=pass; b=WvFNIhdCAQisjD5VMaKnORnh/v4jvH3IO6oFn2DkUk7jiwbgy/MSrpPwvhBeE/KXeSOmZbnxHV9EFw1dl5o75bg3Zik0U5i6aeNZXftab8LNGvwpB8xfm8n9n4yy8FoMmb3OdGBa7A2s+pko8/F6/y7JubXSOXscWQGtoI+4zJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776429046; c=relaxed/simple;
	bh=ZEh9eTjwFPZ3QnfRFXk0+uFn/4lL3yczZsSKU/HfvO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BOKXUtDA09JQ+IfU6TrmVCGtnzgGYl8a9tLt3IR44zrQG0ON6Chjh5jxopqvKj15NAinJFnNFI0RqqUOPx0fxiYbSE1FMA1O1P2dbpAtvtoblIjK2/8R1AtrRzK/SfIWhM9472hfc9Dpj7pLqRvTLyM96lbxiGea7ECZ8EIo2G0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dizukVIj; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dizukVIj"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d73422431so468596f8f.2
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 05:30:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776429043; cv=none;
        d=google.com; s=arc-20240605;
        b=eGOl1pPyHe1re6LsY7ZVbZ+gtW8aG+u6GifkmEhAAS9rmIY+g0Bu4ajZYkO5jvEtK+
         yWuIj8FesskFh80dG64+/slYNZrjjwvBb+m+peMvHGVLuRPdQLOa5IH017cnfa4bIVS6
         3v1QffhCxxTPlqlnA5hRjgnzq6iccyYGscBzkSF1nO561EsFHsYfkFEJei2CKiDCotFG
         MDrV4qvCQjrBXZpATlCOeLWJqNbxD9Y0Gj+xeNjfxJQnMvbxnFmAQBdZen2cS+wcVeZr
         JmG0VfRLCbmKYMkdihCIYvIeDiXZQNfePOrAZbBjgoVGoWNjrQmJzoBKPKOyft/qUio9
         VDHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3RbDXw7oOLyQBxsRsPjm752yvj7/SEG0Ag12AzayEHM=;
        fh=Q3NgN3+QIbc2y30C5s50rgudm+VEIbeEp77FweWNdcU=;
        b=I8vX3Gdy5SpJq4rmEQU3Thh5DNrMzQP6QhEGmOELfjDFlBuUedlqE99lDlovqsH2cP
         iVQofiLBfrgtLH085/KCD06WlFyG57aGcWDCQJJAmitgn3ggOzo3dOHWRQm56zFD6FOc
         jrUdlO0iWIuZfBg/Z8L1tAeXXhbzlblW2yAAvSvIEx7BuxjYusPRpw4X4roBJ9IsKUWO
         WazdYcVjUzZwB62BUDEq3KeaBPubsHiqCGva8OcIkrs/NJlGQQjQhpHa6I5Y8jGQZijX
         KpydlX/YYosuZaeroL7FpSha3gIhBDb7eAUoN7gZ+oGIgexNEjeianyfa4IpNNlenhUp
         nK6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776429043; x=1777033843; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3RbDXw7oOLyQBxsRsPjm752yvj7/SEG0Ag12AzayEHM=;
        b=dizukVIjeYZqOYLQNuIA7/7LSPp9W2Dvp17OWDzNpdeQa8NfymHBByQ3YPHm5OQH0k
         CrdHjVqEzUSEzejUMFEY9tMfhHMNe9fBxkEV6Pr6jtbreBjwUDoun/hOZ9TS27cT3c9g
         +krfz2qIe+rNoS5N3XCirWrCtyZjKQz0qg6fT6i8ekALk2rkLtmmtQTQV/X1NVGOLiER
         QuJK/YlDN7YJFVixyu/mGnRThnTu5ufRv8kU60WAUVxc8I+krjjmQmPHANsXGaR3OVeb
         XjU33MLRbKl6oXl9RQaONCMsPPcdE9LUcd2jsybfsP3yXAd+sZh7X1UwCle5MI4xLz4C
         K7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776429043; x=1777033843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3RbDXw7oOLyQBxsRsPjm752yvj7/SEG0Ag12AzayEHM=;
        b=SpHwgv5cuFShM5BMPrvy3iYRUmdKK46c+Z7hcABJBeOU+3zLzJKuyPHymy54/J06r0
         +M6lLajbqQ7eZ2psxsHqU0kKHKxqcAE+YPAusJK/SjEwBgF19EKcDpO6idU81e6APgL9
         kAWZAMnPdcq56EsA8ciCPFTT5AG+OQSrEg7azveQlcOuf3n6jjirUBHnBUdoR/zYVAcG
         ZWbD7zib5+26gN4suRZsh0SHy/KsebTQGcmyI42kLz2bs+iTRjvpyDCz0NXJy+gciRNs
         WufplCC2+XgxNzGzaHYj5iYy49Y/PttqaGQqV82pbX2hdbu6l8KUwEQdKyTNHdNTM8Iv
         Cn0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9I7hFaRy99L0lOi0yMwiGOV0slpTm09KS19hhMBWXTYcW41Z0HtkIQDid39hrPIaiAPQoRbMXMEtN3@vger.kernel.org
X-Gm-Message-State: AOJu0YyzcpNWkqttK3/Pq3HRmg4E37KUkDI24X77lY1YCEKkqpfLb/PU
	PCwlEiYCv3SohBawLgstjPWPMrC6bUX+x8eC3pOYsMvYNY2Ucz7zAZdw161Ox0Ai/EOv2/ORyZZ
	XNqKAozDXsSw7VrjeA8zm725Zro/0+Lw=
X-Gm-Gg: AeBDiesZo9g9/RgF/F+vG3GIAUon31Edu2CIomI5WIuPLSlmFj/BvoqSjj/ZXuaM/io
	4DP4HP507D59FFrjJxoh3V3yaPSjXe2EtECY7SSSYR3dTyQgLoDQqMRGcro2ZFV9T7OhJWOZN/f
	SyhRalIXLRW4/JuGPCoFj/GvYNeQJATAVz7Kbb6GbUvp2ZZEPWb6mZMEBUCBUC0wJmimAUwHcdW
	k0/Mlv/HvzBuPjvfxS8avIMgYHg/U+OuX/kaqcHB6dU976sAhOU35NJtzbUhfNTkDeU6+dwk8eU
	ml1UdZey17MuCtJI2Co=
X-Received: by 2002:a05:6000:2890:b0:43d:77c6:be78 with SMTP id
 ffacd0b85a97d-43fe3e16c4dmr4209904f8f.39.1776429043184; Fri, 17 Apr 2026
 05:30:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417114226.100033-1-clamor95@gmail.com> <20260417114226.100033-6-clamor95@gmail.com>
 <aeIkBR4cx54OVmGo@kekkonen.localdomain>
In-Reply-To: <aeIkBR4cx54OVmGo@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 17 Apr 2026 15:30:30 +0300
X-Gm-Features: AQROBzA1dd8_0NTxSqGN0BqxldytYvwtdWN7VaTpfF2Ohg6pumR-lzUZ706dVSo
Message-ID: <CAPVz0n3wi2yzVc0noYe=5=VR2NWEeyXke3EPKJpSPm81qrpp4Q@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] dt-bindings: leds: Document TI LM3560 Synchronous
 Boost Flash Driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 17 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 15:1=
3 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> Thanks for the set.
>
> This patch should be the first one in the set, or at least before those
> using the bindings defined here.
>

Maybe before conversion, but definitely not the first. I would like to
avoid patch multiplication caused by schema adjustments after every
single commit if possible.

> On Fri, Apr 17, 2026 at 02:42:26PM +0300, Svyatoslav Ryhel wrote:
> > Document TI LM3560 Synchronous Boost Flash Driver used for camera flash
> > LEDs.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../devicetree/bindings/leds/ti,lm3560.yaml   | 134 ++++++++++++++++++
> >  1 file changed, 134 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.ya=
ml
> >
> > diff --git a/Documentation/devicetree/bindings/leds/ti,lm3560.yaml b/Do=
cumentation/devicetree/bindings/leds/ti,lm3560.yaml
> > new file mode 100644
> > index 000000000000..460ea1fbc1e5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/ti,lm3560.yaml
> > @@ -0,0 +1,134 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/ti,lm3560.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: TI LM3560 Synchronous Boost Flash Driver
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +description:
> > +  The LM3560 is a 2-MHz fixed frequency synchronous boost converter wi=
th two
> > +  1000-mA constant current drivers for high-current white LEDs. The du=
al high-
> > +  side current sources allow for grounded cathode LED operation and ca=
n be
> > +  tied together for providing flash currents at up to 2 A through a si=
ngle LED.
> > +  An adaptive regulation method ensures the current for each LED remai=
ns in
> > +  regulation and maximizes efficiency.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - ti,lm3559
> > +      - ti,lm3560
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +  enable-gpios:
> > +    description: GPIO connected to the HWEN pin.
> > +    maxItems: 1
> > +
> > +  vin-supply:
> > +    description: Supply connected to the IN line.
> > +
> > +  ti,peak-current-microamp:
> > +    description:
> > +      The LM3560 features 4 selectable current limits 1.6A, 2.3A, 3A, =
and 3.6A.
> > +      When the current limit is reached, the LM3560 stops switching fo=
r the
> > +      remainder of the switching cycle.
> > +    enum: [16000000, 23000000, 30000000, 36000000]
> > +    default: 36000000
> > +
> > +  ti,max-flash-timeout-ms:
> > +    description:
> > +      Maximum flash timeout in ms with step 32ms.
> > +    minimum: 32
> > +    maximum: 1024
> > +    default: 1024
> > +
> > +patternProperties:
> > +  '^led@[01]$':
> > +    description: LED control bank nodes.
> > +    $ref: /schemas/leds/common.yaml#
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      reg:
> > +        description: Control bank selection (0 =3D bank A, 1 =3D bank =
B).
> > +        maximum: 1
> > +
> > +      ti,max-flash-current-microamp:
> > +        description:
> > +          Maximum flash current in uA with step 62500uA.
> > +        minimum: 62500
> > +        maximum: 1000000
> > +        default: 1000000
> > +
> > +      ti,max-torch-current-microamp:
>
> Don't the LED flash bindings already have standardised properties for
> these?
>

Oh, they do! Thanks for pointing out. led-max-microamp,
flash-max-microamp and flash-max-timeout-us. Very nice, I will adjust
in the v2.

> > +        description:
> > +          Maximum flash current in uA with step 31250uA.
> > +        minimum: 31250
> > +        maximum: 250000
> > +        default: 250000
> > +
> > +    required:
> > +      - reg
>
> I'd say the max current properties are required as well, same for the
> timeouts. Or make the lowest the default. The lowest values are very seld=
om
> used in practice though.
>

I have transferred from the driver which uses maximum values as
default one. I can change to minimum if needed, that is not a big
deal.

> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - '#address-cells'
> > +  - '#size-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        led-controller@53 {
> > +            compatible =3D "ti,lm3560";
> > +            reg =3D <0x53>;
> > +
> > +            enable-gpios =3D <&gpio 28 GPIO_ACTIVE_HIGH>;
> > +            vin-supply =3D <&vdd_3v3_sys>;
> > +
> > +            ti,peak-current-microamp =3D <16000000>;
> > +            ti,max-flash-timeout-ms =3D <1024>;
> > +
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            led@0 {
> > +                reg =3D <0>;
> > +
> > +                label =3D "white::flash";
> > +                linux,default-trigger =3D "flash";
> > +
> > +                ti,max-flash-current-microamp =3D <562500>;
> > +                ti,max-torch-current-microamp =3D <156250>;
> > +            };
> > +
> > +            led@1 {
> > +                reg =3D <1>;
> > +
> > +                label =3D "yellow::flash";
> > +                linux,default-trigger =3D "flash";
> > +
> > +                ti,max-flash-current-microamp =3D <562500>;
> > +                ti,max-torch-current-microamp =3D <156250>;
> > +            };
> > +        };
> > +    };
>
> --
> Kind regards,
>
> Sakari Ailus
