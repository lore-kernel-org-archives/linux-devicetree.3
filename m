Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDE834D4F9
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 06:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791095282; cv=pass; b=YwAZyGUPTDilgztgtJU83WnwCMYFjU87O8ZWIZUg5u74VV1jOED3xBQAyBDicsNRGzHd7UWMY/pElXFeFWC/TarxT9Qn4PYm+tpILXrbc6uyLeHnJSJh9SWna28Yyv1CctjxcqfEVQ/y14NPAs+AScH+5XSWbU1ex1lPn0sP3oY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791095282; c=relaxed/simple;
	bh=0MgJqxCSpKDH4OcGXJna3WQ38drD5FfTXNfYH0LNNkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VVSX6Fg8EqOXQUPIxOpKxKPXofiAEz6S7ohDZHaTDfp5SaZjdvxj61ntCQw86O1KPtFSpqU35PWX1h2c/6PXKpzG4FtRZ/7sqO6Ogge3QGfC/BOwdcMvVBoyvMaAYIx5+czGbB9cK0KfJGCxsoyYib4lqeTAjagaCzDqlXgbWy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9/6+MgG; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9/6+MgG"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6af9cc73235so1395097a12.0
        for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 23:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791095278; cv=none;
        d=google.com; s=arc-20260327;
        b=Ul5EGmtAfYmmsSLjQqriQ5OUgdfjfMq1xVWoRoL+VT9OaDACqsDdV6sROV1n76q29q
         g0EeGPHtYsTh7mrJ2UvA3L3DIsN5eZMX0HvBHyPA/bQxnb++N7R34ysKJGnjiaxcU2m7
         GNveP8i+kfBZYul+IOlwAl014qazLtxATOEgihAcQJSY3OH/uPw8Plx3pDZVWVL29dpE
         dy5k1gpjIthWSWObFWbhUraiP7EfzSTaj5A934ynt6bnNG58IEC5lF6WvpdXcKkcQOxP
         ECJjrwuE2sKFPke2GJ3ENwETbpUFZVvER8mGUVYi+Bo6vvoYSB8xULzpgiRoU6KjEkXF
         3rLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VdBLchJKylzFCeYfGu3WXTuIShpFkKPFHiVvdcDlSGI=;
        fh=FWl7CNWVul7wtCsLnAHnMPvjGI5g/yVAzXmCyfvgaIw=;
        b=Ex8vk9/DD04ssg8sW/u1t7lBu8UbqPwC/LpLM2NsuGNqlZZ2mWG5xyon6Kj8y5tc1E
         AarK3oWL/VpdNbv4CcVbCrAfTlfsDF4lbkb45p9F2ky55DLVC1CYnL7FEPIfJlOtyN55
         U+B+1YgozsbpQmlqHz8so00uLBiKPScbA7BR3r+wgenwg69DjCVi3r+rJKH4E9BSrdwV
         7JO1QDLWsJ0Jggvguoic9YUntWZceZ+3C38OPBRycOYpHz9HwiwtGlOL92cupJ5gxvrd
         GT3gt1Uh6eBKjyZV1dvsfdFdPonAIwD5JbrywtZmxltGht6kHau08Ni/LpGT413OGczu
         tCgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791095278; x=1791700078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VdBLchJKylzFCeYfGu3WXTuIShpFkKPFHiVvdcDlSGI=;
        b=K9/6+MgGtkoqf3LtVGe48/gT4zfxswJGJq1xPwCw5+SSjNQ4Opk565Ea1wysLa1or6
         mOr0lwA7vzNyQ+q02UvGXccxHLJ9QWJzc/LYBcvTTV4spNE/k8+gtpWiT04DLehRx/ka
         ANGecvnUPcz0D0VEy86I1y6cZabwvyJkd/1mbl/hSkffFlslV7M8MJEBHVid9UV4L8vx
         nOY7Qo7Dlkmxp3aS8PJaV8rkTOcE7mEl3GpRT55RsrfJvd3S40RQGNzLv27wEbf8zxgb
         Rtx1gB1uJlz9pe+LLcRljhTTKNfo2Qn9pNd9TBMMrujaGqLUQ63SCYnEQOtKZvMlB1mC
         XaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791095278; x=1791700078;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VdBLchJKylzFCeYfGu3WXTuIShpFkKPFHiVvdcDlSGI=;
        b=HpVQCskNiPOM7B3vtDOduG3CKH0Ad1CCbcNR3iSaKhKI2VCIwAdiC7bJ/yC1jWVg78
         g5rrOsshbV4R9reONZkwOLps7rdIvDzxugYymiE0C8bEhvSWmzxv78b/c6MYrC95XUeG
         140QpTiG5tL1BiKrRtS1026AX7Ycc1+StnQi0CmUHiJEO/pTA0DJNfVf1FCrzT2XY/U8
         /rqnmgKGGKdNhqFoGB88EAxPOVOJzUkE+oUps+nOS286Xb8JfH0ibjcWmYVNphyXERev
         k6tiNKVtC8to+9aU72WVVHfl9/GxZ7buqHw9PhjHHS7PGb4U4Ac/hTBeZfMTFaxsyFqt
         zx+A==
