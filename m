Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794308920;
	b=jOKUDLiTmoIA0ZvLKwATYXFMIjZJ6hGLdOy/xleK7utopZfg7DIqbzjo7T+f9yF6oY7+
	 WoO50LGXqyRxkhDFOuK5fF25Vn08Du3zPrNVpEEZDVX3oXlfRpgbURpEJYMdeeFsVkmJY
	 OZt0tM0wfyYb0YZvbtAFcbFxtEA8Vmj5QazBPAGm0VJQHi5jDjtTiMgk2hyeKd/wcSt+o
	 bGlt86GG1DW+qLasd6zlbtY1ecvLHTh0E2E0nbsE4FTPxm9Z1Ub+2z8/2UsusEr/qMqng
	 OIDVvHorV23wm99GrFGC0hqgCan6+QLpheGyuydrurQNfgN37iL2/tcvOG652zvABhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YtphAnQY5mISnzOyw8GgJCX3M5AUjiNclyY0w4znsvE=;
	b=xmD028mClM3T0x+r4RNwz+FQ1zXv4YfjUQhlZmqjr5o+aZE6w6D5VKVRLtRWqYEbYseh
	 nEw8FkJFoH8bTfPS3drFPcYX5ocjlu2HQaAyxEANWV489k/fuhd7x/7FAGO5wBPobT6Ts
	 GAQKO6XDXSK5I/eb31xqFczoZmBoacbvfMT7nTwA8TIo7ue8XtKjf99qYFpzX1oebXqrK
	 HQHHXbBKA1L4St+tP8if+ISe9JMxztYhC+casom8qfnLP7MuhVws6w8NQDSOCTvmGW2z7
	 yDXjNEVNJhN5VZU7+IObJxtcLaCmsr25/tY99VfgZLMMpGeaK8UUK/X27PqpbhNlg3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=ATKIgBb3;
	arc=fail smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588BE606A321
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 588BE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=ATKIgBb3
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b5973a4b4cso2180531a12.2
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:08:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794308919; cv=none;
        d=google.com; s=arc-20260327;
        b=EFOxFVtmjCcMFfj7fjmj3yJDoYB3/HbftuFZlQ2r+/N3MdUGk75HeNEWD4bMfTbcNc
         IFseNJE+BDJqSBg80j+jpdKc0m4FaOPXYnYG0ZVufRpLCjd9tneuzloBaV72X+WV21n1
         zSfAXwuRVcpAAFrr6IuLr769Gua3axt2iI/wbNqL+UBwrD13vIZOKSj1DgMBbqRKF5Bw
         VgAa9XY+0szydZ9Qv1wL8yDjHj1N/5aZ/AluAlNf5vUwiWGqV3LJQ/tpUI/dIBPXwEW6
         jpnD6Lg7DjA0ZyjDjq4OneJUTZtHUNY+IIRDNrleylfnTvzYIjqLaTR0mmNk1BckL2Tt
         iv5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YtphAnQY5mISnzOyw8GgJCX3M5AUjiNclyY0w4znsvE=;
        fh=0xmtjsKZOLSaxIUFM6+4mgRXixlJt7TgmRZr38EVqKU=;
        b=jX+zIDGOn+ogrGc5tUcKIWNOBf0wkQc/lGFBigBxvg8zIEm2WyjzDe5TxMAhIX/yO+
         JcR+4ehYtjGRVdpYFLwrxG+swaJambzVa0Y97SQYE4PoovIxnMbhmwP8/ao2KJpFQ0D3
         jjoAgQe/5T4+bn3U91cwu10Zo20D2dRqd9UujJ2WkLYQV6w+5b6pgw4MbmhtHk4W7Mw8
         onW2AM4loywfEiBFpyK0ROaeKv6voH7rCl4eNFktwNnL3hiPpwYKWt0+UsVGkTZq+9Ff
         ArCuR3NXgFRnlQk6HAkAbJHeq2ZV70Qzsz+h/HOl3YgF/iqfkK1oarXSW4eTytXFpB0g
         BxVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794308919; x=1794913719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YtphAnQY5mISnzOyw8GgJCX3M5AUjiNclyY0w4znsvE=;
        b=ATKIgBb3COVMm0Tw1w7BDFap2wFE6VMsRLY2235EcBgQAjfRBai5tHoO3eoczAZeoI
         xPdVkX39CeT5yr1cYxHCog+l7w5Hwu7wkCc0QnKOYyetnIk62HwOV/jznD9K3sSLeJt0
         Z/Kzjl9Z3GVZIBudJbyaTUK0lUVTxZaDxnmta2GG+H3zek8cExt0msDIAvnFHFSwods/
         ObTfA9iFJRdlGC7NNUI576c2U+/dUHaVlleic9c45qwALBXEvrhV/qXUTrS8jNDd3IrV
         X5mjz0zyizKVWEbVILgr5V56bXtHj5pSivuh4rxQ17Y54pUph1yxkZB/nGpMZO62SgLM
         tsig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308919; x=1794913719;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YtphAnQY5mISnzOyw8GgJCX3M5AUjiNclyY0w4znsvE=;
        b=nHWZjsOqwKgBge40VnOgJgC04hj1fvSnlOQBUj/OG8WvYZFhIYUS3y+3ZiMQoeU+jf
         gcaCGpOaqFzPCowBilx/vJZVL4h9H6/MfUeZlQZ+gOE9u5y1F6Oojvg7iaCEI9JJm15P
         NOBKK+JP64ZjRE33j2AnyCxgXQbm9+0JG2S0yUC1D4L64TRDxqjF9hjbfueI3Nm8j9NN
         /uplbxdtUIdaedg8lSasuiRHh+cPwly8ypjePoefsVYp2EdrbcwHLmeSYrSgeuEQl/ze
         gIhhbFNRa2zOsO58SRzueDYfzAszVgw3io4NTn/RrgGMsqe8ApU20WNFHtbGQCeX5++y
         5t3w==
