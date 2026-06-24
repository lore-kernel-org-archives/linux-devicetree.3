Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B70C33F361
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 07:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782286879; cv=none; b=C28eWCnRDPpOHR6Wd+y9MbU6hPDr/dtAq6Bil3OG3Gklzeo/rfLOXpIzCWuRwVSgYuR7MoP9ZL8UQL18gWn4vUsjHz6XUvIjjzO+kQyWC5F/vLtUAKkqrg3cteezF+aWRwCUQ6OI7W76sgTLA7wTU85e/iIsuGIv0IzhIi2WPDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782286879; c=relaxed/simple;
	bh=XJhwuLpcKJWr2MIED9352lorY3ZsTU9Bb1O97R4CeeQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bhKe9BcMvu+t+Wiw3chYRsq1tKx52M9tQ7c3NIhBYBoR5/IC1H8VNrIFSTjrpLhOVxGVQmpO1UPV9wXFhY+sLoETZ3MCT+IYDdDZOWVnC1ii0fS4LGR+H8QnSxr4GcXMoQMqsVfzmrei2d75bNqIs3Emed2g+a5UIfiBHeFF5v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2uagq8b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j2uagq8b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 993451F000E9;
	Wed, 24 Jun 2026 07:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782286877;
	bh=Ez9mZ66Gh2qSxqzpXXv5dD2BcQXZG5oHvaBXq0J5RZI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j2uagq8bs9jK3mswexqkXUZzojY25m/B5ehxlBHfaUoD3ATMC8NQJDBS/JcYrGvdw
	 qeifZ48V9vNUorVDwbGxkkvMiovE2RTZv/ooiTlEQGM4/S68a2VsOK46ddsDxGnqrU
	 wHlyq+KBdrMpaffVeCmGVpgmJVJvU/Dilx+wQlTzORR7Yijj9L86e1h6Uq4h8hfaAl
	 d2FxXaGP+g7wDBQTngsLrGec6K52L0y8ecZiThvVw0qjVygxYXWUBMZDeOLN0iRXFx
	 H9yghAie77IPC1ccx3WR/WGn3WqA6sMUrioZwBYJM1Sbes/8WFdjQdROjHYJAG1rup
	 CoOwy+3jaGMsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 8/9] media: chips-media: wave6: Add Wave6 control
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nas Chung" <nas.chung@chipsnmedia.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260624072043.238-9-nas.chung@chipsnmedia.com>
References: <20260624072043.238-1-nas.chung@chipsnmedia.com>
 <20260624072043.238-9-nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 07:41:17 +0000
Message-Id: <20260624074117.993451F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 13 potential issue=
(s) to consider:
- [Critical] Concurrent access to work buffer pool without synchronization =
causes data races and array out-of-bounds access.
- [Critical] Self-deadlock (ABBA) during VPU core unregistration due to hol=
ding vpu->lock.
- [Critical] Missing hardware quiescence during device removal allows the V=
PU to continue DMAing into freed memory.
- [High] Asynchronous firmware loading callback causes a use-after-free if =
the device is unbound before completion.
- [High] Pointer type mismatch when calling gen_pool_dma_alloc() leads to m=
emory corruption and invalid DMA mapping.
- [High] Disabling PM runtime prematurely leaks clock enable references on =
the parent device.
- [High] Silent truncation of the firmware code buffer during memory remapp=
ing.
- [High] Calling of_irq_get() inside an asynchronous firmware load callback=
 prevents handling -EPROBE_DEFER.
- [High] Failures in wave6_vpu_init_work_buf() are ignored, leading to a br=
oken VPU boot state.
- [High] wave6_vpu_detach_pm_domains() destroys PM domain virtual devices b=
efore the devm-managed thermal cooling device is unregistered, creating a U=
AF window.
- [High] The driver frees the IRQ kfifo before disabling the IRQ during cor=
e removal, leading to Use-After-Free.
- [Medium] Conditionally calling pm_runtime_put_sync() based on pm_runtime_=
suspended() leaks the usage counter.
- [Medium] Checking dma_addr against 0 to determine validity skips unmappin=
g on platforms where 0 is a valid DMA address.
--

commit e4a2fe67f6aa37393c77f5308ac691953a00a6e8
Author: Nas Chung <nas.chung@chipsnmedia.com>
Subject: media: chips-media: wave6: Add Wave6 control driver

This commit adds the control driver for the Chips&Media Wave6 video codec I=
P.
It handles the control region and manages shared resources such as firmware
loading, memory allocation, and the creation of wave6-core child devices.

> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu.c b/drive=
rs/media/platform/chips-media/wave6/wave6-vpu.c
> new file mode 100644
> index 0000000000000..c6efc45781833
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.c
[ ... ]
> +static void wave6_vpu_remap_code_buf(struct wave6_vpu_device *vpu)
> +{
> +	dma_addr_t code_base =3D vpu->code_buf.dma_addr;
> +	u32 i, reg_val;
> +
> +	for (i =3D 0; i < wave6_vpu_get_code_buf_size(vpu) / W6_MAX_REMAP_PAGE_=
SIZE; i++) {

[Severity: High]
Does this code silently truncate the firmware code buffer during memory
remapping?

If the buffer size is not an exact multiple of W6_MAX_REMAP_PAGE_SIZE,
the integer division will discard the remainder and the tail end of the
buffer will not be mapped. If the firmware requires the unmapped tail,
could the VPU encounter a memory fault?

[ ... ]
> +static int wave6_vpu_init_vpu(struct wave6_vpu_device *vpu,
> +			      struct vpu_core_device *core)
> +{
[ ... ]
> +init_done:
> +	wave6_vpu_init_work_buf(vpu, core);
> +	wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_ON);
> +
> +	return 0;
> +}

[Severity: High]
Is the return value of wave6_vpu_init_work_buf() intentionally ignored here?

If wave6_vpu_wait_busy() or wave6_vpu_check_result() fails inside
wave6_vpu_init_work_buf(), it will return early without setting
vpu->work_buffers_avail. Because the failure is ignored, the VPU state
transitions to WAVE6_VPU_STATE_ON anyway, and later requests for work
buffers might feed uninitialized addresses to the hardware.

[ ... ]
> +static void wave6_vpu_put(struct wave6_vpu_device *vpu,
> +			  struct vpu_core_device *core)
> +{
[ ... ]
> +	wave6_vpu_sleep(vpu, core);
> +
> +	if (!pm_runtime_suspended(vpu->dev))
> +		pm_runtime_put_sync(vpu->dev);
> +}

[Severity: Medium]
Could this conditional check cause the runtime PM usage counter to leak?

If the device's status is forcefully set to suspended, for example via
pm_runtime_force_suspend() during system sleep, pm_runtime_suspended()
will return true and this check will skip the put operation, leaving the
counter permanently incremented.

[ ... ]
> +static void wave6_vpu_require_work_buffer(struct wave6_vpu_device *vpu,
> +					  struct vpu_core_device *core)
> +{
[ ... ]
> +	if (WARN_ON(vpu->work_buffers_avail =3D=3D 0))
> +		goto exit;
> +
> +	vpu->work_buffers_avail--;
> +	vb =3D &vpu->work_buffers[vpu->work_buffers_avail];

[Severity: Critical]
Is there a data race when accessing the work buffers pool?

Since wave6_vpu_require_work_buffer() modifies vpu->work_buffers_avail
without a lock, and wave6_vpu_core_irq() can call this from a hardirq
context across multiple child cores concurrently, could this result in
an array out-of-bounds access or assigning the exact same DMA buffer to
multiple instances?

[ ... ]
> +static int wave6_vpu_create_cores(struct wave6_vpu_device *vpu)
> +{
[ ... ]
> +		irq =3D of_irq_get(child, 0);
> +		if (irq < 0) {
> +			dev_warn(vpu->dev, "%pOF: missing interrupts property\n", child);
> +			continue;
> +		}

[Severity: High]
Does this error handling prevent the driver from properly handling probe
deferral?

Because wave6_vpu_create_cores() executes in the asynchronous firmware load=
er
worker context, returning -EPROBE_DEFER here won't defer the probe process.
If the IRQ controller probes later, the core device might be permanently
ignored instead of waiting for the controller.

[ ... ]
> +static void wave6_vpu_release(struct wave6_vpu_device *vpu)
> +{
> +	guard(mutex)(&vpu->lock);
> +
> +	vpu->fw_available =3D false;
> +	wave6_vpu_destroy_cores(vpu);
> +	wave6_vpu_free_work_buffers(vpu);

[Severity: Critical]
Can holding vpu->lock during core destruction result in a self-deadlock?

When wave6_vpu_destroy_cores() unregisters the core devices, the child
removal triggers pm_runtime_disable() which blocks via __pm_runtime_barrier=
()
waiting for ongoing PM transitions. If another thread is executing
wave6_vpu_put() or wave6_vpu_get() inside a runtime PM callback, it will
block trying to acquire vpu->lock, causing a deadlock.

[Severity: Critical]
Are the work buffers and SRAM DMA memory freed while the VPU hardware
might still be accessing them?

This function explicitly frees the DMA memory, but it doesn't appear to send
a sleep command, disable the PM runtime properly, or assert a hardware reset
first. If the hardware is still active, could it continue performing DMA in=
to
the kernel memory that was just released?

[Severity: High]
When wave6_vpu_destroy_cores() tears down the core devices, does the
sub-driver wave6-vpu-core.c free the IRQ kfifo before disabling the IRQ?

Looking at wave6_vpu_core_remove(), it calls kfifo_free(&core->irq_fifo)
manually. Since devm_request_threaded_irq() is used, the IRQ is only
disabled after the remove routine completes. If an interrupt fires during
this window, the IRQ handler might call kfifo_in() on a freed structure.

[ ... ]
> +	if (vpu->code_buf.dma_addr)
> +		dma_unmap_resource(vpu->dev,
> +				   vpu->code_buf.dma_addr,

[Severity: Medium]
Is it safe to check the DMA address against 0 to determine if it is valid?

On architectures where 0 is a valid DMA address, this condition will
evaluate to false, which would skip the dma_unmap_resource() call and
permanently leak the mapping.

[ ... ]
> +static void wave6_vpu_load_firmware(const struct firmware *fw, void *con=
text)
> +{
> +	struct wave6_vpu_device *vpu =3D context;
> +
> +	guard(mutex)(&vpu->lock);

[Severity: High]
Can this asynchronous callback trigger a use-after-free if the device is
unbound?

If the device is unbound via sysfs while the firmware load is still pending,
devres will free the devm-allocated vpu structure. Because there is no
cancellation mechanism on unbind, the callback might execute later and
dereference the freed vpu pointer when trying to acquire the lock.

[ ... ]
> +static int wave6_vpu_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	vpu->sram_pool =3D of_gen_pool_get(pdev->dev.of_node, "sram", 0);
> +	if (vpu->sram_pool) {
> +		vpu->sram_buf.size =3D vpu->res->sram_size;
> +		vpu->sram_buf.vaddr =3D gen_pool_dma_alloc(vpu->sram_pool,
> +							 vpu->sram_buf.size,
> +							 &vpu->sram_buf.phys_addr);

[Severity: High]
Is the third argument to gen_pool_dma_alloc() using the correct pointer typ=
e?

The function gen_pool_dma_alloc() expects a dma_addr_t pointer for its
third argument, but here it receives a phys_addr_t pointer. On 32-bit
platforms where phys_addr_t and dma_addr_t have different sizes, could this
overwrite adjacent struct members? Furthermore, it returns a device DMA
address which is later passed to dma_map_resource() as if it were a physical
address.

[ ... ]
> +	ret =3D firmware_request_nowait_nowarn(THIS_MODULE,
> +					     vpu->res->fw_name,
> +					     &pdev->dev,
> +					     GFP_KERNEL,
> +					     vpu,
> +					     wave6_vpu_load_firmware);

[Severity: High]
Does this firmware request need a cancellation mechanism on unbind?

As noted above in wave6_vpu_load_firmware(), without a way to cancel
the pending firmware request or hold a reference to the vpu structure,
an unbind operation could lead to a use-after-free when the callback
eventually runs.

[ ... ]
> +static void wave6_vpu_remove(struct platform_device *pdev)
> +{
> +	struct wave6_vpu_device *vpu =3D dev_get_drvdata(&pdev->dev);
> +
> +	pm_runtime_disable(vpu->dev);
> +	wave6_vpu_release(vpu);
> +	wave6_vpu_detach_pm_domains(vpu);
> +}

[Severity: High]
Does disabling the PM runtime prematurely here leak clock enable references?

When pm_runtime_disable() is called before the child cores are released via
wave6_vpu_release(), the parent's PM runtime is disabled. When the child
cores subsequently drop their references to the parent device, the parent's
runtime_suspend callback won't execute, which might leave the hardware
clocks running indefinitely.

[Severity: High]
Does detaching the PM domains here create a use-after-free window for
the thermal cooling device?

wave6_vpu_detach_pm_domains() destroys the PM domain virtual devices.
However, the thermal cooling device, which uses one of these virtual devices
as its parent, was registered with devm_ and won't be cleaned up until after
wave6_vpu_remove() returns. If a thermal event fires in that window, could
it access the freed virtual device?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624072043.238-=
1-nas.chung@chipsnmedia.com?part=3D8
