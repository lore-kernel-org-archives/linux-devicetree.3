Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3757384CC8
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 14:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784125771; cv=none; b=KO5O7LicUxXYEXf0MJbVzAHefv/OEPngnZsMKJQvZGG6/J+xwVJXRQC31STzIBgWWfGeZUzvsrG8bLvvQ+rYNyCx/5+C5yy03d6gFaMVu1GZXZKiIRgM3x10/HeH49JE5fFR35KQa69a0fUBOl94KOZxB/QzKq/hA2uwYOWmnr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784125771; c=relaxed/simple;
	bh=ScbIOVEUnT3zehrLYFdeTzj7gPYvUax8I8Qq1w8H4b8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K/5WXNTUPW43TYmlyHFFuhtvxXxSfxFFbpqi1+MX2tLmm08BwXLPN0PcXN0GdDmYopu0/6UVn7Xnf7ORup/y38OH80fgk9RDVBoBVU8v76OVtt1ieIfg/g3QUkSBm6AAT+hyVbs9AIYjV2t8klGJTEj6DTNFQo8hVE2eu7ul+bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G2nEikEl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G2nEikEl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E59D1F000E9;
	Wed, 15 Jul 2026 14:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784125769;
	bh=CrZM1NAmc6btMb5eriTuJ096vYkU1ZlIHWopfY91/A8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G2nEikElsviHzKJlWvX8ANcRD+mej5fCiJ/eciH8DFH6JfvlOW/oHnC9TTcGs9Oxu
	 i1IsHofcxrBEqrONfUtRVkrKTGn+com9LbHsU51UYCaCSYWUA41wkPIfZCV8/5eNot
	 i2rju9WFUVh1mQmNwA/h4SDsZm/srsKFzgAY/OezR1XG7csqdgDFbj9ONnco4gOYce
	 fMLE/7+0U3SDe1WOUnngCKbJzynODYRtqaR0V/rOEYuioLxovg29zJ+b3B8PNVf9QD
	 XRK3HrjhfL5JPW/PmY7rUwZ3cz9fFgxSXQgDEMu/2dnjvNFzsCUo1B1YUe/xUjFjZm
	 jE0XuY1gdxflw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 04/14] media: iris: Add helper to select relevant
 context bank device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260715-glymur-v9-4-8cf2cbe12a07@oss.qualcomm.com>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <20260715-glymur-v9-4-8cf2cbe12a07@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 14:29:28 +0000
Message-Id: <20260715142929.1E59D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Using dynamically created context bank devices without taking a re=
ference via get_device() creates a Use-After-Free risk when file descriptor=
s outlive device unbind.

Pre-existing issues:
- [High] The `struct iris_core` is allocated via devres but is accessed in =
V4L2 deferred release paths, causing a Use-After-Free if a file descriptor =
is closed after driver unbind.
--

--- Patch [4]: [PATCH v9 04/14] media: iris: Add helper to select relevant =
context bank device ---
commit ff67c19893e13d3ddb40ea541f363dbf54e13228
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

media: iris: Add helper to select relevant context bank device

This commit introduces a helper to associate the appropriate context bank=20
device with different buffer types. It updates the internal buffer allocati=
on=20
and queue initialization to use this dynamically selected device instead of=
=20
always defaulting to the main core device.

> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/med=
ia/platform/qcom/iris/iris_buffer.c
> index 246ad0abbac35..249c9f1d0d5da 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -545,7 +545,7 @@ static int iris_create_internal_buffer(struct iris_in=
st *inst,
>  	buffer->buffer_size =3D buffers->size;
>  	buffer->dma_attrs =3D DMA_ATTR_WRITE_COMBINE | DMA_ATTR_NO_KERNEL_MAPPI=
NG;
> =20
> -	buffer->kvaddr =3D dma_alloc_attrs(core->dev, buffer->buffer_size,
> +	buffer->kvaddr =3D dma_alloc_attrs(dev, buffer->buffer_size,
>  					 &buffer->device_addr, GFP_KERNEL, buffer->dma_attrs);

[Severity: High]
Could this lead to a Use-After-Free of the context bank device?

When a userspace application opens the video device file descriptor,
iris_create_internal_buffer() allocates internal buffers using the context
bank device. If the driver is subsequently unbound (e.g., via sysfs) and the
context bank devices are unregistered and freed, the application could later
close the file descriptor.

Should a reference be taken on the context bank device pointer via
get_device() to ensure it outlives deferred file operations cleanup?

>  	if (!buffer->kvaddr) {
>  		kfree(buffer);

[ ... ]

> @@ -682,10 +682,10 @@ int iris_queue_internal_buffers(struct iris_inst *i=
nst, u32 plane)
> =20
>  int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buf=
fer *buffer)
>  {
> -	struct iris_core *core =3D inst->core;
> +	struct device *dev =3D iris_get_cb_dev(inst, buffer->type);

[Severity: High]
This is a pre-existing issue, but is it possible for inst->core to be freed
before this deferred cleanup is called?

In drivers/media/platform/qcom/iris/iris_probe.c, the core structure is
allocated via devm_kzalloc(). If the driver is unbound while a file
descriptor is open, devres will free the iris_core structure. When the file
descriptor is later closed, deferred release paths (such as
iris_check_num_queued_internal_buffers() in iris_vidc.c, or here calling
iris_get_cb_dev()) will dereference inst->core, resulting in a Use-After-Fr=
ee.

> =20
>  	list_del(&buffer->list);
> -	dma_free_attrs(core->dev, buffer->buffer_size, buffer->kvaddr,
> +	dma_free_attrs(dev, buffer->buffer_size, buffer->kvaddr,
>  		       buffer->device_addr, buffer->dma_attrs);

[Severity: High]
If the context bank device was freed during driver unbind, will passing the
unpinned device pointer to dma_free_attrs() during deferred fops release
cause a Use-After-Free?

>  	kfree(buffer);
> =20

> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media=
/platform/qcom/iris/iris_vidc.c
> index 14d63dc76c9ba..26df872fb4fa1 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -107,7 +107,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src=
_vq, struct vb2_queue *dst_
>  	src_vq->drv_priv =3D inst;
>  	src_vq->buf_struct_size =3D sizeof(struct iris_buffer);
>  	src_vq->min_reqbufs_allocation =3D MIN_BUFFERS;
> -	src_vq->dev =3D inst->core->dev;
> +	src_vq->dev =3D iris_get_cb_dev(inst, BUF_INPUT);
>  	src_vq->lock =3D &inst->ctx_q_lock;
>  	ret =3D vb2_queue_init(src_vq);
>  	if (ret)
> @@ -121,7 +121,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src=
_vq, struct vb2_queue *dst_
>  	dst_vq->drv_priv =3D inst;
>  	dst_vq->buf_struct_size =3D sizeof(struct iris_buffer);
>  	dst_vq->min_reqbufs_allocation =3D MIN_BUFFERS;
> -	dst_vq->dev =3D inst->core->dev;
> +	dst_vq->dev =3D iris_get_cb_dev(inst, BUF_OUTPUT);
>  	dst_vq->lock =3D &inst->ctx_q_lock;

[Severity: High]
Does assigning the dynamically created context bank device to the vb2_queue
without taking a reference create a Use-After-Free risk?

If the driver unbinds and the device is freed, the vb2_queue could still be
accessed during deferred cleanup when the file descriptor is finally closed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-glymur-v9-=
0-8cf2cbe12a07@oss.qualcomm.com?part=3D4
