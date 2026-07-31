Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551C330C157
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 12:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785500255; cv=none; b=NLlexK70j6mGirDaJYcLPW3GGZi48rLqmiy4lKwe0r0dwY7NxTC770JxhD1FY9deuvzsFOKj0zvaI9wS2/YAuJ941LjbG1OoMIpONOWIzzuCHWJ/Y2vl6yKfCcXmPn6zDdroCldKDMoW4b+AVnvqJY4zGAAdUffzZSNoKmaMakA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785500255; c=relaxed/simple;
	bh=ziTvCR3bdOPdzQp5TDkMyq2u690XI/Ih7N3OF+Noy/E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MksQJkcOJZ1gnec/i+q8EHGAXs1H6qPKX4/g0INP/PobZrVGlJACVm4E+wdBpTllN4riqAYI7qg14dap0o64G2e+VdEVD8c2hcYPpspJAO3ftWZUZ0qTIF04iMNss+vUHr4ILuETb/cRezjJbG/mTtrjasWZIJQwdIRF7Nlu4oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dXWE/rTd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dXWE/rTd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0140C1F00A3A;
	Fri, 31 Jul 2026 12:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785500254;
	bh=DOokuPBpSUo5T7wJ5eGMAdo99IbBR9C5XYJi4gdqIvU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dXWE/rTdOODO10QGQsOBSczFaTMnSDy9w+kLmBRdZdiNWtkxTo6Hp2NuOJN1eRGIv
	 STURTzweyBvzcvcB6Hsolr9FDPWnOEJQNxSfuJFyhL08HfOxAM+UA8YA+jjU8muPIX
	 fl/nSXdKKEZlLSB2Oy4X6nDEdEZUxLndXnXjIzCozB8M9Up5hP8mHjUdKs2bcC7Pqc
	 9iWrV/K3LPMNxyX2SDiG1eyeNSMbdcsHhgn3mB/j1r+PZX93w9IUNuD+J1wtqTnIQh
	 R603GLGJXGafUYH7euqOYIY1+yYHALSBlGxAaWH+l/sRwzCaHKlPB4hRlewrK2MZmL
	 1FnYM1Ub04xyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 5/5] clocksource/timer-econet-en751221: Support
 EN751627 without percpu IRQ
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260731120246.1296955-6-cjd@cjdns.fr>
References: <20260731120246.1296955-1-cjd@cjdns.fr>
 <20260731120246.1296955-6-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 12:17:33 +0000
Message-Id: <20260731121734.0140C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing CPU hotplug teardown callback and missing IRQ_PER_CPU flag=
 causes an interrupt storm and unbalanced enable_irq warnings on CPU offlin=
e/online.
- [High] Timer driver completely fails to probe if the kernel is compiled w=
ith an `NR_CPUS` smaller than the hardware's core count.
--

--- Patch [5]: [PATCH v7 5/5] clocksource/timer-econet-en751221: Support EN=
751627 without percpu IRQ ---
commit 4d23ebf2434d347d3628c6259b6442637444c87f
Author: Caleb James DeLisle <cjd@cjdns.fr>

clocksource/timer-econet-en751221: Support EN751627 without percpu IRQ
   =20
EN751627 is based on the 1004Kc which uses a different interrupt number
for each CPU timer. Support both this and the EN751221 which uses a
single percpu interrupt.

> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocks=
ource/timer-econet-en751221.c
> index f2c4c1ee0a56b..040386ded132a 100644
> --- a/drivers/clocksource/timer-econet-en751221.c
> +++ b/drivers/clocksource/timer-econet-en751221.c

[ ... ]

> @@ -110,7 +131,10 @@ static int cevt_init_cpu(uint cpu)
>  	clockevents_config_and_register(cd, econet_timer.freq_hz,
>  					ECONET_MIN_DELTA, ECONET_MAX_DELTA);
> =20
> -	enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
> +	if (econet_timer.is_percpu)
> +		enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
> +	else
> +		enable_irq(cd->irq);

