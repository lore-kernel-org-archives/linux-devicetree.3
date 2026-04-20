Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B9E34DCEB
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 16:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776702940; cv=pass; b=EHKmlNwDKhLbEl16dcITSpFWFLExbdG1E2OZ682cGamwFRs4EHkZLNcQbX1kdVb/Ozg4S+28Rcb8mr85FSuRtFvX+jVG1NuKJ4DfxwW4xNEQO9AFYBf8YFuMVk484gfLqG/+hm8DcH6neUR4CNP3UluvYC0fnGvCuTkehQAbQow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776702940; c=relaxed/simple;
	bh=dm4VEkAvxh363XWDUknSCcCouYOtOHI7Nni0i+AXBJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kfWHkeRlzZMZXcC7Br2CgLYc36FmSlpZRH9i5ptwUyquQyMvskdbGP4XzA9KtD/1z9Pevp8YTZQ+TEHf9dnsYRhnogENsqRuQtmUYRjKq5xNJwljLXL01n9rNq9oXnYbDwg1QnEH0tDnSQFZvh1Z1VkH41Iaym7FXq8goyQOgyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y0aIgab6; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0aIgab6"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43fea39e066so2386395f8f.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 09:35:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776702936; cv=none;
        d=google.com; s=arc-20240605;
        b=G4PgFwag8qNY3z8FKrI7GFMA3+LW/ERzyMPGjNsJIOHJZIGigR55zMrk8HO5aOiVeR
         CA6hK17Xw9yFwkGIQOecO67hO3c1mxI93ECt4kUQqRsFbe0yrSrU2lJ4MZVqfh5vvL8d
         kgKBPb++GDulGULmdAIukrIIFiG0389rMyLrlKDSC/m0LMLoMS2n6H2SVeXHh1uae4kg
         dgvFZCxIYYkLWEWbDGk+RkZA+ABrMZUMhspxSePyRg+WIL00fwOQjNkkQMLXDLtq+Nbb
         vpVmbZ7lDAb1PEXHGWp1TxRGZkHVowa4ph/T/Qx/vj8ZZryG2ORaRGaQIIPGLCo8i/r+
         IHSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/NzBywcAbSbcv7VKhOwZIiQyYm6oCAIzmcwL6dNhx9I=;
        fh=xc+C0BaAyFG0ui8u8CGnbNOBB/z1b5Q+KVAIU2um4yM=;
        b=hj+yP4wal0bcWwNQWIpVUZpSLr52YIdaalgF2xecM5mtRNJOog8uamwS8d5qgKCQ5V
         873fhLvj+tQyldL27Fel5dL3y15QDCcqMRSZyPQa3taue3i/NkOoJbZAd2OCuzIclqR+
         EKUA+MIAZZOLCj1p1vUOJoOEGjX7X+McO0RPWFeAQEY3oC4Sv9cWairW/Tns3jPSv1AP
         LdersWXF9xq8n9hOAdXvbTliyyz+2Gi0Y2ZFssoTZUxpkXyp8QMxgInGqBA/3mWS1ctu
         7uLmA97V0nnrN5WQug+Slioaf+R/96jg4hoA+Rj2vgYv59DV3ue6JJYPa5YiQHn6cyl/
         aknw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776702936; x=1777307736; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NzBywcAbSbcv7VKhOwZIiQyYm6oCAIzmcwL6dNhx9I=;
        b=Y0aIgab68xhSo9pLmILN7F6LeQo1C5aLJZ1pql3C6JZ4sUGOP8MBbCHN1yMVfM/j1E
         2qlY61CSkPmSI8XxAnyzBoRInslJNtKjhsZd3ITWv2nw0AIliB7UkQC3zMb+YSjetpA4
         maJPp6tXuygmjv9cPsMNczKA3NNyjabbzV7dLQu/3kXnIA0wE67x+CnyoCeXbIjZNH90
         TALWggwxiHMJ50w4iW3fNPASGXL2vRSYzpf7oy8EEOSnJXZj+Ax6+f+X8aoXlm79Qr6K
         WwkVJadiaNU8MgnP+G7yHi4KAlNm7qlmwrUsZsa+goyJW6hsT1+GEzi8ndr9K3zmntaq
         v2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776702936; x=1777307736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/NzBywcAbSbcv7VKhOwZIiQyYm6oCAIzmcwL6dNhx9I=;
        b=PLzCFWeqRK7XioQeOIn33NxjdnO0uwokewvb54aHLeaqIU+BWpuuFV7u0uB2laB5By
         HgXeNoga+poB+IAWkgl4lwltOdmiiCNIDo7DvPca1TS7K2XKtb3L/HFrFdkmcKDraDIt
         7eT/qg+8iVpKnxkxz1KZh8DcJtPwHgFJ3tWtVc379o22r1DA9cwjVzIPl1k78E0DB9kH
         mYSomE0WNBWYzXmQTqqoQ8OO6mbVloG0YmmzxNlpaku3pC7i+oqC7kdKTv93DNSG6K58
         lSA8NFQB7ZTKPlkjuBao0ulKHsh6if1tJFPwBro4Y5inwOOxEmnzeYTyt/1vHE7rp3Ic
         eLzg==
