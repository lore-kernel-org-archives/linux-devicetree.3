Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D7041D108
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 07:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788505533; cv=none; b=fJXX2Tc45SaxMLso5etqiscRQg3gSGd0+VZmaSNCJCnUh7/mYZEQFcr+FIoHTabn2MjXm9DvlvXP2ATNgOJ7OnxVkMDqi+NU3d8L4RC2tb2eAwWjjpFkF5EM1UTxSWLhPhwumYPV9pDpTw2zPeMlVsHOCAIxQvErKwuXUcihN40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788505533; c=relaxed/simple;
	bh=+zHrpq570MIeJzhAOE1XtbTWn45dFi/Qh3poLeJy/A8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R92OghsDL90RzNEaolFIjpVf5MnXgZCT+rDphfyZF2B4CzDdCPNi/zEeLMq7AIVkOI6GP6CA1m+XOBbg14xCb3jq8w4ZnpF41NQ7JwiG090/HeKlKY4hkhnRDT025k0HBNRj2cVPeQwnqj+HOJm747lEoNZRs8W923ZNHshfMlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jKD3sjlP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jKD3sjlP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 674551F00A3D;
	Fri,  4 Sep 2026 07:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788505531;
	bh=TQaFe8TSQ5Jl/V5sJ3hSGIQVSnhOaSfzsOE4dThfqeo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jKD3sjlP3pJEPtqzrLZv4PPa69lPlWIPOqrPMu+oCX/If84PONhI72dR598hD7l81
	 p1kqN3g05mZru2/pJD2UFe6uQTg/hBY/YALEngwBD0mT7xSo5goS9oJzkaLZtrY71k
	 4QhzIl/mw+iu2vccb8/ODhUly+Bvh4QTOqbkFljSdhs+kX51IbYqIZVIywxO+YUJqC
	 UBWbXrQS7QFgds4F1tmz9ZarahQmFE4gC7LAl1o+hfcKYjyJKyqCViKnrobt094S8N
	 YgLQbHInEtu0k5P9drERV/ThQYDMfy7rrsr3RCMgIwtKsH1hqtqIvd/JzIL1LFav9O
	 VQ8S19AzRr4Cw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 8/9] media: chips-media: wave6: Add Wave6 control
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nas Chung" <nas.chung@chipsnmedia.com>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <9a39dbcd48c8326394992cc048a635fb2472537e.1788496816.git.nas.chung@chipsnmedia.com>
References: <cover.1788496816.git.nas.chung@chipsnmedia.com>
 <9a39dbcd48c8326394992cc048a635fb2472537e.1788496816.git.nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 07:05:31 +0000
Message-Id: <20260904070531.674551F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] Data race on shared work_buffers_avail counter leads to DMA memory=
 corruption.
- [High] Incompatible pointer type passed to `gen_pool_dma_alloc` causes st=
ructure memory corruption and invalid DMA mappings.
- [High] Use-after-free of the driver device structure in the async firmwar=
e load callback on unbind.
- [High] System deadlock caused by holding the parent's mutex while synchro=
nously unregistering child devices.
- [High] Failure in work buffer initialization leaves the VPU state machine=
 permanently corrupted.
- [High] Auxiliary power domains are never powered on because they lack dev=
ice links.
- [Medium] Leaked runtime PM usage counter due to an improper conditional c=
heck on device suspend state.
- [Medium] Using a value of 0 to validate a DMA mapping leads to an IOMMU r=
esource leak.
- [Medium] Mixing scoped guards with goto-based error handling violates ker=
nel cleanup API rules.
--

commit 373df31fcd64a0ed065b0d792d9b1dac72e53fd5
Author: Nas Chung <nas.chung@chipsnmedia.com>
Subject: media: chips-media: wave6: Add Wave6 control driver

This commit adds the control driver for the Chips&Media Wave6 video codec I=
P.
It manages shared resources, firmware memory allocation, and power states f=
or
the child core devices.

> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.c
[ ... ]
> +static int wave6_vpu_init_vpu(struct wave6_vpu_device *vpu,
> +			      struct vpu_core_device *core)
> +{
[ ... ]
> +	wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_PREPARE);
[ ... ]
> +init_done:
> +	ret =3D wave6_vpu_init_work_buf(vpu, core);
> +	if (ret)
> +		return ret;

[Severity: High]
If wave6_vpu_init_work_buf() fails here, the function returns immediately
without resetting vpu->state. Will this leave the driver permanently in
WAVE6_VPU_STATE_PREPARE, causing subsequent attempts to boot to skip the in=
it
sequence?

