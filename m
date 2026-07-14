Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B943DA5DB
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784012037; cv=pass; b=QC3SBOdQigbHs9ULSdR6UGgMpegZsNXC8kq2FwghcgkV9knc/znd8wNm0dhTmJAKI1qDC40RsuBxoRl5kxlin8OuZsCMtOCRJipVQuYBXJoIz/djhQHhB2o3kHA6Uac1yQ30TswykUnUwg8/9z9BvZ+qtpafugHw8sNHMoi2ubU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784012037; c=relaxed/simple;
	bh=u/o3hNaQTwZ7SMZZKioaNk2zdeVsCZ/s/MMb/twwrKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gl5QTCXEn3SH0D92C6DN3Pz0oCkZZd7+zQEqjoUJEut7TOpMvbEdnuJejzYgdTcq2yHXI77lhl0l7A7L2mqVf0GROYI8ngyuejrUM+7En1EZkibX9P9fgfDqnT9dNKk2PxtXURaq6MsGv2iVhR+hIv14K/FzEVkRu+el1XX7cOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHyTzPM3; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHyTzPM3"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c15b1da6b82so75997366b.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 23:53:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784012034; cv=none;
        d=google.com; s=arc-20260327;
        b=WiCrLCZVuhJofQNCJsF08vv7bH3U1VPvQTzwkxNIqPJQdD2kDUPKt/EfpEIs3bNFFw
         WDVf4SOLtJxPeDHlrK894pR4d6OkQjll/3E5UqXMpqkq1agH6fBeN939jCNxiI2pg5+M
         PdkFiR7EBPruCgKU2hgrQT6uvc2qR6ZNByEk50jVLsdTu+1o8xde3J5JOQrZLE+mwRXo
         SlqPNwCbetaB/BVwoBZEI+vpYWlImBEeSqGMt3pb8c576NeJR5osSZ8K5WD4eufCtoT0
         aa1pWhtotgdbDxcbDXcTOR0nG66Qf75/EBvt5QwARvBxggeK5fpsK3Mmy+TQ6XdU4rRl
         ELrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hdKwj0yrU/TK8GpM97VwRceyfpiXsD0J+8JoQXFeKPU=;
        fh=IUtRhQA31wCAB0K0PiIvJ+YfRYjVo7EwpfxHHrmdOL0=;
        b=CZJWcQatzdByOrixw3BTWqaQQU7mhRkkKgSU9CnNRVNVqRbTUIZsggnFSl/ac5N/Vh
         /9kfOjA0XH7Anahj9MSuBjKm5uQjis5HtKIrlh4b03t3Gvs/qmEJUVPc+kJ7EE5/TbXC
         TcMj0c9N7vi5rwe6NCIxu+lxHXjWTBN8Z8Vsu+rnMgQopxoWyGTOadzsdPau/V4u9gfP
         svHkMlCAyd/HNGJLwgqE1WvT8Jb0NvXpFK6fE7PZxJPaBHHSwBGmclk0UWQe8m8u2XRL
         RIBA09Erf6LaDnlDGUktiKRmEt83RIvnDDRWLMkNiu+3lV1EH3zxxIcz7e2dtK6e37rR
         oqfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784012034; x=1784616834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hdKwj0yrU/TK8GpM97VwRceyfpiXsD0J+8JoQXFeKPU=;
        b=UHyTzPM3iPGQrdI4yck8GcvpBS5V52qnhSJK1b1lsY4ai+AtjIhkuHnNAXlim+NVd/
         ZMvwENkuEqWTaZsdqJtmeU6t0JbxWRNm97/7wn92fUFj8OawWeR/0eRysGxZXz/QmEmL
         xFYuvm0Vy7jjFIPMoYy4gdhHAvtRH8f66mU1aH/9saKqVm3aIQCVVPQY1ku5Vwkx/gXf
         /huQti8ViGTmmzYiqJ+AovKERf5GZqPy2DljWl5H1B2042Nm8A4eYcQUVxMDl7FxZV3z
         Q1nnLN6n5UYc5NxIVO1IMdJ1kKzuBZKQx/tew5r832PDMVuZVOpbqWnZggQuIbQ6oskC
         ztrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784012034; x=1784616834;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hdKwj0yrU/TK8GpM97VwRceyfpiXsD0J+8JoQXFeKPU=;
        b=iWRcy368gTdrKeURZWQPyxvQsXM0xtj2ZlM2kLaQ6EnbSpZdD27tRYysVjlnN93Vlw
         oWjXCWj/SfU8u0+pHg2CKdLKjoZAOwet1QBLbXlkOKK6NMijlh75taOZnlIFUCql71aZ
         H09G3az/nTbpSIzcnF0/H0cZU76rJud5aBmpvc9AuvImwkXFDTRoMGMNVov9mH7RpRh6
         q5KhL8jUicbQC2/K4yhe4fkkaKWAg6lTwD4odE4E6ep6LA92i1WaXSrE6KlG+PlNTe6f
         8qahq71fKMxVy6d9oiO9B2FKA2N+SjNPIO2Kwi1enXMYwtdAXFfFjIH7Rc+OkIgUPtk2
         Ku3g==
