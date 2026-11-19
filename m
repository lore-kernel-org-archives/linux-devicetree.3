Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795105109;
	b=eftHa9HBBh58GpNT2RHAS4PT+xSzTQti+ssXx+zGw+aFMufEo6pzVCXSl3WuFzRVp9cd
	 9m0VPhP+MxYS9ggc1G0RQu5iy9c0M3+5syniKvuVFZ9/8icfHU6Ms/afmk3BIkov0r+iG
	 9uyzYhgIxOMslL3aqBwaHsGXZz4C4eKMZFtn8xY0rEZ9BsHcr59hotxJKhtmpF0CGO1hW
	 LSve3qkwVKU0e2T5SOvugUjrn+/e1iKHqFmicQl1NCjDWMFX5pJKGZZMuSzq0912HZ6Z0
	 EGgAQ1iwWUXwEUFMcXjb3j4eEj9e2XOHZOEc6GQt/kCcpRoySForSyMzDW1HUiM0DtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795105109;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CqJ/+TrCyKps2W1GculcaYoNq8uWoXJKUV04hgiJSJg=;
	b=YrQBpNu4Ey0FHv84PpQF/gWY0PxSTenxqJP877cefyVTgpDX1J5nIZpeeV8mkp4/uQcb
	 qkAV0qttP/FGbiZnMBgTFmic65q2Fx4Dek7w6Kxh+bXrXFR/Qfv2kLlIq5VZu/3ZSt+UN
	 k0j/kk8gckQGsupDsFULN7WsC+4x5RB3SN/S20wGSYLBs+ton9PkSyFl26RpAtLO+NWIA
	 xiosLEBfdH31BdtobC677K4OgM8QbsOEe1TRvp/lRCg4XqqF+xuvo0vX++TIW/FXwNJcS
	 8GrXekyxThIcnBJS1VUt0Eir/5QZlAcUSjC8TTCxjLtAk7oUgE1vcqN0kWlQGABcqFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fJQqat42;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56020606A324
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fJQqat42
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B10AB1F000C4;
	Thu, 19 Nov 2026 16:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795105109;
	bh=CqJ/+TrCyKps2W1GculcaYoNq8uWoXJKUV04hgiJSJg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fJQqat42xpCyIAOnfAgVocLqvjB7di/9H21h8LYkl+LAlTd7Uqx9J2wwF6kG6cDci
	 BQyrHdqWKx7nKwqtsV5YthLBc0ZJ9YmxZcLYBVD7U1ZPAIgC5biqecmwO5TlCAVW1t
	 ND0z5nAYzpM9x1FieDTAk2gvExybp1Ls2Ssui7Bb64xSI8iwRxMK3G0inam17sPZGG
	 Rf8FMUWkELkc9cNAYDi1IdwTPOR17+cIO8YvPomhFUbtknK8S32OpNyJ0GI9OL8pd2
	 cecnvt/oVm1TK8ZMSn8cXuxzFfWBqBNjsrUJed5Im8ceQEiJBh7tg/O3pqCNnExOYj
	 19RFjj7G9lTrg==
Message-ID: <sashiko-outbox-223508@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 24/28] media: mali-vpu: add decoder EOS and DRC
 handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charvi Mehta" <charvi.mehta@arm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261119153758.1426673-25-charvi.mehta@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
 <20261119153758.1426673-25-charvi.mehta@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 16:18:28 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [High] media: mali-vpu: broken EOS state handling in
  mali_vpu_session_fw_send_eos()
- [High] media: mali-vpu: pre-DRC buffer requeue fails in
  mali_vpu_vb2_buffer_prepare()
- [High] media: mali-vpu: spurious V4L2_EVENT_EOS in
  mali_vpu_session_buffer_done()
- [High] media: mali-vpu: premature DRC arming and missing reset on
  V4L2_DEC_CMD_START
- [High] media: mali-vpu: use-after-free of in-flight buffers after
  streamoff
- [High] media: mali-vpu: missing MMU TLB flush when unmapping VB2
  buffers during DRC
--

