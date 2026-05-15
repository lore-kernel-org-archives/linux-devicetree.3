Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F54B3016E0
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 16:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778862085; cv=none; b=GmHYhLKjNA26uR7VaLf6q7epFjljlGaCEksiwws8bEIg5IbZ9c25AhurI5jXzVIpIhUn5qWq7KHX7DwB50iiS1fSMt7zJTb36mQ5jC9iwzd5pZ7d+rzNnOf8hTmmoixX5ZfRCq2McAO3uYWTrD9tEEGNuHscuBWNjcpUCoRolOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778862085; c=relaxed/simple;
	bh=JjgsDekkL+D9fwihm7kueG7CdfJGyCHjocP9PVoEY3k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h3S9R6gArFLi9M4MCyA8ukhDWvGT3Uh3jacAyFGU0E7sS3F9Kk1nAFjAy8dBokxBCwA63heAHUEYgEpMoyeMhwI10/NMcK4/y8gLpNMm2RV1XxpWUvT3n1+4akrdlzCv0lIJPmN4ARJYQmbChWECHzVz2TYNvSG1K5SqZD+0kxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ts0DHC4A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ts0DHC4A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B36E8C2BCB0;
	Fri, 15 May 2026 16:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778862085;
	bh=JjgsDekkL+D9fwihm7kueG7CdfJGyCHjocP9PVoEY3k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ts0DHC4AShYdxhXMwHdTQCZkGaOhCieO2dqXSxXLa94hzvOv2Tx9jWD/rNOcDODVl
	 7jrB2G0Q8421cBO2X4CJ1vvkHRg/8zmF3xA52BXNIy5HJAElj6iopVR13I03MiWD28
	 zstzpH1X5qRptbhboMpzxfkzQdaQAmm2DcAJa48kgotJ805nfNC9WeOh6RlHTzMSKs
	 YSgm2wMxfeUVOj+Wed5peFlA1xr9cH7FDxNm5tKnOKt1SnheLqpS7vp/DStCoWp2n7
	 sfFmvkCt25lQlNHfA8dVxvBC87z782x5fnv2qOTUbTfJljeydeBVVz0DG9l5YGu6Q1
	 X/LMfe4IjVvQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 22/28] media: rockchip: rga: remove size from
 rga_frame
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260515-spu-rga3-v6-22-e547152eb9c9@pengutronix.de>
References: <20260515-spu-rga3-v6-22-e547152eb9c9@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 16:21:24 +0000
Message-Id: <20260515162124.B36E8C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Heap buffer overflow in DMA descriptor array due to incorrect =
size calculation and off-by-one bounds check
--

commit 80a8417d4cdd0685a8b6425bf5882684584c9ac7
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

media: rockchip: rga: remove size from rga_frame

This commit removes the size member from the rga_frame structure, as it
is only used for MMU page table mapping. Instead, the size is calculated
in-place within rga_buf_init() by iterating over the planes.

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

Does this calculation under-allocate the descriptor array if userspace uses
VIDIOC_CREATE_BUFS to request buffers larger than sizeimage?

While this behavior wasn't introduced by this patch, inlining the
calculation here preserves an existing regression in the buffer allocation
logic.

Since vb2 can provision larger scatterlists than the format's sizeimage,
rbuf->n_desc might be smaller than the actual buffer length.

If fill_descriptors() uses a check like "if (n_desc > max_desc)", could a
plane sized to exactly rbuf->n_desc + 1 pages bypass the check and write
one entry out of bounds?

When the second plane is mapped, could max_desc (which would be
rbuf->n_desc - curr_desc) underflow? This might bypass remaining bounds
checks and allow the scatterlist of the second plane to sequentially
overwrite adjacent kernel heap memory.

> =20
>  	rbuf->n_desc =3D n_desc;
>  	rbuf->dma_desc =3D dma_alloc_coherent(rga->dev,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-spu-rga3-v=
6-0-e547152eb9c9@pengutronix.de?part=3D22
