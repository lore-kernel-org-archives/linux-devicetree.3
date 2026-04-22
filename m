Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1EC13A244
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 00:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776818809; cv=pass; b=UeXqjookUQGbhT1ykl/TMiymleLsGGuM8YXr4pR2oLXi3BS/r/uIwdCuWnDBxqqjUbR+Dv1I/HTM7HLXMdK4SQhX0/rSlzlWgO2A/Iv7e0QwqfaYMaV5pP+Ayd//78NubDCjI8Bj59PK9/3nRB970DO0xJLczZMaa42G/HsXBug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776818809; c=relaxed/simple;
	bh=sNq95F03njBKjp3TAiMqjY5GRbUECNZPUlT7T5uzkJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=djLSW9q3BSCNT2xmgFUVb7W9u7+00paNAm8PBkt5dffWQCa5nnAAtZ8uQmczt0YDnfeEbdzw3nBR8temJPJapZ7fpaEjSGihPD26nSjRMXRuBGEkck0zICNtvuduuih5lCtTCXpniEz5Ky/sa6/0kzkCPLmF+9yhk2o5iSwTTIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CClgh+lb; arc=pass smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CClgh+lb"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-67c22b05346so2522183eaf.2
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 17:46:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776818807; cv=none;
        d=google.com; s=arc-20240605;
        b=jCKk9pmUwDek1ubRjL7ZR8xC55e+AqhsO5hmlY6RRDVu1CRQwgpUIXBJC3zdfehLRl
         tQjlaiC0G6yH4t2SRX4fnCBHAig7BacQ9/OCyyDJVP5UNEq7ZisYZ5gU1Bqy1EQKi7Ot
         szFI51PLqg3r0SaiiQjmyrL9/iBrN9DFKMa1b/8lrezQnUo9Fo3mfcTY+85hqnEYSJRI
         ws0K+5GqkshR5ht8Ysb8wVaEm5xr1sChO8SZ+q687/twCi07sy95xMB4dGlEs8YPsMtq
         iiAx2XqBaCKu8gtt/KaNwwX2iHnaJMs/1eAy9wdpqf73e9TeU8ypZIygL17kYpGeJWAb
         Vq/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mSe58fOFaOjHqfOKP37Pb/hThMA88xjGpfgXKdNEDJs=;
        fh=XT3eTNSzZhUgHhhcfPuMw/UyU+YjVlG2ONWiEXibSqg=;
        b=AhlDu+1Qe7NoAqwXry4nmMOD6ePfoXLjQNCtCVfxmiPKChVgfrg9PptXPedbfXZhA1
         mxblTJpiKgNKlQElBHFKvQlr8y9KJBKHZDCC50gGkng+zK1moKQEw58544xqoBqWn1oR
         LwCzUVvEL1XeCYnXchu11u7mFxWDgYc7ytWp37WoKfetnrOv7L9PdE87x9+PyXQ83CcG
         3/C0/AVTz3wYXb1W4vzKYnujRWNSPvwIWScEnZF8sTzRGFtu62TdjmXjD2MeidkZbX/6
         GPs6sJ/sfOmqwbn+XtHgnGHvHRGWVDtPy2OTt307KW++865Le05FMOhCdaqPAY/5hBeK
         tiJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776818807; x=1777423607; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSe58fOFaOjHqfOKP37Pb/hThMA88xjGpfgXKdNEDJs=;
        b=CClgh+lbh4D5vQnRQbsXFOXcqC+MCZ2WOkq/70qKLm/5+ae8rRflcdc9JHup98cHAr
         mE3sgVoMhACNt1R5t8TMn+g4cEqJ6GM0KKcOg9GcBtsJ3NsYysn9FIKNdeO/ynvaN3Gc
         LrDRX/2BXxKOAtTxgx/8hht7dhm3He0FvP2utF24J4cB4aw4eLO2ywFmvncqi5zIo/JX
         j7AT+N3vqsIjnyHKONxnMSjR+DvJD5h3IYvFSaeSTFkkE95HMXdqsV9bqHvxIezSIfgH
         rRIhn37LKueJ/TtT6OxDRfiN/pLNk4PTGNUAnM1Gzm8SbuyMucdMFqC3yvjcFEk7/RiD
         l7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776818807; x=1777423607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mSe58fOFaOjHqfOKP37Pb/hThMA88xjGpfgXKdNEDJs=;
        b=UUiPyzPgT/mSuq/IgYIkUZtvPybKELs1/oHSWdpgpipSBeBx6K2eTTfEJLYCCnH/me
         bdoQBNJjTsHVh4gHtcFj884rL5DRjzDUbqth5bHfEk0z1xBG6/WymAd/k0rUZUVUTCqB
         53zOi/Sx0lXM8SFWFaaAuuPMoZ5t3dO8NComZ7ZW4IaD2ijrs7pEUYV/7KGaGPaOonBt
         clauRQN1xtabl5gc43iHhs6zymss8UCQXKDvZZ3ozc/5IuESE8BGtdjRNwiSiXyatoOZ
         YpC85KT8N5KzkP8JQzpDEf0zyiYFkZe92UwdpUB+vinZXJRlceBI95xR1SRDrwIIVDA+
         a/pw==