X-Forwarded-Encrypted: i=1; AHgh+RrDFMmC23Xqpb8h1al3kM5J4xR79WPWv3nWZKrXStl4FpPlpBic+4d9W79Qpnrou1fCOl6mi2GE57PO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3QEn8hvQC3jO0svJpp38OVUj0PUalZS5XDg6n0GdPjsSqKNYU
	DISA2N8erqpDYCUv5JttRXzxXBtQ1rbxRWPPplSPP7wayvavqxoQJNfzdSLlVZUP2VR5/n6DvmE
	WE+uzSeirAoPBtiiTCrmR5U+QRWHQFs8=
X-Gm-Gg: AfdE7cnuW47AvR74xEuRxBAI52sY7KwVmwUKhfDHCf7+gqLqrFV8gVeKEd09VOAar1t
	uqR5+cIy+lyjU5lLMS7I32D113HyGZouDJvq/WWgLxylDGF/AgtpnF7Sb/18Ph54Lrgm6lkzMls
	2omCubqCec/RpcFA8MO53A8bBGIAM0QTArD01LYH7spHvOcrridPkvajFEFFrxnIDYkSDYs1XL9
	vUjvlAF7I2R83+lgRUtpKWbM5ywX89QJq9CqUrPsBS/nxA4pvSPSoOCtBao8OUDRrD9r5RVM9g=
X-Received: by 2002:a17:906:2b51:b0:c12:8db1:b6de with SMTP id
 a640c23a62f3a-c161f39e587mr361554066b.32.1784012033993; Mon, 13 Jul 2026
 23:53:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783670011.git.zhoubinbin@loongson.cn> <7df0780e1b3d4c499a48cd862a12bda895e7818f.1783670011.git.zhoubinbin@loongson.cn>
 <20260710-game-late-9347baafa7ab@spud>
In-Reply-To: <20260710-game-late-9347baafa7ab@spud>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 14 Jul 2026 14:53:40 +0800
X-Gm-Features: AUfX_mxjtQ3UWo4wBSJnYn5ShCpXy7xgitddiC-Sdv3YauPBTDh5iRK_e5oqirA
Message-ID: <CAMpQs4+zXcNnZQnxWM7WUAM-heBYrTejm_dy3yVA4EFUrjA4CQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: thermal: loongson,ls2k-thermal: Add
 compatible for Loongson-2K0300
To: Conor Dooley <conor@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor:

Thanks for your reply.

