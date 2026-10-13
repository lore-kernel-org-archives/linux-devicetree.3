Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B3D51FCB0
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 17:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791911329; cv=pass; b=Mz8j9n2NAHYiBnSsPbmSWtxxyPIbkDNzL1rBKn8gdYGR+ASH7GwEd7F7KDGzSO6lXg7t75z3q/puZatcWJIzFGiW2kqd8Q4XI0KTjxRKoDmqqiaIY89O2sPNo6c7MTHn+6S89uROemcMIB9xCYO5BtJWUAPvp+v8D6HQiEORC0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791911329; c=relaxed/simple;
	bh=2EjnKvFrsHd7xz3u3FLsyf8hhAt+T8peyaRydRnO0bI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u8/6Fg8FGVpZmkYFSzSU0+jS5ANPLcFBrUKVUoJTiF3kW6fFdt2GqcKd1MB6DPeqyubxmTn8GksiENHKp+N6/XHYZjIY8j4O21pA5UOdiAIHBYTS4oTiKgGR4PTCV5qHD5A6ELC7tJirPdhod8E8/xxWTYvOYy5kzwXPDTbINHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=JdkOt909; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="JdkOt909"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1965616a91.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:08:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791911326; cv=none;
        d=google.com; s=arc-20260327;
        b=EtBlQmOognCpzMBrOQi05IMnRnUnGfD25AZoOoTrdx/tKw8d7tvy2qZItZjT45x9rh
         9H8NDyUAcd0HEuElLa7qxfZGXbVc1Vf2CwP0aSSF0+VpaalOoOFfQqAhwE8OxHdcp0kC
         4S8FMIYxy4yI7nfTZ0aFA1oxzGkbSW/Xdp4ChlYAwYqjBqMKETVaWFgCFkjwO+Wqa4lp
         TS8HVcolAl0ycZRjZ24/3OaGi9vpgVejjTFSak3XCSkq9kKzCwIDlBXJrDUqOBrRNM/N
         Y8pzGxgxGXerfEaagFXnpYXMdIQ5WXMBUQ5O0o+tIwo1xDhrDEt6bg/dzB2mKDKKYJKX
         1hVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LjkqVCLms34ssopA3L4wRlVbVB2YZSzdXKYJJjD7zjk=;
        fh=nIpjF9RqPk/rIRaO5DsKfPr6jOLujEel0FmFev3B3V4=;
        b=Uy0KD6oFa1rENhYW/nxfMku7mYAvbua4K6Di8L4sLb/5dsttwcpb5hOqcqiFn2m24w
         xmGizyeoIw6r6/gVurB7MdzU3QaKfBOFENZVelsy1NvScEfG+ntX7OYdBsdYthIp1/RU
         7AwShW81+otHBqFjcz+ZahONld2kvEUPgvxm0VJnJixTS75J9NZRElGk5zTXxXD2UYgV
         RVyEki3zEn+vzxgfuu06Vg09cANKrbMaP8FCoI+QhcNg/8QZcxPL2VIS3OV6QWBpmGKT
         XUK+ZLOQPuebFaSrTw1qK5aBMR0hU1UFbkaQIB/d/EjLSTVJZ9Ou+tETW5TVNgbZ7sQB
         xxrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1791911326; x=1792516126; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LjkqVCLms34ssopA3L4wRlVbVB2YZSzdXKYJJjD7zjk=;
        b=JdkOt909zR6N0W/wAFCpGLxBesW1V3jwfJDcy4WGjQsWLkljfNR4aIJiHzAVVmIlLD
         UNzo5ppwDK9eUmw+e8INPT+A3z8HJ7oGqJaEYcTBhikQDRnbEHvQClZU8eE+isjJPQQj
         OGGtp7XTEYGqpS8HmaeHQ5MOO6LJDZqB27rIKy2CcLhAgx8X8j23M2ej2z9SZW1P7sXn
         PlQensYSlc2edSFj0CVzUHvr2GW3XN/clRuLugPnEkSDTboo9fR+9rWetNd+rgdjEaJ8
         OyuPy4drAUWTEzja+gWx7emAbyBAvp+d46WOj38VyZI5gf4TfmRbmkUej3/zDRPSMN56
         XtMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791911326; x=1792516126;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LjkqVCLms34ssopA3L4wRlVbVB2YZSzdXKYJJjD7zjk=;
        b=stLvXwdAefwB9RfkX9IwARRBZRus0H8LdHcuoMbYCsYtEr6mZtdX5JTDV503ew2dQb
         SOYxLOwc6oH5By9RGklWSRxC80vkNNXEK8PpTx1kac1hgf9hIhyOWUmWAm4/X3slaNg1
         3eORzz6LRMdpEi2rf6hc3Q2WXkuSlab3K7sxAYloa7oWws+M6u2htSpStPKpQn8KoIGB
         0lSNmUrs03H7XuoD03k+No0lyiPVCyKj9TeFRoFu1kLgKVfc619Ii9dNr4nSb20GDfoT
         N3hPE+X0J9bGywHTmTPSluw5zdB4aNYNH4U5UcZy5/FWmIUdLppvt/TNKtem7CSjsH7T
         Rubw==
