Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE2B1AC44D
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 14:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782138506; cv=none; b=B67N0csKokPt8unIeDmDE3n81qpj7vxwwsBJ38PoCLGqTmGweZ+dZwCsRDSbMuhEUbFpgPqceUo+lFy0nF47dSCKa1eBrbmijeeDR4vw19Zu2hV5CQyATgerFmIFcBxolHgn2qjdYmsfEnXUdOLx8QnaY+O3BmfFSD/2A8MTqvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782138506; c=relaxed/simple;
	bh=LpYby/C3sB5tpZd2Qt85jlNF3iOGWtYp99Y8ihB1gPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rh2h79U4FNGXG6dgUScJNnUXotLlJb7W1CafXk/tcju3YjhcscgrmjrnwDKfiX70QV4oFW+reLgwXJJB3JNpaVAyWk7X4VVYc0GOSjhqVpJ0NKCLs9VfZjGS5qaWKEqtRYQqTAyRyVlI1Z23zKSUem/8rXgXowCs2kvLI7lT5r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8dedb44ed1fso34624326d6.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 07:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782138504; x=1782743304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cADZZnn4gjK5Oixge29dOaGqF3MIQ1dd5O+dWVLo+Gk=;
        b=YYrx2TUdd+smVsoIylKmPJaaSUt5A7OFfhLGwrMqiGRCgxttLKa0wJcLbLrmTuvSpz
         NaFlLAKV6HkcXVbw/vU+SL6u5B6YRo0Gnx8R9y6HR3KtlC0hG5VaVZqgq0fDE/Xp1xdZ
         aXAeSIOOc1WOb4tkrJcogYCuDE5l34zYYMZlsDOAcGmRSUsf2fcPaLaxP9929Pe5YUpP
         XlD1pc14VAOmNEtSfoovsRuo0rObonnfSVBlCiyLfRmCbI1Tg5XQCuY8BOtfkktTyIEO
         G8f4fSeZsYdq8TOIURPhSyIvAslXGRM9eAPEUtIMT0Ee8MzgzDIm9nhd9ofx4xCZ6APc
         ZXcg==
X-Forwarded-Encrypted: i=1; AHgh+RqJEdAeah8iBoWLT5crQHTiC4BIitGHAzn26FRKmDB9/TJDlrE9++RpFgISeofE01BcPjoMftyYYgPI@vger.kernel.org
X-Gm-Message-State: AOJu0YxOoAlY8FJMNMLDfEq+jsqeprZ38U8hKdzZ3noa2PXBdh2Q8yje
	emB7hrFv4t4XuDkUcT02ArAXpT482WIQyRhYLZvpbVr3r3vJk6xpmlUyqwgPLckjUVw=
X-Gm-Gg: AfdE7ck55hf+dg825YvgWSUJm5egwHX2I5pghK+3JeheoK7QCY38xaTIUlXhggzpRMy
	tnTeyF8vX/NeWSl0qNOSn84dDA2wquVOSMoOlBVwmwPZvpP9wgFFQ5iZpI7LIkLVZUmUNgVN0yK
	X/gqS/GXVdSzQXSCIlnKQKV47wO90AfTPFzgHt7j8oQLNFYLnFFmQSGzKpmb1pcNO6lbKqORc/I
	LIzRVgQaTp6YOnPhTTd49mtYva4OBqOwGllXyTsbuLOrVGqSvfZUbOFczbTmmZmavwg3anMoANh
	0212qsdQuVdc64ePogQAbctL0I20Eyqtk7FPkjcktNAItMl/JD5v6CE4IXVFtBwqNuF21gwHjPO
	Y0Z9Flxs9qJa+WJpQdbk/jyrb55hbixoFmDcQAlWRBQVLA08EqAi12XHLpuczO+JwQSjsi/jDSD
	GE3LRB+/zCNMY5d/CZyUu9aq0FgL5IQDLlcjtAFYNByoy0Q/Vw9ztHYA==
