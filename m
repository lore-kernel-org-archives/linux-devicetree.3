Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541716;
	b=5KF3BNprMyuLNJbQ10mpqxL4JID68j9BlrxmlN3ljayo7ef9UFM/m7cBSa7dLUz/3dtv
	 q/5idjxsHO9n4xYAACfZ1Lzuf3RQwj+vh5RDX3ttuCa15iHXJVqLwd0ILGaJwWTVXQ1nI
	 J+uLHsgJkJ49N86mgWZAYBFer08Z5j1SH0+WO2dnhoRofaeRbCvqfII2u8ydFo9Ybp8QE
	 25wHcLSSQluTMemNAkB60VWxp46fAPZjx54BQ3NjWHD9e8wpV/w7yEZ++eEftzxtah2tr
	 aZwhx2dS+drrtk/MzXXUoZiL7N7nYghSRAQ8Pak4WUbZ3UQNFNpj9BxOJpnqh+2PRMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541716;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0RbUmn79OBfUaJ6AR+Ug352MYLfPMi2JY/ccLVB8EEA=;
	b=vXJNlHJ9oDsiMr0D0GGQtRaNSGE+VMAN3s1wEk31dyXIzs6DMnoOmSDYO29O0XE+wV5w
	 nhZjaR7WVYAWdALa15/1wnlXwvyjrZsgMxHiS668EdpfJOw3vMOQHQTvzs+2ePBHf/egP
	 OEWiFNrEwWtnTgJ+2rSZM/FfYU6C/AiZO81qkOqz81z7muHjRZGpKg+pJyJ4Px5W+lLpJ
	 O/ZaZ4qpNKPbyqZd+/wW94CdhYUDp3EmUwLtptaVeGnVFSNkYsNOAuXyh1IqRR+z4yzNm
	 gBBUkf+QuyGUhLgDUQ+9P7o42z/C8i8O7igbGAwn/fycgsGBYIF9GlEICJR1cs0d9Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hrogm3ET;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93610606A68E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hrogm3ET
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0533F1F000EE;
	Tue, 24 Nov 2026 17:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795541716;
	bh=0RbUmn79OBfUaJ6AR+Ug352MYLfPMi2JY/ccLVB8EEA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hrogm3ET5Y4iFmKCXZYLAjhs4g8kuV6/RTCg05DDdj3cch0RCIqBldSPyFAvswZMH
	 u6EWi2F40h7jjvOjOYHndwECGsf8BkgHsWZdleuo3bNBSoVaulqlO9qpvkWnbFgVuO
	 cdPGAJD4lL+FOEEUA5A8M7C8ZV/HIhsWUvqP4lcz4TZhJlL587NHWucWeB7XQFuXb0
	 yxknfJoJUKT8vcvVwOpZ6c4w0UhDBPPFZj/vuRhgIt6+CnEma592tv55oov6rifK7V
	 KgaW1a+aTmEV7c4ZG3PwqSgk1LcFZ60zZPR5SnJ/4pl5GOu8g90HzDJz1DNUYJAIwV
	 RNP6uG92EfuRg==
Message-ID: <sashiko-outbox-231709@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/24] media: mali-c720: Add video capture nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anthony McGivern" <anthony.mcgivern@arm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261124-b4-initial-upstream-candidate-v1-12-0cb9bde1bd30@arm.com>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
 <20261124-b4-initial-upstream-candidate-v1-12-0cb9bde1bd30@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 17:35:15 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] media: mali-c720: unrecovered output buffer state on context
  stop
- [Medium] media: mali-c720: race between
  mali_c720_s_fmt_vid_cap_mplane() and link validation
- [Low] media: mali-c720: uninitialized vdev.name logged in
  mali_c720_register_cap_dev()
--

commit 5de5962e721900ab8951fa2e8cce61caedd37777
Author: Anthony McGivern <Anthony.McGivern@arm.com>

media: mali-c720: Add video capture nodes

This commit adds RGB and YUV V4L2 video capture nodes for the full-resoluti=
on
output 0 (FR0) subdevice and wires up their buffer completion handling.

> diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-capture.c b/d=
rivers/media/platform/arm/mali-c720/mali-c720-capture.c
> new file mode 100644
> index 0000000000000..78e9f5aba97d5
> --- /dev/null
> +++ b/drivers/media/platform/arm/mali-c720/mali-c720-capture.c
> @@ -0,0 +1,747 @@
[ ... ]
> +void mali_c720_cap_dev_buffer_done(struct mali_c720_cap_dev *cap_dev,
> +				   bool success)
> +{
> +	struct mali_c720 *mali_c720 =3D cap_dev->mali_c720;
> +	struct mali_c720_context *ctx =3D mali_c720_get_active_context(mali_c72=
0);
> +	struct mali_c720_cap_buffer *buf;
> +
> +	if (!video_is_registered(&cap_dev->vdev))
> +		return;
> +
> +	if (!vb2_is_streaming(&cap_dev->queue))
> +		return;
> +
> +	guard(spinlock)(&cap_dev->buffers.lock);
> +
> +	buf =3D list_first_entry_or_null(&cap_dev->buffers.processing,
> +				       struct mali_c720_cap_buffer, queue);
> +	if (!buf)
> +		return;
> +
> +	if (mali_c720_ctx_mgr_check_output_buffer_status(ctx, &cap_dev->buffers=
.pool))
> +		success =3D false;
> +
> +	if (success) {
> +		buf->vb.vb2_buf.timestamp =3D ctx->timestamp;
> +		buf->vb.sequence =3D ctx->frame_sequence;
> +	}
> +
> +	vb2_buffer_done(&buf->vb.vb2_buf, success ? VB2_BUF_STATE_DONE : VB2_BU=
F_STATE_ERROR);
> +	list_del(&buf->queue);
> +}

