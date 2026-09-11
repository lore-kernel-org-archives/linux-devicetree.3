Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1AD36197E
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139919; cv=none; b=AYly4xhD3tJIYfkjVLA3ZK3dHmBmE3LfyGh2zL+PY1ieUqdPfEuviC2j8n1V7ENBclfU+LpDTlm7It+rUzO4nxUwXUv7E1BCrZ3znm50ZZYQ8QglBZUzxikiwvjYifDWKhi/68xmIydrA2oPVV5O/1PK5IMuESENfn2FN0VDyV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139919; c=relaxed/simple;
	bh=4nLjOq25lFXXovOEeKTaCJG78HbxZ1K2ijdyiGKmUq4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QrYMlAD8FL61cc8lBlR9HannJ9hPjJvsRKxqeYwMbO39gHo+YDr53lP25WxaUV3jEgtVOXkp6j5HNVJr/U6+chkeWtzhnPyf5FvsS26V8GBzwuBHsFezCQI6bWqEGz9Ppoaiyv7c/+rGmKOYYmxNuprOxT4ewQcQ43C/zf5+ST4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lShzmVyJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lShzmVyJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 709F41F000FF;
	Fri, 11 Sep 2026 15:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789139917;
	bh=xkOpc1xdP7w1BTu9ySNQ92RGFnokjtwaqqh7M0TNNig=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lShzmVyJPw29n+zpQ+ZwHHXTU7bsADn988VeeFYFlhOXHb42uqGejUXcAzP3ZcVHZ
	 BxRxNPqeS+m5SefjcV/lJm5uZPn0p+dmQrqQzChW77GostYV+1ICC3l/Crvv22V3NM
	 UZfuArVu/ZSaJDfZKLHEZBHmRIsj7dMW0EDdi01wHkex2DWAi0WK+YZKS4OJtbM9f7
	 EXCL2k7iKheL3S4stFFOLaCDvtCHDVUUg5rJ0EbkP3Fqqw+xOhCbazBdFsGCV3J++h
	 iiGkQS44I7n80rY64yse71W37m1+oq1ybal6iVaRPOay67wAGKQ5Ou0ct79HvslZvD
	 cr1fSRe+D8MUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/4] clocksource/drivers: Add support for the Renesas
 RZ/N1 timers
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SGVydmUgQ29kaW5hIChTY2huZWlkZXIgRWxlY3RyaWMp?= <herve.codina@bootlin.com>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260911150456.893761-3-herve.codina@bootlin.com>
References: <20260911150456.893761-1-herve.codina@bootlin.com>
 <20260911150456.893761-3-herve.codina@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 15:18:37 +0000
Message-Id: <20260911151837.709F41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The 16-bit per-CPU timers will never be chosen over the arch timer=
 due to their low rating, resulting in asymmetrical per-CPU tick devices.
- [Medium] Clocksource and sched_clock return raw decreasing values if the =
timer is a down-counter.
--

commit 0389aacef8150cde2d480116d05b7b23c573015b
Author: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>

clocksource/drivers: Add support for the Renesas RZ/N1 timers

The Renesas RZ/N1 timer block controller is the controller in charge of
timers available in the Renesas RZ/N1 SoCs family. This controller handles
8 timers (6 16-bit, 2 32-bit). Each timer has its own interrupt and prescal=
er.

> diff --git a/drivers/clocksource/timer-rzn1.c b/drivers/clocksource/timer=
-rzn1.c
> new file mode 100644
> index 0000000000000..a66a045309f63
> --- /dev/null
> +++ b/drivers/clocksource/timer-rzn1.c

[ ... ]

> +static u64 notrace rzn1_sched_read(void)
> +{
> +	return readl_relaxed(rzn1_sched_clock->base + RZN1_TIMER_CURRENT_COUNT_=
REG);
> +}
> +
> +static u64 rzn1_clksrc_read(struct clocksource *cs)
> +{
> +	return readl_relaxed(rzn1_sched_clock->base + RZN1_TIMER_CURRENT_COUNT_=
REG);
> +}

[Severity: Medium]
If the timer is a down-counter, will these functions return a decreasing va=
lue?

The clocksource and sched_clock cores require monotonically increasing valu=
es.
If the timer counts down, returning the raw value could cause the
(now - last) & mask calculation to yield large forward time jumps, breaking
system timekeeping and scheduling.

[ ... ]

> +static int rzn1_local_timer_starting_cpu(unsigned int cpu)
> +{
> +	struct rzn1_timer *timer;
> +
> +	/* We assign the first and second 16-bit timer as per-cpu timers. */
> +	if (cpu >=3D 2)
> +		return 0;
> +
> +	timer =3D &rzn1_tab_timers[cpu + RZN1_TIMER_BASE_INDEX_16BIT_TIMERS];

[ ... ]

> +static void rzn1_timer_clkevt_init_ced(struct rzn1_timer *timer, const c=
har *name,
> +				       int irq)
> +{

[ ... ]

> +	/*
> +	 * 32-bit timers are fed with a 25 MHz clock directly derived from the
> +	 * main PLL (1 GHz). The arch timer, ARMv7 CP15 in RZ/N1 SoCs, is fed
> +	 * with to a 6.25 MHz clock.
> +	 *
> +	 * The clock of the RZ/N1 timers block is a stable one and the RZ/N1
> +	 * timers have a higher resolution than the ARM CP15 one.
> +	 *
> +	 * Also those 32-bit RZ/N1 timers are assigned per-cpu.
> +	 *
> +	 * Use a high rating for the 32-bit RZ/N1 timers in order to have them
> +	 * chosen by the system.
> +	 */
> +	timer->ced.rating =3D timer->width =3D=3D 16 ? 200 : 460;

[Severity: High]
Is it intentional that the 16-bit per-CPU timers are assigned a rating of 2=
00?

In rzn1_local_timer_starting_cpu(), the 16-bit timers are explicitly assign=
ed
as the per-CPU tick devices. However, because the ARM arch timer typically =
has
a higher rating (400-450), won't the 16-bit timers always be outranked and
ignored by the clockevents core?

This appears to contradict the comment stating that 32-bit timers are assig=
ned
per-cpu, and could leave CPU 1 falling back to the arch timer while CPU 0
might use the global 32-bit timer, resulting in asymmetrical per-CPU tick
devices.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911150456.8937=
61-1-herve.codina@bootlin.com?part=3D2
