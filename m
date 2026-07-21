Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839313CB2D4
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784623434; cv=none; b=JNxuEeCfWaekzsadh8L0m8810lNikgPc9Yg7Hmb3OxxUe1acCbnp2F3q4hMN55w4gFWFNwgXs7gM8BYBjS/RW3J8vzHG7KeAxQ/8WGR5lXwDh6L44b34zL/tGAEr4FGuZDNW9F0J5SIRSZQGgdH9QMKTpmtcqukxiiOWklC+cqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784623434; c=relaxed/simple;
	bh=6LquMox0IoPrmx0DD9oK+EFSzTcy0jdbupAqvZ+LegM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fCt82VoN4sIgoMEw/qoZcVwiekcVwcDzjws8i+TOdLw3VuBEBIKW3NJkKXdHklUfXQVKMKvhurCDXm1lc6Mg5gxe7Bb8apjhsc0b3lZmrIx5m4Rpo+5/UzRlZfsILTk91rSIOmBBoWtR/7onui9BMFWMmJteCdkm/O73XCVaxEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aUJAsOFv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aUJAsOFv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA391F00A3A;
	Tue, 21 Jul 2026 08:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784623432;
	bh=cszn5gtCWHBcjS5TveBAmzPAoOHTOSiyAop2KHSxfns=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aUJAsOFvKf/DgBv7KHe+QFj72aEVnowypNTNJhYz6wBrkJ0qtShFti3BoDymRAsZO
	 mcqYpxza9G9RGMkO0sye7hA0wl3CgH0oQftQ/xGQOZkKkKHu/oHRLID9JPGvpK3M2F
	 4djwBGLlIzdS3HGnhRKSzJjECcr3N4Yaw6eymrJpl8vBvtl/cpEv7/Vhg+dAuiCdq5
	 Yy9UFgAzKLVFN+zHXMySLP+YMA1yRb2baDdp47e3jUHgmj5CwPCjNo3Ir1PyLE+AF6
	 91lFzGtvZg1BoevgPh+Eny5jz5GyGV5bkpvWWEClqR09ZQJj0kJMV0ZYUJ9Q+jTPNx
	 McK7byk8mllSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] clocksource/drivers: Add support for the Renesas
 RZ/N1 timers
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SGVydmUgQ29kaW5hIChTY2huZWlkZXIgRWxlY3RyaWMp?= <herve.codina@bootlin.com>
Cc: robh@kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721082952.215691-3-herve.codina@bootlin.com>
References: <20260721082952.215691-1-herve.codina@bootlin.com>
 <20260721082952.215691-3-herve.codina@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 08:43:51 +0000
Message-Id: <20260721084351.CDA391F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] Down-counter returned without bitwise inversion for clocksourc=
e and sched_clock.
- [High] Uninitialized event_handler dereference when an interrupt fires ea=
rly.
- [High] Inappropriate assignment of a 16-bit timer for system clocksource =
and sched_clock.
--

--- Patch [2]: [PATCH v4 2/4] clocksource/drivers: Add support for the Rene=
sas RZ/N1 timers ---
commit eef53d5f7f215d9a1bbe8d768ba6df4cf250b8ae
Author: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>

clocksource/drivers: Add support for the Renesas RZ/N1 timers

This commit introduces support for the Renesas RZ/N1 SoC timer block.
It manages 6 16-bit timers and 2 32-bit timers, allowing configuration
for periodic or one-shot modes.

> diff --git a/drivers/clocksource/timer-rzn1.c b/drivers/clocksource/timer=
-rzn1.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/clocksource/timer-rzn1.c

[ ... ]

> +static irqreturn_t rzn1_timer_interrupt(int irq, void *dev_id)
> +{
> +	struct rzn1_timer *timer =3D dev_id;
> +
> +	/* Ack the interrupt */
> +	readl(timer->base + RZN1_TIMER_CLEAR_INT_REG);
> +
> +	timer->ced.event_handler(&timer->ced);

[Severity: High]
Can timer->ced.event_handler be NULL here?

If a spurious interrupt fires after devm_request_irq() or enable_irq() is
called, but before clockevents_config_and_register() populates the event
handler, will this unconditionally dereference a NULL pointer?

> +	return IRQ_HANDLED;
> +}

[ ... ]

