Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6C2418A33
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790065137; cv=none; b=TFJ7dCaGaQ3NrNCjnkNqEmdPePx+Be0nA6FUxhGHUjc/tTviZf92aadQoLb6S21Q/Cd60ZD/Crz83+84a2ru1ocdQNn8FrNkrA6/q1BeaH87CGYRjOKrjdckYZNtq9IO9k+5Pp6ZrZeUKyOBv+OPBv0TSKxQCf4SXth34A33SC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790065137; c=relaxed/simple;
	bh=Tc+C7PBiMFJE0JrOaQMc4+04l3/PGYbm82C4FFBWOJs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lg9atfTeq24hl84z9guttvYjN+YGVfD5v5245719zjMjbBBqQYT/lHjAb7XbLkv5v5kJs5KUoRxyz/cdFXonXhN7rNf2CQqlUDQwPrrlE7B949S/uqg7nIL5exu+a+7bSAQqZIc2w1rdBlFAEM75OLsnCUslnPoripuJ+jIaoQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cmj7zQsX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cmj7zQsX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 160451F00893;
	Tue, 22 Sep 2026 08:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790065135;
	bh=Y1W0U92UWNdRkG+wBeVzD/WNoi385AALfQxh/VL7pIs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cmj7zQsXIJj9TSlVcsmOgKNjOexQ4koqX9RwYS3+1Vjonar6+OGDg8ORSrOh9o7WG
	 eIq8n3Mrqz7dFq7bYYodMu7GWnNetkNSgcoH61zmMrAJ1BquDDLVEz1M1qIjIwRdjt
	 TT082wMJQ92zOxEAwsPyzBCay7OTGe9qzDBbgnKAIME7ujmPz/4rwLaVaCYSYFUcjG
	 4HMGOQl/Ntnr63uE930RSHL1WFXtgV7HOJon6s1ragMRGZLz3fm63OffuVt2UYVlxe
	 cY3CjZejbcxaR11wJpQXZZLM+iB7esiURLLt+eh6NDLfE3+aeG4IwORgfiT5b28o1J
	 A1Lyyy14U3WHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/11] accel/rocket: add devfreq support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Paunovic" <royalnet026@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260922080114.44662-10-royalnet026@gmail.com>
References: <20260922080114.44662-1-royalnet026@gmail.com>
 <20260922080114.44662-10-royalnet026@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 08:18:54 +0000
Message-Id: <20260922081855.160451F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] pm: power leak due to async pm_runtime_put_autosuspend() cancelled=
 by pm_runtime_disable() in teardown
- [High] pm: SError crash on resume due to ignored return value of dev_pm_o=
pp_set_rate()
- [High] pm: SError on power-on due to unsafe rounding up of the boot rate
- [High] race: UAF / NULL pointer dereference in rocket_npu_restore_boot_ra=
te() racing with shutdown
- [High] race: double-free of devfreq and OPP table due to concurrent sysfs=
 unbinds
--

commit e0300730a57da6df01c259dea64c48000cbfedae
Author: Igor Paunovic <royalnet026@gmail.com>

accel/rocket: add devfreq support

This commit introduces devfreq support to scale the NPU clock rate based on
core utilization. It uses a single devfreq device for all cores and runtime
resumes all cores when raising the clock rate to prevent hardware SError.

> diff --git a/drivers/accel/rocket/rocket_devfreq.c b/drivers/accel/rocket=
/rocket_devfreq.c
> new file mode 100644
> index 0000000000000..871fa370eb432
> --- /dev/null
> +++ b/drivers/accel/rocket/rocket_devfreq.c
[ ... ]
> +void rocket_devfreq_suspend(struct rocket_device *rdev)
> +{
> +	struct rocket_devfreq *rdevfreq =3D &rdev->devfreq;
> +
> +	if (!rdevfreq->devfreq)
> +		return;
> +
> +	guard(mutex)(&rdevfreq->lock);
> +
> +	if (!rdevfreq->cores_held)
> +		return;
> +
> +	rocket_devfreq_set_rate(rdev, rdevfreq->boot_freq);
> +	rdevfreq->cores_held =3D false;
> +	rocket_devfreq_release_all(rdev);
> +}

[Severity: High]
What happens if rocket_devfreq_set_rate() fails here? The return value is
ignored, and cores_held is cleared unconditionally. If the rate wasn't
lowered successfully but we drop references and allow the core to suspend,
will this cause an asynchronous SError when the core later powers on with a
raised clock?

[ ... ]
> +	freq =3D rdev->npu_boot_rate;
> +	opp =3D devfreq_recommended_opp(dev, &freq, 0);
> +	if (IS_ERR(opp)) {
> +		ret =3D dev_err_probe(dev, PTR_ERR(opp),
> +				    "no OPP covers the %lu Hz boot rate\n",
> +				    rdev->npu_boot_rate);
> +		goto err_remove_table;
> +	}
> +
> +	/*
> +	 * From here on the boot rate is the OPP it maps to. The raw rate is
> +	 * the firmware's number and need not be in the table at all.
> +	 */
> +	rdevfreq->boot_freq =3D freq;
> +
> +	/*
> +	 * Program the supply for the rate the NPU is already running, so that
> +	 * the regulator is not switched off underneath it by
> +	 * regulator_late_cleanup(). That OPP is the boot rate rounded up to
> +	 * the table, so this may raise the clock, and a raised clock is only
> +	 * ever programmed with every core held: the same rule as ->target().
> +	 */
> +	ret =3D rocket_devfreq_hold_all(rdev);
> +	if (ret) {
> +		dev_pm_opp_put(opp);
> +		dev_err_probe(dev, ret,
> +			      "cannot resume the NPU cores to set the initial OPP\n");
> +		goto err_remove_table;
> +	}
> +	ret =3D dev_pm_opp_set_opp(dev, opp);
> +	rocket_devfreq_release_all(rdev);

