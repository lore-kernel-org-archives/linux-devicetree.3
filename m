Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E57416843
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 18:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785868207; cv=pass; b=aHMY3Eef9ZlSb5A61mLmYVDHmK7O3xD/C4vGjAtxCvni+ZqCyB/Zj8wkXnVjbSLIBrXc2oS1wCMu+sqA4IdOFFGVmnvI7pdY7aIIe36TzURwwD4Y3XWJV2tavfIEWw3FWV1XxTMwHmD3wczdNrI/fqfEq45UeDdJ43edJt5Zo7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785868207; c=relaxed/simple;
	bh=YR/o/LTpemAGDYJOLfPVkvZYIaS6LupInQCMHbfOBQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DjyMgUukL1f9A7nAx2PUo5SPWBRCVp9zsnNiEqaFDGHS/N/pnthKDKSz5p6/pTqhS1JLmQkMCuKhFqCGyhmpsFgvoUjqb0oGRNrE8cCkHWs2tvtkeF8Hm7esfLOKLF8UdTKgHED4m1HaPG158f0bYdKfPGobiioZC4aOpc73FGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nVEUrt8h; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVEUrt8h"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c15b51ba80dso2872166b.2
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 11:30:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785868204; cv=none;
        d=google.com; s=arc-20260327;
        b=hT6P0AkRqiZn/e1cd15eywr5Z+OnL0P/4OQASzL8V8Vc2rmAJQnFN+vhn7MVDJUOgZ
         m03kGkKmBi/bMl6vP6mlXJdouiWK4Qp1QmDSXVGMdgMT7H9bGz/fZwx7HsUKmZrchJnC
         SUgrRIk8cQNDYfO4BV7nqhbxjukBWl0uAin0l6ZBaIqpwcx9ue9aX4RBbRAjw3Kmh2MD
         WbXauffc8Qxhmo7fJFueKzxr5RdS/lNB0x9WB+u6uzJmxPQD27/mQiU+A2dJiRX9hFhi
         dw/MCUOm3/Dzl1bRsR552UyxUFqEBJnJaunWRc4Ebv2M3TXEzr+ACo9jCGKWEy0YuJ1J
         Z0Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XGjeFPew3WY1hoWUdVOxW+gqoEqKrPAbmGn8EETaFp0=;
        fh=9JSYCo8tkNSR1en0m9kVB3B0vNa05J+3PfuWG9Lilak=;
        b=TYvuydQF4Ee6p8/xqWjqManbsqoloPHz+S9+Z35rI2hqIJ1Pbl7vRoXyoY1ujp8vhZ
         5RTvWFo5zRAUYdTI4uj3O6cy5JLfdZpZtGuP2NkkbwSzjHC8C4claEnjzG8C1TqTsKd0
         V0Vsw/sFq4d3lPEjPmME8p7iNV9QGiXdgH0tknJKuywrgdci9wuzX+WmCxTJJ+d1C/QF
         q6m5q4ewsPWS6nttjr86DEQawOo91P69o1KSkgn2UTqm4wQi994sKkhQiBe0yzRcrqV2
         jfhAT6FXF72nXcATOmZ8xyEXUKsrMaI9qI/G7OaT2GKDp5/2uLoxzh15dd/MemjjrUcd
         q/5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785868204; x=1786473004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XGjeFPew3WY1hoWUdVOxW+gqoEqKrPAbmGn8EETaFp0=;
        b=nVEUrt8hJHpt1stGHoiAYCUbZwPi9u5XSS5haDxHedZSAu/S0wbf8T1cQZag4UYeyz
         f4mJ3gU1Tgg8jBtgq7SUsoBHjCFDZtXGvmAZz+Bw+LRTTGvCHOiFIILiqN7qsqds7V+p
         PBpxADjYoDKBwnlAli6/SjR5//Ig/qt/4eDMbK135rXnTv96+faT+GD8HO4UnbEuJXP/
         AaaBbeohpt2xF4/iriteDON64asfErcmISPkbeWKH5qtNqA3A6Sednt4EPABhYVGiD6f
         1SgEcTkuKtpPY0RqV0T5EzbYk5zRr321ox7vSe067brmcaNXxn6F8tXM8ZNfhtRUhJWj
         ic/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785868204; x=1786473004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XGjeFPew3WY1hoWUdVOxW+gqoEqKrPAbmGn8EETaFp0=;
        b=OdKKiw4kWzBU7w2ybIXq4G9yXl8A+7/U2NILoS4lriPA3h6Qj8bm/fQSVI0PxNQwR3
         +XPqJNRu3k+wpvYqTJgH/YNz1wapDHbavJrlNB4ugQbsGfBAUHijB5OUADgzvw0JYyFU
         OfAhD9U4dbL6Vpgv1XUToLi1KejxnAnW7Yld7Gbe7H/Pjbj+V9btBuqBX+BpBvq62iGy
         /ZBX0yWkbpvdVocRdea1E9QjXMG+vOI3csd2KlKxA+9ZkiLxDqdwyyRVdMzFg/bROoOw
         OaSNNxcxvjmOocreT4CB763EqdV7HXnXyA72ufx2w+3pMCNzczzdqW5w75ASIF4mTjO2
         RA+A==