X-Received: by 2002:a0c:f7cc:0:b0:8cc:d066:54d with SMTP id 6a1803df08f44-8de40c02d35mr190372316d6.24.1782138503447;
        Mon, 22 Jun 2026 07:28:23 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com. [209.85.160.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7f603b6dsm107942506d6.15.2026.06.22.07.28.23
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 07:28:23 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-519b63eff15so42520251cf.2
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 07:28:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/pwLOwZvYNpt0cBJIG/sF4IyFAgzEX0DJX5JjkUDz4vHt2eWWaBMIhEc39OkJTvSyuT/nNSJgQ7NSV@vger.kernel.org
X-Received: by 2002:a05:6102:2922:b0:631:2cb0:bf8d with SMTP id
 ada2fe7eead31-72a01882303mr8022720137.6.1782138139212; Mon, 22 Jun 2026
 07:22:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429115054.158160-1-herve.codina@bootlin.com> <20260429115054.158160-3-herve.codina@bootlin.com>
In-Reply-To: <20260429115054.158160-3-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 16:22:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVwMjLFJz0NeSP+BJVYoePw6oRDdj9P2Ra5nC=4yRXd6w@mail.gmail.com>
X-Gm-Features: AVVi8CeGC9Vn8JWkJO7xDytlZEDscCIDRlTTaudbtw3_YSqPMLV4PY62I2DvSS4
Message-ID: <CAMuHMdVwMjLFJz0NeSP+BJVYoePw6oRDdj9P2Ra5nC=4yRXd6w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] clocksource/drivers: Add support for the Renesas
 RZ/N1 timers
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Pascal Eberhard <pascal.eberhard@se.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herv=C3=A9,

Thanks for your patch!

Just a few generic comments, as I am not a timer expert, and have no
access to the hardware.

On Wed, 29 Apr 2026 at 13:51, Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:
> The Renesas RZ/N1 timer block controller is the controller in charge of
> timers available in the Renesas RZ/N1 SoCs family.
>
> This controller handles 8 timers:
>   - 6 16-bit timers
>   - 2 32-bit timers
>
> Each timer has its own interrupt, its own prescaler that can be used to
> device the clock by 25 and all of them can work in either one-shot or

divide

> periodic mode.
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.co=
m>
> ---
>  drivers/clocksource/Kconfig      |  10 +
>  drivers/clocksource/Makefile     |   1 +
>  drivers/clocksource/timer-rzn1.c | 442 +++++++++++++++++++++++++++++++
>  3 files changed, 453 insertions(+)
>  create mode 100644 drivers/clocksource/timer-rzn1.c
>
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index d1a33a231a44..f8e49a4ac8f6 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -152,6 +152,16 @@ config REALTEK_OTTO_TIMER
>           RT8391, RTL8392, RTL8393 and RTL8396 and chips of the RTL930x s=
eries
>           such as RTL9301, RTL9302 or RTL9303.
>
> +config RZN1_TIMER
> +       bool "Renesas RZ/N1 Timer"

So this cannot be a module.

> +       depends on HAS_IOMEM && COMMON_CLK && (ARCH_RZN1 || COMPILE_TEST)

I would split this in two lines, to make it easier to read (and
maintain, if the same timer ends up in a different SoC series).

> +       help
> +         Enables support for RZ/N1 SoC timers.
> +         A timers block in RZ/N1 SoCs is composed of 8 timers
> +           - 6 16-bit timers
> +           - 2 32-bit timers
> +         Two timers blocks are available in RZ/N1 SoCs.
> +
>  config SUN4I_TIMER
>         bool "Sun4i timer driver" if COMPILE_TEST
>         depends on HAS_IOMEM

> --- /dev/null
> +++ b/drivers/clocksource/timer-rzn1.c

