Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CE0430797
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 07:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788505421; cv=none; b=hpaCBgU6kDDKT+h7kQpl56aaVbOn+CCqOEEQEzJojZ84ojilzwQyb2DRoCBo1GXS51vpLraDYPDDKHuezoewAbopOjjJTZklNBPLZ/SsJz0isgJwu86dZue9fVV/iSoDBRSf+aLaO/bTKnXJq9WrdEoj+4m2I7/qKk9jB7BJ3TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788505421; c=relaxed/simple;
	bh=JW2IRNAs4Ed7h1FE0yS+nt/uZ06bAiFfuiSyyw+KEg4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Up/5tg7VO8F/0YFH/MaW9gGOP4NAJHqyCja0BdQvSIvw9rfnwOLhr26oa0hUfLqZXje7WfWoWNLnkaC9wgjh/OYZPoETkByKcjp+Ak5k7l5tOQ8fpkTn+piZ376V1m0OG3nYCk61Mnqk0xHUILFkDQzMM2vmQcjGT1mALPaUrUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nJkjdUc9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nJkjdUc9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96FF81F00A3D;
	Fri,  4 Sep 2026 07:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788505419;
	bh=7Jp1GTbtHARH7NVobZ4o8aMaarg0H9oueTwOd/PPyzY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nJkjdUc9RgBE+hxNKnY29sJ5zaXyzBUHaYdfdD1JfI4A/fDm1etPhH1hj2oPa/6YV
	 V+U0Sn5htgIUTEqQWdBTpZVv0jmlYfmfB52wISGfRSzEYsNIyfBWbN/LERVNyw1yT9
	 04O1sI3jR0py/7P2/B06LBnsKNyWHZMZ992NHGQ5jAZdZEIBF30pa39sx701/JA+iX
	 PnmpCvXk3HGVu9HfvcMQ73Flm9Tfs3jovIjecGv7DCjuYKpL+5a+4eMr3+A2/aTNbz
	 cpZjDszyRXMdXou/4m+DKpM14wk238S4nNA6yUJe9CTO6UWQp+VdMEi2uJLIv9Z0b+
	 R7aI+QcMjO1Fw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 5/9] media: chips-media: wave6: Add Wave6 core driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nas Chung" <nas.chung@chipsnmedia.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, robh@kernel.org
In-Reply-To: <e8323267420b8e8d29e71c7ea018759cb7298c8d.1788496816.git.nas.chung@chipsnmedia.com>
References: <cover.1788496816.git.nas.chung@chipsnmedia.com>
 <e8323267420b8e8d29e71c7ea018759cb7298c8d.1788496816.git.nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 07:03:39 +0000
Message-Id: <20260904070339.96FF81F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [Critical] V4L2 lifecycle mismatch causes Use-After-Free of `core` struct=
ure when file descriptors are closed after driver unbind or probe error.
- [High] Polling a reference count with a timeout guarantees a Use-After-Fr=
ee under scheduling delays.
- [High] Hardware interrupt events are dropped due to early returns and inc=
omplete bitmask processing, causing instances to hang.
- [High] Delayed work `task_timer` is leaked on module remove, leading to a=
 use-after-free.
- [High] The IRQ handler and thread can execute after driver teardown destr=
oys critical resources, leading to Use-After-Free.
- [High] Hardware registers are accessed in the interrupt handler without v=
alidating that the device is not in a runtime PM suspended state.
- [High] Requesting the IRQ before enabling clocks and runtime PM can lead =
to a bus error if a spurious or pending interrupt fires.
- [High] DMA memory `core->temp_vbuf` is freed while the hardware may still=
 be running.
- [Medium] Storing a debugfs dentry pointer after dropping its reference le=
ads to a dangling pointer and Use-After-Free.
- [Medium] Debugfs directory is never removed, causing a memory leak.
--

commit 7b3f41c4df55c9ee33568cd7f9d838b5f4de81b9
Author: Nas Chung <nas.chung@chipsnmedia.com>

media: chips-media: wave6: Add Wave6 core driver
   =20
Add the core driver for the Chips&Media Wave6 video codec IP.

> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c b/=
drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
> new file mode 100644
> index 0000000000000..89cce27802cfe
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
[ ... ]
> +static irqreturn_t wave6_vpu_core_irq(int irq, void *dev_id)
> +{
> +	struct vpu_core_device *core =3D dev_id;
> +	struct vpu_irq irq_info;
> +
> +	if (!vpu_read_reg(core, W6_VPU_VPU_INT_STS))
> +		return IRQ_NONE;

[Severity: High]
Does this code risk triggering a system bus error? The interrupt handler
unconditionally reads W6_VPU_VPU_INT_STS without first checking if the
device is runtime suspended. Subsystem guidelines recommend using
pm_runtime_get_if_active() before accessing hardware registers in an IRQ
handler to ensure clocks are enabled.

> +
> +	irq_info.status =3D vpu_read_reg(core, W6_VPU_VINT_REASON);
> +	irq_info.inst_idc =3D vpu_read_reg(core, W6_RET_INT_INSTANCE_INFO);
> +
> +	vpu_write_reg(core, W6_RET_INT_INSTANCE_INFO, INT_INSTANCE_INFO_CLEAR);
> +	vpu_write_reg(core, W6_VPU_VINT_REASON_CLEAR, irq_info.status);
> +	vpu_write_reg(core, W6_VPU_VINT_CLEAR, VINT_CLEAR);
> +
> +	trace_wave6_vpu_irq(core, irq_info.status, irq_info.inst_idc);
> +
> +	if (irq_info.status & BIT(W6_INT_BIT_REQ_WORK_BUF)) {
> +		if (core->vpu)
> +			core->vpu->req_work_buffer(core->vpu, core);
> +
> +		return IRQ_HANDLED;
> +	}

[Severity: High]
If W6_INT_BIT_REQ_WORK_BUF is set, this returns IRQ_HANDLED immediately.
Doesn't this discard any other pending interrupt events (like INIT_SEQ)
that might be present in irq_info.status, potentially causing other
instances to hang?

> +
> +	if (kfifo_in(&core->irq_fifo, &irq_info, sizeof(struct vpu_irq)) !=3D
> +	    sizeof(struct vpu_irq))
> +		dev_err(core->dev, "IRQ overflow status 0x%x idc 0x%x\n",
> +			irq_info.status, irq_info.inst_idc);
> +
> +	return IRQ_WAKE_THREAD;
> +}
> +
> +static struct vpu_instance *wave6_vpu_core_get_instance(struct vpu_core_=
device *core,
> +							u32 inst_idc)
> +{
> +	struct vpu_instance *inst;
> +
> +	guard(spinlock)(&core->inst_lock);
> +
> +	list_for_each_entry(inst, &core->instances, list) {
> +		if ((BIT(inst->id) & inst_idc) && inst->enable) {
> +			atomic_inc(&inst->refcount);
> +			return inst;
> +		}
> +	}

[Severity: High]
This loops through the instances and returns the first one that matches
a set bit in inst_idc. Since inst_idc is a bitmask, what happens if
multiple instances complete simultaneously? The IRQ thread will process
only this first instance and ignore the other set bits, causing them to han=
g.

> +
> +	return NULL;
> +}
[ ... ]
> +void wave6_vpu_disable_instance(struct vpu_instance *inst)
> +{
> +	int count;
> +
> +	scoped_guard(spinlock, &inst->dev->inst_lock)
> +		inst->enable =3D false;
> +
> +	if (read_poll_timeout(atomic_read, count, !count,
> +			      W6_VPU_POLL_DELAY_US,
> +			      W6_VPU_POLL_TIMEOUT,
> +			      true, &inst->refcount))
> +		dev_dbg(inst->dev->dev, "[%d] disable timeout\n", inst->id);
> +}

[Severity: High]
Is it safe to return from here if the polling times out? If the IRQ thread
is preempted and delayed, this timeout can expire while the IRQ thread still
holds a reference to the instance. The caller will assume the instance is
disabled and free it, leading to a use-after-free when the delayed IRQ
thread resumes and calls inst->ops->finish_process().

