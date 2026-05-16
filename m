Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B091E309F1D
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 20:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778961998; cv=none; b=D4dzKT7MpVZ8NRrZ25R3G7JgTYEPp43dAuYz7YKboBUp89LnDWf6tZfcXvX25Ee1xC95DA4yyJQVspjUNcSza7X60wFGsGsdvTgHmYC+AEQYdBaRrT5mLW7rJT3vb5P4/jv+E1AyTc2FnUdB8SgjS+D4H/LjOpDCejfIF/4lZCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778961998; c=relaxed/simple;
	bh=N5zj3wnWyUMGx0AuEUPMMjYeWTFSkvE1jUAZ7YVLTpg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OMV7Tz0p38mjCt/DnxN3R4JNcI1Mfg5f91WJmEy33SOWopw9tcq1iqA9MVKpbeP9m4hpEjCF+RleToDoU86oGP8LcJ00+pM5eKeooAw7cJkZILpz8Z7udBUfHFLU+xcIfjcLyEved+XOvM9me+og9GwB8p3XoZVvwbEknDy1538=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oX6Ntjqi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oX6Ntjqi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF88C19425;
	Sat, 16 May 2026 20:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778961998;
	bh=N5zj3wnWyUMGx0AuEUPMMjYeWTFSkvE1jUAZ7YVLTpg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=oX6NtjqiKmu+bZ1/3XnwV3piMhuKaFNchvue8Sid+upoOThqh/nF/KFDNaJcDMffY
	 vep+qPMcOYIweToigWrmnOCqPFylEAklVFro3X/jRsFY1A1Rmk4qQOrNRB97xOYoG5
	 YDWGTJls4GCAB1uzJHBtK5zyxHSWog45s8IoX8YGW7aiPWFmrmwcdX3fI8Ba305oFL
	 qTfbfnBXRvprsmUKq5IdNedOeCZZN2EkaJaLBf1ErnRbVWZrbFpL48Lp4OJADLeLNo
	 CrJtTI5AdKVcj6sO4WbUrgKamtDlyxvHGp5E33tazD2M/1DoISFnD8+bB5MIerYR1e
	 Dnc8vJCbGlAiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] clocksource/timer-econet-en751221: Support
 EN751627 without percpu IRQ
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260516182648.3987792-5-cjd@cjdns.fr>
References: <20260516182648.3987792-5-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 20:06:37 +0000
Message-Id: <20260516200638.0FF88C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing bounds check on `num_blocks` leads to buffer overflow and =
memory corruption.
- [High] Off-by-one error in `cpuhp_setup_state` failure path causes out-of=
-bounds array access and invalid IRQ free.
- [High] Missing CPU hotplug teardown callback causes unbalanced `enable_ir=
q` warnings and use-after-unmap crashes on initialization failure.
--

commit c9306a7aa40ae1fa4dc34819e52ba88137234f75
Author: Caleb James DeLisle <cjd@cjdns.fr>

clocksource/timer-econet-en751221: Support EN751627 without percpu IRQ

EN751627 is based on the 1004Kc which uses a different interrupt number
for each CPU timer. Support both this and the EN751221 which uses a
single percpu interrupt.

> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocks=
ource/timer-econet-en751221.c
> index ed750e39cc4fa..dea6dbafa16ea 100644
> --- a/drivers/clocksource/timer-econet-en751221.c
> +++ b/drivers/clocksource/timer-econet-en751221.c
> @@ -107,7 +128,10 @@ static int cevt_init_cpu(uint cpu)
>  	clockevents_config_and_register(cd, econet_timer.freq_hz,
>  					ECONET_MIN_DELTA, ECONET_MAX_DELTA);
> =20
> -	enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
> +	if (econet_timer.is_percpu)
> +		enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
> +	else
> +		enable_irq(cd->irq);

Will this cause unbalanced enable_irq() warnings when a CPU is brought back
online?

Since cpuhp_setup_state() provides NULL for the teardown callback, taking a
CPU offline leaves the IRQ depth at 0.

When brought back online, cevt_init_cpu() calls enable_irq() again, which
could trigger the IRQ subsystem's unbalanced enable warning.

Also, if cpuhp_setup_state() fails midway, the hotplug core attempts to roll
back CPUs but does nothing due to the NULL teardown callback. The driver th=
en
proceeds to unmap MMIO memory and free IRQs.

Could this leave active clockevent devices registered that will crash the
system when their set_next_event callback accesses the unmapped memory?

[ ... ]

> @@ -148,9 +177,23 @@ static void __init cevt_init(struct device_node *np)
> =20
>  static int __init timer_init(struct device_node *np)
>  {
> -	int num_blocks =3D DIV_ROUND_UP(num_possible_cpus(), 2);
> +	int num_blocks =3D of_address_count(np);

[ ... ]

> @@ -160,7 +203,7 @@ static int __init timer_init(struct device_node *np)
> =20
>  	econet_timer.freq_hz =3D clk_get_rate(clk);
> =20
> -	for (int i =3D 0; i < num_blocks; i++) {
> +	for (i =3D 0; i < num_blocks; i++) {
>  		econet_timer.membase[i] =3D of_iomap(np, i);

Could this overflow the econet_timer.membase array?

The econet_timer.membase array is statically sized to ECONET_NUM_BLOCKS.

If a device tree specifies more address resources than ECONET_NUM_BLOCKS, t=
his
loop will write out of bounds and corrupt adjacent memory like the irqs arr=
ay.

Also, if num_blocks is less than required for the number of CPUs, will
cevt_dev_init() dereference unmapped NULL memory?

[ ... ]

> @@ -216,11 +270,20 @@ static int __init timer_init(struct device_node *np)
>  	return 0;
> =20
>  out_irq_free:
> -	free_percpu_irq(econet_timer.irq, &econet_timer_pcpu);
> +	for (; i >=3D 0; i--) {
> +		if (econet_timer.is_percpu) {
> +			free_percpu_irq(econet_timer.irqs[i], &econet_timer_pcpu);
> +		} else {
> +			free_irq(econet_timer.irqs[i], NULL);
> +		}
> +	}

Could this perform an out-of-bounds access or free an uninitialized IRQ?

After successfully requesting num_irqs interrupts in the loop above, the lo=
op
variable i is equal to num_irqs.

If the subsequent cpuhp_setup_state() call fails, the code executes goto
out_irq_free without decrementing i.

If num_irqs equals ARRAY_SIZE(econet_timer.irqs), this will access
econet_timer.irqs[num_irqs], which is past the end of the array. Even if
within bounds, it calls free_irq() on an unrequested index.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516182648.3987=
792-1-cjd@cjdns.fr?part=3D4
