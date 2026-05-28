Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A3C3BE621
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 16:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779986522; cv=none; b=pA/Nk2IW5BtsrwDwxjGC9JHoDBB8sIMrDzO1aKfi58WlfVC05l6Ygp7Qo46MOVGI58hTFcg2n0ffOXRF4clDNFi6JOcVyQK17iUFhI8bjZF32lAAoKPJG4SdbjywhtFMGxC4AbFCev4zuSa5E7tgizFapZhWc76dcBfLSs1iA2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779986522; c=relaxed/simple;
	bh=xkaMEIup11ASgNPLM8UjylQoEes05caBm+bEPTNxN2E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cHbAt/ppQVuZ5ZgefJutO/zB0wc0E8HGC8MhaqhMNKD+fIXPsUCXws9lppB+QS3Yb7rbWSn6r1JBUZhKTP+G3uDUPIK83GIQOobQzXJyz4nm0kp5q0beinFimNzvGZVjMsK52QHNfoZdvukaSg5X0kYx1aBgwHUz0pXt9Zk5Tsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uo4DQ9d+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uo4DQ9d+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE151F00A3A;
	Thu, 28 May 2026 16:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779986519;
	bh=pMhxaFwmBCBVWhI5jTrGaYjvLpRtMIma3CLQ3E8r2CU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Uo4DQ9d+bMDnJSNAwW0F9r31WbRYBu4lFk0gEcxmm65FQKMOys497KJVHVqnxKTV1
	 +2bK1HxmfhfsJCKkNxV3ylyUY0AsuBVWUj4MgfHOvDhonTL2EgUd77OG0cPuxQaAiH
	 IDl1wOWtzxq7kW/fUPaBYBGa36qt2//UuuScyGiKUDhJLcrbAy7N0dk2aNfB/cRJwz
	 v6CuQl3v2/ovbe4wWLV2Ai4hN4WafZjayhvBIcEb0SArFw+iEhPZwWg8ELW2V6xKwC
	 fHjFu52tYEbrA6ANc3rutWYvNh1ydvy99gpckZbWPjx+7vHAO9ybtp4H//nQ4uomt4
	 TP/v60y0XCC8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/5] clocksource/timer-econet-en751221: Support
 EN751627 without percpu IRQ
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260528140046.2897674-6-cjd@cjdns.fr>
References: <20260528140046.2897674-6-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 16:41:58 +0000
Message-Id: <20260528164158.CDE151F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The interrupt handler incorrectly relies on `this_cpu_ptr` for sta=
ndard IRQs, causing an interrupt storm if the IRQ executes on a different C=
PU.
- [Medium] Missing CPU hotplug teardown callback causes an unbalanced `enab=
le_irq()` kernel warning when a CPU is offlined and then onlined again.
--

commit 0de42286a034bc944e765e97434f913831bc2960
Author: Caleb James DeLisle <cjd@cjdns.fr>
Subject: clocksource/timer-econet-en751221: Support EN751627 without percpu=
 IRQ

This commit adds support for the EN751627 timer, which uses a different
interrupt number for each CPU timer instead of a single percpu interrupt.

> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocks=
ource/timer-econet-en751221.c
> index f2c4c1ee0a56b..040386ded132a 100644
> --- a/drivers/clocksource/timer-econet-en751221.c
> +++ b/drivers/clocksource/timer-econet-en751221.c
> @@ -110,7 +131,10 @@ static int cevt_init_cpu(uint cpu)
>  	clockevents_config_and_register(cd, econet_timer.freq_hz,
>  					ECONET_MIN_DELTA, ECONET_MAX_DELTA);
> =20
> -	enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
> +	if (econet_timer.is_percpu)
> +		enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
> +	else
> +		enable_irq(cd->irq);

[Severity: Medium]
Will this cause an unbalanced enable_irq() warning if a CPU is offlined
and onlined again?

The driver registers a dynamic CPU hotplug state via cpuhp_setup_state()
with cevt_init_cpu() as the starting callback, but passes NULL for the
teardown callback.

Because there is no teardown callback to call disable_irq() when a CPU is
offlined, the IRQ descriptor's enable depth remains 0. When the CPU is
brought back online, cevt_init_cpu() will execute again and call
enable_irq() a second time.

While this missing teardown existed before this patch, it was hidden
because enable_percpu_irq() does not track descriptor depth. The warning
appears to be newly exposed by the introduction of enable_irq().

[ ... ]

> @@ -173,22 +230,32 @@ static int __init timer_init(struct device_node *np)

[ ... ]

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
Could passing NULL for dev_id lead to an interrupt storm if the IRQ
executes on a different CPU?

For standard (non-percpu) IRQs, cevt_interrupt() currently calculates the
timer device using this_cpu_ptr(). If the interrupt fires on a different
CPU (e.g., due to CPU hotplug migrating the IRQ, or a spurious interrupt),
this_cpu_ptr() will return the timer for the currently executing CPU, not
the CPU for which the interrupt was intended.

The handler would then check the wrong CPU's status, find it not pending,
and return IRQ_NONE. The actual pending interrupt would be left
unacknowledged.

Would it be better to pass the specific CPU's timer pointer as dev_id here
and update cevt_interrupt() to use it instead of this_cpu_ptr()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528140046.2897=
674-1-cjd@cjdns.fr?part=3D5
