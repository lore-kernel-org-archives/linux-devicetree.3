Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256ED2EA749
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 19:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778960579; cv=none; b=rvBCMQOzCHRZJlIp+eOMelnffXZEMRCmwQF5jMyDmgIhbv4LJ5koO8BFSqCT9z1q2QD9wTcVUAfGGnX9GYE0vqy6m8hpt3ArgU1YjdjGeYCwFA3lgEvHkq4FQO5LAgcRJ+8bwj1BpdzWCmGdu3ZBaDjBT0teWvC9DhK8s+9b/CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778960579; c=relaxed/simple;
	bh=icrYgJeoiJp6GjLcRex+OWljT6sjR9uqwHqOqvUVbKs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oExKC6Xyi9HhzpIakQ2Q8sQO8BZfwJsxun1OjqdAi2ty2GGOr9wKpQuwFS/y7aYepjtkWYWw9JG5yc3+pBf8X6yT6qcW1i/1O208VwSJaRuM74Cth8rLZsrPC3i13avcaHYz/k6LWHYyevX3ukTVgm38tiM1tFz0Xzz8VJMhd+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ocHz4iCM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ocHz4iCM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2388C19425;
	Sat, 16 May 2026 19:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778960578;
	bh=icrYgJeoiJp6GjLcRex+OWljT6sjR9uqwHqOqvUVbKs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ocHz4iCMCnmPAS92QM+7wT9MZOIkXX96PB+Ox/uxJD+yDxS6y/wtcouXlvb1QCIIM
	 fxlPuhnRwOa/lttDzEvTtvBh1yrMBNI0vvBmOI9tfOLJ1WjUbhU5gnNz8KRaGmXi2S
	 kZnFlYtkfqJ0G7VcJ4VGoG4FrKJya58OXC+adRbESdUHqoou4sSOOJ2O53qq/PA4vQ
	 EZSovPeUzIusF+BcziOEVhcNEEWM819ZFbH28CxKhOWeKudQZs7Alpiq09ReIdybo+
	 MVhD8fnIpYEyiNnpJAyvPpSqGAtN1IzYt9zW1IeVn3Fm+u9HL09JSEAVl+fa+A46sp
	 vWwiv8n78qobQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] clocksource/timer-econet-en751221: Disable IRQ
 until cevt registered
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260516182648.3987792-4-cjd@cjdns.fr>
References: <20260516182648.3987792-4-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 19:42:57 +0000
Message-Id: <20260516194258.B2388C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Incomplete Race Condition Fix / NULL Pointer Dereference
- [High] Missing Teardown in CPU Hotplug / Error Path Rollback Failure
- [High] Missing Hardware Clock Enable and Reference Leak
- [Low] Redundant API Usage for per-CPU Interrupt
--

commit 5ebbb6312519c50062084d8964d9f2a0fe342d0f
Author: Caleb James DeLisle <cjd@cjdns.fr>

clocksource/timer-econet-en751221: Disable IRQ until cevt registered

This commit attempts to eliminate a race condition where the interrupt
could trigger before the clockevent device is fully registered and its
event handler is set. It achieves this by setting the no-auto-enable
flag and delaying the interrupt enablement until after registration.

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

Does this completely resolve the race condition?

If the clockevents core rejects the new device during registration,
dev->event_handler remains null. Because the hardware timer is unconditiona=
lly
started above and there is no set_state_shutdown callback, the timer cannot
be stopped on rejection.

When the timer eventually wraps and fires, will cevt_interrupt() execute
a null event_handler and crash?

>  	return 0;
>  }
> =20
> @@ -177,6 +176,8 @@ static int __init timer_init(struct device_node *np)
>  		goto out_membase;
>  	}
> =20
> +	irq_set_status_flags(econet_timer.irq, IRQ_NOAUTOEN);

This isn't a bug, but is this explicit flag setting redundant?

request_percpu_irq() requires the target interrupt to be configured as a
per-cpu devid interrupt. The core function irq_set_percpu_devid_flags()
already applies IRQ_NOAUTOEN alongside IRQ_PER_CPU_DEVID, meaning the flag
is guaranteed to be set before request_percpu_irq() is executed.

Are we missing a call to clk_prepare_enable() for the clock fetched earlier
in timer_init()?

If the clock is never formally enabled with a positive reference count, the
common clock framework late initcall clk_disable_unused() might turn off
the clock. Would shutting off the clock underneath an active system timer
instantly stop the hardware counter and lock up timekeeping?

Also, does this code leak the clock reference by never calling clk_put()
on the returned clock pointer on both success and error paths?

Is a teardown callback missing for cpu hotplug?

timer_init() calls cpuhp_setup_state() with null as the teardown callback:

    ret =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
                            "clockevents/econet/timer:starting",
                            cevt_init_cpu, NULL);

When a cpu is offlined, disable_percpu_irq() is never called, leaving the
per-cpu interrupt unmasked on the dying cpu. Without a set_state_shutdown
callback, does the hardware timer remain running, potentially causing
spurious wakeups or preventing low-power states?

Furthermore, if cpuhp_setup_state() fails on a cpu, the core cannot roll ba=
ck
the successfully started processors because of the missing teardown callbac=
k.
The error path then frees the interrupt action while hardware timers are
still running. Will this lead to an unhandled interrupt storm?

>  	ret =3D request_percpu_irq(econet_timer.irq, cevt_interrupt, np->name,
>  				 &econet_timer_pcpu);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516182648.3987=
792-1-cjd@cjdns.fr?part=3D3
