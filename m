Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104369;
	b=5TyJGjeAjdJ13DUCQ5KuYGRdxrr24lxxqC22gA1SpuaTYovEhSBPFvo13BVLKTApKWdH
	 lPhEZBbSVYteOILvtzRN4/TkZOFJoPOHJXDGyp+lnyq1jRROm6xlHEMiG0uoPY7QhTJpY
	 wc39KFGJDs0r2HEf5JbYxQsN7qvAICyhJYd4SNToddSJTNte83uQfo8NeBD0GKGlyNULE
	 wJn03nU33E2PHaUFmI/J3PHreXAfccaDqL3OAWr6PX/ATG1CXo49TMpod0s9Osot5GaBF
	 Sm+WDxAPSaQzsN0yRUoFq1vM+wva8yYogCvKcB3f8QJ5C87zp0laxojGVfOotCaSpSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104369;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7DiDS2DOpIs50Zi0EYLX07NubC/YlMSgVIkCDhfCfGw=;
	b=t1OLO3C0XgrWD/arhd4J2uG90egnS/LKv7x3L2xwvKBGh9pB7qqjQVKiHjMBwClmCoXT
	 NbFZRYVLNJdywz1AmetbdvkKBlHkVR3Ih6ZE2q5Jbcav7DcdcNfBknEEEal457bwbCocz
	 a5OCG0LMM6Hx9Lif70DNKGOY5YuU//DCU4dA4u0LCAKTM5tXXYoRhRZCOi6MtL/aQ6nz9
	 FmkpDOguKhX8004KZKHowaKBiHqe20Scj8p2igE4PG/MkVZjs5eQPCSU+hAfrTJWd9Wm4
	 JGh5pSxazyEs1ImeBAijV+6GVvuifsrG2MCt30P52CeFw0/k7yGCKqPktQTepZ/oRJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZK3ykMum;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789A3606A338
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZK3ykMum
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D56A01F000C4;
	Thu, 19 Nov 2026 16:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795104369;
	bh=7DiDS2DOpIs50Zi0EYLX07NubC/YlMSgVIkCDhfCfGw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZK3ykMumQvqDeeSmWpXEAgI2RY67OFBZnkdWKDkZMIbGnYY6o68hjdUIX7GwicvAa
	 iNSB4AXRd6Rg5G+hT7xpogmh3JEd3qVdPT4EgMMmnW+rZIzluwUwL9BRvdry3Aw1ez
	 I8yM2Pkm6dqmCIvgxyNN7aFKvL/9pa89PzEc59nzDkm8/NYz/gDMKFUqKOxsjOqhPp
	 pOQuj52aAClIgHunqn9fpLi7hpWiMyvfQAi7ZCTiB0L5jHgtY5dnWG/YI32RieVZvm
	 KpEi1D57xd2niIpfItVl1H2Xm8Uch0U6pHrKDDNqgcvufoMaBikW+AqSkO10DUVQjz
	 yd+9csiLvYVVA==
Message-ID: <sashiko-outbox-223466@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 20/28] media: mali-vpu: implement vb2 buffer queue
 handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charvi Mehta" <charvi.mehta@arm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261119153758.1426673-21-charvi.mehta@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
 <20261119153758.1426673-21-charvi.mehta@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 16:06:08 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] media: mali-vpu: out-of-bounds VA mapping in
  mali_vpu_buffer_plane_map()
- [High] media: mali-vpu: wrong capture DMA sync in
  mali_vpu_queue_buffer()
- [High] media: mali-vpu: missing MMU flush in
  mali_vpu_vb2_buffer_cleanup()
- [Medium] media: mali-vpu: stranded buffers on error in
  mali_vpu_submit_deferred_bufs()
- [Medium] media: mali-vpu: unreachable 0-byte EOS check without
  allow_zero_bytesused
--

commit 8e09878f27886489a304a46715a5c2d9a14beef9
Author: Rath Sankaralingam <rath.sankaralingam@arm.com>

media: mali-vpu: implement vb2 buffer queue handling

This commit implements the vb2 callbacks for initializing, queuing, and
cleaning up Mali VPU buffers, along with MMU mapping, cache synchronization,
and deferred buffer submission when the firmware enters the RUNNING state.

> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.c b/driv=
ers/media/platform/arm/mali-vpu/mali-vpu-buffer.c
> index 7ace0489996a8..c1df3e2d4eacf 100644
> --- a/drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.c
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.c

[ ... ]

> @@ -19,6 +50,82 @@ int mali_vpu_vb2_buffer_init(struct vb2_buffer *vb2_bu=
f)
>  		return -EINVAL;
>  	}
> =20
> +	vpu_buf->dev =3D sess->vpu_dev->dev;

[ ... ]

> +static void mali_vpu_buffer_update_flags_from_v4l2(struct vb2_buffer *vb=
2_buf)
> +{
> +	struct vb2_v4l2_buffer *v4l2_buf =3D to_vb2_v4l2_buffer(vb2_buf);
> +	struct mali_vpu_buffer *vpu_buf =3D to_mali_vpu_buffer(v4l2_buf);
> +
> +	u32 flags =3D v4l2_buf->flags;
> +
> +	vpu_buf->flags =3D 0;
> +
> +	if (V4L2_TYPE_IS_OUTPUT(vb2_buf->type) && mali_vpu_buffer_get_bytesused=
(vb2_buf) =3D=3D 0)
> +		flags |=3D V4L2_BUF_FLAG_LAST;
> +
> +	if (flags & V4L2_BUF_FLAG_LAST)
> +		vpu_buf->flags |=3D MALI_VPU_BUFFER_EOS;
> +}

[Severity: Medium]
Can mali_vpu_buffer_get_bytesused(vb2_buf) =3D=3D 0 ever be reached on an
OUTPUT buffer without vq->allow_zero_bytesused set?

mali_vpu_queue_init_type() does not set allow_zero_bytesused on the OUTPUT
vb2_queue, so vb2_fill_vb2_v4l2_buffer() replaces a 0-byte bytesused from
userspace with the full plane length.  As a result, a 0-byte OUTPUT buffer
queued to signal EOS will instead be given a payload_size equal to the full
buffer capacity rather than setting MALI_VPU_BUFFER_EOS.  Also,
mali_vpu_buffer_get_bytesused() sums b->planes[i].bytesused without
subtracting data_offset, so an empty payload with a non-zero data_offset
will not be treated as 0 bytes used either.

[ ... ]

> @@ -49,3 +156,171 @@ int mali_vpu_vb2_buffer_out_validate(struct vb2_buff=
er *vb2_buf)
> =20
>  	return 0;
>  }
> +
> +static int mali_vpu_buffer_plane_map(struct mali_vpu_buffer *vpu_buf, ma=
li_vpu_mmu_va begin,
> +				     mali_vpu_mmu_va end, u32 plane)
> +{
> +	while (begin < end) {
> +		struct mali_vpu_buffer_plane *p =3D &vpu_buf->planes[plane];
> +		int ret;
> +
> +		ret =3D mali_vpu_mmu_map_pages(vpu_buf->mmu, begin, p->pages,
> +					     MALI_VPU_ATTR_SHARED_RW, MALI_VPU_ACCESS_READ_WRITE);
> +		if (!ret) {
> +			dev_dbg(vpu_buf->dev,
> +				"memory map buffer. buf=3D%p, plane=3D%u, va=3D0x%x, size=3D%zu.",
> +				vpu_buf, plane, p->pages->va,
> +				mali_vpu_mmu_size_pages(p->pages));
> +			return 0;
> +		}
> +
> +		if (ret !=3D -EAGAIN)
> +			return ret;
> +
> +		begin +=3D SZ_1M;
> +	}
> +
> +	return -ENOMEM;
> +}

