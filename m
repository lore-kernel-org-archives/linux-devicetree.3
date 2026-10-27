Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105901;
	b=y/ewMz/O2HiMQr27rMtjMkzHeVpfNwCMj8Wv33vnNN1TtKzjwwsXB3Rc2NLiTfhFT1XM
	 8nSD2Ad5wUjH+/6BrmGwpLw/a35cJmNWuMRYzgCmpv+72Rz60c89wH3XtjIjawYggYk9z
	 Xoio4FK76STiuHaw3SROJkOtTovzQFhHjThk1naVt9W3xF+28sJJs4cmfdh5j7QVBJksg
	 kgXcBK8drxJhj4njVeqLubyEYgIgsbLr7fzqEvmKtLLkUghwXZrl5Yl+G89GBvJ9V6KAg
	 OPyPkVjg+f8O8CTNylZhQ7N0DbH6bi3arO847JsiyztQAsBXUHTsJKRaV8ZrsyVlulA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105901;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CDcWauauVFdyYyRf1FQoD1T3NLtmNQfmJmK7bqntZ+M=;
	b=BmacydrEUIyUEKGQmP/1P8OdFHbIjaVgCxZln791Br5yKOKJzNzs7vTarO9okuMpM/RC
	 P13N9sQKcEJOHQg05ciUrT96Qw4GOnu0USktskWZJLd5UeXJDXv8XewOrB6O2WO8g4SF8
	 a3bvLW6/SaRAEPWC1AtW6ZmD5/wXVkKLW3JfbwIOi1+HCOawUdUsp2azvfx2UcXu1FnWC
	 oFj0teE0pAzNjWgKVJz2uu79grPbDq3epalh9FgEPcnxWs4etinaKzVLWvI0iJI36zs4W
	 609TSaQsJ8WAyryjMcSf6C0FkzisiDAwqwr0UDgTeI/45b2TM/c+nYVEiMCpF7nKJSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="T7gNIin/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2771606A323
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T7gNIin/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 342341F01829;
	Tue, 27 Oct 2026 12:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793105900;
	bh=CDcWauauVFdyYyRf1FQoD1T3NLtmNQfmJmK7bqntZ+M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T7gNIin/jIMFXJMyilelDcaw6pRn/8Blu/EI9Z+UoYL3m4KFGiA/KXCLzLPwCAJOj
	 EsTnTNCyQaPEPyeYAxoezbLcZ/Z5X+SNlpzrdLYqMfHPced52RCBbAwW7nHiuBTNh8
	 aCHXz21QfTcXE7Hr8oZAVlRjTkI49Uz+4GjorzUBLoEVjAeA2LFL/ZOfg3k4crF1/9
	 S80HdsNE32BJ1H63ITAAjiYFTIhKzXwzIG+OyKurVrubpqF8cGQ+6kh4GU+B/VIyck
	 uOk86zSWSZLLZIA7VECPb5HThbJxAktReTrIg+aIGxoLSNOILblzFO7qn0eKFdpcFj
	 /dUpaaaj85e8Q==
Message-ID: <sashiko-outbox-186593@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/4] regulator: qcom-rpmh: Add debounce delay before
 disabling regulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261027-regulator-off-on-delay-v5-4-f9c3b128c6d0@oss.qualcomm.com>
References: <20261027-regulator-off-on-delay-v5-0-f9c3b128c6d0@oss.qualcomm.com>
 <20261027-regulator-off-on-delay-v5-4-f9c3b128c6d0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 12:58:19 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] regulator: qcom-rpmh: race between teardown and rpmh_regulator_ena=
ble()
- [Medium] regulator: qcom-rpmh: vreg->enabled left false when rpmh_delayed=
_off_work() fails
- [Medium] regulator: qcom-rpmh: premature parent supply disable during deb=
ounce_delay
--

commit 5538c8b7a418742a3928d43327d4d04c4bf72849
Author: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

regulator: qcom-rpmh: Add debounce delay before disabling regulator

This commit adds support for the qcom,regulator-off-debounce-delay-us prope=
rty
to defer RPMh regulator disable requests via a cancelable delayed work item=
. It
also tracks off_on_delay locally when debounce_delay is configured so the m=
inimum
off time is measured from when the disable request reaches RPMh.

> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/=
qcom-rpmh-regulator.c
> index 25c14de3cd8b5..28060bcfe48f4 100644
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c

[ ... ]