X-Forwarded-Encrypted: i=1; AKwUvBxK5+SgttTD4GNDmvumFKbW7PEWayLBUcaXWYGgJuRyhIP1MYLMJEovVIvQxaQk4gc6Xt0YJfOZzI1v@vger.kernel.org
X-Gm-Message-State: AFuF++kUdg7JoPZvty2q49o/0k37lqqEDlx0pKx2qR1/SFKfzo2653vK
	RPttFFIEWZKoDq7O/c7l2YZcpyXzgfxly/fjSGx0fSzm4d6lIWNYNNQr3pUC7Ujx1MMy2E2c9V+
	LgYewnyzMMGgNpTQp8xw9QpzZJp+4j1I=
X-Gm-Gg: AYBFou3llCF0t/0rZwIvNkMYgpdQHxJ6r0ONYzY2M5LW618h5vOxlhRvKoQHrkezjF/
	UJXVkfjLmMVVzryakVBBJQINu3Ra6ADQ5haHwULUbSc6O+vhNNre12xBANGXHycWNnfVFHaPWEZ
	dj/61afAj8pItnuxzFWVcvWrVdRJM2n4dPIxioIwTlxa/wVneHJr2birFc731kIlyRS6ZIhZD3M
	eO9Z7Xa1vx5KuTDrO8V3BmEgjOvdYcA51mOLOXxLCwVOAJxDei53jf3s3bgahdfJDbeH4rpqFlq
	rFkkhkE67GIkFzScXBIfjjR2QZFswhXXnjrOKrVgpRHujgfd3zH6snMfvA==
X-Received: by 2002:a17:907:97c7:b0:c2e:22f7:59c5 with SMTP id
 a640c23a62f3a-c2e33ef144dmr903675566b.7.1791095278211; Sat, 03 Oct 2026
 23:27:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790068409.git.zhoubinbin@loongson.cn> <fdd9fa87058b75fda0dbb805de7989fcd279137c.1790068409.git.zhoubinbin@loongson.cn>
 <ar2CuxAv9mRfiVsA@lizhi-Precision-Tower-5810> <CAMpQs4KOvjvOku+DEMzr+OdfRNQAm9QoXnG3B93ZJs78ax5NQA@mail.gmail.com>
 <ar_EDV7FMDBr7xCp@SMW015318>
In-Reply-To: <ar_EDV7FMDBr7xCp@SMW015318>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Sun, 4 Oct 2026 14:27:46 +0800
X-Gm-Features: AclHuK98B_nfcu05QOo2QFUifWbI8m9nf45hMD7NfSrCJ3B2KmbMmSmveSfVUVU
Message-ID: <CAMpQs4LR72mkD5UuA-T5_Ypo6qrC_4xcjfyP4VR5tDTekcipuA@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: dma: loongson: Add Loongson-2K0300 DMA
 mux support
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	Huacai Chen <chenhuacai@kernel.org>, devicetree@vger.kernel.org, 
	Keguang Zhang <keguang.zhang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank:

On Fri, Oct 2, 2026 at 10:47=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Fri, Oct 02, 2026 at 10:00:11PM +0800, Binbin Zhou wrote:
> > Hi Frank:
> >
> > Thanks for your reply.
> >
> > On Thu, Oct 1, 2026 at 5:44=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> =
wrote:
> > >
> > > On Tue, Sep 22, 2026 at 05:25:43PM +0800, Binbin Zhou wrote:
> > > > The DMA mux on Loongson-2K0300 is not a standalone hardware block. =
It is
> > > > implemented as part of the chip configuration registers CHIP_CTRL13=
/14/15,
> > > > which route peripheral DMA requests to the physical channels of the=
 CMC
