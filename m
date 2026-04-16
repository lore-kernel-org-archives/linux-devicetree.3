Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7400E1CAA78
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 12:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776343510; cv=none; b=tcYX8YIe6+IqvWKyw0q+MdWABwi3qgVml5t2mSBGDN4m7AG9NiMz8bQK4XBeXoY/N+nzEf33iNSIpzheDPjtp/8gSFdUCEEXld+oDiZ1dUyp146s1hfwo+cOYA7qy974Hx78eV5n43Km/vfeiWf5k8UfL8Iiw60+Nd+bdT1PaZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776343510; c=relaxed/simple;
	bh=4kn9I0bcpQj2uVpf1c/P1i5ST8RdY7n9EFWCzmeUKtc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tqAoFfXz2VjLBWdXw2xS0z2Pg08sljdCzZzi6IWuj4cufiK1Lvdp8CuKRCEbD5ESNE5lCELieiOKUgq2yy7PHhlbtgOsIoHAQK1Bro/XAZBOFVQygOQVEZUtqXO3UMt+P2XfLu31fKeiV09hl+zzSbrPtRjpd7rafNiuGhy9L3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-60fea0840f3so427534137.0
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 05:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776343508; x=1776948308;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6Trmvc791/1rDJLy3WyaJKC+o+3NUld8T5eNLrCZnc=;
        b=krgOL/XdHy1G/B7+4dghy2qv0W+BP2n9cooKC4CS0Ipoy6b6hu6y8xnUPfTInDVL3d
         f0EY85eSyfmtNU2h7axbrIbRhZ7gs5aakJWfpgqPWlZxa4CxJ/IVDLJd9v47df1RRDkH
         KObebdWJp7jnTuHxewkBzvSM5eTXpOwjcdez+EV2ayC4jXf77m8wmKS1oQx6gYEhXtk4
         42ZNteH0lt+ZaxHli9FsKAPSwmaWzROnYs9I4EXuxYJCdw+XXOCT8sT9eygh8/rWPkFO
         UvGVdJhgYpCuP0xoNudLSiYlFmcw7h5DAi/RcziGp3LHMAg7g0r9PgkXV+0OYLOwepoC
         Wunw==
X-Forwarded-Encrypted: i=1; AFNElJ+GaG1QHaFOQ14Tf3BKl4NsX+dzH5mUsEl6FFNz/CmQqlP6rKPepXTDC8KN8yH4nFYP1l/65v6AP/WK@vger.kernel.org
X-Gm-Message-State: AOJu0YxszmwbyHlONgbrVqRTA0/MgQaxdRcU/O1XS2uJHKibgGotppVe
	qP4KKIEHxJFg8tD2mQ0QcCBPpMhLKaVqyPL3XpQB/hHukD6wuJ59f1OGkI/GOMlu
X-Gm-Gg: AeBDietSNAjwOquXSQsw0UoqPEyt7YkdU48y6gOAbSpAYICXmUPhLKJC7RFNqPp5GBI
	tFEIbDw7JUwQ9CXUlkofXAH4KF2f1SjcGxeQJklRH87+5z8EG8TjafeTLIS7x1YSk9YyF+MFYA9
	1AbDnCu46Q0NIkP0dd1WSYgUrt77VV3jzKuKRzHQBTrrnrEvcKsfEqLmnQNWiL7Rp0AKIqy+wOJ
	hkpgsgHGQag6gNNeobHoi9yuCfo4tGLWvYHJ4aVMnYqCRFgfyGurnikwWjxubaYcEtg4YOJy37y
	c/Sct2ji7JEZJYByoqqocfV1tpbYLm3eNxccDTHlqpk/f3dHLIsrSQWZBKnus0ZAQA6HKzzQdH1
	GzvEhQIbl0KpnQjWAUIdi+CoWfuY/EhGJ9n/Uv9PiHT/ETI4Uk7YHBcgCTDopYZDmGnJBsAlIJu
	ukWQV5BT23VeKS/FS0NtUAZ3CM8bWbSH5Blg7BEYn2kAtTSN6GklYUo/ZObPGrZBhC6rS+Xwo=
