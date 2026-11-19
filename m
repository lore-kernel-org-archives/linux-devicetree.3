Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104451;
	b=KOw+WOqN65KRSEZJLgbLJY27TSfEVuMdmShjCEQoN3hO9ejaVT/+idSh2WLQHWJt81rZ
	 uBUdY/7z34xRrVIntPU9GVIijRIzPOOs+ZWQ9zWMn8AM9xatJzS7t6MFqB4nCEjjYZZht
	 lg9iLBqIvMWyrdtuj1DtbFUbJHC2h7xH8Iag2RRcKJUAJzlXzcy0hygnnsNaXzpV0WIrK
	 04yvjbxovuW54c+vSDOYw+yTbmh0NFy0eJfFaJx8iIwrahQOiZWgBguNY86i+TtJjr4D1
	 qU/YRogdJaXvq8DNq3dwcbc+erlF7UDGuczbVnuy0H8xyldM7dowrPi8OLVtsqx9rTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104451;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=B/LsJkctBfFuuZkO1bIGRnBSjkM7evSlkM2UlNOMw38=;
	b=BMI5atuEMY1TIoTWSNsBdu9bqxqNIbK4r5YDvGYSlJkrJPOa9kg3ksnSi/GVRrXs4sxU
	 JUiQ0+wzxZOmjPF3WPsSS9om7PpWXokxZqoiVr6sRuxqbRaCcXzFCZpwrVYHPRVl74Uuz
	 WTIDvsbAZKLd3bO8yMW7UuF4KLaudH5KJth5ewoJTFxujSZG0dgtg8G4oMQnNJUpSTrv6
	 AyPX6PQ8OcGtLUeagx/uHHqVCp/bSAoyJaYOKNavNYOPty8juYGD8ZNqc2S7NpUoc/RxV
	 uA0QxV0q29wYJ2CJYqqjZDGk9wxNFvZt2mKDMgjMIp7fK8W119cyW18rcXU8rMW+8AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jwggpjjY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4136606A33C
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jwggpjjY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D141F000C8;
	Thu, 19 Nov 2026 16:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795104451;
	bh=B/LsJkctBfFuuZkO1bIGRnBSjkM7evSlkM2UlNOMw38=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jwggpjjYAE/vwxtiI7a8ta1P4bx1nPcTkOd4+QI3DPYYfLLTApxDty0ilO1llTG8x
	 lgIX60sK/gUELaRqzygBKtZjG+tm6LzDxpkPLTqIpbxraUS+N1yg6scowUV/JERpTg
	 7qwXH8gvz5iMPA/BBrl7Pa+fnwAxZSw9W29U7MqL1g9G+ntU2V511a1y13FDylGhNZ
	 KCzNu3QXb+oGhLVKfrqGNZY4dINlEFoSBUsBO4j/0u5oI5VpT046m8MFqobcBhQfwI
	 YR2sJQLPtK7+3gnQN/NTlqegRuzpWU+34X4ZQjxSiu9qDzRxGRLkSxUelMUpOaL9RC
	 Lf/UH8mDkIeVA==
Message-ID: <sashiko-outbox-223471@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 22/28] media: mali-vpu: handle fatal firmware error
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charvi Mehta" <charvi.mehta@arm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261119153758.1426673-23-charvi.mehta@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
 <20261119153758.1426673-23-charvi.mehta@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 16:07:30 +0000
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
- [High] media: mali-vpu: use-after-free in mali_vpu_fw_clear_buffers()
  on error
- [High] media: mali-vpu: re-entrancy race in mali_vpu_session_fw_init()
- [Medium] media: mali-vpu: unrejected buffer ops on failed session
--

commit c9e2be7008da2e65bfc676db9f65394d1e577986
Author: Rath Sankaralingam <rath.sankaralingam@arm.com>

media: mali-vpu: handle fatal firmware error

