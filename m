Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0493DC861
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 09:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780653197; cv=none; b=LiYpA7XKlwoRQp4P6hCbadLKg/t7UdOaVkX5JXjctkLzmeTWW/HOYlp5jXvH7y5DORxen3Cepb37ob/Fa2JpBQH5MZXcTCK9C8iwoUaAeoGq794u9lDIiywtEH9dsvSwl5fOgmigNGj2gMtR542S9lv2a3TOQN8sTjD+4M4mhxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780653197; c=relaxed/simple;
	bh=XegPlP0QUg8N4ZbYcx0a/twqRUS5iUtjIM8XQ1lg9EA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jZWUofTvBX2V0E7wpDNTpucctxm+bva+/yJY7jhfxEv2eZYnyt1mQkv+IkMS8hY9eRBeUOv57RuaoMYPbDPyaz7jvxMmjjtZKclkBbppOtSQWNAkfzjg0aYGHOgH2oRnyBXIJsuuG0UL+n1udyrKKcA06UYKCpwcCXVF5siwIQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8cceaa6f75bso26106556d6.0
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 02:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780653195; x=1781257995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frpOI/birEQQyfTPmqA3egHq/XurZUvg89/zJvb+Gi8=;
        b=FIl6q3zS4G0tQOnqLe87MpY8JMJ0MSAbZfjt3SW0Wx3Sp4PNzA5KdiBGkceX7xM/SU
         iaROYu0gRG/YIDu9aLbGe8boIcvZS9O+iypzvoGwQ+mUlDHq0Cm9l+SXojPWoEk1XStN
         yL/n3b6r8pSoFoTclmuzS439aw7HlPuUnmseEqHIAIdH09E1DD3AX/7bCpTMr6sktWg+
         l//wf6E0ZZwcX++bCUXRARuLUbr5wGKGlCKJifvf8YFiO/pk22U9v/7unlBmFGUAnInh
         EJvRzLjAbG3S3UCpPu/S3aOwJpoEwm9u05svk9w1GJLssIbHaajsoFvaJs41/DaoNB+v
         SKmg==
X-Forwarded-Encrypted: i=1; AFNElJ+DgQJJNduOpuyGSPuyM1e0IdZweXef0QuOEY7V4iP03920TZ0puWk8zUELGapzs8h7kgq68clQA+KZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx46+u36MLtzhqP913Sg2FzNrMx60YT4JuiCW2iO7sGGRiIIWJh
	VsmB6GCQPEIFPOpiONj7/f+efP9Tk62Rz+FCopgLp6Wt2pIUjSoblvmPzkL4zWTr
X-Gm-Gg: Acq92OHtY2bjzIot5/kxJkDQuPEbfRdNRX4IuDKyfjAnLk0IQ5vNH7sFONWgvU10k0v
	XUiRgocEwAE2Woc9YG/90Pit4TLzCWs3yXpCafpWLinHm3dvukbXFLk8CjsXKjGQmfjG0ae2XkY
	i5706Wr35GiziFrxxPYzJx0u//FcNiFnNeDSmhOT54CiQFsZsgSL8eDEb1oAQEgTOj+vjNgA9a3
	JBfYoS7YaV+3yc6N8EeAvGUDzC4/RIibDWnJ/M/vtrb9pbyqgcglFAbkYFaP7YkzPPMmN4c7MXl
	/kD9SJKrCp0OYxxSiXnAL2YXaZ9KfaRwt9sOD3Bc8Ink7MWncMquOJQkKDPvdGiUDI0Ru6ygEYu
	cnXNhwb1LYS9HMZ821CuI6wiOudMYL4l3BLmk7KdCyeV1zpAKXdVqi7o61Uaou/c1uHtO+MpL4b
	MM9Kk3OU/VePhPz4levNodz7V0KgIzXyMNYCoo+2ZLw1E37c5/jKvnh3IxADxStUKoZPwI9GksY
	c8=
X-Received: by 2002:ad4:524a:0:b0:8cc:f135:529e with SMTP id 6a1803df08f44-8cee614a20bmr36371426d6.34.1780653194799;
        Fri, 05 Jun 2026 02:53:14 -0700 (PDT)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccdcc968sm81711456d6.22.2026.06.05.02.53.14
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 02:53:14 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-91591f19c30so276176085a.1
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 02:53:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+uYxY1+k3aHipQXpECxcXFDLAj2rerncB4YWHHcFI9PR6UPcYuDzGuARFz1MUyDTz5C4lrM4ujnpXz@vger.kernel.org
X-Received: by 2002:a05:6102:5094:b0:631:26f6:701a with SMTP id
 ada2fe7eead31-6ff156acf6fmr1089364137.29.1780652873088; Fri, 05 Jun 2026
 02:47:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603151642.4075678-1-claudiu.beznea@kernel.org>
 <20260603151642.4075678-2-claudiu.beznea@kernel.org> <CAMuHMdU_T=G7os6KBG6xTnphnhQ9pQtd88BUkg61S7286bZmFw@mail.gmail.com>
 <TY3PR01MB11346903E1B762B66EDB8CB8486102@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346903E1B762B66EDB8CB8486102@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Jun 2026 11:47:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5SE7KsiWsp+6eFpO2R_pA6k4+sjAQcOQFC+pgOY9chA@mail.gmail.com>
X-Gm-Features: AVVi8Cd8crXCTmvuTR9VXD3Qx0xyM45BlA1nZ2BpfmDiwjntvYP3B16PpfLU8T8
Message-ID: <CAMuHMdV5SE7KsiWsp+6eFpO2R_pA6k4+sjAQcOQFC+pgOY9chA@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] pinctrl: renesas: rzg2l: Use raw_spinlock_irqsave()
 on power source update
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Claudiu Beznea <claudiu.beznea@kernel.org>, 
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "linusw@kernel.org" <linusw@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "magnus.damm" <magnus.damm@gmail.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"Claudiu.Beznea" <claudiu.beznea@tuxon.dev>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 4 Jun 2026 at 12:58, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: 04 June 2026 10:49
> > Subject: Re: [PATCH v3 1/6] pinctrl: renesas: rzg2l: Use raw_spinlock_irqsave() on power source update
> >
> > On Wed, 3 Jun 2026 at 17:17, Claudiu Beznea <claudiu.beznea@kernel.org> wrote:
> > > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > >
> > > The rest of the driver uses
> > > raw_spin_lock_irqsave()/raw_spin_unlock_irqrestore() for locking. To
> > > avoid concurrency issues or deadlocks, use raw_spinlock_irqsave() via
> > > the scoped_guard() helper for power source updates as well.
>
> Just a question, will rzg2l_set_power_source() called from IRQ context?
>
> This driver does not have IRQ. If any consumer calls rzg2l_set_power_source()
> in IRQ contest?
>
> Have we seen any such dead locks/concurrency issue during any testing?

All pin control drivers use the irqsave variants.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
