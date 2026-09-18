Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7771150EC11
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 16:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789747318; cv=none; b=Lcyrl+EBfZxl4DIbIaVV+E3btuf04joSxzBcWcivWhNJGLx00LeXoDuYPPtDsJOEoE45HZR/b9/yF+oirMnJzVI6Rq25rwjmJClK/C6zdrNJAWOMepQbmf5TOCPwmLuJe5V0vAhBKLeYsfGDDOM8yDH7YprFUMPE0T/2t6xZsSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789747318; c=relaxed/simple;
	bh=NwESgABexYzM9CkJGcFwKtzX2bXWnBejawTxR4Icq8s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QpL9PRotQv/V/4fq/9g0tE/LVEsMQ8AYf+qRgS8f0dQ8GPayvPWmJcFXFx6KPyOrdHkQQDMDFA4FL3jWACl9Witfgkze7+UDC7YR3LI5/mlHu3mXjF2NxP+VtvL2N/CtPTMVYxC4205auvKulXNF7vSYrKN63ml1v+Gerp3p0j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AaNV0+12; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AaNV0+12"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20D61F000FF;
	Fri, 18 Sep 2026 16:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789747317;
	bh=v7WILO6WyqUzJ36evrUPIt56KgRsw8U+xLTl+7PLmR4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AaNV0+121MM7EqzETZyUiNW6lcYc93wKf1MjubB5fPciOjDKi0h5euK15If4DzhhB
	 gvUFv97FZxf/ObhdngHs6yXANFN3UnM7bu9cslGfRREhMhQK+ou8M8BzwmvgMdMzxc
	 5ERDt0K2sUOyRkxrMq5Z024a8mdLYPmtrYbWV2nFCRzyndOSMk2z1Jhnvh47sf7s2R
	 zuV5f8BWk9D51s4XGGrpDqecGd0TxaP6f1I0zx77f7J51WY3I8b87CvwObQWtvTmAq
	 kMdv9d24yfIVUk4nbSUd9yFna/XCZ8OkL1UYH3DNgv/0BEIitcjW0VUktEqRkN4JSj
	 kz422QA0dxXFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 5/5] clocksource/timer-econet-en751221: Support
 EN751627 without percpu IRQ
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260918153606.344143-6-cjd@cjdns.fr>
References: <20260918153606.344143-1-cjd@cjdns.fr>
 <20260918153606.344143-6-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 16:01:56 +0000
Message-Id: <20260918160156.B20D61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] clockevents/econet: missing cpuhp teardown causes IRQ storms
- [High] clockevents/econet: UAF on timer registers after partial cpuhp set=
up failure
--

commit dc93f390b5bb20c598e0e2ea1ef5ba065d8e2acd
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

> @@ -102,6 +104,25 @@ static int cevt_init_cpu(uint cpu)
>  	struct clock_event_device *cd =3D &per_cpu(econet_timer_pcpu, cpu);
>  	u32 reg;
> =20
> +	if (!reg_ctl(cpu)) {
> +		pr_err("%s: missing address resource for CPU %d\n", cd->name,
> +		       cpu);
> +		return -EINVAL;
> +	}
> +	if (cd->irq <=3D 0) {
> +		pr_err("%s: missing IRQ for CPU %d\n", cd->name, cpu);
> +		return -EINVAL;
> +	}
> +	if (!econet_timer.is_percpu) {
> +		int ret =3D irq_force_affinity(cd->irq, cpumask_of(cpu));
> +
> +		if (ret) {
> +			pr_err("%s: failed to set IRQ affinity to CPU %d: %pe\n",
> +			       cd->name, cpu, ERR_PTR(ret));
> +			return ret;
> +		}
> +	}
> +

[Severity: High]
If this initialization fails on a subsequent CPU (for example, if
irq_force_affinity() returns an error on CPU 1), the cpuhp subsystem will t=
ry
to roll back CPU 0.

Because timer_init() registers cpuhp_setup_state() with a NULL teardown
callback, does this mean CPU 0's clockevent device and timer hardware will
remain active?

If timer_init() then jumps to the out_irq_free error path and unmaps the
timer MMIO registers via iounmap(), will CPU 0's active timer interrupt
handler trigger a panic when it accesses the unmapped memory?

>  	pr_debug("%s: Setting up clockevent for CPU %d\n", cd->name, cpu);
> =20
>  	reg =3D ioread32(reg_ctl(cpu)) | ctl_bit_enabled(cpu);
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
When a CPU is offlined on a platform using standard global IRQs (EN751627),
the missing cpuhp teardown callback means the timer and its IRQ are never
disabled.

Because standard IRQs migrate when a CPU goes offline, will the still-active
IRQ migrate to another CPU?

If the timer hardware fires, cevt_interrupt() handles it on the new CPU,
reads the new CPU's pending bit via this_cpu_ptr(), finds it 0, and returns
IRQ_NONE without clearing the offlined CPU's timer interrupt.

Does this result in an unhandled IRQ storm?

Additionally, when the CPU is brought back online, will calling enable_irq()
on the already-enabled IRQ trigger an unbalanced enable warning?

> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918153606.3441=
43-1-cjd@cjdns.fr?part=3D5
