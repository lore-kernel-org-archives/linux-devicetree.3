Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86DD39792B
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 07:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789196691; cv=none; b=USeD2I5pd6drDkuTr00f8oWmnO2+zTbonJPIUOLIFUeW1588RTb1HpubAtRc52AjlIGF10pwlAVuDdwPzr/RP3IakrgmzJWXkRLWZ4pjZnEqy71S61LJH9ZxIkEJq6/AT0RLpfraWnrqAQuXyCwKgMeNjCk0D6WnfcTQe1dSMO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789196691; c=relaxed/simple;
	bh=LL8RW4rv0SamdbkDHJSuc72dR0sGZUwNTCS2K/ppEJ4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=htHRGhiiXGSPNhHmd/Rd/DdGL9xQwWCJ/odLDpsIjQCJ/VcYrgpxcSi/RFYS0SrLSNhiNmHY0zheoBbsPqbGe3B3lQMbGI/44jlPLaufR+Uds+Y/FlfpUNYPB1x4etRBmm74A/1FLqEEnxS1USCXTYHPSHkEUVr+MwasmnW3CCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dXQ6ePMN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dXQ6ePMN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 165821F00898;
	Sat, 12 Sep 2026 07:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789196689;
	bh=dA6YXqCp+jlfyiXbLigRyBUy5tjmEO8uLy1Rs7ZBoBU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dXQ6ePMNQHxbHZfwGDvryBH2zvcy3XWkPBc1f6bGvgViLLofsa/LbmsPOaiBWFlsO
	 gnquMoxXWhT8y/MaukcRA0W3YlFmICRdqLOhP43fwORGnW0LGQSwTpBuSMP1lFYt4q
	 HynwI+rexnPg9fjrVvOgQ1xcIZRlQL8bTZP2JonDUUOVdqC6GIpw3tG2pKqJLhiFqV
	 dTHxOhgjQGe32XpBfV1AJqcU1+IrDriJuQN4WvMY3QqoRyIeQzz3fB+0DwWdf2YoTv
	 jcIcG4TriP6nkOeB+0A9lTe2OFHN62xj4LKBTHm5RO3p/Twz+D+BfXkxPLKSkaxN7B
	 ifRM7MRdvRbig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 04/14] accel/rocket: let the core suspend after a
 reset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260912065053.1519165-5-gahing@gahingwoo.com>
References: <20260912065053.1519165-1-gahing@gahingwoo.com>
 <20260912065053.1519165-5-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 07:04:48 +0000
Message-Id: <20260912070449.165821F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Async vs Synchronous Runtime PM Put race condition violates hardwa=
re power cycle constraints.

Pre-existing issues:
- [High] Shared IRQ handler accesses hardware registers without verifying r=
untime PM state, risking SError crashes.
- [High] Runtime suspend callback disables clocks without calling synchroni=
ze_irq().
- [High] Reference count leak of IOMMU group in job completion path.
--

commit 230b2e3fd33edbead6ba7eab402e2a3e06d6ef3a
Author: Jiaxing Hu <gahing@gahingwoo.com>
accel/rocket: let the core suspend after a reset

This commit changes the runtime PM put in rocket_reset() from noidle to
autosuspend. This aims to allow the core to suspend and cycle its power
domain after a reset, which is necessary on platforms like RK3576 to
recover the IOMMU.

Link: https://lore.kernel.org/all/20260819073530.6087-1-royalnet026@gmail.c=
om/

> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -421,12 +421,12 @@ rocket_reset(struct rocket_core *core, struct drm_s=
ched_job *bad)
> =20
>  	/*
>  	 * No handler is running now, but we might still have stuck jobs. Let's
> -	 * make sure the PM counters stay balanced by manually calling
> -	 * pm_runtime_put_noidle().
> +	 * make sure the PM counters stay balanced by putting the reference the
> +	 * job took, and request idle while doing it so the core can suspend.
>  	 */
>  	scoped_guard(mutex, &core->job_lock) {
>  		if (core->in_flight_job)
> -			pm_runtime_put_noidle(core->dev);
> +			pm_runtime_put_autosuspend(core->dev);

[Severity: High]
Will this asynchronous suspend actually have time to trigger before the
scheduler starts again?

The RK3576 NPU requires a power domain cycle (suspend and resume) to reset
its bus interface and recover the IOMMU after a job timeout. However,
pm_runtime_put_autosuspend() queues an asynchronous suspend that may not
fire immediately.

[ ... ]

>  		iommu_detach_group(NULL, core->iommu_group);
> =20
>  		core->in_flight_job =3D NULL;
>  	}
> =20
>  	/* Proceed with reset now. */
>  	rocket_core_reset(core);
> =20
>  	/* NPU has been reset, we can clear the reset pending bit. */
>  	atomic_set(&core->reset.pending, 0);
> =20
>  	/* Restart the scheduler */
>  	drm_sched_start(&core->sched, 0);
>  }

[Severity: High]
If there are multiple jobs queued, doesn't restarting the scheduler here
immediately dequeue the next job?

If the next job calls rocket_job_run() and invokes
pm_runtime_resume_and_get(), this would cancel the pending autosuspend
before the timer expires. Would it be safer to use a synchronous suspend
(like pm_runtime_put_sync_suspend()) to enforce the hardware ordering
constraint before restarting the scheduler?

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a potential
issue with how the shared IRQ handler accesses hardware registers:

drivers/accel/rocket/rocket_job.c:rocket_job_irq_handler() {
    u32 raw_status =3D rocket_pc_readl(core, INTERRUPT_RAW_STATUS);
    ...
}

Since the interrupt is shared (IRQF_SHARED) with the IOMMU, couldn't this
handler be invoked unconditionally while the rocket_core is in an
RPM_SUSPENDED state? Reading memory-mapped registers of a suspended device
could cause an asynchronous SError and crash the system. Should this be
guarded with pm_runtime_get_if_active()?

[Severity: High]
This is a pre-existing issue, but the runtime suspend callback disables
clocks without synchronizing the shared IRQ:

drivers/accel/rocket/rocket_drv.c:rocket_device_runtime_suspend() {
    ...
    clk_bulk_disable_unprepare(ARRAY_SIZE(rdev->cores[core].clks),
                               rdev->cores[core].clks);
    ...
}

Because the device uses a shared interrupt, is there a race condition where
the interrupt handler might be actively executing on another CPU while the
runtime suspend callback powers down the hardware? Should this callback use
synchronize_irq() first?

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a potential
reference count leak in the job completion path:

drivers/accel/rocket/rocket_job.c:rocket_job_handle_irq() {
    ...
    iommu_detach_group(NULL, iommu_group_get(core->dev));
    ...
}

Does iommu_detach_group() consume the reference returned by
iommu_group_get()? If it doesn't, this seems to leak a reference on the
IOMMU group every time a job is completed. Could this use the cached
core->iommu_group or add a corresponding iommu_group_put()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912065053.1519=
165-1-gahing@gahingwoo.com?part=3D4
