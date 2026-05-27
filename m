Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868CF3D5258
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 12:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779885907; cv=none; b=szfy82JsLqyltUFy2seilhESBGdE61O5o7yWd7/oBXf89KNnriSDvxDvpy7xp2zIrZSnXPZM99BR49mp00y0OVp/0aUVOG73USLnSTYYKFtSb31YNsYWfhtI/zXaP15WxLy0DWGBg4GDLKIoz3S0tZeQKeXL77JqoYj/NXSt448=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779885907; c=relaxed/simple;
	bh=CHmi2tzKRp9iEkWNt7hiYl4WAuhMTowdb6VPQfNs0nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CIbyae5qMOG5c3AgUdssEDSKOGwz3MmM39dqL+nTGJhvAFwxr48/mN5+ijvysQfiPPit9m0Ac+EaOatHVZexy+SzA1HhHXIKkOuIyqwfBJAT4AobU5sreZiYLDOvG+PCnyVs2IOvRx40LvGY+Uqw2TEufGEXaQuU6W1L5ceemIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-95fa7cd1392so8880677241.2
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 05:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779885904; x=1780490704;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfMIenARBAqpHOVTmcafwSvjzdDvSTCw5oC80BE5U+Y=;
        b=Q/FYmVvSItKh+jFIMEGW4Nv2vUMVPFZHuNxGlYTZ+wd/CSa7RMACTkqedjKx9KTujo
         /Pe2GbcH96PlGDdjNSAclrctIsrKMWiHBOS3ysx56ZnhCwfPRzwd2otS3NJXTkeUpkpt
         qHzHG42Jq/FaRnAMbZzALylNojn/rGzc2K2fq3E/GeCgMIMHHjbS6ogahVBMwWgXYcrD
         T69xtFjJjitJlyf2NtWfVz4udj306V1cj1SOsHsYxHpa89w7xp3uZzr8iZ4CcmAvuhL9
         9ux3tu6ceTkkL7U9u0yQpBQVcAuXxflxKYG8xsFZivZShwTEM84Ld5zg03Jkw7aH8Ddb
         5lbg==
X-Forwarded-Encrypted: i=1; AFNElJ/cDlmZXmacr6Mb4DnmRu5Uj2kz42RupyuXrJe3RnaPI6XAQITfBzgPBJGCgZigcm4IZr3PEj8XcKNJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yydyr8X1XrI9S2FW/SQ1/rYKy7wZTVK1dlvEgjlGnAa6ubHCLFc
	Nr/He2Kt1zgwRi38AJ+XsqCSEeCVql0OzWRRYF/hFZjrL89YowNfh4DN21cCuFQ7Y1E=
X-Gm-Gg: Acq92OETB5V4WeSg06/rH9xYd7INok2XyBwCTbJgiDQV9YL1/WfqUdEIGsHOGsyySUT
	nnx/2lMsA0bui4LQ3OzfUlTp+LGOB/WWmrPeyLitTUvfl0e49KhHL3i4R/LmjQ/So54/MJsbfSF
	3sI7vEMQE+5se7eu6IRFQ/sjSl/+5ek8yu6OWeM0nZXjZrpQ5Sj1gbaA/0+FEi/qlp9N+5eIz/h
	7XUkEz0lOxe1hlwayZgue/jW4gxChIxWP6mFKj79ZcKJm+jpEi1C4aXh/FLnaKZtLwEBLgGsN7+
	nJRYFHHNz3dnB1TYkFWgB1fPkzK322F0emXMWAibzBewuJXZyWa2PrHoN9xIUaaJc9XeukFUIWQ
	JzyiybIkbaWvPT8w0AwRrh1lG1q0Zfu54w89kPDXVS/+xzemZO0qXzD0hU3jaqKySkbYdnT9ljM
	c+5LH8yuXGS5IYb5Ve8WNvjk4g5xlepHMvxy2sufI22CUJENaj/xWXIykdbrsyUiIGm6FA7lE=
