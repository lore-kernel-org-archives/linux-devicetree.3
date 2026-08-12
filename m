Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68163033F8
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 03:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786503848; cv=none; b=mSOp6z9wFzFBhNEW0yi0C3luP1lB8pg7lA8lF6pq8wZO+9gCoPXD/m/FwIFneUADbgfWrVZ3iFyhUruOdGcE0ocNOwkwYcsVP7SOrePsVFNzTz/EhjTF8C906TM/CCRefhnjijpQ0L5ZWbooZtHIR0KD+vrXfqw34SZu3l2VPHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786503848; c=relaxed/simple;
	bh=MQKK5JxaEoWuR9m1/+diZi3TNHlm7/0zv73VzjL6GOs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=thuOBttyM3+5fd05nP8OF3KHOm3ziYGmTsuH9FWUsXz0LJOWoZRbn4nocKR9LA6vRVqsvWhzxHxx8h5eSzWaQrk3MT9+NhmddnXxDaReqdKOiXGkQ5AtH7uPu3lorAZdYcp3hdSnFMAgKGhNctbEHSCNi516Mb4gw73wjuLLK4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PtxRbljh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PtxRbljh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFAFD1F000E9;
	Wed, 12 Aug 2026 03:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786503846;
	bh=pycxU543XN7qwtxxsAjU6N59CasYVXqBRsX4jrr615Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PtxRbljhJzDF/4PZv3P59HEPJEqjV0KFih8R+RzTAu/F2nZ85lvLpZwxiIPU06Hgt
	 wNQC6FbXv906dSct/3L/AEoB1MEk2epDis8O1ZufMggDezDwPAq/+qIJmoKSFGkH1I
	 5Q25SCZQMQPe/zj6feB96gvXMBM86f+VesQJj+1euAmrLPWtZ8fbDYTxn0QcWboIla
	 FQDoZ1kdgMdUooJHyijkfGt3QH+hE3EtDGA9w+hAHSLJ6PdNZ69O6S94GXW3QWW4qc
	 bVEwuF5F0jfyx5WBymvSnZ4TGFBlpoKdZK+LK4YbwfXOrZ5I2UTmOiw/vvLRKxGpwK
	 DMzCEYK1S7l8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/6] decoder: Add V4L2 stateless H.264 decoder driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, linux-amlogic@lists.infradead.org, media-ci@linuxtv.org
In-Reply-To: <20260812-b4-s4-vdec-upstream-v7-4-3fae085861bd@amlogic.com>
References: <20260812-b4-s4-vdec-upstream-v7-0-3fae085861bd@amlogic.com>
 <20260812-b4-s4-vdec-upstream-v7-4-3fae085861bd@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 03:04:05 +0000
Message-Id: <20260812030405.EFAFD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 22 potential issue=
(s) to consider:
- [Critical] Unvalidated SPS dimensions cause a 32-bit integer overflow, re=
sulting in an undersized CMA buffer and massive out-of-bounds DMA writes.
- [Critical] Array bounds writes during reference list reordering allows ma=
ssive heap corruption.
- [Critical] Trusting V4L2 PPS control fields allows a heap overflow via `c=
lear_unused_col_buf`.
- [Critical] Dynamic resolution changes bypass DMA buffer reallocation, cau=
sing the hardware to overflow the colocated CMA buffer.
- [High] Use-after-free of V4L2 M2M context and driver resources due to inc=
orrect teardown order and devres usage in `aml_vdec_drv_remove`.
- [High] TOCTOU race in `vdec_threaded_isr_handler` leads to NULL pointer d=
ereference of `curr_ctx` and `v4l2_m2m_next_dst_buf`.
- [High] Error path in `get_firmware` incorrectly returns 0 on undersized f=
irmware, passing uninitialized stack memory to the TEE API.
- [High] Hardware VIFIFO Write Pointer is programmed with a physical offset=
 beyond the allocated V4L2 buffer bounds, causing out-of-bounds DMA reads.
