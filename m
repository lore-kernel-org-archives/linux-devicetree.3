Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CAA27A91D
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 08:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784104296; cv=pass; b=oo34c9ToiY0L791iehQEI57NQ4PJFww3/qhqOnNnBC9yWwtKoZ6319Fks8vjlfcPZuJr2gBqTSJ17vn3LaXvDXfMcOGW3VDJU3NqOt2aPnTLGBdAer1WE1A9mWmtCTo5EZ2HXbwsoec+c00CLEwqNC3tevC9RSbTvoKv0/HzM4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784104296; c=relaxed/simple;
	bh=tbJh1cvggz9fj6wWtOnktnlMx38fPOjiOCsgOQsZ8fA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oekZVK1tEFBdl6J4/he0HdTNAP1T79mIZ8h0jbvI4Ncc5cze4cGjGwwdYSteLBVesb/vQrPu0q7RdHbHIT06uujXZazNu2QyFhjhbbcLP151eUgiI7NlxCLxCkxgox1IUgP2MZrW/HoNu4Hi1iZnlp/qEvrXriKXFL/yqgfPfuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pI+hNLYz; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pI+hNLYz"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c15b33f7b23so750666566b.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 01:31:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784104293; cv=none;
        d=google.com; s=arc-20260327;
        b=KpOXkrfsDZ/olLD462lX5h4bNVfLMMEszlwageC2sAIBHQoyWxuUAyrtlzc9t+v+pX
         XjMW06eRsBzf1936Zl746n1VaMvoGASkeQ09Vwi7MnIcUW8g9jhqK9v5DcaJKkYi18vG
         QNjVdFSnoSAuQQFwy5F4kdGrkPcTuoyCmwvo0QKYpKfyvMiupRrdRLWyUXSnzH+gc1im
         hR2U2iXRJ2v3ZX4BhgQAzR6swr/A84CRHWHi/VZ+SZUkQibEO2Z0FJasPMm6OCPc30hu
         B+MQ4Ott9nXPte3yeMMTK7uOtGOu6AwXDOpPYhXEpO3r8Kkb6E+NF37A/ZqxAE+l444Y
         19jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SIO4iai7ZG36bPwEvbqCHAeg6bos5dE8xe5cg3XB4/c=;
        fh=mw7opPIBsq9A5BVsQGgNHFQ6U4UiG4GF99M74PLZgos=;
        b=eXOUpPKn6XBX2x0FqQwzIe9ifqdOmJRy2lmUy70j1rmy57XZqm+gqADThdK5fTHJ33
         Wo6X7VV4GGdzpCudIg7LN2b9tNalFrd6uoV6N0aivSQ76KJTIcIBx3UWWy2stzeezz/+
         VVZDfG5rIDQpuicqBDbS5lGz/ECx04Swg2UCGytR+NFNzsmIRUsJHA178E7xlJ2GfooK
         56qMyGLX00IL2ji/SqW24mEzX5bwwm+gQQsb83X6GMdL7hTHu9tEmkTuK2B+ErPlnVXW
         OFy+J/C66HLikBnBKQmeUd4YSTiVcj5GaHSrVi7HZukKjWEVQB2sOPSyZHBKGGLnxKVi
         8m4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784104293; x=1784709093; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SIO4iai7ZG36bPwEvbqCHAeg6bos5dE8xe5cg3XB4/c=;
        b=pI+hNLYz2l3NFvmV0ENGLWnH6o5LZ/YD9yBqZdOqMoQGGreZRy76vRFZSavqZKRvSi
         urLDW0FF8oe9T0RycziasqVYuV6tKUjaZmzyA6uP/GQHp1BnEGA7oIM3KNk3A59a7OcD
         /Ly60pxBe54P6swF6qoutmqSP9iCS60GupVjyyH95jwW1pnuOqWMODOdEmYMtE5nWhg0
         OwfhH3oKKyzjSYq+aMaEg7AEG+JT5AXP4JuX8b6pp8ljxPpu1d3VfiSsw2mmXBmi1W9b
         QhCWjBaRWRloC+9GBtQeqwHvFpBHtyIujifGCvTyIaHLcWFbssCuHM3iBA8VKq3CKAz+
         R1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784104293; x=1784709093;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIO4iai7ZG36bPwEvbqCHAeg6bos5dE8xe5cg3XB4/c=;
        b=ge7mp+BbFmUuX0YymWnq3G2/nYjZOBG/tPipbfvhASM5EKG5dwtKlp9fgLU9eKlIJ0
         D17qETX5wr60a/fcppTCPmKYdkRi1FjofInrlqj9M3lnTIcNhiUx76Ekvci3rNDFUtX2
         6uMM8TViJFimG8qVy+RT5bAgOxbDtuKW355k6BpUihSRU2xT6IF57Z3w6tQD8n7wO5bz
         swOoHXFh5VCR/NdTtv3j7h2vELiSOMJ/VzSUHQXriPQ5sIcHZSzGT9uYxrUiID9ZHhvi
         racgbHJdC5/Scp9m73C14g39ChiozmjDyBnmyKi1BiLjrC10slue7Du1utX0C4Cbpfv0
         99Bg==
