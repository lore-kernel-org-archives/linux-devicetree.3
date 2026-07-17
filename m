Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9882DCF57
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 10:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784282909; cv=none; b=lm2nctxqV3LErU10Km0MVvEmJoTgjnxADmsNlQDtQZkEoBlqgjP/SF0lzc8N5aPMXBS/xzoKXq3VUuOaQLesZPCBnYw9188qrGGSAGUWEBupayyZE7RZZipBkYEewS5WsbZ7wkJhFpnc/cOtNlcZjK3cFy/T7m23lR9ylRsZHTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784282909; c=relaxed/simple;
	bh=GeDX+bi3pCmQzz+WMnBzbz9f69l+QlvlSP5MHbfWGiA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PIl6oecpWE6Axvry9As1ADGKcIyXnlSYM/SLiPVFeroSf4ffrhOs7Po0EXmQ67xI33TJ23jAfPPFsVZYKJA8KLa4gdg/Z87ETSBUThlXPsQPsBpWV3Qzr+appIYMriuOhr2MgdokAn/cRoSWTguaDYUxvILBHTe0CccJvWnF+QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kMgNEhXQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kMgNEhXQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 592531F000E9;
	Fri, 17 Jul 2026 10:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784282907;
	bh=mfsXVq7Es0SlaNvWU1/A0xZ0pIP6D3BTqYEFvGJ1dNs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kMgNEhXQ8w3pItp0qGr+0mWqZ5qdazo257pWR2/BehWpupBADqLqXkvkug6KC3aR6
	 hwHG+Rs2/1GBzD4q9+064GDllIJk9logvCYJamWsBjDyBpa3Tnq2Pc5absCb8Yf3he
	 LvIyZT538Cg6GEGXzprtZTaJDIJpFSE3GZiz4Jl+dB8haozhLztp5hpYlAl//40SFl
	 iaUHzlev8atXoe9id07cRy0lrEvlArTZI98fyA71dPgwQnoNiAHG7DWh2hC906Rgrr
	 4rfY2mSTXvbet2qshriDceJhndC+r2I2wV/tr4F2LKf+0iFUgegvCIs2om0bmfdeF/
	 HYFdKPHfbg08g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] clocksource/drivers: Add support for the Renesas
 RZ/N1 timers
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SGVydmUgQ29kaW5hIChTY2huZWlkZXIgRWxlY3RyaWMp?= <herve.codina@bootlin.com>
Cc: wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260717095552.767475-3-herve.codina@bootlin.com>
References: <20260717095552.767475-1-herve.codina@bootlin.com>
 <20260717095552.767475-3-herve.codina@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 10:08:26 +0000
Message-Id: <20260717100827.592531F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Off-by-one error in CPU bounds check allows out-of-bounds array ac=
cess in the hotplug callback.
- [High] A 16-bit high-frequency clocksource is incorrectly flagged with CL=
OCK_SOURCE_SUSPEND_NONSTOP, breaking system suspend timekeeping.
- [High] Probe incorrectly returns a positive IRQ number on devm_request_ir=
q failure.
- [High] Missing teardown callback in cpuhp_setup_state causes a Use-After-=
Free of clockevent devices.
- [Medium] Down-counting timer values are potentially returned directly, br=
eaking the requirement for monotonic increasing counters.
- [Medium] Failing CPU bringup by returning an error from a CPU hotplug sta=
rting callback.
--

--- Patch [2]: [PATCH v3 2/4] clocksource/drivers: Add support for the Rene=
sas RZ/N1 timers ---
commit 67eeb3e62e1eb246f2738740b9b5319a484b8d50
Author: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>

clocksource/drivers: Add support for the Renesas RZ/N1 timers

The Renesas RZ/N1 timer block controller is the controller in charge of
timers available in the Renesas RZ/N1 SoCs family. This controller handles
8 timers: 6 16-bit timers and 2 32-bit timers.