> +static u64 notrace rzn1_sched_read(void)
> +{
> +	return readl_relaxed(rzn1_sched_clock->base + RZN1_TIMER_CURRENT_COUNT_=
REG);
> +}
> +
> +static u64 rzn1_clksrc_read(struct clocksource *cs)
> +{
> +	return readl_relaxed(rzn1_sched_clock->base + RZN1_TIMER_CURRENT_COUNT_=
REG);
> +}

[Severity: Critical]
Is this hardware timer a down-counter?

Since the timer is configured with RZN1_TIMER_LOAD_COUNT_REG, if the raw
CURRENT_COUNT_REG value is decrementing, will the timekeeping and scheduler
core observe a massive positive delta on every read due to unsigned
arithmetic wrap-around?

Does this value need a bitwise inversion to ensure a monotonically increasi=
ng
counter for the clocksource framework?

[ ... ]

> +static int rzn1_local_timer_starting_cpu(unsigned int cpu)
> +{
> +	struct rzn1_timer *timer;
> +
> +	if (cpu >=3D RZN1_TIMER_NB_32BIT_TIMERS)
> +		return 0;
> +
> +	timer =3D &rzn1_tab_timers[cpu + RZN1_TIMER_BASE_INDEX_32BIT_TIMERS];
> +
> +	timer->ced.cpumask =3D cpumask_of(cpu);
> +	irq_force_affinity(timer->ced.irq, cpumask_of(cpu));
> +	enable_irq(timer->ced.irq);
> +
> +	clockevents_config_and_register(&timer->ced, timer->rate, 1,
> +					GENMASK(timer->width - 1, 0));

[Severity: High]
Is it safe to call enable_irq() before registering the clockevent device?

If an interrupt occurs immediately after enable_irq(), rzn1_timer_interrupt=
()
will be called before clockevents_config_and_register() sets up the
event_handler, potentially causing the NULL pointer dereference mentioned
above.

[ ... ]

> +static int rzn1_timer_setup_timers(struct platform_device *pdev,
> +				   struct rzn1_timer *tab_timers,
> +				   unsigned int first_timer_index,
> +				   unsigned int last_timer_index,
> +				   void __iomem *base, unsigned long clock_rate,
> +				   bool irq_disabled)
> +{

[ ... ]

> +		if (irq_disabled)
> +			irq_set_status_flags(timer->ced.irq, IRQ_NOAUTOEN);
> +
> +		ret =3D devm_request_irq(dev, timer->ced.irq, rzn1_timer_interrupt,
> +				       IRQF_TIMER, timer->ced.name, timer);
> +		if (ret < 0)
> +			return dev_err_probe(dev, ret, "timer%u: Failed to request IRQ\n", i);
> +
> +		rzn1_timer_int_enable(timer);
> +	}

[Severity: High]
Could this also trigger a NULL pointer dereference?

Since the IRQ is requested and enabled at the controller level here, before
clockevents_config_and_register() is called in the subsequent setup steps, =
an
early interrupt could trigger a crash.

[ ... ]

> +static int rzn1_timer_probe_first(struct platform_device *pdev,
> +				  struct rzn1_timer *tab_timers,
> +				  void __iomem *base, unsigned long clock_rate)
> +{

[ ... ]

> +	/*
> +	 * At this point, no more operations can fail. Perform remaining
> +	 * operations. Starting by handling the first 16-bit timer
> +	 */
> +	timer =3D &tab_timers[RZN1_TIMER_BASE_INDEX_16BIT_TIMERS];
> +
> +	rzn1_timer_init(timer, RZN1_TIMER_BASE_INDEX_16BIT_TIMERS, base, clock_=
rate);
> +	rzn1_timer_config(timer, GENMASK(timer->width - 1, 0), true);
> +
> +	rzn1_sched_clock =3D timer;
> +
> +	sched_clock_register(rzn1_sched_read, rzn1_sched_clock->width, rzn1_sch=
ed_clock->rate);
> +
> +	rzn1_clocksource.mask =3D CLOCKSOURCE_MASK(rzn1_sched_clock->width);
> +	clocksource_register_hz(&rzn1_clocksource, rzn1_sched_clock->rate);

[Severity: High]
Will using a 16-bit timer for the system clocksource break NO_HZ_IDLE?

Since the 16-bit timer is fed by a 1 MHz clock (clock_rate / 25), it will
wrap every ~65.5 milliseconds. Will this short wrap period force the core
timekeeping code to wake the system extremely frequently just to accumulate
time?

Would it be better to dedicate one of the available 32-bit timers to act
as the system clocksource and sched_clock?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721082952.2156=
91-1-herve.codina@bootlin.com?part=3D2
