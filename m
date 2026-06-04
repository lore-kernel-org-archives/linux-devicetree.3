Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC313369D7A
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 11:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780573197; cv=none; b=TfFjSOpSXGzZCMS9sMFQFubBD58H84F/OfhgfsHJPd1Fv+Inn8oWnENLR/709TwEraoQGCxLxkBJk9furGhT9qooMpKHI4LubsZCB4DNZbMkSrolYuuWWoEG1emDOfHgATX2Jl7IPPAL6/QE75NRVl/qSibvTy594CLEzRAr+is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780573197; c=relaxed/simple;
	bh=h7RzAlW+e/DbDaPRYK/dV7EgaMQjIr/OWSPs4s1Uyuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGV8o3a1+xzCjiLTewxXB9txsMrRMOZS6vSe1aMk2mS8bW66UAslyAYw/KdS2Hr6C1ALATfyQPz+cWdOheM5iNb1jSTrUyahPSaPLnFpvrgQ/ofz7973IRJdbGc9o9UpUcnL7QUHIY6Oi0RUhLLFdP2Opy3InCKf3TJBQs6LV6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-6efdb57db0cso160025137.2
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 04:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780573195; x=1781177995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GA1zRYlCwaY5UIVlOist2qYc6nqjPNa2Luk4uie1AQQ=;
        b=XLggUAjx0w1vinwl2Zblo3D1OBAjrm0v8N+8T/YN8C8Ypt8EROAZAdLCoLxaENMIxu
         pcY7ieiJwCIXXF8NCstMmvju/UTJQ7gDR6BpqexuleoOIjA/AniVbbxs/LdjbMZu/CFs
         EQJl+sMu8sOILzm4tmglYmViTBhLkO0BLZg0lMKUQd+UgJTPboKIG4cVO8QvpcpnxJoW
         7oUKejj0LjMyIOmshkC/t/mCX4ZWPXSoSkkZuScxUbk6w6r75C+ADtfMcCEpQG/vNMvn
         M94XrCxUxwaiCLmazElN0dJ2j4UVvVl47nuuW1PIyMniLdbDgxsliUoyU2dPqMtpz+IL
         FBwg==
X-Forwarded-Encrypted: i=1; AFNElJ8COQkz7FmNiG/81+ysesN+Ez8jYXCO86+wE8Dt+5o4KKKl5Zk3XlJcMqglnG32S3Vj/yGK7PBGSS5c@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy56KGUdgJIsjmIZfSvHFE3/lon1RHGZ/N2v4ZUrOipQjNqnqW
	WJL+omtwuXdPOz7UVHbuOITETf6IHZ1TIhY7Gp5C5lRgpTHStGf8/J7gFwMbkvWktSs=
X-Gm-Gg: Acq92OGeYClaKOmt7wLrjnmMeyOemiaVKUKeir1Vh7cuCy8x6GbYML0ynqfVWjdKlqR
	lu9MsxLwVD9LT0yMXjwMkYr9s/iZf2zRNq3PeIJjXBFAFaUoaNFigjjTJ+TTGfzRci/Z6a2KvMD
	ehWbc9GMZ9UPpQHVEugIm19aqsuxtw4Gnc9YZdMbYC9BhIfyCbiQrtDBxBpW/7RmWFnZoeGqzBd
	PzkxdiyiHBKgO3gQuoGJqwFNQytqdcs6H7VxHl3tgzaNFZZcYcmn2UT01AwITfaByOILB0ecomY
	cIJNrxGJoz6/zFi3rrFjAv9n/CFFHrgN8HKgNoBxhZedU9J6w+FcRaUCokNHVoZnYM5t5MUGQ/s
	FDPxT7U/ywYk+IHKAM8P7R6vz95sPeQft1WXJv4XVZkYzq8jEDThxt7SxyzOpdSn+T1kvVWg1dc
	0c1rbO7sODIrP1+pX2k382rqwYglkHYztzuLn0gDhP2cjtEsGZ3ruk9B8mgQ49gF1rmMXpJj0=
X-Received: by 2002:a05:6102:41a4:b0:607:5cd7:d7c0 with SMTP id ada2fe7eead31-6ec460bc68emr4380148137.19.1780573194747;
        Thu, 04 Jun 2026 04:39:54 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6eb551b4c56sm4674435137.2.2026.06.04.04.39.53
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 04:39:54 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-6cfdcc79789so194934137.3
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 04:39:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9lw2zDVPtzA3se5t6Ot1VPHU1xcMNTwyLE3okhqGkoa0q0fOQ7G+UTvQDkiAw0njkRb0kkyvQfI4MY@vger.kernel.org
X-Received: by 2002:a05:6102:2b87:b0:6db:4f2b:6cd2 with SMTP id
 ada2fe7eead31-6ec4d5157a9mr4436237137.31.1780573193567; Thu, 04 Jun 2026
 04:39:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525110603.4018170-2-john.madieu.xa@bp.renesas.com>
 <20260525111920.15F771F000E9@smtp.kernel.org> <20260525-gaining-unaired-c96367a78c9b@spud>
 <CAMuHMdWUeExOnKm1=kRSr0=HVJhgyLDBAK3VqTP-LK1q0-f9gA@mail.gmail.com>
 <20260527-prankish-causing-4139d0dd0b51@spud> <CAMuHMdVtLorK+Hjc-ZWCAn273ZN6yUEdyjxpJ5ynZ09sWqcBdg@mail.gmail.com>
 <20260527-botanical-pushy-b9cffbe9ea16@spud>
