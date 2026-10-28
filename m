Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793160069;
	b=GueA0N0gV8is0GzS7LmJXjIdn2QGuKPWd5m7SNRMsBfPHz3o7MLN83DV/zVEhOIrlVfH
	 HS3PbPoqZt0KkaIG0VwnvaFVC1LWSRTAdYbgjf0goQG8tI/c8iBnBC1lZy2DMEUXZZdXP
	 jKF90SXNKj+F0PmBQ3+0AK8M8v61MtxDco0YV5sefQ+mQiz9SRs6sY2r2wJfkcJXeLcyS
	 YlMNQ2wlglJK5he9VQlDFYQZ0xEiEX7ZOcyAC97ry3MvzmjApImCbdT2HgLyly5AOXOUj
	 +2mJEYsfoUOHGSk7+DW3GSwmcwbcx1UdnVkaJvTFchs0vZ7OpuO8G887kS4eRhYIjaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793160069;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qFV9DC3OuKByMgz2seQEienRgaJaaCQ/6cGtlOpCAY0=;
	b=PHb0NVNQ7p/BAX1wxXys3cfkDlvxx8WUjp3JqtvQtxgOPTHYCRKEpaXqZzUgAF63imVp
	 KHJOdQEMFnWSxX0KhxlEmGMANrgQ6IOI1dlh5SCX2gGXb3ykaNBfnmeI423lRx0uzfeH4
	 c0ddBzsOm1UGLPm0v1p6m5aDsvvgQRNIfg1So5HWc1N5/i96G4T6wWlR+7j3bqvPYlWhA
	 oVXuvF15Oac0i3TwMFY4zmrY/up9WdVQv+QRtDSDLhtliUSCTlHG7bUrdWKNIuOveq7Tc
	 bK1gJSxta3eAnJM9xANW61KzJNacKDgQjhnlP3Kwn87pKj/QMv04IlIvu0P9vnVgvUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YmYGW9iJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBDB606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 04:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YmYGW9iJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 991891F01825;
	Wed, 28 Oct 2026 04:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793160068;
	bh=qFV9DC3OuKByMgz2seQEienRgaJaaCQ/6cGtlOpCAY0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YmYGW9iJttIAOhwxg2Wr0NRhicAIaBYjDSabuLjW5lLZtqHCBvNMUrbmW32P4PqXz
	 z2K7FGErr5JrRHzEACVd4Xb2hPKtItVVAjN/v7oypKH+YdxdvroYDx8vcaVglaQdA3
	 hinnS7BzB/PlZQkAmwsPPL0VkF8TchvvwV7rKwpDnDABxuDzojC/3CkWYARKo5cyVX
	 0Gu2VX2obQSeGTZIv8DzJhJRk/LaEIwpcSnwBmMofBR2mwKuCeZyV5FdML9epPR8U/
	 sSlcs9UjvRLp5QUUpdP0TDXvv1+AISADUAFOov3sM7i3+Owq0z+PClucpZAqAhauyI
	 PkDZyAJG1SPYw==
Message-ID: <sashiko-outbox-187459@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/9] media: camss: csid: report frame starts from CSID
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261028034105.326535-6-xiaqinghuan@mail.ustc.edu.cn>
References: <20261028034105.326535-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261028034105.326535-6-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 04:01:08 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] media: camss: vfe_buf_done() never resets frame_started for next=
 frame
- [Medium] media: camss: vfe: inconsistent event ioctls when frame_start is=
 unset
--

commit 7457e598955f906dac687d34057f24b9b8d1d505
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

media: camss: csid: report frame starts from CSID

This commit handles CSID generation 980 start-of-frame interrupts and
forwards them to the paired VFE via camss_frame_start(). The VFE queues a
V4L2_EVENT_FRAME_SYNC event on the subdev node, tracks frame sequence numbe=
rs
at frame start, and checks whether a frame started before marking a complet=
ed
buffer as done.

> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index d1b66033a096d..f42fc56e7dfc9 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -444,6 +444,34 @@ u32 vfe_hw_version(struct vfe_device *vfe)
>  	return hw_version;
>  }
> =20
> +void vfe_frame_start(struct vfe_device *vfe, int wm)
> +{
> +	struct v4l2_event event =3D { .type =3D V4L2_EVENT_FRAME_SYNC };
> +	struct vfe_output *output;
> +	struct vfe_line *line;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&vfe->output_lock, flags);
> +	if (vfe->wm_output_map[wm] =3D=3D VFE_LINE_NONE)
> +		goto out_unlock;
> +
> +	line =3D &vfe->line[vfe->wm_output_map[wm]];
> +	output =3D &line->output;
> +	if (output->state !=3D VFE_OUTPUT_ON)
> +		goto out_unlock;
> +
> +	/* Count frames even when there is no buffer available for capture. */
> +	event.u.frame_sync.frame_sequence =3D output->sequence++;
> +	output->frame_started =3D true;
> +	spin_unlock_irqrestore(&vfe->output_lock, flags);
> +
> +	v4l2_event_queue(line->subdev.devnode, &event);
> +	return;
> +
> +out_unlock:
> +	spin_unlock_irqrestore(&vfe->output_lock, flags);
> +}
> +
>  /*
>   * vfe_buf_done - Process write master done interrupt
>   * @vfe: VFE Device
> @@ -478,7 +506,13 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
>  	}
> =20
>  	ready_buf->vb.vb2_buf.timestamp =3D ts;
> -	ready_buf->vb.sequence =3D output->sequence++;
> +	if (ops->frame_start) {
> +		ready_buf->vb.sequence =3D output->sequence - 1;
> +		if (!output->frame_started)
> +			state =3D VB2_BUF_STATE_ERROR;
> +	} else {
> +		ready_buf->vb.sequence =3D output->sequence++;
> +	}

[Severity: Medium]
Should vfe_buf_done() reset output->frame_started to false after consuming
it for the current buffer?

In vfe_enable_output_v2(), output->sequence is initialized to 0 and
output->frame_started is set to false. When csid_isr() -> camss_frame_start=
()
-> vfe_frame_start() runs on the first start-of-frame interrupt, it sets
output->frame_started =3D true.

Because vfe_buf_done() never clears output->frame_started back to false,
output->frame_started remains true for the rest of the streaming session. On
subsequent frames, if a buffer completion interrupt arrives before that
frame's start-of-frame interrupt, !output->frame_started will not trigger,
leaving state as VB2_BUF_STATE_DONE with a duplicate sequence number
(output->sequence - 1).

Also, if a buffer completes before the very first start-of-frame interrupt
while output->sequence is still 0, does ready_buf->vb.sequence =3D
output->sequence - 1 underflow unsigned int to UINT_MAX?

[ ... ]

> @@ -1972,8 +2007,23 @@ static int vfe_link_setup(struct media_entity *ent=
ity,
>  	return 0;
>  }
> =20
> +static int vfe_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *f=
h,
> +			       struct v4l2_event_subscription *sub)
> +{
> +	struct vfe_line *line =3D v4l2_get_subdevdata(sd);
> +	struct vfe_device *vfe =3D to_vfe(line);
> +
> +	if (!vfe->res->hw_ops->frame_start ||
> +	    sub->type !=3D V4L2_EVENT_FRAME_SYNC || sub->id)
> +		return -EINVAL;
> +
> +	return v4l2_event_subscribe(fh, sub, 16, NULL);
> +}
> +
>  static const struct vfe_subdev_core_ops vfe_core_ops =3D {
>  	.s_power =3D vfe_set_power,
> +	.subscribe_event =3D vfe_subscribe_event,
> +	.unsubscribe_event =3D v4l2_event_subdev_unsubscribe,
>  };
> =20
>  static const struct v4l2_subdev_video_ops vfe_video_ops =3D {
> @@ -2080,6 +2130,8 @@ int msm_vfe_register_entities(struct vfe_device *vf=
e,
>  		v4l2_subdev_init(sd, &vfe_v4l2_ops);
>  		sd->internal_ops =3D &vfe_v4l2_internal_ops;
>  		sd->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> +		if (vfe->res->hw_ops->frame_start)
> +			sd->flags |=3D V4L2_SUBDEV_FL_HAS_EVENTS;

[Severity: Medium]
On VFE hardware generations where vfe->res->hw_ops->frame_start is NULL,
msm_vfe_register_entities() does not set V4L2_SUBDEV_FL_HAS_EVENTS on the
subdevice, but vfe_core_ops still wires up .subscribe_event and
.unsubscribe_event unconditionally.

In drivers/media/v4l2-core/v4l2-subdev.c:subdev_do_ioctl(), the core checks
for those callbacks before checking V4L2_SUBDEV_FL_HAS_EVENTS:

	case VIDIOC_DQEVENT:
		if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
			return -ENOIOCTLCMD;

		return v4l2_event_dequeue(vfh, arg, file->f_flags & O_NONBLOCK);

	case VIDIOC_SUBSCRIBE_EVENT:
		if (v4l2_subdev_has_op(sd, core, subscribe_event))
			return v4l2_subdev_call(sd, core, subscribe_event,
						vfh, arg);
		...
		return -ENOIOCTLCMD;

	case VIDIOC_UNSUBSCRIBE_EVENT:
		if (v4l2_subdev_has_op(sd, core, unsubscribe_event))
			return v4l2_subdev_call(sd, core, unsubscribe_event,
						vfh, arg);

		if (sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS)
			return v4l2_event_subdev_unsubscribe(sd, vfh, arg);

		return -ENOIOCTLCMD;

When vfe->res->hw_ops->frame_start is NULL, VIDIOC_DQEVENT returns
-ENOIOCTLCMD (-ENOTTY), whereas VIDIOC_SUBSCRIBE_EVENT calls
vfe_subscribe_event() and returns -EINVAL, and VIDIOC_UNSUBSCRIBE_EVENT cal=
ls
v4l2_event_subdev_unsubscribe() and returns 0.

Should vfe_subscribe_event() return -ENOIOCTLCMD when
!vfe->res->hw_ops->frame_start, and could .unsubscribe_event be omitted from
vfe_core_ops so subdev_do_ioctl() falls back to
v4l2_event_subdev_unsubscribe() only when V4L2_SUBDEV_FL_HAS_EVENTS is set?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028034105.3265=
35-1-xiaqinghuan@mail.ustc.edu.cn?part=3D5
