Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B859C10F2
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 00:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778977236; cv=none; b=cYKtVH9ZUCsSj84s67GHt1tHMeU7zaqzUX09+KGG8D/4ooW9sWdR3lC5G6rRA5dW1fkEfJ5n6NcYU7iO2P6SP/MFTfvbshplpFnyaA7XSBI91hc4BmrN8u+io/x4G/WZZRAEjoHuyTj/xolLhEbPKClIMJn0AoRwffprJFAWCW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778977236; c=relaxed/simple;
	bh=0q/eY+on0+XHChhKwoaIpLQKbDvNsrrics2+4OknsTw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hRwj7Gb1ZY6i+iVur6VavO4NmdMzhQM3Nna5OM/25gBg+bpqtOF/+UlrHemB7ZuHZur3wV0aRXrlvA6YqSJ2bMLKL8EFWA+CxKMy5MYo5ed5loXYma4+Ngu4keqKa+1OGDnyujOfXc1h5gTP9wlWjOrYrp/IVDYm69d3xizWynE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hwSSty/1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hwSSty/1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F8C2C19425;
	Sun, 17 May 2026 00:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778977236;
	bh=0q/eY+on0+XHChhKwoaIpLQKbDvNsrrics2+4OknsTw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=hwSSty/1N0QE9LUqPnW55RK/UwaJy5QydPnIVWetbj7Y47EzCNDZ4p3w8QYCONoDf
	 74Wqzi06vyhQeuQNXk4nOHhZNIo6e/cx7Pnj8tPk3uDLq5iNmBWvd96bKc+W7V6wKx
	 QITuGnM8Rk2WZsgnyxjR8ujiws53dEEGVJFvomd/LJgBLsjS9kn/qHJtUjtVAqe4uf
	 VXhttcH4J2pUyqNmJb3pECF2HOMDq8Nhp8jXTCU7AJ4mcFTYOS+Bjo39miewkr5M65
	 EOWuidksT4phFJU7J4+0l9MxsKbINwOZlcwTZE713Zx5woNqwk8LQsTV7J0ypntTDA
	 sePW9DKtcC75w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/4] clocksource/timer-econet-en751221: Init teardown
 on error if possible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260516233943.49502-3-cjd@cjdns.fr>
References: <20260516233943.49502-3-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 00:20:35 +0000
Message-Id: <20260517002036.2F8C2C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Failing cpuhp_setup_state causes I/O memory unmapping while clock =
event devices are still registered and active, leading to a fatal page faul=
t.
- [High] Race condition during initialization leads to NULL pointer derefer=
ence.
- [High] Mapping memory blocks based on num_possible_cpus() leads to out-of=
-bounds accesses on systems with sparse CPU masks.
- [Medium] Error teardown path retains dangling pointers in the global econ=
et_timer.membase array.
--

commit 120bc83e186bdd341b411bcc91406b20c22b4507
Author: Caleb James DeLisle <cjd@cjdns.fr>

clocksource/timer-econet-en751221: Init teardown on error if possible

This commit splits the initialization of the en751221 econet timer into two
phases to support a clean exit on error. It moves IRQ setup and memory
mapping before the point of no return. A teardown path is added to free
IRQs and unmap memory if initialization fails early.

> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocks=
ource/timer-econet-en751221.c
> index 4008076b1a210..155471f68e6f8 100644
> --- a/drivers/clocksource/timer-econet-en751221.c
> +++ b/drivers/clocksource/timer-econet-en751221.c

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

Does calculating the number of memory blocks using num_possible_cpus() cause
issues on systems with sparse CPU masks?

If a system only has CPUs 0 and 4, num_possible_cpus() evaluates to 2, mapp=
ing
only one block. When hardware access paths use the absolute CPU index
(cpu >> 1), could reading econet_timer.membase[2] lead to a NULL pointer
dereference?

(Note: It is understood this issue was present before this patch).

> +	econet_timer.irq =3D irq_of_parse_and_map(np, 0);
> +	if (econet_timer.irq <=3D 0) {
> +		pr_err("%pOFn: irq_of_parse_and_map failed\n", np);
> +		ret =3D -EINVAL;
> +		goto out_membase;
> +	}
> +
> +	ret =3D request_percpu_irq(econet_timer.irq, cevt_interrupt, np->name,
> +				 &econet_timer_pcpu);
> +
> +	if (ret < 0) {
> +		pr_err("%pOFn: IRQ %d setup failed (%d)\n", np,
> +		       econet_timer.irq, ret);
> +		goto out_irq_mapping;
> +	}
> +
> +	cevt_init(np);

Is there a potential race condition here if an interrupt fires immediately
after request_percpu_irq() is called, before cevt_init() populates
cd->cpumask?

If the handler executes, could it result in a NULL pointer dereference
when reading dev->cpumask?

(Note: It is understood this might be fixed later in the patch series by
commit clocksource/timer-econet-en751221: Disable IRQ until cevt registered=
).

> +	ret =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> +				"clockevents/econet/timer:starting",
> +				cevt_init_cpu, NULL);
> +	if (ret < 0) {
> +		pr_err("%pOFn: cpuhp setup failed (%d)\n", np, ret);
> +		goto out_irq_free;
> +	}

If cpuhp_setup_state() fails on a subsequent CPU, could the already-registe=
red
clock events on previous CPUs continue to be invoked by the timer core?

Since the teardown path unmaps the IO memory without unregistering these
clock event devices, would calling cd->set_next_event dereference unmapped
memory?

Should cpuhp_setup_state() be placed after the point of no return, or should
a teardown callback be provided to unregister the devices?

[ ... ]

> +out_irq_free:
> +	free_percpu_irq(econet_timer.irq, &econet_timer_pcpu);
> +out_irq_mapping:
> +	irq_dispose_mapping(econet_timer.irq);
> +out_membase:
> +	for (int i =3D 0; i < ARRAY_SIZE(econet_timer.membase); i++) {
> +		if (econet_timer.membase[i])
> +			iounmap(econet_timer.membase[i]);
> +	}
> +
> +	return ret;
>  }

When iounmap() is called in the out_membase path, should the pointers in
econet_timer.membase be set to NULL?

Since econet_timer is a global static structure, if the driver's init
function is invoked a second time (such as from a secondary matching device
tree node), could a subsequent failure cause iounmap() to be called on
already-unmapped pointers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516233943.4950=
2-1-cjd@cjdns.fr?part=3D2