commit ce97dbb7890d62bd32d99505c6b3bd32d36ac969
Author: Shobhit Pandey <shobhit.pandey@arm.com>

media: mali-vpu: add decoder EOS and DRC handling

This commit adds V4L2 decoder START/STOP command handling, firmware queue
flushing, end-of-stream propagation, and dynamic resolution change support
to the Mali VPU driver.

> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c b/dri=
vers/media/platform/arm/mali-vpu/mali-vpu-session.c
> index ea80aacd930d8..fcfad581223be 100644
> --- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
[ ... ]
> @@ -157,6 +166,67 @@ int mali_vpu_session_fw_send_set_option(struct mali_=
vpu_session *sess,
>  	return 0;
>  }
> =20
> +int mali_vpu_session_fw_send_eos(struct mali_vpu_session *sess)
> +{
> +	int ret;
> +
> +	if (sess->error)
> +		return sess->error;
> +
> +	if (!mali_vpu_both_queues_streaming(sess))
> +		return 0;
> +
> +	ret =3D mali_vpu_fw_send_eos(&sess->fw);
> +	if (ret)
> +		return ret;
> +
> +	mali_vpu_sched_send_irq(&sess->sched_sess, &sess->vpu_dev->sched);
> +	return 0;
> +}

[Severity: High]
Can mali_vpu_session_fw_send_eos() send the EOS marker ahead of deferred
OUTPUT buffers or fail before the firmware reaches
MALI_VPU_FW_STATE_RUNNING?

When VIDIOC_STREAMON starts the queues, firmware loading and the transition
to MALI_VPU_FW_STATE_RUNNING complete asynchronously.  During that window,
mali_vpu_session_qbuf() holds queued OUTPUT buffers with
MALI_VPU_BUF_ATTR_DEFERRED until MALI_VPU_FW_CODE_STATE_CHANGE calls
mali_vpu_submit_deferred_bufs().  Because mali_vpu_session_fw_send_eos()
only checks mali_vpu_both_queues_streaming(), calling
VIDIOC_DECODER_CMD(V4L2_DEC_CMD_STOP) right after VIDIOC_STREAMON fails
with -EINVAL if sess->fw_bin_state is still
MALI_VPU_SESSION_FW_BIN_LOADING, or writes the EOS packet into
sess->fw.buf_in_host ahead of the deferred OUTPUT buffers if sess->fw_state
is still MALI_VPU_FW_STATE_STOPPED.

Also, if V4L2_DEC_CMD_STOP is issued while only the OUTPUT queue is
streaming (for example, while waiting for the initial
V4L2_EVENT_SOURCE_CHANGE or while CAPTURE is stopped during DRC),
mali_vpu_both_queues_streaming() is false and the EOS request is dropped
without staging it.

> +
> +static int mali_vpu_session_fw_send_flush(struct mali_vpu_session *sess,=
 bool to_src)
> +{
> +	int ret;
> +
> +	if (to_src)
> +		ret =3D mali_vpu_fw_send_flush_src(&sess->fw);
> +	else
> +		ret =3D mali_vpu_fw_send_flush_dst(&sess->fw);
> +
> +	if (ret)
> +		return ret;
> +
> +	mali_vpu_sched_send_irq(&sess->sched_sess, &sess->vpu_dev->sched);
> +	return 0;
> +}
> +
> +static int mali_vpu_session_send_drc_event(struct mali_vpu_session *sess)
> +{
> +	const struct v4l2_event event =3D {
> +		.type                 =3D V4L2_EVENT_SOURCE_CHANGE,
> +		.u.src_change.changes =3D V4L2_EVENT_SRC_CH_RESOLUTION
> +	};
> +
> +	v4l2_event_queue_fh(&sess->fh, &event);
> +	return 0;
> +}
> +
> +static int
> +mali_vpu_session_update_capture_format(struct mali_vpu_session *sess,
> +				       const struct mali_vpu_fw_alloc_param alloc_params)
> +{
> +	struct v4l2_pix_format_mplane *src =3D &sess->port_src.curr_fmt.fmt.pix=
_mp;
> +	struct v4l2_pix_format_mplane *dst =3D &sess->port_dst.curr_fmt.fmt.pix=
_mp;
> +	int ret =3D 0;
> +
> +	src->width =3D alloc_params.width;
> +	src->height =3D alloc_params.height;
> +
> +	ret =3D v4l2_fill_pixfmt_mp(dst, dst->pixelformat, alloc_params.width,
> +				  alloc_params.height);
> +	return ret;
> +}