> diff --git a/drivers/clocksource/timer-rzn1.c b/drivers/clocksource/timer=
-rzn1.c
> new file mode 100644
> index 0000000000000..024f01bb0227b
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
Since RZN1_TIMER_LOAD_COUNT_REG is used earlier to set the timer period,
does this hardware act as a down-counter?

If the hardware counts downward, will returning the raw value here break the
timekeeping requirement for monotonically increasing values?

> +static struct clocksource rzn1_clocksource =3D {
> +	.name =3D "rzn1_timer_clocksource",
> +	.rating =3D 200,
> +	.flags =3D CLOCK_SOURCE_IS_CONTINUOUS | CLOCK_SOURCE_SUSPEND_NONSTOP,

[Severity: High]
Is it safe to flag a 16-bit clocksource with CLOCK_SOURCE_SUSPEND_NONSTOP?

Since a 16-bit counter fed by a high-frequency clock will wrap around very
quickly, will this cause massive wall time jumps if the system suspends for
longer than the wrap interval?

> +	.read =3D rzn1_clksrc_read,
> +};
> +
> +/* Timers table where 32-bit timers will be assigned per-cpu */
> +static struct rzn1_timer *rzn1_tab_timers;
> +
> +static int rzn1_local_timer_starting_cpu(unsigned int cpu)
> +{
> +	struct rzn1_timer *timer;
> +
> +	if (cpu > RZN1_TIMER_NB_32BIT_TIMERS)
> +		return -EINVAL;

[Severity: Medium]
Will returning an error like -EINVAL completely abort the hotplug process
for any CPU beyond the first two?

Should this return 0 instead, allowing additional CPUs to still boot online
and rely on a global broadcast timer?

[Severity: High]
Also, does the greater-than condition here have an off-by-one error?

If RZN1_TIMER_NB_32BIT_TIMERS is 2, a cpu value of 2 bypasses this check.

> +
> +	timer =3D &rzn1_tab_timers[cpu + RZN1_TIMER_BASE_INDEX_32BIT_TIMERS];

[Severity: High]
If a cpu value of 2 bypassed the check above, will this access out of bound=
s?

The array is only sized for 8 elements total. Adding a cpu value of 2 to
RZN1_TIMER_BASE_INDEX_32BIT_TIMERS (which is 6) computes an index of 8.

[ ... ]

> +static int rzn1_timer_setup_timers(struct platform_device *pdev,
> +				   struct rzn1_timer *tab_timers,
> +				   unsigned int first_timer_index,
> +				   unsigned int last_timer_index,
> +				   void __iomem *base, unsigned long clock_rate)
> +{

[ ... ]

> +		ret =3D devm_request_irq(dev, timer->ced.irq, rzn1_timer_interrupt,
> +				       IRQF_TIMER, timer->ced.name, timer);
> +		if (ret < 0)
> +			return dev_err_probe(dev, irq, "timer%u: Failed to request IRQ\n", i);

[Severity: High]
Will calling dev_err_probe() with irq return the positive IRQ number back to
the caller instead of the negative ret code?

If the driver probe returns a positive integer, won't the driver core assume
the probe succeeded despite the failure?

[ ... ]

> +static int rzn1_timer_probe_first(struct platform_device *pdev,
> +				  struct rzn1_timer *tab_timers,
> +				  void __iomem *base, unsigned long clock_rate)
> +{

[ ... ]

> +	/*
> +	 * Second step, almost all operations that can fail have been called.
> +	 * Timers are ready to work. Start with the last operation that can fai=
l,
> +	 * installing and invoking hotplug callbacks
> +	 */
> +	rzn1_tab_timers =3D tab_timers;
> +	ret =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> +				"clockevents/rzn1/global_timer:starting",
> +				rzn1_local_timer_starting_cpu, NULL);

[Severity: High]
Does passing a NULL teardown callback here leave registered clockevent
devices dangling if a subsequent step fails during probe?

If the driver fails and frees its timer structures via devres, or if a CPU
is dynamically offlined later, will this lack of teardown cause a
use-after-free in the clockevents core?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717095552.7674=
75-1-herve.codina@bootlin.com?part=3D2
