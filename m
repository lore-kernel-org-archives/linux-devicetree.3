Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579613;
	b=v0A5Og5JIAB0wYAX56+Qaw50t0x7nfDXz18RWMoO9HZUmbNp3gNaEfvu1l7PPO3rH9Aa
	 p0l0RCsDr4WHQonXfcUuU3bHTljOEmV02lqKDeBSL5LTOYMl4o/x0KpRnJ4kI7v8CaoNn
	 oGGlk9wwb47yK2KeyYOu+4M0ylzazwgnbAZbNUEpCOkHp/lTcIY3+foiyi9W4PJge4pcP
	 KuwyHHzIi6Qtae0sHSGOhHusLs6zUch+A2LXz7lr3+Ns1xaVbiLdFbdCjUT52YudXVhte
	 Y8Vhv7FMdUsoEgU8z5bRKWQ3S/jFQH9WfLKLs+iR0ejHlQDOz161NCKbSAerdzLgoEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579613;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Ru45enD5F4grBVaJmpzbkteBW4ojd7Cm5k4u/2rq3xc=;
	b=FIZU5m7h7SM+Ot2+FaJGCzC0MtvEB1vOO0Arl6pHdo+Q0gaL9V9hz3n1iLofTa69Fm0o
	 ZME7O7C87shvELQGjcEdOuG6pwYWu6QSQbBSG1NkLgNr3btNK0E9seIr7qUNDCNxcoxzv
	 8ZDYViq+LVTYeALWJwAMF9DNGvVhTGB6LH4ISmQaE/txWTSSfBNxyikUnn0orOdSX2mKK
	 uXkhQWPSZt73A6Wpq0PX6gdqsAjJeNZmhrS9vYg4BJer085gl6Hm0BcfMOcDBoP2mcq60
	 sLt2aUeZ/4o4xa7/kcHz4/nVrWP/+kw1/jJT+ViPpsqM5OVi1KJwLLaToaPu8NP3RdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n4SBqirB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA02606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n4SBqirB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A05821F000C9;
	Wed, 21 Oct 2026 10:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792579612;
	bh=Ru45enD5F4grBVaJmpzbkteBW4ojd7Cm5k4u/2rq3xc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n4SBqirBiK04aJ/ET7DzlPQxb4pQchZo8T2bmYzIHltXJ5C6mHJE0cYD/5LcLJri9
	 xXdVZwTaGpxKDsi0ToNHm9+3qE9HrtAZqo31+BiRBZhSrtE6p+tKkkNxLk0VKtgivq
	 O23nGT9tHa4tFVmheAN/nDRnF1nGnxtt6utJEvzuA36V4vNjaMRBzgP+RehdPk0A4h
	 42qdDjHqwq6LXCfE9xb+fSaSks2kQIdBM1BYKLdX3cgfGZEurI9qzCnAJgB4JZn+R0
	 SyhAxxnK+EkF9zzKgTnOo41XoH4V+Pxes0W/yeh27uAONkkcizFk2+yRhgPuNdryje
	 zG8CwkiN0iwJw==
Message-ID: <sashiko-outbox-180119@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] regulator: core: Add mechanism to force disable a
 regulator at boot
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Louvel" <paul.louvel@bootlin.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261021-paul-lm51772-v1-3-25f0ffbffa8d@bootlin.com>
References: <20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com>
 <20261021-paul-lm51772-v1-3-25f0ffbffa8d@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 10:46:52 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] regulator: core: missing mutual exclusion for boot_force_off in se=
t_machine_constraints()
- [High] regulator: core: boot_force_off is a no-op for GPIO-controlled reg=
ulators
- [Medium] regulator: core: boot_force_off works around consumer API misuse
- [Low] regulator: missing kernel-doc for boot_force_off in struct regulati=
on_constraints
--

commit 934802b5e041e184ae3df8fc8a423b7e086bf66c
Author: Paul Louvel <paul.louvel@bootlin.com>

regulator: core: Add mechanism to force disable a regulator at boot

