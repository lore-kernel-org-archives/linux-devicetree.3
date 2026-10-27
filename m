Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793094660;
	b=n/U2pNkoAxD+XjvZ4YJ9patPXqQhqNVow/bMvE+ll7R3Z/h6P+CNlQClN9Qy8JSXHFes
	 HCBEiHYtTo9ZdlyffMGpOtf8atU8pZPqSpCh9h/7d1RNSWEhE5afv0bY4NQ8Gz5NHzULd
	 T6MiL35rqhx/mwuW1PbSc/dw0dXLpd+Iwx8+SOuiLoZo7OBtNnEDX2GMJPkl7nT69DTOM
	 Sj69NAaHjdzDDgyA9hDl1jaJs6GiApawLSVzSkSvvF+7OK5uLHtnkFokhmv6aL5Od8lFK
	 MMqZp5SStid84sHjqGA9jn8d7P3IU4bZ2LEDhb895C71h1/YuesTZsmyBaabIxdltvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094660;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=e8rvLK3sxNhdD6k4hguDcAfYpVGJN2notwti8R6gn/Y=;
	b=xiJiFKSpA4Yf4CSQtnRAaXsVyu+3SOhZsJyOtbsqIGCauBfEgdomgnIOM150ZN5q8rwq
	 FmTtwlMA9jc0OC1TkrqlBxCviWLDPLjT34iJFGEaUs6MxMQNzvfILd1hXUPkXS1TZH5SI
	 2QEA9uRGtjRRrd6Xw/dV0fUFoTlCvKiUEg0shaRU02+mHPCjBjiEiiyCJlz4CoI9EoCoJ
	 4txscwblT4Qhu9tDXuBMcxXjQ6jIbcoPlnc2dMygK1vb1MyFrhDUgiJZwpFsdrdnYI/GZ
	 03lfxv3iaP5vocU4omO/FdoA+YBlg2A/ZvAENd+ZzWtVU7o5wpCWQsKY7Figb/w8emA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oR4mxT1n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88110606A31A
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 09:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oR4mxT1n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE531F01825;
	Tue, 27 Oct 2026 09:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793094660;
	bh=e8rvLK3sxNhdD6k4hguDcAfYpVGJN2notwti8R6gn/Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oR4mxT1nx580n4iu8v9oyqSRTS0ymUcTYMD4HQWeN3Mhu8W2OxhYG0oHa/wT+8QAp
	 plvmGwHe+H4P4QoQapsgS9muPClFZAiAXR886lQglb+f+Xg9nkgNCSjQ1ruwhfjXlt
	 WhVomV+mH0hotIbsLfPSK6fmk451Zy/MXTgjAPgTmgewJVM9hFYgCTNyISytIo4uIz
	 BGl3PYYCiQE5svQ3L2lkdhOMkRDjAZzq+m+pcvIyT/G0ufQSYNWRgELqppYLVA3pjx
	 dpri69giyYqJQLdK83gTCo9vA0weugYbqhrxp2ITl73+LhRR8Tuxni5BYM3Da2/EGV
	 66A0+TAXsUNBg==
Message-ID: <sashiko-outbox-186338@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] regulator: core: Call
 set_over_voltage_protection() if OVP limit is fixed after setting new
 voltage
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Louvel" <paul.louvel@bootlin.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261027-paul-lm51772-v2-3-b2a767e34722@bootlin.com>
References: <20261027-paul-lm51772-v2-0-b2a767e34722@bootlin.com>
 <20261027-paul-lm51772-v2-3-b2a767e34722@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 09:50:59 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] regulator: core: late fixed_ovp update in _regulator_do_set_voltag=
e()
- [Medium] regulator: core: state desync when set_over_voltage_protection()=
 fails
--

commit 842d424c282842b568e77b33fac660e8e08d0998
Author: Paul Louvel <paul.louvel@bootlin.com>

regulator: core: Call set_over_voltage_protection() if OVP limit is fixed a=
fter setting new voltage

This commit introduces a fixed_ovp flag in struct regulator_desc for
regulators whose over-voltage protection threshold is programmed as an
absolute value rather than an offset. When the output voltage changes in
_regulator_do_set_voltage(), it calls set_over_voltage_protection() via
handle_notify_limits() after the slew-rate delay.

> diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
> index 14422cfe80e2d..b1cabe50ac256 100644
> --- a/drivers/regulator/core.c
> +++ b/drivers/regulator/core.c
> @@ -4014,6 +4014,16 @@ static int _regulator_do_set_voltage(struct regula=
tor_dev *rdev,
>  				     (void *)data);
>  	}
> =20
> +	if (old_uV !=3D best_val) {
> +		if (rdev->desc->fixed_ovp && ops->set_over_voltage_protection) {
> +			ret =3D handle_notify_limits(
> +				rdev, ops->set_over_voltage_protection,
> +				&rdev->constraints->over_voltage_limits);
> +			if (ret =3D=3D -EOPNOTSUPP)
> +				ret =3D 0;
> +		}
> +	}