> +/*
> + * 8 timers are available. Among those 8 timers, the first 6 timers are =
16-bit
> + * timers and the last two ones are 32-bit timers.
> + */
> +#define RZN1_TIMER_BASE_INDEX_16BIT_TIMERS 0
> +#define RZN1_TIMER_NB_16BIT_TIMERS 6
> +
> +#define RZN1_TIMER_BASE_INDEX_32BIT_TIMER 6
> +#define RZN1_TIMER_NB_32BIT_TIMERS 2

Align the number columns?

> +static int rzn1_timer_probe_first(struct platform_device *pdev, struct r=
zn1_timer *tab_timers,
> +                                 void __iomem *base, unsigned long clock=
_rate)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct rzn1_timer *timer;
> +       unsigned int i;
> +       char *name;
> +       int irq;
> +       int ret;
> +
> +       /*
> +        * Probe the first instance. In that case, timers are assigned as
> +        * follow:
> +        *   - First 16-bit timer: clocksource and sched_clock
> +        *   - Other 16-bit timers: clock events for all possible CPUs
> +        *   - 32-bit timers: clock events per CPU
> +        *
> +        * First step, perform all operation that could fail without call=
ing
> +        * clockevents_config_and_register(), sched_clock_register() nor
> +        * cpuhp_setup_state(). Those operation don't have unregister nor
> +        * teardown counterparts and so, once called, we cannot remove th=
e
> +        * related resource.
> +        */
> +
> +       /*
> +        * First step for 16-bit timers except the first one and all 32-b=
it
> +        * timers.
> +        */
> +       for (i =3D RZN1_TIMER_BASE_INDEX_16BIT_TIMERS + 1; i < RZN1_TIMER=
_NB_TIMERS; i++) {
> +               timer =3D &tab_timers[i];
> +
> +               rzn1_timer_init(timer, i, base, clock_rate);
> +
> +               irq =3D platform_get_irq(pdev, i);
> +               if (irq < 0)
> +                       return irq;
> +
> +               name =3D devm_kasprintf(dev, GFP_KERNEL, "%s-%u", dev_nam=
e(dev), i);
> +               if (!name)
> +                       return -ENOMEM;
> +
> +               rzn1_timer_clkevt_init_ced(timer, name, irq);
> +
> +               ret =3D devm_request_irq(dev, timer->ced.irq, rzn1_timer_=
interrupt,
> +                                      IRQF_TIMER, timer->ced.name, timer=
);
> +               if (ret < 0)
> +                       return dev_err_probe(dev, irq, "timer%d: Failed t=
o request IRQ\n", i);

%u

> +
> +               rzn1_timer_int_enable(timer);
> +       }
> +
> +       /*
> +        * Second step, almost all operations that can fail have been cal=
led.
> +        * Timers are ready to work. Start with the last operation that c=
an fail,
> +        * installing and invoking hotplug callbacks
> +        */
> +       rzn1_tab_timers =3D tab_timers;
> +       ret =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> +                               "clockevents/rzn1/global_timer:starting",
> +                               rzn1_local_timer_starting_cpu, NULL);
> +       if (ret < 0)
> +               return dev_err_probe(dev, ret, "Setup CPU hotplug state f=
ailed\n");
> +
> +       /*
> +        * At this point, no more operations can fail. Perform remaining
> +        * operations. Starting by handling the first 16-bit timer
> +        */
> +       timer =3D &tab_timers[RZN1_TIMER_BASE_INDEX_16BIT_TIMERS];
> +
> +       rzn1_timer_init(timer, RZN1_TIMER_BASE_INDEX_16BIT_TIMERS, base, =
clock_rate);
> +       rzn1_timer_config(timer, GENMASK(timer->width - 1, 0), true);
> +
> +       rzn1_sched_clock =3D timer;
> +
> +       sched_clock_register(rzn1_sched_read, rzn1_sched_clock->width, rz=
n1_sched_clock->rate);
> +
> +       rzn1_clocksource.mask =3D CLOCKSOURCE_MASK(rzn1_sched_clock->widt=
h);
> +       clocksource_register_hz(&rzn1_clocksource, rzn1_sched_clock->rate=
);
> +
> +       /*
> +        * Register clockevents only for 16-bit timers. 32-bit timers clo=
ckevents
> +        * are registered by CPU hotplug startup function set previously =
by the
> +        * cpuhp_setup_state() call.
> +        */
> +       for (i =3D RZN1_TIMER_BASE_INDEX_16BIT_TIMERS + 1; i < RZN1_TIMER=
_NB_16BIT_TIMERS; i++) {
> +               timer =3D &tab_timers[i];
> +               clockevents_config_and_register(&timer->ced, timer->rate,
> +                                               1, GENMASK(timer->width -=
 1, 0));
> +       }
> +
> +       return 0;
> +}
> +
> +static int rzn1_timer_probe_other(struct platform_device *pdev, struct r=
zn1_timer *tab_timers,
> +                                 void __iomem *base, unsigned long clock=
_rate)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct rzn1_timer *timer;
> +       unsigned int i;
> +       char *name;
> +       int irq;
> +       int ret;
> +
> +       /*
> +        * Probe other instance(s), i.e. not the first one. In that case,
> +        * all timers are used as clock events and available for all poss=
ible
> +        * CPUs
> +        *
> +        * First step, perform all operation that could fail without call=
ing
> +        * clockevents_config_and_register(). Unregister counterpart does=
 not
> +        * exist and so, once called, we cannot remove the related resour=
ce.
> +        */
> +       for (i =3D 0; i < RZN1_TIMER_NB_TIMERS; i++) {

Technically "0" is RZN1_TIMER_BASE_INDEX_16BIT_TIMERS.

> +               timer =3D &tab_timers[i];
> +
> +               rzn1_timer_init(timer, i, base, clock_rate);
> +
> +               irq =3D platform_get_irq(pdev, i);
> +               if (irq < 0)
> +                       return irq;
> +
> +               name =3D devm_kasprintf(dev, GFP_KERNEL, "%s-%u", dev_nam=
e(dev), i);
> +               if (!name)
> +                       return -ENOMEM;
> +
> +               rzn1_timer_clkevt_init_ced(timer, name, irq);
> +
> +               ret =3D devm_request_irq(dev, timer->ced.irq, rzn1_timer_=
interrupt,
> +                                      IRQF_TIMER, timer->ced.name, timer=
);
> +               if (ret < 0)
> +                       return dev_err_probe(dev, irq, "timer%d: Failed t=
o request IRQ\n", i);

%u

> +
> +               rzn1_timer_int_enable(timer);
> +       }

This loop is identical to the first loop in rzn1_timer_probe_first(),
except for the lower bound. Perhaps it can be factored out?

> +
> +       /*
> +        * Second step, all operation that can fail have been called. We =
can
> +        * register our timers
> +        */
> +
> +       for (i =3D 0; i < RZN1_TIMER_NB_TIMERS; i++) {

Technically "0" is RZN1_TIMER_BASE_INDEX_16BIT_TIMERS.

> +               timer =3D &tab_timers[i];
> +               clockevents_config_and_register(&timer->ced, timer->rate,
> +                                               1, GENMASK(timer->width -=
 1, 0));
> +       }
> +
> +       return 0;
> +}

This loop is identical to the second loop in rzn1_timer_probe_first(),
except for the lower and upper bound. Perhaps it can be factored out?

Alternatively, you can
  1. Unify rzn1_timer_probe_{first,other}(), and pass the different
     bounds as parameters, OR
  2. Split rzn1_timer_probe_first() in three sub-functions, and call
     these from rzn1_timer_probe() directly.

> +static struct platform_driver rzn1_timer_driver =3D {
> +       .driver =3D {
> +               .name =3D "rzn1_timer",
> +               .of_match_table =3D rzn1_timer_of_match,

This driver can't be modular, and can't be unbound:

    .suppress_bind_attrs =3D true

> +       },
> +};
> +builtin_platform_driver_probe(rzn1_timer_driver, rzn1_timer_probe);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
