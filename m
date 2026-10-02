Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3B5328B7F
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 14:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790949629; cv=pass; b=ajpgeNLIBzZadh49i8ri2IIxJ+QkF8/lizcEz0ZgbowVMDIEf7TXd2w3OE7BWRazLSKI+3pljaiCV3+YclGyvTPG5JkLMVp4/FnagszB41SXP9fctT+SzOl6hgMitER9EbFEF4OSnliMlJDpELWTGkpcmf28HuGZzQH3nzfUIuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790949629; c=relaxed/simple;
	bh=wyU4yFD0MfPCq2zFzLFyUgXsjZXV4XOmdzc2SNRbNtQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ntJp1oNyHXr532NbRlFrWIryd/XSD/BDpzuzPqzi58F30WboJUlFdWO9Zoj5JDIiwi/siRZZEa1GqU621Gjp4zWKW7RZ39RtciHIIIiv3rOivMRQyToxmEk5y/POvrfaZrFH6EiyniXxPRWxFmRgVRxiG7ky4ui3mbPoyLLoayE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=beR2wIRn; arc=pass smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="beR2wIRn"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2afe9fa8e0so932791866b.2
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 07:00:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790949624; cv=none;
        d=google.com; s=arc-20260327;
        b=dmTrGzBSM/8SszdtAhPwZmAz3GX3uuoWi/pRiNrN8R/NMQOZtTCU32HRwRGkfC0FAV
         E7aLCCrphqja/stHkZOPA4a9Dj/EjgRL50FVVZrXorBYdZW6wfXqv8JuLUaUbma4x034
         6XfVPNcsShDGrex47lRPzMq/YQwZVNGIIgdeQey0x8WAnsIgJ4i8/dY5uNOegdOnCeim
         rRqW+8eH05nDtDr7MKJMeNixCWKalKCsA0vbYoBtpEr6hTABsJ6levF26hgIsDSeh1y0
         KtFAV0oR6unmqBm1ykXlVpLT8rNdYTuJ6DclW5sK5N/G3tqj1QoQlC1ioKXj2OyI6Ln5
         DI4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=picNzui8nL3svqPYb5+O55APiGyE4P0qHqPIiAvWwGY=;
        fh=Mo6yJLtcn0yl5ySEniJFVDN1F3RXlhrx+cSggQNb8z4=;
        b=kGvS7gSCK5gitWly0yGGlP5Rd863/WO3VYZ675Xr0K4gz33/sABFq8BvTpzk07dQQX
         un5OyXijji8VejvverxkwzoxQMrFWZt6O+VX4OAwKNsHZsQHbc3etgTyYLvnq+AV83UE
         U3qspYKpJBZzPR9KICt/NjmnuZgHU188+qNgj8AzdygxrQzyO2XCN17eU7KAVmn4Y/jy
         prZe2DS76jPdwB1/tZptdk69AKuVmJv+mG5Jl3FJUEJoAIHpyXOrsWpmBo+6uz+NWlFy
         tdj81+w/SmrJi8Nr7nS6MA0DctGMDmkI3waOgQPsOTw841sD08r1699YnjZ4Sc3CpZ5B
         g4Fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790949624; x=1791554424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=picNzui8nL3svqPYb5+O55APiGyE4P0qHqPIiAvWwGY=;
        b=beR2wIRnjU/gT+Wyhy3v3u0kmSvVXEPDuXcop3mo4YPCh+t7YlfPOMRUqui52IXkax
         YKJ1xyq2Llx4uYsokwlPbVBd6dtOgJygu3gQeVl88Wkir8ldK07xFcL9gf6NUAS1lcm7
         kmUuGqbUM407aD7watoAu7KkvjwOPiPFDw4AiXLjdB7o3/ySpjVunckbvSPdn3rWG3rl
         qJ/OYY6Bb7RCUyhVP+hryXIiYKa9aRqauNNgXsXlHYIvbp4JrLgYq0pwtYtwmB6ZgCi+
         SHsyHHPNG6IOs9zPP2Emd+U4/iXLGa4viPhx9d0iTSzZcB995dHGjF0XekcYpG+IWjzw
         GQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790949624; x=1791554424;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=picNzui8nL3svqPYb5+O55APiGyE4P0qHqPIiAvWwGY=;
        b=ySNsiMiqygbtxkNBoQkx4C9PUGlRthNobAt2cPmKt6atxyG/FAqQkKWNAMzUFPYmOC
         h2/w0bUX1OJNJXH8aj4NtsasnfGkmbBV0eemA4Hua69jV5kbk6c3fQLIjzylggzOVbJL
         NDLtS0iYwPZBRhHZZDpchB5iPBDUQsaqeEfOyp4f7Wyb+WTQCv9+2r2tarcmJ/4v+9l9
         KPQjFatHSBHnSM6O534XTqq6cPGX7KUINL+X4aHNUpDw8czWuaoOik3pKn0rKOGhoEJx
         +MGHvRUPaTgEiJ/IZxKAAB8YvvUDiyXzyIO8ihH3Z9pqYtxAQEXJISEO+9YejpWrRXIG
         TT1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzGQYaQdrSf0q/R54BxxOuihW54YOvQmr64lg0vN8bDvxh5TR3lZOIoOO6pzqp3HfWK61a6Xn93xeNP@vger.kernel.org
X-Gm-Message-State: AFuF++lITRroi6CB2tqJ7NWM41uho2HVL3fNEynZqExRGRgmO8aK0bF+
	qfTYp0bdXSh0j75CUt9Fg9tVcrNo7oa/dKzfOBac7WBLa+/jaRa5qQ2CV/0eEc1rYfFwGlh8tnT
	e3T5zUjYe44FDovph4oHSyvp9HeadiMM=
