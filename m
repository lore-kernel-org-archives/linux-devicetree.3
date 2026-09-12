Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7CD3750C4
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 07:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789196716; cv=none; b=dlF9iO+Oa5Ag4kTVfPv70TncRKPghlFyQerkhd3QCAXnO98+NmGls2jvb8rtVhAEB4zP1Utm0bFpG+5mKjgh3Kzsrqz5Z7prh3gX2b8sDXJiLh8f5UPKERt0LJ0DVy56ohqfyrpmwb688q741OzgsMuqrtHg10QVGjTk/2UbYXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789196716; c=relaxed/simple;
	bh=qK0KrRIPXxk8N4AqfjGHE1zVVZF4/7dvuumyV0Bh7H8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VlenX9ges+EM/Ewpt6pNYNhFQlQeSX13SrHBdSDPc/O21vmnLKyxlJ4ETi0fiuqPmz4TVRzxhFNeVWLNKpG4h7/RYwF6Y9bi7+Eh3Iebu9fytYV9MOEKLbCXSEM9OgVSYGg0YAj9F4pH8mi8ol/Ut2ZdYyKFadaso/ckr7Y9TOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FJwND/Br; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FJwND/Br"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7631F00893;
	Sat, 12 Sep 2026 07:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789196715;
	bh=euV8EyPB7oEuqUMslNyDl8KQ/LnYQX0Zjv0NXkH8weQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FJwND/BrYbmvnQX4NqgU/wkInpGTyMXYha5O6aFsn1CQjTYilMy1XKQC4xBw9cLxt
	 tpU5V68Ah3ubvrgZNFlB/jSy1qz4odEHw7FgBeE9meZLYaGkSuqsAS3q8xO0xvWtmQ
	 sLlP+AD+U4YPiiMakR91iFyUA0V7/M1l4vz3FluZ6QRYMPGD1KNVfsjrjUjN72nZRR
	 PGPUgQRJrDlEPMweL8pmNqMa7DTLvGCiUwwVUXcH8bU3gZmOWRmQXt9Fp7oAtI47Gs
	 oeql/1YP7XitTYTbEMittqaO2LPmKHAAnqkZ+laUgWLtlFmA/TUO2a79XJ7fOy/qGW
	 29x3HSj1XKKYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 05/14] accel/rocket: factor the completion tail out
 of the IRQ handler
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260912065053.1519165-6-gahing@gahingwoo.com>
References: <20260912065053.1519165-1-gahing@gahingwoo.com>
 <20260912065053.1519165-6-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 07:05:14 +0000
Message-Id: <20260912070514.EB7631F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Leaking IOMMU group reference on job completion in rocket_job_next=
_locked().
- [High] Unconditional hardware access in shared IRQ handler while device m=
ay be suspended.
- [High] Missing synchronize_irq() in runtime suspend callback allows share=
d IRQ to race with clock disable.
--

commit d5e7944e1f53bee9ce55d9b7485126ab8b104207
Author: Jiaxing Hu <gahing@gahingwoo.com>

accel/rocket: factor the completion tail out of the IRQ handler

rocket_job_handle_irq() stops the block and then either starts the job's
next task or retires the job. The second half is a step of its own and
reads better with a name, now that taking the register writes under
job_lock has moved it a level deeper inside the scoped guard.

> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/roc=
ket_job.c
> index b588049aaa6ce..8cffe93f6c5ab 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -341,6 +341,25 @@ static struct dma_fence *rocket_job_run(struct drm_s=
ched_job *sched_job)
>  	return ERR_PTR(ret);
>  }
> =20
> +/* Start the job's next task, or retire it. Caller holds job_lock. */
> +static void rocket_job_next_locked(struct rocket_core *core)
> +{
> +	lockdep_assert_held(&core->job_lock);
> +
> +	if (!core->in_flight_job)
> +		return;
> +
> +	if (core->in_flight_job->next_task_idx < core->in_flight_job->task_coun=
t) {
> +		rocket_job_hw_submit(core, core->in_flight_job);
> +		return;
> +	}
> +
> +	iommu_detach_group(NULL, iommu_group_get(core->dev));

[Severity: High]
This is a pre-existing issue, but does this code leak the iommu_group
reference?

iommu_group_get() explicitly increments the reference count of the IOMMU gr=
oup,
but iommu_detach_group() only uses the pointer and doesn't take ownership.

Since iommu_group_put() is never called here, the reference leaks on every
job completion. This can eventually saturate the refcount and prevent relea=
se
during device teardown.

Would it be better to use the already-cached core->iommu_group directly her=
e?

> +	dma_fence_signal(core->in_flight_job->done_fence);
> +	pm_runtime_put_autosuspend(core->dev);
> +	core->in_flight_job =3D NULL;
> +}
> +
>  static void rocket_job_handle_irq(struct rocket_core *core)
>  {

[ ... ]

[Severity: High]
This is another pre-existing issue, but can this unconditionally access
hardware registers while the device is suspended?

The IRQ is requested with IRQF_SHARED:

rocket_job_init() {
    ...
    ret =3D devm_request_threaded_irq(core->dev, core->irq,
                                    rocket_job_irq_handler,
                                    ...
                                    IRQF_SHARED, dev_name(core->dev),
                                    core);
    ...
}

However, the handler immediately reads hardware registers without checking =
if
the device is active:

rocket_job_irq_handler() {
    ...
    u32 raw_status =3D rocket_pc_readl(core, INTERRUPT_RAW_STATUS);
    ...
}

If another device on the same shared line raises an interrupt while the Roc=
ket
device is suspended, reading the suspended device's registers can cause a b=
us
fault or return 0xffffffff.

If it returns 0xffffffff, bitwise checks will falsely pass, leading to
invalid writes to INTERRUPT_MASK and spuriously waking the threaded handler.

Should this use pm_runtime_get_if_active() before accessing the registers?


[Severity: High]
This is a pre-existing issue, but can the shared IRQ handler race with
clock disable during runtime suspend?

The runtime suspend callback disables clocks without first synchronizing the
IRQ:

rocket_device_runtime_suspend() {
    ...
    clk_bulk_disable_unprepare(ARRAY_SIZE(rdev->cores[core].clks),
                               rdev->cores[core].clks);
    ...
}

If another device on the shared IRQ line triggers an interrupt concurrently,
rocket_job_irq_handler() could execute on another CPU while the hardware cl=
ocks
are being disabled, potentially leading to a bus fault or system crash.

Does this need a call to synchronize_irq() before powering down the hardwar=
e?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912065053.1519=
165-1-gahing@gahingwoo.com?part=3D5