X-Forwarded-Encrypted: i=1; AKwUvBwG2f2rofxLfNEAjCmHx4bBcqMDB6BXm8Y2nLB2HIkKNZ6JSJOsYlC0ehwfdAjshsDEKJWka3SQGOwm@vger.kernel.org
X-Gm-Message-State: AFq9FYIpLfQSnD7Xdo/Mc18RbOrb9faoFuxfuxKRcNJlCA/v09FnYAnE
	nZqE35Eo9HNC0yQtlu2t9mQ/7wBQtxZ+iea1TgPn/ueJ9Q5LRIp6HX4HdwSlc2OeNwpeXGadKLf
	qIUDOyBQMKypjyWrwC+/xHCCSwpheTNfy032FstF7wA==
X-Gm-Gg: AYBFou0hzSJ6AnSouqViSGzfC2HNqszCyfo1zC3siZZoY4vcaoIQcqDrbFYxOcdmdTT
	He2O7GT9P3G7b1ktauHZF782BhrAiwPQfjPScYLPs8e6PRpNy/cTuFd+47c20ZQCebj1rRySLtM
	WNpNIqz8mWREG+0Vlk9RbYEEi6vOTs4WTwqScQh29zpXe/6hZqXFJ/jrUx3qA9hT5myToMqpPGt
	lhXpefTb4wbh3NQAmb/vL9Kc3aLc2Aqn1KUJLfLEzpxk425ePrgHsHgTXEHHPyze8fzwPAq0JbQ
	TehWofU7WbN00PkzS58oeVd1OpIL+vQ8xQJRRKANLcVEeT/fcUOTWpqGwZwEc6Jdsgvnb4Xwqmk
	eNMFQtpqfhiNrUP30I8WastiG5NC6yxZw7UI=
X-Received: by 2002:a17:90b:2ccb:b0:3ab:17b6:9a93 with SMTP id
 98e67ed59e1d1-3ab3afcdc6emr11412675a91.52.1791911325665; Tue, 13 Oct 2026
 10:08:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013125735.1542349-1-robert.marko@sartura.hr> <20261013-stylized-plethora-2a9e27545adb@spud>
In-Reply-To: <20261013-stylized-plethora-2a9e27545adb@spud>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 13 Oct 2026 19:08:34 +0200
X-Gm-Features: AclHuK9pPURsd7YCVT-est8rnkCB1X5dbN9hPBM8kNfyB8V38NvJe0-SENxgn8E
Message-ID: <CA+HBbNHZZePJh6s2xujmjA57GYZTgwhMqBnf0atM9aPQJP77Rw@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: hwmon: sparx5: add LAN969x fan controller
To: Conor Dooley <conor@kernel.org>
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Steen.Hegelund@microchip.com, 
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, 
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev, 
	lars.povlsen@microchip.com, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 6:30=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Tue, Oct 13, 2026 at 02:56:25PM +0200, Robert Marko wrote:
> > LAN969x integrates a PWM fan controller with a tachometer input in
> > addition to the Sparx5-compatible temperature sensor. Add a LAN969x
> > hardware-monitor compatible and describe the second register region.
> >
> > Describe the fan as a child node using a two-cell PWM specifier for the
> > period and standard polarity flags. The child also carries the optional
> > tachometer pulses-per-revolution and thermal cooling properties.
> >
> > Keep the existing microchip,lan9691-temp compatible for device tree ABI
> > compatibility.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  .../bindings/hwmon/microchip,sparx5-temp.yaml | 90 ++++++++++++++++++-
> >  1 file changed, 87 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/microchip,sparx5-t=
emp.yaml b/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.ya=
ml
> > index 611fcadb1e771..e91c2a3ccd3c9 100644
> > --- a/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yam=
l
> > +++ b/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yam=
l
> > @@ -4,13 +4,15 @@
> >  $id: http://devicetree.org/schemas/hwmon/microchip,sparx5-temp.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >
> > -title: Microchip Sparx5 Temperature Monitor
> > +title: Microchip Sparx5 Hardware Monitor
> >
> >  maintainers:
> >    - Lars Povlsen <lars.povlsen@microchip.com>
> >
> >  description: |
> > -  Microchip Sparx5 embedded temperature monitor
> > +  Microchip Sparx5 temperature monitor with a fan controller on LAN969=
x.
> > +  The fan child's pwms property references this node to specify the
> > +  PWM period and polarity.
> >
> >  properties:
> >    compatible:
> > @@ -18,11 +20,19 @@ properties:
> >        - const: microchip,sparx5-temp
> >        - items:
> >            - enum:
> > +              - microchip,lan9691-hwmon
> >                - microchip,lan9691-temp
> >            - const: microchip,sparx5-temp
> >
> >    reg:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  reg-names:
> > +    minItems: 1
> > +    items:
> > +      - const: temp
> > +      - const: fan
> >
> >    clocks:
> >      items:
> > @@ -31,11 +41,67 @@ properties:
> >    '#thermal-sensor-cells':
> >      const: 0
> >
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
> >  required:
> >    - compatible
> >    - reg
> >    - clocks
> >
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: microchip,lan9691-hwmon
> > +    then:
> > +      properties:
> > +        reg:
> > +          minItems: 2
> > +        reg-names:
> > +          minItems: 2
> > +      required:
> > +        - '#pwm-cells'
> > +        - reg-names
> > +    else:
> > +      properties:
> > +        '#pwm-cells': false
> > +        fan: false
> > +        reg:
> > +          maxItems: 1
> > +        reg-names:
> > +          maxItems: 1
> > +
> >  additionalProperties: false
> >
> >  examples:
> > @@ -46,3 +112,21 @@ examples:
> >          #thermal-sensor-cells =3D <0>;
> >          clocks =3D <&sys_clk>;
> >      };
> > +
> > +  - |
> > +    #include <dt-bindings/pwm/pwm.h>
> > +
> > +    hwmon: hwmon@e2020100 {
> > +        compatible =3D "microchip,lan9691-hwmon", "microchip,sparx5-te=
mp";
> > +        reg =3D <0xe2020100 0xc>, <0xe2010348 0xc>;
>
> Are these actually the same device? These are somewhat disparate
> register regions - and the second is at a very odd offset.

Not really, they can be separately configured and have their own register s=
pace.

I did not see a point in separate drivers, but we could model these as
separate DT
nodes with their individual bindings if that is more appropriate.

Regards,
Robert

>
> Thanks,
> Conor.
>
> > +        reg-names =3D "temp", "fan";
> > +        #pwm-cells =3D <2>;
> > +        #thermal-sensor-cells =3D <0>;
> > +        clocks =3D <&sys_clk>;
> > +
> > +        fan {
> > +            pwms =3D <&hwmon 40000 PWM_POLARITY_INVERTED>;
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
