Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7149530568C
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 19:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778958311; cv=none; b=Pz68LWXHd7WMzxyoTIscomllF4K+CQOIksKOo03gQRL2XokFSbhaY65atsbShhaL1QyxcFCvuImHISLQTEpBbx3DUDqh3vvM3bQezmUBxgB897uBfda2sd7QJe6zPyRhNoFOsBHSF9MaYJMt27Q3tDFoTBQuR2RVoR350LQ9zPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778958311; c=relaxed/simple;
	bh=CxoMw0hJlayfixeg45DPnmrmX178N57odhLl7b5+08k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PUthBQQXFtYpSSLv/vtMYsEpFQHnMlXcxCo31D9xL7S5YALGMfDNBmaetP3Bx28w7s9ffsswoo+5bBmpKwZX1OOdNxx3U7c+FgGtg0e1trQZ/hYuADowczRrp5swHd/jzxNsmNPQCeKvcvOb0q/ON0O60UkT/sCy1KVOPmqsaXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t9n55AAX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t9n55AAX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD925C19425;
	Sat, 16 May 2026 19:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778958311;
	bh=CxoMw0hJlayfixeg45DPnmrmX178N57odhLl7b5+08k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=t9n55AAXnqPfM4vig6nvBv3LoK1+v5hhVVhbdTMq7IuwngImXE2rzydJF2oQqgImp
	 5d71eA8oiLFu0//bI4xYRk6EM8rIteZKu228vBXoYF54TV/W+aiGurtk8xjG0yvj98
	 c0PU+TXB8xXxXX8H0JVkrKvREvq3MaEEIEka7X0/vnvg1SJZjzqA8pi//3TgcIR4yb
	 puxFPslrE6VoSxCAhagmqHGE8MCuXgkZoUrd8xTKDvYbUNCj0G9TYVfTWrhqKvYfZm
	 G7EBiaDkapKQS+BBYsl4YcB9ObxJlfAh6r7YigsuQViR4PlRTHBFAoiBmEd3WrN098
	 RtdMrIPIoYZTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] clocksource/timer-econet-en751221: Init teardown
 on error if possible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260516182648.3987792-3-cjd@cjdns.fr>
References: <20260516182648.3987792-3-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 19:05:10 +0000
Message-Id: <20260516190510.CD925C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The error teardown path for `cpuhp_setup_state()` failure unmaps M=
MIO memory without unregistering active clock event devices, creating a lat=
ent use-after-unmap bug.
- [High] `cevt_dev_init()` accesses memory blocks using absolute CPU IDs, c=
ausing a NULL pointer dereference if the CPU mask is sparse or the device t=
ree is incomplete.
--

commit 28fb215150f468c2962087cefa4f634e20465bd8
Author: Caleb James DeLisle <cjd@cjdns.fr>

clocksource/timer-econet-en751221: Init teardown on error if possible

This commit converts the initialization process into two clearly delineated
phases. It moves all IRQ and address resource mapping before the point of no
return and adds teardown logic in case of error.

> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocks=
ource/timer-econet-en751221.c
> index 4008076b1a210..155471f68e6f8 100644
> --- a/drivers/clocksource/timer-econet-en751221.c
> +++ b/drivers/clocksource/timer-econet-en751221.c

[ ... ]

> @@ -126,22 +127,9 @@ static void __init cevt_dev_init(uint cpu)
>  	iowrite32(U32_MAX, reg_compare(cpu));
>  }
> =20
> -static int __init cevt_init(struct device_node *np)
> +static void __init cevt_init(struct device_node *np)
>  {
> -	int i, irq, ret;
> -
> -	irq =3D irq_of_parse_and_map(np, 0);
> -	if (irq <=3D 0) {
> -		pr_err("%pOFn: irq_of_parse_and_map failed", np);
> -		return -EINVAL;
> -	}
> -
> -	ret =3D request_percpu_irq(irq, cevt_interrupt, np->name, &econet_timer=
_pcpu);
> -
> -	if (ret < 0) {
> -		pr_err("%pOFn: IRQ %d setup failed (%d)\n", np, irq, ret);
> -		goto err_unmap_irq;
> -	}
> +	int i;
> =20
>  	for_each_possible_cpu(i) {
>  		struct clock_event_device *cd =3D &per_cpu(econet_timer_pcpu, i);
> @@ -151,21 +139,12 @@ static int __init cevt_init(struct device_node *np)
>  					  CLOCK_EVT_FEAT_C3STOP |
>  					  CLOCK_EVT_FEAT_PERCPU;
>  		cd->set_next_event	=3D cevt_set_next_event;
> -		cd->irq			=3D irq;
> +		cd->irq			=3D econet_timer.irq;
>  		cd->cpumask		=3D cpumask_of(i);
>  		cd->name		=3D np->name;
> =20
>  		cevt_dev_init(i);

Could this iteration cause a NULL pointer dereference if the CPU mask is
sparse?

timer_init() allocates memory blocks based on num_possible_cpus(). If
cpu_possible_mask is sparse (for example, if only CPUs 0 and 3 are present),
num_possible_cpus() is 2, and only 1 block is mapped.

When this loop reaches CPU 3, cevt_dev_init(3) might try to access an
unmapped membase pointer.

A later patch in this series changes the allocation to use of_address_count=
()
and adds a check in cevt_init_cpu(), but since cevt_dev_init() is called
unconditionally here, the issue appears to remain reachable during early
initialization.

>  	}

[ ... ]

> @@ -186,22 +165,45 @@ static int __init timer_init(struct device_node *np)
>  		econet_timer.membase[i] =3D of_iomap(np, i);
>  		if (!econet_timer.membase[i]) {
>  			pr_err("%pOFn: failed to map register [%d]\n", np, i);
> -			return -ENXIO;
> +			ret =3D -ENXIO;
> +			goto out_membase;
>  		}
>  	}

[ ... ]

> +	cevt_init(np);
> +
> +	ret =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> +				"clockevents/econet/timer:starting",
> +				cevt_init_cpu, NULL);
> +	if (ret < 0) {
> +		pr_err("%pOFn: cpuhp setup failed (%d)\n", np, ret);
> +		goto out_irq_free;
> +	}

If cpuhp_setup_state() fails, does this error path leave active clock event
devices registered with unmapped MMIO memory?

cpuhp_setup_state() invokes its startup callback (cevt_init_cpu) on all
online CPUs, which activates the clock events. If it fails on a subsequent
CPU, the NULL teardown callback means no rollback occurs.

When the error path jumps to out_irq_free and unmaps the MMIO memory, any
subsequent timer interrupt could dereference the unmapped memory.

A later patch in this series modifies cevt_init_cpu() to return errors,
which makes this teardown path reachable.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516182648.3987=
792-1-cjd@cjdns.fr?part=3D2
