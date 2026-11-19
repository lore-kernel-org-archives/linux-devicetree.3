Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103895;
	b=ECrAbQzZUuZJEiHHHA+3aiB+//4+0Ky/LQTjc5uvFeNOKErhLGvKRE1xel8CYiyawC54
	 nHPgKunl8XyYZRdkQ4l68y6eiwkM8pwWlFuG9SOarHrQxYKsLAGgy8HbxfKKV5tq0PvHc
	 tO4frgDEb1kZ2rdl91+1DsU7fIg6nJXcb45IrVgvGOuanG2xn4WAs6hKzAu/n0ZfrLW6e
	 hsTGi7CMzCH9PSK89qqiz38NMFFHA9d1JNOt2VA0+jo3XuTnTJE5AT+Ul+4t036MylKtT
	 L83LaVyW6CSBUn7xNaLiPYjmyrG3i0LnFVDcOXdSQw8MBLMycj8fy4rgwYZ2x5WVIGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103895;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qDXKU7tMgNOAiWjLlrc88a1VhV8xmrf3ESYrcntFsvU=;
	b=KuIIPim+Cd59t38QfG3uKHXF2B+nD3M0URyfAxOjBjLoRxBug6LiqHt6TdKxYdzaab10
	 Z5YexaTAnEZXL0p5qrCZw1DjQZR9XF8lpN/ORUNt5tOnuvqU38m8O+Ktv4KVY9k/Ir0JU
	 mnGf/fltTxbXQU8vNM5WnPDYLzcXSy4UNENM4YT2NoEblFHjlIvW+6crvsW5AoHv8u2q3
	 7EleWSobJnHv7efZkmG1n0uGJiTsfWtV+6ZHI60YOza2LFAMXG6O4oPX3nUHVVrNPb+mU
	 +4wnRrmuVnMKPVXvH/Bnzp/Rh1XVY8SoKXDVHeSMtBTl6BCWurY++m4+wYWZJg8GR2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VQLYq9Ng;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B084B60A2601
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 15:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VQLYq9Ng
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB061F000C4;
	Thu, 19 Nov 2026 15:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795103895;
	bh=qDXKU7tMgNOAiWjLlrc88a1VhV8xmrf3ESYrcntFsvU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VQLYq9NgDF6zFVBNMf4+HkzJ7M3DrnCsbJErSVvHvgwePMzVm792LqQzBi+zGCC8G
	 7bd8ymWJVOyaHUFSkRUAuXozA2Wp2WExuVCG0j8DamNqA0QINL+IFiq+6mh7hWCo1w
	 CGjKZ2qxWrXwIVYrp0vl7b4LG+ZWOttydwTrhwE6h9iy6HKiqznmL+jkMxaH4pXzvw
	 OJo7yBb+vEwekx7k1OF/SlcIqhA97hhgiB5J/VljDgqQ+1hYGYNLV07uFBS7Kc4Hcc
	 B+YCqaR6H9/1PCL08GJYf18JYE/GnOgr1iqCnGaidhJX25tYp40bB89lU5WGa9UU8t
	 T+DYbX3hLXSAA==
Message-ID: <sashiko-outbox-223450@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 21/28] media: mali-vpu: handle firmware buffer
 exchange
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charvi Mehta" <charvi.mehta@arm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261119153758.1426673-22-charvi.mehta@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
 <20261119153758.1426673-22-charvi.mehta@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 15:58:14 +0000
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
- [High] media: mali-vpu: in-flight buffers not untracked on streamoff
  or cleanup
- [Medium] media: mali-vpu: bogus error and early loop exit in
  mali_vpu_fw_get_buffer()
- [Medium] media: mali-vpu: spurious V4L2_BUF_FLAG_LAST on rejected
  capture buffers
--

commit 470c746dd3c53a73aac1ec2091f9e9c5b26e72a8
Author: Rath Sankaralingam <rath.sankaralingam@arm.com>

media: mali-vpu: handle firmware buffer exchange