[Severity: Medium]
When one capture device stops streaming while another capture device is sti=
ll
streaming with an in-flight buffer in buffers.processing, does retiring that
buffer leave the still-streaming device's hardware output buffer descriptor
in MALI_C720_BUFFER_STATE_HW_EMPTY (or MALI_C720_BUFFER_STATE_HW_ERROR)
instead of resetting it to MALI_C720_BUFFER_STATE_SW_EMPTY?

mali_c720_vb2_stop_streaming() disables isp_sd, which invokes
mali_c720_ctx_mgr_stop_context():

drivers/media/platform/arm/mali-c720/mali-c720-ctx-mgr.c:mali_c720_ctx_mgr_=
stop_context() {
	...
	scoped_guard(spinlock_irq, &ctx->state_lock) {
		ctx->state =3D MALI_C720_SLOT_STATE_STOPPED;
		...
		/* Retire in-flight buffers on all queues, including those still streamin=
g. */
		mali_c720_ctx_mgr_buffer_done(ctx, false);

Because ctx->state is already MALI_C720_SLOT_STATE_STOPPED when
mali_c720_cap_dev_buffer_done() runs,
mali_c720_ctx_mgr_check_output_buffer_status() returns 0 immediately:

drivers/media/platform/arm/mali-c720/mali-c720-ctx-mgr.c:mali_c720_ctx_mgr_=
check_output_buffer_status() {
	...
	if (ctx->state =3D=3D MALI_C720_SLOT_STATE_STOPPED)
		return 0;

The stopping capture device then releases its buffer pool, which cancels and
uninitializes its descriptor, but the sibling capture device that remains
streaming keeps its pool with the hardware descriptor still under hardware
control and pointing at the retired vb2 buffer's DMA address.

[ ... ]

> +static int mali_c720_s_fmt_vid_cap_mplane(struct file *file, void *fh,
> +					  struct v4l2_format *f)
> +{
> +	struct mali_c720_cap_dev *cap_dev =3D video_drvdata(file);
> +
> +	if (media_entity_is_streaming(&cap_dev->vdev.entity))
> +		return -EBUSY;
> +
> +	if (vb2_is_busy(&cap_dev->queue))
> +		return -EBUSY;
> +
> +	mali_c720_set_format(cap_dev, &f->fmt.pix_mp);
> +	return 0;
> +}

[Severity: Medium]
Can mali_c720_s_fmt_vid_cap_mplane() race with mali_c720_link_validate() on=
 a
sibling capture device sharing the media pipeline?

Each capture device has its own cap_dev->lock, while both FR0 capture nodes
share mali_c720->pipe when both links from fr_pipe are enabled:

CPU0 (cap_devs[0] STREAMON)       CPU1 (cap_devs[1] S_FMT)
mali_c720_vb2_start_streaming()
  lock(&mali_c720->device_lock)
  video_device_pipeline_start()
    ...
    mali_c720_link_validate()
      /* on cap_devs[1] */
                                  mali_c720_s_fmt_vid_cap_mplane()
                                    /* lock(&cap_devs[1].lock) held */
                                    media_entity_is_streaming() -> false
      reads cap_devs[1].format
                                    mali_c720_set_format()
                                      writes cap_devs[1].format  <-- data r=
ace
    sets cap_devs[1].pad.pipe

Because pad->pipe is only assigned after link_validate() succeeds and
mali_c720_s_fmt_vid_cap_mplane() does not take mali_c720->device_lock, CPU1
passes media_entity_is_streaming() and can overwrite cap_dev->format with an
unvalidated resolution or pixel format while or right after
mali_c720_link_validate() checks it.

[ ... ]

> +static int mali_c720_register_cap_dev(struct mali_c720 *mali_c720,
> +				      enum mali_c720_cap_devs cap_dev_id)
> +{
[ ... ]
> +	ret =3D vb2_queue_init(vb2q);
> +	if (ret) {
> +		dev_err(mali_c720->dev, "%s vb2 queue init failed\n",
> +			cap_dev->vdev.name);
> +		goto err_cleanup_media_entity;
> +	}
> +
> +	strscpy(cap_dev->vdev.name, capture_device_names[cap_dev_id],
> +		sizeof(cap_dev->vdev.name));

[Severity: Low]
If vb2_queue_init() fails, dev_err() logs cap_dev->vdev.name before strscpy=
()
initializes it, printing an empty name.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-b4-initial=
-upstream-candidate-v1-0-0cb9bde1bd30@arm.com?part=3D12
