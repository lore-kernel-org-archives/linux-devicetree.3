Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696528;
	b=2TJYIwbQFUe7G8XplOwc1MNccw3Ql8lsIEwoFnpMTGJGjGybKlUvGbWrDQX+nCL832VD
	 ACR/VfqMSML3YTNJ6P7nqd07zaHBJFTo+ZUxKOpZvbwHI/iSeynMMzyj7nDg5r0tp9Rz+
	 ucItkQM3aIgDKnt1mFE0tvZAT692BCUwG7Aqcmm0CHBaEPZXWBEJYqxFkUyaDgIpCmZ+T
	 PFv+FnrgxKvEVf+rb72Www1TstLzUtImjmRjCi3ezEmP6RUvUT1S6+VKApWw+0R3HGDTG
	 DpKZVoQwf3CtIw1XxyFzN1Wfj2gSB47/Z+oyWpiZ4i17lPkxTqOtbAyizTXtLrmCW3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696528;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3Utcoo35B8Ox3irX1m8vM/1qxcx3YaOzvnLjUbyQjAE=;
	b=N5eF1si+Uemb9b0I1tf/VBSc4A44BXJ2JhogJryKXf29reJ9xLITYnpnR4TiM90+8GF6
	 B9cZWEtS+X5rOS74StFZt79bHcnNg9wIkQsBC8zEzOCIIxz72jHroZQ90gSLvyAmBV/y+
	 FDCqCPYw7a3bt4jMt6chYLYbHwnwJLxRGnwvYjm3+xKny5Ecp5apX1i/IXt/KxEJ/DLp0
	 aMw9qfSBtlkObcGvrxkbr8cidvYBDPYUWj4sZRSiWgfdnBxVLyVqAxf4KAuJVHGNQOMb/
	 yMRUyUkL+sIy6EjPCTrM4TMnz8ksowQrHHNcUmwEul2ml3FDrxvXnUyyp6URFujNCyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kj+LciLx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C887606D803
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 09:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kj+LciLx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC491F000C1;
	Tue,  3 Nov 2026 09:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793696528;
	bh=3Utcoo35B8Ox3irX1m8vM/1qxcx3YaOzvnLjUbyQjAE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kj+LciLxpg/er6kVeOVISFAKp/MKAsUOXKeXVCS+6C/CrQ4r2nC3/E11rE2WjdK8n
	 nGdpQ22RHDpHq1g0fdhVKXu4RWNTfQbBYk8+bxgh68sF2ZXFdZGi35s8ue5mPFloJC
	 02I7AvdrwKWSE6JWRFJkCAdWKd3dq8sVNmw8Mv6+y6ozlt4aiTQLLM3ZESyPneRkQq
	 tN8MwnaRVC43KSafrla1raOdslecGtSBvKIb3yrE9XMjfJLKkLVSPv+kXGr7m9CqHZ
	 Z9j8ic2tjKJhm8ehWGCjxgQAt8mvX/jtRH/zVisQ9RAL0Ld4nZaRoXqBataMRUEZIY
	 Cfod+m8l4Z7fw==
Message-ID: <sashiko-outbox-194914@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] clocksource/drivers/spacemit: Add K1 timer support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103-spacemit-soc-timer-v1-2-36722421db6e@linux.spacemit.com>
References: <20261103-spacemit-soc-timer-v1-0-36722421db6e@linux.spacemit.com>
 <20261103-spacemit-soc-timer-v1-2-36722421db6e@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 09:02:07 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] clocksource/drivers/spacemit: wrong MMIO register offsets for K1 t=
imer
- [High] clocksource/drivers/spacemit: free-running mode in spacemit_timer_=
resume()
- [High] clocksource/drivers/spacemit: direct TMR_COUNT read in spacemit_ti=
mer_stop()
--

commit 4dc32afe42f41419e8802088abd5d90ef4a2a234
Author: Troy Mitchell <troy.mitchell@linux.spacemit.com>

