Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528FA3F4132
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 16:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778775497; cv=none; b=JRLt8c4wbUrOA3mXj5sRf02/K3icuate/+vp8jht4mAPKbwS+UtNF5kWz/uBZyLbwjNls1VI3I0dA2aJ+HGwjEPM1sJhMojk9s5hq5navsnJdf6vCGjkz9IdOqIvvFI+FKhxVwzIdtr7T+j4TSkl1sKEcm5VWZ3uPqJUPFqfnyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778775497; c=relaxed/simple;
	bh=20o8sYS9S36GYIwgHRQx1PUQs4iztCZIGp6bWCvXZG8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OcyU9VBYqCeEh73yIFhThXhz0rhnAn1FUdQURl65KsQivm6tHaAEc8pe9ulBlEw+wNjP+f2a+p+xtG05pF4UCRLPavjCkNj1wEKvH0w/E72qDzzFdJjcuS5x/33CoTogQZVY69z5XVQmVWuzuNmn6dW8mn6cSnN9lwdflPMlArk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iKJi4nBO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iKJi4nBO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2133C2BCB3;
	Thu, 14 May 2026 16:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778775496;
	bh=20o8sYS9S36GYIwgHRQx1PUQs4iztCZIGp6bWCvXZG8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=iKJi4nBOaHq655m2RSNuM7FPx25hSBEBu6C7Jh7hyBO76Xeah91Lw10zGQ9CbpOqY
	 9ZiM+mI4P9prAQ7+g+DoQOQFCOirshRKlFKPGqtnyh8EZKYeSlY5N0TZ27IzBdN9io
	 qjxgSOvy8/O1T65CI3M6HAfn2szzzrR8p91oU/QvjwmzIDYKYDdnTJxnWRw6RRu1wT
	 aV5tdMI/XjGVmk24Okuki39AcPI40rWBj6OF2+LNaSeCgfzz+s+x+Axu13NqGy6X2U
	 YRnHANAxu95ZDy3pDwaUdNb4KjC32zTbWqwjeG7zBC7ZgsLWAm30tiwUrRo7hjM2zi
	 6W1dyBiGr07Bg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/5] clocksource/timer-econet-en751221: Support irq
 number per timer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260514000601.3430262-6-cjd@cjdns.fr>
References: <20260514000601.3430262-6-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 16:18:15 +0000
Message-Id: <20260514161816.A2133C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] NULL pointer dereference due to requesting IRQ before initializing=
 clock_event_device.
- [High] Interrupt storm and system lockup due to incorrect IRQ context han=
dling.
- [High] Unconditional MMIO mapping based on NR_CPUS causes initialization =
failure on older platforms.
- [High] Use-After-Free of MMIO memory on initialization error path.
- [High] Out-of-bounds per-CPU memory access if DT defines more IRQs than n=
r_cpu_ids.
- [Medium] Returning `-EINVAL` from hotplug startup callback aborts CPU hot=
plug registration.
- [Medium] Missing CPU hotplug teardown callback leaves hardware timer runn=
ing.
- [Medium] Heuristic hardware detection fails on uniprocessor configuration=
s of multi-IRQ SoCs.
- [Low] Missing `CLOCK_EVT_FEAT_PERCPU` flag for clock event devices in mul=
ti-IRQ mode.
--

commit 7bc20cbfbe69fc307b80fd4b2cd349dcdd20410b
Author: Caleb James DeLisle <cjd@cjdns.fr>
Subject: clocksource/timer-econet-en751221: Support irq number per timer

This commit adds support for both percpu and individual IRQ per timer modes.
It handles standard mti,gic compatible interrupt controllers found on MIPS
1004Kc based systems.

Link: https://github.com/openwrt/openwrt/commit/fab098cb6121647ca9cc6e501d5=
6ebe8a9ea550b#diff-a09ee5e4166e89df337d03c1455dce7b81eb89797b1d0f714476b188=
e6685334

> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocks=
ource/timer-econet-en751221.c
> index 4b712eb4db6f6..642af9fcda60e 100644
> --- a/drivers/clocksource/timer-econet-en751221.c
> +++ b/drivers/clocksource/timer-econet-en751221.c
[ ... ]
> @@ -21,14 +22,26 @@
>  #define ECONET_MAX_DELTA		GENMASK(ECONET_BITS - 2, 0)
>  /* 34Kc hardware has 1 block and 1004Kc has 2. */
>  #define ECONET_NUM_BLOCKS		DIV_ROUND_UP(NR_CPUS, 2)
> +#define ECONET_MAX_IRQS			NR_CPUS
> =20
>  static struct {
>  	void __iomem	*membase[ECONET_NUM_BLOCKS];
>  	u32		freq_hz;
> +	int		irqs[ECONET_MAX_IRQS];
> +	int		num_irqs;
>  } econet_timer __ro_after_init;
> =20
>  static DEFINE_PER_CPU(struct clock_event_device, econet_timer_pcpu);
> =20
> +/* This timer supports two interrupt controller models, either 1 IRQ whi=
ch is in per-cpu
> + * mode which is used on 34Kc CPUs, and separate IRQ number per CPU whic=
h is used on
> + * 1004Kc CPUs with GIC intc.
> + */
> +static inline bool is_percpu_irq(void)
> +{
> +	return econet_timer.num_irqs =3D=3D 1;
> +}

