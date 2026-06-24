Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE1C2EEE92
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 07:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782286833; cv=none; b=J7Y/iV0frdRTe4pA596l3qBvlWU/K5r/2rhCLBn9SFsmypSqBHC6EKzx1PjW41FAvGLkE1pQ//S/sY93PNMdWjir5HiFLly2ax4IsDjqo0lbDPUnKAuIeArZdQBXF6oB2AINee+si+5tTlMevMa2hzkfgyxYBoAuZ7J2DZrI1Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782286833; c=relaxed/simple;
	bh=RTx75lCrXhjyygqNIox6FZVYdecJFXXCZSscC8czhxk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rgkbrv3MEoP8Wq8Aj64Nb3LGkbvQSuVRfo6x/MXPeCGM7Jay0+jOaDxJcI2SflrDLXlzLa8SxwhYBHxRP0/ZnhBHhE99Hbgq5keKEkKDvTeas1KZMfnAlTCBR0PZ2vB5/WvdS/PH4ZIIudJx1YhvleJ4tgcTagY9/lYxzs4uj4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X/nF82qY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X/nF82qY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 617F21F000E9;
	Wed, 24 Jun 2026 07:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782286831;
	bh=JgcySwCRvvQrgjPrpnsyBsd5tJVBfys9XsZvhkTCCgE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X/nF82qY5qc+cFd0Df/C896NwENJxNWMEqt/ZFYR+b8DMgJEqZHTbelz5za9XiZG9
	 w2KTIx0tQ4g1st9XTgAhYcTVRXwdnvMrrUqhC5A05a4Jr63nuIp72fGWxNfkBqxhGD
	 XgpEVvjiM3dMFw5/Nr+0O0ElS8Rhv5xUYrpklLBr6Fv5bZfjSUTnf0hL69ceFz6Kus
	 2t+aY8U2n8uwbA7coTtvcVz3WsiFyi3P0D5jbQRgqVy9HcYzgvggsx5MUZo3GxAnl4
	 0B6AXC6naLirObqzJoSpLRBF1Z8zdVCP/LKmjDeEO3HsZc3UwY2RM0olssFO54q6CC
	 9xYFUvZcYjd5A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/9] media: chips-media: wave6: Add v4l2 m2m driver
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nas Chung" <nas.chung@chipsnmedia.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260624072043.238-5-nas.chung@chipsnmedia.com>
References: <20260624072043.238-1-nas.chung@chipsnmedia.com>
 <20260624072043.238-5-nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 07:40:30 +0000
Message-Id: <20260624074031.617F21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] On encoder/decoder start failure, the driver removes the wrong sou=
rce buffer from the M2M queue, leading to premature buffer completion and U=
se-After-Free.
- [High] The decoder `VIDIOC_S_FMT` handlers lack `vb2_is_busy()` checks, a=
llowing userspace to dynamically change the pixel format during streaming.
- [High] Missing `vb2_is_busy()` check in encoder's `s_selection` allows ch=
anging crop dimensions during streaming, leading to hardware DMA out-of-bou=
nds writes.
- [High] The `video_device` structure is allocated with `devm_kzalloc`, lea=
ding to a Use-After-Free on driver unbind.
- [High] A race condition in the global `task_timer` timeout handler leads =
to Use-After-Free and M2M state corruption.
- [High] Unprotected traversal of `v4l2_m2m` ready queues causes linked lis=
t corruption.
- [High] Out-of-bounds array reads and writes due to unvalidated frame buff=
er and motion vector counts returned directly from hardware registers.
- [High] Missing hardware reset and completion reinitialization on VPU time=
out leaves a stray completion that corrupts future hardware syncs.
- [Medium] Conditionally dropping the PM usage counter based on `pm_runtime=
_suspended()` leaks the usage counter.
- [Medium] Decoder permanently enables the hardware scaler once scaling is =
requested.
--

commit 85193b153b6b5079480d70d95e569973a1a2732e
Author: Nas Chung <nas.chung@chipsnmedia.com>

media: chips-media: wave6: Add v4l2 m2m driver support

This commit adds V4L2 M2M stateful driver support for the Chips&Media
Wave6 video codec IP, covering both encoder and decoder. It includes
multiplanar format support, scaling, and extensive V4L2 encoder controls
for AVC and HEVC formats.

> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c b/d=
rivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
> index 0000000000000..9545264c19b7f 100644
> --- a/drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c

[ ... ]

> @@ -152,6 +152,8 @@ static void wave6_vpu_dec_destroy_instance(struct vpu=
_instance *inst, bool remov
>  	wave6_vpu_dec_release_fb(inst);
>  	wave6_vpu_set_instance_state(inst, VPU_INST_STATE_NONE);
> =20
>  	if (!pm_runtime_suspended(inst->dev->dev))
>  		pm_runtime_put_sync(inst->dev->dev);
>  }

[Severity: Medium]
Will this skip dropping the PM usage counter if the device is runtime suspe=
nded?

If the device enters runtime suspend (e.g., via system suspend) and
pm_runtime_suspended() returns true, pm_runtime_put_sync() is skipped. This
seems to leave the usage counter elevated, which could permanently prevent =
the
VPU from entering runtime suspend again.

[ ... ]

> @@ -219,6 +219,8 @@ static void wave6_vpu_dec_handle_dst_buffer(struct vp=
u_instance *inst)
>  	int consumed_num =3D wave6_vpu_get_consumed_fb_num(inst);
>  	int ret;
> =20
>  	v4l2_m2m_for_each_dst_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {
>  		dst_buf =3D &v4l2_m2m_buf->vb;
>  		vpu_buf =3D wave6_to_vpu_buf(dst_buf);

[Severity: High]
Does traversing the V4L2 M2M ready queue here require holding the rdy_spinl=
ock?

The v4l2_m2m_for_each_dst_buf() macro iterates over the rdy_queue, which ca=
n be
modified concurrently by VIDIOC_QBUF in process context. Traversing this qu=
eue
without the rdy_spinlock might result in following stale list pointers and
causing linked list corruption.

[ ... ]

> @@ -598,6 +598,8 @@ static int wave6_vpu_dec_start_decode(struct vpu_inst=
ance *inst)
>  		dev_err(inst->dev->dev, "[%d] %s: fail %d\n", inst->id, __func__, ret);
>  		wave6_vpu_set_instance_state(inst, VPU_INST_STATE_STOP);
> =20
>  		src_buf =3D v4l2_m2m_src_buf_remove(inst->v4l2_fh.m2m_ctx);
>  		if (src_buf) {
>  			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);

[Severity: High]
If start_one_frame fails, could removing the first buffer from the source q=
ueue
complete the wrong buffer?

Since the VPU driver allows multiple source buffers to be in flight (such as
for B-frame reordering), the first buffer in the M2M rdy_queue might be
actively processing. Unconditionally popping it via v4l2_m2m_src_buf_remove=
()
and completing it with VB2_BUF_STATE_ERROR would return an active buffer to
userspace. If userspace then frees or unmaps it, this could lead to a
Use-After-Free or DMA memory corruption.

[ ... ]

> @@ -682,6 +682,8 @@ static int wave6_vpu_dec_s_fmt_cap(struct file *file,=
 void *fh, struct v4l2_form
>  		__func__, pix_mp->pixelformat, pix_mp->width, pix_mp->height,
>  		pix_mp->num_planes, pix_mp->colorspace);
> =20
>  	ret =3D wave6_vpu_dec_try_fmt_cap(file, fh, f);
>  	if (ret)
>  		return ret;
> =20
>  	vpu_fmt =3D wave6_find_vpu_fmt(pix_mp->pixelformat, VPU_FMT_TYPE_RAW);

[Severity: High]
Should there be a vb2_is_busy() check here to prevent userspace from changi=
ng
the format mid-stream?

Without this check, the format and inst->dst_fmt properties can be modified
during streaming without reallocating buffers. This could cause the driver =
to
calculate out-of-bounds DMA addresses and corrupt memory.

[ ... ]

> @@ -766,6 +766,8 @@ static int wave6_vpu_dec_s_fmt_out(struct file *file,=
 void *fh, struct v4l2_form
>  		__func__, pix_mp->pixelformat, pix_mp->width, pix_mp->height,
>  		pix_mp->num_planes, pix_mp->colorspace);
> =20
>  	ret =3D wave6_vpu_dec_try_fmt_out(file, fh, f);
>  	if (ret)
>  		return ret;
> =20
>  	pix_mp->colorspace =3D in_pix_mp.colorspace;

[Severity: High]
Does this also need a vb2_is_busy() check to prevent mid-stream format chan=
ges
on the output queue?

Altering inst->src_fmt while streaming could lead to similar out-of-bounds
DMA operations.

[ ... ]

> @@ -954,6 +954,8 @@ static int wave6_vpu_dec_s_selection(struct file *fil=
e, void *fh, struct v4l2_se
>  		scale_height =3D round_down(scale_height, step);
>  	}
> =20
>  	if (scale_width < inst->src_fmt.width ||
>  	    scale_height < inst->src_fmt.height)
>  		inst->scaler_info.enable =3D true;
> =20
>  	if (inst->scaler_info.enable) {

[Severity: Medium]
If a subsequent call requests a 1:1 scale, does inst->scaler_info.enable ev=
er
get reset to false?

It appears the scaler is permanently enabled once requested. If userspace
reverts to a 1:1 scale later, the hardware scaler remains active, which mig=
ht
introduce unnecessary overhead or logic errors.

[ ... ]

> @@ -1323,6 +1323,8 @@ static int wave6_vpu_dec_prepare_fb(struct vpu_inst=
ance *inst)
>  	luma_size =3D fb_stride * fb_height;
>  	chroma_size =3D ALIGN(fb_stride / 2, W6_FBC_BUF_ALIGNMENT) * fb_height;
> =20
>  	for (i =3D 0; i < fb_num; i++) {
>  		struct frame_buffer *frame =3D &inst->frame_buf[i];
>  		struct vpu_buf *vframe =3D &inst->frame_vbuf[i];
> =20
>  		vframe->size =3D luma_size + chroma_size;

[Severity: High]
Can fb_num (derived from the hardware register W6_RET_DEC_MIN_FB_CNT) exceed
the WAVE6_MAX_FBS array bounds?

The values min_frame_buffer_count and req_mv_buffer_count are read directly
from hardware in wave6_get_dec_seq_result() without validation. If the
hardware or firmware returns a value larger than the fixed-size array bound=
s,
this loop could cause out-of-bounds writes to the inst->frame_buf and
inst->frame_vbuf arrays.

[ ... ]

> @@ -1803,6 +1803,8 @@ int wave6_vpu_dec_register_device(struct vpu_core_d=
evice *core)
>  	struct video_device *vdev_dec;
>  	int ret;
> =20
>  	vdev_dec =3D devm_kzalloc(core->v4l2_dev.dev, sizeof(*vdev_dec), GFP_KE=
RNEL);
>  	if (!vdev_dec)
>  		return -ENOMEM;
> =20
>  	core->video_dev_dec =3D vdev_dec;

[Severity: High]
Is it safe to allocate the video_device with devm_kzalloc() here?

The V4L2 video_device structure must be freed dynamically in its release
callback (currently assigned video_device_release_empty) when the last file
descriptor is closed. If the device is unbound via sysfs while userspace ho=
lds
an open file descriptor, devm_kzalloc will free the memory, but the V4L2 co=
re
will still hold pointers to it. This could result in a Use-After-Free during
subsequent ioctl or close operations.

> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c b/d=
rivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
> index 0000000000000..825229f6fb051 100644
> --- a/drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c

[ ... ]

> @@ -422,6 +422,8 @@ static int wave6_allocate_aux_buffer(struct vpu_insta=
nce *inst,
>  		return ret;
>  	}
> =20
>  	for (i =3D 0; i < num; i++) {
>  		inst->aux_vbuf[type][i].size =3D size;
>  		ret =3D wave6_vdi_alloc_dma(inst->dev->dev, &inst->aux_vbuf[type][i]);
>  		if (ret) {

[Severity: High]
Is the num parameter validated against the array size before this loop?

Unlike the decoder's allocate function which clamps num to WAVE6_MAX_FBS,
the encoder seems to use the unvalidated num (derived from hardware registe=
rs)
directly. This could lead to out-of-bounds writes into the aux_vbuf array if
the hardware returns an unexpectedly large value.

[ ... ]

> @@ -783,6 +783,8 @@ static int wave6_vpu_enc_s_selection(struct file *fil=
e, void *fh, struct v4l2_se
>  	s->r.width =3D clamp(s->r.width, W6_MIN_ENC_PIC_WIDTH, max_crop_w);
>  	s->r.height =3D clamp(s->r.height, W6_MIN_ENC_PIC_HEIGHT, max_crop_h);
> =20
>  	wave6_update_pix_fmt(&inst->dst_fmt, s->r.width, s->r.height);
>  	wave6_update_crop_info(inst, s->r.left, s->r.top, s->r.width, s->r.heig=
ht);
> =20
>  	dev_dbg(inst->dev->dev, "V4L2_SEL_TGT_CROP %dx%dx%dx%d\n",

[Severity: High]
Should there be a vb2_is_busy() check before updating the crop dimensions?

Without checking if the queues are busy, userspace can change the crop
dimensions during streaming. If a larger crop selection is set,
inst->codec_rect is updated, and the hardware will be programmed with larger
dimensions than the previously allocated internal FBC backing buffers. This
could result in hardware DMA memory corruption.

> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c b/=
drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
> index 0000000000000..a9a168b8bf269 100644
> --- a/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c

[ ... ]

> @@ -72,6 +72,8 @@ struct vb2_v4l2_buffer *wave6_get_dst_buf_by_addr(struc=
t vpu_instance *inst,
>  	struct v4l2_m2m_buffer *v4l2_m2m_buf;
>  	struct vb2_v4l2_buffer *dst_buf =3D NULL;
> =20
>  	v4l2_m2m_for_each_dst_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {
>  		vb2_v4l2_buf =3D &v4l2_m2m_buf->vb;
>  		if (addr =3D=3D wave6_get_dma_addr(vb2_v4l2_buf, 0)) {
>  			dst_buf =3D vb2_v4l2_buf;

[Severity: High]
Is it safe to iterate over the M2M destination queue without holding the
rdy_spinlock?

The rdy_queue is shared and can be concurrently modified by VIDIOC_QBUF.
Traversing it unprotected could result in following stale list pointers.

[ ... ]

> @@ -312,6 +312,8 @@ int wave6_vpu_wait_interrupt(struct vpu_instance *ins=
t, unsigned int timeout)
> =20
>  	ret =3D wait_for_completion_timeout(&inst->irq_done,
>  					  msecs_to_jiffies(timeout));
>  	if (!ret)
>  		return -ETIMEDOUT;
> =20
>  	reinit_completion(&inst->irq_done);

[Severity: High]
Does exiting early on a timeout leave a stray completion signal?

If the timeout expires and the driver returns -ETIMEDOUT without resetting
the hardware or calling reinit_completion(), the VPU might finish the comma=
nd
later and signal the completion. This stray completion would cause a subseq=
uent
wait_for_completion_timeout() to return immediately, potentially reading re=
sult
registers while the hardware is still executing a new command.

[ ... ]

> @@ -419,6 +419,8 @@ static void wave6_vpu_device_run_timeout(struct work_=
struct *work)
>  	vb2_queue_error(v4l2_m2m_get_src_vq(inst->v4l2_fh.m2m_ctx));
>  	vb2_queue_error(v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx));
> =20
>  	v4l2_m2m_job_finish(inst->dev->m2m_dev, inst->v4l2_fh.m2m_ctx);
>  }

[Severity: High]
Should the hardware be reset or aborted before finishing the M2M job?

If v4l2_m2m_job_finish() is called while the VPU is actively executing a
timed-out command, an eventual hardware interrupt might corrupt the next job
or trigger a Use-After-Free if the instance has been freed.

[ ... ]

> @@ -442,6 +442,8 @@ static void wave6_vpu_device_run(void *priv)
> =20
>  void wave6_vpu_finish_job(struct vpu_instance *inst)
>  {
>  	cancel_delayed_work(&inst->dev->task_timer);
>  	v4l2_m2m_job_finish(inst->dev->m2m_dev, inst->v4l2_fh.m2m_ctx);
>  }

[Severity: High]
Can cancel_delayed_work() leave the timeout handler running concurrently?

Using cancel_delayed_work() instead of cancel_delayed_work_sync() allows the
timeout handler to potentially race with instance destruction or subsequent
jobs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624072043.238-=
1-nas.chung@chipsnmedia.com?part=3D4