This commit adds the regulator-boot-force-off device tree property and the
corresponding boot_force_off constraint flag to disable a regulator in
set_machine_constraints() during registration.

> diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
> index 14422cfe80e2d..b45048ec084a1 100644
> --- a/drivers/regulator/core.c
> +++ b/drivers/regulator/core.c
> @@ -1450,6 +1450,81 @@ static int handle_notify_limits(struct regulator_d=
ev *rdev,
> =20
>  	return ret;
>  }
> +

[ ... ]

> +static int _regulator_do_disable(struct regulator_dev *rdev)
> +{
> +	int ret;
> +
> +	trace_regulator_disable(rdev_get_name(rdev));
> +
> +	if (rdev->ena_pin) {
> +		if (rdev->ena_gpio_state) {
> +			ret =3D regulator_ena_gpio_ctrl(rdev, false);
> +			if (ret < 0)
> +				return ret;
> +			rdev->ena_gpio_state =3D 0;
> +		}
> +
> +	} else if (rdev->desc->ops->disable) {
> +		ret =3D rdev->desc->ops->disable(rdev);
> +		if (ret !=3D 0)
> +			return ret;
> +	}
> +
> +	if (rdev->desc->off_on_delay)
> +		rdev->last_off =3D ktime_get_boottime();
> +
> +	trace_regulator_disable_complete(rdev_get_name(rdev));
> +
> +	return 0;
> +}

[Severity: High]
Does boot_force_off work for regulators that use an enable gpio
(rdev->ena_pin)?

During regulator_register(), rdev is zero-allocated and
regulator_ena_gpio_request() attaches rdev->ena_pin without setting
rdev->ena_gpio_state. When regulator_register() -> set_machine_constraints()
calls _regulator_do_disable(rdev) for boot_force_off (with always_on and
boot_on unset), rdev->ena_gpio_state is still 0.

In _regulator_do_disable(), when rdev->ena_pin is present and
rdev->ena_gpio_state is 0, the code skips regulator_ena_gpio_ctrl(rdev, fal=
se)
and also skips the else-if branch for rdev->desc->ops->disable(rdev).

Won't this leave gpio-controlled regulators enabled in hardware at boot?

> +
>  /**
>   * set_machine_constraints - sets regulator constraints
>   * @rdev: regulator source
> @@ -1701,6 +1776,12 @@ static int set_machine_constraints(struct regulato=
r_dev *rdev,
>  		rdev->last_off =3D ktime_get();
>  	}
> =20
> +	if (rdev->constraints->boot_force_off) {
> +		ret =3D _regulator_do_disable(rdev);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
>  	if (!rdev->constraints->pw_budget_mW)
>  		rdev->constraints->pw_budget_mW =3D INT_MAX;
> =20

[Severity: High]
What happens in set_machine_constraints() if boot_force_off is set together
with always_on or boot_on?

Neither of_get_regulation_constraints() nor set_machine_constraints() preve=
nts
boot_force_off from being active at the same time as always_on or boot_on
(including when set_machine_constraints() implicitly sets
rdev->constraints->always_on =3D true when !rdev->ena_pin && !ops->enable).

Right before this boot_force_off check, set_machine_constraints() handles
always_on and boot_on:

drivers/regulator/core.c:set_machine_constraints() {
	if (rdev->constraints->always_on || rdev->constraints->boot_on) {
		...
		if (rdev->supply &&
		    (rdev->constraints->always_on ||
		     !regulator_is_enabled(rdev->supply))) {
			ret =3D (is_locked
			       ? _regulator_enable(rdev->supply)
			       : regulator_enable(rdev->supply));
			...
			supply_enabled =3D true;
		}

		ret =3D _regulator_do_enable(rdev);
		...
		if (rdev->constraints->always_on)
			rdev->use_count++;
	}
}

Because boot_force_off is checked in a separate conditional afterwards,
set_machine_constraints() will enable rdev->supply and rdev, and then
immediately call _regulator_do_disable(rdev).

If _regulator_do_disable(rdev) fails after rdev->supply was enabled,
set_machine_constraints() returns the error without disabling rdev->supply,
and regulator_register() jumps to the wash cleanup path:

drivers/regulator/core.c:regulator_register() {
wash:
	regulator_put(rdev->supply);
}

which triggers the warning in _regulator_put() and leaks the supply enable
count:

drivers/regulator/core.c:_regulator_put() {
	/* Docs say you must disable before calling regulator_put() */
	WARN_ON(regulator->enable_count);
}

And if _regulator_do_disable(rdev) succeeds when always_on or boot_on is se=
t,
the hardware output is disabled while rdev->use_count remains 1 (for
always_on, preventing subsequent regulator_enable() calls from re-enabling =
the
hardware) and rdev->supply remains enabled with an unbalanced enable_count.

Should boot_force_off be mutually exclusive with always_on and boot_on?

[ ... ]

> diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regu=
lator.c
> index 09e26febfc834..337629be58ca7 100644
> --- a/drivers/regulator/of_regulator.c
> +++ b/drivers/regulator/of_regulator.c
> @@ -132,6 +132,7 @@ static int of_get_regulation_constraints(struct devic=
e *dev,
>  	constraints->always_on =3D of_property_read_bool(np, "regulator-always-=
on");
>  	if (!constraints->always_on) /* status change should be possible. */
>  		constraints->valid_ops_mask |=3D REGULATOR_CHANGE_STATUS;
> +	constraints->boot_force_off =3D of_property_read_bool(np, "regulator-bo=
ot-force-off");
> =20
>  	constraints->pull_down =3D of_property_read_bool(np, "regulator-pull-do=
wn");
>  	constraints->system_critical =3D of_property_read_bool(np,

[Severity: Medium]
Is a new device tree property the right way to handle consumers that want to
disable a boot-enabled regulator during probe?

In the regulator framework, regulator_enable() and regulator_disable() calls
on a standard consumer handle must be balanced because regulator_get()
initializes regulator->enable_count to 0 regardless of hardware state.

For consumers that have exclusive control of a supply and need to turn off a
regulator that was left enabled at boot without a prior regulator_enable(),
regulator_get_exclusive() already syncs use_count and enable_count with the
hardware state in _regulator_get_common():

drivers/regulator/core.c:_regulator_get_common() {
	if (get_type =3D=3D EXCLUSIVE_GET) {
		rdev->exclusive =3D 1;

		ret =3D _regulator_is_enabled(rdev);
		if (ret > 0) {
			rdev->use_count =3D 1;
			regulator->enable_count =3D 1;
}

Could the affected consumer driver use regulator_get_exclusive() (or
devm_regulator_get_exclusive()) instead of adding regulator-boot-force-off =
to
device tree?

> diff --git a/include/linux/regulator/machine.h b/include/linux/regulator/=
machine.h
> index 1fc440c5c4c7e..35ab9de96e5c7 100644
> --- a/include/linux/regulator/machine.h
> +++ b/include/linux/regulator/machine.h
> @@ -227,7 +227,8 @@ struct regulation_constraints {
>  	unsigned int active_discharge;
> =20
>  	/* constraint flags */
> -	unsigned always_on:1;	/* regulator never off when system is on */
> +	unsigned always_on:1;		/* regulator never off when system is on */
> +	unsigned boot_force_off:1;	/* force regulator off at boot */
>  	unsigned boot_on:1;	/* bootloader/firmware enabled regulator */
>  	unsigned apply_uV:1;	/* apply uV constraint if min =3D=3D max */
>  	unsigned ramp_disable:1; /* disable ramp delay */

[Severity: Low]
Struct regulation_constraints in include/linux/regulator/machine.h has a
kernel-doc comment block above the definition describing its fields. Should=
 an
@boot_force_off entry be added there as well to avoid a kernel-doc warning?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-paul-lm517=
72-v1-0-25f0ffbffa8d@bootlin.com?part=3D3