This commit records the first fatal error on a session, terminates the
scheduled session, marks the VB2 queues in error, and rejects subsequent
session operations with the recorded error code.

> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c b/dri=
vers/media/platform/arm/mali-vpu/mali-vpu-session.c
> index 60e4b7e25eff8..9cbd116124109 100644
> --- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
[ ... ]
> @@ -307,6 +310,31 @@ static void mali_vpu_session_buffer_done(struct mali=
_vpu_session *sess,
>  	v4l2_m2m_buf_done(vbuf, state);
>  }
> =20
> +static void mali_vpu_session_set_error(struct mali_vpu_session *sess, in=
t error)
> +{
> +	struct vb2_queue *src_q;
> +	struct vb2_queue *dst_q;
> +
> +	lockdep_assert_held(&sess->vq_lock);
> +
> +	if (sess->error)
> +		return;
> +
> +	sess->error =3D error;
> +	sess->fw_requested_state =3D MALI_VPU_FW_STATE_STOPPED;
> +	sess->fw_state =3D MALI_VPU_FW_STATE_STOPPED;
> +
> +	mali_vpu_sched_session_terminate(&sess->sched_sess, &sess->vpu_dev->sch=
ed);
> +
> +	src_q =3D v4l2_m2m_get_src_vq(sess->m2m_ctx);
> +	dst_q =3D v4l2_m2m_get_dst_vq(sess->m2m_ctx);
> +
> +	vb2_queue_error(src_q);
> +	vb2_queue_error(dst_q);
> +
> +	wake_up(&sess->fw_waitq);
> +}

[Severity: High]
Can terminating a session with in-flight buffers cause a use-after-free in
mali_vpu_fw_clear_buffers() when the session is later closed?

Buffers submitted to firmware are recorded in sess->fw.inflight_buffers and
are normally removed when firmware returns them, or during final session
teardown in mali_vpu_fw_cleanup() -> mali_vpu_fw_clear_buffers().  When a
fatal error occurs with buffers in flight, mali_vpu_session_set_error()
terminates the LSID and prevents further interrupt handling, so firmware
never returns those buffers.

If userspace then calls VIDIOC_STREAMOFF followed by VIDIOC_REQBUFS(0) or
VIDIOC_REMOVE_BUFS before closing the fd, mali_vpu_vb2_stop_streaming()
completes all active m2m buffers back to VB2 and __vb2_queue_free() frees
the struct mali_vpu_buffer allocations without removing them from
sess->fw.inflight_buffers.  Closing the file descriptor then dereferences
the freed buffers:

drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c:mali_vpu_fw_clear_b=
uffers() {
	xa_for_each(&fw->inflight_buffers, id, vpu_buf) {
		xa_erase(&fw->inflight_buffers, id);
		vpu_buf->fw_buffer_id =3D 0;
		vpu_buf->attr =3D MALI_VPU_BUF_ATTR_NONE;
	}
}

Untracking any in-flight buffer in mali_vpu_vb2_buffer_cleanup() (or
clearing sess->fw.inflight_buffers when terminating the session on error)
would avoid leaving dangling pointers in the XArray.