This commit implements buffer submission to the firmware and handling of
returned input and output buffer responses using the v3 buffer protocol,
tracking in-flight buffers in an xarray by non-zero buffer IDs.

> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.c b/driv=
ers/media/platform/arm/mali-vpu/mali-vpu-buffer.c
> index c1df3e2d4eacf..e404fb933195f 100644
> --- a/drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.c
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.c
[ ... ]
> @@ -102,6 +137,27 @@ static void mali_vpu_buffer_update_flags_from_v4l2(s=
truct vb2_buffer *vb2_buf)
>  		vpu_buf->flags |=3D MALI_VPU_BUFFER_EOS;
>  }
> =20
> +static void mali_vpu_buffer_update_flags_to_v4l2(struct mali_vpu_buffer =
*vpu_buf)
> +{
> +	struct vb2_v4l2_buffer *v4l2_buf =3D &vpu_buf->m2m_buf.vb;
> +
> +	v4l2_buf->flags &=3D ~(V4L2_BUF_FLAG_ERROR |
> +			     V4L2_BUF_FLAG_KEYFRAME |
> +			     V4L2_BUF_FLAG_LAST);
> +
> +	if (vpu_buf->flags & MALI_VPU_BUFFER_EOS ||
> +	    (V4L2_TYPE_IS_CAPTURE(vpu_buf->type) &&
> +	     mali_vpu_buffer_get_bytesused(&vpu_buf->m2m_buf.vb.vb2_buf) =3D=3D=
 0))
> +		v4l2_buf->flags |=3D V4L2_BUF_FLAG_LAST;
> +
> +	if (vpu_buf->flags & MALI_VPU_BUFFER_CORRUPT)
> +		v4l2_buf->flags |=3D V4L2_BUF_FLAG_ERROR;
> +
> +	if (V4L2_TYPE_IS_CAPTURE(vpu_buf->type) &&
> +	    vpu_buf->flags & MALI_VPU_BUFFER_REJECTED)
> +		mali_vpu_buffer_clear_bytesused(vpu_buf);
> +}

[Severity: Medium]
Can a rejected capture buffer be returned to userspace with
V4L2_BUF_FLAG_LAST spuriously set?

When firmware rejects a capture frame buffer with
MVE_BUFFER_FRAME_FLAG_REJECTED and zero visible dimensions,
mali_vpu_convert_buffer_frame() zeroes plane payload_size and offset, and
mali_vpu_buffer_update_bytesused_to_v4l2() propagates bytesused =3D 0 to
vb2_buf before mali_vpu_buffer_update_flags_to_v4l2() runs.  As a result,
mali_vpu_buffer_get_bytesused() is already 0 here and sets
V4L2_BUF_FLAG_LAST even when MALI_VPU_BUFFER_EOS is not set.

> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c b/dr=
ivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
> index 820853ca4519a..4e3eaecb8ebee 100644
> --- a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
[ ... ]
> @@ -347,6 +348,20 @@ static int mali_vpu_fw_map_core_regions(struct mali_=
vpu_fw *fw,
>  	return ret;
>  }
> =20
> +static void mali_vpu_fw_clear_buffers(struct mali_vpu_fw *fw)
> +{
> +	struct mali_vpu_buffer *vpu_buf;
> +	unsigned long id;
> +
> +	xa_for_each(&fw->inflight_buffers, id, vpu_buf) {
> +		xa_erase(&fw->inflight_buffers, id);
> +		vpu_buf->fw_buffer_id =3D 0;
> +		vpu_buf->attr =3D MALI_VPU_BUF_ATTR_NONE;
> +	}
> +
> +	xa_destroy(&fw->inflight_buffers);
> +}

[Severity: High]
Can this cause a use-after-free on vpu_buf if buffers are freed after
VIDIOC_STREAMOFF?

