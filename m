Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9DA3DD531
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 12:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778761804; cv=none; b=QK7W+JFw/KqbGExtNfzjbaHzU4QmzEgIjIgJOHd3x6EpOVmfkEK2skQOAkniziiTJBDs7SDcmKUd7KtOfOj2Lo+sAms9+USG3arHQIlMGqDRbCGPXtJ8/xvxpUg1OayJsYgEbKzod/2fpyhbJs41CiZjo/FJShuN6/hILsyw2ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778761804; c=relaxed/simple;
	bh=LbX8puNtdKIvzA+EYRfOksQZ7RbmzSNnlXdXS5LdUBQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q/mMcAXlvjOSigqh4S5sr7ezHsVbIoELOw6WzUV2JKJGQMQS9w9BEx6iToTy+th+N25tcJMd+NAzAO0n6eamntdkgGsHJSiYJJu01a5Cu7esYcc9JNqFie9Bv79/cytoMA4ydQwzkxs8nIYdHYZDB4Bz1Zf3sZmMgDaKWoaNbFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hT7MB11e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hT7MB11e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10908C2BCB3;
	Thu, 14 May 2026 12:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778761804;
	bh=LbX8puNtdKIvzA+EYRfOksQZ7RbmzSNnlXdXS5LdUBQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=hT7MB11ecyDFkoF2hYFQWaHGu9zS2bpyfEjA8hYH1XYB7nnaFX01+Hyu52tOpWZsa
	 bc8SVIiBAWYCQulXivHpHe6bDsWHlQp4mBpKwQGhYDYjEKk/Eb3WK057+TNFv0y82H
	 myAr60EY9lWRgJiAUipg8mkWY3gpa18TFjmmy7Z1n/LC5Z/tfDlX4RSeNJWDZCwwOX
	 Y2yT4F3O6Dnd9KNfwSwnagIbj9+JFTgGndk+zdk6EafXILwHWecmHgr/7cp7dNeYd8
	 pK+K7tOaJ1bwolxfnW76xt+ScinGd1ULcw3aayehMIWqcru/e+xwoSnMSHGM19/n/B
	 Ny86EWwBhWZVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] clocksource/timer-econet-en751221: Always map
 all membase blocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260514000601.3430262-4-cjd@cjdns.fr>
References: <20260514000601.3430262-4-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 12:30:03 +0000
Message-Id: <20260514123004.10908C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unconditional iteration up to a compile-time constant array size c=
auses timer initialization to fail on hardware with fewer timer blocks, bre=
aking boot.
- [High] The per-CPU timer interrupt is unmasked before the clockevent devi=
ce is registered, creating a race window that can lead to a NULL pointer de=
reference.
--

commit 1a3827645212808ad5c364c42807919047db1da2
Author: Caleb James DeLisle <cjd@cjdns.fr>

clocksource/timer-econet-en751221: Always map all membase blocks

This commit simplifies the logic by unconditionally mapping all timer memory
blocks up to ARRAY_SIZE(econet_timer.membase), instead of computing the
number of blocks dynamically based on the number of possible CPUs.

> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocks=
ource/timer-econet-en751221.c
> index 5def3e536b21c..e79069d9a826d 100644
> --- a/drivers/clocksource/timer-econet-en751221.c
> +++ b/drivers/clocksource/timer-econet-en751221.c
> @@ -173,7 +173,6 @@ static int __init cevt_init(struct device_node *np)
> =20
>  static int __init timer_init(struct device_node *np)
>  {
> -	int num_blocks =3D DIV_ROUND_UP(num_possible_cpus(), 2);
>  	struct clk *clk;
>  	int ret;

[ ... ]

> @@ -185,7 +184,7 @@ static int __init timer_init(struct device_node *np)
> =20
>  	econet_timer.freq_hz =3D clk_get_rate(clk);
> =20
> -	for (int i =3D 0; i < num_blocks; i++) {
> +	for (int i =3D 0; i < ARRAY_SIZE(econet_timer.membase); i++) {
>  		econet_timer.membase[i] =3D of_iomap(np, i);
>  		if (!econet_timer.membase[i]) {
>  			pr_err("%pOFn: failed to map register [%d]\n", np, i);

Could this cause a regression on systems with fewer timer blocks, like the
EN751221 (34Kc) which only has 1 block?

Since ARRAY_SIZE(econet_timer.membase) is based on CONFIG_NR_CPUS, it
expands to a compile-time constant that can exceed the actual number of
hardware blocks.

If a kernel is built with CONFIG_NR_CPUS=3D4 or higher, this loop will atte=
mpt
to map 2 or more blocks. On a system with only 1 timer block and 1 reg entry
in its device tree, of_iomap(np, 1) will fail and return NULL.

Because the error path unconditionally returns -ENXIO and aborts timer
initialization, could this completely break booting on these platforms?

This isn't a regression introduced by this commit, but looking at
cevt_init_cpu():

drivers/clocksource/timer-econet-en751221.c:cevt_init_cpu() {
	...
	enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);

	/* Do this last because it synchronously configures the timer */
	clockevents_config_and_register(cd, econet_timer.freq_hz,
					ECONET_MIN_DELTA, ECONET_MAX_DELTA);
	...
}

Is it possible for a timer interrupt to fire immediately after
enable_percpu_irq() is called?

If an interrupt fires before clockevents_config_and_register() completes,
could the interrupt handler dereference a NULL dev->event_handler(dev)?

Calling clockevents_config_and_register() before unmasking the interrupt
might close this potential race window.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514000601.3430=
262-1-cjd@cjdns.fr?part=3D3
