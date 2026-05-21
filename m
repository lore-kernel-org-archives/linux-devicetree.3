Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56C736E47F
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 20:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779395942; cv=pass; b=aJhJKbjJCMmcq2l8vzTKrU5Ha+Vw+y5G5GUCJl1nj7gn7M58OgIPyRK6EtpoJuNiPyRKM4W5V3cDKnJDI50SnA7REX0CJBoSBRx8BBFZB/H1BWbCcsNox72h46mAQe8JkmYWAlj2kyDklKDl3foExHA+xBbAoJKQ33uWmd/SocM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779395942; c=relaxed/simple;
	bh=7WguGWw3OMqpoY1uNfi3T8L8p63iIWg1hfU/ZsmVvjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tBQCX5Gcw6jMdFEoYb0ZOCn9dsnKRwSjx4UCl/fd1Y6nDPgeSVoxCTPNzRoGvT4ItfqsX+RbzhPlqnKI58Y414EBL5hsR4ZA7QtgPAbeR/7bKVleYqpjJs06SMTQjm5JoNim2Zyez6hqgx1LbLVFSzlT6rTiwlhnKPqrt07ywnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p7+Q7yPH; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p7+Q7yPH"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bd11a3729e8so1037608666b.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:39:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779395939; cv=none;
        d=google.com; s=arc-20240605;
        b=MsUVH0A9XobGIxNtEKBtdLR+wNcqSlMBi9dEQrd/TIiEJYPg3x3zALqi92MZFffVuO
         IIneqG7o9o93VkoSs5ST2SM8wLamYE2JfHzprxJHXPGL64QLQ5Gwx63v0BYFvyfhbejc
         gQNu5FQTi66z2LstT/LBWRMXIPiVgLT7flIjiizzJ6jdrKHgXWiu4QG2JoBRZdYrhC0Q
         Qj5b+CijgwbqeE3o1O2YSZl/ivDuv0rDx8/YEgFim9S3HxGnN+CYY4gRdTcETl310Mrn
         NPjSiCnBDafeeCBJeO/D/Q19UWidqdtv5g6TK8XQUYfrE0XbzwU8Rh0aGPNpguOnUXzd
         1FOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fW1oXwCiens3FCanTelYWJicgu3a4rD4BDnCOzooE1I=;
        fh=HM8lh+AFL3ifREMATGhJB4dW/uAQlrknJuDicGuubxc=;
        b=CiS5tr5A3zk/NU+bEZVrU0duSjYzbpDuX6q76vzzQW8ipG3je6k5FAxzSitAwYQSZB
         aeepbJhCZfrO+5BSm+r7qVuupcpJOfQ2Qg5z2xI2iWe/HnsUOXMIDJoDTETyLbIjlghH
         6zH9wagrnUFaRa6C0xgEN/cFkb8eK3qMr1aPGMENpYImxODb5o1Ag89SdaWttxlCep3I
         EcQuDbY9EcvPT+jYLDPOIDDMZ0ft0AEUlwABv9YcJ7j0F51wyE4gRemWpm3DSy6gVWcq
         jH/3f4LxgfMhqYcC5/Wor8cgKj8ezq9ld6bP+4QrNu3of5wQGQAcECPfwXoH6HAOm/Ft
         DaFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779395939; x=1780000739; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fW1oXwCiens3FCanTelYWJicgu3a4rD4BDnCOzooE1I=;
        b=p7+Q7yPHk0wEhCoNuUDnK+EncHe+ssHY7YE9gd6+b8quQv1QeXgGjsQwddb5fiJlJT
         Kqzkgny6n8Cwg1zLRoyREKt2NETUCI1DGF9X/FuP15/5JiMeqpROqKdz2VjRjwAz8dU1
         bbUbD7jm5eDmqnJntl8X+AT8kmjbUHtKLeehJgVAKlh3BtfT3RYAtlibC3D7+N4aYvHx
         H9Eka+JLgLq5pAaJ+3PWvVLiHkiY9/Q+G4QHUiO11fddvRZisIbBhaFpYQXq+y7in7wD
         CT76YhHW2ZxvfjBz8AXMCfwUjkWq+JEIGaCZuNaztdwXyWvTx+SIN4V56KfCemjzPYQw
         i1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779395939; x=1780000739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fW1oXwCiens3FCanTelYWJicgu3a4rD4BDnCOzooE1I=;
        b=LS6GbE2w+MlHmtY2b0uHAzttgBVQXNEceeAY3WnWo6i1Xrz/V88M9oIGkHxDAuluFA
         p3OKebaVtl138tcAcI12pyUL4kazWgZUYCiQ53A7SD6I6J6UghknNXLlLr9uL9av+Ott
         GvSJGjfLNEYZ2oVk+Dkkx7eKXlrY/o06HsbZF5j9d5jRNjDqWolcT00cGwJviirxlHnb
         DeEcU4mpyMbjv1D5EHFj6n0kNIT3WQDzVeeS/Ty8+aWMambWeoYYE/nPGPc8ku8SsSH8
         pIQ2LxYEPGjXQS+VXQSU6UcQESZhJTZic7brDt//cSUi4iIUPoeIH2qHxjjivWFfmzO1
         tw1A==
