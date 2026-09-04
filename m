Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954984E8E16
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 17:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788541582; cv=pass; b=OuOvwipIuipJU3rLFewOPAPz5/QnR6AbFTw940LemNIHCVKGb8+bGnO/RtLupR7cVAptzeMoVr1GBZooonWvjIkTfadCRBfm4zBGNFCPukgLChlWhJ0VV5R9aeAfetjsTt/Hhcyh3wJDVMVhYptxvRPGtELvL2l6vCrGpuCfQK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788541582; c=relaxed/simple;
	bh=it7al99Mn0Hztn1jkp4WlVXb+TrDxTMcFjo8QDlqTgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cks1NQLvgpeBB4r8uH9d9uy3bt47tzwHbIG4r0CvRH4Xw2McbNYG5lUajEgTszxfV4Df1dpjHrE0QW2lCmReg2Vdw5gGAcV3SdePDl7Dfcj1asS1/7RERaqWNkvmnK9xQhAhkah3a4L1/cmlIXrQ/ioMx5Rs/BxwJPyFRDYsgMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T1iy0Tmw; arc=pass smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1iy0Tmw"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7866d924eaaso963382137.2
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 10:06:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788541579; cv=none;
        d=google.com; s=arc-20260327;
        b=GXvYalrhv3qyFzRrRCLRnMwqAFyysEEbpWeO+OQs1FUzNUcnOAe+17FgIWPNtOv2Dr
         Ql8ZlPAoKIXM5TeEDaxMYQjbuYGtYO/8flnfZtyv+u144rCDCmnHCqEBJbGXJ2bBQ0S1
         Ty+TIy/WT0d5dRNpcxXR8rDXuyIpCKoxtG1EsIMmJutWU/guZQEQqlpnyFN1CsoCNJwa
         tYqyPpOJOcomQ1QSjE/rXPnFGL46Or7YOgJu86ptwTojfpkdV/WFz5wV2Bgm22Em/20q
         hkRKeP5ReDjydcMhcTlgs8nxg6lvBwu+b0N/HTLPUo2VwDvg0s9F/ZAHZZY0eWRFucet
         qLHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MFC2guGLZc9ltzCdl0pnPxvf2FTE+4Td6tDRAjgS4Nw=;
        fh=JJHsAW2mpZWwU6QB6maak/M5IZ41taKDvtZK0Xv+fwI=;
        b=DHm8lKAyUpC+vt52/5orgQBVFlTQPaDhF464VHSkoKFTUcLqnvxCkcM0zW7zu3i7qe
         R6Rjc21ww3/V2LjeSVnVM9Y9wkZj3ncglSxEvhPUn3WjZREYNg0s4MxTxhHl3zS6LuEs
         6fh77OHNw1ink1WP7v6rnp0ot9909iGnBnHU98E0Swvcrgkz6ZyQBaT3PqNaJMTT35VQ
         PbHh8t5NJYJKPNcgKXAcujWaAIMWnjJJKvohhgNJESYPpty3SL5XXzvM4+MW7LNb0QzR
         5SGEiNI32HtPgOuSPzSV37z2+a44/LbQ5I0nyaLCjS5VkC+XdCfj34qMxFHq/7wZyOaQ
         IT8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788541579; x=1789146379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MFC2guGLZc9ltzCdl0pnPxvf2FTE+4Td6tDRAjgS4Nw=;
        b=T1iy0TmwvxT6MDw9zDdQroHyco7wq4E/D1PiDqhNf54KfWZKw8PJpqHWzJx5od4ovh
         JMagpYD1z9Lpvze4S2pVfCHgv+xd9zxrIjkDw11VoC439rdzuMhg/2A4REvsKp4/mhWG
         v+lMN5Ipr9ZMmsKfukwFd0ERFyOJK0vjWh5x/vEVWnVCuEYFjUjpoyzkURUopiDj1vrK
         rn7Zvtzvf1JOG8LPNjud6Yy65WFdt+J5ZlZ0h8CXEzp7jT3dB5bP3YSgLkhv7dKBJI6G
         G8z4V2EA3jXmfdW0/2qyFgXXqOj2R7S3EsaE70hXqsakVf8Z9YMyvkKgfT750k6W60Ed
         YN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788541579; x=1789146379;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MFC2guGLZc9ltzCdl0pnPxvf2FTE+4Td6tDRAjgS4Nw=;
        b=rTRDSQ2sr5WLSTGb2WdL/2lQL54z1YLxOnukA5U9XDDTq3U3JSzX+ldtQdpXFvRuDk
         ozFSARO2AXQlnnLYI1lfLXX2V3dphG7ODXovFR/vaTVyiwzLtSejNi+n0uyhjr9ZPzMV
         egY6j6cD2TKFvEqQMLwgeCAOUIOFZTZKcv59rOWEMIrOR6lXwevZh8xG8ViMeF5DQKYu
         Yt8KN2j26AaDb+oW8UGnbTZChRVseWNnKPpyi3/IvFWV9k1pXRR7F7BPVSyjOb0zhrUd
         ZzOBV804toWI9CvAGQNh/l7wVH1o7tiRpkEcXT83m769fMa0b/KIYzCHWiTobQx791uw
         rnAw==
