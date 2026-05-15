Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D900282F1A
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 15:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778860702; cv=none; b=PTxhHjsLS93y7ZzF+ZRofuopzKIxlbbib6LKFCq4pLWYQZC1JrgYhzEei/ru5YTMcRxgGIvHI9jT/bj2pfJUIVtdRA24/3BQ1q+zV6THfE2uuPTZA9CdIaolpma5nDJV1IEfsplrha0gs7YCXJzdXrpQDXzDT5MaZDLOPM2K+mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778860702; c=relaxed/simple;
	bh=HhALSIWeBhJVEoVmQ8KPPFlBOy56uwDT8DUn1J6QhpE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SJ6w9AGSsWW0zdjcAWB45tzb3f6yd7vUmeU28MIW3YD4D5g5b8jXt07jCzJ0sDdjtqMJ14pPya8Z3BWyS1xwdhaURG+V8R+PLkF8CL1442wH82Z2uQ61oxz0+j2IWdkGEaxWGSRhA+oHAv5JGg+cNnrVQ7GJ6MAp/miTQdVNVvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MKdWt3Fb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MKdWt3Fb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D7A8C2BCB0;
	Fri, 15 May 2026 15:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778860701;
	bh=HhALSIWeBhJVEoVmQ8KPPFlBOy56uwDT8DUn1J6QhpE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=MKdWt3FbQKMwgV9BFRqenbujE5lNTUl6YXkelZkhtbSbbhUSFPnNmwkuP/q70vFHQ
	 JTe7JTu5VMZl8qJEDQkuEx/l0F5o4vH1+2KryWeAdwpL+eDIMhXjExiaH2qX569ZZn
	 XI63bpAsbooTFlf7fuu/K6H38j9S2u2KNirdJlBxXzyo+9uZaqAK5aXi5NjvwUReiz
	 QFFSfjg5c6IMsoMoEoYgwOWm9r+LIMK4FeyNJDT0IpPu8WyRbDpWmEwzfVeb0b2+T3
	 s7U9gc2GFp/ekwLA2PXAnWSsqFFJgKiakQG+QeaQB/wY1kNHoldaUQenwHbPPDssfl
	 MaAhn4yawvidg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 05/28] media: v4l2-common: add
 v4l2_fill_pixfmt_mp_aligned helper
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260515-spu-rga3-v6-5-e547152eb9c9@pengutronix.de>
References: <20260515-spu-rga3-v6-5-e547152eb9c9@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 15:58:20 +0000
Message-Id: <20260515155821.6D7A8C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The `sizeimage` calculation under-allocates memory for single-memo=
ry-plane formats where the chroma stride is larger than the luma stride (e.=
g., NV24, NV42), leading to a heap buffer overflow.
- [Medium] The `stride_alignment` parameter is typed as `u8`, which silentl=
y truncates common required alignments like 256 to 0, leading to a 0-byte a=
llocation.
- [Low] The `ALIGN()` macro is invoked with a dynamically computed alignmen=
t value that is not structurally guaranteed to be a power of two.
--

commit 6b1d997c6e03c0072f6d0dc32b4cc844d7fbf8fe
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

media: v4l2-common: add v4l2_fill_pixfmt_mp_aligned helper

This commit introduces a helper to allow specifying a custom stride
alignment in bytes. This supports hardware requiring specific memory
boundaries.

> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 3cc8b04e1ea63..a03e48812bcf5 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -432,14 +432,28 @@ static inline unsigned int v4l2_format_block_height=
(const struct v4l2_format_inf
>  }
> =20
>  static inline unsigned int v4l2_format_plane_stride(const struct v4l2_fo=
rmat_info *info, int plane,
> -						    unsigned int width)
> +						    unsigned int width, unsigned int byte_alignment)
>  {
>  	unsigned int hdiv =3D plane ? info->hdiv : 1;
>  	unsigned int aligned_width =3D
>  		ALIGN(width, v4l2_format_block_width(info, plane));
> =20
> -	return DIV_ROUND_UP(aligned_width, hdiv) *
> -	       info->bpp[plane] / info->bpp_div[plane];
> +	/*
> +	 * Formats with a single memory plane derive the stride of the
> +	 * other planes from the y stride. Due to chroma subsampling this
> +	 * may cause the other plane strides to break the byte_alignment.
> +	 * Increase the alignment if necessary to prevent this.
> +	 *
> +	 * It assumes the following format properties:
> +	 * - bpp_div[0] =3D=3D bpp_div[1]
> +	 * - The multiplication factor doesn't differ between the non y planes
> +	 */
> +	if (info->mem_planes =3D=3D 1 && info->comp_planes > 1 && plane =3D=3D =
0)
> +		byte_alignment *=3D DIV_ROUND_UP(info->hdiv * info->bpp[0], info->bpp[=
1]);
> +
> +	return ALIGN(DIV_ROUND_UP(aligned_width, hdiv) * info->bpp[plane] /
> +			     info->bpp_div[plane],
> +		     byte_alignment);
>  }

Could this calculation under-allocate the sizeimage for single-memory-plane
formats where the chroma stride is larger than the luma stride, such as
nv24 or nv42?

For nv24, the hdiv is 1, bpp[0] is 1, and bpp[1] is 2. DIV_ROUND_UP(1, 2)
evaluates to 1, which leaves the luma plane's byte_alignment unchanged.

If we have a width of 1 and a stride_alignment of 16, the software
calculates the luma stride as ALIGN(1, 16) which is 16. The hardware
mathematically derives the chroma stride from the luma stride: 16 * 2 =3D 3=
2.

However, v4l2_format_plane_size() independently calculates the chroma plane
stride for sizeimage as ALIGN(1 * 2, 16) which is 16. Since the
independently calculated chroma stride (16) is smaller than the hardware's
derived chroma stride (32), does this mean the overall allocated sizeimage
will be too small and cause an out-of-bounds write during hardware
streaming?

Also related to this calculation, the ALIGN() macro requires the alignment
parameter to be a strict power of two. While the multiplication factor
evaluates to a power of two for currently supported planar formats, is there
a risk that future or custom formats might result in a non-power-of-two
factor?

If so, this would silently violate the macro's requirements. Would it be
safer to use roundup() or add a WARN_ON_ONCE(!is_power_of_2(byte_alignment))
to ensure the assumption holds?

[ ... ]

> @@ -476,8 +491,9 @@ void v4l2_apply_frmsize_constraints(u32 *width, u32 *=
height,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_apply_frmsize_constraints);
> =20
> -int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
> -			u32 pixelformat, u32 width, u32 height)
> +int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
> +				u32 pixelformat, u32 width, u32 height,
> +				u8 stride_alignment)

Can typing stride_alignment as a u8 cause issues for larger alignment
requirements?

If a driver needs an alignment of 256 bytes (which is common for some
modern hardware) and passes 256, the u8 type will silently truncate the
value to 0.

Passing 0 to the ALIGN() macro evaluates to (x - 1) & 0, which reliably
returns 0. Will this silently set bytesperline and sizeimage to 0, causing
a 0-byte memory allocation?

Would it be better to type this parameter as a u32?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-spu-rga3-v=
6-0-e547152eb9c9@pengutronix.de?part=3D5