- [High] Improper error handling of `of_parse_phandle` allows `sec_fw` to r=
emain NULL, causing a kernel panic.
- [High] Sleeping in `device_run` stalls the shared V4L2 M2M worker thread.
- [High] Double free of the video device object `vfd_dec` on error paths in=
 `aml_vdec_drv_probe`.
- [High] Missing reset of `ctx->int_cond` causes subsequent hardware decode=
 waits to complete prematurely.
- [High] `fops_vcodec_release` frees the control handler before releasing t=
he M2M context, causing active jobs to access freed controls.
- [High] Failing to validate an unallocated Canvas POC allows an out-of-bou=
nds MMIO register write, letting an attacker tamper with adjacent device re=
gisters.
- [High] Data race between hardware wait timeout/signal handling and the th=
readed IRQ handler.
- [High] The hard IRQ handler accesses regmap over MMIO without `.use_raw_s=
pinlock =3D true`, triggering a 'sleeping in atomic context' BUG on PREEMPT=
_RT kernels.
- [Medium] Overwriting `meson_canvas_alloc` return values bypasses error ch=
ecking, leading to canvas corruption and double-frees.
- [Medium] The driver ignores `num_ref_idx_l1_active_minus1` overrides in B=
-slices, violating the H.264 specification.
- [Medium] Hardware power domains and clocks are unconditionally enabled pe=
rmanently during probe.
- [Medium] Power domains and device links are leaked if hardware resource i=
nitialization fails.
- [Medium] The `v4l2_ctrl_handler` memory is leaked if `v4l2_ctrl_handler_s=
etup` fails.
- [Low] Kconfig unconditionally selects `MESON_CANVAS`, risking unmet direc=
t dependency warnings under `COMPILE_TEST`.
--

--- Patch [4]: [PATCH v7 4/6] decoder: Add V4L2 stateless H.264 decoder dri=
ver ---
commit b11f2b7369a2bd8b856bd77ca3082b77fefa66fe
Author: Zhentao Guo <zhentao.guo@amlogic.com>
Subject: decoder: Add V4L2 stateless H.264 decoder driver

This commit adds the initial support for the V4L2 stateless video decoder
driver on the Amlogic S4 platform. It currently supports 8-bit progressive
H.264 bitstream decoding.

> diff --git a/drivers/media/platform/amlogic/vdec/Kconfig b/drivers/media/=
platform/amlogic/vdec/Kconfig
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/Kconfig
> @@ -0,0 +1,18 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +
> +config VIDEO_AMLOGIC_VDEC
> +    tristate "Amlogic Video Decoder Driver"
> +    depends on ARCH_MESON || COMPILE_TEST
> +    depends on VIDEO_DEV
> +    depends on V4L_MEM2MEM_DRIVERS
> +    depends on TEE
> +    depends on MESON_SM
> +    select VIDEOBUF2_DMA_CONTIG
> +    select V4L2_H264
> +    select V4L2_MEM2MEM_DEV
> +    select MESON_CANVAS

[Severity: Low]
Does selecting MESON_CANVAS unconditionally here risk unmet direct
dependency warnings under COMPILE_TEST? Since VIDEO_AMLOGIC_VDEC supports
COMPILE_TEST, it could be built on architectures where MESON_CANVAS
dependencies are not met.

> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_drv.c b/drivers=
/media/platform/amlogic/vdec/aml_vdec_drv.c
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_drv.c
> @@ -0,0 +1,231 @@
[ ... ]
> +static int fops_vcodec_open(struct file *file)
> +{
[ ... ]
> +	ret =3D aml_vdec_ctrls_setup(ctx);
> +	if (ret) {
> +		v4l2_err(&dec_dev->v4l2_dev, "Failed to init all ctrls (%d)", ret);
> +		goto err_ctrls_setup;
> +	}
> +
> +	aml_vdec_reset_fmts(ctx);
> +	mutex_unlock(&dec_dev->dev_mutex);
> +
> +	return ret;
> +
> +err_ctrls_setup:
> +	v4l2_m2m_ctx_release(ctx->m2m_ctx);
> +err_m2m_ctx_init:
> +	v4l2_fh_del(&ctx->fh, file);
> +	v4l2_fh_exit(&ctx->fh);
> +	kfree(ctx);
> +	mutex_unlock(&dec_dev->dev_mutex);
> +
> +	return ret;
> +}

