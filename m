Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36B51DE8BE
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 00:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778979323; cv=none; b=snVpLBswBGFjSxX+aQvB7a33Jj1X/3IHqGeR1Js1C72B+LTO8hXDg0fw3oF3gY/GFGGyQzmo+rQ/HZSWbc3TKjVkxyt4OoNGNfLvaU7GXlmY+0fEv0G0naDUdxjqG3r9/4AYHqyS/awsYbWUeinDtry5tgO06dJpoF3AKhT27B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778979323; c=relaxed/simple;
	bh=FGHNosw6KUNaWlhWBba8gxs5GoOAUCBnSJnupr3eQ6o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FztfMce5Kt8yYTjzxHmZ/Zf9dzd3uPkM4NT259YxPZd1IvctW3+QSQux063JcwTmt3whdN9h42i09A/SBI3Lla43IxLfIPi9H4LCn5cF8vzoX2+AV1RVrIaDf1raKi2OsL0P2pOeEPWelOID57HWXtlZU8JbBafk/x76NlBNRFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n1YoCoK1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n1YoCoK1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D28C19425;
	Sun, 17 May 2026 00:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778979322;
	bh=FGHNosw6KUNaWlhWBba8gxs5GoOAUCBnSJnupr3eQ6o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=n1YoCoK176ayq+Q7aGYh4W+/+J2hCVYUclB2ODcXj/43ociL/BNxxfFlU1ycV18+d
	 mSXpfMk55CpkeR++cf6eKFRLnP4+til+UuHV71Ln37Nv0q6auTVZLTbuECI+4kAoIC
	 jJudJzULz6WK9A8TIMSd08LFZBwPfaRUtWVPaU1ofSe+egz5LhAbDWjMDP7E7Z2SzC
	 x5mG2HutLKEhERkz3MRxiVn/bDk+CAnFZxiZaWTN56zTGhGMfJfGxZ1OySE9qPwjHa
	 7khLtl39qdVo8DOf63aPQDUVsKoRQjJmKlWUDEwsQIg1SLl7zVI6FkVYMbqIOhYzD2
	 C2TTBj2GT/ueA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/4] clocksource/timer-econet-en751221: Disable IRQ
 until cevt registered
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260516233943.49502-4-cjd@cjdns.fr>
References: <20260516233943.49502-4-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 00:55:21 +0000
Message-Id: <20260517005522.73D28C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Uninitialized `dev->event_handler` causes a kernel panic if the cl=
ock event device is rejected by the timekeeping core.
- [High] The error path after `cpuhp_setup_state()` fails to roll back the =
hardware state and unregister the clockevent device, resulting in a Use-Aft=
er-Free/Page fault.
- [Low] Redundant `IRQ_NOAUTOEN` flag setting on a per-CPU interrupt.
--

commit fa0659466614df142cddb9c13760b12727964dfe
Author: Caleb James DeLisle <cjd@cjdns.fr>

clocksource/timer-econet-en751221: Disable IRQ until cevt registered

This commit reorders interrupt enablement to occur after clockevent
registration to avoid a race condition with uninitialized event handlers,
and explicitly sets the no-auto-enable flag on the IRQ.

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

The commit message notes this eliminates a race where cevt_interrupt trigge=
rs
before the event_handler is set. Does this reordering fully resolve the iss=
ue?

If the timekeeping core rejects the new clockevent device in
tick_check_new_device(), dev->event_handler will remain uninitialized (NULL=
).
Since the hardware timer is unconditionally started and the IRQ is enabled
here, could the timer eventually wrap around, assert the interrupt, and cau=
se
a NULL pointer dereference in cevt_interrupt()?

Additionally, looking at the error path in timer_init() where cevt_init_cpu=
()
is registered as a hotplug callback:

timer_init() {
    ...
    ret =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
                            "clockevents/econet/timer:starting",
                            cevt_init_cpu, NULL);
    if (ret < 0) {
        pr_err("%pOFn: cpuhp setup failed (%d)\n", np, ret);
        goto out_irq_free;
    }
    ...
}

Because cpuhp_setup_state() is called with a NULL teardown callback, if the
overall hotplug state setup fails, there is no rollback for CPUs that alrea=
dy
successfully executed cevt_init_cpu().

If the out_irq_free error path then unmaps the MMIO base while the clockeve=
nt
devices remain registered and active in the core timer subsystem, will a la=
ter
access to the device (such as invoking cevt_set_next_event()) dereference t=
he
unmapped memory and cause a fatal page fault?

>  	return 0;
>  }

[ ... ]

> @@ -177,6 +176,8 @@ static int __init timer_init(struct device_node *np)
>  		goto out_membase;
>  	}
> =20
> +	irq_set_status_flags(econet_timer.irq, IRQ_NOAUTOEN);
> +

This isn't a bug, but is the manual setting of IRQ_NOAUTOEN necessary here?

Per-CPU interrupts requested via request_percpu_irq() mandate that the
interrupt descriptor has the IRQ_PER_CPU_DEVID flag set. The mechanism that
applies this flag, irq_set_percpu_devid_flags(), automatically sets the
IRQ_NOAUTOEN flag on the interrupt descriptor at the same time.

>  	ret =3D request_percpu_irq(econet_timer.irq, cevt_interrupt, np->name,
>  				 &econet_timer_pcpu);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516233943.4950=
2-1-cjd@cjdns.fr?part=3D3
