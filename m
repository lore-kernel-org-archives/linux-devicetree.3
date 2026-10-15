Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CC955C1C5
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 17:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792084065; cv=none; b=Gl5d27p4NPbasPctx2fqMB3IQNXE0etCm12PL+8Ge0wG+how8RIG2r0xUOB1xsIzY78ddSsa8r0hjPn9M94aD1KA1PWMseba5Aa2rFdGboF6WQv+Y/6RW/y9WFcgrFFZ4Dpm3mYikWL3S2UR6WpSAs0PaoxkVSXpS/IfQpvqqOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792084065; c=relaxed/simple;
	bh=+MLCB1Yp0n/HbnvdKt9e9hb/Gkl4053Tntct3hOQjko=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=i6iZlNfz/Frq876KT3skob6mEjMb6NwxxfDkI9OUN5Tga5hd0yW6xZjrWuQquUrGn7pNDewyp5i/cWO54wGsfSfW9+1jO0oqwZtPYCBTVpvigvulqjUiz9wOyNvMNQMXTBjOrIcyKhnlUQvi8/piq5a6c63tJcALkDOXsgWmpXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DYRn6VdU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DYRn6VdU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E00DE1F000C4;
	Thu, 15 Oct 2026 17:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792084051;
	bh=jSxzLMmgRb58+v4msVYEzzfxAEIJR6eXdDUomD0qllM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DYRn6VdUVSt2QhuS7iCDyfeE58L2uxABBy7mQRKpS5eHPFF1nMqeveV5xRhalnyk8
	 17pxD3HNmO/cGSsnMFmtEh6QHqTK4/a6dYmQ9JVYZaTEH5X/w2dQmHdxgr+ltApl00
	 pXPg7eA+o133bTDvcQDZ+VnQlrtMWF5NjebcQ6+/NX3LxEGXPfOMjBPPnwZpCB94f/
	 /52YpPFRD6JUqm4zrhdH01N0eIS2QfSFtDjsSF7HVMmYe4MtpvcGk2Z4LchfeW+QuE
	 VuHX4O9Ht+x7f7jM9hcZkij+AGzMLrKPnctLrRpcYC0EABS6a6WhjeBVcoKnynqyX0
	 4hux6w76UtfIQ==
Message-ID: <sashiko-outbox-173239@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 5/5] clocksource/timer-econet-en751221: Do not use
 NR_CPUS for resource array size
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015165404.519741-6-cjd@cjdns.fr>
References: <20261015165404.519741-1-cjd@cjdns.fr>
 <20261015165404.519741-6-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 17:07:30 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] timer: unhandled NULL return from reg_ctl() causes panic in cevt_i=
s_pending()
- [High] timer-econet: missing clockevent teardown on cpuhp_setup_state fai=
lure causes NULL dereference
--

commit 69369f74d989cac0e5ceb83af19b8903653397b4
Author: Caleb James DeLisle <cjd@cjdns.fr>

clocksource/timer-econet-en751221: Do not use NR_CPUS for resource array si=
ze

Each pair of VPEs has one timer block, so the number of blocks is half
the number of CPUs on the hardware. This commit switches to an allocated
buffer for storing the iomem resources, as is done for the IRQs, avoiding
a too small array size when NR_CPUS is less than the number of hardware CPU=
s.

> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocks=
ource/timer-econet-en751221.c
> index edb3db3125ce3..9f28cc238372c 100644
> --- a/drivers/clocksource/timer-econet-en751221.c
> +++ b/drivers/clocksource/timer-econet-en751221.c
[ ... ]
> @@ -37,6 +36,10 @@ static DEFINE_PER_CPU(struct clock_event_device, econe=
t_timer_pcpu);
>   */
>  static inline void __iomem *reg_ctl(u32 timer_n)
>  {
> +	/* reg_ctl() is used to check if a clock exists */
> +	if (timer_n >> 1 >=3D econet_timer.num_membase)
> +		return NULL;
> +

[Severity: High]
With reg_ctl() now returning NULL if the CPU index exceeds the mapped timer
blocks, what happens when it is called from cevt_is_pending()?

If the interrupt is a global IRQ, it can be routed to any CPU via userspace
smp_affinity, or fire as a spurious interrupt on an unsupported CPU. When
the IRQ handler cevt_interrupt() executes on a CPU without a backing timer
block, reg_ctl() will return NULL, and it looks like cevt_is_pending() will
pass this directly to ioread32():

return ioread32(reg_ctl(cpu_id)) & ctl_bit_pending(cpu_id);

Could this cause a kernel panic due to a NULL pointer dereference?

>  	return econet_timer.membase[timer_n >> 1];
>  }
> =20
[ ... ]
> @@ -305,13 +312,17 @@ static int __init timer_init(struct device_node *np)
>  			irq_dispose_mapping(econet_timer.irqs[i]);
>  	}
>  out_membase:
> -	for (int i =3D 0; i < ARRAY_SIZE(econet_timer.membase); i++) {
> +	for (int i =3D 0; i < num_blocks; i++) {
>  		if (econet_timer.membase[i]) {
>  			iounmap(econet_timer.membase[i]);
>  			econet_timer.membase[i] =3D NULL;
>  		}
>  	}
> =20
> +	kfree(econet_timer.membase);
> +	econet_timer.membase =3D NULL;
> +

[Severity: High]
Does freeing the dynamically allocated membase array and setting it to NULL
here risk a NULL pointer dereference for already registered clockevents?

Looking at timer_init(), cpuhp_setup_state() is called without a teardown
callback. If cpuhp_setup_state() fails on a subset of CPUs, it aborts
without rolling back previously initialized CPUs, which leaves the clockeve=
nt
devices active.

When this error path executes and frees econet_timer.membase, the active
clockevent devices remain registered. When they fire, cevt_set_next_event()
calls reg_count(), which dereferences the now-NULL econet_timer.membase
pointer:

static inline void __iomem *reg_count(u32 timer_n)
{
	return econet_timer.membase[timer_n >> 1] + (timer_n & 1) * 0x08 + 0x08;
}

Could this lead to a kernel panic when the remaining active clockevents fir=
e?

> +out_kfree_irqs:
>  	kfree(econet_timer.irqs);
>  	econet_timer.irqs =3D NULL;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015165404.5197=
41-1-cjd@cjdns.fr?part=3D5