X-Forwarded-Encrypted: i=1; AL+hErG/GzFuXV4Tqbv0q9emUDQEzTNDnhRja8Pgkk9ABvIcr9RQyRcZsqzopFqDL0CuLd0YSB9d4GdIM3Nv@vger.kernel.org
X-Gm-Message-State: APuU4Z+N76ZGTmuDJE7+wScU9mrvDaOnU5tEyGx9Xs8RmNUPAP5wPJcy
	WAJ2qOlF+M42q+HaxOwc3tnJz9aLVtKVwWB5Ikj0Msp00p4J9p3nWx4OhM68mgj5fpxWMv8g4qC
	rT4chPf6VA1mZUsTABY4UaU/MjFAi+gxWB3kVlR170g==
X-Gm-Gg: AYBFou2udhfWT6R67ptDZTcWLoDCNA7gfbHDJma6R6AGpwmZU/rJ0ru+DyNOE6RiQin
	Sjrg0GMayDVpdAG7Vteh1MpSDNl4gO+8Z1cy5IkWX4wg1FJrnerPOn3foj7JGvRKKLwiC5oRy4K
	rviCx3M/y7+j5R/Wxy6BqOJwUz7SgKd4vKpZAY+trZkBFDXUkJX0ZHGxGT5aw6575OxXNEXQgId
	cbtiHH0j9s1MchwVio9wVNc1qRZMlqxhoDjqSglgxRjftV6LNBDrt256M0U3bFb4lyqyfJQVVPM
	NDHxeYsxuRN7GVCZHrJNuijksMLiDvCSaVJGG241Xh3qBcFMTXDDlKHA3rKvDBjFBZ74iV1bkex
	jtmWc8GVmus2z5hs4MlO4PehI7usDBECnm3DRI11uUp/9hBEEZY0G+aTwAUQLN/pNxnKncHCqKd
	FxHlWwu2mi39ziAHzBc1Yh9hCF2sGAbR4ifxTz7SMaR8gCjeY5QpzQGw==
X-Received: by 2002:a05:6402:1d54:b0:6b4:59d0:7294 with SMTP id
 4fb4d7f45d1cf-6b7564f6f76mr2116289a12.31.1794308918607; Tue, 10 Nov 2026
 03:08:38 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109133609.810876-1-robert.marko@sartura.hr> <20261109-mulch-mountain-118fd114a797@spud>