X-Received: by 2002:a05:6102:334e:b0:633:d7ec:153c with SMTP id ada2fe7eead31-67c7cee3d39mr12530704137.3.1779885904479;
        Wed, 27 May 2026 05:45:04 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67ff3e499bbsm16651737137.7.2026.05.27.05.45.03
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 05:45:04 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-95fb6411e01so5102208241.1
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 05:45:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/MVJrb++Wkoz9mADx4TzQ3cffOVdBfav9Tt+Ex2SDzcaWO7yNMBLHv0Co9v87WJQB7auSx37EJEHs3@vger.kernel.org
X-Received: by 2002:a05:6102:5a89:b0:631:5ef5:8324 with SMTP id
 ada2fe7eead31-67c8d07131cmr12162490137.23.1779885903418; Wed, 27 May 2026
 05:45:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525110603.4018170-2-john.madieu.xa@bp.renesas.com>
 <20260525111920.15F771F000E9@smtp.kernel.org> <20260525-gaining-unaired-c96367a78c9b@spud>
In-Reply-To: <20260525-gaining-unaired-c96367a78c9b@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 14:44:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWUeExOnKm1=kRSr0=HVJhgyLDBAK3VqTP-LK1q0-f9gA@mail.gmail.com>
X-Gm-Features: AVHnY4JCGT6L93dKt-0-T45Be15psMBpt17wMGNiRfpFy-lZ2xPXFXW2IFtgjsk
Message-ID: <CAMuHMdWUeExOnKm1=kRSr0=HVJhgyLDBAK3VqTP-LK1q0-f9gA@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] dt-bindings: clock: renesas: Add audio clock
 inputs for RZ/V2H family
To: Conor Dooley <conor@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, 
	John Madieu <john.madieu.xa@bp.renesas.com>, conor+dt@kernel.org, 
	wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Conor,

On Mon, 25 May 2026 at 18:57, Conor Dooley <conor@kernel.org> wrote:
> On Mon, May 25, 2026 at 11:19:19AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] Strict array ordering prevents the independent use of newly added optional clocks.
> > --
> >
> > commit 3723d06ba80fe72a3e7492af52e5e54aa0f36b03
> > Author: John Madieu <john.madieu.xa@bp.renesas.com>
> >
> > dt-bindings: clock: renesas: Add audio clock inputs for RZ/V2H family
> >
> > This commit updates the clock bindings for the RZ/V2H family SoCs to include
> > the optional external audio clock inputs AUDIO_CLKB and AUDIO_CLKC. The
> > AUDIO_CLKA input is fed internally and thus does not require a binding entry.
> >
> > > diff --git a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> > > --- a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> > > +++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> > > @@ -26,16 +26,22 @@ properties:
> > >      maxItems: 1
> > >
> > >    clocks:
> > > +    minItems: 3
> > >      items:
> > >        - description: AUDIO_EXTAL clock input
> > >        - description: RTXIN clock input
> > >        - description: QEXTAL clock input
> > > +      - description: AUDIO_CLKB clock input
> > > +      - description: AUDIO_CLKC clock input
> > >
> > >    clock-names:
> > > +    minItems: 3
> > >      items:
> > >        - const: audio_extal
> > >        - const: rtxin
> > >        - const: qextal
> > > +      - const: audio_clkb
> > > +      - const: audio_clkc
> >
> > [Severity: Medium]
> > Will this strict array ordering prevent the independent use of the newly
> > added optional clocks?
> >
> > Because JSON schema validates arrays strictly by position based on the items
> > list, if a hardware board connects AUDIO_CLKC but does not connect AUDIO_CLKB,
> > the device tree node would provide an array of 4 clocks where the 4th name
> > is audio_clkc.
> >
> > When dt_binding_check evaluates this, won't it check the 4th element against
> > the schema's expectation of audio_clkb and fail, incorrectly rejecting a valid
> > hardware configuration?
> >
> > Should this use an anyOf block enumerating the valid permutations of optional
> > clocks to avoid forcing users to write incorrect device trees to pass
> > validation?
>
> Seems like a valid question to me. Can be solved by making the second
> last clock an enum.

Calling them optional may be a misnomer: these pins are present.
Typically we provide zero rate fixed clocks for such clocks in the
SoC .dtsi, to be filled in or replaced by the board .dts.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
