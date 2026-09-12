Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB5A3939CE
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 07:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789196657; cv=none; b=J4INiN5Mh3rTx8KRd67nzS4wxn1gEAKIX+eqlMJJlLjMEX5nlNSHNIRQyrnjqGzdXvyWCgmPrd8BbO8yeOHvX1Z77Xd3a9ZEtutjZKOtryUEXT8vD6ApdabqcrrMny4tXiYfaOcsIWK2ZFon+Sh9fPQ/1tY+m/2lSGi5zv5goeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789196657; c=relaxed/simple;
	bh=mhWXIH9rnZ71yf7SHEnLRLI1w9rvXQzbqzZfEVvgfpA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LWFJ0Bkjvfaadty4rxVImKbrPzWiGdVBEQsT8hEK9nhJ2J19dn43KbsyjPOoFAV2nEiQZ1TvnkxtGJ5h6j0rqUZxhcgkBVYS0oUlOvap90dTlePuQV5ye/fSgVZ6soo/3dYke42PBITzGOJG0IhtXQIiXHjaidlWPxkTgNo1Ulo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ug3q2qJi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ug3q2qJi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44CE11F000FF;
	Sat, 12 Sep 2026 07:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789196652;
	bh=WGTEOOmjMhhqUxUPp/CNVoqJhWrkiEwPPBA+ZB9u8kw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ug3q2qJiGNL6sLhqlyMbasXfLN5ZatmeLRGZrbdWF74M1+o1KRMYWWL4d5V/rppLi
	 5FBAa2Fy19jV8u9PMCXSEtUuUGPbj89tz0XbVp/61z2r6IsOG0K6zaqGwHNOcyQA01
	 Jm+q/Jh8klaiLYK08un5G9dRCK5hLkOstgmEs8dlA+jKcZ6FaRS0U4atpmhWUIBm2V
	 ihAnahjT1nnL5zHY7ja9ALbsme2QLBTKoTm3eGYpBvKiFZ2kaPnN5OWtJdGRAd9E96
	 sHz6OzzEaNuxVDZ7kop4ebooUiIFfPHFKD2VBHZQ95XcMuAs3wJwZSggE6mJAZokmA
	 Q0eE18p3ar8gQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 02/14] accel/rocket: take the completion register
 writes under job_lock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260912065053.1519165-3-gahing@gahingwoo.com>
References: <20260912065053.1519165-1-gahing@gahingwoo.com>
 <20260912065053.1519165-3-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 07:04:11 +0000
Message-Id: <20260912070412.44CE11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The shared hardirq handler accesses hardware registers without che=
cking if the device is active via pm_runtime_get_if_active(), causing spuri=
ous interrupts and potential bus faults when suspended.
- [High] The runtime suspend callback disables hardware clocks without firs=
t calling `synchronize_irq()`, leading to potential race conditions and har=
dware lockups with the shared IRQ handler.
- [Medium] Leak of IOMMU group kobject reference in `rocket_job_handle_irq(=
)`.
- [Medium] The module removal path calls `pm_runtime_disable()` which can c=
ancel a pending asynchronous autosuspend, leaving the hardware clocks perma=
nently enabled.
--

commit 628f481e9ee69f13147956ea2124dd232b5d1c38
Author: Jiaxing Hu <gahing@gahingwoo.com>

accel/rocket: take the completion register writes under job_lock

This patch fixes a race condition by moving the OPERATION_ENABLE and
INTERRUPT_CLEAR register writes inside the job_lock scoped_guard. This ensu=
res
that stopping the block and deciding what to start next are performed as a
single atomic step.

> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/roc=
ket_job.c
> index f404355058185..575945015ca3b 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -345,10 +345,15 @@ static void rocket_job_handle_irq(struct rocket_cor=
e *core)
>  {
>  	pm_runtime_mark_last_busy(core->dev);
> =20
> -	rocket_pc_writel(core, OPERATION_ENABLE, 0x0);
> -	rocket_pc_writel(core, INTERRUPT_CLEAR, 0x1ffff);
> +	scoped_guard(mutex, &core->job_lock) {
> +		/*
> +		 * Stopping the block belongs under the lock. hw_submit() writes
> +		 * OPERATION_ENABLE too, and outside the lock this zero can land
> +		 * after that one and stop a task that has only just started.
> +		 */
> +		rocket_pc_writel(core, OPERATION_ENABLE, 0x0);
> +		rocket_pc_writel(core, INTERRUPT_CLEAR, 0x1ffff);
> =20
> -	scoped_guard(mutex, &core->job_lock)
>  		if (core->in_flight_job) {
>  			if (core->in_flight_job->next_task_idx < core->in_flight_job->task_co=
unt) {
>  				rocket_job_hw_submit(core, core->in_flight_job);

[Severity: Medium]
This is a pre-existing issue, but does this code leak a kobject
reference every time a job completes?

Just below this hunk in rocket_job_handle_irq(), the completion path has:

			iommu_detach_group(NULL, iommu_group_get(core->dev));

Calling iommu_group_get(core->dev) retrieves the group and increments its
reference count.

However, iommu_detach_group() does not consume this reference, and there is
no matching iommu_group_put() in this path.

Could this be fixed by using the pre-cached core->iommu_group instead?

[ ... ]


[Severity: High]
This is a pre-existing issue, but can the shared IRQ handler cause an
asynchronous bus fault or spurious handling when the device is suspended?

The interrupt is registered as IRQF_SHARED in rocket_job_init():

drivers/accel/rocket/rocket_job.c:rocket_job_init() {
    ...
	ret =3D devm_request_threaded_irq(core->dev, core->irq,
					rocket_job_irq_handler,
					rocket_job_irq_handler_thread,
					IRQF_SHARED, dev_name(core->dev), core);
    ...
}

If another device on the same shared line triggers an interrupt while the
rocket device is runtime-suspended, the handler blindly reads from the hard=
ware:

drivers/accel/rocket/rocket_job.c:rocket_job_irq_handler() {
	struct rocket_core *core =3D data;
	u32 raw_status =3D rocket_pc_readl(core, INTERRUPT_RAW_STATUS);
    ...
}

This unprotected read will typically return 0xffffffff when clocks are
disabled, which satisfies the bitmask checks and causes the handler to wake
the IRQ thread. The thread then executes on powered-off hardware.

Per subsystem guidelines, should we check if the device is active using
pm_runtime_get_if_active() before accessing registers here?


[Severity: High]
This is a pre-existing issue, but does the runtime suspend callback disable
clocks while the shared IRQ handler might still be executing?

drivers/accel/rocket/rocket_drv.c:rocket_device_runtime_suspend() {
	...
	clk_bulk_disable_unprepare(ARRAY_SIZE(rdev->cores[core].clks),
				   rdev->cores[core].clks);

	return 0;
}

Since the interrupt is registered as IRQF_SHARED, the handler could be runn=
ing
concurrently on another CPU.

If clocks are disabled exactly while the in-flight handler attempts to acce=
ss
hardware registers, it will cause a hardware lockup.

Per subsystem guidelines, drivers using IRQF_SHARED must call
synchronize_irq() in their runtime suspend callback before powering down.

Should a synchronize_irq() call be added here?


[Severity: Medium]
This is a pre-existing issue, but can unloading the module leave the hardwa=
re
powered on permanently?

At the end of rocket_core_init() and during job completions, an autosuspend
is scheduled using pm_runtime_put_autosuspend(). However, the removal path
calls pm_runtime_disable() directly:

drivers/accel/rocket/rocket_core.c:rocket_core_fini() {
	pm_runtime_dont_use_autosuspend(core->dev);
	pm_runtime_disable(core->dev);
	iommu_group_put(core->iommu_group);
    ...
}

Calling pm_runtime_disable() cancels any pending asynchronous autosuspend w=
ork.

If the module is removed while an autosuspend is pending, the device is left
powered on with clocks enabled.

Should we ensure the device is fully suspended (e.g., using
pm_runtime_put_sync()) before disabling runtime PM?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912065053.1519=
165-1-gahing@gahingwoo.com?part=3D2