> @@ -313,19 +354,76 @@ static int rpmh_regulator_set_enable_state(struct r=
egulator_dev *rdev,
> =20
>  	ret =3D rpmh_regulator_send_request(vreg, &cmd, enable);
>  	if (!ret)
> -		vreg->enabled =3D enable;
> +		WRITE_ONCE(vreg->enabled, enable);
> =20
>  	return ret;
>  }
> =20
> +static void rpmh_delayed_off_work(struct work_struct *work)
> +{
> +	struct rpmh_vreg *vreg =3D container_of(work,
> +					struct rpmh_vreg, delayed_off_work.work);
> +
> +	/*
> +	 * No locking needed. cancel_delayed_work_sync() already guarantees
> +	 * this work has either not started or has fully finished by the
> +	 * time enable()/teardown proceed to touch shared state.
> +	 */
> +	if (!_rpmh_regulator_set_enable_state(vreg, READ_ONCE(vreg->rdev), fals=
e))
> +		vreg->last_off =3D ktime_get_boottime();
> +}

[Severity: Medium]
What happens to vreg->enabled if _rpmh_regulator_set_enable_state() fails in
rpmh_delayed_off_work()?

When rpmh_regulator_disable() queues vreg->delayed_off_work, it sets
vreg->enabled to false before the RPMh request is sent. When
rpmh_delayed_off_work() later runs:

rpmh_delayed_off_work()
  _rpmh_regulator_set_enable_state(vreg, READ_ONCE(vreg->rdev), false)
    rpmh_regulator_send_request(vreg, &cmd, false)

If rpmh_write_async() fails with -ENOMEM or rpmh_write() fails with
-ETIMEDOUT (when vreg->always_wait_for_ack is set), vreg->last_off is not
updated, but vreg->enabled remains false even though the hardware rail is
still enabled and vreg->delayed_off_work is no longer pending.

Could this leave vreg->enabled out of sync with the hardware state, causing
rpmh_regulator_is_enabled() to report false for an enabled rail and causing
regulator_late_cleanup() or subsequent voltage changes to treat the active
rail as disabled?

> +
>  static int rpmh_regulator_enable(struct regulator_dev *rdev)
>  {
> -	return rpmh_regulator_set_enable_state(rdev, true);
> +	struct rpmh_vreg *vreg =3D rdev_get_drvdata(rdev);
> +	s64 remaining;
> +
> +	/* See struct rpmh_vreg's @lock for why no lock is needed here. */
> +	if (cancel_delayed_work_sync(&vreg->delayed_off_work)) {
> +		/* Queued disable never reached RPMh, so undo disable()'s flip. */
> +		WRITE_ONCE(vreg->enabled, true);
> +		return 0;
> +	}
> +
> +	if (vreg->off_on_delay) {
> +		remaining =3D ktime_us_delta(ktime_add_us(vreg->last_off,
> +							vreg->off_on_delay),
> +							ktime_get_boottime());
> +		if (remaining > 0)
> +			fsleep(remaining);
> +	}
> +
> +	return _rpmh_regulator_set_enable_state(vreg, rdev, true);
>  }
> =20
>  static int rpmh_regulator_disable(struct regulator_dev *rdev)
>  {
> -	return rpmh_regulator_set_enable_state(rdev, false);
> +	struct rpmh_vreg *vreg =3D rdev_get_drvdata(rdev);
> +
> +	guard(mutex)(&vreg->lock);
> +
> +	/*
> +	 * vreg->rdev is also read by delayed_off_work without this lock
> +	 * held, so READ_ONCE()/WRITE_ONCE() are used instead of locking
> +	 * there too.
> +	 */
> +	WRITE_ONCE(vreg->rdev, rdev);
> +
> +	if (vreg->debounce_delay) {
> +		/*
> +		 * Flip the logical state now so is_enabled() does not keep
> +		 * reporting "enabled" while the real RPMh disable is still
> +		 * queued. Without this, a quick re-enable would see the stale
> +		 * state and skip calling back into enable(), letting this
> +		 * queued disable run regardless.
> +		 */
> +		WRITE_ONCE(vreg->enabled, false);
> +		queue_delayed_work(system_percpu_wq, &vreg->delayed_off_work,
> +				   usecs_to_jiffies(vreg->debounce_delay));
> +		return 0;
> +	}
> +
> +	return _rpmh_regulator_set_enable_state(vreg, rdev, false);
>  }

[Severity: Medium]
Can returning 0 immediately from rpmh_regulator_disable() while the child
regulator is still enabled in RPMh cause a parent supply rail to be disabled
prematurely?

In rpmh_regulator_init_vreg(), vreg->rdesc.supply_name is populated from
rpmh_data->supply_name (such as a parent SMPS or BOB rail supplying an LDO).
When the last consumer disables the child regulator, _regulator_disable() in
drivers/regulator/core.c runs:

_regulator_disable()
  _regulator_do_disable(rdev)
    rpmh_regulator_disable(rdev) -> queues delayed_off_work and returns 0
  _regulator_handle_consumer_disable(rdev)
  if (ret =3D=3D 0 && rdev->use_count =3D=3D 0 && rdev->supply)
    _regulator_disable(rdev->supply);

Because rpmh_regulator_disable() returns 0 before vreg->delayed_off_work ru=
ns,
the regulator core immediately drops consumer load and disables rdev->supply
while the child regulator remains enabled in hardware for vreg->debounce_de=
lay
microseconds. If a consumer quickly re-enables the child regulator within
vreg->debounce_delay, rdev->supply has already been power-cycled.

> @@ -481,6 +579,36 @@ static const struct regulator_ops rpmh_regulator_xob=
_ops =3D {
>  	.is_enabled		=3D rpmh_regulator_is_enabled,
>  };
> =20
> +static void rpmh_regulator_cancel_delayed_off_work(void *data)
> +{
> +	struct rpmh_vreg *vreg =3D data;
> +	bool pending;
> +
> +	/*
> +	 * Mark the feature torn down so a disable() racing with this
> +	 * teardown cannot queue delayed_off_work after the queue has
> +	 * already been cleared.
> +	 */
> +	scoped_guard(mutex, &vreg->lock)
> +		vreg->debounce_delay =3D 0;
> +
> +	/*
> +	 * Lock is not held across this cancel_delayed_work_sync(): a running
> +	 * instance may be waiting on an RPMh ACK, and the lock would needlessly
> +	 * block disable() for that duration.
> +	 */
> +	pending =3D cancel_delayed_work_sync(&vreg->delayed_off_work);
> +
> +	/*
> +	 * If a disable() was queued, run it to ensure regulator hardware
> +	 * state is synced correctly with software state.
> +	 */
> +	scoped_guard(mutex, &vreg->lock) {
> +		if (pending)
> +			_rpmh_regulator_set_enable_state(vreg, vreg->rdev, false);
> +	}
> +}

[Severity: High]
Can rpmh_regulator_cancel_delayed_off_work() race with rpmh_regulator_enabl=
e()
and disable a regulator that a consumer just enabled?

In rpmh_regulator_init_vreg(), devm_add_action_or_reset() registers
rpmh_regulator_cancel_delayed_off_work() after devm_regulator_register():

	rdev =3D devm_regulator_register(dev, &vreg->rdesc, &reg_config);
	if (IS_ERR(rdev)) {
		...
	}

	if (vreg->debounce_delay) {
		ret =3D devm_add_action_or_reset(dev, rpmh_regulator_cancel_delayed_off_w=
ork,
					       vreg);

Because devm actions run in reverse registration order during teardown (or =
if
a later regulator node fails in rpmh_regulator_probe()),
rpmh_regulator_cancel_delayed_off_work() runs before regulator_unregister()
while rdev is still registered and accessible to consumers.

If a prior rpmh_regulator_disable() queued vreg->delayed_off_work, the
following interleaving can occur:

CPU0 (teardown)                         CPU1 (regulator_enable)
rpmh_regulator_cancel_delayed_off_work()
  vreg->debounce_delay =3D 0;
  pending =3D cancel_delayed_work_sync()
  (returns true)
                                        rpmh_regulator_enable()
                                          cancel_delayed_work_sync()
                                          (returns false, already cancelled)
                                          _rpmh_regulator_set_enable_state(=
..., true)
                                            vreg->enabled =3D true;
  scoped_guard(mutex, &vreg->lock)
    if (pending)
      _rpmh_regulator_set_enable_state(..., false)
        vreg->enabled =3D false;

Because rpmh_regulator_enable() does not acquire vreg->lock and
rpmh_regulator_cancel_delayed_off_work() does not hold rdev->mutex, CPU0's
delayed disable overwrites CPU1's enable in both RPMh and vreg->enabled.

Also, when _rpmh_regulator_set_enable_state(vreg, ..., false) runs from
rpmh_regulator_cancel_delayed_off_work() (or from rpmh_regulator_disable()
after vreg->debounce_delay is cleared to 0), vreg->last_off is not updated
even though init_data->constraints.off_on_delay was cleared to 0 in
rpmh_regulator_init_vreg(), so a subsequent rpmh_regulator_enable() would n=
ot
enforce vreg->off_on_delay.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-regulator-=
off-on-delay-v5-0-f9c3b128c6d0@oss.qualcomm.com?part=3D4