[Severity: High]
Does updating sess->port_dst.curr_fmt in place here cause pre-DRC CAPTURE
buffers requeued via VIDIOC_QBUF to fail in mali_vpu_vb2_buffer_prepare()
when the resolution increases?

v4l2_fill_pixfmt_mp() immediately overwrites
dst->plane_fmt[i].sizeimage with the post-DRC plane sizes.  When userspace
requeues a pre-DRC CAPTURE buffer before processing
V4L2_EVENT_SOURCE_CHANGE, vb2_core_qbuf() runs
mali_vpu_vb2_buffer_prepare() before calling mali_vpu_session_qbuf():

drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.c:mali_vpu_vb2_buffer_p=
repare() {
	...
	for (i =3D 0; i < pix_mp->num_planes; i++) {
		if (vb2_plane_size(vb2_buf, i) < pix_mp->plane_fmt[i].sizeimage)
			return -EINVAL;
	}
	...
}

Whenever the new resolution requires a larger sizeimage,
mali_vpu_vb2_buffer_prepare() rejects the pre-DRC buffer with -EINVAL and
the sess->drc_pending handling in mali_vpu_session_qbuf() is never reached.
Conversely, when the new resolution is smaller or equal, the
sess->drc_pending branch in mali_vpu_session_qbuf() completes the buffer
with V4L2_BUF_FLAG_LAST without zeroing planes[i].bytesused, returning
stale payload sizes from the previous frame.

[ ... ]
> @@ -373,6 +444,17 @@ static void mali_vpu_session_buffer_done(struct mali=
_vpu_session *sess,
>  		v4l2_m2m_dst_buf_remove_by_buf(sess->m2m_ctx, vbuf);
> =20
>  	v4l2_m2m_buf_done(vbuf, state);
> +
> +	if (V4L2_TYPE_IS_CAPTURE(vpu_buf->type) &&
> +	    !q->last_buffer_dequeued &&
> +	    (vbuf->flags & V4L2_BUF_FLAG_LAST) &&
> +	    !sess->drc_pending) {
> +		const struct v4l2_event event =3D {
> +			.type =3D V4L2_EVENT_EOS,
> +		};
> +
> +		v4l2_event_queue_fh(&sess->fh, &event);
> +	}
>  }

[Severity: High]
Does this queue a spurious V4L2_EVENT_EOS for every unused CAPTURE buffer
flushed during a normal VIDIOC_STREAMOFF?

When mali_vpu_session_streamoff() flushes the CAPTURE queue while
sess->drc_pending is false, the firmware returns all unused in-flight
CAPTURE buffers with visible_frame_width =3D=3D 0 and visible_frame_height =
=3D=3D 0.
mali_vpu_convert_buffer_frame() zeroes their plane payloads, and
mali_vpu_buffer_update_flags_to_v4l2() sets V4L2_BUF_FLAG_LAST on any
CAPTURE buffer with bytesused =3D=3D 0:

drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.c:mali_vpu_buffer_updat=
e_flags_to_v4l2() {
	...
	if (vpu_buf->flags & MALI_VPU_BUFFER_EOS ||
	    (V4L2_TYPE_IS_CAPTURE(vpu_buf->type) &&
	     mali_vpu_buffer_get_bytesused(&vpu_buf->m2m_buf.vb.vb2_buf) =3D=3D 0))
		v4l2_buf->flags |=3D V4L2_BUF_FLAG_LAST;
}

Because q->last_buffer_dequeued is only set when userspace calls
VIDIOC_DQBUF, every flushed CAPTURE buffer satisfies this check and queues
V4L2_EVENT_EOS on sess->fh.

