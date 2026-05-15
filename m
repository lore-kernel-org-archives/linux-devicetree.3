Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4933A3FF1D5
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 15:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778860785; cv=none; b=knzIXXy3WNfNDfW0Hp23c3KCjurIQhd5FOwN8VAmlooHDBPZBQuoyJms1TxO418CYGKX+WSGNFsyKMVJtS3p+nX7JwRbRJCKDQUWq/OwXogxyDkCVjDnbjj+s23VPGbBnEOBNGbZ107Noo6bBQveifREFcc2v8+q6rbbmgDxL78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778860785; c=relaxed/simple;
	bh=SVWOaHxV2LWmxfFZLGoRIhh+l+7tgRnkwR1xK2jnK54=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VvbAn71CvBwC/MDhJzPTPlrzfjaf3cwCmzOmriThJi1PafVqBxk5EgM5JiFErEBpKEDrCZdCXEMYWnciGEFKuRASdea741ItRnvT3hr0CHnPpWay+ayCpd8c3MV8o7en7jGfW0BMRlFgGzJMnFTXI1y7+ag5Lcrsex+ziCQEmxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bdv2qzLZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bdv2qzLZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4436C2BCB3;
	Fri, 15 May 2026 15:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778860785;
	bh=SVWOaHxV2LWmxfFZLGoRIhh+l+7tgRnkwR1xK2jnK54=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Bdv2qzLZHV5yPGUY+I6hjKOBjMRiIujuZES7RWMYMS4SjefOq18fiKGCAdZeyiDpN
	 b83XDwqzHNvWHub6I2PAQSsgQ0n1oGwuNF4ynEIXUaBbYei2t7zCxr9Msq7DDMcMLE
	 uXiz8c6rCMU/ZUaaeAcOhXGCbGs8PD7suexdbgMjVG1IuzgWzXTyJ9UWfLnZ07oK/l
	 59FZCmUrBwiTXvgac8Fnu3Ptek6AaPF/zppy7/gEVb2heFIfjXrjPBu3RROF4qEA3b
	 Vh836cFUgYqWv8hPdC6s5UfMHmBShlxy/7jZdiBQAeorT9JYIxEjVNxK18vztNcntn
	 jHVOJGCSdQ3PA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 19/28] media: rockchip: rga: change offset to
 dma_addresses
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515-spu-rga3-v6-19-e547152eb9c9@pengutronix.de>
References: <20260515-spu-rga3-v6-19-e547152eb9c9@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 15:59:44 +0000
Message-Id: <20260515155944.E4436C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Uninitialized stack memory in the `dma_addrs` array is written to =
the hardware's DMA-mapped command buffer for formats with fewer than 3 plan=
es.
--

commit 9081b335b1506ccdaa6465a8ae0be247c58c4532
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

media: rockchip: rga: change offset to dma_addresses

This commit renames the offset fields to dma_addrs and changes their type
to dma_addr_t to better reflect that they represent addresses rather than
IOMMU offsets. It updates the buffer preparation and command generation
routines to use these newly named fields.

> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/medi=
a/platform/rockchip/rga/rga-buf.c
> index dcaba66f5c1fc..ab9554c1c4cd9 100644
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> @@ -121,7 +121,7 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
>  	size_t curr_desc =3D 0;
>  	int i;
>  	const struct v4l2_format_info *info;
> -	unsigned int offsets[VIDEO_MAX_PLANES];
> +	dma_addr_t dma_addrs[VIDEO_MAX_PLANES];

[ ... ]

> @@ -145,18 +145,18 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
>  				 "Failed to map video buffer to RGA\n");
>  			return n_desc;
>  		}
> -		offsets[i] =3D curr_desc << PAGE_SHIFT;
> +		dma_addrs[i] =3D curr_desc << PAGE_SHIFT;
>  		curr_desc +=3D n_desc;
>  	}
> =20
>  	/* Fill the remaining planes */
>  	info =3D v4l2_format_info(f->fmt->fourcc);
>  	for (i =3D info->mem_planes; i < info->comp_planes; i++)
> -		offsets[i] =3D get_plane_offset(f, info, i);
> +		dma_addrs[i] =3D dma_addrs[0] + get_plane_offset(f, info, i);
> =20
> -	rbuf->offset.y_off =3D offsets[0];
> -	rbuf->offset.u_off =3D offsets[1];
> -	rbuf->offset.v_off =3D offsets[2];
> +	rbuf->dma_addrs.y_addr =3D dma_addrs[0];
> +	rbuf->dma_addrs.u_addr =3D dma_addrs[1];
> +	rbuf->dma_addrs.v_addr =3D dma_addrs[2];

Does this code leak uninitialized stack memory into the hardware's DMA-mapp=
ed
command buffer?

If info->comp_planes is 1 (such as with RGB formats), the initialization
loops above do not populate dma_addrs[1] and dma_addrs[2]. These array
elements remain uninitialized stack memory.

However, the code unconditionally assigns these elements to
rbuf->dma_addrs.u_addr and v_addr.

Later, rga_cmd_set_src_info() and rga_cmd_set_dst_info() use these values,
apply arithmetic to them, and write the results directly into the device's
DMA command buffer:

	dest[(RGA_SRC_CB_BASE_ADDR - RGA_MODE_BASE_REG) >> 2] =3D
		src_corner_addrs.left_top.u_addr;
	dest[(RGA_SRC_CR_BASE_ADDR - RGA_MODE_BASE_REG) >> 2] =3D
		src_corner_addrs.left_top.v_addr;

Could this leak stack memory to the device or trigger KMSAN warnings on
uninitialized value usage?

While this behavior existed previously with the offsets array, should
dma_addrs be zero-initialized to resolve it?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-spu-rga3-v=
6-0-e547152eb9c9@pengutronix.de?part=3D19
