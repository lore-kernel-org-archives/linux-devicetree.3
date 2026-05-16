Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84E23909A2
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 23:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778972878; cv=none; b=SYQM0VQSIPNIlFcOLK890AAsKfKHNpdLk4EpW/prL4LEzQFwWZOopftgWz1LyCDzKiynjMoTvb/lWSX0RAD6TmazAwVOYwsB2hc/DtW2IFvGFNtVkqQLY5FKWHRV7KhG9gmKqycmstK9d3gh0zqJfW4uB0xG2rWtdEfWPB7sGVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778972878; c=relaxed/simple;
	bh=PFX4Cagodk1jK4vQRA02nSHCrNVIXmqDUjAm3J6Sx/E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gfje1FpQCRF2vLaUjUQEUnbp39PNi2UK7rLLbEuQM6uckn8ETN+0gJkdZepTYVUjjvzVGTQ5cAGONN8GPGwwdhzJLIZZ6tNEXH9J3R+tEOiXjsmkm8WGk9zXt+BZsX8Lrse5j8O5dcG6clbbXiA4vY0XoyRiGHiqvAqr0PkrMYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W9gSY881; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W9gSY881"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51A85C19425;
	Sat, 16 May 2026 23:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778972877;
	bh=PFX4Cagodk1jK4vQRA02nSHCrNVIXmqDUjAm3J6Sx/E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=W9gSY881GxNAvfKex/tJ0f3Ce7lV8mJcwUIiZ+jf97m6YeVO6RtQSFiksRyUxPWQ/
	 5t6XK1w4mDERsHB5kWXFV98fHhwY/RABP5sb6wocOlj4odI3LXOpQIM6ZQ02yCotvc
	 aYJ9hp7INA8u7kJUm5Ah8Bso8iUnoRvWZgb6rHW/W9SLrVnQ22GQ84+JE02Na4jFGc
	 TqgyAEt1MMpb3kNzOFql+Ya7IdyqPqM20CBfp45Pt6/4YYLHw3/QyLn71fQB8x3aAX
	 UNjwFzjWOH+CkEGmbM50mi7S6IgOwF5D1b7wpKsvmWACbeNleL2O9x/f4Czj8yEnq3
	 E9FKJrIcSykEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] clocksource/timer-econet-en751221: Disable IRQ
 until cevt registered
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260516215720.4160831-4-cjd@cjdns.fr>
References: <20260516215720.4160831-4-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 23:07:56 +0000
Message-Id: <20260516230757.51A85C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] The error path for `cpuhp_setup_state()` leaves the clockevent=
 device registered and the per-CPU interrupt enabled, leading to a leaked a=
ction and a Use-After-Free/Data Abort.
- [High] The patch attempts to fix a NULL pointer dereference race conditio=
n but leaves the `dev->event_handler` uninitialized if the clockevent devic=
e is rejected by the core, leading to a kernel panic.
- [High] The driver registers its CPU hotplug state with a `NULL` teardown =
callback, leaving the per-CPU interrupt enabled when a CPU is offlined.
--

commit b63915756d157ccb863471270a1e61036ce0f8e5
Author: Caleb James DeLisle <cjd@cjdns.fr>
clocksource/timer-econet-en751221: Disable IRQ until cevt registered

This commit reorders the clockevent registration sequence to call
enable_percpu_irq() after clockevents_config_and_register(). This aims
to eliminate a race condition where the timer interrupt could fire before
the event handler is initialized.

> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocks=
ource/timer-econet-en751221.c
> index 155471f68e6f8..ed750e39cc4fa 100644
> --- a/drivers/clocksource/timer-econet-en751221.c
> +++ b/drivers/clocksource/timer-econet-en751221.c
> @@ -104,12 +104,11 @@ static int cevt_init_cpu(uint cpu)
>  	reg =3D ioread32(reg_ctl(cpu)) | ctl_bit_enabled(cpu);
>  	iowrite32(reg, reg_ctl(cpu));
> =20
> -	enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
> -
> -	/* Do this last because it synchronously configures the timer */
>  	clockevents_config_and_register(cd, econet_timer.freq_hz,
>  					ECONET_MIN_DELTA, ECONET_MAX_DELTA);
> =20
> +	enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
> +
>  	return 0;
>  }

If tick_check_new_device() rejects the timer (for instance, because another
higher-rated clockevent device is available), does the device remain in the
DETACHED state without the clockevents core initializing dev->event_handler?

Since the hardware timer is already explicitly enabled before registration
via ioread32(reg_ctl(cpu)) | ctl_bit_enabled(cpu), it will eventually wrap
and trigger an interrupt.

With enable_percpu_irq() unmasking the interrupt line, could
cevt_interrupt() execute and dereference a NULL dev->event_handler?

Should cd->event_handler be explicitly initialized to
clockevents_handle_noop prior to registration to fully resolve this race?

[ ... ]

> @@ -177,6 +176,8 @@ static int __init timer_init(struct device_node *np)
>  		goto out_membase;
>  	}
> =20
> +	irq_set_status_flags(econet_timer.irq, IRQ_NOAUTOEN);
> +
>  	ret =3D request_percpu_irq(econet_timer.irq, cevt_interrupt, np->name,
>  				 &econet_timer_pcpu);
> =20

Looking further down in timer_init(), the driver registers its CPU hotplug
state with a NULL teardown callback:

    ret =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
                            "clockevents/econet/timer:starting",
                            cevt_init_cpu, NULL);

Since the driver registers its CPU hotplug state with a NULL teardown
callback, what happens when a CPU is hotplugged out?

Because the clockevent device lacks a set_state_shutdown callback, the
clockevents core cannot turn off the hardware timer. This appears to leave
the per-CPU interrupt unmasked at the interrupt controller and the timer
hardware actively running.

When the CPU is later brought back online and unmasks its interrupts, could
it instantly take a pending timer interrupt before initialization is
complete?

Additionally, if cpuhp_setup_state() fails on a subsequent CPU after
succeeding on CPU 0, it attempts to roll back CPU 0. Because of the NULL
teardown callback, disable_percpu_irq() and clockevents_unbind_device()
are never executed for CPU 0.

The error path then jumps to out_irq_free:

out_irq_free:
    free_percpu_irq(econet_timer.irq, &econet_timer_pcpu);
out_irq_mapping:
    irq_dispose_mapping(econet_timer.irq);
out_membase:
    for (int i =3D 0; i < ARRAY_SIZE(econet_timer.membase); i++) {
        if (econet_timer.membase[i])
            iounmap(econet_timer.membase[i]);
    }

If the interrupt is still enabled on CPU 0, will __free_percpu_irq() safely
warn and return without freeing the action?

Since the hardware timer is still running on CPU 0 and the driver proceeds
to unmap the membase via iounmap(), could the timer fire and cause the
still-registered cevt_interrupt handler to access unmapped MMIO memory,
resulting in a Data Abort?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516215720.4160=
831-1-cjd@cjdns.fr?part=3D3