X-Forwarded-Encrypted: i=1; AHgh+Ro1Xt7A4E0O8icsJpPm+tTPwL+EN+t7BML57Be7GNUp0FqtWnu/gyypZXY+wNC89PLx2lfaKCX9zjRF@vger.kernel.org
X-Gm-Message-State: AOJu0YyIXt/yS2QiNwgZ1fAxl88DKjpRjFhOl40iLU7X3bimx3RgN2lH
	9pNRtMTMXFuIN15VIaOVUqDmoI2kypgeYPwsaGtU47y58ie/f/f2vshKxOX4xQR5SQZJCj9HH+a
	DQ1nmZzRs4V78wWc9bM+8L+A9pz6qvKc=
X-Gm-Gg: AfdE7ckKJAUlYh96oIv+g+XRvInEDu5cRH/0u84Ai60V5A7FHdM56riU/lF/ZdPnQbY
	jWyHNpXOmZvBnM9mmMu8f/zyK/b4uF4codYdxXdk6bnYOqSWHZD2uqNcfRvmj2Q+tRHGB0IzoOt
	7dml+hEyBFI24tOqd+IN07Fev7ExftTJnYSUiFBkF81CaodI+G7PGATTXgfJLs0WzjNJks7Hn3q
	xMKwJvoBf2LMYASumiVMIjF+9a0w+0aYjGzyeGuojcUpbWqX8WXPMGyj+YqAvad0qsJByQ=
X-Received: by 2002:a17:906:478f:b0:c12:979c:5a5e with SMTP id
 a640c23a62f3a-c1678ff1a33mr107871966b.0.1784104293130; Wed, 15 Jul 2026
 01:31:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783670011.git.zhoubinbin@loongson.cn> <7df0780e1b3d4c499a48cd862a12bda895e7818f.1783670011.git.zhoubinbin@loongson.cn>
 <20260710-game-late-9347baafa7ab@spud> <CAMpQs4+zXcNnZQnxWM7WUAM-heBYrTejm_dy3yVA4EFUrjA4CQ@mail.gmail.com>
 <20260714-irritate-varying-9055895097b0@spud>
In-Reply-To: <20260714-irritate-varying-9055895097b0@spud>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 15 Jul 2026 16:31:21 +0800
X-Gm-Features: AUfX_mybVa7Y7V3mpGKZQK3bq9KTd6uD6axAeXZjqDD49GTseSW4kybm7O4RuKY
Message-ID: <CAMpQs4Kd=qc6HNaup6GyWufPwhgd+cafLzRXhga1Z=Ez7LPXHA@mail.gmail.com>
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