[Severity: High]
When increasing the output voltage (best_val > old_uV) above the previous
over-voltage protection threshold, won't reprogramming the OVP limit after
the voltage write and slew-rate delay trigger a spurious hardware OVP fault?

In _regulator_do_set_voltage(), the new target voltage best_val is written =
to
hardware first (via _regulator_call_set_voltage(),
_regulator_set_voltage_sel_step(), or _regulator_call_set_voltage_sel()), a=
nd
then fsleep(delay) waits for the output voltage to slew to best_val before
handle_notify_limits() is reached:

drivers/regulator/core.c:_regulator_do_set_voltage() {
	...
	/* Insert any necessary delays */
	fsleep(delay);

	if (best_val >=3D 0) {
		unsigned long data =3D best_val;

		_notifier_call_chain(rdev, REGULATOR_EVENT_VOLTAGE_CHANGE,
				     (void *)data);
	}

	if (old_uV !=3D best_val) {
		if (rdev->desc->fixed_ovp && ops->set_over_voltage_protection) {
			ret =3D handle_notify_limits(
				rdev, ops->set_over_voltage_protection,
				&rdev->constraints->over_voltage_limits);
	...
}

Waiting until after the slew-rate delay is necessary when decreasing the
voltage (best_val < old_uV) so the threshold is not lowered before the outp=
ut
has slewed down. However, when raising the voltage (best_val > old_uV) to a
level above the old threshold (old_uV + lim_uV), the old lower OVP threshold
remains active in hardware while the physical output slews upward during
fsleep(delay), causing the rising output voltage to cross the old OVP limit
before ops->set_over_voltage_protection() is called.

Should _regulator_do_set_voltage() update the OVP threshold before raising
the hardware voltage when best_val > old_uV, and after fsleep(delay) when
best_val < old_uV? Note that because ops->set_over_voltage_protection() only
receives the offset lim_uV and drivers may read back the current hardware
voltage via regulator_get_voltage_rdev(), reprogramming OVP prior to raising
the voltage may also require passing or exposing the target best_val.

[Severity: Medium]
What happens to the regulator state if handle_notify_limits() returns an
error other than -EOPNOTSUPP here?

At this point in _regulator_do_set_voltage(), the hardware voltage has
already been changed to best_val and REGULATOR_EVENT_VOLTAGE_CHANGE has
already been emitted. Overwriting ret with a negative error from
handle_notify_limits() causes regulator_set_voltage_unlocked() ->
regulator_balance_voltage() -> regulator_do_balance_voltage() ->
regulator_set_voltage_rdev() -> _regulator_do_set_voltage() to fail without
reverting the hardware voltage.

In regulator_set_voltage_unlocked(), a negative return rolls back the
consumer's requested voltage range to old_min_uV and old_max_uV even though
the hardware remains at best_val:

drivers/regulator/core.c:regulator_set_voltage_unlocked() {
	...
	/* for not coupled regulators this will just set the voltage */
	ret =3D regulator_balance_voltage(rdev, state);
	if (ret < 0) {
		voltage->min_uV =3D old_min_uV;
		voltage->max_uV =3D old_max_uV;
	}
	...
}

Because voltage->min_uV and voltage->max_uV are reset to old_min_uV and
old_max_uV, a subsequent regulator_set_voltage() call attempting to restore
old_min_uV and old_max_uV will hit the early no-op check:

	if (voltage->min_uV =3D=3D min_uV && voltage->max_uV =3D=3D max_uV)
		goto out;

Additionally, in regulator_set_voltage_rdev(), a negative return from
_regulator_do_set_voltage() jumps to out before lowering the parent supply
voltage when supply_change_uV < 0:

drivers/regulator/core.c:regulator_set_voltage_rdev() {
	...
	if (state =3D=3D PM_SUSPEND_ON)
		ret =3D _regulator_do_set_voltage(rdev, min_uV, max_uV);
	else
		ret =3D _regulator_do_set_suspend_voltage(rdev, min_uV,
							max_uV, state);
	if (ret < 0)
		goto out;

	if (supply_change_uV < 0) {
		ret =3D regulator_set_voltage_unlocked(rdev->supply,
				best_supply_uV, INT_MAX, state);
	...
}

Could this leave the software state and parent supply out of sync with the
actual hardware voltage if ops->set_over_voltage_protection() fails (for
example, due to an out-of-range OVP calculation or a register write error)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-paul-lm517=
72-v2-0-b2a767e34722@bootlin.com?part=3D3
