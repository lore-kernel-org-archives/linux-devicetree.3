Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773582E7392
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 16:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779984187; cv=none; b=IrXpCDMH26LhKqZQkyDf+kIwzT9CvwNUCSfYFcP46srU5M+YGIhE7r6On4xHzk9sdZ0FYRmCKGFtEYYKU0tF/jsIdrlUcnP5oJjEPys+DckTLQx/u7LKrgykfZQ4wj4dLY/Qhsugj4cTON3SoLwWnjpbxYUiSiek2Q9lMh9oq+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779984187; c=relaxed/simple;
	bh=wuGvKBFVS9O4yVAaPv8QsiDIoISFobhZgwDM2UWlI08=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RkZ2Qu9sztpzdVKM5NbmfBAyXaPaMMzc3sHvVzQt+u1zMjzhF2gzhz0j3HW5mkI/+aLQd6b/c5PaNUmETkIRjRgg5txkJxEXspb1bq82YMFuJ+cp/Xr0/dBoJArtV9YjeMdseFScH6QfS0v98tJF+5xF9PsvAp048Sc+rB4x5Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DrUZR3Jl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DrUZR3Jl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2176E1F000E9;
	Thu, 28 May 2026 16:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779984186;
	bh=WcqffU9wMzhqk6W2asuUnuZguD/YdqgO5360F1rWtow=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DrUZR3Jl0hlPXBmLXzmLqfoO6Nb88EXCU2cY1FQ+mjKmHYSeQ1S8tE3GFs6sCUUCk
	 vWtKRVS24HIy5MM6YnNvVOH7dHtKflLuCzGSZQXkvqwSxl1nexQpc8ynnC7Fz5k6P4
	 eU7Yzbx0fzE4IEfYsAFSUQwdS7K9J5w7Kg5YeRR2zla0sdth71D2/IQJpRE/YdJB48
	 7a4ay3n7SY5rugJdJdHyVovHRHIkx98RYu6LoOB5SaLtkHQXPxEdxRtCGfzqYXTZON
	 8RuqKlIyJf3DYqqzzxYMn6MdcfN8B81cvXi3OvmKbmRFmRACDiHlNC31UtDMN6jqDr
	 wk7WYPGM8JOPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/5] clocksource/timer-econet-en751221: Disable IRQ
 until cevt registered
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260528140046.2897674-5-cjd@cjdns.fr>
References: <20260528140046.2897674-5-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 16:03:05 +0000
Message-Id: <20260528160306.2176E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Incorrect assumption that clockevents_config_and_register() can =
fail.
- [Low] Unnecessary manual setting of IRQ_NOAUTOEN flag.
--

commit f75e71c2c11de4c792309a75e268796b0c4679bf
Author: Caleb James DeLisle <cjd@cjdns.fr>
clocksource/timer-econet-en751221: Disable IRQ until cevt registered

This commit addresses a race condition where the timer interrupt may
trigger before clockevents_config_and_register() sets up the event
handler. It resolves this by enabling the per-CPU IRQ only after the
clockevent device is fully registered and adds a NULL check for the
event handler.

> Eliminate a race condition where cevt_interrupt may trigger before
> clockevents_config_and_register has been called, and dev->event_handler
> is at that point NULL. Additionally, NULL check dev->event_handler in
> interrupt callback just in case clockevents_config_and_register failed.

[Severity: Medium]
Is the reasoning about clockevents_config_and_register() failing accurate
here?=20

Looking at the implementation of clockevents_config_and_register(), it
returns void and does not have a failure path.

> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocks=
ource/timer-econet-en751221.c
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

[Severity: Medium]
Is this NULL check necessary?=20

Because clockevents_register_device() unconditionally initializes the event
handler to a valid function (such as clockevents_handle_noop),
dev->event_handler should never be NULL once registration is complete.

[ ... ]

> @@ -178,6 +180,8 @@ static int __init timer_init(struct device_node *np)
>  		goto out_membase;
>  	}
> =20
> +	irq_set_status_flags(econet_timer.irq, IRQ_NOAUTOEN);
> +
>  	ret =3D request_percpu_irq(econet_timer.irq, cevt_interrupt, np->name,
>  				 &econet_timer_pcpu);

[Severity: Low]
Is this manual status flag update needed?=20

When an IRQ is configured as a per-CPU devid interrupt by the irqchip driver
via irq_set_percpu_devid(), the IRQ_NOAUTOEN flag is inherently applied
alongside IRQ_PER_CPU and IRQ_NOTHREAD. Setting it manually here appears
redundant.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528140046.2897=
674-1-cjd@cjdns.fr?part=3D4