In-Reply-To: <20261109-mulch-mountain-118fd114a797@spud>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 10 Nov 2026 12:08:27 +0100
X-Gm-Features: AclHuK8rAj1SvZu7uW13wrFXg8Ofz7g_PIsRsWgsTldu6tOuG_htfxW5SgQtu6M
Message-ID: <CA+HBbNGUig8q_U075xXc62opOvK7wz0er1c6ROxGnKYKTrwWbQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: hwmon: add Microchip LAN969x fan controller
To: Conor Dooley <conor@kernel.org>
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, Steen.Hegelund@microchip.com, 
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, 
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 8:14=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Mon, Nov 09, 2026 at 02:35:05PM +0100, Robert Marko wrote:
> > The LAN969x fan controller has a PWM output and tachometer input in a
> > register block separate from the Sparx5-compatible temperature sensor.
> > Describe it with its own compatible and binding.
> >
> > The optional fan child specifies PWM period and polarity, tachometer
> > pulses per revolution, and thermal cooling levels.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> > Changes in v2:
> > - Describe the fan controller in a separate binding and compatible.
> > - Keep the existing temperature-sensor binding unchanged.
>
> So, I think that this device has been modelled incorrectly from the
> outset. "devcpu_gcb" should probably be a syscon/simplemfd, as least
> going off of what I see in
> https://microchip-ung.github.io/lan969x-automotive_reginfo/reginfo_LAN969=
x-Automotive.html?select=3Ddevcpu_gcb
> and the fact that we see silly offsets in the dts:
>                 reset: reset-controller@e201000c {
>                         reg =3D <0xe201000c 0x4>;
>                 };
>
>                 gpio: pinctrl@e20100d4 {
>                         reg =3D <0xe20100d4 0xd4>,
>                               <0xe2010370 0xa8>;
>                 };
>
>                 mdio0: mdio@e20101a8 {
>                         reg =3D <0xe20101a8 0x24>;
>                 };
>
>                 mdio1: mdio@e20101cc {
>                         reg =3D <0xe20101cc 0x24>;
>                 };
>
>                 sgpio: gpio@e2010230 {
>                         reg =3D <0xe2010230 0x118>;
>                 };
> That ship has sailed I think though, so I'm not going to ask you to
> rework this whole device.
>
> >
> >  .../bindings/hwmon/microchip,lan9691-fan.yaml | 83 +++++++++++++++++++
> >  1 file changed, 83 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,l=
an9691-fan.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/microchip,lan9691-=
fan.yaml b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.ya=
ml
> > new file mode 100644
> > index 0000000000000..0b7d38a6d20ae
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yam=
l
> > @@ -0,0 +1,83 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/hwmon/microchip,lan9691-fan.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Microchip LAN969x Fan Controller
> > +
> > +maintainers:
> > +  - Robert Marko <robert.marko@sartura.hr>
> > +
> > +description: |
> > +  LAN969x fan controller with a PWM output and tachometer input. The f=
an
> > +  child's pwms property references this node to specify the PWM period=
 and
> > +  polarity.
> > +
> > +properties:
> > +  compatible:
> > +    const: microchip,lan9691-fan
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: System reference clock
> > +
> > +  '#pwm-cells':
> > +    const: 2
> > +    description: |
> > +      Number of cells in a PWM specifier.
> > +      - cell 0: PWM period in nanoseconds
> > +      - cell 1: PWM polarity: 0 or PWM_POLARITY_INVERTED
> > +
> > +  fan:
> > +    $ref: fan-common.yaml#
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      cooling-levels:
> > +        description:
> > +          PWM duty-cycle values corresponding to thermal cooling state=
s.
> > +        items:
> > +          maximum: 255
> > +
> > +      pulses-per-revolution:
> > +        minimum: 1
> > +        maximum: 4
> > +        default: 2
> > +
> > +    required:
> > +      - pwms
> > +
> > +    dependencies:
> > +      '#cooling-cells':
> > +        - cooling-levels
> > +      cooling-levels:
> > +        - '#cooling-cells'
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - '#pwm-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/pwm/pwm.h>
> > +
> > +    fanctrl: fan-controller@e2010348 {
> > +        compatible =3D "microchip,lan9691-fan";
> > +        reg =3D <0xe2010348 0xc>;
>
> btw, how do I translate the addresses you have here to those in
> https://microchip-ung.github.io/lan969x-automotive_reginfo/reginfo_LAN969=
x-Automotive.html?select=3Ddevcpu_gcb,fan_ctrl
> ? Or are you looking at a register map in a different form?

Hi Conor,
Microchip has cml-utils, which allows exporting the registers and
masks automatically, its part of the public SDK.

Or you can get the address from the register map you linked, its just
posted as word addresses, so multiply by 4.
So for DEVCPU_GCB:FAN_CTRL
- default offset: 0x38800000
- DEVCPU_GCB target offset: 0x4000
- FAN_CTRL base =3D 0xd2

And you get:
(0x38800000 + 0x4000 + 0xd2) =C3=97 4 =3D 0xe2010348

Or you can just task your LLM agent to do the math since its quite annoying=
.

Regards,
Robert

>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable
>
> Cheers,
> Conor.
>
> > +        clocks =3D <&sys_clk>;
> > +        #pwm-cells =3D <2>;
> > +
> > +        fan {
> > +            pwms =3D <&fanctrl 40000 PWM_POLARITY_INVERTED>;
> > +            cooling-levels =3D <0 128 192 255>;
> > +            #cooling-cells =3D <2>;
> > +        };
> > +    };
> > --
> > 2.56.0
> >



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