> > > > DMA controller.
> > > >
> > > > Document this as a DMA router. The #dma-cells =3D <3> specifier con=
tains
> > > > the peripheral request ID, the target CMC DMA channel, and channel
> > > > configuration flags forwarded to the parent DMA controller.
> > > >
> > > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > > ---
> > > >  .../dma/loongson,ls2k0300-dmamux.yaml         | 49 +++++++++++++++=
++++
> > > >  MAINTAINERS                                   |  1 +
> > > >  2 files changed, 50 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/dma/loongson,=
ls2k0300-dmamux.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/dma/loongson,ls2k030=
0-dmamux.yaml b/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma=
mux.yaml
> > > > new file mode 100644
> > > > index 000000000000..12b8f8af51e9
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamu=
x.yaml
> > > > @@ -0,0 +1,49 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/dma/loongson,ls2k0300-dmamux.ya=
ml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Loongson-2 APB DMA MUX (DMA request router)
> > > > +
> > > > +maintainers:
> > > > +  - Binbin Zhou <zhoubinbin@loongson.cn>
> > > > +
> > > > +allOf:
> > > > +  - $ref: /schemas/dma/dma-router.yaml#
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: loongson,ls2k0300-dmamux
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  '#dma-cells':
> > > > +    const: 3
> > > > +    description: |
> > > > +      Each cell represents the following:
> > > > +      1. The peripheral request id (see
> > > > +         include/dt-bindings/dma/loongson,ls2k-dmamux.h)
> > > > +      2. The physical CMC DMA channel (0-7) that is passed to the =
real
> > > > +         DMA controller
> > >
> > > Do you have restriction between request id and channel? Does any requ=
est id
> > > route to any channel?
> >
> > Yes, according to the description of this register=E2=80=99s bit fields=
 in the
> > manual, DMA channels are not mapped arbitrarily.
> >
> > We can broadly categorize them as follows:
> > 1. First, most peripherals that use this DMA controller request
> > adjacent DMA channels (TX/RX) in pairs.
> > Let=E2=80=99s take I2S as an example.
> > Bits [17:16] at address `0x16000138` controls the I2S DMA channel mappi=
ng:
> > 00: Channels 0, 1
> > 01: Channels 2, 3
> > 10: Channels 4, 5
> > 11: Channels 6, 7
> > 2. The SM/DES/AES module uses only channels 0 and 1, corresponding to
> > the bit field values 00 and 01, respectively.
> > 3. The can/adc module is single-channel, so each bit in the
> > corresponding bit field corresponds to channels 0=E2=80=937.
>
> Does channel dynmatic allocated or have to static assign, if channel dynm=
atic
> allocated, needn't arg2. If static assign, it'd better descript clean abo=
ut
> restriction between arg1 and arg2.

No, it needs to be statically assigned based on the register configuration.

Let me think about how to describe this better. First, both arg1 and
arg2 are required; they fully configure the register. arg1 determines
the range of the bit field, and arg2 determines the value of that bit
field.
At the same time, arg2 and arg3 are passed to the DMA controller
itself to complete the relevant initialization.

Is this description acceptable?

'#dma-cells':
const: 3
description: |
Each cell represents the following:
1. Peripheral request ID: This describes the corresponding bit field
for that peripheral in the configuration register; see (
include/dt-bindings/dma/loongson,ls2k-dmamux.h) for details.
2. Physical DMA channel (0=E2=80=937): This not only represents the DMA
channel used by the peripheral but is also converted into a value for
the corresponding bit field in the configuration register, indicating
the legitimacy of that peripheral using that channel.
Specifically:
     1. I2S/SPI/UART/I2C: Require adjacent channels in pairs; valid
values are 0/1, 2/3, 4/5, 6/7;
     2. SM3/SM4/DES/AES: Single channel; valid values are limited to 0/1;
     3. CAN/ADC: Single channel; valid values range from 0 to 7.
3. DMA Channel Configuration: A 32-bit mask used to specify
device-specific DMA channel configurations.
- Bit 6: Peripheral Address Increment Mode
0x0: Disabled
0x1: Enabled
- Bit 7: Memory Address Increment Mode
0x0: Disabled
0x1: Enabled
- Bits 12=E2=80=9313: Priority
0x0: Low
0x1: Medium
0x2: High
0x3: Very High
.........

>
> Frank
>
> >
> > >
> > > Frank
> > > > +      3. Bitfield representing DMA channel configuration that is p=
assed
> > > > +         to the real DMA controller
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +
> > > > +unevaluatedProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    #include <dt-bindings/dma/loongson,ls2k-dmamux.h>
> > > > +    dma-router@16000134 {
> > > > +        compatible =3D "loongson,ls2k0300-dmamux";
> > > > +        reg =3D <0x16000134 0xc>;
> > > > +        #dma-cells =3D <3>;
> > > > +        dma-masters =3D <&dma>;
> > > > +        dma-requests =3D <22>;
> > > > +    };
> > > > +...
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index b021fb623446..dc976938c58c 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -15344,6 +15344,7 @@ M:    Binbin Zhou <zhoubinbin@loongson.cn>
> > > >  L:   dmaengine@vger.kernel.org
> > > >  S:   Maintained
> > > >  F:   Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.y=
aml
> > > > +F:   Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamu=
x.yaml
> > > >  F:   Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.ya=
ml
> > > >  F:   drivers/dma/loongson/loongson2-apb-cmc-dma.c
> > > >  F:   drivers/dma/loongson/loongson2-apb-dma.c
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