X-Received: by 2002:a05:6102:419e:b0:602:afbc:ae78 with SMTP id ada2fe7eead31-613ba7d0ef8mr1373100137.2.1776343508286;
        Thu, 16 Apr 2026 05:45:08 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-958656c0b4dsm2176074241.10.2026.04.16.05.45.06
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 05:45:06 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-60579e72ff9so396777137.1
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 05:45:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ucdnM3uuBO7x7/89lMPJ+byKqfJ5kZa989zAii6qSXJuqknYI2zeMp5q7qQy9bHFX/c9i0U0xhPSn@vger.kernel.org
X-Received: by 2002:a05:6102:3584:b0:600:d0f:bacf with SMTP id
 ada2fe7eead31-613bc3401cdmr1332642137.11.1776343505953; Thu, 16 Apr 2026
 05:45:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-7-phucduc.bui@gmail.com>
 <20260414-funky-sincere-polecat-20b0bf@quoll> <CAABR9nEKGSRNp=eK=ZHf6-MNsj=6cDCy1YdbzSPrHyuc3Ux0Ow@mail.gmail.com>
In-Reply-To: <CAABR9nEKGSRNp=eK=ZHf6-MNsj=6cDCy1YdbzSPrHyuc3Ux0Ow@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 14:44:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVPbcz4rF8ojEcvxp1NaM2mbQ2o+HZLwnnjNnX8uHf4HA@mail.gmail.com>
X-Gm-Features: AQROBzAlwTEokj2EdisJZZId_dsgmifb7t182C9EYzjoqr7qTm3MDCvnELzLUhU
Message-ID: <CAMuHMdVPbcz4rF8ojEcvxp1NaM2mbQ2o+HZLwnnjNnX8uHf4HA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] ASoC: dt-bindings: renesas,fsi: add support for
 multiple clocks
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, kuninori.morimoto.gx@renesas.com, broonie@kernel.org, 
	lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bui,

On Tue, 14 Apr 2026 at 12:41, Bui Duc Phuc <phucduc.bui@gmail.com> wrote:
> > Flexible is not allowed. Provide reasons for exception.
>
> I understand and will remove this approach and replace it with
> explicit valid clock combinations.
>
> > This goes to the "clocks:"
>
> Understood, I will move the description to "clocks".
>
> > > +    minItems: 1
> > > +    items:
> > > +      - const: own
> > > +      - &fsi_all_clks
> >
> > I don't understand this syntax.
>
> Understood, I will drop the YAML anchor and use explicit constraints instead.
>
> I will update it to the following structure:
>
>   clocks:
>     description: |
>       Clock driving the FSI Controller :
>       - "own": Main FSI module clock (must be first and always present)
>       - "spu": SPU bus/bridge clock. On R8A7740, this clock must be
>         enabled to allow register access as the FSI block is connected
>         behind the SPU bus.
>       - "icka" / "ickb": CPG DIV6 functional clocks for FSI port A/B
>       - "diva"/"divb": Internal FSI dividers for port A/B used for
>         audio clock generation
>       - "xcka"/"xckb": External clock inputs for FSI port A/B
>         provided by the board
>     minItems: 1
>     maxItems: 8

'move the description to "clocks"' means:

    clocks:
      minItems: 1
      items:
        - description: Main FSI module clock
        - description: SPU bus/bridge clock [...]
          [...[

>   clock-names:
>
>     minItems: 1
>     maxItems: 8

and:

    clock-names:
      minItems: 1
      items:
        - const: "fck"
        - const: "spu"
          [...]

But this imposes a fixed order, and would prevent optional
clocks in the middle of the list.

So you may be better off using a similar description like in
Documentation/devicetree/bindings/serial/renesas,scif.yaml

    clock-names:
      minItems: 1
      maxItems: 8
      items:
        - fck # Main FSI module clock
        - spu # optional SPU bus/bridge clock [...]
        - icka # optional CPG DIV6 functional clocks for FSI port A
        - ickb # optional CPG DIV6 functional clocks for FSI port B
          [...]

>
> allOf:
>   - $ref: dai-common.yaml#
>   - if:
>       properties:
>         compatible:
>           contains:
>             const: renesas,fsi2-r8a7740
>     then:
>       properties:
>         clock-names:
>           oneOf:
>             - items:
>                 - const: own
>                 - const: spu
>             - items:
>                 - const: own
>                 - const: spu
>                 - const: ickb
>                 - const: divb

+ the above making it stricter.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
