Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E7E3F3298
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 17:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083983; cv=none; b=av6oOxM5mZxUOSbp+1pwxzodKdSh9cvDZS8HLYyGBWywC21AQaaFZiJhhcaZduBO4aFYu2RvhC9ZS+jJpiQbJlfJhz3Fuy7GqQ2KImNygjoAkWnqZ9HOiRrfM/gaats5MM/LBYNcESoT8rBUCl3aToHyh3nhYxqE0T0uDLhbS/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083983; c=relaxed/simple;
	bh=eXYhf8dePcgqt7Pf4bWnX117M86CpO32j8tGzhNQtU0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=FcaGlvcIptBXZw99hs6lwly+qNyK5kLkx2eBCUotXGg/y93zXC7pG9u4rWW8IHQ3+/jiBNfhRieqTAXF/pumnL7mM/97ViTcdm/Y+JsOfz134pfhabCS0Dx+2hz8vat10GYenSZIbMWAADcB2/FiDSVyT2dsLSNx6cdu/dfkdqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XPNvXKgI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XPNvXKgI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A6D71F000C6;
	Thu, 15 Oct 2026 17:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792083965;
	bh=ZGRofT8dTeeR8tvhYpw+pxlAu6/AHlLblCCYvWOt2mo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XPNvXKgIY9wFYqEKfEky17OzVK0RC9LDvrIy0KdyeEYDihf1EcYm1KU8GhJwfbRA3
	 0iCbxMrozVUMtx7KgOUTAO5jKyaB5AUdUMkBau6+l0AO6AkiwUXatnJzrLmt2Ll6UH
	 NWXf1+toCmnLKR7BMMGU+tRJ9W9GXSMCB4NfPA8hOJlfNKvwuJzvp+1nHe2dvvF/8H
	 j360mWBzNaawFBKGBnreeHjQHMvYUOVoSuwgrhH/bUtjERTlVXGQL5pD23CdQs3Yo3
	 dd+EStaKEULwvjjBEh07nJrv3E3FEKgBrcckSj+1rngOpQhjNJ3c7qn7oiCeNmIcbp
	 wlZgBD0YGx7QQ==
Message-ID: <sashiko-outbox-173237@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 3/5] clocksource/timer-econet-en751221: Disable IRQ
 until cevt registered
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015165404.519741-4-cjd@cjdns.fr>
References: <20261015165404.519741-1-cjd@cjdns.fr>
 <20261015165404.519741-4-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 17:06:04 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] timers: NULL pointer dereference of dev->cpumask in early spurious=
 interrupt
--

commit be0c6a6a32c2acd59113d1e62f6e59c3c3a35579
Author: Caleb James DeLisle <cjd@cjdns.fr>

clocksource/timer-econet-en751221: Disable IRQ until cevt registered

Eliminate a race condition where cevt_interrupt may trigger before
clockevents_config_and_register has been called, and dev->event_handler
is at that point NULL. Additionally, NULL check dev->event_handler in
interrupt callback just in case clockevents_config_and_register failed.

> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocks=
ource/timer-econet-en751221.c
> index 714702b9ef128..f2c4c1ee0a56b 100644
> --- a/drivers/clocksource/timer-econet-en751221.c
> +++ b/drivers/clocksource/timer-econet-en751221.c
> @@ -75,7 +75,10 @@ static irqreturn_t cevt_interrupt(int irq, void *dev_i=
d)
>  		return IRQ_NONE;
> =20
>  	iowrite32(ioread32(reg_count(cpu)), reg_compare(cpu));
> -	dev->event_handler(dev);
> +
> +	if (dev->event_handler)
> +		dev->event_handler(dev);
> +
>  	return IRQ_HANDLED;
>  }

[Severity: High]
Does this code still have a NULL pointer dereference earlier in the
function?

If a spurious or bootloader-pending interrupt fires immediately after
request_percpu_irq() is called in timer_init(), the generic IRQ layer
(handle_percpu_devid_irq) bypasses irq_can_handle_actions() checks for
percpu interrupts and invokes cevt_interrupt() unconditionally.

This would lead to a NULL pointer dereference when cevt_interrupt()
attempts to read dev->cpumask:

cevt_interrupt() {
	struct clock_event_device *dev =3D this_cpu_ptr(&econet_timer_pcpu);
	int cpu =3D cpumask_first(dev->cpumask);
    ...

Since cevt_init() has not yet run to initialize the timer state,
dev->cpumask remains NULL. This could cause cpumask_first() to crash
before it ever reaches the new dev->event_handler check.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015165404.5197=
41-1-cjd@cjdns.fr?part=3D3
