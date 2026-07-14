Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71D613B584
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034920; cv=pass; b=L41wkDKDmMZoE85MgW91+ZgSESDRgxJDHmOFNiqKVkkOSIph0TWzLf/mdUxBJQnRual9uvbAi+yOBkdM/7S4j43rmzXjrgIgnv5xxAXXFP+9DiXUmWf1abwPfnt+BA241jb8+5zGu3dAvFBaZwGWFAr91oUYYRQioaryPnX8xaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034920; c=relaxed/simple;
	bh=XEp4xPrufFEiSkrjh9AXuD4jVVMbyf5wsJtN2q7RBEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UrDDRHI7ji7xpUL7GLZK7HLVUB+xk77uWSdDmHWj/GS1OtCSOjA76SkPDdmty2x5eAsQiHCGMoA8vYiALzkGBNkZZH26poCX43xv8XqUv+2VZTdKg7CBmjWa0LzZtXbln1aleViNNnGycOaUlnFxOiIkoYeiMzXGNcUffGd3A6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SaGz3NUB; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SaGz3NUB"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so31464615e9.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:15:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784034916; cv=none;
        d=google.com; s=arc-20260327;
        b=E/oECXUCwSe50KekBGj36ACY6VYctpuBbq836J+ZpbHalWI+rvd83eme3MSnCnQZQM
         /yXL0+yKAehZceuTe5VBKyJM6o0uPMqZaGea4K6aDpQ0Cecp/G1c2G/4NlpmU6xfCa5n
         LW3q3xAHppFR0Or+wIMmt6QJuZQne/FT1dBMen9Eme8FUHRsUiTgV/ct18AlYimmUx3E
         ukkGcF5dPQfexSA+i/IWcxQmu2xC0MIkcflsr8S5KuFrMssaLyNODp7fjic2DbIFqJys
         nIPNi/WDqNUWXHNOHRU6hkzYp2D1x1hbBwNu4N7F3guAbs2ut73+sux3ed/zL1xN5lKP
         cHkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zYR8riHhwHFuYojsg/ml0oqHNKKCoDuF/KqtRlzn4Dg=;
        fh=2KS9kKin+HEcEILnRMdaiNS3VGxDfkCQ/D4MoiOf6WU=;
        b=LlIMEl0XnZ1x0DLyfkyTRAdQZM6ShFEnS6ybd7ufBAngr7joOcFnvqSRBM1kwm4r3m
         wPg45f4asCpQ5/mI2lMWk8VqUezrJh7lVPNXsqr5bts50vycDNVSjc7/vsTA09LYwOr2
         S+Kq10ieeHPfoUXPvUdZ9gd0vs9CJv/cKRYCjFz/9a/b7S+uJ/n5HAVbZZVkan/Wnz3U
         pbE8jkHvASMxFbKo0s8YdcEFfxzqoJhAyeqbpjCENk+5gb2/5HE6VoP4GJNAlWcNLjWD
         FppR7bOLzUjZ21T0tdFPjZ4NmcUK6kn9bOG/uKI4QmV2u8ee9SdaYgCVyzwD6vyQErfY
         TgVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784034916; x=1784639716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zYR8riHhwHFuYojsg/ml0oqHNKKCoDuF/KqtRlzn4Dg=;
        b=SaGz3NUBQ2GHG8xCmhlhOvvjGUghtG3Ipcsm6tfITrC8ZZnP7nTePufsvZ6cflZpod
         QUizEVUcGU6d3lZddyIMOIv9O1IQh8dsIRjpP9mwPudguyeCdMMrrclFFNEtEBl+AVAx
         gNKfvAEXdo0joezZNbM5vjDxpubz55O09Hq7NJ3t4sGR08aZSdMHP/c/inb9myiKPSdm
         17NC6765bfaG2+JZuS+rXZOQ4WVUICc3rxVqNp+xviP/1lpldG66Be9oCvjI5yzHjtn3
         0rAOq9sF66RKv2BkT/+ls8+LNyuEvHybhO6ch5QhudaEIvhozGg2zYqQfsnytjIhsH/C
         mBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034916; x=1784639716;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zYR8riHhwHFuYojsg/ml0oqHNKKCoDuF/KqtRlzn4Dg=;
        b=A1kFUWmLTJ2+oOqce2TsSkz3KIV27QtjIRhP1jry+e2LrMeZXdtYWWwkkKskkqP/9S
         A6CUtqKqsynRK0dPVDqDStraafcvlPX4hKhpUHFUVZJz+cLOLOHXSCrNsC3HnOe2eBwH
         z/rvJ02D1SQ8JygMw6uFfWQ76R4JcLD/Efm5RfWm8koA2wDCrpee8NBwtCw12Q+tjnwP
         V1mPEdAF9PPhc8PM/PofBZ4hCf9sRw20pYqJ3D5t4PP6IZ+ubVoArcOsN62cOUMcVZkW
         yc8SqguI6F2qIgPg3EwwZGzjegSHSCF9KPvoRA1URd3r4yz6pEE+6jUuO/S+vHkXmzBS
         v2Bw==
