Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D773B47DE
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 07:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788506491; cv=none; b=arU5YcauyMefv+Sc/mN3/fl2t2YbIb4fbiz4GLYLLkR7ypmXJFfdwbOZ+Y9FJ7QiuJ7YxH69LMvWOnrKtZZAE6+VoalN6m8Lk9cQt3evP7iyNl8TMfLylkuIQh+pEBgS0OljhyXvzBgAbtGO09/64rqVyWOWDASWhd1+jjE9ky0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788506491; c=relaxed/simple;
	bh=xIq+GPDT5oOcnTIHP/qSwDAVLyTYNRjZQBsf0cFLUa8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QnzUodEhSsnZdhpNFsAgfUQ0lysS+fLb3QqPULF2SeVCieF/ar5mSErxoD8J4ED/HTv+ZuYs//HqhFjbaK7YTyn7TgPkv/Dr5G4OzUKHpOQAZHFAVGvCBeMmEJljz/5tFmPEKBa5qufOoVxRhwx+eX7XmuyzBvUbHEIigMONE+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RzWYbaf1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RzWYbaf1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E9631F00A3D;
	Fri,  4 Sep 2026 07:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788506488;
	bh=lDbkf1qBkbKfPGdh4JzL1YE6a2ZCdpmgY39Qcj8jLZY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RzWYbaf1+pNbIPNQ/8RDOoE+LQSKgTOqxIqT1NcelpveisRc3IvosuhSqTu6HG65i
	 5QSyG3IYPtYNOrOqpBh6VBcOh3roL05f4e6wRNmCQWKMMtKS9ftTbaYSLexfvJ91Ho
	 6O2PkugCApyDBoYzW43SfHIytgos6A6TRiQ6O4rCajTERisFQaxn2Z0wA+VyxHvo2l
	 jzZOP2IBH9auZumeAtp/VDecOqs7MwWLU+Bwa1Uh5SB5WvQhlsp1MmQiyzc2KkCO6I
	 Obgtf3CogOJhrtD9DgULgYlk16Prk3q7gQjxyRAMSXfdD1s7K193MxuzHr9jQ2fp3u
	 8wpkfsBRpAEQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/9] media: chips-media: wave6: Add v4l2 m2m driver
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nas Chung" <nas.chung@chipsnmedia.com>
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <235b2de7057182d619a361dffc247f1c1f438a3c.1788496816.git.nas.chung@chipsnmedia.com>
References: <cover.1788496816.git.nas.chung@chipsnmedia.com>
 <235b2de7057182d619a361dffc247f1c1f438a3c.1788496816.git.nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 07:21:28 +0000
Message-Id: <20260904072128.8E9631F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 15 potential issue=
(s) to consider:
- [High] Usage counter leak during instance destruction due to conditionall=
y calling pm_runtime_put_sync() based on pm_runtime_suspended().
- [High] Race condition and state corruption in M2M device run timeout hand=
ler causing double v4l2_m2m_job_finish, queue corruption, and missing VPU h=
ardware abort.
- [High] Missing sizeimage update when the output format changes, and missi=
ng minimum clamping for compressed capture formats, leading to undersized b=
uffers.
- [High] Data race on inst->next_buf_last causes decoded buffers to be perm=
anently stranded in the ready queue.
- [High] Hardware-provided buffer counts are not validated against WAVE6_MA=
X_FBS, leading to out-of-bounds array accesses.
- [High] wave6_vpu_job_ready does not check for source buffer availability,=
 leading to infinite CPU spinning when the source queue is empty.
- [High] stop_streaming returns buffers to userspace while the VPU hardware=
 is still actively accessing them, leading to DMA use-after-free and memory=
 corruption.
- [High] Error paths in wave6_vpu_enc_start_encode and wave6_vpu_dec_start_=
decode wrongly remove and abort in-flight buffers.
- [High] Missing cancel_delayed_work_sync during m2m device teardown.
- [High] Lockless iteration over V4L2 M2M ready queues races with VIDIOC_QB=
UF, leading to list corruption and kernel crashes.
- [Medium] The downscaler cannot be disabled via VIDIOC_S_SELECTION once en=
abled, and unsupported compose sizes are returned to userspace without appl=
ying them.
- [Medium] Encoder's VIDIOC_S_SELECTION incorrectly returns 0 without adjus=
ting an invalid rectangle if the requested crop width or height is zero.
- [Medium] V4L2_SEL_TGT_CROP_BOUNDS and V4L2_SEL_TGT_CROP_DEFAULT incorrect=
ly return the active crop instead of full frame bounds.
- [Medium] Modifying V4L2 formats and crop structures from the threaded IRQ=
 context causes data races with userspace ioctls.
- [Medium] Concurrent unprotected accesses to inst->enc_ctrls between s_ctr=
l and buf_queue.
--

commit 2772c90afbf70493cce735a7f6c9ed38f93e4dbd
Author: Nas Chung <nas.chung@chipsnmedia.com>

media: chips-media: wave6: Add v4l2 m2m driver support

This commit adds v4l2 m2m stateful driver support for the Chips&Media Wave6
video codec IP, including both encoder and decoder. It supports AVC and HEVC
codecs with multiple input and output formats, as well as multiplanar forma=
ts,
cropping, scaling, and dynamic resolution change.

> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c b/d=
rivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
> new file mode 100644
> index 0000000000000..4b07a2249db11
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c

[ ... ]

> +static void wave6_vpu_dec_destroy_instance(struct vpu_instance *inst, bo=
ol remove_dbgfs)
> +{
> +	u32 fail_res =3D 0;
> +	int ret;
> +
> +	wave6_vpu_disable_instance(inst);
> +
> +	if (remove_dbgfs)
> +		wave6_vpu_remove_dbgfs_file(inst);
> +
> +	ret =3D wave6_vpu_dec_close(inst, &fail_res);
> +	if (ret) {
> +		dev_err(inst->dev->dev, "failed destroy instance: %d (%d)\n",
> +			ret, fail_res);
> +	}
> +
> +	scoped_guard(spinlock, &inst->dev->inst_lock)
> +		list_del_init(&inst->list);
> +	wave6_vpu_dec_release_fb(inst);
> +	wave6_vpu_set_instance_state(inst, VPU_INST_STATE_NONE);
> +
> +	if (!pm_runtime_suspended(inst->dev->dev))
> +		pm_runtime_put_sync(inst->dev->dev);

[Severity: High]
Can this conditionally leak the usage counter if the device is suspended?

Any instance destruction during a suspend cycle could trigger this leak, wh=
ich
prevents the device from ever entering runtime suspend again, breaking power
management. pm_runtime_put_sync() handles suspended devices correctly and m=
ust
be called unconditionally to balance the earlier pm_runtime_resume_and_get(=
).

> +}

[ ... ]

