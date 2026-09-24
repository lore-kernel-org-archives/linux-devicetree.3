Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3AC4CC620
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 20:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790281018; cv=pass; b=C1VMwO9DWE8Z1+ikde70z1edoKNk7MtXRQhaggC1DV9lFQjj5czdxXx5oUYj75McNIrKewc432Pzm97M1pP76o4pLdVmo1lxxK8d1A6251wn9z5UUdM0uLqfJ1OM2WVcz1fv/GIBByESLcOkdb97f/unCKPjcLfyXaEcWugoAi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790281018; c=relaxed/simple;
	bh=WS/57KdXBBwGfRZNL7QHE0ldeTLI0dMl0tLbZXWOYHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LQtEpNJFb0D1I9c8FSwYoSunDxHDJ/Ll8C/Wp9YDHI75bKH5K+rOZZgzujekeEgyAusot898LAr4CMa52MVk43laz0RPoAyCoH9c6AwjGkBb6pFzE1QZsr4i3kKKH4bxPbashAbqOubiSjR9gaQaYJZkacCHha+6lKHGSkYO6ZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FDptfiZo; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDptfiZo"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d91ede8035so1249525ad.3
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 13:16:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790281012; cv=none;
        d=google.com; s=arc-20260327;
        b=YX2f9kvfFUO+EysGVzV+KkFKWnq1n5Eb0+CYNaXHAAP8F43H00eX+HC5T+2aSHnSjc
         2zTDPqLrbco1mkMzkD9NioLm4CJgLr65ohv1mV7kKMTCUjE6b87fKfytKY6y0lh/rEbo
         Cay0a9EiAkOeFXxH9A6PXOgaCSilI+gIfZJYqJKgPhpPqVL8nbKNGYboaZlXVn3nvm6c
         pHW+Z4tIE6iNmtzzOxSsyDGiYJKsSblTbxuLWc9YCtyQ57dQXwM5ElcZvRVx2uFvnO+p
         8TPbA6k5KGNOQwhQ/1dHrkc7KjM39RxuNuTDrYca6naUnc8Sde3Ls/HbeNEh6+rSyUXW
         v6EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=By8lDe0zRbSRH2Tjyq4lUk7b9NEK0MxBWTfngSfdLV0=;
        fh=bJRk5T1X8qMhSx9dma6J4n/GBRtt3U+s/rfppxOmNOQ=;
        b=ecrhlfHKzpB2c37ak0EMe1I3ZJbJl280z+WEh1RQIWXQaR9iy/XwKLo+OV+JVIWeaj
         MRzupm8SxFV7p1LUYhLlnRXdBZ6FntmRtxbmGBW9x8igMgNvz5P8gKXxJmjhtqB9LKRO
         +8En3+u/+O/imhmmSZHThr4s63VHG7rXoipP8ckKcecZSjj6B4b+3ve+aCiyHbVtRdZE
         cTj05sz3BiShFp+gfT1Rk2CJsWH3E3fYNdbwK6k5a9Ts5HvPJGpLe84aPqbxiLvvkuMS
         J4KPWf8/lqaZ3OmzpzYOv2agJo9uvIr0Kj0rDFc+CeOdfVRUHr8ClSPx7SRsdzmYNuZl
         MRKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790281012; x=1790885812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=By8lDe0zRbSRH2Tjyq4lUk7b9NEK0MxBWTfngSfdLV0=;
        b=FDptfiZoUBFpKzdVITD1XRMVOIjxusJPJxSOhaSvbP7KCi/f3/QcB8hUPWlSjFoi41
         vnZw2SLdexrhgfsW2YwmWYkvkmUKD5NGjNsNDVaKk/R3KsouniekBMluP3ZJ3xqyNeN2
         GfFCZ9ISKZY7REOjKuqVm1mTRx8cSOnCoC5XC36PW7JQoOIZPOUZ3t6PBa+/Y9VZsXBe
         +4bF5CFsjq7J7UkDtBWfumIN8dSximBL79u3mQmSMM6+/cWfbZOAszU/eIu3fa+mdsy9
         vYiWlEN/WLEmyHOiA0eJC9cdLIpZweuI4T0GefxDd7A4RZE6bQK6EgyTPitj7AITBHgK
         hJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790281012; x=1790885812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=By8lDe0zRbSRH2Tjyq4lUk7b9NEK0MxBWTfngSfdLV0=;
        b=YOYtYuNd4ohm+vCGTb7AXrM7OFGqGrtyCfRQkktoH+u+0cK3Sbw0BKLdvOt6P4o/jk
         5yjQtHLd9M1m91rcyudW5XuOYW5BxPlrmuJlc6AhEB398dnM3izixxAmVauBQv3MFHvx
         Kpks4eNyFz7Rh3DKQ4EpR9qjKNjODPl4cBhJV/XuKT1fW4Dcs5MnW6/f1NXQFAXXleHr
         bMxbOPh1Ls+NlSuUPw/bXii7GFe0dT1NEApbcdDa4KoTUXjznvi1vXz/afJtO6VnCPQa
         6KEY/Yhtp5UbUPA5Ben4W/y8okDa3uYZY6PzSwkdYwBk8/jgN1UxxWqrEiJexEIPMVNI
         ALgg==
