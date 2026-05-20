Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543D83C3438
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 23:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779320145; cv=none; b=t8y7SDzQ236bvyz95o2ZBpFFgBOMa0Ig3elb7DryGA2WzUAx047KS+tP8NujxaWjv7gdU+lWiy5wdO6fl2HSnnmCFiHmfu9CUAf79UKYlXBQ3rJFlAQIHu8G0ZPX5wXTH188pZb6PlHtLD3Z5iaJm7QJcVH0V5wxWf5gP946Fns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779320145; c=relaxed/simple;
	bh=cDGYBtXw5qCkK14bNHttOnhT910i8KZYpPj7vo7l4kA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mqG2CURZuEOTIGuilJx2rsNnp7LlG2sdqqr7kXb8BZAI9YqKMrlX4Nep/Oe5kIrDAmo9hU68S02EXKm4wB7uRvzjRpoYjDxwzbHfF5500V/RaPhI7Bbt3cO7wqc73Iq7zXvbhnAOLY3sF6MfmPVUNiNtEzZulFQXvSCgy/Af/X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TxtRHJ2S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TxtRHJ2S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FE9C1F000E9;
	Wed, 20 May 2026 23:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779320144;
	bh=G/pyzH//ALpKLFL0zvi6QT6pRiGTqNKqvdXVZrfEQkg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TxtRHJ2SZ7JepZAbCRtjOrG2abY0X00ctS9wFlyZ1ndZQfV08Seazgo5vsqf15hPW
	 TjLxwM71R4fx/qDMUsQ0y+XloRy/bwpTSpZPmYBcZ6K9JZlsl9LA689zialDVEXtfE
	 cwQH/zShAKa1j3wmZWwVRBhnN3wBCIWi0biwFnffzHmDGNxtKFC5gvi3urjGUVy1E5
	 OULM9adER9oVYSec4dImYXG03IWKIeo8ph+DMtCiBotCYbbH1NHS3DB6UQ9Fdc8DLo
	 0CZ+8YFtUthy0s3SC/P8zIhGNQqj+i1uys1BX4ul5WExvsjjLcfDBgfieS6X/ldevx
	 GQ8kSGCcr+FaA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 22/28] media: rockchip: rga: remove size from
 rga_frame
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260521-spu-rga3-v7-22-3f33e8c7145f@pengutronix.de>
References: <20260521-spu-rga3-v7-22-3f33e8c7145f@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 23:35:43 +0000
Message-Id: <20260520233543.8FE9C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] An off-by-one error in `fill_descriptors()` combined with memo=
ry under-allocation in `rga_buf_init()` causes an exploitable heap buffer o=
verflow.
- [High] Plane DMA base addresses ignore the scatterlist intra-page offset,=
 leading to incorrect hardware memory access for USERPTR and DMABUF buffers.
- [High] Missing early exits after `WARN_ON()` checks in `rga_isr()` lead t=
o NULL pointer dereferences.
--

commit d8c810d4339b024a035832f04cb10cad2828d5e3
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

media: rockchip: rga: remove size from rga_frame

This commit removes the size member from the rga_frame structure, as it is
only used for the MMU page table mapping. Instead, the driver now calculates
the size in place when needed, which also avoids the calculation entirely
when an external IOMMU is used.

> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/medi=
a/platform/rockchip/rga/rga-buf.c
> index cd6904d5fe5a6..092c2bdf6b672 100644
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> @@ -79,6 +79,8 @@ static int rga_buf_init(struct vb2_buffer *vb)
>  	struct rockchip_rga *rga =3D ctx->rga;
>  	struct rga_frame *f =3D rga_get_frame(ctx, vb->vb2_queue->type);
>  	size_t n_desc =3D 0;
> +	u32 size =3D 0;
> +	u8 i;
> =20
>  	if (IS_ERR(f))
>  		return PTR_ERR(f);
> @@ -86,7 +88,9 @@ static int rga_buf_init(struct vb2_buffer *vb)
>  	if (!rga_has_internal_iommu(rga))
>  		return 0;
> =20
> -	n_desc =3D DIV_ROUND_UP(f->size, PAGE_SIZE);
> +	for (i =3D 0; i < f->pix.num_planes; i++)
> +		size +=3D f->pix.plane_fmt[i].sizeimage;
> +	n_desc =3D DIV_ROUND_UP(size, PAGE_SIZE);