mali_vpu_vb2_stop_streaming() completes queued buffers back to vb2 without
removing in-flight buffers from fw->inflight_buffers or clearing
vpu_buf->fw_buffer_id, and mali_vpu_vb2_buffer_cleanup() does not untrack
them either.  If userspace frees the buffers after streamoff (e.g. via
VIDIOC_REQBUFS(0)), dangling vpu_buf pointers remain in
fw->inflight_buffers and are written to here during session close (or in
mali_vpu_fw_resolve_returned_buffer() if firmware returns the buffer).

If userspace instead restarts streaming and re-queues the same buffers
after streamoff, vpu_buf->fw_buffer_id is still non-zero, so
mali_vpu_fw_track_buffer() fails with -EBUSY.  Also, when firmware returns
a buffer that was already completed by stop_streaming,
mali_vpu_session_handle_fw_msg() calls
mali_vpu_buffer_update_info_to_v4l2() and mutates vb2_buf metadata before
mali_vpu_session_buffer_done() checks whether vb2_buf->state is still
VB2_BUF_STATE_ACTIVE.

[ ... ]

> +static int mali_vpu_fw_get_buffer(struct mali_vpu_fw *fw,
> +				  struct mali_vpu_fw_proto_page *buf_host_page,
> +				  struct mali_vpu_fw_proto_page *buf_mve_page,
> +				  struct mali_vpu_fw_msg *msg, u32 buf_type)
> +{
> +	u16 code;
> +	union {
> +		struct mve_buffer_frame frame;
> +		struct mve_buffer_bitstream bitstream;
> +	} fw_msg;
> +	size_t size =3D sizeof(fw_msg);
> +	int ret;
> +
> +	ret =3D mali_vpu_fw_read_msg(fw, buf_host_page, buf_mve_page, &code,
> +				   &fw_msg, &size);
> +	if (ret <=3D 0)
> +		return ret;
> +
> +	switch (code) {
> +	case MVE_BUFFER_CODE_FRAME:
> +		if (size !=3D sizeof(fw_msg.frame) ||
> +		    (!fw_msg.frame.host_handle &&
> +		     !(fw_msg.frame.frame_flags & MVE_BUFFER_FRAME_FLAG_EOS)))
> +			return -EPROTO;
> +
> +		ret =3D mali_vpu_convert_buffer_frame(fw, msg, buf_type, &fw_msg.frame=
);
> +		if (ret)
> +			return ret;
> +		break;
> +	case MVE_BUFFER_CODE_BITSTREAM:
> +		if (size !=3D sizeof(fw_msg.bitstream) ||
> +		    (!fw_msg.bitstream.host_handle &&
> +		     !(fw_msg.bitstream.bitstream_flags & MVE_BUFFER_BITSTREAM_FLAG_EO=
S)))
> +			return -EPROTO;
> +
> +		ret =3D mali_vpu_convert_buffer_bitstream(fw, msg, buf_type,
> +							&fw_msg.bitstream);
> +		if (ret)
> +			return ret;
> +		break;
> +	default:
> +		dev_dbg(fw->dev, "unknown buf code. code: %u.\n", code);
> +		break;
> +	}
> +
> +	return 1;
> +}

[Severity: Medium]
Does an unknown buffer code in mali_vpu_fw_get_buffer() leave msg->code at
0 (MALI_VPU_FW_CODE_ERROR) while returning 1?

mali_vpu_fw_parse_msg() zeroes *msg before calling mali_vpu_fw_get_buffer(),
so hitting the default branch returns 1 with msg->code =3D=3D
MALI_VPU_FW_CODE_ERROR, causing mali_vpu_session_handle_fw_msg() to treat
it as a fatal firmware error and fail with -EIO.  In addition, if
mali_vpu_fw_read_msg() returns 0 because the buffer queue is unexpectedly
empty after MVE_RESPONSE_CODE_INPUT or MVE_RESPONSE_CODE_OUTPUT was read
from msg_mve, propagating 0 causes mali_vpu_session_irq() to treat msg_mve
as empty and stop draining remaining messages instead of flagging -EPROTO.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119153758.1426=
673-1-charvi.mehta@arm.com?part=3D21