X-Forwarded-Encrypted: i=1; AKwUvBynNTOq9oZ3i+WvpzqauyrORx7w2vUOxDuIFpfVIlszyXFf/QYKVE6s4GX3HyaD2EYy2bgKhEG0w4tc@vger.kernel.org
X-Gm-Message-State: AFuF++kR95QN3TyWL0roGOk+npM0tWCrl4oNWpAg1aU9nS62Vgnuizy5
	kN9ffqzGgWKeylg/RJUtBVhibd1jAFs2C8MwZCu6B835xsqFzOaNqSgQEJ7T0KZ9MC4lftmvmuw
	O9NH6fko14ZaD1zZKaVUJkihBGOLyWok=
X-Gm-Gg: AYBFou0EadBWnC5Y9OmaTtDSqpK1v4ATdA5h8ijLyB8izoOEsCeqOJRAFh1KqBAdGKU
	X0gS4Lxd7LW7Wpn/dkCmOnWsRczkdxLE/e51QQ4naXPg319ub4HHpRyO0P59riTWufFQYL1ixPY
	fhxEeNQ789T1BE4/ByNif8vvXG6FNCnDteEl6h1OyG7nc1mAsV/eQy6Ojdg3OdS9q9I9nCXaK5B
	F0fUWz6HFe1fpvalXo1SawXlnVLd0/EfaDPlkoMqHehgRM865kzVHjq8X4az9R9IXYMGjVjPQu9
	FEK9yKpAZTmw39czFvzQctPD1fH0hHF2ivwmG20FNZd1vRJG57GpiEniXatUP5jb2n/Bat8=
X-Received: by 2002:a17:903:22cb:b0:2dd:c100:943d with SMTP id
 d9443c01a7336-2df7e6632cemr33132005ad.59.1790281012320; Thu, 24 Sep 2026
 13:16:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923201701.43391-1-pmazzini@gmail.com> <20260923201701.43391-3-pmazzini@gmail.com>
 <30c42b73-204d-4531-bd1a-1ee160a4b000@arm.com>
In-Reply-To: <30c42b73-204d-4531-bd1a-1ee160a4b000@arm.com>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Thu, 24 Sep 2026 21:16:17 +0100
X-Gm-Features: AclHuK9Ix7omORkFeC8AEjcG9VWZQpvYqS7tGdczHTc-lHozfzxFcTWbaDF7Pzg
Message-ID: <CAAxh=ju7+vQ=_opueqK-3Fe-qj9_OJiVunBWDmdmxk86dRqWxw@mail.gmail.com>
Subject: Re: [PATCH v1 03/11] dt-bindings: pinctrl: add Allwinner B288 pin controller
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre,

