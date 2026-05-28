Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C532E7366
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 15:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779981818; cv=none; b=d84kMe4lr7OF8QF4MQ0KGBchQksQIX7t3GRfVZIXKtphHNk/Rx65AlaO92TFWMn6A9yjhv96tmnBQov9R/fLOBF9pXXFKF0tlJFAS3ekj7xurYFfeq1JI4+tlekqEHhGXHJSMEvmSQWRWKtb7czztDB+maH1VIV6ZcV2056Mzgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779981818; c=relaxed/simple;
	bh=F/iG7+TQYK/3Gk+z5S15nPk6Tp6X1NtNbYm73De2KyM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f2XQLKUoqBmC5NA9fSjVmig6FlOzN4H7X+LsSMTv7SjB6in51aZBBlMDFwxqG5URUYkhzdo8fpInDMRW/QK2omGhQaRCK5wJ2g+3by/zhhCacZlUXMJTgX/5lqa3pNnGwvoNh753qXZ4toQPkmsG1gttv7kMbdBDL9pvuCNv2rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PwW7+42d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PwW7+42d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD6D41F000E9;
	Thu, 28 May 2026 15:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779981818;
	bh=n9d0JFpqcwCKeoAVlUij0GNGvhkPQrsAklBcDQN0t2E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PwW7+42dgDl3PW3ImI7sw/+CHx5Evz4CyKQbO3BnXU5vxtmASf+uNmV/bmpS1i9SW
	 oUVVQy44WkQLyLsD+QE1O8IYLwuoUPQR+4kIVj92TtZh3G1tqIhrgDT+T6nJ2RwLwg
	 Q89AAhgkWgBVDZngxBbxBSLTJOBMwEPxb1NM6Ht6LcJ+RWUwLvFkhQP5Hz7hToG/wd
	 b0ac9qyIUzW0jmqhnwcMiexErbS/JwTm71NVTt8nnU7KQOY2RR784Q6HwpqtMUyjA4
	 Ah1QwUQf8TahFusQdMAigIEcMSz+/NKOWDPJiBTkz12apGO5xjOMVcKNHuew5ajDEE
	 eBIC5zdZK3myw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/5] clocksource/timer-econet-en751221: Init teardown
 on error if possible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260528140046.2897674-4-cjd@cjdns.fr>
References: <20260528140046.2897674-4-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 15:23:37 +0000
Message-Id: <20260528152337.DD6D41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] The newly added error path for `cpuhp_setup_state()` failure c=
reates a fatal use-after-unmap vulnerability by freeing IRQs and unmapping =
I/O memory without unregistering the active clockevent devices.
--

commit e1e0b36b8164978eb079f38d9547d743cebd0a97
Author: Caleb James DeLisle <cjd@cjdns.fr>

clocksource/timer-econet-en751221: Init teardown on error if possible

This commit reorganizes the initialization process of the econet timer by
separating it into two phases. It adds teardown logic to safely roll back
resource allocations like memory mappings and IRQ requests if an error occu=
rs
before the point of no return.

> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocks=
ource/timer-econet-en751221.c
> --- a/drivers/clocksource/timer-econet-en751221.c
> +++ b/drivers/clocksource/timer-econet-en751221.c
[ ... ]
> @@ -187,22 +166,45 @@ static int __init timer_init(struct device_node *np)
[ ... ]
> +	ret =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> +				"clockevents/econet/timer:starting",
> +				cevt_init_cpu, NULL);
> +	if (ret < 0) {
> +		pr_err("%pOFn: cpuhp setup failed (%d)\n", np, ret);
> +		goto out_irq_free;
> +	}

[Severity: Critical]
When cpuhp_setup_state() executes the startup callback across online CPUs,
it registers the clockevent devices. If this fails on a subsequent CPU,
cpuhp_setup_state() aborts. Because a NULL teardown callback was provided,
the CPU hotplug core skips rollback and leaves the successfully registered
clockevent devices active on the earlier CPUs.

The error path here then frees the IRQs and unmaps the I/O memory. If the
timekeeping core attempts to handle a timer interrupt or program the next
event on the still-registered clockevent devices, will it dereference the
unmapped memory?

Should the active clockevent devices be unregistered, or a teardown callback
provided to cpuhp_setup_state(), before freeing these resources?

> +
> +	/* Point of no return, do not attempt to tear down after this. */
[ ... ]
> +out_irq_free:
> +	free_percpu_irq(econet_timer.irq, &econet_timer_pcpu);
> +out_irq_mapping:
> +	irq_dispose_mapping(econet_timer.irq);
> +out_membase:
> +	for (int i =3D 0; i < ARRAY_SIZE(econet_timer.membase); i++) {
> +		if (econet_timer.membase[i]) {
> +			iounmap(econet_timer.membase[i]);
> +			econet_timer.membase[i] =3D NULL;
> +		}
> +	}
> +
> +	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528140046.2897=
674-1-cjd@cjdns.fr?part=3D3
