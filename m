Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2683C38655C
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 15:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078919; cv=none; b=fhPbBHnfOK8jPlBgDoTlXHHJS0nM+IaQsF75tIjFg84DcJaf4QzvoYPXRk4ODnLXggESoRKjwQlD4dUum1YYbXT629lcsd+Rn2wKFluzfW2PRu0DgVKEOLLgOvBiPK2Xmc8OMx0ql8NNHVYZ+Ynk0XPcH71ajSd/Hy0TLjOTJOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078919; c=relaxed/simple;
	bh=hhyuZl0Lz71//+9GmKxjyh+54hrUMVOGbJZ7ZiB7yCc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=LI5zzMSWI3O/VyP28dhIUMAmERr1MhPcEqP7Nsv3cOrrHET3BDuyqs/ph8f7/iy2le09G3Gn28umOO7LnPPbwop1JaYsj3WESG9K/yYImlmGxjoY1cRt5qL1wh+YLzW5OttZ4hbh/SszE29mI4nXqcKlEp9M4CDNYB6fNDQAfkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NhLwdEHs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NhLwdEHs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B8AD1F000C4;
	Thu, 15 Oct 2026 15:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792078905;
	bh=b5Ge3bGVYhgT2QTqY2rmwJzugmLc9vuErax2PNkZRVY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NhLwdEHsno/P0mN9dI2JaaVG7KqIGts3eqkMjdQlUZjppINPESG6RmH0y0quhdCiC
	 dxQsrG//FWXbE7tTdf3ifZMwO64EfNqX2CCgn+6cur3tgqFOcWJXiiNNprs9heSGfD
	 LHfR6azQngimRte53ILBeLpTyJpPq94RZKEKSws/pNnwzsMM21NsNVwqvNIjX6FUin
	 JXeLyoTqMtH6vs2TzXd9EP6k7fEUFEJyhDdKBNanT6xgzAQ9agJuxuEZL8lv4Bw1eb
	 rciKJBg09vqkgqMPxmyw0Erh3pMlco5V02dGZm60l7C/ZFeG2/xwJ/ye4NvjAS/c3i
	 B6W64bcQTpIWw==
Message-ID: <sashiko-outbox-173087@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 4/5] clocksource/timer-econet-en751221: Support
 EN751627 without percpu IRQ
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015145331.453837-5-cjd@cjdns.fr>
References: <20261015145331.453837-1-cjd@cjdns.fr>
 <20261015145331.453837-5-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 15:41:44 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] timer-econet-en751221: garbled log for skipped CPUs
--

commit 8c35e9425e27c43766e858db0613c5a5ed00f531
Author: Caleb James DeLisle <cjd@cjdns.fr>

clocksource/timer-econet-en751221: Support EN751627 without percpu IRQ

This commit adds support for the EN751627 CPU timer, which uses a different
interrupt number for each CPU timer instead of a single percpu interrupt.

> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocks=
ource/timer-econet-en751221.c
> index f2c4c1ee0a56b..ebcc6fa342189 100644
> --- a/drivers/clocksource/timer-econet-en751221.c
> +++ b/drivers/clocksource/timer-econet-en751221.c
[ ... ]
> @@ -102,6 +104,25 @@ static int cevt_init_cpu(uint cpu)
>  	struct clock_event_device *cd =3D &per_cpu(econet_timer_pcpu, cpu);
>  	u32 reg;
> =20
> +	if (!reg_ctl(cpu)) {
> +		pr_err("%s: missing address resource for CPU %d\n", cd->name,
> +		       cpu);

[Severity: Low]
Can cd->name be NULL here, resulting in a garbled "(null)" log message?

If a system has more possible CPUs than available IRQs and is not
using the is_percpu configuration, cevt_init() skips initializing the clock
event device for those extra CPUs:

    cevt_init() {
        ...
        for_each_possible_cpu(i) {
            ...
            if (!econet_timer.is_percpu && i >=3D econet_timer.num_irqs)
                continue;
            ...
            cd->name =3D np->name;
        }
    }

Although hotplug is unsupported, cpuhp_setup_state() is still called
during initialization and invokes cevt_init_cpu() for online CPUs. If
the topology happens to report more possible CPUs than available IRQs,
those CPUs will fail these early checks and pass the uninitialized cd->name
to pr_err().

> +		return -EINVAL;
> +	}
> +	if (cd->irq <=3D 0) {
> +		pr_err("%s: missing IRQ for CPU %d\n", cd->name, cpu);

[Severity: Low]
Similarly, could cd->name be uninitialized here for skipped CPUs?

> +		return -EINVAL;
> +	}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015145331.4538=
37-1-cjd@cjdns.fr?part=3D4
