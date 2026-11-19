Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104196;
	b=YOj5wAIGZmps8VpnsTF+9Ajv4F4Bc53tMsgT5PjudvTzIel8pOidodGIjH4wOfBZa1MC
	 gRBH3klZUPnT5dhej93zMgJ/rdRlxulOB3UNRllcuirYjMYWBiWuOFYIa6kKXezKWSCoA
	 8ArV6/D2hWIZFyOcopv7BpC+1P0Hbd86ga6gOcn0BV2rkzJNNTs6LP7epqiUAh2uWiGnp
	 j1Ojgpfhc7VNFvfzKGD6pf0AzHK+8rCA28ZJtaPEC1OFsV+HCstAs3X6Qt8B8H6SkZ12o
	 WDhGX+gbXq05TpOBjR7HqkWwDy4evaIebKfnNiKlGgqkFpwJmh1QYtkM03+XmoWkgWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104196;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NFLCsa/k50WU1FEHbEZWuY+iOkzJV9eWJb7Ux2CgchU=;
	b=5YhKtoIM8hACGqwaj2AWG4MyUeEoyU9kUpZcNtoeBsqbiAIbSePRHM9fxOO8AuwxuG5I
	 MarOou+K29tfqiM51bljB1CbuL3NZsh+vkcrJM1LjiSlAntw3jh2rlLkTtKS+MUMaxXX/
	 c3Yxva4/aH3t7/9WGMhhbLtDZ2vU9f1U2K+3Cf4p3SUh3XYiaWUaOKFFM0hPgHYUpLeh8
	 GoTGGfvu8GbMeABFYAYmvPly/sQTClna8qGE9byf8NJxFZDOL7UQ1utXKDmaSnlsP/y2k
	 piRVzD8YEcuk2WQfN7F//ku3fcXpLsTwSdk5HqAcoPyclAMQ8GKJJajUVqSHapu6mhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kCdMdCJu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF3D606A325
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kCdMdCJu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 287A91F000C4;
	Thu, 19 Nov 2026 16:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795104196;
	bh=NFLCsa/k50WU1FEHbEZWuY+iOkzJV9eWJb7Ux2CgchU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kCdMdCJuDiUm/5uZXZKHGbSlfs+qm3fN8yBRrfFeKrwZtMP+Mz6WBWDGOtwwZM507
	 ujymZ7uXoajRwbbUnFhrAY8D0SkjRAyiKmGXX9N63Bi+2Gp+VK1/v7pZg4wMlNj2et
	 sqEpPYGPNfw1ZBq7fjOzbQVzy/bCRq63P1XrM2KPabyLrPMHwHRou8jLtpXxX/UCT/
	 DZVNM+sANrCO2sCX7KfM6EsCtCDYeCifBCDdDdxcXtLLPcqDrY9sY4KylZUQ6vkRa0
	 N1qm3+0LerPHIUPTfD7tWpQn7OJjTbfS1WEcVl4KXmRNGpSngVh0q/nCElBcX18cKz
	 NVEd14a1SNaTg==
Message-ID: <sashiko-outbox-223458@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 19/28] media: mali-vpu: start decoder firmware
 through LSID scheduling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charvi Mehta" <charvi.mehta@arm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261119153758.1426673-20-charvi.mehta@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
 <20261119153758.1426673-20-charvi.mehta@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 16:03:15 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] media: mali-vpu: vq_lock drop in
  mali_vpu_session_wait_pending() races
- [Medium] media: mali-vpu: 10s hang in mali_vpu_session_cleanup() on
  unmapped LSID
--

commit df41ad5c55cc78aaaf50be9e6b1f9cc272e547c5
Author: Charvi Mehta <charvi.mehta@arm.com>

media: mali-vpu: start decoder firmware through LSID scheduling

This commit connects decoder firmware execution to VB2 queue preparation and
asynchronous firmware loading, activating the LSID and tracking requested a=
nd
confirmed firmware states across stream startup and shutdown.

> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c b/dri=
vers/media/platform/arm/mali-vpu/mali-vpu-session.c
> index 09ec6d14f4ad0..6d22a5d479008 100644
> --- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c

[ ... ]

> @@ -123,6 +211,102 @@ static int mali_vpu_session_handle_fw_msg(struct ma=
li_vpu_session *sess,
>  	}
>  }
> =20
> +static int mali_vpu_session_wait_pending(struct mali_vpu_session *sess)
> +{
> +	long timeout;
> +
> +	lockdep_assert_held(&sess->vq_lock);
> +
> +	while (sess->fw_bin_state =3D=3D MALI_VPU_SESSION_FW_BIN_READY &&
> +	       sess->fw.pending_response_count) {
> +		mutex_unlock(&sess->vq_lock);
> +
> +		timeout =3D wait_event_timeout(sess->fw_waitq,
> +					     READ_ONCE(sess->fw_bin_state) !=3D
> +					     MALI_VPU_SESSION_FW_BIN_READY ||
> +					     !READ_ONCE(sess->fw.pending_response_count),
> +					     msecs_to_jiffies(mali_vpu_fw_response_timeout_ms));
> +
> +		mutex_lock(&sess->vq_lock);
> +
> +		if (!timeout && sess->fw.pending_response_count)
> +			return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mali_vpu_session_fw_init(struct mali_vpu_session *sess)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&sess->vq_lock);
> +
> +	if (sess->fw_requested_state !=3D sess->fw_state) {
> +		if (sess->fw_requested_state !=3D MALI_VPU_FW_STATE_RUNNING)
> +			return -EBUSY;
> +
> +		return mali_vpu_session_sched_activate(sess);
> +	}
> +
> +	if (sess->fw_state =3D=3D MALI_VPU_FW_STATE_RUNNING)
> +		return 0;
> +
> +	ret =3D mali_vpu_session_fw_send_job(sess, 0);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Map the LSID and allow the stopped firmware to process the
> +	 * queued SET_OPTION requests before it can be RUNNING.
> +	 */
> +	ret =3D mali_vpu_session_sched_activate(sess);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D mali_vpu_session_fw_send_ping(sess);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D mali_vpu_apply_staged_controls(sess);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * SET_OPTION is only valid while stopped. Wait for pending option
> +	 * responses before requesting RUNNING.
> +	 */
> +	ret =3D mali_vpu_session_wait_pending(sess);
> +	if (ret)
> +		return ret;
> +
> +	/* Waiting drops vq_lock, so streaming may have been withdrawn. */
> +	if (!mali_vpu_session_can_stream(sess))
> +		return 0;
> +
> +	return mali_vpu_session_fw_send_state(sess, MALI_VPU_FW_STATE_RUNNING);
> +}

