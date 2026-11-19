Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104611;
	b=S+m7ibSKqLEshYLlesreAvTrBNz4m63W8PqR0yyC1LPci3lUc3SPg2lxo7XhhwKWJUpq
	 +tqCJgnsr1jkdUk4cA7HTAwgsmpnmBXtg64/4YifDhWMiQNKgGYYbovkQSmQgbcC+eWnL
	 VSxryKNvelkF6eGGSap9HvlWbhiDwpEtV3qo2GjGq+PJSXDE3+sN/T+iFORI/wP1vq9ul
	 V2Bgue1h/MYggHhmcnfgBpUUYFPFv1A6CHz1JlPAyqvxkZnC6TY7JyDRwzBpQq3gqgai4
	 EF6MwSCt8Pnnc5oi7yBqXbd4HRqNFzWLVRxOpHN+33RIThIpnPyEq8JekmsAQCnmd4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104611;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6m8njvN9ZWYXV/6SoiWAV/H7633o5vHreNJNS5sCy/0=;
	b=mTPhDBviTQ01772+oIt1VqLfXB5k52oIQ5nX+glZ1+9XuL7HvgkOMwEFsQmW7jljoAdu
	 9yZZWLjJDDHm0EYyepHPxZBOOYiisP5QSUFrrSD5D49638q6nSwR7zJMKtKpye7LaJUy7
	 9o7FtKHIdowDklfy9AuM3PgCTWGta35p+RBEcifadUpomHH2qK1nWF30Ev4X2okrYJFSx
	 0jRtuyAdFQ28ZCjPbhz2kR6bb6znEfGfk3wr0ATH9IjfUeB0gl3shzxrUObsEhjS90gJ2
	 lcxh0QaDCyCFX0kBi8k9b0jI9hXivJyo3RIO/4QlGoQg9BoWEU4vE6bESyjN+vPSChA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LHY5tEPT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B37D606A324
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LHY5tEPT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC171F000C4;
	Thu, 19 Nov 2026 16:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795104611;
	bh=6m8njvN9ZWYXV/6SoiWAV/H7633o5vHreNJNS5sCy/0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LHY5tEPTFTJjVR3Errs3zkK7jVKI9PsY0/pCjZy1NNboziD+1wgWNQn3VJbpWhqfO
	 1k8MQjrdGoUifKVMVIyMWViVZOfoObAiyY9DDZGQR0thRKOqipOMH1gbGT/PfSSouN
	 dzuOee/K2hcSwvMYDsqIsjG1jTikyuaC90Er2XXyhjAAs6OQD5NJdUioOJ3zn2eTrR
	 8SQpAy8W10RL8bQsrPq56pWIxK7TmNz1S8KX0XTg6EsflYep7n4ccyGGyEI6Zyhz+F
	 qid5ODIiCHAZDcdlcX6Th8tjDsVX0nTpafJtCOPBIrHcfx7n+NAHTql3/Nq6xdNJtm
	 YTqYY6XWx6W2Q==
Message-ID: <sashiko-outbox-223481@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 27/28] media: mali-vpu: add stateful decoder state
 machine
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charvi Mehta" <charvi.mehta@arm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261119153758.1426673-28-charvi.mehta@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
 <20261119153758.1426673-28-charvi.mehta@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 16:10:10 +0000
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
- [High] media: mali-vpu: allow STREAMING to STOPPED on CAPTURE
  streamoff
- [High] media: mali-vpu: missing DRAIN to STOPPED transition breaks
  CMD_START
- [High] media: mali-vpu: handle OUTPUT streamoff in source-change
  states
- [High] media: mali-vpu: handle MALI_VPU_FW_CODE_ALLOC_PARAM during
  DRAIN state
- [Medium] media: mali-vpu: validate queue state on V4L2_DEC_CMD_START
  in decoder_cmd()
- [Medium] media: mali-vpu: avoid premature state transition in
  session_streamoff()
