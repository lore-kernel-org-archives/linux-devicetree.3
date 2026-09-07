Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284E3501F3D
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 17:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788802460; cv=pass; b=JZne37LehyahNCDmBdn0jZsTz0QLgg10aB7e5irQ4VMtlN3WEkS8HKscyCc0rnFShuS/+BVzeUSHSEKDNeWEqCISGNbUwxi286u6t/nx6g7kJA2cXvwD83+EQhhFouMdC2ETLfg7ipW3IYLR3l2+5yx9bs0ipW7Az3SljhB2R3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788802460; c=relaxed/simple;
	bh=RfdOJFUbv6QIfc0Gaody22+ocWOzVFGmayk4NT8FE1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JS8AteNK2mhxFjGG+NxzazFopQi1LvPYKXlRxf2pcZptIzxZ2fczZQnnJiq5JS5hCyMOgfjbMculopAOiJ4WglYwSRQPo1ZeYUtw/s4LdpRgjvLIo6MIsc5T/9diDWHeR6uGG+L7pc15d9SDXIqvOjr2KpC3E67sNtFeHg3rs4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oi18BIMX; arc=pass smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oi18BIMX"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7777fa8f1ccso1252013137.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 10:34:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788802457; cv=none;
        d=google.com; s=arc-20260327;
        b=lN946Ych8iz4rkw4y1YrIDnUgO7bQKdKi/pCWP7cmQ6xvNGcmPqZNhVhf89nMj0Al4
         DbzdzFLWtnhxmy0QLjCtyWBwlvq//0hXB61h2ajt+ssI2R5dJu62c54tgzTW5RILBm0J
         4Bn+ssxKEnTe+PdlNDZcJSPs0qjYoiAyBWdpFnSJP5/1bn5A8dYxgC8OOHH9woc3XgQ8
         CVRdCMmzh17yoeErIw9hMR7Sub4jYooACrfnhF+nlIxo+SJBcC0cJLv8VJTV8oCgtGep
         M30w3w19ueV/wamNDIPf+Tn4E4ZK3mUk6z85QDglgDqFbl6B0Y/pnHmojlTT8Z8SSpsL
         J2ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qkdLOeOgWV+QWNP3pr4tud0U2Sh5AssrgI2J+v8cZIQ=;
        fh=IKqudmm0j09SOih9oKx7sM220OBfD4oj07Exl7hsg/U=;
        b=eim16m3niernXq+FYh3V7hoRQrbOnH6NKs4dv1mPUkU+K3XOPmogv18cLzw28gh0Qh
         f56FKglrQg+Bon3xIcUPuMVmzsHri+Jk1I2Nthr0PPJu6h1e9Sk8D6cXs+BomCS0o1qj
         5zUfe6cuU8t752ngURnqRkyL5LhoHGBJraPLlOa41vk7W1P6Bd6pQwaG2YFmOE9xLVVB
         jb97VswIWgEfS12SIguy9WW22o2Ytn8+8wP3ZnqaofTLWKjy9YY+1WSDCK5sMHjBCKhY
         DPmP4OIkWMUBt8JV8pyfFr0qwCfTTRx1V7e7YmFYW4p9thfnnnIBtt7Ps3tj0e5Ocg41
         ceUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788802457; x=1789407257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qkdLOeOgWV+QWNP3pr4tud0U2Sh5AssrgI2J+v8cZIQ=;
        b=oi18BIMXHLpAy5OnGn7ntp3mXpj3DsFtveS+rbcgTG9PHMgcU9Jq1r93sNV8ZQfvu/
         KSX65lI/mXAn+p6V84xBPmtByUXJGWykq7mMbobqGztJw16Da5Q88tdY4Ow2ZuBsGI/f
         7A5HH/acBhZL7C+wVeSS7r7HRI37tdSGK1i5l2L9/8oSEznvV6Tvlj/BTAJFvpLReUSK
         yIj/1OTYbocP6euPm7vpSEj71WRGhlLC1c9HzjbooWEzmQv8RbTKHV9bHvYz4tsRCAzG
         QJ6ljJmlu3bdxSPMerTgumXd9MWj22PAHCLArA5aR2tL5eCi0NcV92ChDT36Vqis3ZKV
         bq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788802457; x=1789407257;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qkdLOeOgWV+QWNP3pr4tud0U2Sh5AssrgI2J+v8cZIQ=;
        b=VzLsq9kvd4h4Qu8Ul5+MgRHfdc8AxhmqcZac2r68pzycwjQhTU05lqnEmFL6DYNTmb
         jUp9Ge6GAF+yyJ3F+vam/kNEwuAmZr8yTNfPaKEMgsiUgCLJHiVbNKS2kj3cSKoFkrHD
         XMo9Dc6nqvmYyCJPJopb6ST3H8GDJmm+xNOJDGyq2eBgKtW43dYlFQplbzfK9O3FH1i3
         Cy6QzlvBcrGS9EIUUAi8tvwf2U3i8grY6pucV08nyxAm3agGnq8vZrqzIyZZklBrfwWl
         bFuNZVRMYwfS5KgyYAVPVhklXN+FFepMWuwfiraAz777hSJEJlfod9819kn0VR54pXoU
         ab3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxGa60bsrk+DAFiDip2wIUUboCHSm4M55unFi/XtC+hHiNi7+mw4xLlpf26Cs03fwgjGYZf5MzA6qvj@vger.kernel.org
