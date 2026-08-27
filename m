Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60D043F8B8
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 11:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787828728; cv=none; b=u+qVOqYeBydjgfn1snSormeilCMed/7qWImvy48Jh8pc8jIxPveNGDqCyfbPUl/HjoKGMYYMWh1ZP+uaeR+Dkqj9xmorBCBj5jVIaRjHa8qE/O655/pOn6+sSKllUymxhO15mTKkxMxpe3eBQej/NJjANMHS8VRh5dpTkviHIkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787828728; c=relaxed/simple;
	bh=40tI74NNIApr8onynOZ6aGVhvic7TfIGM7RLSVuLZMw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uqqcaePAXR8H6LGmWkj7KChc51CUcEH1YJKwzhdLx75BREudVF0QMeffjxMiAGky6yf871v1qfDdxFSp+kcwrE4cyZxKsv0yKuGR+AMt16++Y2iL+rmrax89BvdTgUtKe5G4WswtEK8zQkjO+iM/2rIdmcO/1BB5KVNezOdMDe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ok/6G6wi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ok/6G6wi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B80561F00A3D;
	Thu, 27 Aug 2026 11:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787828723;
	bh=cdHuo8j7afbgm28XMc3Q9+xyIUAKcxw2qI5wn36LWJM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ok/6G6wilpoy/+5SzEgmTs/6ZDkOJeOc3cUWI4A0ZS4y3GQAqa8xNvG1b+Wx3DFmR
	 qybvsfIMws2K03Nn70vE47PqWzlh49GTTyyayGRTD+ggafOXm/5DY2ShI04AET2+dx
	 VobkIi8QjdAvjsFskqRivCTOXhWfmkkAYiMunBnwEQeDnKUgak+ZCKQli3PfVUNhK2
	 PqbdvrEPQyzXV/z+oN6IwiWn92iKoaMh4L8JRUXfk7B1W8rUthAYALPNhykKL3w8UC
	 RfTANBvxn1novbvZAkxxKLpaMq2FqbX8cjSfYeOvUTf5Hob9IVmS+ckV7zhwogYbVv
	 vNv/cEw3Zscqw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/5] media: rkisp2: Add parameters output video node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Elder" <paul.elder@ideasonboard.com>
Cc: robh@kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260827-rkisp2-v3-2-e91ff0a604d6@ideasonboard.com>
References: <20260827-rkisp2-v3-0-e91ff0a604d6@ideasonboard.com>
 <20260827-rkisp2-v3-2-e91ff0a604d6@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 11:05:22 +0000
Message-Id: <20260827110522.B80561F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] The parameter buffer validation checks the userspace-mapped me=
mory instead of the internal kernel copy, creating a Time-Of-Check to Time-=
Of-Use (TOCTOU) vulnerability that can lead to out-of-bounds memory access.
- [High] The first queued parameter buffer is permanently leaked every time=
 streaming starts because it is dequeued but never completed.
- [Medium] Mutex and media entity resources are leaked on the error path if=
 `video_register_device` fails.
--

commit 29257cb1b743c9d1fdc2e61085bac5b0b1b5d99d
Author: Paul Elder <paul.elder@ideasonboard.com>

media: rkisp2: Add parameters output video node
   =20
Implement support for setting parameters on the ISP by queueing
parameter buffers to rkisp2.