clocksource/drivers/spacemit: Add K1 timer support

This commit adds a platform clockevent driver for the SpacemiT K1 and K3 APB
timers, using counter 0 and its first match comparator as a shared oneshot
broadcast timer device.

> diff --git a/drivers/clocksource/timer-spacemit.c b/drivers/clocksource/t=
imer-spacemit.c
> new file mode 100644
> index 0000000000000..70076c17b5037
> --- /dev/null
> +++ b/drivers/clocksource/timer-spacemit.c
> @@ -0,0 +1,312 @@

[ ... ]

> +/* Use counter 0 and its first match comparator. */
> +#define TMR_CER			0x00
> +#define TMR_CMR			0x04
> +#define TMR_CCR			0x0c
> +#define TMR_MATCH		0x10
> +#define TMR_PRELOAD		0x40
> +#define TMR_PRELOAD_CTRL		0x50
> +#define TMR_IER			0x60
> +#define TMR_ICR			0x70
> +#define TMR_SR			0x80
> +#define TMR_COUNT		0x90

[Severity: High]
Are these register offsets matching the SpacemiT K1/K3 3-counter,
3-comparator APB timer hardware layout?

The K1/K3 timer block uses the MMP timer register map (as in
arch/arm/mach-mmp/regs-timers.h), where the counter 0 and shared control
registers are at:

  TMR_CCR          0x0000
  TMR_TN_MM(0, 0)  0x0004
  TMR_CR(0)        0x0028
  TMR_SR(0)        0x0034
  TMR_IER(0)       0x0040
  TMR_PLVR(0)      0x004c
  TMR_PLCR(0)      0x0058
  TMR_ICR(0)       0x0074
  TMR_CER          0x0084
  TMR_CMR          0x0088
  TMR_CVWR(0)      0x00a4

With the offsets defined here, TMR_CER (0x00) points to TMR_CCR, TMR_CMR
(0x04) points to counter 0 match 0, TMR_CCR (0x0c) points to counter 0 match
2, TMR_MATCH (0x10) points to counter 1 match 0, TMR_PRELOAD (0x40) points =
to
TMR_IER(0), TMR_PRELOAD_CTRL (0x50) points to TMR_PLVR(1), TMR_IER (0x60)
points to TMR_PLCR(2), TMR_ICR (0x70) points to TMR_WSR, TMR_SR (0x80) poin=
ts
to TMR_WICR, and TMR_COUNT (0x90) points to TMR_ILR(1).

Won't this cause spacemit_timer_probe(), spacemit_timer_resume(),
spacemit_timer_next_event(), and spacemit_timer_interrupt() to read and wri=
te
the wrong hardware registers?

[ ... ]

> +static int spacemit_timer_stop(struct spacemit_timer *timer)
> +{
> +	u32 val, prev;
> +	int ret, i;
> +
> +	val =3D readl(timer->base + TMR_CER) & ~TMR_COUNTER_EN;
> +	ret =3D spacemit_timer_write(timer, TMR_CER, val, TMR_COUNTER_EN);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * CER crosses into the counter clock domain. Its readback alone does
> +	 * not show that counting has stopped. COUNT is synchronized back to
> +	 * APB, with up to three counter clocks of latency. Wait for a stable
> +	 * count before changing the match or preload registers.
> +	 */
> +	prev =3D readl(timer->base + TMR_COUNT);
> +	for (i =3D 0; i < 10; i++) {
> +		udelay(timer->sync_us);
> +		val =3D readl(timer->base + TMR_COUNT);
> +		if (val =3D=3D prev)
> +			return 0;
> +		prev =3D val;
> +	}
> +
> +	return -ETIMEDOUT;
> +}

[Severity: High]
Can the counter value register be read directly in spacemit_timer_stop()
without cross-domain metastability?