X-Forwarded-Encrypted: i=1; AFNElJ/7zEfTV3wl05I/MXurNiDL9wCujq+yUaa0q1+/BhQg05BI8YNu+xlXPXW2zLAkuJX1kviSYCevpJ2r@vger.kernel.org
X-Gm-Message-State: AOJu0YweVwUv6qtyV/pZSCEROQ8RySv3qTL3SUOjJGsV3feGgjVBEsF+
	nG3nD3e7W34ex7M4/WaVBmhQEOm1quG76ungGfrcSyDjmwyZ54O4vSXPf99/RQG3PPGVLNfgvqg
	XaZiuzs7dQ6pnVVdf6ZbG/5x2asUGmA==
X-Gm-Gg: Acq92OGGV/Bkx9hGPcVgJjplBzOxiO6bBQps7pUOe9rseSUMRd9RHMy6iKqIoQING+2
	4kPOiNoPnErE7bu+7hh56V9D/AV98dU20im1t4JuWj0dXytLajtFtm2fE8En4ZZGNLzyoHHfTyC
	UU5jt+seDzf0hdo00Ejmu84VlwaBNEFV/puep7sKNQk0bjJJ+f1NPXoPaY49UpwNq6UdpK8NKr1
	wldOjWxJHJshHPju9YCgKCrxE0ou1IWxAe4TJuVyYHQacdXgDbI0RrSjVIEmESvjyR9pMEaOsuM
	nYXnMN1TwhFpNg==
X-Received: by 2002:a17:907:928a:b0:bd2:fcd8:4cf9 with SMTP id
 a640c23a62f3a-bdd263c932fmr54408966b.41.1779395938847; Thu, 21 May 2026
 13:38:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520191943.73938-1-arouhi@sitime.com> <20260520191943.73938-3-arouhi@sitime.com>
 <48cc27ed-48e8-41db-8351-166774466a69@kernel.org>
In-Reply-To: <48cc27ed-48e8-41db-8351-166774466a69@kernel.org>
From: Ali Rouhi <rouhi.ali@gmail.com>
Date: Thu, 21 May 2026 13:38:46 -0700
X-Gm-Features: AVHnY4ILigC8YCZY8euCoRmiEe_rpzQc4MgyNgFRQqdyzkCC81wUGU1H3Wbu8Uo
Message-ID: <CALFSGupB_eRHQ=h2PzwiLE1gTvd7kZbBP+eWOVWVxapVjzgeXw@mail.gmail.com>
Subject: Re: [PATCH v2 net-next 2/3] dt-bindings: dpll: add SiTime SiT9531x
 clock generator
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: jiri@resnulli.us, vadim.fedorenko@linux.dev, 
	arkadiusz.kubalewski@intel.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, cjubran@nvidia.com, Oleg.Zadorozhnyi@devoxsoftware.com, 
	devicetree@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ali Rouhi <arouhi@sitime.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Mismatched DCO. Use consistent identity or fix your commits.

