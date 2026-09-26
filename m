Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99862D0602
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 13:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790429606; cv=none; b=MxJQewgXxTI/eGEd/Xpz6kVKm+uAJIUdsQ+x/YOZwIvjNCBVlq3BEHduuC8Mqn7rXIrjaCiI0c8+1PsG+XLXITMax83jhQ9rPchOh/Ou/JQp/8iHz/RDPNEYWMImVierSZuSQ65g5NFK3Mb9E6N+LFk4vwfAaxQGsEFznqeKUS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790429606; c=relaxed/simple;
	bh=FqNXG9I9xaVKC4d+Zyl+88wWmMepI5z5OdA0JslkF6M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dbqr7t1vL78k0F3WEPn8LzubXFRq7/lxpCtaPPFkP62JvLq2BOU5+GOlVc8nnGnYDSoz3/mCXeN7UwjJ5BDPRkCZ6kh32u1YK0WeDy0jCctYLq/rhiSHn3Kpg8EZtLwp+iEySp5Rr6fcF8ETme31hOLFTWwP4cYOpJ1qxQPQ7wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Krrr3sgs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Krrr3sgs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19A5C1F000FF;
	Sat, 26 Sep 2026 13:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790429604;
	bh=fbZSh3H9RFljZqQzkpVM/BNyRb7VnMscz1GRRDFoFqg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Krrr3sgsnLhudh31j90zS4MM9pjUryA65L9UDHzecUZDSKvJoqVRPafj9F4TWnmDJ
	 87ytbxHtTJCrHre9Tc+VONGHtXAg3FHha0aXSSe+dHifXTIyKZQtAYQ625zXZL9h7P
	 VWrehTqgzTg9U76O6GHLa/6oZYdoXnj2jil1JJaAlFVS4FM8g/oNQDOJWH28tn4t+I
	 siQdwKFVHpZBj/br983rMAhFVC+jfz2NdZfjqsnFd5XWf9olv1cUCU/8XLwXjJ+okm
	 BvdyXrnUXwXD/qn9QLuI7RzsjEKLrWkOiKs2LN87SL/Zu4esg8Ps7GhigGtsXiQCDh
	 dETJ4Fe/Vw4Qw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/17] media: apple: avd: add vp9 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sofus Forstreuter" <sofus.c@icloud.com>
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org
In-Reply-To: <20260926-avd-v2-8-ecebe6a3648e@icloud.com>
References: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
 <20260926-avd-v2-8-ecebe6a3648e@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 13:33:23 +0000
Message-Id: <20260926133324.19A5C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] media: apple: avd: integer underflow in set_tiles() leads to o=
ut-of-bounds DMA read
--

commit dea68a18dd2979fd1f45ba84519d873291b90e56
Author: Sofus Forstreuter <sofus.c@icloud.com>

media: apple: avd: add vp9 support

This commit introduces hardware VP9 decoding support for the Apple Video
Decoder (AVD). It achieves a fluster score of 216/305 for VP9-TEST-VECTORS.

> diff --git a/drivers/media/platform/apple/avd/avd-vp9.c b/drivers/media/p=
latform/apple/avd/avd-vp9.c
> new file mode 100644
> index 0000000000000..f7c0ee6b70129
> --- /dev/null
> +++ b/drivers/media/platform/apple/avd/avd-vp9.c

[ ... ]

> +static int set_tiles(struct avd_ctx *ctx, struct avd_vp9_run *run)
> +{
> +	const struct v4l2_ctrl_vp9_frame *frame =3D run->decode_params;
> +	struct vb2_v4l2_buffer *src =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	const u8 *data =3D vb2_plane_vaddr(&src->vb2_buf, 0);
> +	unsigned long plane_payload =3D vb2_get_plane_payload(&src->vb2_buf, 0);
> +	u32 offset =3D
> +		frame->uncompressed_header_size + frame->compressed_header_size;
> +	u32 num_tile_rows =3D 1 << frame->tile_rows_log2;
> +	u32 num_tile_cols =3D 1 << frame->tile_cols_log2;
> +	u32 tile_size, size;
> +	dma_addr_t coded_in;
> +
> +	if (plane_payload < offset)
> +		return -EINVAL;
> +	size =3D plane_payload - offset;
> +
> +	/* 6.2.6 Compute image size syntax */
> +	u32 sb_64_cols =3D (((frame->frame_width_minus_1 + 8) >> 3) + 7) >> 3;
> +	u32 sb_64_rows =3D (((frame->frame_height_minus_1 + 8) >> 3) + 7) >> 3;
> +
> +	for (int row =3D 0; row < num_tile_rows; row++)
> +		for (int col =3D 0; col < num_tile_cols; col++) {
> +			if (row =3D=3D num_tile_rows - 1 &&
> +			    col =3D=3D num_tile_cols - 1) {
> +				tile_size =3D size;

[Severity: Critical]
Could an underflowed size be assigned to tile_size here?

If size underflowed in a previous iteration, this assignment could result i=
n a
massive out-of-bounds DMA read by the VPU when tile_size is pushed to the
hardware command buffer.

> +			} else {
> +				if (offset > plane_payload)
> +					return -EINVAL;
> +				tile_size =3D get_unaligned_be32(&data[offset]);
> +				if (tile_size > size - 4)

[Severity: Critical]
Does this code underflow size if the remaining payload is less than 4 bytes?

If a userspace caller provides a VP9 frame payload where plane_payload has
only 1 to 3 bytes remaining after offset, the offset > plane_payload check
evaluates to false. This allows get_unaligned_be32() to read out of bounds.
The unsigned arithmetic size - 4 would then underflow to a large value, cau=
sing
the size validation to incorrectly pass and permanently underflowing size f=
or
subsequent tile loops.

> +					return -EINVAL;
> +				offset +=3D 4;
> +				size -=3D 4;
> +			}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926-avd-v2-0-e=
cebe6a3648e@icloud.com?part=3D8