> +static int wave6_vpu_dec_g_selection(struct file *file, void *fh, struct=
 v4l2_selection *s)
> +{
> +	struct vpu_instance *inst =3D wave6_file_to_vpu_inst(file);
> +
> +	dev_dbg(inst->dev->dev, "%s: type %d target %d\n",
> +		__func__, s->type, s->target);
> +
> +	if (s->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE &&
> +	    s->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> +		return -EINVAL;
> +
> +	switch (s->target) {
> +	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
> +		s->r.left =3D 0;
> +		s->r.top =3D 0;
> +		s->r.width =3D inst->dst_fmt.width;
> +		s->r.height =3D inst->dst_fmt.height;
> +		break;
> +	case V4L2_SEL_TGT_COMPOSE_PADDED:
> +	case V4L2_SEL_TGT_COMPOSE:
> +		s->r.left =3D 0;
> +		s->r.top =3D 0;
> +		if (inst->scaler_info.enable) {
> +			s->r.width =3D inst->scaler_info.width;
> +			s->r.height =3D inst->scaler_info.height;
> +		} else if (inst->crop.width && inst->crop.height) {
> +			s->r =3D inst->crop;
> +		} else {
> +			s->r.width =3D inst->src_fmt.width;
> +			s->r.height =3D inst->src_fmt.height;
> +		}
> +		break;
> +	case V4L2_SEL_TGT_CROP:
> +	case V4L2_SEL_TGT_CROP_DEFAULT:
> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> +	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
> +		s->r.left =3D 0;
> +		s->r.top =3D 0;
> +		s->r.width =3D inst->src_fmt.width;
> +		s->r.height =3D inst->src_fmt.height;
> +		if (inst->crop.width && inst->crop.height)
> +			s->r =3D inst->crop;

[Severity: Medium]
Should V4L2_SEL_TGT_CROP_BOUNDS and V4L2_SEL_TGT_CROP_DEFAULT return the fu=
ll
frame bounds rather than the active crop?

If userspace sets an active crop, then queries V4L2_SEL_TGT_CROP_BOUNDS, the
driver sets the result to the active crop (inst->crop) instead of the maxim=
um
supported uncropped resolution, causing userspace to incorrectly calculate
dimensions.

> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int wave6_vpu_dec_s_selection(struct file *file, void *fh, struct=
 v4l2_selection *s)
> +{
> +	struct vpu_instance *inst =3D wave6_file_to_vpu_inst(file);
> +	int step =3D 4;
> +	int scale_width, scale_height;
> +	int min_scale_width, min_scale_height;
> +
> +	if (s->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE &&
> +	    s->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> +		return -EINVAL;
> +
> +	if (s->target !=3D V4L2_SEL_TGT_COMPOSE)
> +		return -EINVAL;
> +
> +	if (!(s->flags & (V4L2_SEL_FLAG_GE | V4L2_SEL_FLAG_LE)))
> +		s->flags |=3D V4L2_SEL_FLAG_LE;
> +
> +	scale_width =3D clamp(s->r.width, W6_MIN_DEC_PIC_WIDTH,
> +			    round_up(inst->src_fmt.width, W6_DEC_BUF_ALIGNMENT));
> +	scale_height =3D clamp(s->r.height, W6_MIN_DEC_PIC_HEIGHT,
> +			     inst->src_fmt.height);
> +	if (s->flags & V4L2_SEL_FLAG_GE) {
> +		scale_width =3D round_up(scale_width, step);
> +		scale_height =3D round_up(scale_height, step);
> +	}
> +	if (s->flags & V4L2_SEL_FLAG_LE) {
> +		scale_width =3D round_down(scale_width, step);
> +		scale_height =3D round_down(scale_height, step);
> +	}
> +
> +	if (scale_width < inst->src_fmt.width ||
> +	    scale_height < inst->src_fmt.height)
> +		inst->scaler_info.enable =3D true;

[Severity: Medium]
Is there a missing else path to disable the scaler when a 1:1 scale is
requested?

If userspace requests a scaled down compose target, setting
inst->scaler_info.enable =3D true, and later requests a 1:1 scale
(scale_width =3D=3D inst->src_fmt.width), the downscaler cannot be disabled=
 via
VIDIOC_S_SELECTION. Additionally, unsupported compose sizes are returned to
userspace without applying them.

> +
> +	if (inst->scaler_info.enable) {
> +		min_scale_width =3D ALIGN((inst->src_fmt.width / 8), step);
> +		min_scale_height =3D ALIGN((inst->src_fmt.height / 8), step);
> +
> +		if (scale_width < W6_MIN_DEC_PIC_WIDTH)
> +			scale_width =3D W6_MIN_DEC_PIC_WIDTH;
> +		if (scale_width < min_scale_width)
> +			scale_width =3D min_scale_width;
> +		if (scale_height < W6_MIN_DEC_PIC_HEIGHT)
> +			scale_height =3D W6_MIN_DEC_PIC_HEIGHT;
> +		if (scale_height < min_scale_height)
> +			scale_height =3D min_scale_height;
> +
> +		inst->scaler_info.width =3D scale_width;
> +		inst->scaler_info.height =3D scale_height;
> +	}
> +
> +	s->r.left =3D 0;
> +	s->r.top =3D 0;
> +	s->r.width =3D scale_width;
> +	s->r.height =3D scale_height;
> +
> +	return 0;
> +}

[ ... ]

> +static void wave6_handle_last_frame(struct vpu_instance *inst,
> +				    struct vb2_v4l2_buffer *dst_buf)
> +{
> +	int i;
> +
> +	if (!dst_buf) {
> +		dst_buf =3D v4l2_m2m_dst_buf_remove(inst->v4l2_fh.m2m_ctx);
> +		if (!dst_buf) {
> +			inst->next_buf_last =3D true;

[Severity: High]
Can this data race on inst->next_buf_last cause decoded buffers to be
permanently stranded in the ready queue?

The worker thread executes wave6_handle_last_frame() without the queue lock
and sets inst->next_buf_last. Concurrently, userspace calling VIDIOC_QBUF
invokes wave6_vpu_dec_buf_queue_dst() under the queue lock. If QBUF checks
the flag before the worker sets it, it queues the buffer normally. Then the
worker sets the flag, and the next queued buffer will intercept the flag,
stranding the first one.

> +			return;
> +		}
> +	}
> +
> +	for (i =3D 0; i < inst->dst_fmt.num_planes; i++)
> +		vb2_set_plane_payload(&dst_buf->vb2_buf, i, 0);
> +
> +	dst_buf->flags |=3D V4L2_BUF_FLAG_LAST;
> +	dst_buf->field =3D V4L2_FIELD_NONE;
> +	v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
> +
> +	if (inst->state !=3D VPU_INST_STATE_INIT_SEQ) {
> +		dev_dbg(inst->dev->dev, "[%d] eos\n", inst->id);
> +		inst->eos =3D true;
> +		v4l2_m2m_set_src_buffered(inst->v4l2_fh.m2m_ctx, false);
> +	}
> +}

[ ... ]

> +static void wave6_vpu_dec_handle_source_change(struct vpu_instance *inst)
> +{
> +	static const struct v4l2_event vpu_event_src_ch =3D {
> +		.type =3D V4L2_EVENT_SOURCE_CHANGE,
> +		.u.src_change.changes =3D V4L2_EVENT_SRC_CH_RESOLUTION,
> +	};
> +	struct dec_seq_info *info =3D &inst->codec_info->dec_info.seq_info;
> +
> +	dev_dbg(inst->dev->dev, "pic size %dx%d profile %d, min_fb_cnt : %d | m=
in_disp_cnt : %d\n",
> +		info->pic_width, info->pic_height,
> +		info->profile, info->min_frame_buffer_count, info->frame_buf_delay);
> +
> +	wave6_vpu_dec_retry_one_frame(inst);
> +	wave6_vpu_dec_reset_frame_buffer_info(inst);
> +	inst->fbc_buf_registered =3D false;
> +
> +	wave6_vpu_set_instance_state(inst, VPU_INST_STATE_INIT_SEQ);
> +
> +	inst->crop.left =3D info->pic_crop_rect.left;
> +	inst->crop.top =3D info->pic_crop_rect.top;
> +	inst->crop.width =3D info->pic_crop_rect.right - inst->crop.left;
> +	inst->crop.height =3D info->pic_crop_rect.bottom - inst->crop.top;
> +
> +	wave6_update_v4l2_ctrls(inst, info);
> +	wave6_update_color_info(inst, info);
> +	wave6_update_pix_fmt(&inst->src_fmt, info->pic_width, info->pic_height);
> +	wave6_update_pix_fmt_cap(&inst->dst_fmt,
> +				 info->pic_width, info->pic_height,
> +				 true);

[Severity: Medium]
Is there a data race when modifying these shared format and selection
structures?

wave6_vpu_dec_handle_source_change() updates them from the threaded IRQ
context without acquiring the device lock, which can race with userspace
reading them via VIDIOC_G_FMT under the device lock, resulting in torn read=
s.

> +
> +	trace_wave6_vpu_source_change(inst, info);
> +
> +	v4l2_event_queue_fh(&inst->v4l2_fh, &vpu_event_src_ch);
> +}

[ ... ]

> +static int wave6_vpu_dec_g_fmt_cap(struct file *file, void *fh, struct v=
4l2_format *f)
> +{
> +	struct vpu_instance *inst =3D wave6_file_to_vpu_inst(file);
> +	struct v4l2_pix_format_mplane *pix_mp =3D &f->fmt.pix_mp;
> +	int i;
> +
> +	pix_mp->width =3D inst->dst_fmt.width;
> +	pix_mp->height =3D inst->dst_fmt.height;

[Severity: Medium]
This reads the format structures under the device lock, racing with the
lockless updates from the IRQ in wave6_vpu_dec_handle_source_change().

> +	pix_mp->pixelformat =3D inst->dst_fmt.pixelformat;
> +	pix_mp->field =3D inst->dst_fmt.field;
> +	pix_mp->flags =3D inst->dst_fmt.flags;
> +	pix_mp->num_planes =3D inst->dst_fmt.num_planes;
> +	for (i =3D 0; i < pix_mp->num_planes; i++) {
> +		pix_mp->plane_fmt[i].bytesperline =3D inst->dst_fmt.plane_fmt[i].bytes=
perline;
> +		pix_mp->plane_fmt[i].sizeimage =3D inst->dst_fmt.plane_fmt[i].sizeimag=
e;
> +	}
> +
> +	pix_mp->colorspace =3D inst->colorspace;
> +	pix_mp->ycbcr_enc =3D inst->ycbcr_enc;
> +	pix_mp->quantization =3D inst->quantization;
> +	pix_mp->xfer_func =3D inst->xfer_func;
> +
> +	return 0;
> +}

[ ... ]

> +static void wave6_vpu_dec_buf_queue_dst(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> +	struct vpu_instance *inst =3D vb2_get_drv_priv(vb->vb2_queue);
> +
> +	dev_dbg(inst->dev->dev, "type %4d index %4d size[0] %4ld size[1] : %4ld=
 | size[2] : %4ld\n",
> +		vb->type, vb->index, vb2_plane_size(&vbuf->vb2_buf, 0),
> +		vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->vb2_buf, 2));
> +
> +	inst->queued_dst_buf_num++;
> +	if (inst->next_buf_last) {
> +		wave6_handle_last_frame(inst, vbuf);
> +		inst->next_buf_last =3D false;

[Severity: High]
This QBUF path evaluates and resets inst->next_buf_last without synchroniza=
tion
against the worker thread executing wave6_handle_last_frame(), contributing
to the data race.

> +	} else {
> +		v4l2_m2m_buf_queue(inst->v4l2_fh.m2m_ctx, vbuf);
> +	}
> +}

[ ... ]

> +static void wave6_vpu_dec_stop_streaming(struct vb2_queue *q)
> +{
> +	struct vpu_instance *inst =3D vb2_get_drv_priv(q);
> +	struct v4l2_m2m_ctx *m2m_ctx =3D inst->v4l2_fh.m2m_ctx;
> +
> +	trace_wave6_vpu_stop_streaming(inst, V4L2_TYPE_IS_OUTPUT(q->type));
> +
> +	dev_dbg(inst->dev->dev, "[%d] %s, input %d, decode %d error %d\n",
> +		inst->id, V4L2_TYPE_IS_OUTPUT(q->type) ? "output" : "capture",
> +		inst->queued_src_buf_num, inst->processed_buf_num, inst->error_buf_num=
);
> +
> +	if (inst->state =3D=3D VPU_INST_STATE_NONE)
> +		goto exit;
> +
> +	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
> +		wave6_vpu_reset_performance(inst);
> +		inst->queued_src_buf_num =3D 0;
> +		inst->processed_buf_num =3D 0;
> +		inst->error_buf_num =3D 0;
> +		inst->state_in_seek =3D inst->state;
> +		v4l2_m2m_set_src_buffered(inst->v4l2_fh.m2m_ctx, false);
> +		wave6_vpu_set_instance_state(inst, VPU_INST_STATE_SEEK);
> +		inst->sequence =3D 0;
> +	} else {
> +		if (v4l2_m2m_has_stopped(m2m_ctx))
> +			v4l2_m2m_clear_state(m2m_ctx);
> +
> +		inst->eos =3D false;
> +		inst->queued_dst_buf_num =3D 0;
> +		inst->sequence =3D 0;
> +		wave6_vpu_dec_flush_instance(inst);
> +	}
> +
> +exit:
> +	wave6_vpu_return_buffers(inst, q->type, VB2_BUF_STATE_ERROR);

[Severity: High]
Can this cause DMA use-after-free and memory corruption?

This unconditionally dequeues all buffers from the M2M ready queue and retu=
rns
them to userspace without synchronously waiting for the active VPU job to
complete. Buffers currently undergoing DMA could be handed back to userspac=
e,
which can unmap or free them while the hardware is still writing.

> +}

[ ... ]

> +static int wave6_vpu_dec_prepare_fb(struct vpu_instance *inst)
> +{
> +	int ret;
> +	unsigned int i;
> +	unsigned int fb_num;
> +	unsigned int mv_num;
> +	unsigned int fb_stride;
> +	unsigned int fb_height;
> +	unsigned int luma_size;
> +	unsigned int chroma_size;
> +	struct dec_seq_info *seq_info =3D &inst->codec_info->dec_info.seq_info;
> +
> +	fb_num =3D seq_info->min_frame_buffer_count;
> +	mv_num =3D seq_info->req_mv_buffer_count;
> +
> +	fb_stride =3D ALIGN(inst->src_fmt.width, W6_FBC_BUF_ALIGNMENT);
> +	fb_height =3D ALIGN(inst->src_fmt.height, W6_FBC_BUF_ALIGNMENT);
> +
> +	luma_size =3D fb_stride * fb_height;
> +	chroma_size =3D ALIGN(fb_stride / 2, W6_FBC_BUF_ALIGNMENT) * fb_height;
> +
> +	for (i =3D 0; i < fb_num; i++) {
> +		struct frame_buffer *frame =3D &inst->frame_buf[i];
> +		struct vpu_buf *vframe =3D &inst->frame_vbuf[i];

[Severity: High]
Can this loop lead to out-of-bounds array accesses?

The firmware-provided min_frame_buffer_count is assigned to fb_num and used
directly as the upper bound for the loop. Since inst->frame_buf and
inst->frame_vbuf are fixed-size arrays (sized WAVE6_MAX_FBS), an excessive
number of buffers could cause out-of-bounds writes if
fb_num > WAVE6_MAX_FBS.

> +
> +		vframe->size =3D luma_size + chroma_size;
> +		ret =3D wave6_vdi_alloc_dma(inst->dev->dev, vframe);
> +		if (ret) {
> +			dev_err(inst->dev->dev, "alloc FBC buffer fail : %zu\n",
> +				vframe->size);
> +			goto error;
> +		}
> +
> +		frame->buf_y =3D vframe->daddr;
> +		frame->buf_cb =3D vframe->daddr + luma_size;
> +		frame->buf_cr =3D (dma_addr_t)-1;
> +		frame->stride =3D fb_stride;
> +		frame->height =3D fb_height;
> +		frame->map_type =3D COMPRESSED_FRAME_MAP;
> +	}

[ ... ]

> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c b/d=
rivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
> new file mode 100644
> index 0000000000000..9015631fc4299
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c

[ ... ]

> +static void wave6_vpu_enc_destroy_instance(struct vpu_instance *inst, bo=
ol remove_dbgfs)
> +{
> +	u32 fail_res =3D 0;
> +	int ret;
> +
> +	wave6_vpu_disable_instance(inst);
> +
> +	if (remove_dbgfs)
> +		wave6_vpu_remove_dbgfs_file(inst);
> +
> +	ret =3D wave6_vpu_enc_close(inst, &fail_res);
> +	if (ret) {
> +		dev_err(inst->dev->dev, "failed destroy instance: %d (%d)\n",
> +			ret, fail_res);
> +	}
> +
> +	scoped_guard(spinlock, &inst->dev->inst_lock)
> +		list_del_init(&inst->list);
> +	wave6_vpu_enc_release_fb(inst);
> +	wave6_vdi_free_dma(&inst->ar_vbuf);
> +	wave6_vpu_set_instance_state(inst, VPU_INST_STATE_NONE);
> +
> +	if (!pm_runtime_suspended(inst->dev->dev))
> +		pm_runtime_put_sync(inst->dev->dev);

[Severity: High]
Does conditionally checking pm_runtime_suspended() here create a usage
counter leak?

This shares the same logic flaw as wave6_vpu_dec_destroy_instance.

> +}
> +
> +static struct vb2_v4l2_buffer *wave6_get_valid_src_buf(struct vpu_instan=
ce *inst)
> +{
> +	struct vb2_v4l2_buffer *vb2_v4l2_buf;
> +	struct v4l2_m2m_buffer *v4l2_m2m_buf;
> +	struct vpu_buffer *vpu_buf =3D NULL;
> +
> +	v4l2_m2m_for_each_src_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {

[Severity: High]
Can iterating over the M2M ready queues locklessly here race with concurrent
queue modifications from VIDIOC_QBUF?

This function uses v4l2_m2m_for_each_src_buf() without acquiring the queue
lock (&inst->dev->dev_lock), leading to linked list corruption and kernel
crashes.

> +		vb2_v4l2_buf =3D &v4l2_m2m_buf->vb;
> +		vpu_buf =3D wave6_to_vpu_buf(vb2_v4l2_buf);
> +
> +		if (!vpu_buf->consumed) {
> +			dev_dbg(inst->dev->dev, "no consumed src idx : %d\n",
> +				vb2_v4l2_buf->vb2_buf.index);
> +			return vb2_v4l2_buf;
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
> +static struct vb2_v4l2_buffer *wave6_get_valid_dst_buf(struct vpu_instan=
ce *inst)
> +{
> +	struct vb2_v4l2_buffer *vb2_v4l2_buf;
> +	struct v4l2_m2m_buffer *v4l2_m2m_buf;
> +	struct vpu_buffer *vpu_buf;
> +
> +	v4l2_m2m_for_each_dst_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {

[Severity: High]
This also performs lockless traversal of the ready queue.

> +		vb2_v4l2_buf =3D &v4l2_m2m_buf->vb;
> +		vpu_buf =3D wave6_to_vpu_buf(vb2_v4l2_buf);
> +
> +		if (!vpu_buf->consumed) {
> +			dev_dbg(inst->dev->dev, "no consumed dst idx : %d\n",
> +				vb2_v4l2_buf->vb2_buf.index);
> +			return vb2_v4l2_buf;
> +		}
> +	}
> +
> +	return NULL;
> +}

[ ... ]

> +static int wave6_allocate_aux_buffer(struct vpu_instance *inst,
> +				     enum aux_buffer_type type,
> +				     unsigned int width,
> +				     unsigned int height,
> +				     int num)
> +{
> +	struct aux_buffer_size_info size_info;
> +	unsigned int size;
> +	int i, ret;
> +
> +	size_info.width =3D width;
> +	size_info.height =3D height;
> +	size_info.type =3D type;
> +
> +	ret =3D wave6_vpu_enc_get_aux_buffer_size(inst, size_info, &size);
> +	if (ret) {
> +		dev_err(inst->dev->dev, "%s: Get size fail (type %d)\n", __func__, typ=
e);
> +		return ret;
> +	}
> +
> +	for (i =3D 0; i < num; i++) {
> +		inst->aux_vbuf[type][i].size =3D size;
> +		ret =3D wave6_vdi_alloc_dma(inst->dev->dev, &inst->aux_vbuf[type][i]);

[Severity: High]
Unlike the decoder version, this encoder's aux buffer allocation lacks a
min_t() bounds check against WAVE6_MAX_FBS, allowing OOB writes.

> +		if (ret) {
> +			dev_err(inst->dev->dev, "%s: Alloc fail (type %d)\n", __func__, type);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}

[ ... ]

> +static int wave6_vpu_enc_start_encode(struct vpu_instance *inst)
> +{
> +	int ret =3D -EINVAL;
> +	struct vb2_v4l2_buffer *src_buf =3D NULL;
> +	struct vb2_v4l2_buffer *dst_buf =3D NULL;
> +	struct vpu_buffer *src_vbuf =3D NULL;
> +	struct vpu_buffer *dst_vbuf =3D NULL;
> +	struct frame_buffer frame_buf;
> +	struct enc_param pic_param;
> +	u32 stride;
> +	u32 luma_size;
> +	u32 stride_c;
> +	u32 chroma_size;
> +	u32 fail_res =3D 0;
> +
> +	memset(&pic_param, 0, sizeof(struct enc_param));
> +	memset(&frame_buf, 0, sizeof(struct frame_buffer));
> +
> +	wave6_calc_source_frame_info(inst, &stride, &luma_size,
> +				     &stride_c, &chroma_size);
> +
> +	ret =3D wave6_update_seq_param(inst);
> +	if (ret)
> +		goto exit;
> +
> +	src_buf =3D wave6_get_valid_src_buf(inst);
> +	dst_buf =3D wave6_get_valid_dst_buf(inst);
> +
> +	if (!dst_buf) {
> +		dev_dbg(inst->dev->dev, "no valid dst buf\n");
> +		goto exit;
> +	}
> +
> +	dst_vbuf =3D wave6_to_vpu_buf(dst_buf);
> +	pic_param.pic_stream_buffer_addr =3D wave6_get_dma_addr(dst_buf, 0);
> +	pic_param.pic_stream_buffer_size =3D vb2_plane_size(&dst_buf->vb2_buf, =
0);
> +	if (!src_buf) {
> +		dev_dbg(inst->dev->dev, "no valid src buf\n");
> +		if (inst->state =3D=3D VPU_INST_STATE_STOP)
> +			pic_param.src_end =3D true;
> +		else
> +			goto exit;

[Severity: High]
Does handling the missing buffer by failing here accelerate the endless loo=
p in
wave6_vpu_job_ready?

If userspace queues a capture buffer but no source buffer, wave6_vpu_job_re=
ady()
returns 1. This function will find no source buffer, immediately return -EI=
NVAL,
and the M2M framework will instantly evaluate job_ready again, resulting in=
 an
infinite CPU lockup.

> +	} else {
> +		src_vbuf =3D wave6_to_vpu_buf(src_buf);
> +		if (inst->src_fmt.num_planes =3D=3D 1) {

[ ... ]

> +	ret =3D wave6_vpu_enc_start_one_frame(inst, &pic_param, &fail_res);
> +	if (ret) {
> +		dev_err(inst->dev->dev, "[%d] %s: fail %d\n", inst->id, __func__, ret);
> +		wave6_vpu_set_instance_state(inst, VPU_INST_STATE_STOP);
> +
> +		dst_buf =3D v4l2_m2m_dst_buf_remove(inst->v4l2_fh.m2m_ctx);
> +		if (dst_buf) {
> +			dst_buf->sequence =3D inst->sequence;
> +			v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
> +		}
> +
> +		src_buf =3D v4l2_m2m_src_buf_remove(inst->v4l2_fh.m2m_ctx);

[Severity: High]
Does the error recovery path wrongly remove and abort in-flight buffers?

When wave6_vpu_enc_start_one_frame() fails, this error recovery path blindly
pops the absolute head of the ready queues. If there are buffers currently =
in
flight (marked consumed =3D true), they sit at the head of the queue. The d=
river
pops the active in-flight buffer and erroneously returns it, while the
unconsumed buffer that actually caused the failure remains stuck in the que=
ue.

> +		if (src_buf) {
> +			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
> +			inst->sequence++;
> +			inst->processed_buf_num++;
> +			inst->error_buf_num++;
> +		}
> +	} else {
> +		dev_dbg(inst->dev->dev, "%s: success\n", __func__);
> +	}
> +
> +exit:
> +	return ret;
> +}

[ ... ]

> +static int wave6_vpu_enc_try_fmt_cap(struct file *file, void *fh, struct=
 v4l2_format *f)
> +{
> +	struct vpu_instance *inst =3D wave6_file_to_vpu_inst(file);
> +	struct v4l2_pix_format_mplane *pix_mp =3D &f->fmt.pix_mp;
> +	const struct vpu_format *vpu_fmt;
> +	int width, height;
> +
> +	dev_dbg(inst->dev->dev, "%s: 4cc %d w %d h %d plane %d colorspace %d\n",
> +		__func__, pix_mp->pixelformat, pix_mp->width, pix_mp->height,
> +		pix_mp->num_planes, pix_mp->colorspace);
> +
> +	if (!V4L2_TYPE_IS_CAPTURE(f->type))
> +		return -EINVAL;
> +
> +	vpu_fmt =3D wave6_find_vpu_fmt(pix_mp->pixelformat, VPU_FMT_TYPE_CODEC);
> +	if (!vpu_fmt) {
> +		width =3D inst->dst_fmt.width;
> +		height =3D inst->dst_fmt.height;
> +		pix_mp->pixelformat =3D inst->dst_fmt.pixelformat;
> +		pix_mp->num_planes =3D inst->dst_fmt.num_planes;
> +	} else {
> +		width =3D pix_mp->width;
> +		height =3D pix_mp->height;
> +		pix_mp->pixelformat =3D vpu_fmt->v4l2_pix_fmt;
> +		pix_mp->num_planes =3D vpu_fmt->num_planes;
> +	}
> +
> +	wave6_update_pix_fmt(pix_mp, width, height);

[Severity: High]
Does this accept arbitrarily small sizeimage values without minimum bounds
clamping?

> +	pix_mp->colorspace =3D inst->colorspace;
> +	pix_mp->ycbcr_enc =3D inst->ycbcr_enc;
> +	pix_mp->quantization =3D inst->quantization;
> +	pix_mp->xfer_func =3D inst->xfer_func;
> +
> +	return 0;
> +}

[ ... ]

> +static int wave6_vpu_enc_s_fmt_out(struct file *file, void *fh, struct v=
4l2_format *f)
> +{
> +	struct vpu_instance *inst =3D wave6_file_to_vpu_inst(file);
> +	struct v4l2_pix_format_mplane *pix_mp =3D &f->fmt.pix_mp;
> +	const struct vpu_format *vpu_fmt;
> +	struct vb2_queue *q;
> +	int i, ret;
> +
> +	dev_dbg(inst->dev->dev, "%s: 4cc %d w %d h %d plane %d colorspace %d\n",
> +		__func__, pix_mp->pixelformat, pix_mp->width, pix_mp->height,
> +		pix_mp->num_planes, pix_mp->colorspace);
> +
> +	q =3D v4l2_m2m_get_vq(inst->v4l2_fh.m2m_ctx, f->type);
> +	if (vb2_is_busy(q))
> +		return -EBUSY;
> +
> +	ret =3D wave6_vpu_enc_try_fmt_out(file, fh, f);
> +	if (ret)
> +		return ret;
> +
> +	vpu_fmt =3D wave6_find_vpu_fmt(pix_mp->pixelformat, VPU_FMT_TYPE_RAW);
> +	if (!vpu_fmt)
> +		return -EINVAL;
> +
> +	inst->src_fmt.width =3D pix_mp->width;
> +	inst->src_fmt.height =3D pix_mp->height;
> +	inst->src_fmt.pixelformat =3D pix_mp->pixelformat;
> +	inst->src_fmt.field =3D pix_mp->field;
> +	inst->src_fmt.flags =3D pix_mp->flags;
> +	inst->src_fmt.num_planes =3D pix_mp->num_planes;
> +	for (i =3D 0; i < inst->src_fmt.num_planes; i++) {
> +		inst->src_fmt.plane_fmt[i].bytesperline =3D pix_mp->plane_fmt[i].bytes=
perline;
> +		inst->src_fmt.plane_fmt[i].sizeimage =3D pix_mp->plane_fmt[i].sizeimag=
e;
> +	}
> +
> +	inst->cbcr_interleave =3D !!(vpu_fmt->flags & VPU_FMT_FLAG_CBCR_INTERLE=
AVED);
> +	inst->nv21 =3D !!(vpu_fmt->flags & VPU_FMT_FLAG_CRCB_ORDER);
> +	inst->colorspace =3D pix_mp->colorspace;
> +	inst->ycbcr_enc =3D pix_mp->ycbcr_enc;
> +	inst->quantization =3D pix_mp->quantization;
> +	inst->xfer_func =3D pix_mp->xfer_func;
> +
> +	wave6_update_pix_fmt(&inst->dst_fmt, pix_mp->width, pix_mp->height);

[Severity: High]
Does this leave the encoder's capture buffer sized for the old resolution?

If userspace sets the source raw format to a high resolution via VIDIOC_S_F=
MT,
the driver updates the destination format via wave6_update_pix_fmt(), but f=
ails
to update the existing sizeimage to match the new resolution requirements f=
or
compressed formats.

> +	wave6_update_crop_info(inst, 0, 0, pix_mp->width, pix_mp->height);
> +
> +	return 0;
> +}

[ ... ]

> +static int wave6_vpu_enc_s_selection(struct file *file, void *fh, struct=
 v4l2_selection *s)
> +{
> +	struct vpu_instance *inst =3D wave6_file_to_vpu_inst(file);
> +	u32 max_crop_w, max_crop_h;
> +
> +	if (!V4L2_TYPE_IS_OUTPUT(s->type))
> +		return -EINVAL;
> +
> +	if (s->target !=3D V4L2_SEL_TGT_CROP)
> +		return -EINVAL;
> +
> +	if (!(s->flags & (V4L2_SEL_FLAG_GE | V4L2_SEL_FLAG_LE)))
> +		s->flags |=3D V4L2_SEL_FLAG_LE;
> +
> +	if (s->flags & V4L2_SEL_FLAG_GE) {
> +		s->r.left =3D round_up(s->r.left, W6_ENC_CROP_STEP);
> +		s->r.top =3D round_up(s->r.top, W6_ENC_CROP_STEP);
> +		s->r.width =3D round_up(s->r.width, W6_ENC_CROP_STEP);
> +		s->r.height =3D round_up(s->r.height, W6_ENC_CROP_STEP);
> +	}
> +	if (s->flags & V4L2_SEL_FLAG_LE) {
> +		s->r.left =3D round_down(s->r.left, W6_ENC_CROP_STEP);
> +		s->r.top =3D round_down(s->r.top, W6_ENC_CROP_STEP);
> +		s->r.width =3D round_down(s->r.width, W6_ENC_CROP_STEP);
> +		s->r.height =3D round_down(s->r.height, W6_ENC_CROP_STEP);
> +	}
> +
> +	s->r.left =3D clamp_t(s32, s->r.left, 0,
> +			    inst->src_fmt.width - W6_MIN_ENC_PIC_WIDTH);
> +	s->r.top =3D clamp_t(s32, s->r.top, 0,
> +			   inst->src_fmt.height - W6_MIN_ENC_PIC_HEIGHT);
> +
> +	max_crop_w =3D inst->src_fmt.width - s->r.left;
> +	max_crop_h =3D inst->src_fmt.height - s->r.top;
> +
> +	if (!s->r.width || !s->r.height)
> +		return 0;

[Severity: Medium]
Does this early return bypass the required bound clamping and struct updati=
ng,
violating V4L2 compliance?

If userspace requests a crop selection with width =3D 0 or height =3D 0, th=
e driver
returns 0, signaling success, but it does not adjust the rectangle to the
minimum valid size as mandated by the V4L2 spec, leaving the application wi=
th
false assumptions about the hardware configuration.

> +	if (max_crop_w < W6_MIN_ENC_PIC_WIDTH)
> +		return 0;
> +	if (max_crop_h < W6_MIN_ENC_PIC_HEIGHT)
> +		return 0;
> +
> +	s->r.width =3D clamp(s->r.width, W6_MIN_ENC_PIC_WIDTH, max_crop_w);
> +	s->r.height =3D clamp(s->r.height, W6_MIN_ENC_PIC_HEIGHT, max_crop_h);

[ ... ]

> +static void wave6_vpu_enc_stop_streaming(struct vb2_queue *q)
> +{
> +	struct vpu_instance *inst =3D vb2_get_drv_priv(q);
> +
> +	trace_wave6_vpu_stop_streaming(inst, V4L2_TYPE_IS_OUTPUT(q->type));
> +
> +	dev_dbg(inst->dev->dev, "[%d] %s, input %d, encode %d\n",
> +		inst->id, V4L2_TYPE_IS_OUTPUT(q->type) ? "output" : "capture",
> +		inst->queued_src_buf_num, inst->sequence);
> +
> +	if (inst->state =3D=3D VPU_INST_STATE_NONE)
> +		goto exit;
> +
> +	if (wave6_vpu_both_queues_are_streaming(inst))
> +		wave6_vpu_set_instance_state(inst, VPU_INST_STATE_STOP);
> +
> +	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
> +		wave6_vpu_reset_performance(inst);
> +		inst->queued_src_buf_num =3D 0;
> +		inst->processed_buf_num =3D 0;
> +		inst->error_buf_num =3D 0;
> +		inst->sequence =3D 0;
> +		v4l2_m2m_set_src_buffered(inst->v4l2_fh.m2m_ctx, false);
> +	} else {
> +		inst->eos =3D false;
> +		inst->queued_dst_buf_num =3D 0;
> +	}
> +
> +	if (V4L2_TYPE_IS_CAPTURE(q->type) && inst->state !=3D VPU_INST_STATE_NO=
NE)
> +		wave6_vpu_enc_destroy_instance(inst, true);
> +
> +exit:
> +	wave6_vpu_return_buffers(inst, q->type, VB2_BUF_STATE_ERROR);

[Severity: High]
Does this free DMA buffers and return them to userspace without stopping or
waiting for the active VPU job to complete?

This unconditionally dequeues all buffers and returns them, meaning buffers
currently undergoing DMA could be unmapped or freed while the hardware is
still writing, leading to silent memory corruption or IOMMU faults.

> +}

[ ... ]

> +static void wave6_vpu_enc_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> +	struct vpu_instance *inst =3D vb2_get_drv_priv(vb->vb2_queue);
> +	struct vpu_buffer *vpu_buf =3D wave6_to_vpu_buf(vbuf);
> +
> +	dev_dbg(inst->dev->dev, "type %4d index %4d size[0] %4ld size[1] : %4ld=
 | size[2] : %4ld\n",
> +		vb->type, vb->index, vb2_plane_size(&vbuf->vb2_buf, 0),
> +		vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->vb2_buf, 2));
> +
> +	if (V4L2_TYPE_IS_OUTPUT(vb->type)) {
> +		vbuf->sequence =3D inst->queued_src_buf_num++;
> +
> +		vpu_buf->ts_input =3D ktime_get_raw();
> +		vpu_buf->force_key_frame =3D inst->enc_ctrls.force_key_frame;
> +		inst->enc_ctrls.force_key_frame =3D false;

[Severity: Medium]
Does reading and modifying the control structure locklessly here race with =
the
V4L2 S_CTRL framework?

This runs from VIDIOC_QBUF under the queue lock, modifying the same variabl=
es
that wave6_vpu_enc_s_ctrl() accesses from VIDIOC_S_CTRL under the control
handler lock. Simultaneous QBUF and S_CTRL calls could cause race condition=
s.

> +		vpu_buf->force_frame_qp =3D !inst->enc_ctrls.frame_rc_enable;
> +		if (vpu_buf->force_frame_qp) {
> +			if (inst->std =3D=3D W_AVC_ENC) {
> +				vpu_buf->force_i_frame_qp =3D inst->enc_ctrls.h264.i_frame_qp;
> +				vpu_buf->force_p_frame_qp =3D inst->enc_ctrls.h264.p_frame_qp;
> +				vpu_buf->force_b_frame_qp =3D inst->enc_ctrls.h264.b_frame_qp;
> +			} else if (inst->std =3D=3D W_HEVC_ENC) {
> +				vpu_buf->force_i_frame_qp =3D inst->enc_ctrls.hevc.i_frame_qp;
> +				vpu_buf->force_p_frame_qp =3D inst->enc_ctrls.hevc.p_frame_qp;
> +				vpu_buf->force_b_frame_qp =3D inst->enc_ctrls.hevc.b_frame_qp;
> +			}
> +		}
> +	} else {
> +		inst->queued_dst_buf_num++;
> +	}
> +
> +	vpu_buf->consumed =3D false;
> +	vpu_buf->used =3D false;
> +	v4l2_m2m_buf_queue(inst->v4l2_fh.m2m_ctx, vbuf);
> +}

[ ... ]

> +static int wave6_vpu_enc_prepare_fb(struct vpu_instance *inst)
> +{
> +	int ret;
> +	unsigned int i;
> +	unsigned int fb_num;
> +	unsigned int mv_num;
> +	unsigned int fb_stride, fb_stride_c;
> +	unsigned int fb_height;
> +	unsigned int luma_size;
> +	unsigned int chroma_size;
> +	struct enc_seq_info *seq_info =3D &inst->codec_info->enc_info.seq_info;
> +	struct enc_open_param *open_param =3D &inst->codec_info->enc_info.open_=
param;
> +
> +	fb_num =3D seq_info->min_frame_buffer_count;
> +	mv_num =3D seq_info->req_mv_buffer_count;
> +
> +	fb_stride =3D ALIGN(inst->codec_rect.width, W6_FBC_BUF_ALIGNMENT);
> +	fb_height =3D ALIGN(inst->codec_rect.height, W6_FBC_BUF_ALIGNMENT);
> +	if (open_param->rot_angle =3D=3D ROT_90 || open_param->rot_angle =3D=3D=
 ROT_270) {
> +		fb_stride =3D ALIGN(inst->codec_rect.height, W6_FBC_BUF_ALIGNMENT);
> +		fb_height =3D ALIGN(inst->codec_rect.width, W6_FBC_BUF_ALIGNMENT);
> +	}
> +	luma_size =3D fb_stride * fb_height;
> +
> +	fb_stride_c =3D ALIGN(fb_stride / 2, W6_FBC_BUF_ALIGNMENT);
> +	chroma_size =3D fb_stride_c * fb_height;
> +
> +	for (i =3D 0; i < fb_num; i++) {
> +		struct frame_buffer *frame =3D &inst->frame_buf[i];
> +		struct vpu_buf *vframe =3D &inst->frame_vbuf[i];

[Severity: High]
Does this encoder loop blindly trust the hardware-provided frame count with=
out
validation against WAVE6_MAX_FBS, similar to the decoder?

> +
> +		vframe->size =3D luma_size + chroma_size;
> +		ret =3D wave6_vdi_alloc_dma(inst->dev->dev, vframe);
> +		if (ret) {
> +			dev_err(inst->dev->dev, "alloc FBC buffer fail : %zu\n",
> +				vframe->size);
> +			goto error;
> +		}
> +
> +		frame->buf_y =3D vframe->daddr;
> +		frame->buf_cb =3D vframe->daddr + luma_size;
> +		frame->buf_cr =3D (dma_addr_t)-1;
> +		frame->stride =3D fb_stride;
> +		frame->stride_c =3D fb_stride_c;
> +		frame->height =3D fb_height;
> +		frame->map_type =3D COMPRESSED_FRAME_MAP;
> +	}

[ ... ]

> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c b/=
drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
> new file mode 100644
> index 0000000000000..9d3af14efd9d0
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c

[ ... ]

> +void wave6_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp,
> +			  unsigned int width,
> +			  unsigned int height)
> +{
> +	const struct v4l2_format_info *fmt_info;
> +	unsigned int stride_y;
> +	int i;
> +
> +	pix_mp->width =3D width;
> +	pix_mp->height =3D height;
> +	pix_mp->flags =3D 0;
> +	pix_mp->field =3D V4L2_FIELD_NONE;
> +	memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));
> +
> +	fmt_info =3D v4l2_format_info(pix_mp->pixelformat);
> +	if (!fmt_info) {
> +		pix_mp->plane_fmt[0].bytesperline =3D 0;
> +		if (!pix_mp->plane_fmt[0].sizeimage)
> +			pix_mp->plane_fmt[0].sizeimage =3D width * height;
> +
> +		return;

[Severity: High]
Does this fail to recalculate or clamp sizeimage if it is already non-zero =
for
compressed formats?

Because fmt_info is NULL for compressed formats, it returns without updating
the existing sizeimage to match the new resolution requirements, leading to
undersized buffers that could corrupt memory.

> +	}
> +
> +	stride_y =3D width * fmt_info->bpp[0];
> +	if (pix_mp->plane_fmt[0].bytesperline <=3D W6_MAX_PIC_STRIDE)
> +		stride_y =3D max(stride_y, pix_mp->plane_fmt[0].bytesperline);

[ ... ]

> +struct vb2_v4l2_buffer *wave6_get_dst_buf_by_addr(struct vpu_instance *i=
nst,
> +						  dma_addr_t addr)
> +{
> +	struct vb2_v4l2_buffer *vb2_v4l2_buf;
> +	struct v4l2_m2m_buffer *v4l2_m2m_buf;
> +	struct vb2_v4l2_buffer *dst_buf =3D NULL;
> +
> +	v4l2_m2m_for_each_dst_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {

[Severity: High]
Does this locklessly traverse the M2M ready queue?

Like the encoder functions, iterating the M2M ready queues from the worker
thread or IRQ handler without acquiring the queue lock races with concurrent
userspace calls to VIDIOC_QBUF modifying the same linked list.

> +		vb2_v4l2_buf =3D &v4l2_m2m_buf->vb;
> +		if (addr =3D=3D wave6_get_dma_addr(vb2_v4l2_buf, 0)) {
> +			dst_buf =3D vb2_v4l2_buf;
> +			break;
> +		}
> +	}
> +
> +	return dst_buf;
> +}

[ ... ]

> +static int wave6_vpu_job_ready(void *priv)
> +{
> +	struct vpu_instance *inst =3D priv;
> +
> +	dev_dbg(inst->dev->dev, "[%d]%s: state %d\n",
> +		inst->id, __func__, inst->state);
> +
> +	if (inst->state =3D=3D VPU_INST_STATE_OPEN)
> +		return 1;
> +	if (inst->state < VPU_INST_STATE_PIC_RUN)
> +		return 0;
> +	if (inst->state =3D=3D VPU_INST_STATE_STOP && inst->eos)
> +		return 0;
> +	if (!wave6_vpu_check_fb_available(inst))
> +		return 0;
> +
> +	return 1;

[Severity: High]
Does this fail to enforce that source buffers are ready before signaling th=
e m2m
core to run?

It checks only destination buffer availability. If no source buffer is queu=
ed,
it still returns 1, leading wave6_vpu_enc_start_encode to fail and exit. The
M2M framework will instantly evaluate job_ready again, resulting in an infi=
nite
CPU lockup.

> +}
> +
> +static void wave6_vpu_device_run_timeout(struct work_struct *work)
> +{
> +	struct delayed_work *dwork =3D to_delayed_work(work);
> +	struct vpu_core_device *core =3D container_of(dwork, struct vpu_core_de=
vice, task_timer);
> +	struct vpu_instance *inst =3D v4l2_m2m_get_curr_priv(core->m2m_dev);
> +	struct vb2_v4l2_buffer *src_buf =3D NULL;
> +	struct vb2_v4l2_buffer *dst_buf =3D NULL;
> +
> +	if (!inst)
> +		return;
> +
> +	dev_err(inst->dev->dev, "[%d] sequence %d timeout\n", inst->id, inst->s=
equence);
> +	src_buf =3D v4l2_m2m_src_buf_remove(inst->v4l2_fh.m2m_ctx);
> +	if (src_buf) {
> +		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);

[Severity: High]
Does the timeout handler remove and complete the source buffer without
synchronization against the hardware IRQ path?

> +		if (inst->type =3D=3D VPU_INST_TYPE_DEC)
> +			inst->processed_buf_num++;
> +		inst->error_buf_num++;
> +	}
> +
> +	dst_buf =3D v4l2_m2m_dst_buf_remove(inst->v4l2_fh.m2m_ctx);
> +	if (dst_buf)
> +		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
> +
> +	vb2_queue_error(v4l2_m2m_get_src_vq(inst->v4l2_fh.m2m_ctx));
> +	vb2_queue_error(v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx));
> +
> +	v4l2_m2m_job_finish(inst->dev->m2m_dev, inst->v4l2_fh.m2m_ctx);

[Severity: High]
Does the timeout handler finish the M2M job without aborting the hardware
sequence or synchronizing against the hardware completion path?

Because the underlying hardware job is not aborted, it can finish later and
trigger wave6_vpu_finish_job(), which will call v4l2_m2m_job_finish() a sec=
ond
time for the same context, causing queue corruption.

> +}
> +
> +static void wave6_vpu_device_run(void *priv)
> +{

[ ... ]

> +void wave6_vpu_finish_job(struct vpu_instance *inst)
> +{
> +	cancel_delayed_work_sync(&inst->dev->task_timer);
> +	v4l2_m2m_job_finish(inst->dev->m2m_dev, inst->v4l2_fh.m2m_ctx);

[Severity: High]
This path executes once the rogue hardware job completes, creating a duplic=
ate
job completion due to the earlier v4l2_m2m_job_finish() in the timeout hand=
ler.

> +}

[ ... ]

> +void wave6_vpu_release_m2m_dev(struct vpu_core_device *core)
> +{
> +	v4l2_m2m_release(core->m2m_dev);
> +}

[Severity: High]
Does this teardown function leave the asynchronous workqueue timer unattend=
ed?

If wave6_vpu_release_m2m_dev() is called while a VPU job is executing,
completely omitting cancel_delayed_work_sync(&core->task_timer) can cause a
use-after-free if the timeout fires after the driver memory is freed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788496816.gi=
t.nas.chung@chipsnmedia.com?part=3D4