[Severity: Medium]
Is there a missing call to v4l2_ctrl_handler_free in the err_ctrls_setup
path in fops_vcodec_open? If v4l2_ctrl_handler_setup fails during
aml_vdec_ctrls_setup, it returns an error but does not free the handler.
This error path also skips cleaning it up, which looks like it would
permanently leak the handler's internal allocations.

[ ... ]
> +static int fops_vcodec_release(struct file *file)
> +{
> +	struct aml_vdec_ctx *ctx =3D fh_to_dec_ctx(file);
> +
> +	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
> +	v4l2_m2m_ctx_release(ctx->m2m_ctx);
> +	v4l2_fh_del(&ctx->fh, file);
> +	v4l2_fh_exit(&ctx->fh);
> +	kfree(ctx);
> +
> +	return 0;
> +}

[Severity: High]
Could freeing the control handler before releasing the M2M context cause
a use-after-free in fops_vcodec_release?

The M2M context release performs a blocking wait to cancel active jobs.
If the worker thread is still executing or sleeping in aml_h264_dec_run,
it will eventually finish and call v4l2_ctrl_request_complete. This
would access the poisoned control lists since v4l2_ctrl_handler_free
has already destroyed them.

[ ... ]
> +static int aml_vdec_drv_probe(struct platform_device *pdev)
> +{
> +	struct aml_vdec_dev *dev;
> +	struct video_device *vfd_dec;
> +	struct aml_vdec_hw *hw;
> +	int ret =3D 0;
> +
> +	dev =3D devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);

[Severity: High]
Should the aml_vdec_dev structure's lifetime be tied to the V4L2 object
instead of the device binding in aml_vdec_drv_probe?

By using devres, the structure is freed when the device unbinds. However,
userspace could still hold an open file descriptor to the video device,
allowing subsequent ioctls or close operations to access the freed
m2m_dev_dec and dev_mutex via the dangling ctx->dev pointer.

[ ... ]
> +	ret =3D media_device_register(&dev->mdev);
> +	if (ret) {
> +		v4l2_err(&dev->v4l2_dev, "Failed to register media device");
> +		goto err_media_dev_register;
> +	}
> +	vdec_enable(dev->dec_hw);
> +	return 0;

[Severity: Medium]
Does aml_vdec_drv_probe keep the hardware power domain and clocks
permanently enabled while the driver is loaded?

Calling vdec_enable here synchronously powers on the domain and enables
the clocks indefinitely. It might be better to integrate this with
Runtime PM so the hardware can power down when not actively decoding.

[ ... ]
> +err_media_dev_register:
> +	v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
> +error_m2m_mc_register:
> +	media_device_cleanup(&dev->mdev);
> +	video_unregister_device(dev->vfd);
> +err_vid_dev_register:
> +	v4l2_m2m_release(dev->m2m_dev_dec);
> +err_m2m_dev_init:
> +	dev->pvdec_data->destroy_hw_resource(dev);
> +err_hw_init:
> +	dev->dec_hw =3D NULL;
> +err_dec_mem_init:
> +	video_device_release(vfd_dec);
> +err_device_alloc:
> +	v4l2_device_unregister(&dev->v4l2_dev);
> +	return ret;
> +}

[Severity: High]
Can the err_dec_mem_init path in aml_vdec_drv_probe cause a double free
of the video device object?

If an error occurs after successful video device registration, the code
falls through error_m2m_mc_register and calls video_unregister_device,
which drops the refcount and invokes the release callback to kfree vfd_dec.
Continuing to fall through to err_dec_mem_init then calls
video_device_release(vfd_dec), which would kfree the exact same pointer.

