Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEA51EFF8D
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 07:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782286691; cv=none; b=diVCpSaLeyChyLP39aHC71Zb5NSL62VXmJS3PVjec7AuweS1VwrAjmAWon/1hATkq1wayK8hdzXofplLsQy2ib4wzOE7oxU+F3J3uXx+SnKZeHhgkxax9G1/v12dt3rXUg1dg2VgzpY20X36fE/l8HXtaqMS3x2ZEPsTy6LaWns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782286691; c=relaxed/simple;
	bh=3T0TwAPNWa8Z/oTOhVmouglXGNvJEwxTONSagrqLn+A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C2urjHHm2o9McUv6mzriy2uJ871dyvV59roRFc57oxYLxbPf5LTMPit7G+z9+bUwXXztlhTjRwa9dCsQZQqvac3gjit8ldRFmSkgHoRbLoyWJMRRK1MCvR+l4XSVllbB5wkoMdgV5t3wtMCmK7WUnUuo557bQHXgDr8qxxxnXNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gl2tFsgh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gl2tFsgh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426561F000E9;
	Wed, 24 Jun 2026 07:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782286690;
	bh=kM7M5Kb3bQRZPiHzyCVXBJX2I9y7siav8h2UVXMQWNw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gl2tFsghVnA3n8klqSwDuQPsPtgbMDX53G1Bk9psVqSquPICkWpIQXT7WsQ5p/PW2
	 2WmHFdVs16JsuQ6F4H3Vx2yDN226+Vsz+r6SC99gEDE2yCj3QUsfe3Ko4Uli+mt/5h
	 nd3v1NF+i60V3qYBB1jDWjiyelE7ep5QlcMeLPtwYOsUaS0CEeHgruz+gGpzUubLd4
	 3yYmwE9Q3EfJtOav2yFLaQ9m5BnF8HFLUG7cwQqhcmlH5HaNdQdMDIkkWBJS3fuk3i
	 x0dwhh0NC8hRd0aJF7UMZAGnBhQ8z4cfE4cbFbPNxb2t3Qg4awMDfszPiTFIhXL4OK
	 tVkGHYAzk7GHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/9] media: chips-media: wave6: Add Wave6 core driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nas Chung" <nas.chung@chipsnmedia.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260624072043.238-6-nas.chung@chipsnmedia.com>
References: <20260624072043.238-1-nas.chung@chipsnmedia.com>
 <20260624072043.238-6-nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 07:38:08 +0000
Message-Id: <20260624073809.426561F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 13 potential issue=
(s) to consider:
- [High] Allocating `struct video_device` with `devm_kzalloc()` and an empt=
y release callback causes a Use-After-Free when the driver is unbound while=
 a file descriptor is open.
- [High] Freeing `core->irq_fifo` in `remove()` while the devm-managed IRQ =
handler is still active creates a use-after-free window.
- [High] Returning early for `W6_INT_BIT_REQ_WORK_BUF` in `wave6_vpu_core_i=
rq` drops other concurrent hardware interrupts.
- [High] The interrupt thread drops completion events because `wave6_vpu_co=
re_get_instance()` only returns the first matching instance.
- [High] Writing 0 to `W6_RET_INT_INSTANCE_INFO` creates a race condition t=
hat can drop newly raised interrupts.
- [High] The hardware interrupt handler is registered before the kfifo is a=
llocated, leading to a potential NULL pointer dereference on early interrup=
ts.
- [High] Hardware initialization failures during PM runtime resume are sile=
ntly ignored, falsely reporting a successful resume.
- [High] Video devices are unregistered after PM runtime is disabled, allow=
ing active file operations to access hardware without power management.
- [High] The IRQ handler unconditionally accesses hardware registers withou=
t checking if the device is active.
- [High] `wave6_vpu_disable_instance()` ignores timeouts while waiting for =
refcount to drop, potentially leading to Use-After-Free and ABA problems wi=
th stale events.
- [Medium] The driver creates a debugfs directory but never removes it, cau=
sing a memory leak on module unload.
- [Medium] Clocks are left permanently enabled if the driver is removed whi=
le the device is runtime-active.
- [Medium] Ignoring the return value of `kfifo_in()` allows interrupts to b=
e silently dropped if the queue fills up.
--

commit dac8dbfd6064814484fc40f423abb75bd9d68a7c
Author: Nas Chung <nas.chung@chipsnmedia.com>