X-Forwarded-Encrypted: i=1; AFNElJ/C5HVmqZnTBo72ClVUqbbLixshzU0Xr53HiJOsiVMn51T7T3krJA3ujdJwBlKqbCCxPaflMaOovsIx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7ZYlWKldXGj6tpbNBw+5RhThLIV5twoPOtSGRoGyIdLoWvMpE
	WkME7kcHBVreJQGw9PNdSs7578R/hMW3d87/J8Isx5nb2SxYMotumrcdKHrjZK41oi9VTSTAc2J
	Bg9VtgKtPs+MgWahcjzXBs5dfiWE5aHQ=
X-Gm-Gg: AeBDieuQGeEJr7YfuNeWGpX6GDXNEVJXkfTg51hEL8HoVMLJaAroL0A5Lx4Htu0drQr
	QQZmpJruvvmnUdNH6ktXQW27xo4M7P3iZrhyngHfNhDvxPJPxlJZcdwvDFhpllV1gRfEmUZ3iOf
	998JscO8BCxlW7yntyyw330wFrMENuFZrdUJ3VBWNMRScUIYvXkxMgYfTFP8ekwK4JL0ovflGVP
	uDiepuBycEQxG1f2A2Nje0QckTw+UEoL++7AlLKAjMu3SGFETJh+rJs22tJgKpy/pYacacX36GY
	6ALGcBFYJiENkhNaXg==
X-Received: by 2002:a05:6820:1f03:b0:68b:bc93:1de with SMTP id
 006d021491bc7-69462ef7d6emr11074951eaf.35.1776818806817; Tue, 21 Apr 2026
 17:46:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420023354.1192642-1-syyang@lontium.com> <20260420023354.1192642-2-syyang@lontium.com>
 <CAO9ioeWhWemzyF30t8KDJht6_59b1Y5+GrH9nYCeKuPwddVLHQ@mail.gmail.com>
 <CAFQXuNbyH88Ab_LgfZknRxhK9QzN8Xe-G9NuRMuECZF_SrRpfA@mail.gmail.com> <p3aruen3h3ddmzlqbdseksuqwuwvxa32qbi66yf4gjwdtb5h2a@xs3dleimg2an>
In-Reply-To: <p3aruen3h3ddmzlqbdseksuqwuwvxa32qbi66yf4gjwdtb5h2a@xs3dleimg2an>
From: =?UTF-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
Date: Wed, 22 Apr 2026 08:46:33 +0800
X-Gm-Features: AQROBzDc9IJyF3Xn3lpEIA-y1LhWtZTKb7TWhaYpenzuvNRvda7Iutpwgc3w54M
Message-ID: <CAFQXuNaHLzvSKkNo+ZNxRiYMtP98php=Qa0i3r1XMDA2b16gjQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings:bridge Add LT7911EXC binding
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: syyang@lontium.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	maarten.lankhorst@linux.intel.com, rfoss@kernel.org, mripard@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, xmzhu@lontium.corp-partner.google.com, 
	tzimmermann@suse.de, rlyu@lontium.com, xbpeng@lontium.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