[Severity: High]
Can mali_vpu_buffer_plane_map() map a plane past the end of the firmware
virtual address region?

The loop only checks begin < end, and mali_vpu_mmu_map_pages() maps
p->pages->capacity contiguous VPU pages starting at begin without taking an
upper bound.  When earlier mappings advance begin close to end (or a large
DMA-BUF is imported) so that the plane size exceeds end - begin, the
mapping spills past end into the adjacent firmware region or wraps around
the 32-bit VPU virtual address space.

[ ... ]

> +void mali_vpu_vb2_buffer_cleanup(struct vb2_buffer *vb2_buf)
> +{
> +	struct vb2_v4l2_buffer *v4l2_buf =3D to_vb2_v4l2_buffer(vb2_buf);
> +	struct mali_vpu_buffer *vpu_buf =3D to_mali_vpu_buffer(v4l2_buf);
> +	u32 i;
> +
> +	for (i =3D 0; i < vpu_buf->nplanes; i++) {
> +		if (!vpu_buf->planes[i].pages)
> +			continue;
> +
> +		mali_vpu_mmu_free_pages(vpu_buf->planes[i].pages);
> +		vpu_buf->planes[i].pages =3D NULL;
> +	}
> +}

[Severity: High]
Does unmapping buffer pages in mali_vpu_vb2_buffer_cleanup() without
calling mali_vpu_sched_flush_mmu() leave stale TLB entries in the VPU MMU?

mali_vpu_mmu_free_pages() -> mali_vpu_mmu_unmap_pages() clears the L2 PTEs
in sess->mmu, and when a new DMA-BUF is queued on the same VB2 slot (or
CAPTURE buffers are reallocated while the OUTPUT queue keeps the session
LSID active), mali_vpu_buffer_plane_map() immediately reuses the lowest
unmapped virtual addresses from the start of the region.  Without an LSID
MMU flush, the hardware can continue using cached translations pointing to
the previous buffer's freed physical pages.

> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c b/dri=
vers/media/platform/arm/mali-vpu/mali-vpu-session.c
> index 6d22a5d479008..540104bcd38e2 100644
> --- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
> @@ -150,6 +150,122 @@ int mali_vpu_session_fw_send_set_option(struct mali=
_vpu_session *sess,

[ ... ]

> +static int mali_vpu_queue_buffer(struct mali_vpu_session *sess, struct m=
ali_vpu_buffer *vpu_buf)
> +{
> +	int ret;
> +	enum dma_data_direction dma_dir;
> +
> +	dma_dir =3D (vpu_buf->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) ?
> +		   DMA_TO_DEVICE : DMA_FROM_DEVICE;
> +
> +	/* Map MMU buffer pages if it is not already mapped */
> +	if (!mali_vpu_is_buffer_mapped(vpu_buf)) {
> +		ret =3D mali_vpu_buffer_map_fw_region(sess, vpu_buf);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (!mali_vpu_is_coded_q(sess, vpu_buf->type) && sess->role =3D=3D MALI=
_VPU_DECODER) {
> +		ret =3D mali_vpu_buffer_set_frame_layout(vpu_buf);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* dma sync for cache coherency */
> +	ret =3D mali_vpu_buffer_sync(vpu_buf, dma_dir);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}

[Severity: High]
Does calling mali_vpu_buffer_sync(vpu_buf, DMA_FROM_DEVICE) on a CAPTURE
buffer before VPU DMA runs sync in the wrong direction (for the CPU instead
of the device)?

drivers/media/platform/arm/mali-vpu/mali-vpu-mmu.c:mali_vpu_mmu_sync_pages(=
) {
	if (dir =3D=3D DMA_FROM_DEVICE) {
		for (i =3D 0; i < pages->count; i +=3D MALI_VPU_PAGES_PER_LINUX_PAGE)
			dma_sync_single_for_cpu(pages->dev, pages->pages[i].dma,
						PAGE_SIZE, DMA_FROM_DEVICE);
}

When queuing a buffer to hardware before DMA starts, pages need to be
synced for the device (which vb2_dma_sg_prepare() already does during buffer
prepare), whereas dma_sync_single_for_cpu() transfers ownership back to the
CPU before the VPU writes the decoded frame.

> +
> +static int mali_vpu_submit_deferred_bufs_for_queue(struct mali_vpu_sessi=
on *sess,
> +						   enum v4l2_buf_type type)
> +{
> +	struct v4l2_m2m_buffer *buffer;
> +	struct mali_vpu_buffer *vpu_buf;
> +	int ret;
> +
> +	if (!mali_vpu_session_get_port(sess, type)->stream_requested ||
> +	    !mali_vpu_session_can_stream(sess) ||
> +	    sess->fw_state !=3D MALI_VPU_FW_STATE_RUNNING)
> +		return 0;
> +
> +	if (V4L2_TYPE_IS_OUTPUT(type)) {
> +		v4l2_m2m_for_each_src_buf(sess->m2m_ctx, buffer) {
> +			vpu_buf =3D to_mali_vpu_buffer(&buffer->vb);
> +			if (vpu_buf->attr !=3D MALI_VPU_BUF_ATTR_DEFERRED)
> +				continue;
> +
> +			ret =3D mali_vpu_queue_buffer(sess, vpu_buf);
> +			if (ret)
> +				return ret;
> +
> +			vpu_buf->attr =3D MALI_VPU_BUF_ATTR_QUEUED;
> +		}
> +	} else if (V4L2_TYPE_IS_CAPTURE(type)) {
> +		v4l2_m2m_for_each_dst_buf(sess->m2m_ctx, buffer) {
> +			vpu_buf =3D to_mali_vpu_buffer(&buffer->vb);
> +			if (vpu_buf->attr !=3D MALI_VPU_BUF_ATTR_DEFERRED)
> +				continue;
> +
> +			ret =3D mali_vpu_queue_buffer(sess, vpu_buf);
> +			if (ret)
> +				return ret;
> +
> +			vpu_buf->attr =3D MALI_VPU_BUF_ATTR_QUEUED;
> +		}
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mali_vpu_submit_deferred_bufs(struct mali_vpu_session *sess)
> +{
> +	int ret;
> +
> +	ret =3D mali_vpu_submit_deferred_bufs_for_queue(sess, V4L2_BUF_TYPE_VID=
EO_OUTPUT_MPLANE);
> +	if (ret)
> +		goto err_submit;
> +
> +	ret =3D mali_vpu_submit_deferred_bufs_for_queue(sess,
> +						      V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	if (ret)
> +		goto err_submit;
> +
> +	mali_vpu_sched_send_irq(&sess->sched_sess, &sess->vpu_dev->sched);
> +
> +	return 0;
> +
> +err_submit:
> +	dev_err(sess->vpu_dev->dev, "failed to queue deferred buffers\n");
> +	return ret;
> +}

[Severity: Medium]
If mali_vpu_queue_buffer() fails for a deferred buffer here, doesn't this
leave both the failed buffer and the remaining buffers in the batch
stranded?

Unlike mali_vpu_vb2_buffer_queue(), which removes a failed buffer from
sess->m2m_ctx and completes it with VB2_BUF_STATE_ERROR, an error in
mali_vpu_submit_deferred_bufs_for_queue() returns immediately while the
buffer is still on the m2m ready queue in VB2_BUF_STATE_ACTIVE.  Bailing
out to err_submit also skips remaining deferred buffers and skips
mali_vpu_sched_send_irq() for any earlier buffers in the loop that were
already marked MALI_VPU_BUF_ATTR_QUEUED.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119153758.1426=
673-1-charvi.mehta@arm.com?part=3D20
