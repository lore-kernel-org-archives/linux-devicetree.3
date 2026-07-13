Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9F43E6DC9
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938425; cv=none; b=G38/kUWXyYoaKvUCGmWcEAFHMKUE1M17jNgs6a4tV08Eo/GXZAbfTzjo/G2ox5mVqlz8vcn1mv3GtV+C6/3cTHHkGPyLMYiADPuosIr3jAvWyzxG2oB/MgEMtPrkj1J2Jo+ppDxhSRvffpvcXj5t2gNZmjaZjl0DT67GLgbN41U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938425; c=relaxed/simple;
	bh=bpk/xbMEWVERN0KlXL+ty3Sn81xTB5G8moO0JIOdaJA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g3Vp9vQO2VyPVHBtrM85hJ+/o1IIRb3Qk71+gMaLNGjWHfdqFd0AShR4wlIAnHhWWCeaYLS8hZZBMr8Tb8R0+R11BsUelymxCy6fMaXePu35z5VeR35jlvtswDIy6+xsFC4hkxpYnHv6tPWyvxwroTaLVQFSKp8O7Au10i8E1Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hV1fjFJ1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hV1fjFJ1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E66F1F000E9;
	Mon, 13 Jul 2026 10:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783938418;
	bh=hZe15zYPdUye9I0OMZLcBD/n4bDqk38EemPiP6VraYo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hV1fjFJ18w3IJx5d/A0pj347tMpxwc3H7EOnAs9cs0xORDMjv1aCw3gzE6tNl4HHJ
	 50FMNMNqB3Y+8+BrypNyCqdG6BRffM0bgZnJLA1j8/eaAyz5cgr1mvZnDpCWrwKB6i
	 PSMiHnKWR4P7GNp7ehj9o5uLGNYA9cfm/uzqh6KfcxCAEq0E9NdbyyvrIPXv360RkM
	 3uLMYlL29nEV3OmU+napb8Eh1yNXepcuwObcScfTBTr94bWdsakYxBVFdeZzWupfv0
	 ILTFhXZ9AfEo6/WKYY8hl1Ah5kPgdJutkEXjiGfHEQPn1qdhXB25pP0CTypH9fUDvN
	 UwT2i29KZxhIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/10] drm/mediatek: Add Write DMA (WDMA) Engine for
 Writeback support
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260713095837.16590-11-angelogioacchino.delregno@collabora.com>
References: <20260713095837.16590-1-angelogioacchino.delregno@collabora.com>
 <20260713095837.16590-11-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 10:26:57 +0000
Message-Id: <20260713102658.2E66F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [Critical] Architectural Flaw: Writeback configuration is improperly plac=
ed in the input plane callback `layer_config`, causing dead code, list corr=
uption, and potential memory corruption.
- [High] Hardcoded register offset in `mtk_wdma_ddp_write_dst_addr` overwri=
tes the same register for all planes.
- [High] Accessing WDMA registers in `mtk_disp_wdma_bind` without enabling =
clocks or power domains causes a bus hang.
- [High] Writeback completion signaling is erroneously tied to CRTC vblank =
enablement, and the interrupt handler incorrectly returns `IRQ_NONE`.
- [High] Pending writeback jobs are permanently leaked if the CRTC is disab=
led or the component is unbound.
- [High] Race condition in writeback job queuing and signaling due to unpro=
tected `wb_pending` flag.
- [High] Direct MMIO write of the destination address during `atomic_commit=
` corrupts ongoing DMA writeback operations.
- [Medium] Multi-planar YUV formats incorrectly assume contiguous memory al=
locations for U and V planes.
- [Medium] Lockless access to `wdma->vblank_cb` in the IRQ handler can lead=
 to a NULL pointer dereference (TOCTOU).
--

--- Patch [10]: [PATCH v2 10/10] drm/mediatek: Add Write DMA (WDMA) Engine =
for Writeback support ---
commit bcba28b1b84d2c188344cc47c55787ee3fddf6b4
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: drm/mediatek: Add Write DMA (WDMA) Engine for Writeback support

This commit adds a driver for the MediaTek Write DMA (WDMA) engine,=20
hooking it up to the display component framework. This provides initial=20
writeback support for capturing display images on MT8173 and MT6893=20
devices.

> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_wdma.c b/drivers/gpu/drm/m=
ediatek/mtk_disp_wdma.c
> new file mode 100644
> index 0000000000000..a093d6d57f1a0
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_wdma.c
> @@ -0,0 +1,611 @@
[ ... ]
> +static irqreturn_t mtk_disp_wdma_irq_handler(int irq, void *dev_id)
> +{
> +	struct mtk_disp_wdma *wdma =3D dev_id;
> +
> +	/* Clear frame completion interrupt */
> +	writel(0x0, wdma->regs + DISP_REG_WDMA_INT_STATUS);
> +
> +	if (!wdma->vblank_cb)
> +		return IRQ_NONE;

[Severity: High]
Does this tie writeback completion signaling to vblank enablement? If
userspace queues a writeback job without requesting vblank events, the
vblank callback might be NULL. Returning IRQ_NONE here skips the subsequent
drm_writeback_signal_completion() call, which would strand the writeback
job indefinitely.

> +
> +	wdma->vblank_cb(wdma->vblank_cb_data);

[Severity: Medium]
Is there a TOCTOU race with the lockless access to the vblank callback?
Since mtk_wdma_unregister_vblank_cb() can clear wdma->vblank_cb without
synchronization, the compiler might fetch the pointer twice. If it gets
nullified between the check and the execution, could this cause a NULL
pointer dereference?

[ ... ]
> +void mtk_wdma_disable_vblank(struct device *dev)
> +{
> +	wdma_update_bits(dev, DISP_REG_WDMA_INT_ENABLE, WDMA_FRAME_COMPLETE_INT=
, 0);
> +}

[Severity: High]
Does disabling vblank also incorrectly disable the writeback completion
interrupt? If a writeback job is queued while vblank is disabled, the
hardware interrupt won't fire, leaving the writeback job permanently
hanging.

[ ... ]
> +void mtk_wdma_stop(struct device *dev)
> +{
> +	wdma_update_bits(dev, DISP_REG_WDMA_EN, WDMA_ENGINE_EN, 0);
> +}

[Severity: High]
When the hardware is stopped here, are pending writeback jobs properly
drained? If the display pipeline is stopped before a hardware frame
completes, the interrupt will never fire, which would permanently leak the
drm_writeback_job and its framebuffer reference.

[ ... ]
> +static void mtk_wdma_ddp_write_dst_addr(struct cmdq_pkt *cmdq_pkt, u64 v=
al,
> +					u8 reg_id, struct mtk_disp_wdma *wdma)
> +{
> +	mtk_ddp_write(cmdq_pkt, lower_32_bits(val), &wdma->cmdq_reg, wdma->regs,
> +		      DISP_REG_WDMA_DST_ADDRX(DISP_REG_WDMA_DST_ADDR_LSB, 1));

[Severity: High]
Does the hardcoded 1 here ignore the reg_id parameter? By passing 1
instead of reg_id to DISP_REG_WDMA_DST_ADDRX, the base address register
for the primary plane might be left uninitialized, and Y/U/V plane
addresses might overwrite each other.

[ ... ]
> +	/* Set U and V components destination addresses */
> +	mtk_wdma_ddp_write_dst_addr(cmdq_pkt, pending->addr + u_off, 1, wdma);
> +	mtk_wdma_ddp_write_dst_addr(cmdq_pkt, pending->addr + v_off, 2, wdma);

[Severity: Medium]
Does this calculation assume multi-planar YUV formats are always
contiguous in memory? The DRM subsystem allows multi-planar framebuffers to
have independent memory offsets or separate GEM objects per plane. Adding
an offset to the base address instead of using the framebuffer offsets
might lead to out-of-bounds writes if a disjoint framebuffer is provided.

[ ... ]
> +void mtk_wdma_layer_config(struct device *dev, unsigned int idx,
> +			   struct mtk_plane_state *state,
> +			   struct cmdq_pkt *cmdq_pkt)
> +{
[ ... ]
> +	mtk_wdma_format_config(wdma, pending, fmt_info, cmdq_pkt);
> +
> +	drm_writeback_queue_job(&wdma->wb_connector, wdma->wb_connector.base.st=
ate);
> +}

[Severity: Critical]
Is mtk_wdma_layer_config the correct place to configure writeback? This
callback is designed for input planes, but mtk_crtc_num_comp_planes
assigns 0 planes to components without bgclr_in_on at index >=3D 1. Since
WDMA is a writeback output, it receives 0 planes, making this function
dead code.

If this function were somehow called, would using pending->addr as the
write destination corrupt user memory, since pending->addr is an input read
address? Furthermore, since the job is already queued during the atomic
commit phase, calling drm_writeback_queue_job() again here with a NULL
conn_state->writeback_job would cause a list corruption NULL pointer
dereference.

[ ... ]
> +static void mtk_wdma_wb_connector_atomic_commit(struct drm_connector *co=
nnector,
> +						struct drm_atomic_commit *state)
> +{
[ ... ]
> +	/* Store writeback pending state before queuing the job */
> +	wdma->wb_pending =3D true;

[Severity: High]
Can setting wb_pending to true before placing the job into the queue
create a race condition with the interrupt handler? If a frame completion
interrupt fires in this narrow window, the handler might see wb_pending as
true, attempt to signal an empty queue, and clear the flag. The subsequent
job completion would then be ignored.

> +
> +	mtk_wdma_ddp_write_dst_addr(NULL, addr, 0, wdma);

[Severity: High]
Does writing the new destination address directly to hardware via MMIO
here corrupt ongoing DMA operations? Because mtk_wdma_config sets
WDMA_BYPASS_SHADOW, this unsynchronized address change takes effect
immediately. If this occurs mid-frame while the hardware is processing the
previous frame, could it scatter pixel data into the new buffer?

[ ... ]
> +static int mtk_disp_wdma_bind(struct device *dev, struct device *master,
> +			      void *data)
> +{
[ ... ]
> +	/* Disable and clear pending interrupts */
> +	writel(0x0, wdma->regs + DISP_REG_WDMA_INT_ENABLE);
> +	writel(0x0, wdma->regs + DISP_REG_WDMA_INT_STATUS);

[Severity: High]
Are the device clocks and power domains enabled before accessing these MMIO
registers? During the component bind phase, pm_runtime_get_sync() has not
been called and the component clocks are disabled. Writing to
DISP_REG_WDMA_INT_ENABLE while the peripheral is gated could instantly hang
the bus.

[ ... ]
> +static void mtk_disp_wdma_unbind(struct device *dev, struct device *mast=
er,
> +				 void *data)
> +{
> +	struct mtk_disp_wdma *wdma =3D dev_get_drvdata(dev);
> +
> +	disable_irq(wdma->irq);
> +}

[Severity: High]
Similar to mtk_wdma_stop(), are pending writeback jobs properly drained
during unbind? Disabling the IRQ while jobs may still be pending in the
queue prevents them from ever completing, causing tasks waiting on the
out-fence to hang indefinitely.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713095837.1659=
0-1-angelogioacchino.delregno@collabora.com?part=3D10