X-Forwarded-Encrypted: i=1; AFNElJ/XheoybjZJe29urO0qaJ/KFxyYuDS91olPxMGn/fuL6Lebhsc3jtkxLJc49GoVGVdHDiZXEF/K4ens@vger.kernel.org
X-Gm-Message-State: AOJu0YyC1NGRx3FaOHr8c1ziEj4y3PKYsfh967pZDuQI7I+eN3OhlZ5O
	p/p48KtJI3yX0xDpTTbFsASX7LJFdLa1uB235Jrn8aD3w4jKf3lu55BAv7z+AAHe0+fj3Eackk0
	a/DSAO0aGfzomh72rK6gqbIGXy3bDhY4=
X-Gm-Gg: AeBDies2jUScMRWuFbDrCh7DimvJgd9rso/mqY9xapsNj3ASIG1RluYfTu0HCwkOBya
	f+iiOBNnJG4fODF6Vrwtex9A9gijaCfpOT7az00Hj6sdUToOwfl3dwh7ODOa1ewHhVnMIfkot0C
	Ors82D+05fadt0nSujNryTH8btDZojeGwmv/UpbZImusu+Ln6Q+cMd/XOSzlJaQIDtOCgQqtQIC
	FiakCjNxPPg/OQqE5yZZvEN5zWZz2W+WKKeAvP8KjM5k72l6TvHWKO0Wx2PTX1zqyIarvJ43Yhg
	jO7ATkeBZJyQEBXgvfU=
X-Received: by 2002:a05:6000:144c:b0:43d:6a0c:9571 with SMTP id
 ffacd0b85a97d-43fe3dd339emr22528757f8f.11.1776702936000; Mon, 20 Apr 2026
 09:35:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419093412.40796-1-clamor95@gmail.com> <20260419093412.40796-2-clamor95@gmail.com>
 <20260420-affection-ferocious-e28cd29f360a@spud>
In-Reply-To: <20260420-affection-ferocious-e28cd29f360a@spud>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 20 Apr 2026 19:35:23 +0300
X-Gm-Features: AQROBzDU7oJToDi9XY48OuEZo2_fLXR3JR-e25Teo--fz4-F-ARVoBLm8Mnqm74
Message-ID: <CAPVz0n269feZqC=RoR5fjTTvtnJ4bxUWOLS3Aj9N4EX4+DLoCQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: leds: Document TI LM3560 Synchronous
 Boost Flash Driver
To: Conor Dooley <conor@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 20 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:2=
0 Conor Dooley <conor@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, Apr 19, 2026 at 12:34:08PM +0300, Svyatoslav Ryhel wrote:
> > Document TI LM3560 Synchronous Boost Flash Driver used for camera flash
> > LEDs.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../devicetree/bindings/leds/ti,lm3560.yaml   | 131 ++++++++++++++++++
> >  1 file changed, 131 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.ya=
ml
> >
> > diff --git a/Documentation/devicetree/bindings/leds/ti,lm3560.yaml b/Do=
cumentation/devicetree/bindings/leds/ti,lm3560.yaml
> > new file mode 100644
> > index 000000000000..c6c553ad23f9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/ti,lm3560.yaml
> > @@ -0,0 +1,131 @@
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
> > +allOf:
> > +  - $ref: /schemas/leds/common.yaml
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - ti,lm3559
> > +      - ti,lm3560
>
> What differentiates these devices to the point that fallback compatibles
> are not suitable?
>

noted

> Cheers,
> Conor.
>
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
> > +  flash-max-timeout-us:
> > +    minimum: 32000
> > +    maximum: 1024000
> > +    default: 32000
> > +
> > +  ti,peak-current-microamp:
> > +    description:
> > +      The LM3560 features 4 selectable current limits 1.6A, 2.3A, 3A, =
and 3.6A.
> > +      When the current limit is reached, the LM3560 stops switching fo=
r the
> > +      remainder of the switching cycle.
> > +    enum: [16000000, 23000000, 30000000, 36000000]
> > +    default: 16000000
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
> > +      flash-max-microamp:
> > +        minimum: 62500
> > +        maximum: 1000000
> > +
> > +      led-max-microamp:
> > +        minimum: 31250
> > +        maximum: 250000
> > +
> > +    required:
> > +      - reg
> > +      - flash-max-microamp
> > +      - led-max-microamp
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
> > +            flash-max-timeout-us =3D <1024000>;
> > +            ti,peak-current-microamp =3D <16000000>;
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
> > +                flash-max-microamp =3D <562500>;
> > +                led-max-microamp =3D <156250>;
> > +            };
> > +
> > +            led@1 {
> > +                reg =3D <1>;
> > +
> > +                label =3D "yellow::flash";
> > +                linux,default-trigger =3D "flash";
> > +
> > +                flash-max-microamp =3D <562500>;
> > +                led-max-microamp =3D <156250>;
> > +            };
> > +        };
> > +    };
> > --
> > 2.51.0
> >