In this timer block, the counter register TMR_CR(n) runs in the functional
clock domain and is not synchronized to the APB bus on direct reads. As not=
ed
in arch/arm/mach-mmp/time.c:timer_read():

  __raw_writel(1, mmp_timer_base + TMR_CVWR(1));

  while (delay--)
          val =3D __raw_readl(mmp_timer_base + TMR_CVWR(1));

Should spacemit_timer_stop() latch and read the synchronized counter snapsh=
ot
through TMR_CVWR(0) (offset 0xa4) instead of reading the counter register
directly?

[ ... ]

> +static int spacemit_timer_next_event(unsigned long delta,
> +				     struct clock_event_device *evt)
> +{
> +	struct spacemit_timer *timer =3D to_spacemit_timer(evt);
> +	unsigned long flags;
> +	u32 val;
> +	int ret;
> +
> +	raw_spin_lock_irqsave(&timer->lock, flags);
> +
> +	ret =3D spacemit_timer_quiesce(timer);
> +	if (ret)
> +		goto out;
> +
> +	ret =3D spacemit_timer_write(timer, TMR_MATCH, delta - 1, U32_MAX);
> +	if (ret)
> +		goto out;
> +
> +	ret =3D spacemit_timer_write(timer, TMR_IER, TMR_MATCH0, TMR_MATCH_MASK=
);
> +	if (ret)
> +		goto out;
> +
> +	/* Enabling the counter reloads the zero preload value. */
> +	val =3D readl(timer->base + TMR_CER) | TMR_COUNTER_EN;
> +	ret =3D spacemit_timer_write(timer, TMR_CER, val, TMR_COUNTER_EN);

[ ... ]

> +static int spacemit_timer_resume(struct clock_event_device *evt)
> +{
> +	struct spacemit_timer *timer =3D to_spacemit_timer(evt);
> +	unsigned long flags;
> +	u32 val;
> +	int ret;
> +
> +	raw_spin_lock_irqsave(&timer->lock, flags);
> +	ret =3D spacemit_timer_quiesce(timer);
> +	if (ret)
> +		goto out;
> +
> +	/* Select the functional clock and disable automatic match reload. */
> +	val =3D readl(timer->base + TMR_CCR) & ~TMR_CLOCK_MASK;
> +	ret =3D spacemit_timer_write(timer, TMR_CCR, val, TMR_CLOCK_MASK);
> +	if (ret)
> +		goto out;
> +
> +	val =3D readl(timer->base + TMR_CMR) | TMR_FREE_RUNNING;
> +	ret =3D spacemit_timer_write(timer, TMR_CMR, val, TMR_FREE_RUNNING);
> +	if (ret)
> +		goto out;
> +
> +	ret =3D spacemit_timer_write(timer, TMR_PRELOAD_CTRL, 0, GENMASK(2, 0));
> +	if (ret)
> +		goto out;
> +
> +	ret =3D spacemit_timer_write(timer, TMR_PRELOAD, 0, U32_MAX);

[Severity: High]
When TMR_FREE_RUNNING (BIT(0)) is set in TMR_CMR during
spacemit_timer_resume(), does enabling the counter in
spacemit_timer_next_event() reload TMR_PRELOAD?

In this timer block, setting bit 0 of TMR_CMR selects free-running mode whe=
re
the counter wraps across 32 bits and ignores the preload register, whereas
clearing bit 0 of TMR_CMR selects preload mode (as in
arch/arm/mach-mmp/time.c:timer_config(), which clears bit 0 in TMR_CMR for
counter 0).

Because spacemit_timer_next_event() programs TMR_MATCH with delta - 1
relative to zero rather than relative to the current counter value, won't
setting TMR_FREE_RUNNING in TMR_CMR leave the counter at its previous non-z=
ero
value when re-enabled, causing oneshot events to fire at the wrong time or
wait for a full 32-bit wraparound?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-spacemit-s=
oc-timer-v1-0-36722421db6e@linux.spacemit.com?part=3D2
