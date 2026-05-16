Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12BF2F7445
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 23:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778974697; cv=none; b=aHAyGurFNkmCTH/NH/YfIjNZi7ubS1sYS4a1HuP72sTHiT2Hzkm4EHCVfedwkZRucpN+4ACuQSjZ83fA3XA+Oy64+ENghrABKEQARw5fXtciOWwzZxNvD9AxmLnWilEEBooZiKuBEALHVGEy45qEPJaWIL3V4Qe47RWVdRg5vPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778974697; c=relaxed/simple;
	bh=JPQMLOSBWd/SSqAH4hhTOdZX8jwscwCr95s9GFjtok8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oM3D1ETffiXpBauDcehgjNO17F0MueRhYVKwQf/VhmWi+kvjEjDsP1wInXsr+nR+qiEdckF5pd6lK6y0WqwfQ1hdstkuLtUhJEwy5SWYTXX7j+x2xAwfZyR2tuCM0bH/ktLA9SyQ5H40T/WIVorW7wWjC5pa5tT8EVNGQ4a1bwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vM35IaxF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vM35IaxF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24DF9C19425;
	Sat, 16 May 2026 23:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778974697;
	bh=JPQMLOSBWd/SSqAH4hhTOdZX8jwscwCr95s9GFjtok8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=vM35IaxFQv9DGfujUNyQQN59GQONtf+T9foVQd1DgftETdzD2gVuEiyHxjmgwqebp
	 u+Yl8hjG2XaxuOTZdiTjoQJYJlc2HVZxuZckSw1FAEJharbiuTW7Ej1FmMcaSRbz/d
	 adKwMWyDdbmKsO419U1aC5iS+1jigxJzyzVq/SXbxX9/xSqlYgJv8kqIl1t/q7/LmU
	 78YSeAgRUVbiVyip0etoSkBIghOgDXd2n6P2rIIGdgcaJj80xolg3bFwKpAXhlAEIY
	 sfqrK1kQIBTjSKnxfOZIJvmQlUm/PsLERkOCWalnysQiro+bCJEe/r/RGwY5HiSqhd
	 9cUkjWPxp8htw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] clocksource/timer-econet-en751221: Support
 EN751627 without percpu IRQ
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260516215720.4160831-5-cjd@cjdns.fr>
References: <20260516215720.4160831-5-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 23:38:16 +0000
Message-Id: <20260516233817.24DF9C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] Initialization failure in cpuhp_setup_state() leaves dangling =
clockevent devices pointing to unmapped memory, causing a Use-After-Free/Un=
map panic.
- [High] Missing CPU hotplug teardown callback leads to unhandled interrupt=
 storms and unbalanced IRQ enable warnings.
- [High] The driver unconditionally rejects valid device trees on hardware =
with more cores than CONFIG_NR_CPUS, preventing system boot.
- [High] Missing validation for `num_blocks =3D=3D 0` leads to a NULL point=
er dereference and kernel panic.
--

commit 60ae37c5c796f8a8f7a5be1259491a4d42bb0aa2
Author: Caleb James DeLisle <cjd@cjdns.fr>
Date:   Sat May 16 21:57:20 2026 +0000

    clocksource/timer-econet-en751221: Support EN751627 without percpu IRQ

This commit adds support for the EN751627 timer, which uses a different
interrupt number for each CPU timer instead of a single percpu interrupt.
It updates the resource parsing to handle multiple IRQs and registers them
appropriately based on the device tree compatible string.

> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocks=
ource/timer-econet-en751221.c
> index ed750e39cc4fa..40f3b370485f3 100644
> --- a/drivers/clocksource/timer-econet-en751221.c
> +++ b/drivers/clocksource/timer-econet-en751221.c
[ ... ]
> @@ -99,6 +101,25 @@ static int cevt_init_cpu(uint cpu)
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

If cevt_init_cpu() succeeds on CPU 0 but fails here on a secondary CPU, does
this cause a use-after-free regression?

When cpuhp_setup_state() aborts and attempts to roll back, the rollback is a
no-op because the teardown callback was set to NULL during registration. Th=
is
leaves CPU 0's clockevent device fully registered in the timer core.

The driver then proceeds to its error handling path out_irq_free and execut=
es
iounmap() on all timer MMIO regions. When the timer core inevitably tries to
program the next event, it invokes cevt_set_next_event(), which accesses the
now-unmapped memory regions.

> +
>  	pr_debug("%s: Setting up clockevent for CPU %d\n", cd->name, cpu);
> =20
>  	reg =3D ioread32(reg_ctl(cpu)) | ctl_bit_enabled(cpu);
> @@ -107,7 +128,10 @@ static int cevt_init_cpu(uint cpu)
>  	clockevents_config_and_register(cd, econet_timer.freq_hz,
>  					ECONET_MIN_DELTA, ECONET_MAX_DELTA);
> =20
> -	enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
> +	if (econet_timer.is_percpu)
> +		enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
> +	else
> +		enable_irq(cd->irq);

Does omitting a teardown callback for CPU hotplug cause an unhandled interr=
upt
storm here?

The driver registers a CPU hotplug startup callback via cpuhp_setup_state()
with NULL for the teardown callback, meaning the IRQ is never disabled when=
 a
CPU is offlined.

If the CPU goes offline, the kernel's hotplug core might migrate the unmask=
ed
timer IRQ to a surviving CPU. Since there is no set_state_shutdown callback,
the offlined CPU's timer hardware continues running.

When the timer fires, the interrupt is delivered to the newly affined online
CPU. The cevt_interrupt handler uses this_cpu_ptr(), checking the online CP=
U's
registers instead of the offlined CPU's timer. Finding no pending event, it
returns IRQ_NONE without clearing the interrupt, resulting in an interrupt
storm.

Additionally, if the CPU is brought back online, wouldn't cevt_init_cpu()
execute enable_irq() a second time while desc->depth is already 0, triggeri=
ng
an unbalanced enable warning?

> =20
>  	return 0;
>  }
[ ... ]
> @@ -138,19 +162,48 @@ static void __init cevt_init(struct device_node *np)
[ ... ]
>  static int __init timer_init(struct device_node *np)
>  {
> -	int num_blocks =3D DIV_ROUND_UP(num_possible_cpus(), 2);
> +	int num_blocks =3D of_address_count(np);
> +	int num_irqs =3D of_irq_count(np);

What happens if num_blocks is 0 due to a malformed device tree?

If num_blocks is 0, the mapping loop is skipped, leaving
econet_timer.membase[0] uninitialized. Later, clocksource_mmio_init() is
called with reg_count(0), which computes NULL + 0x08. The timer subsystem
dereferences this invalid pointer, resulting in a direct kernel page fault.

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

Does this unconditionally reject valid device trees on hardware with more
cores than CONFIG_NR_CPUS?

The array sizes are constrained by CONFIG_NR_CPUS. If a kernel compiled with
CONFIG_NR_CPUS=3D2 is booted on a 4-core SoC, the DT will accurately descri=
be
4 IRQs, but the driver will reject it, return -EINVAL, and abort timer
initialization.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516215720.4160=
831-1-cjd@cjdns.fr?part=3D4