> @@ -385,11 +413,13 @@ static int mali_vpu_session_wait_pending(struct mal=
i_vpu_session *sess)
> =20
>  	lockdep_assert_held(&sess->vq_lock);
> =20
> -	while (sess->fw_bin_state =3D=3D MALI_VPU_SESSION_FW_BIN_READY &&
> +	while (!sess->error &&
> +	       sess->fw_bin_state =3D=3D MALI_VPU_SESSION_FW_BIN_READY &&
>  	       sess->fw.pending_response_count) {
>  		mutex_unlock(&sess->vq_lock);
> =20
>  		timeout =3D wait_event_timeout(sess->fw_waitq,
> +					     READ_ONCE(sess->error) ||
>  					     READ_ONCE(sess->fw_bin_state) !=3D
>  					     MALI_VPU_SESSION_FW_BIN_READY ||
>  					     !READ_ONCE(sess->fw.pending_response_count),

[Severity: High]
Does dropping sess->vq_lock in mali_vpu_session_wait_pending() allow
concurrent re-entry into mali_vpu_session_fw_init()?

Both mali_vpu_session_prepare_streaming() and mali_vpu_session_fw_init()
detect an in-progress firmware startup by checking whether
sess->fw_requested_state !=3D sess->fw_state.  However,
mali_vpu_session_fw_init() only updates sess->fw_requested_state to
MALI_VPU_FW_STATE_RUNNING in mali_vpu_session_fw_send_state() after
mali_vpu_apply_staged_controls() and mali_vpu_session_wait_pending()
complete.

When staged controls are present, mali_vpu_session_wait_pending() drops
sess->vq_lock while both sess->fw_state and sess->fw_requested_state are
still MALI_VPU_FW_STATE_STOPPED and sess->fw_bin_state is
MALI_VPU_SESSION_FW_BIN_READY:

CPU0                                  CPU1
mali_vpu_session_fw_bin_ready()
  sess->fw_bin_state =3D ..._READY
  mali_vpu_session_fw_init()
    mali_vpu_session_fw_send_job()
    mali_vpu_apply_staged_controls()
    mali_vpu_session_wait_pending()
      mutex_unlock(&sess->vq_lock)
                                      VIDIOC_STREAMON(CAPTURE)
                                      mutex_lock(&sess->vq_lock)
                                      mali_vpu_session_prepare_streaming()
                                        mali_vpu_session_fw_init()
                                          mali_vpu_session_fw_send_job()
                                          mali_vpu_session_wait_pending()
                                            mutex_unlock(&sess->vq_lock)
      /* wait fails or times out */
      mutex_lock(&sess->vq_lock)
  mali_vpu_fw_cleanup(&sess->fw)
  mutex_unlock(&sess->vq_lock)
                                            mutex_lock(&sess->vq_lock)
                                          mali_vpu_session_fw_send_state()
                                            <-- use-after-cleanup of sess->=
fw

In addition, because sess->vq_lock is the VB2 queue lock, dropping it
inside mali_vpu_vb2_prepare_streaming() before vb2_core_streamon() sets
q->streaming =3D 1 allows a second VIDIOC_STREAMON on the same queue to see
port->stream_requested =3D=3D true, return 0 from
mali_vpu_session_prepare_streaming(), and run vb2_start_streaming() twice
on the same queue.

[ ... ]

> @@ -566,6 +600,9 @@ int mali_vpu_session_qbuf(struct mali_vpu_session *se=
ss, struct vb2_buffer *vb2_
>  			mali_vpu_session_get_port(sess, vb2_buf->type);
>  	int ret;
> =20
> +	if (sess->error)
> +		return sess->error;
> +
>  	if (!port->stream_requested ||
>  	    !mali_vpu_session_can_stream(sess) ||
>  	    sess->fw_state !=3D MALI_VPU_FW_STATE_RUNNING) {

[Severity: Medium]
Does checking sess->error in mali_vpu_session_qbuf() reject buffer
operations with the recorded error as described in the commit message?

mali_vpu_session_qbuf() is only called from mali_vpu_vb2_buffer_queue(),
which has a void return type in struct vb2_ops and is only invoked by VB2
while the queue is already streaming and q->error is 0.  If VIDIOC_STREAMOFF
is called after a session error, __vb2_queue_cancel() clears q->error and
q->start_streaming_called; subsequent VIDIOC_QBUF and VIDIOC_PREPARE_BUF
calls only invoke mali_vpu_vb2_buffer_prepare(), which does not check
sess->error and therefore succeeds with 0.  Checking sess->error in
mali_vpu_vb2_buffer_prepare() would reject those buffer operations with the
recorded error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119153758.1426=
673-1-charvi.mehta@arm.com?part=3D22
