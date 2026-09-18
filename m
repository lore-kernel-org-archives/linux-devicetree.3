Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5297F502D69
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 15:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745980; cv=none; b=jvG1vc3PejbZrRp3ksRcPM3VutOYz3qooNXiL0b9dWOQTt48ugdh/bjYUbn4LqTB9SLAMohVrYuzoqPrG5Oh+Swo5LLYHcrb9mH8tQfV1ZtEPWS98v+zRyXG6p3BBnixMOd8RPH+SRXGwYzSiQjTNhw8oPIgKXz+H/dIb1R4pZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745980; c=relaxed/simple;
	bh=VcOKls1QlnKzSBARwcNn8MAxx1bDPou3NxE/AIX+Z2I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rgLq0E5ZjdmeIA8OhZlNvWo8863RwpdXGdi/cavpCE3rJtx+6MTZw7kgdKQlEr1wscQ3a57cwrxJSCbU7qQvvzDbJC2yUK/+yN5jtgMsV9qxwpWsTdkU7QA3Com/J031+uht54NKGofo/V6tHuBInov3B10qrVDH0G2YWGKalZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gaZUi7lK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gaZUi7lK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3931F00898;
	Fri, 18 Sep 2026 15:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789745967;
	bh=dcf9UiX9G6cNDUpncIFZu10kMwq8f11+1KpeWdyKpk4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gaZUi7lKIaXZ387J4FRYR5eORt+0gMlBG0LnbinGJBzKcUB5DazFxK1aqtU+p3T8a
	 LMv8wp4jxZMokIRSDp0nvpmNVPe/68hoJLP+CeIfug2FMMEk9aUIRxlYa8H8CPhxMl
	 R9yZt6JRrX+IZwX2qDfEYDiaY7gjgY3fx3oT1jRYIrY4fswkcpyMuNodZV7PE0P56/
	 bKBNavxKIELRECWAMTlU7UQWB9wjQvX9qN4iAM9aDaFMotQWo//HM2DgwxrK7oTkFR
	 wRvMeGcP4rpxLyON/xOrVXw71TzPAPxHb03x1U377GS53gE5jORoere74AC9cYwSnT
	 Qqan+WpbkUcJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 5/5] clocksource/timer-econet-en751221: Support
 EN751627 without percpu IRQ
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260918152822.343811-6-cjd@cjdns.fr>
References: <20260918152822.343811-1-cjd@cjdns.fr>
 <20260918152822.343811-6-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 15:39:26 +0000
Message-Id: <20260918153926.BD3931F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] timer-econet: interrupt storm on CPU hotplug due to missing teardo=
wn and this_cpu_ptr()
--

commit 3aa46ace7764334c9e5c6183c5e2aa48421bd244
Author: Caleb James DeLisle <cjd@cjdns.fr>

clocksource/timer-econet-en751221: Support EN751627 without percpu IRQ

EN751627 is based on the 1004Kc which uses a different interrupt number
for each CPU timer. Support both this and the EN751221 which uses a
single percpu interrupt.

> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocks=
ource/timer-econet-en751221.c
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
Will this trigger an unbalanced enable warning when a CPU is brought online?

Since the timer is not stopped and the IRQ is never disabled when a CPU is
offlined, calling enable_irq() here operates on an already-enabled IRQ.

[ ... ]
> @@ -173,22 +230,32 @@ static int __init timer_init(struct device_node *np)
[ ... ]
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
Is it safe to pass NULL for dev_id here when setting up migratable standard
IRQs?

When a non-per-cpu IRQ is migrated to another CPU, the handler will incorre=
ctly
fetch the timer context of the executing CPU rather than the one that fired:

drivers/clocksource/timer-econet-en751221.c:cevt_interrupt() {
    struct clock_event_device *dev =3D this_cpu_ptr(&econet_timer_pcpu);
    ...
}

Furthermore, is a teardown callback missing when registering the CPU hotplug
state?

drivers/clocksource/timer-econet-en751221.c:timer_init() {
    ...
    ret =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
                            "clockevents/econet/timer:starting",
                            cevt_init_cpu, NULL);
    ...
}

Because there is no hotplug teardown callback or set_state_shutdown, the ti=
mer
is never stopped when a CPU is offlined.

The standard timer IRQ migrates to an online CPU, where the interrupt handl=
er
checks the wrong CPU's timer pending bit and constantly returns IRQ_NONE. S=
ince
IRQF_TIMER bypasses the spurious IRQ detector, this sequence appears to cre=
ate
an unbreakable interrupt storm that hangs the kernel.

> +
> +		if (ret < 0) {
> +			pr_err("%pOFn: IRQ %d setup failed: %pe\n", np,
> +			       i, ERR_PTR(ret));
> +			goto out_irq_free;
>  		}
>  	}
> =20
>  	cevt_init(np);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918152822.3438=
11-1-cjd@cjdns.fr?part=3D5