[ ... ]
> @@ -464,6 +547,49 @@ static int mali_vpu_session_handle_fw_msg(struct mal=
i_vpu_session *sess,
>  	case MALI_VPU_FW_CODE_IDLE:
>  		dev_dbg(sess->vpu_dev->dev, "fw entered Idle/sleeping state.\n");
>  		return 0;
> +	case MALI_VPU_FW_CODE_EOS:
> +		/*
> +		 * This is driver generated dummy EOS buffer response no action
> +		 * required as EOS is handled via buffer flags.
> +		 */
> +		return 0;
> +	case MALI_VPU_FW_CODE_INPUT_FLUSH:
> +		/*
> +		 * Acknowledge completion of the input flush. No additional session
> +		 * state update is required.
> +		 */
> +		return 0;
> +	case MALI_VPU_FW_CODE_OUTPUT_FLUSH:
> +		dev_dbg(sess->vpu_dev->dev, "fw rsp: Dst queue flushed\n");
> +		if (sess->role =3D=3D MALI_VPU_DECODER && sess->drc_pending)
> +			return mali_vpu_session_send_drc_event(sess);
> +
> +		return 0;
> +	case MALI_VPU_FW_CODE_ALLOC_PARAM:
> +		ret =3D mali_vpu_session_update_capture_format(sess, fw_msg->data.allo=
c_params);
> +		if (!ret)
> +			sess->drc_pending =3D true;
> +
> +		return ret;
> +	case MALI_VPU_FW_CODE_SEQUENCE_PARAMS: {
> +		struct vb2_queue *dst_q;
> +		u32 buffers_min;
> +
> +		buffers_min =3D fw_msg->data.seq_params.planar.buffers_min;
> +		dst_q =3D v4l2_m2m_get_dst_vq(sess->m2m_ctx);
> +
> +		if (!buffers_min || buffers_min > dst_q->max_num_buffers) {
> +			dev_err(sess->vpu_dev->dev,
> +				"invalid minimum buffer count %u, max is %u\n",
> +				buffers_min, dst_q->max_num_buffers);
> +			return -EPROTO;
> +		}
> +
> +		sess->min_buffers_required =3D buffers_min;
> +		dst_q->min_reqbufs_allocation =3D sess->min_buffers_required;
> +
> +		return mali_vpu_session_fw_send_flush(sess, false);
> +	}

[Severity: High]
What happens if MALI_VPU_FW_CODE_SEQUENCE_PARAMS arrives without a
preceding MALI_VPU_FW_CODE_ALLOC_PARAM, or if userspace resumes from DRC
using VIDIOC_DECODER_CMD(V4L2_DEC_CMD_START)?

Because sess->drc_pending is only armed in MALI_VPU_FW_CODE_ALLOC_PARAM, a
sequence parameter change that only sends MALI_VPU_FW_CODE_SEQUENCE_PARAMS
(such as a change in num_buffers_planar) flushes the CAPTURE queue with
sess->drc_pending =3D=3D false; mali_vpu_session_buffer_done() then emits a
spurious V4L2_EVENT_EOS on the flushed buffer and MALI_VPU_FW_CODE_OUTPUT_F=
LUSH
never sends V4L2_EVENT_SOURCE_CHANGE.

In addition, sess->drc_pending is only cleared in
mali_vpu_session_prepare_streaming().  If userspace keeps the CAPTURE queue
streaming across V4L2_EVENT_SOURCE_CHANGE and resumes decoding via
VIDIOC_DECODER_CMD(V4L2_DEC_CMD_START) in mali_vpu_decoder_cmd(),
sess->drc_pending remains true and mali_vpu_session_qbuf() immediately
completes every newly queued CAPTURE buffer with V4L2_BUF_FLAG_LAST instead
of submitting it to the firmware.  (The later commit "media: mali-vpu: add
stateful decoder state machine" in this series replaces sess->drc_pending
with sess->sess_state, but still only transitions state on
MALI_VPU_FW_CODE_ALLOC_PARAM and rejects V4L2_DEC_CMD_START in
MALI_VPU_DEC_STATE_DYNAMIC_RESOLUTION_CHANGE.)

[ ... ]
> @@ -834,7 +979,8 @@ int mali_vpu_session_streamoff(struct mali_vpu_sessio=
n *sess, enum v4l2_buf_type
>  	    !sess->sched_sess.lsid)
>  		return 0;
> =20
> -	if (mali_vpu_is_raw_q(sess, type)) {
> +	if (sess->drc_pending && sess->role =3D=3D MALI_VPU_DECODER &&
> +	    mali_vpu_is_raw_q(sess, type)) {
>  		ret =3D mali_vpu_session_wait_pending(sess);
>  		if (ret)
>  			goto err_session;

[Severity: High]
Can this early return leave in-flight CAPTURE buffers in
sess->fw.inflight_buffers across VIDIOC_STREAMOFF, leading to a
use-after-free when the buffers are freed?

MALI_VPU_FW_CODE_ALLOC_PARAM sets sess->drc_pending =3D true before
MALI_VPU_FW_CODE_SEQUENCE_PARAMS validates the parameters and calls
mali_vpu_session_fw_send_flush() to increment
sess->fw.pending_response_count.  If userspace calls
VIDIOC_STREAMOFF(CAPTURE) in the window between ALLOC_PARAM and
SEQUENCE_PARAMS, mali_vpu_session_wait_pending() sees
pending_response_count =3D=3D 0 and returns immediately without stopping the
firmware or flushing CAPTURE.  (The same happens if SEQUENCE_PARAMS fails
validation and sets sess->error, taking the earlier sess->error return in
mali_vpu_session_streamoff().)

mali_vpu_vb2_stop_streaming() then returns the buffers to VB2, and
VIDIOC_REQBUFS(0) frees the struct mali_vpu_buffer objects while their
pointers remain in sess->fw.inflight_buffers.  Any later buffer return in
mali_vpu_fw_resolve_returned_buffer() or session teardown in
mali_vpu_fw_clear_buffers() then writes to the freed vpu_buf:

drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c:mali_vpu_fw_clear_b=
uffers() {
	...
	xa_for_each(&fw->inflight_buffers, id, vpu_buf) {
		xa_erase(&fw->inflight_buffers, id);
		vpu_buf->fw_buffer_id =3D 0;
		vpu_buf->attr =3D MALI_VPU_BUF_ATTR_NONE;
	}
}

> @@ -846,7 +992,15 @@ int mali_vpu_session_streamoff(struct mali_vpu_sessi=
on *sess, enum v4l2_buf_type
>  	if (ret)
>  		goto err_session;
> =20
> -	return mali_vpu_session_wait_pending(sess);
> +	ret =3D mali_vpu_session_fw_send_flush(sess, V4L2_TYPE_IS_OUTPUT(type));
> +	if (ret)
> +		goto err_session;
> +
> +	ret =3D mali_vpu_session_wait_pending(sess);
> +	if (ret)
> +		goto err_session;
> +
> +	return 0;

[Severity: High]
When CAPTURE buffers are unmapped and reallocated during DRC or after
VIDIOC_STREAMOFF, does anything flush the VPU LSID MMU TLB before the VPU
reuses those virtual addresses?

mali_vpu_session_streamoff() leaves sess->sched_sess.lsid mapped on the
hardware.  When userspace frees the old CAPTURE buffers with
VIDIOC_REQBUFS(0), mali_vpu_vb2_buffer_cleanup() calls
mali_vpu_mmu_free_pages() to clear the session L2 page table entries and
VB2 returns the physical pages to the kernel, but no MMU TLB flush is
issued.  When new CAPTURE buffers are then queued,
mali_vpu_buffer_plane_map() allocates from MVE_MEM_REGION_FRAMEBUF_ADDR_BEG=
IN
(0x70000000) and reuses the same VPU virtual addresses.  Without a call to
mali_vpu_sched_flush_mmu() after unmapping the old buffer pages, the VPU can
DMA decoded frames through stale TLB entries into freed physical pages.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119153758.1426=
673-1-charvi.mehta@arm.com?part=3D24