X-Forwarded-Encrypted: i=1; AKwUvBwcdA0Krr1mhQM+J2NttKyKRLSKQFilIRJw6jYrwP/Ttxnfkx34EGfQn1GdOPSRt19dRv2Wd56XyL6C@vger.kernel.org
X-Gm-Message-State: AFuF++kRmA8LIN7XUH+aIMWi3DPHF8XbKwsYcxJuXgXKQyxKV5XaBkke
	mPCisNrzRGpuGNRpqUFKXloHsXjLACg+2V3eVqfeggkbtkdmUFBoDfkAvHjbgzP7JDsnrKSwsL0
	iisLqFYNcU9bwL0EcYBXQ7CdxUe31rLM=
X-Gm-Gg: AYBFou2/diqnFraninrzB9PfOUEC5lTJEh9nWbj5JifJymbgMRTozamuFAo7RFtdE00
	C++Y3BDwt1sj9xTpYO3WULn6o8OUU2BciDY8ZqpO40rJHObE0RA7N9YGIrdtRU85qflMfRoSi94
	1rT9OGslhMEQuRYhpidtjw5rwdLBzYCtBu3/T1w0Rm95EWBN9Ct6jJ7ZRfgRWmOeRHPTE8bWWHx
	RarM1b042bYGOir298xXxf59rX2PUa3J7lNDxsTEEMMBJoLP2nSkAAhiWvwRLrmx271cNIYJVNN
	eS23s/1NDIdCmZt95YaDBQ6I3HKT07CzdOE+OmaH3g9Fu4pOMrWVbLzadN0+cZk2ANmb9gxB8gD
	ciup0HZO+P6V6uRl7nE/7TbH3asRDP1HavVRrDttuNFjplOrrFVir9DerxwGoI85/HjlHEPfX+4
	DOTK3h0lWG7MGYhyAZavp2aLeHT9B04A4urnhTTw==
X-Received: by 2002:a05:6102:8023:b0:789:5fc6:3693 with SMTP id
 ada2fe7eead31-78a4a6f8278mr2620716137.6.1788541579377; Fri, 04 Sep 2026
 10:06:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-submit-ac200-mfd-v9-0-6b7ed278989c@gmail.com>
 <20260903-submit-ac200-mfd-v9-3-6b7ed278989c@gmail.com> <20260904-overpass-clumsy-8ccdd5d4ca0e@spud>
In-Reply-To: <20260904-overpass-clumsy-8ccdd5d4ca0e@spud>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 4 Sep 2026 13:06:08 -0400
X-Gm-Features: AcwNN1X6bl9ODedCCrg0dVF5P7jGVB6L6R8M2S6nkA_KWsBfrKX-Ph0fkWo7Kdk
Message-ID: <CADvTj4qKxyPZMLBZgpNMMxkFn09MUCNEc9nLva-j=24C_Zg-nw@mail.gmail.com>
Subject: Re: [PATCH v9 3/4] dt-bindings: mfd: x-powers: Describe AC200 functions
To: Conor Dooley <conor@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	"Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, Andre Przywara <andre.przywara@arm.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, 
	mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 9:50=E2=80=AFAM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Thu, Sep 03, 2026 at 02:09:42PM -0600, James Hilliard wrote:
> > From: Jernej Skrabec <jernej.skrabec@gmail.com>
> >
> > Describe the AC200 audio codec and TV encoder as child nodes of the
> > shared I2C register provider. Keep their analog supplies on the functio=
n
> > consumers and describe the TV encoder display graph and optional bandga=
p
> > calibration cell.
> >
> > Add the shared interrupt-controller properties and interrupt numbers ne=
eded
> > by the TV encoder. The Ethernet PHY remains represented on its primary =
MDIO
> > bus and is therefore not an MFD child.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 136 +++++++++++++=
++++++++
> >  MAINTAINERS                                        |   1 +
> >  include/dt-bindings/mfd/x-powers,ac200.h           |  13 ++
> >  3 files changed, 150 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml =
b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> > index ca7a910b2c73..935dc07138cb 100644
> > --- a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> > @@ -28,15 +28,114 @@ properties:
> >        be 24 or 27 MHz, matching the rates encoded by the documented EP=
HY clock
> >        selector.
> >
> > +  interrupts:
> > +    maxItems: 1
> > +    description:
> > +      The shared open-drain INTB output for the TV encoder, Ethernet P=
HY and
> > +      RTC interrupts.
> > +
> > +  interrupt-controller: true
> > +
> > +  '#interrupt-cells':
> > +    const: 1
> > +    description:
> > +      The interrupt number, as defined in
> > +      include/dt-bindings/mfd/x-powers,ac200.h.
> > +
> > +  codec:
> > +    type: object
> > +    $ref: /schemas/sound/dai-common.yaml#
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      compatible:
> > +        const: x-powers,ac200-codec
> > +
> > +      '#sound-dai-cells':
> > +        const: 0
> > +
> > +      ac-ldoin-supply:
> > +        description: The 3.3 V supply for the audio codec LDO input.
> > +
> > +    required:
> > +      - compatible
> > +      - '#sound-dai-cells'
> > +      - ac-ldoin-supply
> > +
> > +  tv-encoder:
> > +    type: object
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      compatible:
> > +        const: x-powers,ac200-tve
> > +
> > +      interrupts:
> > +        maxItems: 1
> > +        description: Cable detection interrupt.
>
> Given the example, this looks like a hack.
> Is this mfd actually an interrupt controller, or is that just part of
> this hack too?

The AC200 has separate TV encoder, Ethernet PHY and RTC status and
enable bits which are multiplexed onto its shared INTB output, so the
intent was to represent that demultiplexer as an interrupt controller.

I notice that the example's tv-encoder interrupts property inherits
interrupt-parent =3D <&pio> rather than explicitly referencing the AC200
interrupt domain. Is that incorrect interrupt relationship what looks
like a hack here, or do you also object to representing the AC200
interrupt demultiplexer as an interrupt controller?

> Quite frankly, I am not really sure why either the tv-encoder or codec
> have dedicated child nodes, they don't appear to have conflicting
> properties.

Do you mean that the DT properties for both functions should be folded
into the AC200 parent node, while the MFD driver still creates separate
codec and TV encoder platform devices?

Lee requested at least two MFD children in this series, so I want to
distinguish the Linux MFD cells from whether those cells need dedicated
firmware child nodes.

> Additionally, why is this not part of patch 1? Add the binding in a
> complete state from the get-go. On that basis, at least,
> pw-bot: changes-requested

Do you want patches 1 and 3 combined into one complete binding patch,
while retaining separate implementation commits for the base provider
and the MFD cells?

