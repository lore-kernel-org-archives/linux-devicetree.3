Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5733F4139
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 13:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778679533; cv=none; b=PxFoXdoTM+ragZzO9b1XnByxNo9y4P9AQz9+eesRq0nuyGb76ch1eHOBbOuWpaxud7oc9h/rJ0GugIpealG6QyA31a6HpCMEu/zIMrJzM0CQCert+PReWviUHBOFXIXleyxbuZmW1ZAt9Aqg00lTZiz923DzH8R8z3kAJsnoVkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778679533; c=relaxed/simple;
	bh=kPZ7A5cvokRvd7vF4xD+Y1QfccmxOHw5oZJ2oKw4NGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mWcohLz4hDA3b9yntZ0M92zIWt5KlJYRL9MOq6QvNKcOCjfHjqzcSXY+Kfa9arwEO2N40a2Ss1Xy9FHgD4U/wsCf+WW29MNyzSlmYKxzbNG8h27TiKEJ0AanzJg7PXlEtKkxh3HQ0HZVJy/gLNklptgSteCZN/l2zAHWr217UsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-6312d29596cso4162375137.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 06:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778679531; x=1779284331;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrwW8HJMZcY9Fq5J+G2ZrLwjCrrOc6AC4xQETMaCZKg=;
        b=cMPz3zccSQDudOjCTY84D83EpcLMrhDoYGPnkqT8gZupzUG9RKFq2PdLkzBh8p6pWR
         dO1BTbLuMpxPy83l4RR18li0/5NUd5Q9Hu1t+gbiJxVA/68bnMXuDJj/faM207HYwDxd
         RUaq92tSKByYbk1HX0Uu4rx2mbahjBv8Kyv+TUrFXKJukoAKDM8GmRSbGaY6ZDQcEeI9
         MoG95pLmMJhisMV59QJLd3AGA/BoDMw7TUGqkU84Oshdx+I2+aHjlQXtZFw91352C302
         3uhBjwGQoKG64CiG2ZN1T9Sl/8qM6j7lAGBlWq95FjFtAVMJ77DF9XlRaqKcEJzYUqIZ
         nG4A==
X-Forwarded-Encrypted: i=1; AFNElJ+Zy7oeQ/X56ejEGgfS4oN3y0A9Svb2DJg1TuOwYbXSg/wgD48bRVbHbtSxzsoEyw+rD0Tz/euh0b/o@vger.kernel.org
X-Gm-Message-State: AOJu0YxXHzcfMpLTnscvM+WqAIr1h0DTy5qaG8tU3RWYUQd0QPuiXc8x
	m8hJXhfrQHbad9v2z37SekNew2/ZuJkuWwz8BskniGnp4U686KYG523fMOacW3zt
X-Gm-Gg: Acq92OHojowv317xxfUYGmjGDETB75jjPhTmennJToQX/Rc/XiBbguYfutz8zgu/Wze
	fcgerXmKdgzQCRuquEv7pLTX8mPqb00QBv0zFdAQ62Q+m3EL9m8XIxyMosZfzFLuOurR4cmIkCh
	8TnFgPgWwo01uYZea2BnluS93lqQOFLHdYYi+5K3eJqyeOtoc037qsskyYduuqFw6pHegMgokyd
	bMtE7lyDh2su9qXZP9rjbStRFh270tJhZf2rbTcDa6hiL5Zld9VxryZDxZWV+ZBGANU6m4xOHwv
	1GTDro5n3CBq3r0Y78NrJjY83W4SFMu0dgyNmhEN7lbINPaWn0oU/86IrL/wFNCtUC9KPo1LKpC
	fSf6U5zKfa82c6Rk0pdnjt8ypBtKh1sMdOhMe6HHzdWL6R0WZ91DN1/z8RtkWFnB32blAT96MfE
	H/tNAIEdQGr/aGZdiW6EmEii3epZNq1KHD0unCw4GDPU7mMSquILcaghyUFjNH
X-Received: by 2002:a05:6102:304e:b0:62f:2d6f:cc11 with SMTP id ada2fe7eead31-637733ea94fmr1615085137.2.1778679531303;
        Wed, 13 May 2026 06:38:51 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-63140216a98sm10111151137.8.2026.05.13.06.38.51
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:38:51 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-95697b46831so4467390241.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 06:38:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/W2/NRJKyZ2vQ9uHfmAwWL2gvilvrHNwow6tolgt5bM1RB1lkzKxLjikydU4TWFzEAx+T5SOIW9o0t@vger.kernel.org
X-Received: by 2002:a05:6102:2924:b0:631:b365:40f6 with SMTP id
 ada2fe7eead31-63775f441f7mr1566639137.23.1778679530826; Wed, 13 May 2026
 06:38:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org>
 <20260502185557.93061-3-marek.vasut+renesas@mailbox.org> <CAMuHMdUXjwyVk2kuGAJOdPHw=qv_iwO2pSR3Rp+5ayoP2QG25w@mail.gmail.com>
 <c4e6e48d-9a8f-48f0-8666-22efebf86d8a@mailbox.org>
In-Reply-To: <c4e6e48d-9a8f-48f0-8666-22efebf86d8a@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 May 2026 15:38:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUVAXZtWAUn5fDgTKszHh7voQMJMyPBxbUiqOYRSfzCzA@mail.gmail.com>
X-Gm-Features: AVHnY4LU1BBWpNxE_fkGvk4Rs-4viEWKSh1Rjw7iIL0Qt5GSNDkgP1kR7U3ItzU
Message-ID: <CAMuHMdUVAXZtWAUn5fDgTKszHh7voQMJMyPBxbUiqOYRSfzCzA@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: renesas: r8a73a4: Implement ZT/ZTR trace clock
 on R-Mobile APE6
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 May 2026 at 15:37, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 5/13/26 3:15 PM, Geert Uytterhoeven wrote:
> > On Sat, 2 May 2026 at 20:56, Marek Vasut
> > <marek.vasut+renesas@mailbox.org> wrote:
> >> Implement ZT trace bus and ZTR trace clock on the R-Mobile APE6.
> >>
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >
> > Thanks for your patch!
> >
> > /sys/kernel/debug/clk/clk_summary looks a bit off to me:
> >
> >      zt                         0       0        0        208000000
> >      ztr                        0       0        0        277333334
> >
> >> --- a/drivers/clk/renesas/clk-r8a73a4.c
> >> +++ b/drivers/clk/renesas/clk-r8a73a4.c
> >> @@ -43,6 +43,8 @@ static struct div4_clk div4_clks[] = {
> >>          { "m1", CPG_FRQCRA,  4 },
> >>          { "m2", CPG_FRQCRA,  0 },
> >>          { "zx", CPG_FRQCRB, 12 },
> >> +       { "ztr", CPG_FRQCRB, 16 },
> >
> > 20?
> >
> >> +       { "zt", CPG_FRQCRB, 12 },
> >
> > 16? (12 is zx, cfr. above).
> >
> > I.e. the same shifts as on R-Mobile A1.
> >
> >>          { "zs", CPG_FRQCRB,  8 },
> >>          { "hp", CPG_FRQCRB,  4 },
> >>          { NULL, 0, 0 },
> >
> > After fixing the shifts, I get:
> >
> >      zt                         0       0        0        277333334
> >      ztr                        0       0        0        277333334
> >
> > which looks much better. If you agree, I can fix this while applying.
>
> Yes please. I can confirm in APE6 RM v0.7 that the ZTFC is at bit offset
> 16 and ZTRFC at bit offset 20 . Thank you for spotting this.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