On Sat, Jul 11, 2026 at 12:21=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Fri, Jul 10, 2026 at 04:24:59PM +0800, Binbin Zhou wrote:
> > Add a new compatible string `loongson,ls2k0300-thermal` for the thermal
> > sensor found on the Loongson-2K0300 SoC.
> >
> > The hardware differs from the existing SoCs in its register layout: it
> > requires two register regions (one for the thermal sensor control and
> > another for the CPU ID).
> >
> > Update the binding to describe this new requirement.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../thermal/loongson,ls2k-thermal.yaml        | 68 ++++++++++++++-----
> >  1 file changed, 50 insertions(+), 18 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/thermal/loongson,ls2k-th=
ermal.yaml b/Documentation/devicetree/bindings/thermal/loongson,ls2k-therma=
l.yaml
> > index 79e691b08341..b5cbfd201105 100644
> > --- a/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.y=
aml
> > +++ b/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.y=
aml
> > @@ -10,13 +10,11 @@ maintainers:
> >    - zhanghongchen <zhanghongchen@loongson.cn>
> >    - Yinbo Zhu <zhuyinbo@loongson.cn>
> >
> > -allOf:
> > -  - $ref: /schemas/thermal/thermal-sensor.yaml#
> > -
> >  properties:
> >    compatible:
> >      oneOf:
> >        - enum:
> > +          - loongson,ls2k0300-thermal
> >            - loongson,ls2k1000-thermal
> >            - loongson,ls2k2000-thermal
> >        - items:
> > @@ -39,23 +37,46 @@ required:
> >    - reg
> >    - interrupts
> >
> > -if:
> > -  properties:
> > -    compatible:
> > -      contains:
> > -        enum:
> > -          - loongson,ls2k2000-thermal
> > +allOf:
> > +  - $ref: /schemas/thermal/thermal-sensor.yaml#
> >
> > -then:
> > -  properties:
> > -    reg:
> > -      minItems: 2
> > -      maxItems: 2
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - loongson,ls2k0300-thermal
> > +    then:
> > +      properties:
> > +        reg:
> > +          items:
> > +            - description: Thermal base register region
> > +            - description: CPU ID register region
> >
> > -else:
> > -  properties:
> > -    reg:
> > -      maxItems: 1
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - loongson,ls2k1000-thermal
> > +    then:
> > +      properties:
> > +        reg:
> > +          items:
> > +            - description: Thermal base register region
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - loongson,ls2k2000-thermal
> > +    then:
> > +      properties:
> > +        reg:
> > +          items:
> > +            - description: Thermal base register region
> > +            - description: Thermal data output register region
> >
> >  unevaluatedProperties: false
> >
> > @@ -69,3 +90,14 @@ examples:
> >          interrupts =3D <7 IRQ_TYPE_LEVEL_LOW>;
> >          #thermal-sensor-cells =3D <1>;
> >      };
> > +
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    thermal-sensor@16001500 {
> > +       compatible =3D "loongson,ls2k0300-thermal";
> > +       reg =3D <0x16001500 0x30>,
> > +             <0x16003ff0 0x8>;
>
> Quite frankly, the address and size of this look like the second
> register region here is actually a few bytes in a syscon that is being
> misrepresented.
> What lies at the addresses immediately before and after 0x16003ff0?

Yes, it can be viewed as part of the system configuration registers,
which appear somewhat disorganized. Within this section,
0x16003fe0=E2=80=930x16003ffc represents eight chip ID registers.

0x16003fe0 --> the 4th chip id
0x16003fe4 --> the 5th chip id
0x16003fe8 --> the 6th chip id
0x16003fec --> the 7th chip id
0x16003ff0 --> the 0th chip id
0x16003ff4 --> the 1st chip id
0x16003ff8 --> the 2nd chip id
0x16003ffc --> the 3rd chip id

Perhaps I shouldn=E2=80=99t have referenced `0x16003ff0` separately here. I=
t
would be more reasonable to declare the entire chip ID address space
as a separate syscon and have it referenced by thermal driver.

For example:

In DTS{i}:
chipid_syscon: syscon@16003fe0 {
       compatible =3D =E2=80=9Cloongson,ls2k0300-cphipid-syscon=E2=80=9D, =
=E2=80=9Csyscon=E2=80=9D;
       reg =3D <0x0 0x16003fe0 0x0 0x20>;
};

In thermal driver:
Use
`syscon_regmap_lookup_by_phandle(np, "loongson,chipid"); `
Or:
`syscon_regmap_lookup_by_compatible("loongson,ls2k0300-cphipid-syscon");`

get the chip id address space.

>
>
> Thanks,
> Conor.
>
> > +       interrupt-parent =3D <&liointc1>;
> > +       interrupts =3D <20 IRQ_TYPE_LEVEL_HIGH>;
> > +       #thermal-sensor-cells =3D <1>;
> > +    };
> > --
> > 2.52.0
> >

--=20
Thanks.
Binbin