On Wed, Jul 15, 2026 at 12:54=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Tue, Jul 14, 2026 at 02:53:40PM +0800, Binbin Zhou wrote:
> > Hi Conor:
> >
> > Thanks for your reply.
> >
> > On Sat, Jul 11, 2026 at 12:21=E2=80=AFAM Conor Dooley <conor@kernel.org=
> wrote:
> > >
> > > On Fri, Jul 10, 2026 at 04:24:59PM +0800, Binbin Zhou wrote:
> > > > Add a new compatible string `loongson,ls2k0300-thermal` for the the=
rmal
> > > > sensor found on the Loongson-2K0300 SoC.
> > > >
> > > > The hardware differs from the existing SoCs in its register layout:=
 it
> > > > requires two register regions (one for the thermal sensor control a=
nd
> > > > another for the CPU ID).
> > > >
> > > > Update the binding to describe this new requirement.
> > > >
> > > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > > ---
> > > >  .../thermal/loongson,ls2k-thermal.yaml        | 68 ++++++++++++++-=
----
> > > >  1 file changed, 50 insertions(+), 18 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/thermal/loongson,ls2=
k-thermal.yaml b/Documentation/devicetree/bindings/thermal/loongson,ls2k-th=
ermal.yaml
> > > > index 79e691b08341..b5cbfd201105 100644
> > > > --- a/Documentation/devicetree/bindings/thermal/loongson,ls2k-therm=
al.yaml
> > > > +++ b/Documentation/devicetree/bindings/thermal/loongson,ls2k-therm=
al.yaml
> > > > @@ -10,13 +10,11 @@ maintainers:
> > > >    - zhanghongchen <zhanghongchen@loongson.cn>
> > > >    - Yinbo Zhu <zhuyinbo@loongson.cn>
> > > >
> > > > -allOf:
> > > > -  - $ref: /schemas/thermal/thermal-sensor.yaml#
> > > > -
> > > >  properties:
> > > >    compatible:
> > > >      oneOf:
> > > >        - enum:
> > > > +          - loongson,ls2k0300-thermal
> > > >            - loongson,ls2k1000-thermal
> > > >            - loongson,ls2k2000-thermal
> > > >        - items:
> > > > @@ -39,23 +37,46 @@ required:
> > > >    - reg
> > > >    - interrupts
> > > >
> > > > -if:
> > > > -  properties:
> > > > -    compatible:
> > > > -      contains:
> > > > -        enum:
> > > > -          - loongson,ls2k2000-thermal
> > > > +allOf:
> > > > +  - $ref: /schemas/thermal/thermal-sensor.yaml#
> > > >
> > > > -then:
> > > > -  properties:
> > > > -    reg:
> > > > -      minItems: 2
> > > > -      maxItems: 2
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            enum:
> > > > +              - loongson,ls2k0300-thermal
> > > > +    then:
> > > > +      properties:
> > > > +        reg:
> > > > +          items:
> > > > +            - description: Thermal base register region
> > > > +            - description: CPU ID register region
> > > >
> > > > -else:
> > > > -  properties:
> > > > -    reg:
> > > > -      maxItems: 1
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            enum:
> > > > +              - loongson,ls2k1000-thermal
> > > > +    then:
> > > > +      properties:
> > > > +        reg:
> > > > +          items:
> > > > +            - description: Thermal base register region
> > > > +
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            enum:
> > > > +              - loongson,ls2k2000-thermal
> > > > +    then:
> > > > +      properties:
> > > > +        reg:
> > > > +          items:
> > > > +            - description: Thermal base register region
> > > > +            - description: Thermal data output register region
> > > >
> > > >  unevaluatedProperties: false
> > > >
> > > > @@ -69,3 +90,14 @@ examples:
> > > >          interrupts =3D <7 IRQ_TYPE_LEVEL_LOW>;
> > > >          #thermal-sensor-cells =3D <1>;
> > > >      };
> > > > +
> > > > +  - |
> > > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > > +    thermal-sensor@16001500 {
> > > > +       compatible =3D "loongson,ls2k0300-thermal";
> > > > +       reg =3D <0x16001500 0x30>,
> > > > +             <0x16003ff0 0x8>;
> > >
> > > Quite frankly, the address and size of this look like the second
> > > register region here is actually a few bytes in a syscon that is bein=
g
> > > misrepresented.
> > > What lies at the addresses immediately before and after 0x16003ff0?
> >
> > Yes, it can be viewed as part of the system configuration registers,
> > which appear somewhat disorganized. Within this section,
> > 0x16003fe0=E2=80=930x16003ffc represents eight chip ID registers.
> >
> > 0x16003fe0 --> the 4th chip id
> > 0x16003fe4 --> the 5th chip id
> > 0x16003fe8 --> the 6th chip id
> > 0x16003fec --> the 7th chip id
> > 0x16003ff0 --> the 0th chip id
> > 0x16003ff4 --> the 1st chip id
> > 0x16003ff8 --> the 2nd chip id
> > 0x16003ffc --> the 3rd chip id
> >
> > Perhaps I shouldn=E2=80=99t have referenced `0x16003ff0` separately her=
e. It
> > would be more reasonable to declare the entire chip ID address space
> > as a separate syscon and have it referenced by thermal driver.
>
> Probably, but even being of size 0x20 feels suspiciously small and that
> it is likely that this is part of an even larger grouping of misc.
> registers.

According to the manual, the chip configuration registers are not
contiguous but are scattered throughout the memory. They are generally
as follows:

0x16000100 - 0x16000154:  General Chip Configuration / Chip Sampling
Parameters / Chip Counter Registers
0x16000400 - 0x16000424:  PLL Clock Configuration Registers -> This is
already used in clk driver;
0x16000490 - 0x160004a8:  GPIO Remapping Configuration Register ->
This is already used in pinctrl driver;
0x16000500 - 0x1600050c:  USB PHY Configuration Register
0x16001040 - 0x160014c0:  Interrupt routing Registers -> This is
already used in irqchip driver;
0x16001500 - 0x16001524:  Thermal Registers -> This is already used in
thermal driver;
0x16001600 - 0x1600180c:  External Interrupt Registers -> EIO irqchip drive=
r;
0x16003fe0  - 0x16003ffc:  CHIP ID Registers

Expanding the range to `0x16000100 - 0x16003ffc` might not be the best appr=
oach.
In contrast, the chip ID register is independent. Additionally, apart
from the first section of general-purpose chip configuration
registers, the other registers are referenced by their respective
modules.

So, is `reg =3D <0x0 0x16003fe0 0x0 0x20>;` a good choice?
>
> >
> > For example:
> >
> > In DTS{i}:
> > chipid_syscon: syscon@16003fe0 {
> >        compatible =3D =E2=80=9Cloongson,ls2k0300-cphipid-syscon=E2=80=
=9D, =E2=80=9Csyscon=E2=80=9D;
> >        reg =3D <0x0 0x16003fe0 0x0 0x20>;
> > };
> >
> > In thermal driver:
> > Use
> > `syscon_regmap_lookup_by_phandle(np, "loongson,chipid"); `
> > Or:
> > `syscon_regmap_lookup_by_compatible("loongson,ls2k0300-cphipid-syscon")=
;`
> >
> > get the chip id address space.
> >
> > >
> > >
> > > Thanks,
> > > Conor.
> > >
> > > > +       interrupt-parent =3D <&liointc1>;
> > > > +       interrupts =3D <20 IRQ_TYPE_LEVEL_HIGH>;
> > > > +       #thermal-sensor-cells =3D <1>;
> > > > +    };
> > > > --
> > > > 2.52.0
> > > >
> >
> > --
> > Thanks.
> > Binbin

--=20
Thanks.
Binbin
