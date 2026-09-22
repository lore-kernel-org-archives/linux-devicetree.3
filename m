Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014CC33B6F4
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073572; cv=none; b=udDsFNmyeB8K2VAN1BaJ6KMx+O/OBiu+wziUjjzEN4Vfu53FB28FHsZwl/y+TpN0e6GRe8/AkyZpXzu6/qSp1Ydx8uNDEBMh4uJNxyZxYog3VYWJeiOif6kgAVZPCsoBlSbu3HAf/uxSiR323rP7ZuVbxe7cLsoeVrzcNiiNQiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073572; c=relaxed/simple;
	bh=RPTfK1/O3qTWyBt87tS9kIa2RbjCP77pUnfl2mgkkx8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DfhJJuy9YUO7lay0uTmrTvdizmYgqKfYDPUY1/rE/bYMfPGaX6nnWlpgQVLknUcJDizup0gCd8USxNIjXuE7hZFB4Zj3beKOp8tm1gsTsTQJN5d1C+crQ8teCLtbKX2AEUnH0KD56gMSZzFVTL7KnNWEIZcHSTLxt5kBPLTYbTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NLrBa423; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NLrBa423"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5760E1F000FF;
	Tue, 22 Sep 2026 10:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790073570;
	bh=pK2YiQEU7uWcFS1EaDHcObFhSJ4IvFs+Ylj9n3/mg/0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NLrBa423QKYiCnfhAIM3ATUXwuMKqDRe3Zd9r29ahKu4vvx18RSxbwerzYpfXdcTo
	 ea8KAv5bT0hgfytOXx4ougRZQlaPpaeaSuYtxd7tI8XJFRAMkRZrlugjbkxnIEOCpE
	 dJa87Ald+tqNLpsVGpTZauie0kgtzzzmcUMe0YVIldHa9sCvOXaMqevyeeoWeUwnsT
	 UTyDrekLv7Tf02aEMzu6pEtBnsKo+6nVWubK01/5LCuGUheGD1fjwQWEoW2e9xym+N
	 p/6FTbA0BTzBvE22Cd1vk55vMam6LYVsftrzhiiBmlcbGzpIJHFHUjgVRmWbFMqHX3
	 jKdAIuhkuue5A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/4] pps: clients: gpio: release pins to an inactive
 state on remove and shutdown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eliav Farber" <farbere@amazon.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260922103051.5257-5-farbere@amazon.com>
References: <20260919171157.5502-1-farbere@amazon.com>
 <20260922103051.5257-1-farbere@amazon.com>
 <20260922103051.5257-5-farbere@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 10:39:29 +0000
Message-Id: <20260922103930.5760E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] timers: use of timer_delete_sync() instead of timer_shutdown_sync()=
 in teardown
--

commit c434ce52f848555ba764fe5cc2d58d2fed47b99f
Author: Eliav Farber <farbere@amazon.com>

pps: clients: gpio: release pins to an inactive state on remove and shutdown

This commit introduces logic to look up and apply an "inactive" pinctrl sta=
te
when the driver is unbound or the system is shut down. This ensures pins are
not left stuck in their default GPIO function for subsequent kernels like
kexec. It introduces a new shutdown callback that tears down the IRQ and
the echo timer before restoring the mux state.

> diff --git a/drivers/pps/clients/pps-gpio.c b/drivers/pps/clients/pps-gpi=
o.c
> index aec534c246af1..203bf465ed8bf 100644
> --- a/drivers/pps/clients/pps-gpio.c
> +++ b/drivers/pps/clients/pps-gpio.c

[ ... ]

> @@ -216,9 +298,31 @@ static void pps_gpio_remove(struct platform_device *=
pdev)

[ ... ]

> +static void pps_gpio_shutdown(struct platform_device *pdev)
> +{
> +	struct pps_gpio_device_data *data =3D platform_get_drvdata(pdev);
> +
> +	/*
> +	 * The kernel keeps running after device_shutdown() (e.g. to load and
> +	 * start a kexec image), so quiesce the hardware before touching the
> +	 * mux: free the IRQ and stop the echo timer first, then release the
> +	 * pins last, so no callback can drive a pin after it is handed back.
> +	 * The PPS source is left registered; that is a remove-time concern.
> +	 */
> +	free_irq(data->irq, data);
> +	/* reset the echo state, if the board has an echo GPIO */
> +	if (data->echo_pin) {
> +		timer_delete_sync(&data->echo_timer);

[Severity: Low]
Should this teardown sequence in pps_gpio_shutdown() use=20
timer_shutdown_sync() instead of timer_delete_sync()?

The modern timer API guidelines mandate using timer_shutdown_sync() in
device teardown paths to robustly prevent the timer from being re-armed.
While free_irq() runs prior and stops the interrupt handler from running
concurrently, timer_shutdown_sync() remains the documented standard for
fully shutting down a timer.

> +		gpiod_set_value(data->echo_pin, 0);
> +	}
> +	pps_gpio_release_pins(&pdev->dev);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922103051.5257=
-1-farbere@amazon.com?part=3D4
