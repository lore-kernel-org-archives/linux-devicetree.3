Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689D92C031E
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 13:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789567065; cv=none; b=SoEnVlAsC7vB9aQ2XEfU6omWayks4YhsWE3zV3JSYp9BaAbXfR61+CHP4WLlpRG7/iPIJcdfME4FydJbHhTy+M0x1jl6q1KIH0nqpIadrZl4lFAQs9+xct31KDNCc4W3OHHv5kt0STNsib4S0pfhpVLMyVlQs/d0Q5Bz3It2PuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789567065; c=relaxed/simple;
	bh=7M9/5FAf5IwwJ37tnHGAHY7+k+bNxDG+qYHckFdT0Zo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QDuV9CY4Z2UwjAyoi3M2b2EHoKZKAUlmg5Uq6jPn1zZnmkcxIf2ake225aujXDAPgLN9CthTd7Zg0Njabnr1OYKfMalN8cR6sl62sngWliRnXsz3JDPHcU95rAJWdOxtmgsZQ9Y0HxCeezGtwoIpuJmHjNE2F11zQIDh3P6lFKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F+s2C7Is; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F+s2C7Is"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83AE31F000FF;
	Wed, 16 Sep 2026 13:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789567061;
	bh=hVvMfmeb9XH+PAhO5CTicbL98sgEn6hd4yWE0EUDsf0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F+s2C7IshoN4RNbS5ohluHA3S9DMcfgj5ou08vIjNPYDRBgvuTz3LBBnMHohnAju0
	 1cnAaHtsNgkDyCVqIbbycDoGLhDm3DNQVF75iHud/AbaAT2yacp52MQ16LHqVQALKf
	 4exrY2Z2W8iT2RCisWn99PcVWF9ozkDqZsIVUVh09dTCYTau3YYTsmEghzbQo8Qv6U
	 qkgo3Fo4nb2RrdhtCCjCTUo8k2+etRHrYBHwSMceYmrER92prGxXs1pUiV2FdvU1F+
	 4L0GeV2h7oRbX08pEe0gqxyciF/hXasnWV2IrwTPSoQHAJfFwiZ8Cbb7cgdoCBaic1
	 Q8DjlHVUiOBQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] pps: clients: gpio: release pins to idle state on
 remove and shutdown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eliav Farber" <farbere@amazon.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260916134744.46354-3-farbere@amazon.com>
References: <20260916134744.46354-1-farbere@amazon.com>
 <20260916134744.46354-3-farbere@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 13:57:41 +0000
Message-Id: <20260916135741.83AE31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] pps: missing IRQ and timer teardown in pps_gpio_shutdown()
--

commit e71a89236222915be5ef5d5a822ad6e3bcc21b37
Author: Eliav Farber <farbere@amazon.com>

pps: clients: gpio: release pins to idle state on remove and shutdown

Some boards route the PPS input GPIO through a pin controller and mux it
to another function when the driver is not bound. This patch selects the
"idle" pinctrl state in both remove() and shutdown() so that the alternate
mux is restored, for instance before kexec.

> diff --git a/drivers/pps/clients/pps-gpio.c b/drivers/pps/clients/pps-gpi=
o.c
> index 73ec2c7335e51..bdedbed82d82c 100644
> --- a/drivers/pps/clients/pps-gpio.c
> +++ b/drivers/pps/clients/pps-gpio.c

[ ... ]

> @@ -216,9 +217,26 @@ static void pps_gpio_remove(struct platform_device *=
pdev)
>  	timer_delete_sync(&data->echo_timer);
>  	/* reset echo pin in any case */
>  	gpiod_set_value(data->echo_pin, 0);
> +	/*
> +	 * Release the pins to their "idle" state, if the board defines one, so
> +	 * they are handed back to whatever function uses them while pps-gpio is
> +	 * not bound. Boards that do not describe an idle pinctrl state are
> +	 * unaffected. The "default" (active) state is applied automatically by
> +	 * the driver core before probe.
> +	 */
> +	pinctrl_pm_select_idle_state(&pdev->dev);
>  	dev_info(&pdev->dev, "removed IRQ %d as PPS source\n", data->irq);
>  }
> =20
> +static void pps_gpio_shutdown(struct platform_device *pdev)
> +{
> +	/*
> +	 * Leave the pins in their "idle" state on shutdown so a subsequent
> +	 * kernel (e.g. after kexec) finds the pin controller in a known state.
> +	 */
> +	pinctrl_pm_select_idle_state(&pdev->dev);

[Severity: High]
Does this code risk causing an interrupt storm during shutdown or kexec?

When pps_gpio_shutdown() alters the physical pin state to "idle" while syst=
em
interrupts are still enabled, it could leave the edge-triggered PPS input p=
in
floating (e.g. if the "idle" state removes pull resistors). Because the IRQ=
 is
never explicitly disabled here and the echo timer is left running, electric=
al
noise might generate rapid spurious edges.

Since the IRQ handler always returns IRQ_HANDLED, the kernel IRQ core won't
detect and shut down a spurious storm. Could the CPU get stuck in an infini=
te
interrupt loop, preventing shutdown or kexec from completing? Should the IRQ
and timer be torn down here as they are in pps_gpio_remove()?

> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916134744.4635=
4-1-farbere@amazon.com?part=3D2