[Severity: High]
Can dropping sess->vq_lock in mali_vpu_session_wait_pending() race with
concurrent queue ioctls during vb2_core_streamon()?

sess->vq_lock is also assigned to vq->lock and m2m_ctx->q_lock, which
videobuf2 expects to stay held across prepare_streaming() and
start_streaming() until q->streaming is set.  When staged controls are
applied, mali_vpu_session_prepare_streaming() sets port->stream_requested =
=3D
true and then drops sess->vq_lock inside mali_vpu_session_wait_pending()
while q->streaming is still 0:

CPU0                                  CPU1
vb2_core_streamon(q)
  mali_vpu_vb2_prepare_streaming(q)
    port->stream_requested =3D true
    mali_vpu_session_fw_init()
      mali_vpu_apply_staged_controls()
      mali_vpu_session_wait_pending()
        mutex_unlock(&sess->vq_lock)
                                      vb2_core_streamon(q)
                                        /* q->streaming is still 0 */
                                        mali_vpu_vb2_prepare_streaming(q)
                                          if (port->stream_requested)
                                            return 0;
                                        vb2_start_streaming(q)
        mutex_lock(&sess->vq_lock)
  vb2_start_streaming(q)  <-- corrupts q_ctx->rdy_queue list

Because both threads run vb2_start_streaming(q), the queued buffers are
passed to mali_vpu_vb2_buffer_queue() -> v4l2_m2m_buf_queue() twice,
corrupting q_ctx->rdy_queue via double list_add_tail() and double
incrementing q->owned_by_drv_count.

Dropping sess->vq_lock here exposes three other races while waiting:
- sess->fw_requested_state is not set to MALI_VPU_FW_STATE_RUNNING until
  mali_vpu_session_fw_send_state() after mali_vpu_session_wait_pending()
  returns, so a concurrent streamon on the other port (or against the
  asynchronous mali_vpu_session_fw_bin_ready() callback) sees
  fw_requested_state =3D=3D fw_state =3D=3D MALI_VPU_FW_STATE_STOPPED and r=
e-enters
  mali_vpu_session_fw_init(), sending duplicate job and ping requests.
- If another thread calls VIDIOC_STREAMOFF while sess->vq_lock is dropped,
  !mali_vpu_session_can_stream(sess) returns 0 to vb2_core_streamon(),
  which still sets q->streaming =3D 1 even though port->stream_requested was
  cleared and the firmware remains stopped.
- A concurrent VIDIOC_REQBUFS(0) can enter __vb2_queue_cancel() and free
  buffers while vb2_core_streamon() is still in flight.

[ ... ]

> @@ -243,6 +433,21 @@ int mali_vpu_session_cleanup(struct mali_vpu_session=
 *sess)
>  			sess->fw_bin_state =3D MALI_VPU_SESSION_FW_BIN_FAILED;
>  	}
> =20
> +	if (sess->fw_bin_state =3D=3D MALI_VPU_SESSION_FW_BIN_READY)
> +		fw_stop_ret =3D mali_vpu_session_fw_stop(sess);

[Severity: Medium]
Can mali_vpu_session_cleanup() hang for 10 seconds in
mali_vpu_session_fw_stop() when the firmware binary is ready but no LSID is
mapped?

Unlike mali_vpu_session_streamoff(), which returns early when
!sess->sched_sess.lsid, mali_vpu_session_cleanup() calls
mali_vpu_session_fw_stop() -> mali_vpu_session_wait_pending() without
checking sess->sched_sess.lsid.  Meanwhile, mali_vpu_apply_or_stage_ctrl()
sends MVE_REQUEST_CODE_SET_OPTION immediately whenever fw_bin_state is
MALI_VPU_SESSION_FW_BIN_READY, even if sess->sched_sess.lsid is NULL:

drivers/media/platform/arm/mali-vpu/mali-vpu-controls.c:mali_vpu_apply_or_s=
tage_ctrl() {
	...
	staged =3D sess->fw_bin_state !=3D MALI_VPU_SESSION_FW_BIN_READY;

	if (!staged) {
		ret =3D desc->set(sess, state->cid, value);
		if (ret)
			return ret;
	}
	...
}

If fw_bin_state reaches MALI_VPU_SESSION_FW_BIN_READY without an active LSID
(for example, when CAPTURE is prepared while OUTPUT is stopped, or when
mali_vpu_sched_switch_in() fails with -EBUSY because another session holds
LSID 0) and userspace sets a control before closing the fd,
sess->fw.pending_response_count is incremented for an unscheduled firmware
instance and mali_vpu_session_cleanup() blocks until the 10-second
mali_vpu_fw_response_timeout_ms expires.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119153758.1426=
673-1-charvi.mehta@arm.com?part=3D19
