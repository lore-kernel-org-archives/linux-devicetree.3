Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7321F2BE7DC
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 01:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778981296; cv=none; b=fDdBVamdDkuIpuPmAsPod6xC9l2Nsajq2NIuv81OVLhB7MvvGqoThIYlRxZMekZKCLUqTmWtVzxjYQAiIhIPAfef4xMeNzzY8lJv37Ym3lvJuI1YSDtE0ectmR8oeTJr0aWkkhrgnmEoV80KDjaHPVMGJoDTywcAon4YP8v73oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778981296; c=relaxed/simple;
	bh=OnMODJss8WGm3Y01x+VuFHoTO66Yw/ZVJt/+Mv+FhH8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N80wTxIsXjyJxrFwr/4CbDPRBBuNH53KTTj8MQJcdhh8bJf7nUn9WbsCangrx7wQy0/SXIsc5AtxE2sbQWTngnc7J3U/QA52Ak6x/bX7Bcsv6ewZ8Tx8mE+rS0dUFn2ZmZGpOmFQmwkGKTFYQ0wtJpsVqRD5RzQdww9QC7C5k2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AdtOYaQc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AdtOYaQc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A69C19425;
	Sun, 17 May 2026 01:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778981296;
	bh=OnMODJss8WGm3Y01x+VuFHoTO66Yw/ZVJt/+Mv+FhH8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=AdtOYaQcFv9FNVeHe8bJwjNqb1vAjUolqrtP//G8bSQPhFLwkb9e9+nls/4uhUWWq
	 gpOlX+/+YC7lbZp9MlChlgotXsIF/ftUhBPzbFvSh1xdwaRd/Q9Dg6H72GZS/Xut3D
	 iDX7I8u09kY5VM8VIv5dp6YNsHF1C4o78WF0fn3sB2EP5iTSkv+39sFiEVDiX+kNU8
	 wvhnFdYFXFEPmt074Fam4xkbSwvuCHEXZLjHSEb0kay/8RpYtOAmjudcdPCn40VqeY
	 JJ8ZdPm/StNTULkXzGfgVrnpGPRVKzvaRN0kgXLaDE5t1iIvU4nrockIaDd63r5h3e
	 TddlyzwJdhmJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/4] clocksource/timer-econet-en751221: Support
 EN751627 without percpu IRQ
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260516233943.49502-5-cjd@cjdns.fr>
References: <20260516233943.49502-5-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 01:28:15 +0000
Message-Id: <20260517012815.C9A69C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing validation for zero address blocks leads to a NULL pointer=
 dereference on malformed device trees.
- [High] Missing CPU hotplug teardown callback causes unhandled IRQ storms =
and unbalanced IRQ enables.
- [High] Failure during CPU hotplug setup unmaps active timer memory, leadi=
ng to a fatal page fault.
--

commit 050e8a34fec303d14b7b31dbc641fcb39833f19b
Author: Caleb James DeLisle <cjd@cjdns.fr>

clocksource/timer-econet-en751221: Support EN751627 without percpu IRQ

This commit adds support for the EN751627 hardware. It allows the driver to
operate with a different interrupt number for each CPU timer, rather than
relying on a single percpu interrupt as used by the EN751221.

> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocks=
ource/timer-econet-en751221.c
> index ed750e39cc4fa..529f81118eef3 100644
> --- a/drivers/clocksource/timer-econet-en751221.c
> +++ b/drivers/clocksource/timer-econet-en751221.c
> @@ -99,6 +101,25 @@ static int cevt_init_cpu(uint cpu)
>  	struct clock_event_device *cd =3D &per_cpu(econet_timer_pcpu, cpu);
>  	u32 reg;
> =20
> +	if (!reg_ctl(cpu)) {
> +		pr_err("%s: missing address resource for CPU %d\n", cd->name,
> +		       cpu);
> +		return -EINVAL;
> +	}
> +	if (cd->irq <=3D 0) {
> +		pr_err("%s: missing IRQ for CPU %d\n", cd->name, cpu);
> +		return -EINVAL;
> +	}
> +	if (!econet_timer.is_percpu) {
> +		int ret =3D irq_force_affinity(cd->irq, cpumask_of(cpu));
> +
> +		if (ret) {
> +			pr_err("%s: failed to set IRQ affinity to CPU %d: %pe\n",
> +			       cd->name, cpu, ERR_PTR(ret));
> +			return ret;
> +		}
> +	}
> +
>  	pr_debug("%s: Setting up clockevent for CPU %d\n", cd->name, cpu);
> =20
>  	reg =3D ioread32(reg_ctl(cpu)) | ctl_bit_enabled(cpu);
> @@ -107,7 +128,10 @@ static int cevt_init_cpu(uint cpu)
>  	clockevents_config_and_register(cd, econet_timer.freq_hz,
>  					ECONET_MIN_DELTA, ECONET_MAX_DELTA);
> =20
> -	enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
> +	if (econet_timer.is_percpu)
> +		enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
> +	else
> +		enable_irq(cd->irq);

If a CPU is taken offline, does the lack of a teardown callback for the CPU
hotplug state mean disable_irq() is never called?

If the CPU comes back online, cevt_init_cpu() will call enable_irq() again.
Since the internal depth counter of the IRQ is already 0, could this trigger
an unbalanced enable warning?

Additionally, if the CPU goes offline and the still-active standard IRQ is
migrated to another CPU, could this cause an unhandled IRQ storm? The timer
is still running and the interrupt handler might fail to clear the pending
interrupt on the new CPU.

[ ... ]
> @@ -138,19 +162,48 @@ static void __init cevt_init(struct device_node *np)
>  static int __init timer_init(struct device_node *np)
>  {
> -	int num_blocks =3D DIV_ROUND_UP(num_possible_cpus(), 2);
> +	int num_blocks =3D of_address_count(np);

If a malformed device tree lacks a reg property, num_blocks will be 0. The
code below checks if num_blocks is greater than ARRAY_SIZE but doesn't check
if it is 0.

Could this lead to a NULL pointer dereference later when clocksource_mmio_i=
nit()
is called?

Since the of_iomap() loop will be skipped, econet_timer.membase[0] would
remain NULL, and reg_count(0) would compute an IO address based on it.

> +	int num_irqs =3D of_irq_count(np);
>  	struct clk *clk;
> -	int ret;
> +	int ret, i;
[ ... ]
> @@ -216,11 +279,19 @@ static int __init timer_init(struct device_node *np)
>  	}
> =20
>  	cevt_init(np);
> =20
>  	ret =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
>  				"clockevents/econet/timer:starting",
>  				cevt_init_cpu, NULL);
>  	if (ret < 0) {
>  		pr_err("%pOFn: cpuhp setup failed (%d)\n", np, ret);
>  		goto out_irq_free;
>  	}

If cevt_init_cpu() succeeds on the boot CPU but fails on a subsequent CPU
when irq_force_affinity() returns an error, cpuhp_setup_state() will return
an error and the driver will branch to out_irq_free and then out_membase.

Since the teardown callback is NULL, the clockevent device for the
successfully started CPU is never unregistered.

Could this lead to a fatal page fault when the clockevents core attempts
to access the timer registers after they have been unmapped by iounmap()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516233943.4950=
2-1-cjd@cjdns.fr?part=3D4