X-Gm-Message-State: AFuF++kkKLW9/yZ3DK/bMMeSAeU5babnHH6wD/P88sTfjCSRatMumYRF
	Yp1OklCcvvhOLcg63xJX4hX08nbjumCQqfteias04iSe9WDtIDsq2KJGGmi6N8CqSyLCykM+9dU
	vS9xJZUKDrkkEQrYTHfcc0DqFHpqch3M=
X-Gm-Gg: AYBFou0oWycNm1mzGgMQbLuovVm7O92UIPu9Pje4tzSEAOjaDnGT+RPNFCWYkETp2bo
	qltYsl2eBnEqUuLtLdzxhKuM736GQUITBTrdY9bKv/0qt+p6WpCuwo50G8qqKDRhlKjQS9NDMAy
	hp/LWcztM122EGH66jINqmOU9FTVF5a4golV7PqCHXhh9iAkh+lxYkT8wKz+xiFn41DqGu7O0KJ
	QRQoMUPej+fyt4NFPTwVdQieAoq/pRFscXZzZGRDbS0L9wU4GCoq/Q4jnCg8Tq/vQCos2CZXwaZ
	kzzGCfkGQePkIAFwa3eyr9E1hxAZJVrcSPAToYLdmDAcXDZGJKVL7HELXJH7MnHNtdKGM7QEKsr
	mdJTtEda1FJtIDhVS+UeqIt/a9hZ4I0SOCLF927x1S36L68es4IvpEbypqe1+Qg7wzcGyMknRzH
	oF+GLAACHMnk9s4+dZz7VM7hWTHVRv1TdmHY6IXw==
X-Received: by 2002:a05:6102:3054:b0:726:cd42:d023 with SMTP id
 ada2fe7eead31-78a4aa3506cmr7466665137.11.1788802456761; Mon, 07 Sep 2026
 10:34:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906-submit-ac200-mfd-v10-0-f522e8dc2bd4@gmail.com>
 <20260906-submit-ac200-mfd-v10-1-f522e8dc2bd4@gmail.com> <20260907-huddling-sprain-33272820a361@spud>
In-Reply-To: <20260907-huddling-sprain-33272820a361@spud>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 7 Sep 2026 11:34:05 -0600
X-Gm-Features: AcwNN1X055ixhcWPMF4_PThsBxRax3DSfprNzFERgyOkNqSxCCBQm48yqR7Nl-M
Message-ID: <CADvTj4qMvPWsXOYMOBS23RHAx0_pDoHDWd89cRyaL_T5GAyKWA@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: mfd: x-powers: Add AC200
To: Conor Dooley <conor@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Lee Jones <lee@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	"Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, Andre Przywara <andre.przywara@arm.com>, 
	Chen-Yu Tsai <wens@kernel.org>, linux-sunxi@lists.linux.dev, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 11:19=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Sun, Sep 06, 2026 at 04:30:46PM -0600, James Hilliard wrote:
> > The AC200 is an I2C-controlled mixed-signal companion IC containing
> > audio, video, RTC and Fast Ethernet PHY functions.
> >
> > Describe the parent device and its shared input clock together with the
> > audio codec and TV encoder child nodes. Keep their analog supplies on t=
he
> > function consumers and describe the TV encoder display graph and option=
al
> > bandgap calibration cell.
> >
> > Add the shared interrupt-controller properties and interrupt numbers us=
ed
> > by the TV encoder. The Ethernet PHY is represented by a PHY package on =
its
> > MDIO bus, with a phandle back to this device for access to the package
> > control registers, so it does not require an MFD child node.
> >
> > Keep the INTB connection and TV encoder interrupt optional, including w=
hen
> > the TV encoder is enabled. Cable detection status is readable over I2C
> > without an interrupt. If a TV encoder interrupt is described, require t=
he
> > parent interrupt domain and its upstream connection. Include examples
> > with and without INTB connected.
> >
> > The input clock must run at 24 or 27 MHz when the Ethernet PHY is used,
> > matching the rates encoded by its documented clock selector.
>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> This should have been dropped when you merged the patches.

