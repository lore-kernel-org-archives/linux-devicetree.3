Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A70387362
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 06:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790405363; cv=none; b=i1NgfjEEA9VJo9VjmMm8qx/S1FsvM9deIMNeL20XLc+61L3mhRGf48+HUCe6A4ufgW2bnE9jegPBYUXuIq3FIHuuAqvXkz14ca1jKDWGRw/Iwcjigfi96COwZzdOSOeTS9T1BikBCh1NhiUWDdRtWUy63FLUp/Q2HnfzgxbSfBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790405363; c=relaxed/simple;
	bh=auHxQElARcQt6ldumHCK/9u4n7ERrb49nj/cTNsV/Ho=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rZKL1wPgOS1eFkIfNz9pQ4B3Yy6C2EDlocBFCywBFsfQJB33F/m2Vl04tcN9ZarGXj1Ojt8QS+eKoKMNXmWpP8/t9rW0GXzY7RLjJqhmc5e8ilI3f289rwY9sB88c93+BsLF8+WaSbtHMDGBcaUxRlPnEOI0XEgq4M0r2OzwZds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RGIF+/l1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RGIF+/l1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 976721F000FF;
	Sat, 26 Sep 2026 06:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790405361;
	bh=ii9xmkcch1cHBtNOlS71sbS08rhlO6RXMbYPicu9epY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RGIF+/l1iqUSxaJqtsPJHsUCFltQrNLgWqWvPsVVARX9IU8zgxYnBx1z7zpF8Dg+t
	 FmHWfy5k24X3+doWZF+x8fNrJiQce73OgYPrrHs3HxHXsZP/DXCqrPJ5T2TY+3wU68
	 bjv8voviX0FOKJV1vVd8/6VHQn9rn3B+rVruNA+coaE2EgkXOU/3aduaME4uhx44vn
	 4FAyGrdo32wzN7+HG3F+rxvFFzKksK5OQAvzuROJNTV8YLkr/ydRp2yLhxQCRXufmP
	 hPk8717urXE+ixuqJl86DJhvi1ZZRdQjsHW4zxzB9cCcAxabScQR+UxmjhoJLxr7MC
	 LjtW9ZtkO6pbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 06/13] media: iris: Route buffers to the matching
 context bank device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-6-0322ca5dc10c@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-6-0322ca5dc10c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 06:49:21 +0000
Message-Id: <20260926064921.976721F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: use-after-free of context bank devices during deferred V4L2=
 cleanup
--

commit 720de65140e46882c5d0651161ef771fcb1189a2
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

media: iris: Route buffers to the matching context bank device

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range.
Add iris_get_cb_dev(), which maps a buffer type to the owning context
bank device. Bitstream and internal buffers (BIN, ARP, COMV, LINE,
NON_COMV, PERSIST) belong to the non-pixel device, and uncompressed
buffers (DPB, PARTIAL, SCRATCH_1, SCRATCH_2, VPSS) to the pixel device.
BUF_INPUT and BUF_OUTPUT depend on direction and are resolved from
inst->domain: for a decoder the input is non-pixel and the output pixel,
and the other way round for an encoder.
Fall back to core->dev whenever the relevant context bank device is
absent, so platforms still describing "iommus" on the parent iris node
behave exactly as before to maintain backward compatibility.

> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/med=
ia/platform/qcom/iris/iris_buffer.c
> index eb8de60c1177f..6e03d13ac1a79 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -531,7 +531,7 @@ static int iris_create_internal_buffer(struct iris_in=
st *inst,
>  				       enum iris_buffer_type buffer_type, u32 index)
>  {
>  	struct iris_buffers *buffers =3D &inst->buffers[buffer_type];
> -	struct iris_core *core =3D inst->core;
> +	struct device *dev =3D iris_get_cb_dev(inst, buffer_type);

[Severity: High]
Does this acquire the context bank device for DMA mapping without taking a
reference to guarantee its lifetime matches the buffer?

If iris_remove() explicitly calls platform_device_unregister() on these
devices upon sysfs driver unbind, and no standard buffers are active, their
refcount can drop to 0 and they will be freed.

>  	struct iris_buffer *buffer;
> =20
>  	if (!buffers->size)

[ ... ]

> @@ -650,10 +650,10 @@ int iris_queue_internal_buffers(struct iris_inst *i=
nst, u32 plane)
> =20
>  void iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_bu=
ffer *buffer)
>  {
> -	struct iris_core *core =3D inst->core;
> +	struct device *dev =3D iris_get_cb_dev(inst, buffer->type);
> =20
>  	list_del(&buffer->list);
> -	dma_free_attrs(core->dev, buffer->buffer_size, buffer->kvaddr,
> +	dma_free_attrs(dev, buffer->buffer_size, buffer->kvaddr,

[Severity: High]
Can this result in a use-after-free of the context bank device during
deferred V4L2 cleanup?

If standard buffers are active, videobuf2 holds a reference. However, during
deferred cleanup in iris_close(), v4l2_m2m_ctx_release() frees standard
buffers before iris_destroy_all_internal_buffers() runs. This drops the
final refcount, freeing the devices.

Will this fetch and dereference the freed device pointer, passing it to
dma_free_attrs()? Additionally, does the devm-allocated core also get freed
on unbind, making inst->core a dangling pointer here?

[ ... ]

> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media=
/platform/qcom/iris/iris_vidc.c
> index fcbc60016beec..064cf0a80748d 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -108,7 +108,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src=
_vq, struct vb2_queue *dst_
>  	src_vq->drv_priv =3D inst;
>  	src_vq->buf_struct_size =3D sizeof(struct iris_buffer);
>  	src_vq->min_reqbufs_allocation =3D MIN_BUFFERS;
> -	src_vq->dev =3D inst->core->dev;
> +	src_vq->dev =3D iris_get_cb_dev(inst, BUF_INPUT);

[Severity: High]
Does this assign a manually lifetime-managed, short-lived device to the
long-lived vb2_queue context?

>  	src_vq->lock =3D &inst->ctx_q_lock;
>  	ret =3D vb2_queue_init(src_vq);
>  	if (ret)
> @@ -122,7 +122,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src=
_vq, struct vb2_queue *dst_
>  	dst_vq->drv_priv =3D inst;
>  	dst_vq->buf_struct_size =3D sizeof(struct iris_buffer);
>  	dst_vq->min_reqbufs_allocation =3D MIN_BUFFERS;
> -	dst_vq->dev =3D inst->core->dev;
> +	dst_vq->dev =3D iris_get_cb_dev(inst, BUF_OUTPUT);

[Severity: High]
Does this also assign a manually lifetime-managed, short-lived device to the
long-lived vb2_queue context?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926-vpu_iommu_=
iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com?part=3D6