[ ... ]
> +static int wave6_vpu_core_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret =3D devm_request_threaded_irq(&pdev->dev, irq,
> +					wave6_vpu_core_irq,
> +					wave6_vpu_core_irq_thread,
> +					0, "vpu_irq", core);

[Severity: High]
Can requesting the IRQ here lead to a crash? The IRQ is requested before
pm_runtime_enable() is called and before the device clocks are powered on.
If a pending or spurious interrupt fires immediately, the handler will
read MMIO registers while the hardware clocks are disabled.

> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to request IRQ: %d\n", ret);
> +		return ret;
> +	}
[ ... ]
> +	core->debugfs =3D debugfs_lookup(WAVE6_VPU_DEBUGFS_DIR, NULL);
> +	if (!IS_ERR_OR_NULL(core->debugfs))
> +		dput(core->debugfs);
> +	else
> +		core->debugfs =3D debugfs_create_dir(WAVE6_VPU_DEBUGFS_DIR, NULL);

[Severity: Medium]
Does this create a dangling pointer? The reference obtained from
debugfs_lookup() is immediately dropped via dput(), but the raw pointer is
retained in core->debugfs for later use. If the debugfs directory is removed
manually, subsequent uses of this pointer will cause a use-after-free.

[Severity: Medium]
Additionally, it appears the debugfs directory created here is never
tracked for removal. Repeatedly loading and unloading the driver, or failing
probe after this point, seems to permanently leak the debugfs directory.

> +
> +	pm_runtime_enable(&pdev->dev);
> +
> +	if (core->res->codec_types & WAVE6_IS_DEC) {
> +		ret =3D wave6_vpu_dec_register_device(core);
> +		if (ret) {
> +			dev_err(&pdev->dev,
> +				"failed to register video_dev_dec: %d\n", ret);
> +			goto err_temp_vbuf_free;
> +		}
> +	}
> +	if (core->res->codec_types & WAVE6_IS_ENC) {
> +		ret =3D wave6_vpu_enc_register_device(core);
> +		if (ret) {
> +			dev_err(&pdev->dev,
> +				"failed to register video_dev_enc: %d\n", ret);
> +			goto err_dec_unreg;
> +		}
> +	}

[Severity: Critical]
Does this create a use-after-free condition via V4L2 lifecycle mismatch?
The core structure is allocated earlier using devm_kzalloc(), tying its
lifetime to the device binding. However, wave6_vpu_dec_register_device()
exposes the decoder to userspace here.

If wave6_vpu_enc_register_device() fails on the next step (or if the driver
is later unbound via sysfs), devres will free the core structure. If a
userspace process has already opened the /dev/videoX node and holds a file
descriptor, closing it later will invoke V4L2 release callbacks that
dereference the freed core structure.

[ ... ]
> +static void wave6_vpu_core_remove(struct platform_device *pdev)
> +{
> +	struct vpu_core_device *core =3D dev_get_drvdata(&pdev->dev);
> +
> +	wave6_vpu_enc_unregister_device(core);
> +	wave6_vpu_dec_unregister_device(core);
> +	pm_runtime_disable(&pdev->dev);
> +	wave6_vdi_free_dma(&core->temp_vbuf);

[Severity: High]
Is it safe to free this shared DMA memory without first instructing the
hardware to halt or waiting for active jobs to finish? If the VPU is still
running, it will continue DMA operations into the freed pages.

[Severity: High]
Also, does this function leak the delayed work? The driver schedules
core->task_timer during streaming, but cancel_delayed_work_sync() is never
called here. If the work is pending when the device unbinds, it will
execute later and dereference the freed core structure.

> +	wave6_vpu_release_m2m_dev(core);
> +	v4l2_device_unregister(&core->v4l2_dev);

[Severity: High]
Can the devres-managed IRQ thread execute concurrently with or after this
teardown? The IRQ was requested with devm_request_threaded_irq(), meaning
it remains active until after this remove() function returns. However,
wave6_vpu_release_m2m_dev() destroys M2M structures here. If an interrupt
fires during or just after this step, the still-active IRQ thread will
dereference the destroyed M2M and V4L2 structures.

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788496816.gi=
t.nas.chung@chipsnmedia.com?part=3D5