> +
> +	wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_ON);
> +
> +	return 0;
> +}
[ ... ]
> +static int wave6_vpu_get(struct wave6_vpu_device *vpu,
> +			 struct vpu_core_device *core)
> +{
> +	int ret;
> +
> +	if (WARN_ON(!vpu || !core))
> +		return -EINVAL;
> +
> +	guard(mutex)(&vpu->lock);
> +
> +	if (!vpu->fw_available)
> +		return -EINVAL;
[ ... ]
> +	ret =3D wave6_vpu_try_boot(vpu, core);
> +	if (ret)
> +		goto error_boot;
> +
> +	return 0;
> +
> +error_boot:
> +	pm_runtime_put_sync(vpu->dev);
> +error_pm:

[Severity: Medium]
Does this mix goto-based error handling with guard() cleanup in the same
function? The kernel cleanup API expects that a function either uses scoped
guards entirely or goto entirely to prevent confusing ownership and cleanup
ordering.

> +	atomic_dec(&vpu->core_count);
> +
> +	return ret;
> +}
> +
> +static void wave6_vpu_put(struct wave6_vpu_device *vpu,
> +			  struct vpu_core_device *core)
> +{
[ ... ]
> +	guard(mutex)(&vpu->lock);

[Severity: High]
Will this cause a system deadlock when the parent unregisters child devices?
During wave6_vpu_release(), the parent takes vpu->lock and triggers core
destruction. The child's remove callback will then try to put the VPU, lead=
ing
back into this function which attempts to acquire the exact same lock.

> +
> +	if (!vpu->fw_available)
> +		return;
[ ... ]
> +	wave6_vpu_sleep(vpu, core);
> +
> +	if (!pm_runtime_suspended(vpu->dev))
> +		pm_runtime_put_sync(vpu->dev);

[Severity: Medium]
Does conditionally skipping the put operation cause a usage counter leak?
If the device was suspended by other system events, skipping this symmetric=
al
put prevents the device from ever entering lower power states in the future.

> +}
> +
> +static void wave6_vpu_require_work_buffer(struct wave6_vpu_device *vpu,
> +					  struct vpu_core_device *core)
> +{
> +	struct vpu_buf *vb;
> +	u32 size;
[ ... ]
> +	if (WARN_ON(vpu->work_buffers_avail =3D=3D 0))
> +		goto exit;
> +
> +	vpu->work_buffers_avail--;
> +	vb =3D &vpu->work_buffers[vpu->work_buffers_avail];

[Severity: High]
Is there a data race on the work_buffers_avail counter here? If multiple
VPU cores trigger requests concurrently without holding vpu->lock, could the
counter underflow and lead to an out-of-bounds array access that corrupts D=
MA
memory?

> +
> +	wave6_vdi_writel(core->reg_base, W6_CMD_SET_WORK_BUF_ADDR, vb->daddr);
> +
> +exit:
> +	wave6_vdi_writel(core->reg_base, W6_CMD_SET_WORK_BUF_SIZE, SET_WORK_BUF=
_SIZE_ACK);
> +}
[ ... ]
> +static void wave6_vpu_release(struct wave6_vpu_device *vpu)
> +{
> +	guard(mutex)(&vpu->lock);
> +
> +	vpu->fw_available =3D false;
> +	wave6_vpu_destroy_cores(vpu);
> +	wave6_vpu_free_work_buffers(vpu);
> +	if (vpu->sram_pool && vpu->sram_buf.vaddr) {
[ ... ]
> +	}
> +	if (vpu->code_buf.dma_addr)
> +		dma_unmap_resource(vpu->dev,

[Severity: Medium]
Could this condition leak valid IOMMU mappings if the DMA allocator returns=
 0?
Since 0 is a valid DMA address on many platforms, skipping the unmap when t=
he
address evaluates to false can lead to a resource leak.

> +				   vpu->code_buf.dma_addr,
> +				   vpu->code_buf.size,
> +				   DMA_BIDIRECTIONAL,
> +				   0);
> +}
> +
> +static void wave6_vpu_load_firmware(const struct firmware *fw, void *con=
text)
> +{
> +	struct wave6_vpu_device *vpu =3D context;
> +
> +	guard(mutex)(&vpu->lock);

[Severity: High]
Can this cause a use-after-free if the device unbinds while firmware loading
is in progress? If the driver is removed and devres frees the vpu memory,
this async callback might try to acquire a mutex that resides in freed memo=
ry.

> +
> +	if (!fw || !fw->data) {
[ ... ]
> +	if (fw->size + W6_EXTRA_CODE_BUF_SIZE > wave6_vpu_get_code_buf_size(vpu=
)) {
> +		dev_err(vpu->dev, "firmware size (%zd > %zd) is too big\n",
> +			fw->size, vpu->code_buf.size);
> +		vpu->fw_available =3D false;
> +		goto exit;

[Severity: Medium]
Is this mixing goto-based error handling and scoped guard cleanup again? Th=
is
violates the cleanup API guidelines.

> +	}
[ ... ]
> +static int wave6_vpu_attach_pm_domains(struct wave6_vpu_device *vpu)
> +{
> +	int ret;
[ ... ]
> +	if (vpu->num_pm_domains =3D=3D 1) {
> +		/* genpd_dev_pm_attach() attach automatically if count is 1 */
> +		vpu->num_pm_domains =3D 0;
> +		return 0;
> +	}
> +
> +	ret =3D dev_pm_domain_attach_list(vpu->dev, NULL, &vpu->pd_list);

[Severity: High]
By passing NULL for the data parameter, does this skip creating device links
for the auxiliary domains? Without DL_FLAG_PM_RUNTIME links, the PM core wo=
n't
power on these domains during runtime, which might lead to exceptions when
accessing unpowered hardware registers.

> +	if (ret < 0) {
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
> +		if (!vpu->sram_buf.vaddr) {
> +			vpu->sram_buf.size =3D 0;
> +		} else {
> +			vpu->sram_buf.dma_addr =3D dma_map_resource(&pdev->dev,
> +								  vpu->sram_buf.phys_addr,

[Severity: High]
gen_pool_dma_alloc() expects a dma_addr_t pointer for its third argument to
write back the DMA address, but a phys_addr_t pointer is being passed here.
Could this cause out-of-bounds memory corruption on architectures where the
sizes differ? Additionally, is the returned DMA address being incorrectly
passed to dma_map_resource() as if it were a physical address?

> +								  vpu->sram_buf.size,
> +								  DMA_BIDIRECTIONAL,
> +								  0);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788496816.gi=
t.nas.chung@chipsnmedia.com?part=3D8