> Cheers,
> Conor.
>
> > +
> > +      tv-vcc-supply:
> > +        description: The 3.3 V supply for the composite-video DAC.
> > +
> > +      nvmem-cells:
> > +        maxItems: 1
> > +
> > +      nvmem-cell-names:
> > +        items:
> > +          - const: bandgap
> > +
> > +      ports:
> > +        $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +        properties:
> > +          port@0:
> > +            $ref: /schemas/graph.yaml#/properties/port
> > +            description: Input from the display pipeline, carrying CCI=
R656.
> > +
> > +          port@1:
> > +            $ref: /schemas/graph.yaml#/properties/port
> > +            description: Output to the composite-video connector.
> > +
> > +        required:
> > +          - port@0
> > +          - port@1
> > +
> > +    required:
> > +      - compatible
> > +      - interrupts
> > +      - tv-vcc-supply
> > +      - ports
> > +
> > +    dependencies:
> > +      nvmem-cells: [ nvmem-cell-names ]
> > +      nvmem-cell-names: [ nvmem-cells ]
> > +
> >  required:
> >    - compatible
> >    - reg
> >    - clocks
> >
> > +allOf:
> > +  - if:
> > +      required:
> > +        - tv-encoder
> > +    then:
> > +      required:
> > +        - interrupts
> > +        - interrupt-controller
> > +        - '#interrupt-cells'
> > +
> > +dependencies:
> > +  interrupt-controller: [ '#interrupt-cells', interrupts ]
> > +  '#interrupt-cells': [ interrupt-controller ]
> > +
> >  additionalProperties: false
> >
> >  examples:
> >    - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/mfd/x-powers,ac200.h>
> > +
> >      i2c {
> >          #address-cells =3D <1>;
> >          #size-cells =3D <0>;
> > @@ -45,6 +144,43 @@ examples:
> >              compatible =3D "x-powers,ac200";
> >              reg =3D <0x10>;
> >              clocks =3D <&pwm 5>;
> > +            interrupt-parent =3D <&pio>;
> > +            interrupts =3D <1 20 IRQ_TYPE_LEVEL_LOW>;
> > +            interrupt-controller;
> > +            #interrupt-cells =3D <1>;
> > +
> > +            codec {
> > +                compatible =3D "x-powers,ac200-codec";
> > +                #sound-dai-cells =3D <0>;
> > +                ac-ldoin-supply =3D <&reg_aldo2>;
> > +            };
> > +
> > +            tv-encoder {
> > +                compatible =3D "x-powers,ac200-tve";
> > +                interrupts =3D <AC200_IRQ_TVE>;
> > +                tv-vcc-supply =3D <&reg_aldo2>;
> > +
> > +                ports {
> > +                    #address-cells =3D <1>;
> > +                    #size-cells =3D <0>;
> > +
> > +                    port@0 {
> > +                        reg =3D <0>;
> > +
> > +                        tve_in: endpoint {
> > +                            remote-endpoint =3D <&tcon_out_tve>;
> > +                        };
> > +                    };
> > +
> > +                    port@1 {
> > +                        reg =3D <1>;
> > +
> > +                        tve_out: endpoint {
> > +                            remote-endpoint =3D <&composite_in>;
> > +                        };
> > +                    };
> > +                };
> > +            };
> >          };
> >      };
> >  ...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 1d03b0060bda..8a48f6a1e593 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -29511,6 +29511,7 @@ L:    linux-sunxi@lists.linux.dev
> >  S:   Maintained
> >  F:   Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> >  F:   drivers/mfd/ac200.c
> > +F:   include/dt-bindings/mfd/x-powers,ac200.h
> >
> >  X-POWERS AXP288 PMIC DRIVERS
> >  M:   Hans de Goede <hansg@kernel.org>
> > diff --git a/include/dt-bindings/mfd/x-powers,ac200.h b/include/dt-bind=
ings/mfd/x-powers,ac200.h
> > new file mode 100644
> > index 000000000000..cc59e2ab4912
> > --- /dev/null
> > +++ b/include/dt-bindings/mfd/x-powers,ac200.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/*
> > + * Interrupt numbers of the X-Powers AC200 interrupt controller.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_MFD_X_POWERS_AC200_H
> > +#define _DT_BINDINGS_MFD_X_POWERS_AC200_H
> > +
> > +#define AC200_IRQ_TVE                        0
> > +#define AC200_IRQ_EPHY                       1
> > +#define AC200_IRQ_RTC                        2
> > +
> > +#endif /* _DT_BINDINGS_MFD_X_POWERS_AC200_H */
> >
> > --
> > 2.53.0
> >
