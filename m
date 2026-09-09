Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F2646983F
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 07:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940586; cv=none; b=a8m8qxvdgHbTnx/4UmzWj2XoJHy4sqzE2v6ZujzXVTyP+Cr0SH5RXQ9RYiALZsU1uhxauN5mUtS/JiNE/wFX0dFOn1KD/67POC0shEBXjcXsd/8jbGnoyHWX30NkBS1JJMwOu2uUQO7KbUZn5fueBimt8dHgrdwt2t1sui3iSDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940586; c=relaxed/simple;
	bh=jIL/ineDSN9RSASWLEndVFHVKkHoHz+xKZ4KgMvLjJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hJBZCdNqaEwrOyzKPz7qunMbGVxB0seY8T0V/853g3G8OCJEIDMEijo0A38nmXNjJXgQRb2aeBVhU8j7sbPwoY+3HcK+cvIkwrOWIuW68mS37U7Vkkqn1TOdvTJma4Fiffmdw7k9TY0FYZpaHR157Ohkipeyj7+WjI5YZ98O5CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c263415982eso471683566b.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 00:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940583; x=1789545383;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FFRHIlgUH34gNIFpS8cBfqFWe89JRGpFMu8JNscE7T8=;
        b=l2Zo284l5d/riQmELevaPoNLasrDs/bjX5uClY7cTFRPZeDlN8sNpoZDz0dOgQN8GL
         cnbXoprnsDNG3tgkfYt5FOnJWpsqud+h1tTQDEMYuBnf8Fdn5Q1gSOHb2BqI99lzTGVu
         81lDP0Y2bckEheal6Wk3QxE9QtgEBMdxOt5mbUYQpx39l0+oMJAjdx7LYg1v41QIz1Pm
         V6Dftdsajg9ceHUAw4U9BSh44yAjms9iTklYJRVyWkEVBKxx8/+OOrcOjwk5Qov1srGx
         PiuR/6l8txYWB8YR5a1jWrqe3EdCCucsil9GGro9xkWxfEnzpZRhqq6KMezklKBEMxqm
         XeGQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/sWZUlRoT0ZDevm5FmlE1jDJKcca5fMQIYCExqDkZMa9RComcAi+DXh/YSXZNjc922LATYYG8GP7S@vger.kernel.org
X-Gm-Message-State: AFuF++k3oJgroEYWJs9Gsm+X2Wcb4MWitPrRSZ4zUjmPiTz1qhChK8dp
	3OmAbP12ttBvK+ioOZpejSbxh1x8pQ63kdcUO3UpsmPdpZ4gg6H5fSNjydzc7o9rPos=
X-Gm-Gg: AYBFou3HKn6gGB0O/mwoCZ/QAY02XL1J0oSHZMFNA+/mcw9ERrZm+5W6LRXSE3JZD8U
	zjyN38I7VTCTHVv8CH785ClAnUpJhcEnpP67b/NghwUvda1NVpolQXH806Z9KOkY04Glbz30381
	BlK/MMPRGCcT2Hn/wt8nHFwXK644KcJeXJwj1X49PgXIBPeE8khdVZtNHyPYG4sYt8NI1pJaYgC
	hi+OtaD3h/ZSSRZI3zGPvYTlVcswsYO+Ojt0+aBYqc5iGTKokr4u77mRhCue5MX80VYK9lFmCFx
	W/tnh51k9PCQ6LbjJ1filO2lrBHwkEUc+nvWuz8Arr+Fg144CgU0j6bQQ6on4UdGBhQxnpMm+Ue
	OB2Eup/3VyUJ6IuaybPXjQUP0i8tqZZ7+6a+zY5BLZG6Kjzos+bokiXy1Kqf2DR4yzBKYxVhPn6
	3RQ+9mtQhcxhK7Dfiq8w+5KOOE1RbrzOK68Q1CTG00apR5yaXWAeTrjjxyO+MHtwsaZi6uGOPdB
	flw/GgakNyUCkGrAIAwNUuRGZSYOVSLRCAu
X-Received: by 2002:a17:907:961d:b0:c25:362e:fb8b with SMTP id a640c23a62f3a-c260c8b94a4mr2372730766b.7.1788940582609;
        Wed, 09 Sep 2026 00:56:22 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c262c770678sm564298966b.53.2026.09.09.00.56.19
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 00:56:19 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a082b3671fso7100532a12.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 00:56:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz68tKHOjC6BgkO0fYGtVikav1RexMcMxuoUZgPN1+WyEH/fIW15Q0oMZUZmFB+54RxU32dWbmxSQdf@vger.kernel.org
X-Received: by 2002:a05:6402:44db:b0:6a6:7fa6:f0ac with SMTP id
 4fb4d7f45d1cf-6a7e8f9e843mr19491213a12.22.1788940578727; Wed, 09 Sep 2026
 00:56:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808025724.131943-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdWvLX7OZSkfEBA34wKtnoZ4asB6rWFJiLa=2+=fezqsCA@mail.gmail.com> <f82ae578-fbe7-4834-bdde-d11e194a507f@mailbox.org>
In-Reply-To: <f82ae578-fbe7-4834-bdde-d11e194a507f@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 09:56:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQKL_srr80mUmsnznqJ_qxAoh0TdwyvJ41=CN=2pDjCQ@mail.gmail.com>
X-Gm-Features: AcwNN1VBlUkOuc1dFERdA1IT0JCfCvNrtGVHmcnj2K9AZQ9QnT8wN-u_7o86Wro
Message-ID: <CAMuHMdXQKL_srr80mUmsnznqJ_qxAoh0TdwyvJ41=CN=2pDjCQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Add overlay for
 WaveShare 2CH CANFD HAT
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Tue, 8 Sept 2026 at 19:02, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/8/26 2:02 PM, Geert Uytterhoeven wrote:
> >> +&pfc {
> >> +       msiof0_pins: spi-ws-2ch-canfd0 {        /* SPI_0 */
> >
> > Node name should be "msiof0".
>
> Do we also have to fix up
> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts this:
>
> "
>   755         msiof1_pins: sound {
>                            ^^^^^
> "
> ?

Might be a good idea, to increase consistency.

> But I wonder, shouldn't the DTOs contain unique pinmux node names, which
> cannot accidentally overlap with the base DT or other DTO node names ?

In general, the answer is yes.
In this case it is about pin control subnodes. If the base DTS already
uses msiof0, its original user needs to be disabled by the overlay
anyway.

> >> +               groups = "msiof0_clk", "msiof0_txd", "msiof0_rxd";
> >> +               function = "msiof0";
> >> +       };
> >> +};
> >> +
> >> +/*
> >> + * PWM1 uses PWM1_B pin configuration for pin GP2_13. This conflicts
> >> + * with SPI_1 CE_1 signal which is also on pin GP2_13. Disable PWM1
> >> + * in case this hat is in use.
> >> + */
> >> +&pwm1 {
> >> +       status = "disabled";
> >> +};
> >
> > Please move this node disabling pwm1 to the top, for compatibility
> > with dynamic DT overlays.
> Could you expand on that a bit ? What difference does the placement of
> this node make within the DTSO ? Please pardon my ignorance.

In case of a dynamic overlay, pwm1 must be disabled before SPI_1 is
probed.  Otherwise the latter will fail with -EBUSY due to the
conflicting pin being still in use.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