[ ... ]
> +static void aml_vdec_drv_remove(struct platform_device *pdev)
> +{
> +	struct aml_vdec_dev *dev =3D platform_get_drvdata(pdev);
> +
> +	vdec_disable(dev->dec_hw);
> +
> +	media_device_unregister(&dev->mdev);
> +	v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
> +	media_device_cleanup(&dev->mdev);
> +
> +	v4l2_m2m_release(dev->m2m_dev_dec);
> +	video_unregister_device(dev->vfd);
> +	dev->pvdec_data->destroy_hw_resource(dev);
> +	v4l2_device_unregister(&dev->v4l2_dev);
> +}

[Severity: High]
Does releasing the M2M context before unregistering the video device
in aml_vdec_drv_remove create a race condition?

If a userspace application is concurrently calling ioctls while the driver
is being removed, they might access the freed M2M context before the
video device is fully torn down by video_unregister_device.

> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c b/drivers/=
media/platform/amlogic/vdec/aml_vdec_hw.c
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c
[ ... ]
> +static irqreturn_t vdec_threaded_isr_handler(int irq, void *priv)
> +{
> +	struct aml_vdec_dev *dev =3D (struct aml_vdec_dev *)priv;
> +	struct aml_vdec_hw *hw =3D dev->dec_hw;
> +	irqreturn_t ret =3D IRQ_HANDLED;
> +
> +	if (hw->hw_ops.irq_threaded_func && hw->curr_ctx)
> +		ret =3D hw->hw_ops.irq_threaded_func(irq, priv);
> +
> +	return ret;
> +}

[Severity: High]
Is it safe to check hw->curr_ctx in vdec_threaded_isr_handler without
holding any locks?

Concurrently, aml_h264_dec_run can set hw->curr_ctx to NULL upon a timeout
or signal. If the context is cleared immediately after this check passes,
the threaded ISR would dereference a NULL pointer.

[ ... ]
> +static const struct regmap_config dos_regmap_conf =3D {
> +	.reg_bits =3D 32,
> +	.val_bits =3D 32,
> +	.reg_stride =3D 4,
> +	.max_register =3D 0x10000,
> +};

[Severity: High]
Should the dos_regmap_conf configuration include .use_raw_spinlock =3D true?

Without it, the regmap uses a standard spinlock, which becomes a
sleepable mutex on PREEMPT_RT kernels. Since h264_isr calls regmap_write
from the primary hard IRQ handler context, taking a sleepable lock here
will cause a sleeping in atomic context BUG on RT.

[ ... ]
> +int dev_request_hw_resources(void *priv)
> +{
[ ... ]
> +	if (hw->pm->init) {
> +		ret =3D hw->pm->init(hw);
> +		if (ret < 0) {
> +			dev_err(&pdev->dev, "power mgr init failed!\n");
> +			return ret;
> +		}
> +	}
> +
> +	ret =3D vdec_clock_gate_init(hw);
> +	if (ret) {
> +		dev_err(&pdev->dev, "clk bulk init failed!\n");
> +		return ret;
> +	}

[Severity: Medium]
If vdec_clock_gate_init or aml_tee_fw_preload fails in
dev_request_hw_resources, we return early. Should we call
hw->pm->release(hw) in the error path to tear down the PM domain we just
successfully attached, to avoid permanently leaking it?

[ ... ]
> +	sm_np =3D of_parse_phandle(pdev->dev.of_node, "secure-monitor", 0);
> +	if (IS_ERR_OR_NULL(sm_np))
> +		return PTR_ERR(sm_np);

[Severity: High]
Does IS_ERR_OR_NULL mask the error when of_parse_phandle fails in
dev_request_hw_resources?

of_parse_phandle returns NULL on failure. PTR_ERR(NULL) evaluates to 0,
so dev_request_hw_resources would silently succeed while leaving
hw->sec_fw uninitialized. Later, load_firmware would pass this NULL
pointer to meson_sm_call, causing a kernel panic.

> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c b/driv=
ers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c
[ ... ]
> +static int get_firmware(const char *path, void **data, size_t *size)
> +{
> +	const struct firmware *fw =3D NULL;
> +	int ret;
> +	void *buf;
> +
> +	ret =3D request_firmware(&fw, FIRMWARE_PATH, NULL);
> +	if (ret || fw->size <=3D UCODE_HEADER_SIZE)
> +		return ret;

[Severity: High]
If the firmware size is less than or equal to UCODE_HEADER_SIZE in
get_firmware, this returns 0 (since ret is 0 here) but doesn't initialize
the data or size output pointers.

This causes the caller, pass_firmware_to_tee, to believe it succeeded
and invoke the TEE API with uninitialized stack memory, eventually
calling kfree on an uninitialized pointer.

> diff --git a/drivers/media/platform/amlogic/vdec/h264.c b/drivers/media/p=
latform/amlogic/vdec/h264.c
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/h264.c
[ ... ]
> +static int h264_prepare_input(struct aml_vdec_ctx *ctx)
> +{
[ ... ]
> +	dummy =3D payload_size + VLD_PADDING_SIZE;
> +	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_WP,
> +		     round_down((src_dma + dummy), VDEC_FIFO_ALIGN));

[Severity: High]
Could the dummy calculation in h264_prepare_input cause out-of-bounds
DMA reads?

We program the hardware write pointer to
src_dma + payload_size + VLD_PADDING_SIZE. If userspace sets sizeimage
equal to payload_size, this physical offset points beyond the memory
allocated for the CMA buffer.

[ ... ]
> +static void config_sps_params(struct aml_h264_ctx *h264_ctx,
> +			      unsigned short *sps_base,
> +			      const struct v4l2_ctrl_h264_sps *sps)
> +{
[ ... ]
> +	h264_ctx->mb_width =3D (sps->pic_width_in_mbs_minus1 + 4) & 0xfffffffc;
> +	h264_ctx->mb_height =3D (sps->pic_height_in_map_units_minus1 + 4) & 0xf=
ffffffc;
> +
> +	h264_ctx->mb_total =3D h264_ctx->mb_width * h264_ctx->mb_height;

[Severity: Critical]
Are the mb_width and mb_height dimensions validated against maximum
limits in config_sps_params?

Userspace can provide arbitrary values for the width and height.
Extremely large values cause mb_total * 96 in alloc_colocate_cma to
exceed 32 bits, truncating to a small allocation size. The hardware
would then write colocated motion vectors well past the allocated buffer
bounds.

[ ... ]
> +static void config_decode_canvas(struct aml_vdec_hw *hw,
> +				 struct h264_decode_buf_spec *buf_spec,
> +				 u32 mb_width, u32 mb_height)
> +{
> +	int canvas_alloc_result =3D 0;
> +	int blkmode =3D 0x0;
> +
> +	canvas_alloc_result =3D meson_canvas_alloc(hw->canvas, &buf_spec->y_can=
vas_index);
> +	canvas_alloc_result =3D meson_canvas_alloc(hw->canvas, &buf_spec->u_can=
vas_index);

[Severity: Medium]
Does config_decode_canvas clobber the first canvas_alloc_result without
checking it?

If the Y canvas allocation fails but the U canvas allocation succeeds,
the error is masked. The uninitialized Y canvas index will be programmed
into hardware and eventually passed to meson_canvas_free, potentially
causing a double-free.

[ ... ]
> +static int alloc_colocate_cma(struct aml_h264_ctx *h264_ctx,
> +			      struct aml_vdec_ctx *ctx)
> +{
> +	int alloc_size =3D 0;
> +	int i;
> +	struct aml_vdec_hw *hw;
> +	gfp_t gfp =3D GFP_KERNEL | GFP_DMA32;
> +
> +	if (h264_ctx->collated_cma_vaddr)
> +		return 0;

[Severity: Critical]
If userspace provides a new SPS mid-stream that increases the resolution,
does alloc_colocate_cma bypass reallocating the CMA buffer?

If we return early here, one_col_buf_size is not updated for the new
dimensions. This causes the hardware to silently overflow the existing
smaller buffer when writing motion vectors.

[ ... ]
> +static void release_colocate_buf(struct aml_h264_ctx *h264_ctx, int inde=
x)
> +{
[ ... ]
> +		} else {
> +			if (h264_ctx->colocated_buf_poc[index] !=3D INVALID_POC &&
> +			    ((h264_ctx->colocated_buf_map >> index) & 0x1) =3D=3D 0x1) {
> +				h264_ctx->colocated_buf_map &=3D (~(1 << index));
> +				dev_dbg
> +				    (&ctx->dev->plat_dev->dev,
> +				     "%s colocated_buf_index %d released poc %d\n",
> +				     __func__, index,
> +				     h264_ctx->colocated_buf_poc[index]);
> +			}
> +			h264_ctx->colocated_buf_poc[index] =3D INVALID_POC;
> +		}
> +	}
> +}
[ ... ]
> +static void clear_unused_col_buf(struct aml_h264_ctx *h264_ctx,
> +				 struct v4l2_ctrl_h264_decode_params *decode)
> +{
[ ... ]
> +	for (i =3D 0; i < h264_ctx->colocated_buf_num; i++) {
> +		col_poc =3D h264_ctx->colocated_buf_poc[i];
> +		if (col_poc !=3D INVALID_POC &&
> +		    (poc_is_in_dpb(col_poc, decode->dpb) !=3D 1))
> +			release_colocate_buf(h264_ctx, i);
> +	}

[Severity: Critical]
Is colocated_buf_num fully controlled by the PPS default active minus1
in clear_unused_col_buf?

If userspace inflates this value beyond H264_MAX_COL_BUF (32), this loop
will iterate out of bounds, and release_colocate_buf will write
INVALID_POC (0xFFFFFFFF) beyond the end of the colocated_buf_poc array,
causing memory corruption in the aml_h264_ctx struct.

[ ... ]
> +static void h264_config_decode_spec(struct aml_vdec_hw *hw, struct aml_v=
dec_ctx *ctx)
> +{
[ ... ]
> +		buf_spec_l0 =3D find_spec_by_dpb_index(h264_ctx, i, 0);
> +		if (buf_spec_l0) {
> +			buf_spec_l0->canvas_pos =3D
> +			    get_canvas_pos_by_poc(h264_ctx,
> +						  dpb->top_field_order_cnt);
> +			if (buf_spec_l0->canvas_pos < 0) {
> +				dev_err(&ctx->dev->plat_dev->dev,

[Severity: High]
Is canvas_pos an unsigned integer in h264_config_decode_spec?

If get_canvas_pos_by_poc returns -1 for an unallocated canvas, the < 0
check will fail because of integer promotion. The 0xFFFFFFFF value will
then be used in config_decode_canvas to calculate an out-of-bounds MMIO
offset (ANC0_CANVAS_ADDR - 4) and overwrite adjacent hardware registers.

[ ... ]
> +static void reorder_short_term(struct slice *curr_slice, int cur_list,
> +			       int pic_num_lx, int *ref_idx_lx)
> +{
[ ... ]
> +	num_ref_idx_lx_active =3D get_ref_list_size(h264_ctx, cur_list);
> +	if (num_ref_idx_lx_active > (V4L2_H264_NUM_DPB_ENTRIES + 1)) {
> +		dev_dbg(&ctx->dev->plat_dev->dev, "incorrect value st num_ref_idx_lx_a=
ctive %d\n",
> +			num_ref_idx_lx_active);
> +		return;
> +	}

[Severity: Critical]
Does the off-by-one check in reorder_short_term allow an array bounds write?

V4L2_H264_NUM_DPB_ENTRIES is 16, so the check allows num_ref_idx_lx_active
to be 17. The loop below will then access and write to index 17 of the
ref_list array, which only holds 17 items (0 to 16). Additionally,
reorder_long_term appears to completely lack this bounds check, allowing
unbounded writes past the array based on PPS values.

[ ... ]
> +static int get_ref_list_size(struct aml_h264_ctx *h264_ctx, int cur_list)
> +{
[ ... ]
> +	if (cur_list =3D=3D 0) {
> +		num_ref_idx_lx_active_minus1 =3D
> +			h264_ctx->ctrl_ref.pps->num_ref_idx_l0_default_active_minus1;
> +		if (override_flag)
> +			num_ref_idx_lx_active_minus1 =3D
> +				h264_ctx->dpb_param.dpb.num_ref_idx_l0_active_minus1;
> +	} else {
> +		num_ref_idx_lx_active_minus1 =3D
> +			h264_ctx->ctrl_ref.pps->num_ref_idx_l1_default_active_minus1;
> +	}

[Severity: Medium]
Does get_ref_list_size ignore the override_flag for the L1 reference list?

According to the H.264 specification, num_ref_idx_active_override_flag
applies to both L0 and L1 lists in B-slices. Ignoring it here could cause
decoding issues for valid streams that override both sizes.

[ ... ]
> +static irqreturn_t h264_threaded_isr_func(int irq, void *priv)
> +{
> +	u32 dec_status;
> +	struct aml_vdec_dev *dev =3D (struct aml_vdec_dev *)priv;
> +	struct aml_h264_ctx *h264_ctx =3D (struct aml_h264_ctx *)dev->dec_hw->c=
urr_ctx;
> +	struct aml_vdec_ctx *ctx =3D (struct aml_vdec_ctx *)h264_ctx->v4l2_ctx;

[Severity: High]
If hw->curr_ctx is cleared concurrently as noticed earlier in
vdec_threaded_isr_handler, doesn't h264_threaded_isr_func dereference
the NULL context when casting and reading h264_ctx->v4l2_ctx?

Additionally, if the context is valid but the queue is empty during a
spurious interrupt, v4l2_m2m_next_dst_buf further down will return NULL
and crash.

[ ... ]
> +int aml_h264_dec_run(void *priv)
> +{
[ ... ]
> +	ret =3D wait_event_interruptible_timeout(ctx->queue, ctx->int_cond,
> +					       msecs_to_jiffies(DECODER_TIMEOUT_MS));
> +	ctx->int_cond =3D 0;

[Severity: High]
Is it safe to perform a blocking wait inside the non-blocking device_run
callback in aml_h264_dec_run?

The V4L2 M2M architecture expects device_run to initiate hardware
processing and return immediately. Sleeping here forces the shared M2M
worker thread to block, stalling all concurrent decoding instances.

Also, should ctx->int_cond be reset to 0 before initiating the job,
rather than after the wait? If a delayed hardware interrupt fires after
this reset, the next decode run will observe ctx->int_cond =3D=3D 1 and
return instantly.

[ ... ]
> +	if (!ret) {
> +		ret =3D -1;
> +		dev_err(&ctx->dev->plat_dev->dev, "dec timeout=3D%u\n", DECODER_TIMEOU=
T_MS);
> +		for (i =3D 0; i < 16; i++) {	/* 16 : show ucode PC 16 times when timeo=
ut */
> +			dev_dbg(&ctx->dev->plat_dev->dev, "decoder timeout, pc 0x%x\n",
> +				read_dos_reg(dec_hw, MPC_E));
> +			usleep_range(10, 20);
> +		}
> +		h264_release_decode_spec(dec_hw, ctx);
> +	} else if (-ERESTARTSYS =3D=3D ret) {
> +		ret =3D -1;
> +		h264_release_decode_spec(dec_hw, ctx);
> +	}

[Severity: High]
Does the timeout or signal handling in aml_h264_dec_run race with the
threaded IRQ handler?

If the wait is interrupted or times out, this directly executes
h264_release_decode_spec. If the delayed hardware interrupt fires
concurrently, h264_threaded_isr_func will also unconditionally call
h264_release_decode_spec. Without a lock, this risks double-frees of
the canvas IDs and structural corruption.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-b4-s4-vdec=
-upstream-v7-0-3fae085861bd@amlogic.com?part=3D4