[Severity: Critical]
This is a pre-existing issue, but can this memory allocation logic trigger a
heap buffer overflow when combined with fill_descriptors()?

Because multi-planar buffers have independent page alignments per plane,
the actual number of pages mapped in the SG tables can exceed the
calculation here: sum(DIV_ROUND_UP(size[i])) >=3D DIV_ROUND_UP(sum(size[i])=
).

Looking at fill_descriptors(), it checks if (n_desc > max_desc) return
-EINVAL. Since it uses > instead of >=3D, it permits exactly one out-of-bou=
nds
write and then returns success.

In rga_buf_prepare(), if the first plane overflows by 1 page due to
under-allocation, fill_descriptors() silently corrupts the heap and returns
success. Then curr_desc increments past rbuf->n_desc.

For the next plane, max_desc is calculated as rbuf->n_desc - curr_desc,
which underflows to SIZE_MAX. Subsequent planes are then passed to
fill_descriptors() with max_desc =3D SIZE_MAX, completely disabling bounds
checks and allowing arbitrary-length out-of-bounds writes on the kernel
heap.

Could we update the allocation to calculate the number of descriptors per
plane, and fix the off-by-one error in fill_descriptors()?

> =20
>  	rbuf->n_desc =3D n_desc;
>  	rbuf->dma_desc =3D dma_alloc_coherent(rga->dev,

While reviewing this, I also noticed a couple of other pre-existing issues
in the surrounding code:

[Severity: High]
This is a pre-existing issue, but does this calculation ignore the
scatterlist intra-page offset?

drivers/media/platform/rockchip/rga/rga-buf.c:rga_buf_prepare() {
[ ... ]
		if (rga_has_internal_iommu(ctx->rga)) {
			/* Create local MMU table for RGA */
			n_desc =3D fill_descriptors(&rbuf->dma_desc[curr_desc],
						  rbuf->n_desc - curr_desc,
						  vb2_dma_sg_plane_desc(vb, i));
			if (n_desc < 0) {
				v4l2_err(&ctx->rga->v4l2_dev,
					 "Failed to map video buffer to RGA\n");
				return n_desc;
			}
			dma_addrs[i] =3D curr_desc << PAGE_SHIFT;
			curr_desc +=3D n_desc;
[ ... ]
}

When creating the local MMU table, the virtual base address for each plane
is calculated strictly as curr_desc << PAGE_SHIFT.

Buffers imported via USERPTR or DMABUF are not guaranteed to be page-aligned
and may have a non-zero intra-page offset (sgt->sgl->offset). By not adding
this offset to the DMA base address, does this instruct the hardware to sta=
rt
reading/writing at the beginning of the mapped physical page rather than at
the actual start of the data?


[Severity: High]
This is a pre-existing issue, but could these missing early exits after
WARN_ON() checks lead to NULL pointer dereferences?

drivers/media/platform/rockchip/rga/rga.c:rga_isr() {
[ ... ]
		WARN_ON(!ctx);

		rga->curr =3D NULL;

		src =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
		dst =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);

		WARN_ON(!src);
		WARN_ON(!dst);

		v4l2_m2m_buf_copy_metadata(src, dst);
[ ... ]
}

If a spurious interrupt or a shared interrupt mismatch causes ctx to be NUL=
L,
the WARN_ON() fires, but the code immediately proceeds to call
v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx), which forcefully dereferences the
NULL pointer.

Similarly, it checks WARN_ON(!src) and WARN_ON(!dst) but still
unconditionally attempts to access them via
v4l2_m2m_buf_copy_metadata(src, dst) immediately afterward.

Should we return or skip the rest of the handler if any of these are NULL?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-spu-rga3-v=
7-0-3f33e8c7145f@pengutronix.de?part=3D22
