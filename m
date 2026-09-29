Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A0F4E3239
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672801; cv=none; b=eoutX3rO9ZaV6OK4rLvoSt3DZWJYAS3lKO9uhBcVYeMcpB2mRk4RvxH/OfluhYUpk80d16GmYdiPDYIXw3xaxWiSqrWHxmXwp2yWi2gVDXojLt6sqJdxBgloaSxP8oCwFmSbZu0gc1MK+h7I6Zj1gAwzkvaDJjPjx+oNkkqgzn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672801; c=relaxed/simple;
	bh=UkfQ3hiI8L6PlnnaMeQeYJz0sDiSLvPx7wjzQAO7DAc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r8r44PHJLMth47Wl9Fo8nhk2EWc+YxJF78pSh7KnAv3T08p1crbf5lufi7+bmaiNrWDIaCON0+mxM4kA/n1G6g3sfZJo9GWrgF18B92n9D5XD10J6pHBBld369Ngltc8oQO5Atsehs8Z9y2bQauacpaykQvYH7MxOGsVy+mFGkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZLlm2E+D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZLlm2E+D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 011BA1F000FF;
	Tue, 29 Sep 2026 09:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790672778;
	bh=YK0HbrE8plrsC+UCq5dmR6pDscSlG6Gkco+iQ4WZi6E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZLlm2E+DdC0HQgrmkwTK/qVJJrTk163dyPUMPrRO1v5giAqY/a+ON4OaDD90Y9EXj
	 zrvgltgLAG+H6cllFJ+4W+ju2n0GJ/g7E+mXaMoxdxia0ujjP4MgwtnAgx/FAJkZBj
	 uPVzWp5sfYEVyvR90SFlWrmgHwD1VuiRPnYIqVwwwfIqMBs9ok7qZyg6EtrTKCRO9f
	 ChMydq67DPc6LL2qv4fjycesH6CWPaFWyaYf8KSeQ9YjlRItnwTf5LXcsAJNNqdC8T
	 rUteMVd7doEXWIJvzhZSQArtWUyimzCGqr8A7REjwZ+KpJFwW51UbKaLnGdhI9h1Du
	 trNZnYiH7S4xw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/4] clocksource/drivers: Add support for the Renesas
 RZ/N1 timers
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SGVydmUgQ29kaW5hIChTY2huZWlkZXIgRWxlY3RyaWMp?= <herve.codina@bootlin.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org
In-Reply-To: <20260929085035.57609-3-herve.codina@bootlin.com>
References: <20260929085035.57609-1-herve.codina@bootlin.com>
 <20260929085035.57609-3-herve.codina@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 09:06:17 +0000
Message-Id: <20260929090618.011BA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] timer: rzn1: NULL pointer deref in irq handler for detached timers
--

commit c504b8f1cef80ec82616cd19b137210a244f7ec4
Author: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>

clocksource/drivers: Add support for the Renesas RZ/N1 timers

The Renesas RZ/N1 timer block controller is the controller in charge of
timers available in the Renesas RZ/N1 SoCs family.

> diff --git a/drivers/clocksource/timer-rzn1.c b/drivers/clocksource/timer=
-rzn1.c
> new file mode 100644
> index 0000000000000..3b173b4086e92
> --- /dev/null
> +++ b/drivers/clocksource/timer-rzn1.c

[ ... ]

> +static irqreturn_t rzn1_timer_interrupt(int irq, void *dev_id)
> +{
> +	struct rzn1_timer *timer =3D dev_id;
> +
> +	/* Ack the interrupt */
> +	readl(timer->base + RZN1_TIMER_CLEAR_INT_REG);
> +
> +	timer->ced.event_handler(&timer->ced);

[Severity: High]
Does this code risk a NULL pointer dereference if the timer is detached?

The driver unconditionally registers multiple clockevent devices and their =
IRQs.
The clockevents core leaves unused timers in CLOCK_EVT_STATE_DETACHED, which
means their event_handler remains NULL.

> +	return IRQ_HANDLED;
> +}

[ ... ]

> +static void rzn1_timer_register_clkevt(struct rzn1_timer *tab_timers,
> +				       unsigned int first_timer_index,
> +				       unsigned int last_timer_index)
> +{
> +	struct rzn1_timer *timer;
> +	unsigned int i;
> +
> +	for (i =3D first_timer_index; i <=3D last_timer_index; i++) {
> +		timer =3D &tab_timers[i];
> +		clockevents_config_and_register(&timer->ced, timer->rate,
> +						1, GENMASK(timer->width - 1, 0));
> +		/*
> +		 * Time to enable the interrupt even if no interrupt can be
> +		 * fired yet. Indeed, the timer is still globally disabled.
> +		 * It will be enabled when rzn1_timer_config() is called
> +		 */
> +		enable_irq(timer->ced.irq);

[Severity: High]
Can enabling the IRQ unconditionally here trigger the NULL pointer derefere=
nce
above?=20

If the clockevents core leaves a timer unused and we enable its IRQ anyway,
a spurious interrupt on this hardware line will cause the interrupt handler=
 to
blindly call timer->ced.event_handler and crash.

> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929085035.5760=
9-1-herve.codina@bootlin.com?part=3D2