--

commit 97c2307773c544ec658afbe30255359b9cb184c5
Author: Shobhit Pandey <shobhit.pandey@arm.com>

media: mali-vpu: add stateful decoder state machine

This commit replaces the decoder drc_pending flag with an explicit session
state machine tracking queue streaming states, drain handling, and
source-change events.

> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c b/drivers=
/media/platform/arm/mali-vpu/mali-vpu-dec.c
> index 7e34c24ae050f..6ce61de22a802 100644
> --- a/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c

[ ... ]

> @@ -79,11 +81,31 @@ int mali_vpu_decoder_cmd(struct file *filp, void *pri=
v, struct v4l2_decoder_cmd
> =20
>  	switch (cmd->cmd) {
>  	case V4L2_DEC_CMD_STOP:
> -		ret =3D mali_vpu_session_fw_send_eos(sess);
> +		if (sess->sess_state =3D=3D MALI_VPU_STATE_DRAIN) {
> +			ret =3D -EBUSY;
> +			break;
> +		} else if (sess->sess_state =3D=3D MALI_VPU_STATE_STREAMING) {
> +			ret =3D mali_vpu_session_fw_send_eos(sess);
> +			if (!ret)
> +				ret =3D mali_vpu_dec_update_state(sess, MALI_VPU_STATE_DRAIN);
> +		}
>  		break;
>  	case V4L2_DEC_CMD_START:
> -		vb2_clear_last_buffer_dequeued(v4l2_m2m_get_dst_vq(sess->m2m_ctx));
> -		ret =3D 0;
> +		if (sess->sess_state =3D=3D MALI_VPU_STATE_DRAIN &&
> +		    !dst_q->last_buffer_dequeued) {
> +			ret =3D -EBUSY;
> +			break;
> +		}
> +
> +		ret =3D mali_vpu_submit_deferred_bufs(sess);
> +		if (ret)
> +			break;
> +
> +		ret =3D mali_vpu_dec_update_state(sess, MALI_VPU_STATE_STREAMING);
> +		if (ret)
> +			break;
> +
> +		vb2_clear_last_buffer_dequeued(dst_q);
>  		break;

[Severity: Medium]
Can V4L2_DEC_CMD_START transition sess->sess_state to
MALI_VPU_STATE_STREAMING when only one queue has been started?

Unlike V4L2_DEC_CMD_STOP, V4L2_DEC_CMD_START does not check whether both
queues are streaming before calling mali_vpu_submit_deferred_bufs() and
mali_vpu_dec_update_state().  Because mali_vpu_dec_allow_state_change()
allows MALI_VPU_STATE_STOPPED, MALI_VPU_DEC_STATE_FIRST_SOURCE_CHANGE, and
MALI_VPU_STATE_RESET to enter MALI_VPU_STATE_STREAMING, calling
V4L2_DEC_CMD_START while only OUTPUT is streaming moves sess->sess_state
to MALI_VPU_STATE_STREAMING while CAPTURE is still off.  When
MALI_VPU_FW_CODE_ALLOC_PARAM later arrives during initial header parsing,
mali_vpu_session_handle_fw_msg() then enters
MALI_VPU_DEC_STATE_DYNAMIC_RESOLUTION_CHANGE instead of
MALI_VPU_DEC_STATE_FIRST_SOURCE_CHANGE, and subsequent CAPTURE STREAMON
cannot exit that state, causing mali_vpu_session_qbuf() to immediately
return every queued CAPTURE buffer with V4L2_BUF_FLAG_LAST.

In addition, calling V4L2_DEC_CMD_START in MALI_VPU_STATE_INITIALIZATION
runs mali_vpu_submit_deferred_bufs() and then fails in
mali_vpu_dec_update_state() with -EINVAL.

>  	default:
>  		ret =3D -EINVAL;
> @@ -93,3 +115,112 @@ int mali_vpu_decoder_cmd(struct file *filp, void *pr=
iv, struct v4l2_decoder_cmd
>  	mutex_unlock(&sess->vq_lock);
>  	return ret;
>  }
> +
> +static bool mali_vpu_dec_allow_state_change(struct mali_vpu_session *ses=
s,
> +					    enum mali_vpu_sess_state new_state)
> +{
> +	switch (sess->sess_state) {
> +	case MALI_VPU_STATE_INITIALIZATION:
> +		return (new_state =3D=3D MALI_VPU_STATE_RESET ||
> +			new_state =3D=3D MALI_VPU_STATE_STOPPED);
> +	case MALI_VPU_STATE_STREAMING:
> +		return (new_state =3D=3D MALI_VPU_STATE_RESET ||
> +			new_state =3D=3D MALI_VPU_DEC_STATE_DYNAMIC_RESOLUTION_CHANGE ||
> +			new_state =3D=3D MALI_VPU_STATE_DRAIN);

[Severity: High]
Does MALI_VPU_STATE_STREAMING also need to allow transitioning to
MALI_VPU_STATE_STOPPED here?

In mali_vpu_dec_state_change_streamoff(), stopping the CAPTURE queue while
in MALI_VPU_STATE_STREAMING requests a transition to
MALI_VPU_STATE_STOPPED.  Because MALI_VPU_STATE_STOPPED is omitted here,
mali_vpu_dec_update_state() returns -EINVAL, causing
mali_vpu_session_streamoff() to jump to err_session, skip stopping and
flushing the firmware, and put the session into a fatal error state via
mali_vpu_session_set_error().

[ ... ]

> +int mali_vpu_dec_state_change_streamoff(struct mali_vpu_session *sess, e=
num v4l2_buf_type type)
> +{
> +	enum mali_vpu_sess_state new_state;
> +
> +	if (V4L2_TYPE_IS_OUTPUT(type)) {
> +		switch (sess->sess_state) {
> +		case MALI_VPU_STATE_STOPPED:
> +			new_state =3D MALI_VPU_STATE_INITIALIZATION;
> +			break;
> +		case MALI_VPU_STATE_STREAMING:
> +		case MALI_VPU_STATE_DRAIN:
> +			new_state =3D MALI_VPU_STATE_RESET;
> +			break;
> +		default:
> +			return 0;
> +		}
> +	} else {

[Severity: High]
What happens when VIDIOC_STREAMOFF is called on the OUTPUT queue while in
MALI_VPU_DEC_STATE_FIRST_SOURCE_CHANGE or
MALI_VPU_DEC_STATE_DYNAMIC_RESOLUTION_CHANGE?

Both states hit the default branch and return 0 without updating
sess->sess_state (and mali_vpu_dec_allow_state_change() does not allow
either state to transition to MALI_VPU_STATE_INITIALIZATION or
MALI_VPU_STATE_RESET).  If OUTPUT is streamed off during
MALI_VPU_DEC_STATE_DYNAMIC_RESOLUTION_CHANGE (for example to seek or tear
down the stream), sess->sess_state remains
MALI_VPU_DEC_STATE_DYNAMIC_RESOLUTION_CHANGE; a subsequent OUTPUT STREAMON
stays trapped in that state and bounces every queued CAPTURE buffer with
V4L2_BUF_FLAG_LAST, while a subsequent CAPTURE STREAMOFF sees drc_capture
as true, skips stopping and flushing the firmware, and leaves
sess->sess_state in MALI_VPU_STATE_STOPPED when both queues are off.
Similarly, OUTPUT STREAMOFF during MALI_VPU_DEC_STATE_FIRST_SOURCE_CHANGE
leaves sess->sess_state unchanged when neither queue is streaming.

> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c b/dri=
vers/media/platform/arm/mali-vpu/mali-vpu-session.c
> index 500d80788d0eb..3ff4635e682eb 100644
> --- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c

[ ... ]

> @@ -513,7 +513,14 @@ static int mali_vpu_session_handle_fw_msg(struct mal=
i_vpu_session *sess,
>  		state =3D mali_vpu_buffer_update_info_to_v4l2(vpu_buf);
> =20
>  		mali_vpu_session_buffer_done(sess, vpu_buf, state);
> -
> +		if (vpu_buf->flags & MALI_VPU_BUFFER_EOS) {
> +			if (V4L2_TYPE_IS_OUTPUT(vpu_buf->type) &&
> +			    sess->sess_state =3D=3D MALI_VPU_STATE_STREAMING) {
> +				ret =3D mali_vpu_dec_update_state(sess, MALI_VPU_STATE_DRAIN);
> +				if (ret)
> +					return ret;
> +			}
> +		}
>  		return 0;
>  	}

[Severity: High]
Where does sess->sess_state transition from MALI_VPU_STATE_DRAIN to
MALI_VPU_STATE_STOPPED when the final CAPTURE buffer is returned with
MALI_VPU_BUFFER_EOS?

Only OUTPUT buffers with MALI_VPU_BUFFER_EOS update sess->sess_state here,
so sess->sess_state remains MALI_VPU_STATE_DRAIN after the final CAPTURE
buffer is returned and dequeued.  Because mali_vpu_dec_allow_state_change()
does not allow MALI_VPU_STATE_DRAIN to transition directly to
MALI_VPU_STATE_STREAMING, a subsequent V4L2_DEC_CMD_START in
mali_vpu_decoder_cmd() submits deferred buffers and then fails in
mali_vpu_dec_update_state(sess, MALI_VPU_STATE_STREAMING) with -EINVAL
before clearing dst_q->last_buffer_dequeued.

Note that if sess->sess_state moves to MALI_VPU_STATE_STOPPED as soon as
the firmware returns the CAPTURE EOS buffer while CAPTURE is still
streaming, V4L2_DEC_CMD_START and mali_vpu_session_qbuf() also need to
preserve drain gating until dst_q->last_buffer_dequeued is set, and OUTPUT
STREAMOFF in mali_vpu_dec_state_change_streamoff() needs to transition to
MALI_VPU_STATE_RESET rather than MALI_VPU_STATE_INITIALIZATION when
CAPTURE is still streaming.

> @@ -569,17 +576,31 @@ static int mali_vpu_session_handle_fw_msg(struct ma=
li_vpu_session *sess,
>  			fw_msg->data.dpb_held_frames);
>  		return 0;
>  	case MALI_VPU_FW_CODE_OUTPUT_FLUSH:
> -		dev_dbg(sess->vpu_dev->dev, "fw rsp: Dst queue flushed\n");
> -		if (sess->role =3D=3D MALI_VPU_DECODER && sess->drc_pending)
> +		if (sess->sess_state =3D=3D MALI_VPU_DEC_STATE_DYNAMIC_RESOLUTION_CHAN=
GE ||
> +		    sess->sess_state =3D=3D MALI_VPU_DEC_STATE_FIRST_SOURCE_CHANGE) {
>  			return mali_vpu_session_send_drc_event(sess);
> +		}
> =20
>  		return 0;
>  	case MALI_VPU_FW_CODE_ALLOC_PARAM:
>  		ret =3D mali_vpu_session_update_capture_format(sess, fw_msg->data.allo=
c_params);
> -		if (!ret)
> -			sess->drc_pending =3D true;
> +		if (ret)
> +			return ret;
> =20
> -		return ret;
> +		if (sess->sess_state =3D=3D MALI_VPU_STATE_STREAMING) {
> +			ret =3D
> +			mali_vpu_dec_update_state(sess,
> +						  MALI_VPU_DEC_STATE_DYNAMIC_RESOLUTION_CHANGE);
> +			if (ret)
> +				return ret;
> +		} else if (sess->sess_state =3D=3D MALI_VPU_STATE_STOPPED) {
> +			ret =3D mali_vpu_dec_update_state(sess,
> +							MALI_VPU_DEC_STATE_FIRST_SOURCE_CHANGE);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		return 0;

[Severity: High]
Can MALI_VPU_FW_CODE_ALLOC_PARAM arrive while sess->sess_state is already
MALI_VPU_STATE_DRAIN?

If userspace queues bitstream buffers containing headers or a resolution
change and immediately initiates a drain via V4L2_DEC_CMD_STOP (or an EOS
OUTPUT buffer), sess->sess_state enters MALI_VPU_STATE_DRAIN before the
firmware finishes parsing the queued buffers.  When
MALI_VPU_FW_CODE_ALLOC_PARAM then arrives, sess->sess_state is neither
MALI_VPU_STATE_STREAMING nor MALI_VPU_STATE_STOPPED, so it stays in
MALI_VPU_STATE_DRAIN.  The CAPTURE flush triggered by
MALI_VPU_FW_CODE_SEQUENCE_PARAMS then returns a 0-byte buffer with
V4L2_BUF_FLAG_LAST that queues a premature V4L2_EVENT_EOS in
mali_vpu_session_buffer_done(), and MALI_VPU_FW_CODE_OUTPUT_FLUSH drops
V4L2_EVENT_SOURCE_CHANGE.

[ ... ]

> @@ -1003,12 +1033,19 @@ int mali_vpu_session_streamoff(struct mali_vpu_se=
ssion *sess, enum v4l2_buf_type
>  	if (sess->error)
>  		return 0;
> =20
> +	drc_capture =3D
> +		sess->sess_state =3D=3D MALI_VPU_DEC_STATE_DYNAMIC_RESOLUTION_CHANGE &&
> +		mali_vpu_is_raw_q(sess, type);
> +
> +	ret =3D mali_vpu_dec_state_change_streamoff(sess, type);
> +	if (ret)
> +		goto err_session;
> +
>  	if (sess->fw_bin_state !=3D MALI_VPU_SESSION_FW_BIN_READY ||
>  	    !sess->sched_sess.lsid)
>  		return 0;
> =20
> -	if (sess->drc_pending && sess->role =3D=3D MALI_VPU_DECODER &&
> -	    mali_vpu_is_raw_q(sess, type)) {
> +	if (drc_capture) {
>  		ret =3D mali_vpu_session_wait_pending(sess);

[Severity: Medium]
Does updating sess->sess_state in mali_vpu_dec_state_change_streamoff()
before mali_vpu_session_wait_pending() cause in-flight firmware flush
responses to see the wrong state?

In the drc_capture path, mali_vpu_dec_state_change_streamoff() immediately
changes sess->sess_state from MALI_VPU_DEC_STATE_DYNAMIC_RESOLUTION_CHANGE
to MALI_VPU_STATE_STOPPED before mali_vpu_session_wait_pending() drops
sess->vq_lock to wait for pending firmware responses.  If
MALI_VPU_FW_CODE_OUTPUT_FLUSH or flushed 0-byte CAPTURE buffers (marked
with V4L2_BUF_FLAG_LAST) are processed during that wait,
mali_vpu_session_handle_fw_msg() sees MALI_VPU_STATE_STOPPED, which drops
V4L2_EVENT_SOURCE_CHANGE and causes mali_vpu_session_buffer_done() to emit
a spurious V4L2_EVENT_EOS.  Similarly, during a normal CAPTURE STREAMOFF,
mali_vpu_session_fw_send_flush() returns active CAPTURE buffers with 0
payload size while sess->sess_state is already MALI_VPU_STATE_STOPPED or
MALI_VPU_STATE_INITIALIZATION, also triggering V4L2_EVENT_EOS in
mali_vpu_session_buffer_done().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119153758.1426=
673-1-charvi.mehta@arm.com?part=3D27