> Can't you just add the new compatible string to the existing
> allwinner,sun4i-a10-pinctrl.yaml binding?

Done for v2.

Thanks,
Pablo


On Thu, Sep 24, 2026 at 10:07=E2=80=AFAM Andre Przywara <andre.przywara@arm=
.com> wrote:
>
> Hi Pablo,
>
> On 9/23/26 22:16, Pablo Mazzini wrote:
> > One controller at 0x01c20800 with four external interrupt banks.
> >
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> >   .../pinctrl/allwinner,sun8i-b288-pinctrl.yaml | 108 +++++++++++++++++=
+
>
> Why is this a new file? Can't you just add the new compatible string to
> the existing allwinner,sun4i-a10-pinctrl.yaml binding?
>
> Cheers,
> Andre
>
> P.S. Since we have seen this a lot lately: please wait with a new
> version of your series for a few days, to allow other people to comment,
> and to allow discussions to settle down. Not everyone can respond quickly=
.
>
> >   1 file changed, 108 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/pinctrl/allwinne=
r,sun8i-b288-pinctrl.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-=
b288-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun=
8i-b288-pinctrl.yaml
> > new file mode 100644
> > index 000000000000..806da97ab708
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-b288-pi=
nctrl.yaml
> > @@ -0,0 +1,108 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/allwinner,sun8i-b288-pinctr=
l.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Allwinner B288 Pin Controller
> > +
> > +maintainers:
> > +  - Chen-Yu Tsai <wens@csie.org>
> > +  - Jernej Skrabec <jernej.skrabec@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: allwinner,sun8i-b288-pinctrl
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    description:
> > +      One interrupt per bank of external interrupt capable pins.
> > +    maxItems: 4
> > +
> > +  clocks:
> > +    items:
> > +      - description: Bus Clock
> > +      - description: High Frequency Oscillator
> > +      - description: Low Frequency Oscillator
> > +
> > +  clock-names:
> > +    items:
> > +      - const: apb
> > +      - const: hosc
> > +      - const: losc
> > +
> > +  gpio-controller: true
> > +  interrupt-controller: true
> > +  gpio-line-names: true
> > +
> > +  "#gpio-cells":
> > +    const: 3
> > +
> > +  "#interrupt-cells":
> > +    const: 3
> > +
> > +patternProperties:
> > +  "-pins$":
> > +    type: object
> > +    $ref: /schemas/pinctrl/pincfg-node.yaml#
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      pins: true
> > +      function: true
> > +      bias-pull-up: true
> > +      bias-pull-down: true
> > +      bias-disable: true
> > +      drive-strength:
> > +        enum: [10, 20, 30, 40]
> > +
> > +    required:
> > +      - pins
> > +      - function
> > +
> > +  "^vcc-p[bcdfg]-supply$":
> > +    description:
> > +      Power supplies for pin banks.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - gpio-controller
> > +  - "#gpio-cells"
> > +  - interrupt-controller
> > +  - "#interrupt-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/sun8i-b288-ccu.h>
> > +
> > +    pio: pinctrl@1c20800 {
> > +        compatible =3D "allwinner,sun8i-b288-pinctrl";
> > +        reg =3D <0x01c20800 0x400>;
> > +        interrupts =3D <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> > +        clocks =3D <&ccu CLK_BUS_PIO>, <&osc24M>, <&osc32k>;
> > +        clock-names =3D "apb", "hosc", "losc";
> > +        gpio-controller;
> > +        #gpio-cells =3D <3>;
> > +        interrupt-controller;
> > +        #interrupt-cells =3D <3>;
> > +
> > +        mmc0_pins: mmc0-pins {
> > +            pins =3D "PF0", "PF1", "PF2", "PF3", "PF4", "PF5";
> > +            function =3D "sdc0";
> > +            drive-strength =3D <30>;
> > +            bias-pull-up;
> > +        };
> > +    };
>
