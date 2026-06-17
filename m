Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33D138C2A5
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 06:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781676774; cv=none; b=X29ChzxOjmB9CBrYUkQ2ErIblRaxEfYuUeaLIoSEkd/2l5o/912QWqo1/nXgFE1AGpHceWYR3QsaE9kSZTEjByZ3XPqrX2dWxaWcpSqvp6mjPQ1cg1AR46mHF+JEkx+6g5nDkZkQTk1dewY0Hy7r+hWPhlPuVfbQuxlF6Syll2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781676774; c=relaxed/simple;
	bh=v1twMrpWtxCNBQpX4oB0XqNVzUVSloKYJCCQ3GPGc9I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u7P+IqU7u1qn+ZXHQumk0hjUdQMAwsTeDHhDUj36uF4zijoWGYc+YtqTVnWdiNj9zZxbxyOVeftbc8wJCMa9OUo11+bwsYuxKFeul7ViGWjOq1H0wQT5ZulPzuliqzGZ2JpOOcekAa3l4arZPwdvfZ8uhXyfggXcem2kH0Fv6bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YeTQiQ3M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YeTQiQ3M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3C31F000E9;
	Wed, 17 Jun 2026 06:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781676773;
	bh=ZwnenZfPSX1N8YpneB0rgY6nKyYJw88ymiXknyMYn3U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YeTQiQ3Mwiirb0jau1XSCumg6zz9Kp6JzhNDalA1YVL2ZXXoE3H61Fko/gsvltG4G
	 g2Px72GaU1s8eOf8oB78uI8qnstZqDB943N7iatvy/5kUSBAYbmvowfWLyYesAOPXG
	 atgDq5Y85pWqC06sXRJdkrnsSADSUooqpApwXZJfdLpu7eDfUQu8GIqSf3Ojf9g+5W
	 XRlaXsokG1dABMIyV5mhwemN0sctgnXHAxEe4e/kCswbtAly+2MmELbf93ftkAXTb1
	 c79ZTlbg6dRRO1nvhnEX2ubeSTJXKMQnix1OeSNL1yLdL0OfvlMPQOqx9B6iWnnAUO
	 vWyM+qfECBFIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/5] reset: cix: add audss support to sky1 reset
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: joakim.zhang@cixtech.com
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260617060437.1474816-3-joakim.zhang@cixtech.com>
References: <20260617060437.1474816-1-joakim.zhang@cixtech.com>
 <20260617060437.1474816-3-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 06:12:52 +0000
Message-Id: <20260617061253.3F3C31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Using asynchronous `pm_runtime_put()` on the probe error path canc=
els the pending suspend, leaking the active power state.
- [High] Premature registration of the reset controller creates a race cond=
ition that can lead to bus faults or use-after-free.
- [High] The return value of `reset_control_deassert()` is ignored.
- [Low] Unconditional assignment of the `.pm` ops pointer generates dead co=
de when PM is disabled.
--

commit 22eea5c604734dfc2f4c075cfefb3354c7756088
Author: Joakim Zhang <joakim.zhang@cixtech.com>

reset: cix: add audss support to sky1 reset driver

Extend the Sky1 reset controller driver for the AUDSS CRU syscon. The
AUDSS block provides sixteen active-low software reset bits in one
register for audio subsystem peripherals.

> diff --git a/drivers/reset/reset-sky1.c b/drivers/reset/reset-sky1.c
> index 78e80a533c399..462501c2ea066 100644
> --- a/drivers/reset/reset-sky1.c
> +++ b/drivers/reset/reset-sky1.c
[ ... ]
> @@ -343,12 +393,36 @@ static int sky1_reset_probe(struct platform_device =
*pdev)
>  	sky1src->rcdev.of_node   =3D dev->of_node;
>  	sky1src->rcdev.dev       =3D dev;
> =20
> -	return devm_reset_controller_register(dev, &sky1src->rcdev);
> +	ret =3D devm_reset_controller_register(dev, &sky1src->rcdev);
> +	if (ret)
> +		return ret;
> +

[Severity: High]
Does registering the reset controller this early in sky1_reset_probe()
expose it to the system before hardware and power management are fully
initialized?

If a concurrent consumer device attempts to trigger a reset before the
NOC reset is acquired and power management is enabled, could this
execute register operations against unpowered or uninitialized hardware?

If devm_reset_control_get_exclusive() later returns -EPROBE_DEFER, the
controller would be abruptly unregistered via devres while potentially
in use.

Could devm_reset_controller_register() be called as the final step in
probe() after all initialization is complete?

> +	platform_set_drvdata(pdev, sky1src);
> +
> +	if (of_device_is_compatible(dev->of_node, "cix,sky1-audss-system-contro=
l")) {
> +		sky1src->rst_noc =3D devm_reset_control_get_exclusive(dev, NULL);
> +		if (IS_ERR(sky1src->rst_noc))
> +			return dev_err_probe(dev, PTR_ERR(sky1src->rst_noc),
> +					     "failed to get audss noc reset");
> +
> +		pm_runtime_get_noresume(dev);
> +		pm_runtime_set_active(dev);
> +		devm_pm_runtime_enable(dev);
> +
> +		reset_control_deassert(sky1src->rst_noc);

[Severity: High]
Does this ignore the integer return value from reset_control_deassert()?

If deassertion fails, the driver proceeds to call
devm_of_platform_populate(). Child devices could probe and attempt to
access their registers while the hardware is still stuck in reset.

Could we validate the return value of reset_control_deassert() before
proceeding?

> +
> +		ret =3D devm_of_platform_populate(dev);
> +		pm_runtime_put(dev);
> +		return ret;

[Severity: High]
If devm_of_platform_populate() fails, this uses the asynchronous
pm_runtime_put() on the error path.

Since devm_pm_runtime_enable() was used, returning an error triggers
devres cleanup which executes pm_runtime_disable(). This cancels any
pending asynchronous idle/suspend work.

Because of this cancellation, sky1_reset_runtime_suspend() would never
execute, leaving the NOC reset permanently leaked in a deasserted state.

Should this use pm_runtime_put_sync() instead to guarantee synchronous
suspend before PM is disabled?

> +	}
> +
> +	return 0;
>  }
[ ... ]
> @@ -358,6 +432,12 @@ static struct platform_driver sky1_reset_driver =3D {
>  	.driver =3D {
>  		.name		=3D "cix,sky1-rst",
>  		.of_match_table =3D sky1_sysreg_of_match,
> +		.pm		=3D &(const struct dev_pm_ops){
> +			SET_RUNTIME_PM_OPS(sky1_reset_runtime_suspend,
> +					   sky1_reset_runtime_resume, NULL)
> +			SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +						pm_runtime_force_resume)
> +		},

[Severity: Low]
Does this unconditional assignment of the .pm pointer generate dead code
when CONFIG_PM is disabled?

The structure and statically referenced callbacks get compiled into the
kernel even though they can never execute.

Could this use the pm_ptr() wrapper macro to allow the compiler to
eliminate the unused structure?

>  	},
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617060437.1474=
816-1-joakim.zhang@cixtech.com?part=3D2