media: chips-media: wave6: Add Wave6 core driver

Add the core driver for the Chips&Media Wave6 video codec IP.
It configures the V4L2 mem2mem devices and communicates with the Wave6
hardware to perform video processing tasks.

> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c b/=
drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
> new file mode 100644
> index 0000000000000..e54a2a39ff9a3
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
Does this unconditionally access hardware registers without checking if the
device is active?

If a spurious interrupt occurs while the device is runtime-suspended and its
clocks are disabled, this unclocked register read could cause an asynchrono=
us
bus fault on platforms like i.MX95. Should the handler use
pm_runtime_get_if_active() before reading MMIO registers?

> +
> +	irq_info.status =3D vpu_read_reg(core, W6_VPU_VINT_REASON);
> +	irq_info.inst_idc =3D vpu_read_reg(core, W6_RET_INT_INSTANCE_INFO);
> +
> +	vpu_write_reg(core, W6_RET_INT_INSTANCE_INFO, INT_INSTANCE_INFO_CLEAR);

[Severity: High]
Does unconditionally writing 0 to W6_RET_INT_INSTANCE_INFO create a race
condition?

If the hardware finishes another operation and sets a new bit in this regis=
ter
between the read and the write, the write of 0 will clear the newly set bit
before it can be read, permanently dropping the interrupt for that instance.

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
Will returning early for W6_INT_BIT_REQ_WORK_BUF drop other concurrent
hardware interrupts?

Because the entire irq_info.status mask was already cleared from the hardwa=
re,
returning here bypasses the kfifo_in() call. Any other interrupt events (li=
ke
DEC_PIC or BSBUF_ERROR) present in the status are never queued to the
interrupt thread and will be permanently lost, potentially hanging the
affected instances.

> +
> +	kfifo_in(&core->irq_fifo, &irq_info, sizeof(struct vpu_irq));

[Severity: Medium]
What happens if the FIFO fills up?

kfifo_in() returns the number of bytes queued (or 0 if full). Ignoring the
return value allows interrupts to be silently dropped if a burst occurs bef=
ore
the threaded handler can process them, leaving VPU instances waiting
indefinitely. Should this at least log an error on overflow?

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
> +
> +	return NULL;
> +}

[Severity: High]
Does this only return the first matching instance?

The hardware provides a bitmask of interrupting instances in inst_idc. By
iterating and returning only the first matched instance, any other instances
that had their bits set in the same inst_idc mask are completely ignored,
causing them to miss their interrupts and hang indefinitely.

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
Does ignoring the timeout here lead to a potential use-after-free and ABA
problem?

If read_poll_timeout() times out, the function merely logs a debug message =
and
returns, allowing the caller to proceed to destroy the instance. If the
delayed IRQ thread is still processing the instance, it will access freed
memory.

Additionally, refcount only tracks events actively being processed by the
thread, not un-popped events still in the kfifo. Thus, disable_instance() c=
an
return while events are still in the FIFO. If a new instance is created
reusing the same ID, the IRQ thread could pop the stale event and incorrect=
ly
match it to the new instance.