Oh, forgot to do that.

> Not sure why you sent v10 without waiting for a reply from me on the v9.

I had figured I had enough pending fixes(i.e. sashiko reported issues and
combining the patches) that it made sense to spin an updated series.

>
> Thanks,
> Conor.
>
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 231 +++++++++++++=
++++++++
> >  MAINTAINERS                                        |   8 +
> >  include/dt-bindings/mfd/x-powers,ac200.h           |  13 ++
> >  3 files changed, 252 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml =
b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> > new file mode 100644
> > index 000000000000..0f2e6922fc4f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> > @@ -0,0 +1,231 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/x-powers,ac200.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: X-Powers AC200 mixed-signal IC
> > +
> > +maintainers:
> > +  - James Hilliard <james.hilliard1@gmail.com>
> > +  - Jernej Skrabec <jernej.skrabec@gmail.com>
> > +
> > +description:
> > +  The AC200 is a mixed-signal companion IC containing audio, video, RT=
C and
> > +  Fast Ethernet PHY functions. Its control registers are accessed over=
 I2C.
> > +
> > +properties:
> > +  compatible:
> > +    const: x-powers,ac200
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +    description:
> > +      AC200 input clock. When using the Ethernet PHY, its configured r=
ate must
> > +      be 24 or 27 MHz, matching the rates encoded by the documented EP=
HY clock
> > +      selector.
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +    description:
> > +      The shared open-drain INTB output for the TV encoder, Ethernet P=
HY and
> > +      RTC interrupts. Omit when INTB is not connected.
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
> > +        description:
> > +          Cable detection interrupt routed through the AC200 interrupt
> > +          controller. Omit when INTB is not connected. Cable detection=
 status
> > +          can also be read over I2C without an interrupt.
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
> > +      - tv-vcc-supply
> > +      - ports
> > +
> > +    dependencies:
> > +      nvmem-cells: [ nvmem-cell-names ]
> > +      nvmem-cell-names: [ nvmem-cells ]
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        tv-encoder:
> > +          anyOf:
> > +            - required: [ interrupts ]
> > +            - required: [ interrupts-extended ]
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
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/mfd/x-powers,ac200.h>
> > +
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        mixed-signal@10 {
> > +            compatible =3D "x-powers,ac200";
> > +            reg =3D <0x10>;
> > +            clocks =3D <&pwm 5>;
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
> > +        };
> > +    };
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        mixed-signal@10 {
> > +            compatible =3D "x-powers,ac200";
> > +            reg =3D <0x10>;
> > +            clocks =3D <&pwm 5>;
> > +            /* INTB is not connected. */
> > +
> > +            tv-encoder {
> > +                compatible =3D "x-powers,ac200-tve";
> > +                tv-vcc-supply =3D <&reg_aldo2>;
> > +
> > +                ports {
> > +                    #address-cells =3D <1>;
> > +                    #size-cells =3D <0>;
> > +
> > +                    port@0 {
> > +                        reg =3D <0>;
> > +
> > +                        endpoint {
> > +                            remote-endpoint =3D <&tcon_out_tve>;
> > +                        };
> > +                    };
> > +
> > +                    port@1 {
> > +                        reg =3D <1>;
> > +
> > +                        endpoint {
> > +                            remote-endpoint =3D <&composite_in>;
> > +                        };
> > +                    };
> > +                };
> > +            };
> > +        };
> > +    };
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 3a19da74d00c..1b1dd57cc419 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -29504,6 +29504,14 @@ F:   drivers/net/wwan/
> >  F:   include/linux/wwan.h
> >  F:   include/uapi/linux/wwan.h
> >
> > +X-POWERS AC200 DRIVERS
> > +M:   Jernej Skrabec <jernej.skrabec@gmail.com>
> > +M:   James Hilliard <james.hilliard1@gmail.com>
> > +L:   linux-sunxi@lists.linux.dev
> > +S:   Maintained
> > +F:   Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> > +F:   include/dt-bindings/mfd/x-powers,ac200.h
> > +
> >  X-POWERS AXP288 PMIC DRIVERS
> >  M:   Hans de Goede <hansg@kernel.org>
> >  S:   Maintained
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