[Severity: High]
Is it safe to round up npu_boot_rate to the nearest OPP and then allow the
device to suspend? The commit message mentions that an island powered up
while the clock is above the rate the bootloader left will take an SError.
If devfreq_recommended_opp() rounds the frequency up, and we set it and
drop references via rocket_devfreq_release_all(), won't the next power-on
trigger the SError because the clock is now higher than the safe
bootloader rate?

[ ... ]
> +void rocket_devfreq_fini(struct rocket_device *rdev)
> +{
> +	struct rocket_devfreq *rdevfreq =3D &rdev->devfreq;
> +	struct device *dev;
> +
> +	if (!rdevfreq->devfreq)
> +		return;
> +
> +	dev =3D rdevfreq->owner->dev;
> +
> +	devfreq_remove_device(rdevfreq->devfreq);
> +	rdevfreq->devfreq =3D NULL;
> +
> +	/*
> +	 * Lower the clock before letting go of the cores, not after: a core
> +	 * that suspends while the clock is still raised would be unable to
> +	 * come back.
> +	 */
> +	scoped_guard(mutex, &rdevfreq->lock) {
> +		if (rdevfreq->cores_held) {
> +			rocket_devfreq_set_rate(rdev, rdevfreq->boot_freq);
> +			rdevfreq->cores_held =3D false;
> +			rocket_devfreq_release_all(rdev);
> +		}
> +	}

[Severity: High]
Could concurrent sysfs unbinds cause a double-free here? Since
rocket_remove() in rocket_drv.c calls rocket_devfreq_fini() without a
driver-wide lock, multiple unbinds could pass the if (!rdevfreq->devfreq)
check simultaneously and try to free rdevfreq->devfreq and destroy the
mutex twice.

Also, similar to rocket_devfreq_suspend(), if rocket_devfreq_set_rate()
fails, won't unconditionally dropping references here lead to an SError on
resume?

> diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/roc=
ket_drv.c
> index 8f03de1af488c..c6eab2239b6a9 100644
> --- a/drivers/accel/rocket/rocket_drv.c
> +++ b/drivers/accel/rocket/rocket_drv.c
[ ... ]
> @@ -268,6 +283,9 @@ static void rocket_remove(struct platform_device *pde=
v)
>  	if (WARN_ON(core < 0))
>  		return;
> =20
> +	/* The devfreq device drives every core, so it goes before any of them.=
 */
> +	rocket_devfreq_fini(rdev);
> +
>  	rocket_core_fini(&rdev->cores[core]);

[Severity: High]
If rocket_devfreq_fini() uses pm_runtime_put_autosuspend() under the hood
to release PM references via rocket_devfreq_release_all(), does
rocket_core_fini() immediately disable runtime PM? As per the PM subsystem
guide, pm_runtime_disable() cancels any pending asynchronous suspend. Will
this leave the device permanently powered on and cause a power leak?

[ ... ]
> @@ -314,7 +332,18 @@ static void rocket_npu_restore_boot_rate(struct rock=
et_core *core)
>  	if (!rdev->npu_boot_rate)
>  		return;
> =20
> -	err =3D clk_set_rate(core->clks[2].clk, rdev->npu_boot_rate);
> +	/*
> +	 * Go through the OPP core once there is a table, never behind its
> +	 * back: it caches the OPP it last applied and skips a request for that
> +	 * same OPP, so a raw clk_set_rate() here would make the next request
> +	 * for the raised rate a silent no-op, with sysfs reporting a rate the
> +	 * hardware was not running.
> +	 */
> +	if (rdev->devfreq.owner)
> +		err =3D rocket_devfreq_set_boot_rate(rdev);
> +	else
> +		err =3D clk_set_rate(core->clks[2].clk, rdev->npu_boot_rate);
> +

[Severity: High]
Is there a race condition between rocket_npu_restore_boot_rate() and
rocket_shutdown()? If a job finishes and the PM workqueue calls
rocket_device_runtime_suspend() concurrently with system shutdown:

CPU1 in rocket_shutdown():
rocket_devfreq_fini(rdev); (sets rdevfreq->owner =3D NULL and frees OPP tab=
le)

CPU2 in rocket_npu_restore_boot_rate() sees rdev->devfreq.owner as valid
just before it is set to NULL, and calls rocket_devfreq_set_boot_rate(rdev)
which does:

dev_pm_opp_set_rate(rdevfreq->owner->dev, rdevfreq->boot_freq);

Could this result in a NULL pointer dereference or use-after-free of the
OPP table since the devfreq owner has been destroyed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922080114.4466=
2-1-royalnet026@gmail.com?part=3D9