X-Gm-Gg: AYBFou13U/x2e5ygkg11uiG3HHTCTSUqfAmu6U1TdzIRchpLPf1JBohKDPt9CF0DuD5
	aD05psK3Mvludj6jpjkTNtKYG7L05IG2k4dLboQ4x4h30BvqoZizQ/dRPS8HVGpdtN+F7qjuB92
	s4F471v/8PH1ETzqFzqeUgj5dnG14kNIffQiYcVZo+96t63e063Y3+cTSN8ORb9BYH77CnAkXMD
	PyGnfoGjX2bMs+N0Jxj/uTWJ0y6RNy6mnvakklMbA1M1AOBpx8CFlzgopAiT482qbZ22w/WhBVF
	jb6vfMcX/Fr1np0s8Lvj+uoBrXUSV00lMCmCCfkGp9kixaoBASp1YjWx
X-Received: by 2002:a17:907:3d9f:b0:c2e:34b7:8899 with SMTP id
 a640c23a62f3a-c2e4b2ad0a0mr233090366b.30.1790949624084; Fri, 02 Oct 2026
 07:00:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790068409.git.zhoubinbin@loongson.cn> <fdd9fa87058b75fda0dbb805de7989fcd279137c.1790068409.git.zhoubinbin@loongson.cn>
 <ar2CuxAv9mRfiVsA@lizhi-Precision-Tower-5810>
In-Reply-To: <ar2CuxAv9mRfiVsA@lizhi-Precision-Tower-5810>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 2 Oct 2026 22:00:11 +0800
X-Gm-Features: AclHuK_GnP5JO6W3QNVPrNknAqgJkdFCwrsdfZXdP0YxunZd8pKuDSLmdPCX4QM
Message-ID: <CAMpQs4KOvjvOku+DEMzr+OdfRNQAm9QoXnG3B93ZJs78ax5NQA@mail.gmail.com>
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

Thanks for your reply.

On Thu, Oct 1, 2026 at 5:44=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wrot=
e:
>
> On Tue, Sep 22, 2026 at 05:25:43PM +0800, Binbin Zhou wrote:
> > The DMA mux on Loongson-2K0300 is not a standalone hardware block. It i=
s
> > implemented as part of the chip configuration registers CHIP_CTRL13/14/=
15,
> > which route peripheral DMA requests to the physical channels of the CMC
> > DMA controller.
> >
> > Document this as a DMA router. The #dma-cells =3D <3> specifier contain=
s
> > the peripheral request ID, the target CMC DMA channel, and channel
> > configuration flags forwarded to the parent DMA controller.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../dma/loongson,ls2k0300-dmamux.yaml         | 49 +++++++++++++++++++
> >  MAINTAINERS                                   |  1 +
> >  2 files changed, 50 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/dma/loongson,ls2k=
0300-dmamux.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dm=
amux.yaml b/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.=
yaml
> > new file mode 100644
> > index 000000000000..12b8f8af51e9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.ya=
ml
> > @@ -0,0 +1,49 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/dma/loongson,ls2k0300-dmamux.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Loongson-2 APB DMA MUX (DMA request router)
> > +
> > +maintainers:
> > +  - Binbin Zhou <zhoubinbin@loongson.cn>
> > +
> > +allOf:
> > +  - $ref: /schemas/dma/dma-router.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: loongson,ls2k0300-dmamux
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#dma-cells':
> > +    const: 3
> > +    description: |
> > +      Each cell represents the following:
> > +      1. The peripheral request id (see
> > +         include/dt-bindings/dma/loongson,ls2k-dmamux.h)
> > +      2. The physical CMC DMA channel (0-7) that is passed to the real
> > +         DMA controller
>
> Do you have restriction between request id and channel? Does any request =
id
> route to any channel?

Yes, according to the description of this register=E2=80=99s bit fields in =
the
manual, DMA channels are not mapped arbitrarily.

We can broadly categorize them as follows:
1. First, most peripherals that use this DMA controller request
adjacent DMA channels (TX/RX) in pairs.
Let=E2=80=99s take I2S as an example.
Bits [17:16] at address `0x16000138` controls the I2S DMA channel mapping:
00: Channels 0, 1
01: Channels 2, 3
10: Channels 4, 5
11: Channels 6, 7
2. The SM/DES/AES module uses only channels 0 and 1, corresponding to
the bit field values 00 and 01, respectively.
3. The can/adc module is single-channel, so each bit in the
corresponding bit field corresponds to channels 0=E2=80=937.

>
> Frank
> > +      3. Bitfield representing DMA channel configuration that is passe=
d
> > +         to the real DMA controller
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/dma/loongson,ls2k-dmamux.h>
> > +    dma-router@16000134 {
> > +        compatible =3D "loongson,ls2k0300-dmamux";
> > +        reg =3D <0x16000134 0xc>;
> > +        #dma-cells =3D <3>;
> > +        dma-masters =3D <&dma>;
> > +        dma-requests =3D <22>;
> > +    };
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index b021fb623446..dc976938c58c 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15344,6 +15344,7 @@ M:    Binbin Zhou <zhoubinbin@loongson.cn>
> >  L:   dmaengine@vger.kernel.org
> >  S:   Maintained
> >  F:   Documentation/devicetree/bindings/dma/loongson,ls2k0300-dma.yaml
> > +F:   Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.ya=
ml
> >  F:   Documentation/devicetree/bindings/dma/loongson,ls2x-apbdma.yaml
> >  F:   drivers/dma/loongson/loongson2-apb-cmc-dma.c
> >  F:   drivers/dma/loongson/loongson2-apb-dma.c
> > --
> > 2.52.0
> >

--
Thanks.
Binbin