X-Forwarded-Encrypted: i=1; AHgh+Ro0/cYbEiQh0jVmnysnkpL+RBN7a0axENJMdsKU0bd9voSEbT40qTIE0UiR2uQ7dTaMM8hfWoUA0NSm@vger.kernel.org
X-Gm-Message-State: AOJu0YydkmBhwYP2nVey/PlWIFv0heWDNI7K53D4Wh4WKag0w9enkkW+
	Z4CqZSJi4mV+fc9fvaSgFvdfSfzOs1unLCdRO7oltzDiVfSQeXh8NdWMgX56aW2sfKCTN3VMtHX
	81ya2ZMAifdgMh6A/z5u6kQm7PY54fYw=
X-Gm-Gg: AR+sD10x3URjtT34jUog+ZiHMXgLBuqCS5RLQaWKJFGcq0BgdXCOfMMPF8LSBjGoT3x
	3qIzZKT8g3jgD+PIeIiQ9Gp0OMctFg6MpG3F7Jpm7D74u4aekSnXkMCVXYtzMUitlYroH/Fcnr1
	fmHQFsP9foZIm1xTTeN3tvZwM/bHZNDFWMcBhkiC0jXb/rzxBsDbx7TncC6kWytLrKEAqsIIegg
	ZXGGpwgHY3M7CgWoCDTXPSw7xTpuJwOk6UOfqkIcRQpT3cZ4QWAQ7gXRrUuu2Db/tZGYbVVm8SZ
	gU06FXDO9RbZ6R5gG5+XoG0j9vqpGxGU84XXkV8sqhOD3TNBeaihkr5dl1JAupMH6tzYG5P6gZI
	PA58=
X-Received: by 2002:a17:907:a0cf:b0:c12:2aef:af2b with SMTP id
 a640c23a62f3a-c2039d63cb3mr13321866b.4.1785868203728; Tue, 04 Aug 2026
 11:30:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726-ti-adpll-v1-1-86f6fc936507@gmail.com> <20260803215059.GA638187-robh@kernel.org>
In-Reply-To: <20260803215059.GA638187-robh@kernel.org>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 4 Aug 2026 23:59:51 +0530
X-Gm-Features: AUfX_mxwSCENiGM3gLSFs_OrQ5dfHB7ft3kTamvikK_i48EKp9jKQ4sMVne1v5s
Message-ID: <CAOWyW_68A9xKd9nrTM4dZxgdNEypT60WHnwOYow-i99eqcUbvQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: ti,DM814x-ADPLL: Convert to DT schema
To: Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
	simona.toaca@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 3:21=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Sun, Jul 26, 2026 at 12:17:47AM +0530, Bhargav Joshi wrote:
> > Convert the Texas Instruments DM814x ADPLL clock binding to DT schema
> > format. Add 'clock-output-names' as required which was missing in
> > legacy binding, as the driver (clk-adpll.c) mandates it and fails
> > probing if it is missing.
> >
> > Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> > ---
> >  .../devicetree/bindings/clock/ti/adpll.txt         |  39 --------
> >  .../bindings/clock/ti/ti,dm814-adpll-clock.yaml    | 108 +++++++++++++=
++++++++
> >  2 files changed, 108 insertions(+), 39 deletions(-)
>
> > diff --git a/Documentation/devicetree/bindings/clock/ti/ti,dm814-adpll-=
clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,dm814-adpll-cloc=
k.yaml
> > new file mode 100644
> > index 000000000000..7f551dfca030
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/ti/ti,dm814-adpll-clock.y=
aml
> > @@ -0,0 +1,108 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/ti/ti,dm814-adpll-clock.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Texas Instruments DM814x ADPLL Clock
> > +
> > +maintainers:
> > +  - Tony Lindgren <tony@atomide.com>
> > +
> > +description:
> > +  The ADPLL is a register-mapped clock generator found on TI DM814x So=
Cs. It
> > +  provides multiple output clocks from two or three selectable input c=
locks and
> > +  three to four children.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - ti,dm814-adpll-s-clock
> > +      - ti,dm814-adpll-lj-clock
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#clock-cells':
> > +    const: 1
> > +
> > +  clocks:
> > +    minItems: 2
> > +    maxItems: 3
> > +
> > +  clock-names:
> > +    minItems: 2
> > +    maxItems: 3
> > +
> > +  clock-output-names:
> > +    minItems: 3
> > +    maxItems: 4
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - '#clock-cells'
> > +  - clocks
> > +  - clock-output-names
> > +
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: ti,dm814-adpll-s-clock
> > +then:
> > +  properties:
> > +    clocks:
> > +      minItems: 3
> > +    clock-names:
> > +      items:
> > +        - const: clkinp
> > +        - const: clkinpulow
> > +        - const: clkinphif
>
> This can move to the top level and just 'minItems: 3' here.
yes sure
>
> > +    clock-output-names:
> > +      items:
> > +        - description: dcoclkldo
> > +        - description: clkout
> > +        - description: clkoutx2
> > +        - description: clkouthif
>
> You don't have to document the clock-output-names.
>
Got it. I will drop the item descriptions for clock-output-names.
> > +else:
> > +  properties:
> > +    clocks:
> > +      maxItems: 2
> > +    clock-names:
> > +      items:
> > +        - const: clkinp
> > +        - const: clkinpulow
>
> And just 'maxItems: 2' here.
>
> > +    clock-output-names:
> > +      items:
> > +        - description: dcoclkldo
> > +        - description: clkout
> > +        - description: clkoutldo
>
> And drop. Or maybe just 'maxItems: 3'
>
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    adpll@40 {
> > +        compatible =3D "ti,dm814-adpll-s-clock";
> > +        reg =3D <0x40 0x40>;
> > +        #clock-cells =3D <1>;
> > +        clocks =3D <&devosc_ck &devosc_ck &devosc_ck>;
> > +        clock-names =3D "clkinp", "clkinpulow", "clkinphif";
> > +        clock-output-names =3D "481c5040.adpll.dcoclkldo",
> > +                             "481c5040.adpll.clkout",
> > +                             "481c5040.adpll.clkoutx2",
> > +                             "481c5040.adpll.clkouthif";
> > +    };
> > +
> > +  - |
> > +    adpll@80 {
> > +        compatible =3D "ti,dm814-adpll-lj-clock";
> > +        reg =3D <0x80 0x30>;
> > +        #clock-cells =3D <1>;
> > +        clocks =3D <&devosc_ck &devosc_ck>;
> > +        clock-names =3D "clkinp", "clkinpulow";
> > +        clock-output-names =3D "481c5080.adpll.dcoclkldo",
> > +                             "481c5080.adpll.clkout",
> > +                             "481c5080.adpll.clkoutldo";
> > +    };
>
> One example is enough.