[Severity: High]
Since cpuhp_setup_state() is registered in timer_init() with a NULL
teardown callback, disable_irq() is never called when a CPU goes offline.

Does this mean that onlining the CPU again will call enable_irq() on an IRQ
that was never disabled, triggering an unbalanced enable kernel warning?

[ ... ]

> @@ -141,19 +165,52 @@ static void __init cevt_init(struct device_node *np)
...
>  static int __init timer_init(struct device_node *np)
>  {
> -	int num_blocks =3D DIV_ROUND_UP(num_possible_cpus(), 2);
> +	int num_blocks =3D of_address_count(np);
> +	int num_irqs =3D of_irq_count(np);
>  	struct clk *clk;
> -	int ret;
> +	int ret, i;
> +
> +	econet_timer.is_percpu =3D of_device_is_compatible(np, "econet,en751221=
-timer");
> +
> +	if (econet_timer.is_percpu && num_irqs !=3D 1) {
> +		pr_err("%pOFn: EN751221 clock must have 1 IRQ not %d\n", np,
> +		       num_irqs);
> +		return -EINVAL;
> +	}
> +	if (num_irqs > ARRAY_SIZE(econet_timer.irqs)) {
> +		pr_err("%pOFn: Too many IRQs max %d got %d\n", np,
> +		       ARRAY_SIZE(econet_timer.irqs), num_irqs);
> +		return -EINVAL;
> +	}
> +	if (num_blocks > ARRAY_SIZE(econet_timer.membase)) {
> +		pr_err("%pOFn: Too many regs: max %d got %d\n", np,
> +		       ARRAY_SIZE(econet_timer.membase), num_blocks);
> +		return -EINVAL;
> +	}

[Severity: High]
Does this code prevent the system from booting if the kernel is compiled
with an NR_CPUS limit smaller than the actual hardware core count?

If the Device Tree exposes more IRQs or register blocks than the
compile-time NR_CPUS bound allows, returning -EINVAL here will cause the
timer probe to fail entirely.

Would it be safer to gracefully bound the resource counts with min() and
initialize up to NR_CPUS timers instead of erroring out?

[ ... ]

> -	irq_set_status_flags(econet_timer.irq, IRQ_NOAUTOEN);
> -
> -	ret =3D request_percpu_irq(econet_timer.irq, cevt_interrupt, np->name,
> -				 &econet_timer_pcpu);
> -
> -	if (ret < 0) {
> -		pr_err("%pOFn: IRQ %d setup failed (%d)\n", np,
> -		       econet_timer.irq, ret);
> -		goto out_irq_mapping;
> +	for (i =3D 0; i < num_irqs; i++) {
> +		irq_set_status_flags(econet_timer.irqs[i], IRQ_NOAUTOEN);
> +
> +		if (econet_timer.is_percpu)
> +			ret =3D request_percpu_irq(econet_timer.irqs[i],
> +						 cevt_interrupt, np->name,
> +						 &econet_timer_pcpu);
> +		else
> +			ret =3D request_irq(econet_timer.irqs[i], cevt_interrupt,
> +					  IRQF_TIMER | IRQF_NOBALANCING,
> +					  np->name, NULL);

[Severity: High]
Does this non-percpu path need to set the IRQ_PER_CPU flag on the interrupt?

When a CPU is offlined, irq_migrate_all_off_this_cpu() will forcibly migrate
this interrupt to a surviving CPU because it isn't marked as a per-CPU
interrupt.

When the hardware timer interrupts the new CPU, cevt_interrupt() uses
this_cpu_ptr() to check the new CPU's timer pending bit. That evaluates
to false, causing it to return IRQ_NONE without acknowledging the original
CPU's timer interrupt.

Could this lead to an unhandled interrupt storm that hangs the system?

> +
> +		if (ret < 0) {
> +			pr_err("%pOFn: IRQ %d setup failed: %pe\n", np,
> +			       i, ERR_PTR(ret));
> +			goto out_irq_free;
> +		}
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731120246.1296=
955-1-cjd@cjdns.fr?part=3D5
