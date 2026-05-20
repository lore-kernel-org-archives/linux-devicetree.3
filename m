Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554253CBE6B
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 23:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779320597; cv=none; b=ovbP+KgF0JV34qGrN+5vJNmo+9POWbV5dIWCJA2uRdBfpT+E2K2vG4pGIrRWMdtnNM9UFWsSvwY0Z+V7pHdIv6ohiv0ougIOYbuQqE5U2jEe0BNDYzO688RgRT8yYXbFqqxc4rjEA3OsFQSUAfBIj8z3zaNnm/cZ75Nyf+FFgVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779320597; c=relaxed/simple;
	bh=ecD8vYC/JmsD2rJ/qICGW4vmvMNLJvHvpveFDLaUkVQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z4XMhLaC6KsoUW+KoSEY3EYNhnRx6L3kJQc9J+OMNykWo6xkg2+f3rMYkAiFT0nYfatl/282oACg7Dcy8jpbv9l114tFdm+VCJImgit4HTeTnRPbkJfxwd++1n8y6p6Y8gK/ttIVhtSS4vAO69OGcVycbCZ1I0DrJ2SV2hu6p84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dUfmJUmO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dUfmJUmO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5FE81F00A39;
	Wed, 20 May 2026 23:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779320595;
	bh=vcwqITOGdv/zb1umYn+dUTFzYdxjafHeRjesZkjsSMo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dUfmJUmOvqe6YtzTEGMb1Thinm/a8LSvuNlUOuo3rooldIrlh+5Fs3KtZ6zBL3emb
	 lHXpchagcCc9MuUvs10dwhlgm1HeBmnzH2GnipwSzN0Su6KvEMF1oWgJ2zOsq949J8
	 4QUaDuUTepsPfLRgg2nDbvIIZ+dhDB9QJ3ItPGeCPUqvRep0ZRnRdrN6/cgBBx0yCs
	 8AAcbBH9gDlPD+UxMBsMGxrskj8x1mz8n7JGKG0Zd05u1QluDcwxAXo9XfPoxQlXIB
	 TJ/Cjs0M2+KjE1QBvGP2R1+NbHPsFxB3mbEFcDua8dkruF4f/KY5WwgnVQ/EPs/Du1
	 Y/4uPQacw2Wzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 20/28] media: rockchip: rga: support external iommus
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260521-spu-rga3-v7-20-3f33e8c7145f@pengutronix.de>
References: <20260521-spu-rga3-v7-20-3f33e8c7145f@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 23:43:15 +0000
Message-Id: <20260520234315.A5FE81F00A39@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] An off-by-one error in `fill_descriptors()` causes a heap out-of-b=
ounds write when the number of scatterlist pages exceeds the allocated desc=
riptor array capacity.
--

commit 2e365bb7afaa0f34bfb42a3262b5eb4f962bcac6
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

media: rockchip: rga: support external iommus
   =20
In preparation for the RGA3 add support for external iommus. This is a
transition step to just disable the RGA2 specific mmu table setup code.
Currently a simple rga_hw struct field is used to set the internal iommu.

> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/medi=
a/platform/rockchip/rga/rga-buf.c
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
[ ... ]
> @@ -136,17 +140,21 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
>  	for (i =3D 0; i < vb->num_planes; i++) {
>  		vb2_set_plane_payload(vb, i, f->pix.plane_fmt[i].sizeimage);
> =20
> -		/* Create local MMU table for RGA */
> -		n_desc =3D fill_descriptors(&rbuf->dma_desc[curr_desc],
> -					  rbuf->n_desc - curr_desc,
> -					  vb2_dma_sg_plane_desc(vb, i));
> -		if (n_desc < 0) {
> -			v4l2_err(&ctx->rga->v4l2_dev,
> -				 "Failed to map video buffer to RGA\n");
> -			return n_desc;
> +		if (rga_has_internal_iommu(ctx->rga)) {
> +			/* Create local MMU table for RGA */
> +			n_desc =3D fill_descriptors(&rbuf->dma_desc[curr_desc],
> +						  rbuf->n_desc - curr_desc,
> +						  vb2_dma_sg_plane_desc(vb, i));

[Severity: High]
This is a pre-existing issue, but does fill_descriptors() contain an
off-by-one error that can lead to a heap out-of-bounds write?

Looking at fill_descriptors() in drivers/media/platform/rockchip/rga/rga-bu=
f.c:

static ssize_t fill_descriptors(struct rga_dma_desc *desc, size_t max_desc,
                struct sg_table *sgt)
{
    ...
    for_each_sgtable_dma_page(sgt, &iter, 0) {
        if (n_desc > max_desc)
            return -EINVAL;
        addr =3D sg_page_iter_dma_address(&iter);
        tmp->addr =3D lower_32_bits(addr);
        tmp++;
        n_desc++;
    }
    ...
}

When n_desc equals max_desc, the bounds check (n_desc > max_desc) evaluates
to false. This allows the code to write to tmp->addr, which is one element
past the end of the allocated descriptor array.

Since V4L2 allows userspace to queue oversized buffers, a scatterlist might
contain more pages than the calculated descriptor capacity. If the oversized
buffer has exactly max_desc + 1 pages, fill_descriptors() could silently wr=
ite
out of bounds and potentially corrupt adjacent kernel memory.

> +			if (n_desc < 0) {
> +				v4l2_err(&ctx->rga->v4l2_dev,
> +					 "Failed to map video buffer to RGA\n");
> +				return n_desc;
> +			}
> +			dma_addrs[i] =3D curr_desc << PAGE_SHIFT;
> +			curr_desc +=3D n_desc;
> +		} else {
> +			dma_addrs[i] =3D vb2_dma_contig_plane_dma_addr(vb, i);
>  		}
> -		dma_addrs[i] =3D curr_desc << PAGE_SHIFT;
> -		curr_desc +=3D n_desc;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-spu-rga3-v=
7-0-3f33e8c7145f@pengutronix.de?part=3D20