In-Reply-To: <20260527-botanical-pushy-b9cffbe9ea16@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 13:39:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWGuZS5aCn8TXg9mZd8=3UaZ_L1QzO+ozajVQ+gUDrk_g@mail.gmail.com>
X-Gm-Features: AVVi8CfdijaxamMwVKcNgiCLNexBulG-uqDwuK5a2fXjKCLaNr0jqJtQpxnHUc0
Message-ID: <CAMuHMdWGuZS5aCn8TXg9mZd8=3UaZ_L1QzO+ozajVQ+gUDrk_g@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] dt-bindings: clock: renesas: Add audio clock
 inputs for RZ/V2H family
To: Conor Dooley <conor@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, 
	John Madieu <john.madieu.xa@bp.renesas.com>, conor+dt@kernel.org, 
	wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 May 2026 at 18:36, Conor Dooley <conor@kernel.org> wrote:
> On Wed, May 27, 2026 at 05:45:12PM +0200, Geert Uytterhoeven wrote:
> > On Wed, 27 May 2026 at 16:54, Conor Dooley <conor@kernel.org> wrote:
> > > On Wed, May 27, 2026 at 02:44:51PM +0200, Geert Uytterhoeven wrote:
> > > > On Mon, 25 May 2026 at 18:57, Conor Dooley <conor@kernel.org> wrote:
> > > > > On Mon, May 25, 2026 at 11:19:19AM +0000, sashiko-bot@kernel.org wrote:
> > > > > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > > > > - [Medium] Strict array ordering prevents the independent use of newly added optional clocks.
> > > > > > --
> > > > > >
> > > > > > commit 3723d06ba80fe72a3e7492af52e5e54aa0f36b03
> > > > > > Author: John Madieu <john.madieu.xa@bp.renesas.com>
> > > > > >
> > > > > > dt-bindings: clock: renesas: Add audio clock inputs for RZ/V2H family
> > > > > >
> > > > > > This commit updates the clock bindings for the RZ/V2H family SoCs to include
> > > > > > the optional external audio clock inputs AUDIO_CLKB and AUDIO_CLKC. The
> > > > > > AUDIO_CLKA input is fed internally and thus does not require a binding entry.
> > > > > >
> > > > > > > diff --git a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> > > > > > > --- a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> > > > > > > +++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> > > > > > > @@ -26,16 +26,22 @@ properties:
> > > > > > >      maxItems: 1
> > > > > > >
> > > > > > >    clocks:
> > > > > > > +    minItems: 3
> > > > > > >      items:
> > > > > > >        - description: AUDIO_EXTAL clock input
> > > > > > >        - description: RTXIN clock input
> > > > > > >        - description: QEXTAL clock input
> > > > > > > +      - description: AUDIO_CLKB clock input
> > > > > > > +      - description: AUDIO_CLKC clock input
> > > > > > >
> > > > > > >    clock-names:
> > > > > > > +    minItems: 3
> > > > > > >      items:
> > > > > > >        - const: audio_extal
> > > > > > >        - const: rtxin
> > > > > > >        - const: qextal
> > > > > > > +      - const: audio_clkb
> > > > > > > +      - const: audio_clkc
> > > > > >
> > > > > > [Severity: Medium]
> > > > > > Will this strict array ordering prevent the independent use of the newly
> > > > > > added optional clocks?
> > > > > >
> > > > > > Because JSON schema validates arrays strictly by position based on the items
> > > > > > list, if a hardware board connects AUDIO_CLKC but does not connect AUDIO_CLKB,
> > > > > > the device tree node would provide an array of 4 clocks where the 4th name
> > > > > > is audio_clkc.
> > > > > >
> > > > > > When dt_binding_check evaluates this, won't it check the 4th element against
> > > > > > the schema's expectation of audio_clkb and fail, incorrectly rejecting a valid
> > > > > > hardware configuration?
> > > > > >
> > > > > > Should this use an anyOf block enumerating the valid permutations of optional
> > > > > > clocks to avoid forcing users to write incorrect device trees to pass
> > > > > > validation?
> > > > >
> > > > > Seems like a valid question to me. Can be solved by making the second
> > > > > last clock an enum.
> > > >
> > > > Calling them optional may be a misnomer: these pins are present.
> > > > Typically we provide zero rate fixed clocks for such clocks in the
> > > > SoC .dtsi, to be filled in or replaced by the board .dts.
> > >
> > > IOW, either both clocks will be provided or none will be?
> >
> > Exactly, see the first hunk of "[PATCH v4 3/8] arm64: dts: renesas:
> > rzv2h: Add audio clock inputs" later in this series.
> > https://lore.kernel.org/20260525110603.4018170-4-john.madieu.xa@bp.renesas.com
>
> In that case,
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks, will queue in renesas-clk for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