4=E6=9C=8821=E6=97=A5=E5=91=A8=E4=BA=8C 19:08=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Apr 21, 2026 at 09:33:34AM +0800, =E6=9D=A8=E5=AD=99=E8=BF=90 wro=
te:
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B44=E6=9C=8820=E6=97=A5=E5=91=A8=E4=B8=80 11:12=E5=86=99=E9=81=93=EF=BC=
=9A
> > >
> > > ote, your message didn't reach dri-devel. Please check why. You might
> > > need to switch to B4 Web relay submission, if there are any issues
> > > with the SMTP on your side.
> > >
> > > On Mon, 20 Apr 2026 at 05:34, <syyang@lontium.com> wrote:
> > > >
> > > > From: Sunyun Yang <syyang@lontium.com>
> > > >
> > > > -binding for lt7911exc.
> > >
> > > Less is more, but here please settle for slightly more information
> > > about the chip.
> > >
> >
> > It will be modified in the next version.
> >
> > > >
> > > > Signed-off-by: Sunyun Yang <syyang@lontium.com>
> > > > ---
> > > >  .../display/bridge/lontium,lt7911exc.yaml     | 91 +++++++++++++++=
++++
> > > >  1 file changed, 91 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/display/bridg=
e/lontium,lt7911exc.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/bridge/lonti=
um,lt7911exc.yaml b/Documentation/devicetree/bindings/display/bridge/lontiu=
m,lt7911exc.yaml
> > > > new file mode 100644
> > > > index 000000000000..54a73d41635a
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt79=
11exc.yaml
> > > > @@ -0,0 +1,91 @@
> > > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/display/bridge/lontium,lt7911ex=
c.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Lontium LT7911EXC eDP to MIPI Bridge
> > > > +
> > > > +maintainers:
> > > > +  - Sunyun Yang <syyang@lontium.com>
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    enum:
> > > > +      - lontium,lt7911exc
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  reset-gpios:
> > > > +    maxItems: 1
> > > > +    description: GPIO connected to RST_ pin.
> > > > +
> > > > +  vdd-supply:
> > > > +    description: Regulator for 1.2V MIPI phy power.
> > > > +
> > > > +  vcc-supply:
> > > > +    description: Regulator for 3.3V IO power.
> > > > +
> > > > +  ports:
> > > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > > +
> > > > +    properties:
> > > > +      port@0:
> > > > +        $ref: /schemas/graph.yaml#/properties/port
> > > > +        description: Video port for mipi dsi output.
> > >
> > > MIPI, DSI
> > >
> > It will be use MIPI DSI,  in the next version.
> >
> > > > +
> > > > +      port@1:
> > > > +        $ref: /schemas/graph.yaml#/properties/port
> > > > +        description: Video port for eDP input.
> > > > +
> > > > +    required:
> > > > +      - port@0
> > > > +      - port@1
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - reset-gpios
> > > > +  - vdd-supply
> > > > +  - vcc-supply
> > > > +  - ports
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    #include <dt-bindings/gpio/gpio.h>
> > > > +    i2c {
> > > > +        #address-cells =3D <1>;
> > > > +        #size-cells =3D <0>;
> > > > +
> > > > +        mipi-bridge@41 {
> > > > +            compatible =3D "lontium,lt7911exc";
> > > > +            reg =3D <0x41>;
> > > > +            reset-gpios =3D <&gpy8 8 GPIO_ACTIVE_HIGH>;
> > >
> > > Reset pins are usually active low.
> > >
> > if reset pins use active low, lt7911exc_reset function needs to be modi=
fied to:
> > static void lt7911exc_reset(struct lt7911exc *lt7911exc)
> > {
> >     gpiod_set_value_cansleep(lt7911exc->reset_gpio, 0);
> >     msleep(20);
> >
> >     gpiod_set_value_cansleep(lt7911exc->reset_gpio, 1);
> >     msleep(20);
> >
> >     gpiod_set_value_cansleep(lt7911exc->reset_gpio, 0);
> >     msleep(400);
> >
> >     dev_dbg(lt7911exc->dev, "lt7911exc reset");
> > }
> >
> > I think the two are essentially the same. Please confirm whether I
> > need to make the change?
>
> If the GPIO is active-low in the hardware, it should be declared so in
> DT.
>
It will use active-low  in the next version.

> >
> > > > +            vdd-supply =3D <&lt7911exc_1v2>;
> > > > +            vcc-supply =3D <&lt7911exc_3v3>;
> > > > +
> > > > +            ports {
> > > > +                #address-cells =3D <1>;
> > > > +                #size-cells =3D <0>;
> > > > +
> > > > +                port@0 {
> > > > +                    reg =3D <0>;
> > > > +
> > > > +                    bridge_out: endpoint {
> > > > +                        remote-endpoint =3D <&panel_in>;
> > > > +                    };
> > > > +                };
> > > > +
> > > > +                port@1 {
> > > > +                    reg =3D <1>;
> > > > +
> > > > +                    bridge_in: endpoint {
> > > > +                        remote-endpoint =3D <&edp_out>;
> > > > +                    };
> > > > +                };
> > > > +            };
> > > > +        };
> > > > +    };
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry
