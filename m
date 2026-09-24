Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76ECD1A2C0B
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790237765; cv=none; b=T/6O3yn6ge8eIoIrvd6jxe20SRLuFKC59tZWTT53Fhy8c4Xkk5FGkuFnNpiofj7XMrRzBlRCXfyuF/rn1XbHnSyRVbCvxEIzfJN/Ti9IyuNgG9DY7968Qj6p6cI++bJsLKlLqeHCkcFMUNgdYuiWbkKOVqsWPMIWQ+a/5B52rQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790237765; c=relaxed/simple;
	bh=bDKTzJHNArvU+sL92K3J5S2RwsrOr1uq59zF+4PbqSs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=If4OVofMJYYqGJhCq31Yjq49Al0gwshVK/ygs6mW33H/c+yHpICrOyXVqOipqjDKAt+AwirQjXRXrMu/iMGqiSo61HZHAqKBfZnhag06TtRc3U7xWMqgwytT59H8EA/39ylZ5/tAfhYsgFgcBPUXv8VrI2v2f+RTg8uv7DkxZk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M/aFGvfq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/aFGvfq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 559A31F000FF;
	Thu, 24 Sep 2026 08:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790237762;
	bh=GOxE0BXvtdjv6yfx25iDdB2Rz1L1dqVbBTy1rcGZPRQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M/aFGvfqy7pgOMKCpVuB19dIQa2RdmWG+ha5MVpPOH7lqF/FHwNxAiIchg+Y5Liv/
	 v6RwWOWl01eDOFh8+b9Uz+sGPc8nbDDqej4MRkOYIv3IOY3N1SibhiTKTrEv1hwYC+
	 Sxvj+y9mOnohD+spa4ACK7qcwszSAn6YaIN4UgmXdnVhHmO8SSSGRABO6Q4aHc/C+6
	 ubsos+aAccquC8Hm746Ec8y3MLP11TbUvouSfz4fZdG0wpU0cq4kyrUkLCEydAgoUM
	 OafWbwCmvf8oO7zL5H1EdfBsM8PCAflVO77s28qXVbHP6T4IFcTadNe3CdV0L7y4u+
	 PZyrQIp1JC17A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 4/6] decoder: Add V4L2 stateless H.264 decoder
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: robh@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260924-b4-s4-vdec-upstream-v10-4-1289303a58a4@amlogic.com>
References: <20260924-b4-s4-vdec-upstream-v10-0-1289303a58a4@amlogic.com>
 <20260924-b4-s4-vdec-upstream-v10-4-1289303a58a4@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 08:16:01 +0000
Message-Id: <20260924081602.559A31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 20 potential issue=
(s) to consider:
- [Critical] media: amlogic: arbitrary physical memory read via unvalidated=
 first_mb_in_slice
- [Critical] media: amlogic: heap buffer overflow in reference list reorder=
ing
- [High] media: amlogic: soft lockup via atomic busy-wait in aml_stop_vdec_=
hw()
- [High] media: amlogic: WARN_ON due to double completion of V4L2 control r=
equests
- [High] media: amlogic: memory leak of h264 context and DMA buffers on STR=
EAMON
- [High] media: amlogic: shifting hardware RefPicList indices on invalid re=
ference
- [High] media: amlogic: incorrect base address for collocated buffers due =
to 8x8 shift
- [High] media: amlogic: VIFIFO write pointer programmed beyond ring buffer=
 bounds
- [High] media: amlogic: infinite poll timeout deadlocks the threaded IRQ h=
andler
- [High] media: amlogic: out-of-bounds DMA write due to undersized buffers =
for interlaced
- [High] media: amlogic: UAF when VIDIOC_STREAMOFF frees context concurrent=
ly
- [High] media: amlogic: OOB DMA write of collocated MVs during dynamic res=
olution change
- [High] media: amlogic: UAF of M2M device and devm resources when fd outli=
ves remove
- [High] media: amlogic: threaded IRQ accesses powered-off registers during=
 remove
- [High] media: amlogic: context cleanup unconditionally resets shared hard=
ware
- [High] media: amlogic: early device registration exposes unpowered hardwa=
re to userspace
- [High] media: amlogic: missing checks on clock and power domain enablement
- [Medium] media: amlogic: allocation failure for large firmware using kzal=
loc
- [Medium] media: amlogic: signed integer overflow in collocated buffer bit=
mask
- [Low] media: amlogic: out-of-bounds read of reorder_cmd array due to off-=
by-one check
--

commit d745d294471b0d176edba67b04bee8a0c6b95c04
Author: Zhentao Guo <zhentao.guo@amlogic.com>

decoder: Add V4L2 stateless H.264 decoder driver

This commit adds initial support for the v4l2 stateless video decoder driver
on the Amlogic S4 (S805X2) platform, supporting 8-bit H.264 progressive=20
bitstream decoding.

> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec.c b/drivers/med=
ia/platform/amlogic/vdec/aml_vdec.c
> --- a/drivers/media/platform/amlogic/vdec/aml_vdec.c
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec.c
[ ... ]
> @@ m2mops_vdec_device_run @@
>  	if (src_req)
>  		v4l2_ctrl_request_complete(src_req, &ctx->ctrl_handler);
>  	if (ret < 0 || ctx->curr_frm_err_flag)
>  		goto err_cancel_job;
>  	v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx,
>  					 VB2_BUF_STATE_DONE);
[ ... ]
> @@ vb2ops_vdec_buf_request_complete @@
>  static void vb2ops_vdec_buf_request_complete(struct vb2_buffer *vb)
>  {
>  	struct aml_vdec_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> =20
>  	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->ctrl_handler);
>  }

[Severity: High]
Will this sequence cause a double completion of v4l2 control requests?=20

Since m2mops_vdec_device_run() manually calls v4l2_ctrl_request_complete()=
=20
for the source request and then marks the buffer done, the videobuf2 core=20
automatically invokes vb2ops_vdec_buf_request_complete(). This secondary=20
callback invokes v4l2_ctrl_request_complete() again on the same request,=20
which triggers a warn_on() in the media request core.

[ ... ]
> @@ vb2ops_vdec_start_streaming @@
>  	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
>  		struct vb2_v4l2_buffer *src_buf;
> =20
>  		if (aml_vdec_init_dec_inst(ctx) < 0) {
>  			while ((src_buf =3D v4l2_m2m_src_buf_remove(ctx->m2m_ctx)))
[ ... ]
> @@ vb2ops_vdec_stop_streaming @@
>  	if (!ctx->is_output_streamon && !ctx->is_cap_streamon)
>  		aml_vdec_release_instance(ctx);

[Severity: High]
Could this leak the h264 context and dma buffers on stream toggle?

Calling vidioc_streamon for the output queue triggers=20
vb2ops_vdec_start_streaming(), which blindly allocates a new context via=20
aml_h264_init(). If a user calls vidioc_streamoff on the output queue while=
=20
the capture queue remains active, vb2ops_vdec_stop_streaming() skips freein=
g=20
the context because both queues are not stopped. A subsequent streamon on=20
the output queue will allocate a new context, irreversibly dropping the=20
pointers to the old context and its dma allocations.

> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_drv.c b/drivers=
/media/platform/amlogic/vdec/aml_vdec_drv.c
> --- a/drivers/media/platform/amlogic/vdec/aml_vdec_drv.c
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_drv.c
[ ... ]
> @@ fops_vcodec_release @@
>  static int fops_vcodec_release(struct file *file)
>  {
>  	struct aml_vdec_ctx *ctx =3D fh_to_dec_ctx(file);
> =20
>  	v4l2_m2m_ctx_release(ctx->m2m_ctx);
[ ... ]
> @@ aml_vdec_drv_remove @@
>  	vdec_disable(dev->dec_hw);
>  	media_device_unregister(&dev->mdev);
>  	v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
>  	video_unregister_device(dev->vfd);
>  	media_device_cleanup(&dev->mdev);
> =20
>  	v4l2_m2m_release(dev->m2m_dev_dec);
>  	dev->pvdec_data->destroy_hw_resource(dev);

[Severity: High]
Can this lead to a use-after-free if the file descriptor outlives the=20
device removal?=20

In aml_vdec_drv_remove(), v4l2_m2m_release() explicitly frees the m2m devic=
e.
Shortly after, the devm infrastructure frees the aml_vdec_dev structure.=20
Because video_unregister_device() does not forcibly close open file=20
descriptors, an open file descriptor closed later triggers=20
fops_vcodec_release(), which accesses the manually freed m2m_dev and the=20
devm-freed ctx->dev.

[Severity: High]
Does this expose unpowered hardware to userspace during registration and=20
removal?

In aml_vdec_drv_probe(), video_register_device() exposes the video node=20
to userspace before vdec_enable() powers on the hardware domains. Userspace=
=20
could open the device and attempt to start jobs.=20

Similarly, in aml_vdec_drv_remove(), vdec_disable() shuts down hardware=20
clocks before video_unregister_device() and v4l2_m2m_release() safely=20
cancel ongoing m2m jobs. Accessing unclocked or unpowered mmio registers=20
often results in a synchronous external abort.

[Severity: High]
Could the threaded irq handler execute and access unpowered registers here?

The hardware is shut down via vdec_disable() before the interrupt requested=
=20
via devm_request_threaded_irq() is disabled and synchronized. If an=20
interrupt fires just before vdec_disable(), the threaded isr is scheduled.=
=20
The running h264_threaded_isr_func() will unconditionally read from DOS_BUS=
=20
registers like DPB_STATUS_REG, triggering a synchronous external abort.

> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c b/drivers/=
media/platform/amlogic/vdec/aml_vdec_hw.c
> --- a/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_hw.c
[ ... ]
> @@ aml_stop_vdec_hw @@
>  	ret =3D read_poll_timeout_atomic(read_dos_reg, reg_val,
>  				       !(reg_val & 0x8000),
>  				       10, 100000, true,
>  				       hw, IMEM_DMA_CTRL);
> =20
>  	ret =3D read_poll_timeout_atomic(read_dos_reg, reg_val,
>  				       !(reg_val & 0x8000),
>  				       10, 100000, true,
>  				       hw, LMEM_DMA_CTRL);
> =20
>  	ret =3D read_poll_timeout_atomic(read_dos_reg, reg_val,
>  				       !(reg_val & 0xfff),
>  				       10, 300000, true,
>  				       hw, WRRSP_LMEM);

[Severity: High]
Does this stall the cpu for hundreds of milliseconds?

The atomic variants of read_poll_timeout internally loop with udelay(),=20
forcing the cpu to busy-wait continuously. Waiting up to 300ms atomically=20
is highly likely to trigger rcu stalls and the soft lockup watchdog.=20
Since the callers such as aml_h264_exit() execute in sleepable contexts,=20
the non-atomic read_poll_timeout() should be used instead.

[ ... ]
> @@ pm_vdec_power_domain_power_on @@
>  	if (gate_node) {
>  		clk_prepare_enable(gate_node->clk);
[ ... ]
>  	if (dev) {
>  		pm_runtime_get_sync(dev);

[Severity: High]
Are the return values for clock and power domain enablement intentionally=20
ignored here?

If these calls fail to enable the hardware resources, proceeding to access=
=20
mmio registers in dos_local_config() will result in a synchronous external=
=20
abort, crashing the system.

> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c b/driv=
ers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c
> --- a/drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c
> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_tee_fw.c
[ ... ]
> @@ get_firmware @@
>  	/* get rid of the first 32K bytes plaintext */
>  	*size =3D fw->size - UCODE_HEADER_SIZE;
>  	buf =3D kzalloc(*size, GFP_KERNEL);
>  	if (!buf) {

[Severity: Medium]
Will this kzalloc() succeed for large video firmware blobs on a fragmented=
=20
system?=20

Video firmware is typically large, and kzalloc() requires physically=20
contiguous pages. Since this buffer is only used to stage data copying=20
into tee shared memory in chunks, physical contiguity seems unnecessary.=20
Using vmalloc() or kvzalloc() might be more reliable.

> diff --git a/drivers/media/platform/amlogic/vdec/h264.c b/drivers/media/p=
latform/amlogic/vdec/h264.c
> --- a/drivers/media/platform/amlogic/vdec/h264.c
> +++ b/drivers/media/platform/amlogic/vdec/h264.c
[ ... ]
> @@ h264_prepare_input @@
>  	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_RP,
>  		     round_down(src_dma, VDEC_FIFO_ALIGN));
>  	dummy =3D payload_size + VLD_PADDING_SIZE;
>  	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_WP,
>  		     round_down((src_dma + dummy), VDEC_FIFO_ALIGN));

[Severity: High]
Can this ring buffer write pointer exceed the defined boundaries?

The hardware bitstream ring buffer is configured with START_PTR at the star=
t=20
of the dma buffer and END_PTR strictly at the end of the payload.=20
Programming WP past END_PTR causes the hardware to attempt an out-of-bounds=
=20
physical memory read. Also, because the read pointer mathematically wraps=20
at END_PTR, it will never equal the out-of-bounds WP, causing the hardware=
=20
to believe the fifo is infinitely full and spin endlessly.

[ ... ]
> @@ config_sps_params @@
>  	h264_ctx->frame_width =3D (sps->pic_width_in_mbs_minus1 + 1) << 4;
>  	h264_ctx->frame_height =3D (sps->pic_height_in_map_units_minus1 + 1) <<=
 4;

[Severity: High]
Is there a risk of undersized buffer allocations for interlaced streams?

The driver computes frame_height directly from pic_height_in_map_units_minu=
s1=20
without checking the frame_mbs_only_flag. For interlaced content, this=20
specifies half the actual frame height. This results in alloc_colocate_cma(=
)=20
allocating a half-sized buffer, causing the hardware to perform an=20
out-of-bounds dma write during decoding. Progressive-only drivers typically=
=20
reject streams missing the V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY flag.

[ ... ]
> @@ reorder_short_term @@
>  	memcpy(&ref_list_reordered[*ref_idx_lx], pic_lx, sizeof(struct h264_dec=
ode_buf_spec));
>  	dev_dbg(&ctx->dev->plat_dev->dev, "%s : RefPicListX[%d ] =3D pic %p pic=
_num(%d)\n", __func__,
>  		*ref_idx_lx, pic_lx, ref_list_reordered[*ref_idx_lx].dpb->pic_num);
>  	*ref_idx_lx =3D *ref_idx_lx + 1;
[ ... ]
> @@ reorder_long_term @@
>  	memcpy(&ref_list[*ref_idx_lx], pic_lt, sizeof(struct h264_decode_buf_sp=
ec));
>  	dev_dbg(&ctx->dev->plat_dev->dev, "%s : RefPicListX[%d ] =3D pic %p pic=
_num(%d)\n", __func__,
>  		*ref_idx_lx, pic_lt, ref_list[*ref_idx_lx].dpb->pic_num);
>  	*ref_idx_lx =3D *ref_idx_lx + 1;
[ ... ]
> @@ reorder_pics @@
>  	pic_num_lx_pred =3D curr_pic_num;
>  	for (i =3D 0; i < REORDERING_COMMAND_MAX_SIZE && modification_of_pic_nu=
ms_idc[i] !=3D 3; i++) {

[Severity: Critical]
Could this loop overflow the ref_list arrays?

The ref_list arrays in aml_h264_ctx are statically sized to 17 elements.=20
However, the loop processes up to REORDERING_COMMAND_MAX_SIZE (33)=20
reordering commands. Because there is no bounds check ensuring=20
*ref_idx_lx < 17 before the memcpy operations in reorder_short_term and=20
reorder_long_term, a crafted bitstream with excessive reorder commands can=
=20
trigger a deterministic out-of-bounds write of h264_decode_buf_spec structs=
=20
into adjacent heap memory.

[ ... ]
> @@ alloc_colocate_cma @@
>  	if (h264_ctx->collated_cma_vaddr)
>  		return 0;
> =20
>  	hw =3D vdec_get_hw(ctx->dev);
>  	if (!hw)
>  		return -1;
> =20
>  	/* 96 :col buf size for each mb */
>  	h264_ctx->one_col_buf_size =3D h264_ctx->mb_total * 96;

[Severity: High]
Does this logic correctly update the collocated buffer size during dynamic=
=20
resolution changes?

When a stream dynamically increases in resolution, h264_ctx->mb_total=20
increases. However, the early return in alloc_colocate_cma() prevents=20
one_col_buf_size from updating. When the hardware later decodes a larger=20
frame, it processes the new mb_total macroblocks but the pointer=20
calculations rely on the old size, causing an out-of-bounds dma write=20
outside the cma buffer bounds.

[ ... ]
> @@ allocate_colocate_buf @@
>  	for (i =3D 0; i < h264_ctx->colocated_buf_num; i++) {
>  		if (((h264_ctx->colocated_buf_map >> i) & 0x1) =3D=3D 0) {
>  			h264_ctx->colocated_buf_map |=3D (1 << i);
>  			break;
>  		}
>  	}
[ ... ]
> @@ release_colocate_buf @@
>  		} else {
>  			if (((h264_ctx->colocated_buf_map >> index) & 0x1) =3D=3D 0x1) {
>  				h264_ctx->colocated_buf_map &=3D (~(1 << index));

[Severity: Medium]
Can shifting by 31 bits trigger signed integer overflow?

The expression (1 << i) uses a signed 32-bit integer. If the 31st=20
collocated buffer is accessed, it overflows into the sign bit, resulting=20
in undefined behavior. Using 1U << i might be safer.

[ ... ]
> @@ get_modification_cmd @@
>  			i++;
> =20
>  			if (i >=3D REORDERING_COMMAND_MAX_SIZE) {
>  				curr_slice->ref_pic_list_reordering_flag[list] =3D 0;
>  				break;
>  			};
>  			if (j > REORDER_CMD_MAX) {
>  				curr_slice->ref_pic_list_reordering_flag[list] =3D 0;
>  				break;
>  			};
>  		} while (val !=3D 3);

[Severity: Low]
Is the loop termination condition correct here?

Checking if (j > REORDER_CMD_MAX) fails to break the loop when j reaches=20
the array size (66). In the next iteration, the code reads exactly one=20
element past the end of the reorder_cmd array.

[ ... ]
> @@ h264_config_decode_buf @@
>  	for (i =3D 0; i < h264_ctx->list_size[0]; i++) {
>  		if (!h264_ctx->ref_list0[i].valid)
>  			continue;
>  		canvas_pos =3D h264_ctx->ref_list0[i].canvas_pos;

[Severity: High]
Does skipping invalid reference entries corrupt the hardware's expected=20
index array?

If a reference frame is marked as invalid, using continue skips=20
accumulating ref_cfg_once and prevents j from incrementing. This compacts=20
the reference list, causing all subsequent valid references to shift into=20
earlier slots. Shifting the entries breaks temporal prediction and results=
=20
in severe visual corruption.

[ ... ]
> @@ h264_config_decode_buf @@
>  		colocate_wr_adr =3D (unsigned int)h264_ctx->collated_cma_addr +
>  		    ((h264_ctx->one_col_buf_size *
>  		      h264_ctx->curr_spec.col_buf_index) >> (use_mode_8x8_flag ? 2 : 0=
));
>  		if (colocate_adr_offset > h264_ctx->one_col_buf_size ||
[ ... ]
>  			colocate_rd_adr =3D (unsigned int)h264_ctx->collated_cma_addr +
>  			    ((h264_ctx->one_col_buf_size *
>  			      colocate_pic->col_buf_index) >> (use_mode_8x8_flag
>  							       ? 2 : 0));

[Severity: High]
Is the 8x8 shift applied to the correct part of the offset?

By shifting the entire base address computation instead of just the=20
intra-buffer offset, the physical base addresses diverge. If a reference=20
frame was written with 8x8 mode but read by a current frame without 8x8=20
mode, the hardware will read from mismatched physical memory offsets,=20
fetching garbage motion vectors.

[ ... ]
> @@ h264_config_decode_buf @@
>  	read_poll_timeout(read_dos_reg, reg_val,
>  			  !(reg_val & 0x800),
>  			  10, 0, true, hw, H264_CO_MB_RW_CTL);

[Severity: High]
Will a timeout parameter of 0 create an infinite loop?

Using read_poll_timeout with a timeout_us argument of 0 creates an infinite=
=20
loop. If the hardware bit fails to clear, the threaded irq handler will spi=
n=20
forever. Because it holds the driver's global hw->ctx_mutex, this will=20
permanently deadlock the decoder.

[ ... ]
> @@ h264_config_decode_buf @@
>  	colocate_adr_offset =3D COL_SIZE_FOR_ONE_MB;
>  	if (use_mode_8x8_flag)
>  		colocate_adr_offset >>=3D 2;
>  	colocate_adr_offset *=3D curr_slice->first_mb_in_slice;
[ ... ]
>  		colocate_wr_adr =3D (unsigned int)h264_ctx->collated_cma_addr +
>  		    ((h264_ctx->one_col_buf_size *
>  		      h264_ctx->curr_spec.col_buf_index) >> (use_mode_8x8_flag ? 2 : 0=
));
>  		if (colocate_adr_offset > h264_ctx->one_col_buf_size ||
[ ... ]
>  			val  =3D ((colocate_rd_adr_offset + colocate_rd_adr) >> 3) |
>  				(cur_colocate_ref_type << 29) |
>  				(l10_structure << 30);
>  			regmap_write(hw->map[DOS_BUS], H264_CO_MB_RD_ADDR, val);

[Severity: Critical]
Is it safe to use first_mb_in_slice without validation?

This value is parsed directly from the untrusted h264 bitstream and=20
multiplied to compute colocate_rd_adr_offset. While there is a bounds=20
check for colocate_rd_adr + one_col_buf_size, there is no validation that=20
colocate_rd_adr_offset itself remains within the buffer bounds before=20
programming the hardware read address. A malicious bitstream supplying a=20
massive first_mb_in_slice could cause arbitrary physical memory reads.

[ ... ]
> @@ aml_h264_exit @@
>  	if (ctx->dos_clk_en)
>  		aml_stop_vdec_hw(dec_hw);
> =20
>  	if (h264_ctx->collated_cma_vaddr) {
[ ... ]
>  	kfree(ctx->codec_priv);
>  	ctx->codec_priv =3D NULL;
>  }
[ ... ]
> @@ aml_h264_dec_run @@
>  		aml_stop_vdec_hw(dec_hw);
>  		synchronize_irq(dec_hw->dec_irq);
>  		h264_release_decode_spec(dec_hw, ctx);
>  	}
> =20
>  	h264_ctx->init_flag =3D 0;
>  	aml_vdec_set_curr_ctx(dec_hw, NULL);

[Severity: High]
Could a concurrent vidioc_streamoff trigger a use-after-free?

If userspace calls vidioc_streamoff, aml_h264_exit() frees ctx->codec_priv.=
=20
However, if aml_h264_dec_run() is actively sleeping on=20
wait_event_interruptible_timeout() in the m2m worker thread, the forced=20
hardware stop causes the wait to return. The worker thread will immediately=
=20
dereference the freed h264_ctx without any synchronization.

[Severity: High]
Does this teardown sequence unconditionally reset shared hardware?

The aml_vdec_hw block is a global resource shared by all active v4l2 decode=
r=20
instances. During teardown, aml_h264_exit() unconditionally calls=20
aml_stop_vdec_hw(dec_hw) which issues soft resets to the shared DOS_BUS=20
registers. There is no check ensuring that the tearing-down context actuall=
y=20
owns the hardware. If another context is actively decoding, resetting the=20
hardware underneath it will cause timeouts and state corruption.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-b4-s4-vdec=
-upstream-v10-0-1289303a58a4@amlogic.com?part=3D4