If an SoC using the standard GIC model is configured as a uniprocessor syst=
em,
will the Device Tree only describe 1 interrupt?

If so, does this heuristic mistakenly invoke request_percpu_irq() on a stan=
dard
SPI interrupt, preventing timer initialization?

> @@ -98,12 +111,21 @@ static int cevt_init_cpu(uint cpu)
>  	struct clock_event_device *cd =3D &per_cpu(econet_timer_pcpu, cpu);
>  	u32 reg;
> =20
> +	if (!is_percpu_irq() && cpu >=3D econet_timer.num_irqs)
> +		return -EINVAL;

Since this function is registered as a CPU hotplug startup callback via
cpuhp_setup_state(), does returning an error here cause the hotplug core
to abort and rollback the state?

Should this return 0 instead when intentionally skipping a CPU?

> @@ -171,6 +193,44 @@ static int __init cevt_init(struct device_node *np)
>  	return ret;
>  }
> =20
> +static int __init cevt_init_multi_irq(struct device_node *np)
> +{
> +	int i, ret;
> +
> +	for (i =3D 0; i < econet_timer.num_irqs; i++) {
> +		struct clock_event_device *cd =3D &per_cpu(econet_timer_pcpu, i);

If the system boots with restricted CPUs (e.g. nr_cpus=3D1) but the device =
tree
provides multiple IRQs, will this loop access uninitialized __per_cpu_offset
indices?

Should the iteration be bounded by nr_cpu_ids?

> +
> +		econet_timer.irqs[i] =3D irq_of_parse_and_map(np, i);
> +		if (econet_timer.irqs[i] <=3D 0) {
> +			pr_err("%pOFn: irq_of_parse_and_map failed", np);
> +			ret =3D -EINVAL;
> +			goto err_free_irqs;
> +		}
> +
> +		ret =3D request_irq(econet_timer.irqs[i], cevt_interrupt,
> +				  IRQF_TIMER | IRQF_NOBALANCING,
> +				  np->name, NULL);

Because standard IRQs can be routed to a default CPU before
irq_force_affinity() is applied, can an interrupt for CPU 1's timer execute
on CPU 0?

If so, will CPU 0 check its own timer, find it not pending, and
return IRQ_NONE without acknowledging CPU 1's timer, causing an IRQ storm?

Should a dev_id be passed here and retrieved in the interrupt handler
instead of relying on this_cpu_ptr()?

Also, since request_irq() immediately unmasks the interrupt, what happens if
a timer interrupt is already pending from the bootloader?

Will cevt_interrupt() execute immediately, retrieve the statically
zero-initialized clock_event_device, and dereference a NULL dev->cpumask
because cevt_setup_clockevent() has not yet been called?

> +		if (ret < 0) {
> +			pr_err("%pOFn: IRQ %d setup failed (%d)\n", np,
> +			       econet_timer.irqs[i], ret);
> +			irq_dispose_mapping(econet_timer.irqs[i]);
> +			goto err_free_irqs;
> +		}
> +
> +		cevt_setup_clockevent(cd, np, econet_timer.irqs[i], i);
> +		cevt_dev_init(i);

Should the CLOCK_EVT_FEAT_PERCPU flag be set on the clock_event_device
here to inform the clockevents core about the hardware's strict CPU
locality?

> @@ -184,6 +244,12 @@ static int __init timer_init(struct device_node *np)
> =20
>  	econet_timer.freq_hz =3D clk_get_rate(clk);
> =20
> +	econet_timer.num_irqs =3D of_irq_count(np);
> +	if (econet_timer.num_irqs <=3D 0 || econet_timer.num_irqs > ECONET_MAX_=
IRQS) {
> +		pr_err("%pOFn: invalid IRQ count %d\n", np, econet_timer.num_irqs);
> +		return -EINVAL;
> +	}
> +
>  	for (int i =3D 0; i < ARRAY_SIZE(econet_timer.membase); i++) {
>  		econet_timer.membase[i] =3D of_iomap(np, i);

Since the 34Kc platform only has 1 timer block and provides a single reg
region in its Device Tree, will of_iomap(np, 1) return NULL and cause
initialization to fail if NR_CPUS makes ARRAY_SIZE(econet_timer.membase)
evaluate to 2 or more?

> @@ -202,7 +268,11 @@ static int __init timer_init(struct device_node *np)
>  		goto err_unmap;
>  	}
> =20
> -	ret =3D cevt_init(np);
> +	if (is_percpu_irq())
> +		ret =3D cevt_init(np);
> +	else
> +		ret =3D cevt_init_multi_irq(np);
> +
>  	if (ret < 0)
>  		goto err_unmap;

If cevt_init_multi_irq() fails and the code jumps to err_unmap, the
previously registered clocksource from clocksource_mmio_init() is not
unregistered.

Does this leave the timekeeping subsystem with a dangling pointer to the
unmapped MMIO region, leading to a crash on the next time read?

Additionally, when a CPU goes offline, is the hardware timer ever disabled
since there is no teardown callback provided to cpuhp_setup_state() in this
function and no set_state_shutdown function?

Will the online CPUs continuously receive timer interrupts from the offline
CPU's running timer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514000601.3430=
262-1-cjd@cjdns.fr?part=3D5
