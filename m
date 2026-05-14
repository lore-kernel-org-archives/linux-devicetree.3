Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E223C769D
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 12:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778760360; cv=none; b=ROJh7VT8Se2cPPvy0w7312JQflMnA8FElVxBzJ0o0uqKSsd/kUmcmXvjPxWv3WMGsV6e+nb9kGfTh+nBHbrQ+9OT7EAD1sN/cVAKl6BUY83E8QG8OEsmud5Br/3rWu0GopUSQ75wxfr8Q9fHPZzG20oP/MhYOAYaKYuz0jgbMew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778760360; c=relaxed/simple;
	bh=0sVrfRxQle+z0OakYYxwHGosb0kytmFZpi/8f6rT1sY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uHaaSj3KcGrqtgo4x76AixtrBPpay+UzgA/RfuwthXJT4YJUnFh3rkVXMGjKwpDgo5UlVF6kvQXsVySzC5135ibS46dBOMNnbHrvxV9TuvhMVY4kphOR/9Bd5Aq6wjCrl1ZhtXk+FGIF3ukoOpPYPfpQIf0111f5srGEvw52Kpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V5xO2xZT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V5xO2xZT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0492CC2BCB3;
	Thu, 14 May 2026 12:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778760360;
	bh=0sVrfRxQle+z0OakYYxwHGosb0kytmFZpi/8f6rT1sY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=V5xO2xZT8t7J9aO8H2a50tMZZmWEw4XPjEi+2VrZCQE82KB9dSOwQcxkhhIlf0Bwq
	 NqgoxMTXO7elWpcxu6ogGEF1YIar2pJIufMVJ6h+uwUQqkbTZjvmROXUaImUQQlwTM
	 tnop51O635khUf2EokgbFLhDbDzNlGLeBZVOg8ynjgDlTnqX8xw8TmW+5OoN2EuBO5
	 i3NflwVD4K5QvLfeub78DyKUs/18jVoWBFliNMpHZVDu3biwVlgQ2GDaAk8wG/WSdw
	 J1NzXsOe1XSXZk93u7lZxe3QrD6CAmVGps/22/t2NEUOHPWlqANZIN0oInrGjunMBZ
	 48qAjyez5kIUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/5] clocksource/timer-econet-en751221: Move generic
 logic out of cevt_init
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260514000601.3430262-3-cjd@cjdns.fr>
References: <20260514000601.3430262-3-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 12:05:59 +0000
Message-Id: <20260514120600.0492CC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The return value of `cpuhp_setup_state()` is ignored, masking crit=
ical initialization failures.
- [High] The hardware clock is retrieved but never enabled before accessing=
 memory-mapped registers.
- [High] Missing teardown callback for CPU hotplug leaves per-CPU IRQs enab=
led and the timer running when CPUs go offline.
--

commit c97af74688377fb3c996bd3eeeee07ce5a52eb15
Author: Caleb James DeLisle <cjd@cjdns.fr>

clocksource/timer-econet-en751221: Move generic logic out of cevt_init

This commit simplifies cevt_init by moving common generic logic out
into a new cevt_setup_clockevent function. This change prepares the driver
to support either a percpu IRQ or multiple IRQ numbers.

> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocks=
ource/timer-econet-en751221.c
> --- a/drivers/clocksource/timer-econet-en751221.c
> +++ b/drivers/clocksource/timer-econet-en751221.c

[ ... ]

> @@ -203,6 +206,10 @@ static int __init timer_init(struct device_node *np)
>  	if (ret < 0)
>  		return ret;
> =20

This isn't a regression introduced by this patch, but does the hardware clo=
ck
retrieved via of_clk_get() earlier in timer_init() need to be enabled with
clk_prepare_enable() before memory-mapped registers are accessed?

> +	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> +			  "clockevents/econet/timer:starting",
> +			  cevt_init_cpu, NULL);
> +

Since cpuhp_setup_state() can fail and return a negative error code, should
the return value be checked here?

Also, because there is no teardown callback provided, does this leave per-C=
PU
IRQs enabled and the timer running when a CPU goes offline?

>  	sched_clock_register(sched_clock_read, ECONET_BITS,
>  			     econet_timer.freq_hz);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514000601.3430=
262-1-cjd@cjdns.fr?part=3D2