X-Forwarded-Encrypted: i=1; AHgh+RoYnE6R5ZjHBiew2XA1PSG9o9XGiEcq7Ukq81BUGBY7OAZIWdlBolGPmGtwpgObI55fwqrNsJ8CbTHi@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3B1xhHQQO/Vv1NKZm/Owot9RX/ozaQck3x5IWecVgysuKmggc
	iixrv63XwqI+oIlWQu658LjPTIN55X1ATDWMlJTh862XSCIff0xDPaEyxiXawUWExMHgGePPYqh
	PC/K7mw9VJIjE9hD55TggKUdH1Ddwopw=
X-Gm-Gg: AfdE7clJWxryHr13iXj2TQ/w4vvNTohdoCxGTHLwcV1eRWmeMVuPwL9+Qe/zLzxrkBf
	T6OuJKv1Ifb62UwZKArkfpcSJft8V2MaRVgnTzMMxJEF+OC4ZEzxpOBAX9401tZnfrrnnw5UjS/
	n96ih1Z3SwJJl7uAtI/N5DB8kv+id8RAQy6IIAmTlB567YSkujqQF5UCSgunhaBjFlLsqWbGUPO
	FfRQjGHpwtIpgqrbgOw5K9F4chrgtm4Em1Z9QNDspme7wQgD0mK21Tg67iJN7jlOLMF6VYdbJ72
	eON1AKy+J+SEVhJpiBCK0g+eeRyUWl3pD5iM5iCM/dG1lKEJWwyyjsYiz8k=
X-Received: by 2002:a05:600d:6413:10b0:494:1cdd:4f9e with SMTP id
 5b1f17b1804b1-4941cdd5035mr50422985e9.31.1784034915742; Tue, 14 Jul 2026
 06:15:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260702123112.161160-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXYpDfoRhgfhqeU4_acGQj7f4ivEdB3Ms6SKeeSwY5iLw@mail.gmail.com>
In-Reply-To: <CAMuHMdXYpDfoRhgfhqeU4_acGQj7f4ivEdB3Ms6SKeeSwY5iLw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 14 Jul 2026 14:14:48 +0100
X-Gm-Features: AUfX_mxf9CoAWS1OaHlxkRnP3RC1vp9ZjYGgKTNfss75dU2ZLfsEhv632kdc6DM
Message-ID: <CA+V-a8t1TbnD14s-d=UVTL58jWA9Sxcyb6mt9tfgAMBUkoJmRA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 5/9] dt-bindings: watchdog: renesas,r9a09g057-wdt:
 Add SYS syscon support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Mon, Jul 13, 2026 at 4:55=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > On the Renesas RZ/T2H SoC, the Watchdog Timer Control Register (WDTDCR)
> > resides within the System Controller (SYS) block rather than the WDT
> > address space itself.
> >
> > Previously, this was handled by including a second register range in th=
e
> > "reg" property. However, this is architecturally incorrect as the SYS
> > block consists of two distinct regions (0x80290000 and 0x81290000) that
> > contain registers for multiple peripheral blocks.
> >
> > Now that the SYS driver provides a unified syscon regmap, introduce the
> > "renesas,sys" phandle-array property to allow the WDT driver to
> > access its control register via the system controller.
> >
> > Mark the use of a second "reg" entry as deprecated in favor of the
> > new phandle-array approach for SoCs that require WDTDCR access.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2:
> > - No change.
>
> Thanks for the update!
>
> > --- a/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.=
yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.=
yaml
> > @@ -48,6 +48,17 @@ properties:
> >    resets:
> >      maxItems: 1
> >
> > +  renesas,sys:
>
> In Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml,
> the similar property is called "renesas,sysc".
>
Ok, I will rename this to "renesas,sysc".

> > +    description:
> > +      System controller registers control the start/stop of the WDT, a=
nd halt debug.
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    items:
> > +      - items:
> > +          - description: phandle to system controller
> > +          - description: watchdog IP instance index
> > +            minimum: 0
> > +            maximum: 5
> > +
> >    timeout-sec: true
> >
> >  required:
> > @@ -73,15 +84,29 @@ allOf:
> >            minItems: 2
> >          clock-names:
> >            minItems: 2
> > +        renesas,sys: false
> >      else:
> >        properties:
> >          clocks:
> >            maxItems: 1
> >          clock-names:
> >            maxItems: 1
> > -        reg:
> > -          minItems: 2
> >          resets: false
> > +      allOf:
> > +        - if:
> > +            required:
> > +              - renesas,sys
> > +          then:
> > +            properties:
> > +              reg:
> > +                maxItems: 1
> > +          else:
> > +            properties:
> > +              reg:
> > +                description: Deprecated. Use renesas,sys to pass the o=
ffset
> > +                             of WDTDCR register instead.
>
> the index of the watchdog IP instance?
>
I will update the description to "Deprecated. Use the renesas,sysc
property along with the watchdog IP instance index instead."

Cheers,
Prabhakar