Apologies =E2=80=94 Gmail's SMTP relay rewrites the From header to my
personal address (rouhi.ali@gmail.com).  I'm working with IT to
get corporate SMTP credentials so the From matches the Signed-off-by
(arouhi@sitime.com) in v3.

> Same as last time. Why are you describing drivers?

Will drop the clocks description entirely =E2=80=94 maxItems and
clock-names are sufficient.

> Drop node. Wasn't here before, so why did you add it?
> Drop.

Will drop both xo and xo2 fixed-clock nodes from the examples.

Thanks for the review.

Best regards,
Ali

On Thu, May 21, 2026 at 12:26=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 20/05/2026 21:19, Ali Rouhi wrote:
> > Add device tree binding documentation for the SiTime SiT95316
> > and SiT95317 DPLL clock generators.
> >
> > Co-developed-by: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>
> > Signed-off-by: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>
> > Signed-off-by: Ali Rouhi <arouhi@sitime.com>
>
> Mismatched DCO. Use consistent identity or fix your commits.
>
> > ---
> >  .../bindings/dpll/sitime,sit9531x.yaml        | 145 ++++++++++++++++++
> >  1 file changed, 145 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/dpll/sitime,sit95=
31x.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/dpll/sitime,sit9531x.yam=
l b/Documentation/devicetree/bindings/dpll/sitime,sit9531x.yaml
> > new file mode 100644
> > index 000000000000..ac88f2f0b2ae
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/dpll/sitime,sit9531x.yaml
> > @@ -0,0 +1,145 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/dpll/sitime,sit9531x.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SiTime SiT9531x DPLL Clock Generator
> > +
> > +maintainers:
> > +  - Ali Rouhi <arouhi@sitime.com>
> > +
> > +description: |
> > +  SiTime SiT95316 and SiT95317 are I2C-controlled programmable clock
> > +  generators with integrated DPLL for synchronization applications.  B=
oth
> > +  variants contain four PLLs with automatic/manual reference selection=
,
> > +  DCO frequency adjustment, and phase offset measurement via an on-chi=
p
> > +  TDC (Time-to-Digital Converter).
> > +
> > +  SiT95317 provides 4 inputs and 8 outputs; SiT95316 provides
> > +  4 inputs and 12 outputs.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - sitime,sit95316
> > +      - sitime,sit95317
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +    description:
> > +      External crystal/oscillator feeding the chip's XIN/XO_CLK input.
> > +      The chip's PLL Fvco is computed relative to this reference, so t=
he
> > +      driver requires a non-zero rate at probe time.
>
> Same as last time. Why are you describing drivers?
>
> > +
> > +  clock-names:
> > +    items:
> > +      - const: xtal
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +    description:
> > +      GPIO connected to the chip's active-low reset pin (RESETB).
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +    description:
> > +      Interrupt from the chip's active-low INTRB output.  Asserted whe=
n
> > +      the device detects a status change such as lock acquisition or l=
oss.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +
> > +allOf:
> > +  - $ref: /schemas/dpll/dpll-device.yaml#
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    xo: xo {
> > +        compatible =3D "fixed-clock";
> > +        #clock-cells =3D <0>;
> > +        clock-frequency =3D <48000000>;
> > +    };
>
> Drop node. Wasn't here before, so why did you add it?
>
>
> > +
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        dpll@68 {
> > +            compatible =3D "sitime,sit95317";
> > +            reg =3D <0x68>;
> > +            clocks =3D <&xo>;
> > +            clock-names =3D "xtal";
> > +        };
> > +    };
> > +
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    xo2: xo2 {
> > +        compatible =3D "fixed-clock";
> > +        #clock-cells =3D <0>;
> > +        clock-frequency =3D <48000000>;
> > +    };
>
> Drop.
>
> > +
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
>
>
>
> Best regards,
> Krzysztof