[ ... ]
> +static void wave6_vpu_core_check_state(struct vpu_core_device *core)
> +{
> +	u32 val;
> +	int ret;
> +
> +	guard(mutex)(&core->hw_lock);
> +
> +	ret =3D read_poll_timeout(vpu_read_reg, val, val !=3D 0,
> +				W6_VPU_POLL_DELAY_US, W6_VPU_POLL_TIMEOUT,
> +				false, core, W6_VPU_VCPU_CUR_PC);
> +	if (ret)
> +		return;

[Severity: High]
Are hardware initialization failures swallowed here?

This function returns void and drops the error code if read_poll_timeout()
or wave6_vpu_get_version() fails.

[ ... ]
> +static int wave6_vpu_core_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret =3D devm_request_threaded_irq(&pdev->dev, irq,
> +					wave6_vpu_core_irq,
> +					wave6_vpu_core_irq_thread,
> +					0, "vpu_irq", core);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to request IRQ: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D v4l2_device_register(&pdev->dev, &core->v4l2_dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to register v4l2_dev: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D wave6_vpu_init_m2m_dev(core);
> +	if (ret)
> +		goto err_v4l2_unregister;
> +
> +	ret =3D kfifo_alloc(&core->irq_fifo,
> +			  MAX_NUM_INSTANCE * sizeof(struct vpu_irq),
> +			  GFP_KERNEL);

[Severity: High]
Could an early interrupt cause a NULL pointer dereference?

devm_request_threaded_irq() is called before kfifo_alloc(). If an interrupt
fires immediately upon registration, wave6_vpu_core_irq() will execute and
attempt to push the event into the unallocated FIFO using kfifo_in(),
leading to a crash.

[ ... ]
> +	core->debugfs =3D debugfs_lookup(WAVE6_VPU_DEBUGFS_DIR, NULL);
> +	if (!IS_ERR_OR_NULL(core->debugfs))
> +		dput(core->debugfs);
> +	else
> +		core->debugfs =3D debugfs_create_dir(WAVE6_VPU_DEBUGFS_DIR, NULL);

[Severity: Medium]
Is there a missing debugfs_remove() call for this directory in
wave6_vpu_core_remove()? This leaks the directory on module unload.

> +
> +	pm_runtime_enable(&pdev->dev);
> +
> +	if (core->res->codec_types & WAVE6_IS_DEC) {
> +		ret =3D wave6_vpu_dec_register_device(core);

[Severity: High]
Does allocating the video_device with devm_kzalloc() inside
wave6_vpu_dec_register_device() cause a use-after-free?

wave6_vpu_dec_register_device() and wave6_vpu_enc_register_device() allocate
the video device via devm_kzalloc() and assign an empty release callback. If
a user holds a file descriptor open and the driver is unbound, devres frees
the video_device memory. When the user later closes the file descriptor, the
V4L2 core accesses the now-freed video_device struct.

[ ... ]
> +static void wave6_vpu_core_remove(struct platform_device *pdev)
> +{
> +	struct vpu_core_device *core =3D dev_get_drvdata(&pdev->dev);
> +
> +	pm_runtime_disable(&pdev->dev);
> +
> +	wave6_vpu_enc_unregister_device(core);
> +	wave6_vpu_dec_unregister_device(core);

[Severity: High]
Is PM runtime disabled before the user-facing video devices are unregistere=
d?

Unregistering video devices after pm_runtime_disable() allows active file
operations to access hardware without power management. If a user applicati=
on
issues an ioctl during this window, the driver may attempt to wake the devi=
ce,
failing and leading to unexpected errors or unpowered hardware access.

[Severity: Medium]
Are clocks left permanently enabled if the driver is removed while the devi=
ce
is active?

Since this function does not explicitly suspend the device or disable clock=
s,
and devm_clk_bulk_get_all() only releases the clock references without
disabling them, the device clocks will be left enabled if the driver is
unbound while active (e.g., streaming).

> +	wave6_vdi_free_dma(&core->temp_vbuf);
> +	kfifo_free(&core->irq_fifo);

[Severity: High]
Does manually freeing core->irq_fifo create a use-after-free window?

The IRQ was requested using devm_request_threaded_irq(), meaning it will be
freed during the devres cleanup phase after remove() returns. Manually call=
ing
kfifo_free() here creates a window where the devm-managed IRQ remains active
but the kfifo and DMA memory are already freed. A late or spurious interrupt
during this window will trigger kfifo_in() on freed memory.

> +	wave6_vpu_release_m2m_dev(core);
> +	v4l2_device_unregister(&core->v4l2_dev);
> +}
[ ... ]
> +static int wave6_vpu_core_runtime_resume(struct device *dev)
> +{
[ ... ]
> +	/*
> +	 * Only call parent VPU get_vpu if the core has a parent and is active.
> +	 * - core->vpu: prevent access in core without parent VPU.
> +	 * - core->active: execute boot only after m2m streaming is started.
> +	 */
> +	if (core->vpu && core->active)
> +		ret =3D core->vpu->get_vpu(core->vpu, core);
> +
> +	if (!ret)
> +		wave6_vpu_core_wait_activated(core);
> +	else if (core->num_clks)
> +		clk_bulk_disable_unprepare(core->num_clks, core->clks);
> +
> +	return ret;
> +}

[Severity: High]
Because wave6_vpu_core_check_state() is void and cannot propagate failures,
wave6_vpu_core_wait_activated() will return without an error if it times out
or fails to get the version.

This means wave6_vpu_core_runtime_resume() will return 0 (success) to the PM
framework even if hardware initialization failed, leaving the device unable=
 to
generate interrupts and hanging subsequent V4L2 operations.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624072043.238-=
1-nas.chung@chipsnmedia.com?part=3D5
