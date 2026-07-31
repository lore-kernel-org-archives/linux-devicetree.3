Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B1D2EEE9D
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 12:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785500219; cv=none; b=T5Rqc188TuDRx1tf5Uk482xu3RMB3pVHZty6TI7t96Ll4NOK9+VwExZN2Ei+K+czY190D/uHJ/zLUR/sunYvHZKG6qPht9OLwK8FYIl1Ptj3NIR4gKKTXOsaJ/8lRQKtWulV29SluS3ZaQ4IY+clDMN2JiPc2I1XIhB9vqWC30k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785500219; c=relaxed/simple;
	bh=oQ29ZKh2lgABwXWg+q8gXB6vUh9rPdqQiuX9ITX6gxY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GttIcuCvw1KS8UE8aF85E5sVfkkFbwYCprJLbAFGDeKwwc3As/I8cOMX2lwZhVHHaC+qQi0SLT+ahiUqsQePktzEthIdgzPlU4eoPBp8RacYDC4a4ZISrkoZVD5yzFLKKl9jmMFeQqi7bJ5fXfT8SHwjYuqFmf1l/Sk3EdRL+4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvJablTb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JvJablTb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C641F000E9;
	Fri, 31 Jul 2026 12:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785500218;
	bh=0PiBkuc+eiCSeTMyXy450RropfjerGxEuupkVIzFiFs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JvJablTb49DJS85qvfVCXTzfA+A3mlKu+Lp64JfWb+aPFLjPOoYSTU6Ylwhef13RI
	 bIgRfDtBuBGHuhKOxiD/V9un6vu8cyq9yiqPgLIwWtoruZgA8kQkzxJ9qiKifcZeSH
	 y+9Jz99oCX52mGe1DCuCQL0Cfb6ODSRG4zeVut55r5yCVhAeZHwvvKLH5I+ead7qsK
	 GO5QTqYjl6gWlx11vRGf6slecO8UcZ7th2RQ5ImQK4EBGLjgEiu5gkw08d6lqWEF54
	 QJXH1R0A7W7C0MgAuYhLfUdFlyPlYwihorxd6iCTHT9aEbZ0Cf79cLPf1TahbcD0Us
	 frg+O0xliISQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/5] clocksource/timer-econet-en751221: Disable IRQ
 until cevt registered
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260731120246.1296955-5-cjd@cjdns.fr>
References: <20260731120246.1296955-1-cjd@cjdns.fr>
 <20260731120246.1296955-5-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 12:16:57 +0000
Message-Id: <20260731121657.B6C641F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Sparse CPU IDs cause unmapped memory access due to relying on `num=
_possible_cpus()` instead of actual CPU IDs.
- [Medium] The driver is missing a CPU hotplug teardown callback to disable=
 the hardware timer and mask the per-CPU interrupt when a CPU goes offline.
--

--- Patch [4]: [PATCH v7 4/5] clocksource/timer-econet-en751221: Disable IR=
Q until cevt registered ---
commit e765af368a9556d25b3d5747a77b95b97cf2a3b9
Author: Caleb James DeLisle <cjd@cjdns.fr>

clocksource/timer-econet-en751221: Disable IRQ until cevt registered

This commit eliminates a race condition where the interrupt may trigger
before the event handler is registered. It also adds a NULL check for the
event handler in the interrupt callback just in case configuration fails.

> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocks=
ource/timer-econet-en751221.c
> index 714702b9ef128..f2c4c1ee0a56b 100644
> --- a/drivers/clocksource/timer-econet-en751221.c
> +++ b/drivers/clocksource/timer-econet-en751221.c
[ ... ]
> @@ -104,12 +107,11 @@ static int cevt_init_cpu(uint cpu)
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

[Severity: Medium]
This is a pre-existing issue, but I noticed there isn't a corresponding
teardown path for CPU hotplug.

When offlining a CPU, the hardware timer is left running because
set_state_shutdown is not implemented for the clock_event_device.
Additionally, the hotplug state is registered with a NULL teardown callback
in timer_init():

timer_init() {
        ...
        ret =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
                                "clockevents/econet/timer:starting",
                                cevt_init_cpu, NULL);
        ...
}

This leaves the per-CPU interrupt unmasked on an offlined CPU.

Could this lead to spurious interrupts that might wedge the interrupt
controller when the CPU is brought back online?

[ ... ]
> @@ -178,6 +180,8 @@ static int __init timer_init(struct device_node *np)
>  		goto out_membase;
>  	}
> =20
> +	irq_set_status_flags(econet_timer.irq, IRQ_NOAUTOEN);
> +
>  	ret =3D request_percpu_irq(econet_timer.irq, cevt_interrupt, np->name,
>  				 &econet_timer_pcpu);
> =20

[Severity: High]
This isn't a bug introduced by this patch, but while looking at
timer_init(), I noticed how the memory blocks are mapped.

Does this code handle sparse CPU IDs correctly?

In timer_init(), the number of blocks is bounded by the count of possible
CPUs rather than the maximum CPU ID:

timer_init() {
        ...
        int num_blocks =3D DIV_ROUND_UP(num_possible_cpus(), 2);
        ...
}

If CPU IDs are sparse, for example if CPUs 0 and 4 are possible, meaning
num_possible_cpus() evaluates to 2, membase[cpu >> 1] in reg_ctl() will
access an index beyond the mapped num_blocks.

Since the unmapped membase index contains NULL, could this cause a NULL
pointer dereference in cevt_init_cpu() when it calls ioread32(reg_ctl(cpu))?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731120246.1296=
955-1-cjd@cjdns.fr?part=3D4