> diff --git a/drivers/media/platform/rockchip/rkisp2/rkisp2-params.c b/dri=
vers/media/platform/rockchip/rkisp2/rkisp2-params.c
> index 0000000000000..07f57f26c7b0e
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkisp2/rkisp2-params.c
[ ... ]
> +static int rkisp2_params_vb2_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct rkisp2_params *params =3D vb->vb2_queue->drv_priv;
> +	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> +	struct rkisp2_params_buffer *params_buf =3D to_rkisp2_params_buffer(vbu=
f);
> +	struct v4l2_isp_params_buffer *cfg =3D vb2_plane_vaddr(&vbuf->vb2_buf, =
0);
> +	size_t payload_size =3D vb2_get_plane_payload(vb, 0);
> +	int ret;
> +
> +	ret =3D v4l2_isp_params_validate_buffer_size(params->rkisp2->dev, vb,
> +						   v4l2_isp_buffer_size(RKISP2_PARAMS_MAX_SIZE));
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Copy the parameters buffer to the internal scratch buffer to avoid
> +	 * userspace modifying the buffer content while the driver processes it.
> +	 */
> +	memcpy(params_buf->cfg, cfg, payload_size);
> +
> +	return v4l2_isp_params_validate_buffer(params->rkisp2->dev, vb, cfg,
> +				rkisp2_params_block_types_info,
> +				ARRAY_SIZE(rkisp2_params_block_types_info));
> +}

[Severity: Critical]
Can this introduce a TOCTOU (Time-Of-Check to Time-Of-Use) regression?

The code correctly copies the userspace buffer to an internal scratch buffer
(params_buf->cfg) to prevent concurrent modification. However,
v4l2_isp_params_validate_buffer() is then called on the mutable userspace
pointer (cfg) rather than the safe internal copy (params_buf->cfg).

A malicious userspace program could submit invalid data, wait for the memcp=
y()
to finish, and then overwrite the shared memory with valid data before the
validation step completes.

Since the driver later uses the internal copy, it might end up consuming an
unvalidated parameter block type and using it to index rkisp2_params_handle=
rs[],
which can lead to out-of-bounds memory access.

[ ... ]
> +void rkisp2_params_post_configure(struct rkisp2_params *params)
> +{
> +	struct rkisp2_params_buffer *buf;
> +
> +	spin_lock_irq(&params->buf_lock);
> +	buf =3D list_first_entry_or_null(&params->params,
> +				       struct rkisp2_params_buffer, queue);
> +	if (buf)
> +		list_del(&buf->queue);
> +	spin_unlock_irq(&params->buf_lock);
> +
> +	if (!buf)
> +		return;
> +
> +	rkisp2_params_configure(params, buf, RKISP2_PARAMS_CONFIG_PRIO_POST);
> +}

[Severity: High]
Is a buffer permanently leaked here when streaming starts?

When the ISP starts, the first queued parameter buffer is removed from the =
list
via list_del(&buf->queue) and passed to rkisp2_params_configure() with
RKISP2_PARAMS_CONFIG_PRIO_POST.

However, rkisp2_params_configure() explicitly checks for
RKISP2_PARAMS_CONFIG_PRIO_NONE before calling vb2_buffer_done():

static void rkisp2_params_configure(struct rkisp2_params *params,
...
	if (prio =3D=3D RKISP2_PARAMS_CONFIG_PRIO_NONE)
		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
}

Since the buffer is no longer on the params->params list and vb2_buffer_don=
e()
is skipped, it seems the buffer will never be returned to vb2. This could f=
reeze
the pipeline or result in a WARN_ON during stop_streaming() due to left beh=
ind
active buffers.

[ ... ]
> +int rkisp2_params_register(struct rkisp2_device *rkisp2)
> +{
[ ... ]
> +	node->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> +	ret =3D media_entity_pads_init(&vdev->entity, 1, &node->pad);
> +	if (ret)
> +		goto err_media;
> +
> +	ret =3D video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> +	if (ret) {
> +		dev_err(rkisp2->dev,
> +			"failed to register %s, ret=3D%d\n", vdev->name, ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +
> +err_media:
> +	media_entity_cleanup(&vdev->entity);
> +	mutex_destroy(&node->vlock);
> +	return ret;
> +}

[Severity: Medium]
Are resources leaked on this error path if video_register_device() fails?

If video_register_device() returns an error, the code returns the error code
directly instead of jumping to the err_media cleanup block. This leaves the
media entity and node->vlock uncleaned, leaking these resources.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827-rkisp2-v3-=
0-e91ff0a604d6@ideasonboard.com?part=3D2
