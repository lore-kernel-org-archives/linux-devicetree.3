Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792959839;
	b=gXul2rHCeXjn8Wai7hiRtng5CZPFa4sr7PgRmeU4YoPvX90we9RJvrURb/6ZmRvk5U6F
	 vHH63BjfPzLlWrEUFhBl7p/PZ7Sg6yu/FmQdnByhjaohSVKsihppGX+Rl1zqBWANeew3J
	 LIrZzz0ckIFCBqzloFsRwSQWLY05NnHJebDS6NpGmLjv0+65VzXhZlTWTP6Rv8TmMuT+w
	 Ol4lrNQVfpg7kNDGtitXXr4JFc6R4mxtobvtdLdGo4mOrI9sTIDLlQxKTM/4eXqVlRugt
	 1lbU1UQnw9bjibH71xgz0A7e5V8xPzFBkkTUqmDL1fOpt30U8MTd63OeOS/Gc4LE8dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792959839;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=y1WJAEjkxwcFfyDf8gDd8+sHnhfNZb6tYFxj+6aWY/E=;
	b=Ek/g9/G5DiWfyGwFg1GTtTCYNFR/cIkEpHsa/lDk0ZSxXDLaQDTrqN7soU0M0v/aSyyd
	 V468c3B1M58898HdGYUwf+HYe4Vi4HGYN98lxTf5o7b178ivowifUgp3ZzvAYfZsgUPTx
	 mqGpTzyCwwEW+lqoa6a29Old7nfO51QpM/tLh/LQhDJ/RNuVR1tjn5PLuD0lKEAwueEGs
	 HUYh9EMF+cqd3oVyE7aFcpgrcugQtRP1SUnaeRcM9oUv2NItKBF693nf79bqUyOXCAQDD
	 LUK53bEZJ8WWv9J3pT6+HbHu+2pOByqHvZol71oH7p4AaK4rez5CQ0mCa6aYvWmfQ7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mxpDjX4+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24E5606A31A
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 20:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mxpDjX4+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EBEF1F01825;
	Sun, 25 Oct 2026 20:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792959838;
	bh=y1WJAEjkxwcFfyDf8gDd8+sHnhfNZb6tYFxj+6aWY/E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mxpDjX4+dchm+w6qs6YU7Wp6Iubq/ZB6NPULTtedEsEZ3z0tlhpX2Ws2WMEc93foL
	 IBWcRJ1EKXSpZlFCFgijUwf+Isv8a0OiAjzlWjYNsKVBbyYP6NFmY/Q2KthQGrO4qN
	 Zx+E0yVn0vI1IDQnJOUi+EjX66EZiUgMCKQ80x9oGBvavxX1xnKQNYIzRB3ex5JIob
	 6wD7SFmSVgpzehfGvQeFizjWJTxpIP8SVkTTcju4WeyV8obVqWnAvY/KKf+JcHINsF
	 XI7/vatZoaWGlySDqsFpZmGAfl90VLQbUfRU/aIBHnbUxfhbCIeVwBLha8IxyCYyuC
	 PPQSu+eg3mnuw==
Message-ID: <sashiko-outbox-184424@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/11] media: amlogic: vdec: add VP9 decoding on the
 HEVC core
Reply-To: sashiko-reviews@lists.linux.dev
To: christian.koever-draxl@student.uibk.ac.at
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261025192507.210058-9-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192507.210058-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192507.210058-9-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 20:23:57 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [Critical] media: amlogic: vdec: missing CAPTURE buffer bounds checks in =
vp9_copy_out()
- [Critical] media: amlogic: vdec: missing core stop and IRQ sync in aml_vp=
9_exit()
- [High] media: amlogic: vdec: broken alt-ref and show_existing_frame in vp=
9_copy_out()
- [High] media: amlogic: vdec: intra-only frames reset refs in aml_vp9_conf=
ig_picture()
- [High] media: amlogic: vdec: vp9_alloc_slots() frees active reference slo=
ts on resize
- [High] media: amlogic: vdec: workspace overflow for height > 2304 in vp9.c
- [High] media: amlogic: vdec: aml_vp9_feed() omits AMLV header from FIFO b=
uffer size
- [High] media: amlogic: vdec: DMA buffer leak in aml_vp9_exit() after time=
out or error
- [High] media: amlogic: vdec: premature job completion in vp9_finish() rac=
es with run()
- [Medium] media: amlogic: vdec: aml_vp9_feed() frees active FIFO before ha=
lting AMRISC
- [Low] media: amlogic: vdec: dead IVF harness and file I/O in aml_vp9_save=
_nv12()
--

commit 068064c3014d8dcbf3ec35bb56cb4ba67e04474c
Author: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>

media: amlogic: vdec: add VP9 decoding on the HEVC core

This commit adds stateless V4L2 VP9 decoding support for profile 0 and
profile 2 on the Amlogic S4 HEVC core. It manages the hardware workspace,
reference frame slots, and frame context probability buffers to drive the
VP9 microcode.

> diff --git a/drivers/media/platform/amlogic/vdec/vp9.c b/drivers/media/pl=
atform/amlogic/vdec/vp9.c
> new file mode 100644
> index 0000000000000..b67d503b93511
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/vp9.c

[ ... ]

> +int aml_vp9_feed(struct aml_vdec_hw *hw, const void *data, size_t size)
> +{
> +	size_t want =3D ALIGN(size + VP9_PADDING_SIZE, SZ_64K);
> +	u32 end;
> +
> +	if (!data || !size)
> +		return -EINVAL;
> +
> +	if (vp9_ws.stream_vaddr && vp9_ws.stream_size < want) {
> +		dma_free_coherent(hw->dev, vp9_ws.stream_size,
> +				  vp9_ws.stream_vaddr, vp9_ws.stream_paddr);
> +		vp9_ws.stream_vaddr =3D NULL;
> +	}

[Severity: Medium]
In aml_vp9_dec_run(), aml_vp9_feed() is called before HEVC_MPSR and
HEVC_CPSR are cleared and before DOS_SW_RESET3 is pulsed. At the end of a
frame, HEVC_STREAM_CONTROL bit 0 (stream fetch enable) and HEVC_MPSR
remain set.

If a subsequent frame is larger and triggers this reallocation in
aml_vp9_feed(), can dma_free_coherent() free vp9_ws.stream_vaddr while
stream fetching is still enabled in HEVC_STREAM_CONTROL and the hardware
FIFO registers still point to the old physical address?

> +	if (!vp9_ws.stream_vaddr) {
> +		vp9_ws.stream_vaddr =3D dma_alloc_coherent(hw->dev, want,
> +							 &vp9_ws.stream_paddr,
> +							 GFP_KERNEL);
> +		if (!vp9_ws.stream_vaddr)
> +			return -ENOMEM;
> +		vp9_ws.stream_size =3D want;
> +	}

[ ... ]

> +	u32 psize =3D size + VP9_AMLV_HEADER_SIZE;
> +	u8 *h =3D vp9_ws.stream_vaddr;
> +
> +	memset(h, 0, VP9_AMLV_HEADER_SIZE);
> +	h[0] =3D psize >> 24;
> +	h[1] =3D psize >> 16;
> +	h[2] =3D psize >> 8;
> +	h[3] =3D psize;
> +	h[4] =3D h[0] ^ 0xff;
> +	h[5] =3D h[1] ^ 0xff;
> +	h[6] =3D h[2] ^ 0xff;
> +	h[7] =3D h[3] ^ 0xff;
> +	h[11] =3D 1;
> +	h[12] =3D 'A';
> +	h[13] =3D 'M';
> +	h[14] =3D 'L';
> +	h[15] =3D 'V';
> +	memcpy(vp9_ws.stream_vaddr + VP9_AMLV_HEADER_SIZE, data, size);
> +	size +=3D VP9_AMLV_HEADER_SIZE;
> +	vp9_ws.payload =3D size;
> +
> +	/*
> +	 * The end pointer bounds the FIFO, not the payload - ending it at the
> +	 * payload puts the write pointer outside the ring and the microcode
> +	 * waits for data that can never arrive.  This is the bug that cost the
> +	 * AV1 path a long time; keep the whole buffer in the ring.
> +	 */
> +	end =3D vp9_ws.stream_paddr + vp9_ws.stream_size - 1;
> +
> +	wr(hw, HEVC_STREAM_START_ADDR, vp9_ws.stream_paddr);
> +	wr(hw, HEVC_STREAM_END_ADDR, end);
> +	wr(hw, HEVC_STREAM_RD_PTR, vp9_ws.stream_paddr);
> +	wr(hw, HEVC_STREAM_WR_PTR,
> +	   vp9_ws.stream_paddr + vp9_ws.payload + VP9_PADDING_SIZE);

[Severity: High]
At the top of aml_vp9_feed(), the allocation size is calculated without
VP9_AMLV_HEADER_SIZE:

    size_t want =3D ALIGN(size + VP9_PADDING_SIZE, SZ_64K);

After prepending the 16-byte AMLV header, size is incremented by
VP9_AMLV_HEADER_SIZE and stored in vp9_ws.payload, and HEVC_STREAM_WR_PTR
is set to vp9_ws.stream_paddr + vp9_ws.payload + VP9_PADDING_SIZE.

When the original size + VP9_PADDING_SIZE falls within 16 bytes of a
64 KiB boundary (for example, size =3D 49152 so want =3D 65536), doesn't
vp9_ws.payload + VP9_PADDING_SIZE reach up to 65552, placing
HEVC_STREAM_WR_PTR past HEVC_STREAM_END_ADDR and up to 16 bytes outside
the allocated vp9_ws.stream_vaddr DMA buffer?

[ ... ]

> +static int vp9_alloc_slots(struct aml_vdec_hw *hw, u32 width, u32 height)
> +{
> +	size_t body =3D ALIGN(vp9_comp_body_size(width, height), PAGE_SIZE);
> +	size_t hdr =3D vp9_hdr_alloc_size(width, height);
> +	size_t mv =3D vp9_mv_buf_size(width, height);
> +	size_t dw =3D vp9_dw_target_y ? 0 : ALIGN(width * height * 3 / 2, SZ_64=
K);
> +	int i;
> +
> +	if (vp9_slots[0].body_v && body =3D=3D vp9_slot_body_size &&
> +	    hdr =3D=3D vp9_slot_hdr_size && mv =3D=3D vp9_slot_mv_size &&
> +	    dw =3D=3D vp9_slot_dw_size)
> +		return 0;
> +
> +	vp9_free_slots(hw);

[Severity: High]
VP9 allows inter frames to change resolution and scale from prior reference
frames, and vp9_config_mc_buffer() sets up reference scaling using each
reference slot's ref->width and ref->height:

    for (i =3D 0; i < VP9_REFS_PER_FRAME; i++) {
        struct vp9_slot *ref =3D &vp9_slots[vp9_frame_slot[i]];
        u32 rw =3D ref->width ? ref->width : width;
        u32 rh =3D ref->height ? ref->height : height;

However, aml_vp9_config_picture() calls vp9_alloc_slots() before calling
vp9_config_pic_list() and vp9_config_mc_buffer(). When an inter frame
changes dimensions such that body, hdr, mv, or dw changes size, won't
vp9_alloc_slots() call vp9_free_slots(hw) and wipe out all 10 vp9_slots[]
buffers along with their stored width and height before the inter frame is
decoded?

[ ... ]

> +int aml_vp9_config_picture(struct aml_vdec_hw *hw)
> +{
> +	const u16 *raw;
> +	u16 pr[VP9_RPM_COUNT];
> +	u32 width, height, lcu_total, uv_size, uv_h;
> +	u32 data32, body, header;
> +	dma_addr_t dw_y, dw_c;
> +	bool inter, intra_only, use_prev_mvs;
> +	int i, j, ret;
> +
> +	if (!vp9_ws.side_vaddr)
> +		return -EINVAL;
> +
> +	raw =3D vp9_ws.side_vaddr + (vp9_ws.rpm - vp9_ws.side_paddr);
> +	for (i =3D 0; i < VP9_RPM_COUNT; i +=3D 4)
> +		for (j =3D 0; j < 4; j++)
> +			pr[i + j] =3D raw[i + 3 - j];
> +
> +	width =3D pr[VP9_RPM_WIDTH];
> +	height =3D pr[VP9_RPM_HEIGHT];
> +
> +	/*
> +	 * The MMU page table, the compressed body and the picture slots are
> +	 * all sized from these.  If the microcode never actually parsed a
> +	 * header they hold whatever was left in the RPM, and building a page
> +	 * table from that points the hardware at memory it does not own -
> +	 * which resets the board outright with no oops to read afterwards.
> +	 */
> +	if (width < VP9_MIN_DIM || height < VP9_MIN_DIM ||
> +	    width > VP9_MAX_DIM || height > VP9_MAX_DIM) {
> +		dev_err(hw->dev, "vp9: implausible picture size %ux%u, refusing\n",
> +			width, height);
> +		return -EINVAL;
> +	}

[Severity: High]
The workspace buffers in vp9_alloc() (such as VP9_SEG_MAP_SIZE =3D 0xd800 a=
nd
VP9_MMU_VBH_SIZE =3D 0x5000), HEVC_DBLK_CFG3, and the advertised format lim=
it
AML_VDEC_4K_MAX_H (2304) are all sized for a maximum resolution of
4096x2304.

Since VP9_MAX_DIM is 4096, an 8-bit frame with height between 2305 and 4096
(for example, 2160x3840 or 4096x2880, which fits within the 0x1200-page
limit in vp9_fill_mmu_map()) passes this check. Can this cause the hardware
to DMA past the end of vp9_ws.seg_map and vp9_ws.mmu_vbh?

[ ... ]

> +	intra_only =3D (pr[VP9_RPM_SHOW_FRAME] & 1) ? false :
> +		     (pr[VP9_RPM_INTRA_ONLY] & 1);
> +	inter =3D pr[VP9_RPM_FRAME_TYPE] !=3D VP9_KEY_FRAME && !intra_only;

[ ... ]

> +	/* A key frame resets the reference state; otherwise take a slot no
> +	 * reference names, so decoding cannot destroy a picture still needed.
> +	 */
> +	if (!inter) {
> +		vp9_cur_slot =3D 0;
> +		for (i =3D 0; i < VP9_REF_FRAMES; i++)
> +			vp9_ref_slot[i] =3D 0;
> +	} else {

[Severity: High]
Because inter is false for both keyframes and intra-only frames, checking
!inter here causes an intra-only frame to select slot 0 (overwriting the
existing reference picture in slot 0) and reset all 8 entries of
vp9_ref_slot[] to 0.

Per the VP9 specification, intra-only frames only update the reference
slots indicated by refresh_frame_flags (which vp9_pending_refresh preserves
just above) and must leave the remaining reference slots intact for later
inter frames. Should this check vp9_cur_kf instead of !inter?

[ ... ]

> +void aml_vp9_frame_done(struct aml_vdec_hw *hw)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < VP9_REF_FRAMES; i++)
> +		if (vp9_pending_refresh & (1 << i))
> +			vp9_ref_slot[i] =3D vp9_cur_slot;
> +
> +	if (vp9_cur_show)
> +		vp9_out_slot =3D vp9_cur_slot;
> +	vp9_prev_slot =3D vp9_cur_slot;
> +	/* The next frame's adaptation needs this frame's type. */
> +}

[Severity: High]
In V4L2 stateless VP9 decoding (V4L2_PIX_FMT_VP9_FRAME), userspace submits
a CAPTURE buffer for every coded frame, including hidden alt-ref frames
where show_frame =3D=3D 0, and later displays that decoded CAPTURE buffer i=
tself
when show_existing_frame =3D=3D 1 occurs.

When a hidden alt-ref frame finishes decoding (vp9_cur_show =3D=3D false):
1. aml_vp9_frame_done() leaves vp9_out_slot at -1 (unlike
   aml_av1_frame_done() in av1.c, which checks av1_cur_show || av1_stateles=
s).
2. vp9_copy_out() sees slot < 0 and returns early without copying the
   decoded frame (when vp9_dw_target_y =3D=3D 0) and without setting
   vp9->have_picture =3D true.
3. vp9_finish() sees !vp9->have_picture and sets the CAPTURE buffer plane
   payloads to 0, discarding the decoded alt-ref frame.

Conversely, if a frame with show_existing_frame =3D=3D 1 is submitted while
vp9_dw_target_y is non-zero, vp9_alloc_slots() skipped allocating per-slot
dw_v buffers (dw =3D 0), aml_vp9_config_picture() sets
vp9_out_slot =3D vp9_ref_slot[idx] and returns -EAGAIN without running the
decoder, and vp9_copy_out() takes the if (vp9_dw_target_y) branch and marks
the new CAPTURE buffer as having a full payload even though nothing was
written to it.

How are alt-ref frames and show_existing_frame intended to work with
V4L2 stateless CAPTURE buffers here?

[ ... ]

> +int aml_vp9_save_nv12(struct aml_vdec_hw *hw, const char *path, bool app=
end)
> +{
> +	const u8 *y;
> +	size_t i, nz =3D 0, len;
> +	struct file *f;
> +	loff_t pos =3D 0;
> +	int slot =3D vp9_out_slot;
> +
> +	if (slot < 0)
> +		return -EAGAIN;
> +	vp9_out_slot =3D -1;
> +	y =3D vp9_slots[slot].dw_v;
> +	if (!y)
> +		return -ENODEV;
> +	dma_sync_single_for_cpu(hw->dev, vp9_slots[slot].dw_p,
> +				vp9_slot_dw_size, DMA_FROM_DEVICE);
> +
> +	len =3D (size_t)vp9_slots[slot].width * vp9_slots[slot].height * 3 / 2;
> +	for (i =3D 0; i < len; i++)
> +		if (y[i])
> +			nz++;
> +	dev_info(hw->dev, "vp9: nv12 %zu/%zu non-zero, Y[0..15] %*ph\n",
> +		 nz, len, 16, y);
> +
> +	f =3D filp_open(path, O_WRONLY | O_CREAT |
> +		      (append ? O_APPEND : O_TRUNC), 0644);
> +	if (IS_ERR(f))
> +		return PTR_ERR(f);
> +	if (append)
> +		pos =3D i_size_read(file_inode(f));
> +	kernel_write(f, y, len, &pos);
> +	filp_close(f, NULL);
> +	dev_info(hw->dev, "vp9: wrote %zu bytes of NV12 to %s\n", len, path);
> +	return 0;
> +}
> +
> +/* ---------------------------------------------------------------------=
---
> + * IVF test harness
> + *
> + * The decoder is frame based and start-code free, so it wants exactly o=
ne
> + * frame in front of the shifter at a time.  An IVF file is the easiest =
way to
> + * carry a sequence of them: a 32-byte file header, then a 12-byte lengt=
h and
> + * timestamp in front of each frame.
> + * ---------------------------------------------------------------------=
---
> + */
> +
> +static u8 *vp9_ivf;
> +static size_t vp9_ivf_size;
> +static size_t vp9_ivf_pos;
> +
> +void aml_vp9_ivf_release(void)
> +{
> +	kfree(vp9_ivf);
> +	vp9_ivf =3D NULL;
> +	vp9_ivf_size =3D 0;
> +	vp9_ivf_pos =3D 0;
> +}
> +
> +int aml_vp9_ivf_load(struct aml_vdec_hw *hw, const char *name)
> +{

[Severity: Low]
aml_vp9_save_nv12() performs direct file I/O from kernel space using
filp_open() and kernel_write(), and along with the IVF test harness
(aml_vp9_ivf_load(), aml_vp9_ivf_feed_next(), aml_vp9_ivf_release()) and
debug helpers (aml_vp9_feed_file(), aml_vp9_dump_state(),
aml_vp9_dump_params(), aml_vp9_dump_output(), aml_vp9_reset_core(),
aml_vp9_prot_reinit()) has no callers in the tree.

Additionally, the comments at the top of vp9.c and above aml_vp9_feed() say
there is no AMLV reframing even though aml_vp9_feed() prepends a 16-byte
AMLV header, and vp9_prob.h has a leftover kernel-doc comment for a removed
adaptation function. Could this unused test/debug code be removed and the
comments updated?

[ ... ]

> +static void vp9_set_dw_target(struct aml_vdec_ctx *ctx)
> +{
> +	struct v4l2_pix_format_mplane *pf =3D &ctx->pix_fmt[AML_FMT_DST];
> +	struct vb2_v4l2_buffer *dst =3D v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> +	struct vb2_buffer *vb;
> +
> +	vp9_dw_target_y =3D 0;
> +	vp9_dw_target_c =3D 0;
> +	vp9_dw_target_size =3D 0;
> +	if (!dst)
> +		return;
> +	vb =3D &dst->vb2_buf;
> +	if (pf->plane_fmt[0].bytesperline !=3D pf->width)
> +		return;
> +
> +	vp9_dw_target_y =3D vb2_dma_contig_plane_dma_addr(vb, 0);
> +	if (!vp9_dw_target_y)
> +		return;
> +	if (vb->num_planes >=3D 2) {
> +		vp9_dw_target_c =3D vb2_dma_contig_plane_dma_addr(vb, 1);
> +		vp9_dw_target_size =3D vb2_plane_size(vb, 0) +
> +				     vb2_plane_size(vb, 1);
> +		if (!vp9_dw_target_c) {
> +			vp9_dw_target_y =3D 0;
> +			return;
> +		}
> +	} else {
> +		vp9_dw_target_c =3D vp9_dw_target_y +
> +				  (dma_addr_t)pf->width * pf->height;
> +		vp9_dw_target_size =3D vb2_plane_size(vb, 0);
> +	}
> +}
> +
> +static void vp9_copy_out(struct aml_vp9_ctx *vp9, struct vb2_v4l2_buffer=
 *dst)
> +{
> +	struct v4l2_pix_format_mplane *pf =3D
> +		&vp9->v4l2_ctx->pix_fmt[AML_FMT_DST];
> +	struct vb2_buffer *vb =3D &dst->vb2_buf;
> +	u32 dst_stride =3D pf->plane_fmt[0].bytesperline ? : vp9_last_width;
> +	u32 dst_h =3D pf->height ? : vp9_last_height;
> +	int slot =3D vp9_out_slot;
> +	const u8 *src;
> +	u8 *y, *c;
> +	u32 row, w, h;
> +
> +	if (slot < 0)
> +		return;
> +	vp9_out_slot =3D -1;
> +
> +	if (vp9_dw_target_y) {
> +		if (vb->num_planes >=3D 2) {
> +			vb2_set_plane_payload(vb, 0, dst_stride * dst_h);
> +			vb2_set_plane_payload(vb, 1, dst_stride * dst_h / 2);
> +		} else {
> +			vb2_set_plane_payload(vb, 0,
> +					      dst_stride * dst_h * 3 / 2);
> +		}
> +		vp9->have_picture =3D true;
> +		return;
> +	}
> +
> +	src =3D vp9_slots[slot].dw_v;
> +	if (!src)
> +		return;
> +	dma_sync_single_for_cpu(vp9->hw->dev, vp9_slots[slot].dw_p,
> +				vp9_slot_dw_size, DMA_FROM_DEVICE);
> +
> +	w =3D vp9_slots[slot].width;
> +	h =3D vp9_slots[slot].height;
> +	y =3D vb2_plane_vaddr(vb, 0);
> +	if (!y)
> +		return;
> +	c =3D vb->num_planes >=3D 2 ? vb2_plane_vaddr(vb, 1) :
> +				  y + (size_t)dst_stride * dst_h;
> +	if (!c)
> +		return;
> +
> +	for (row =3D 0; row < h; row++)
> +		memcpy(y + (size_t)row * dst_stride, src + (size_t)row * w, w);
> +	for (row =3D 0; row < h / 2; row++)
> +		memcpy(c + (size_t)row * dst_stride,
> +		       src + (size_t)(h + row) * w, w);

[Severity: Critical]
Can this corrupt CAPTURE buffer memory when the coded frame dimensions in
the VP9 bitstream do not match the negotiated CAPTURE format?

1. When vp9_dw_target_y =3D=3D 0 (for instance, if bytesperline !=3D pf->wi=
dth),
   aml_vp9_config_picture() does not check that the parsed frame's width
   and height fit within the CAPTURE buffer. In vp9_copy_out(), the loops
   copy h rows of w bytes into y and h / 2 rows of w bytes into c without
   checking that w <=3D dst_stride, h <=3D dst_h, or that the destination
   vb2_buffer planes are large enough, which can overflow the CAPTURE
   planes via memcpy().
2. When vp9_dw_target_y !=3D 0, vp9_set_dw_target() computes vp9_dw_target_c
   from pf->width * pf->height for single-plane NV12 and sums both plane
   sizes into a single vp9_dw_target_size for two-plane NV12M before the
   bitstream dimensions are parsed. In aml_vp9_config_picture(), the
   hardware is configured for 64-byte line alignment (ALIGN(width, 64)),
   but only (size_t)width * height * 3 / 2 > vp9_dw_target_size is checked:

       if (vp9_dw_target_y) {
           if ((size_t)width * height * 3 / 2 > vp9_dw_target_size) {
               ...
               return -EINVAL;
           }
           dw_y =3D vp9_dw_target_y;
           dw_c =3D vp9_dw_target_c;
       }

   If ALIGN(width, 64) !=3D pf->width or height > pf->height while
   width * height * 3 / 2 <=3D vp9_dw_target_size (or if plane 0 of an NV12M
   buffer is smaller than ALIGN(width, 64) * height), won't the double-write
   unit DMA past the end of the CAPTURE buffer planes?

[ ... ]

> +static void vp9_finish(struct aml_vp9_ctx *vp9, enum vb2_buffer_state st=
ate)
> +{
> +	struct aml_vdec_ctx *ctx =3D vp9->v4l2_ctx;
> +	struct vb2_v4l2_buffer *buf;
> +	unsigned int i;
> +
> +	if (!vp9->have_picture) {
> +		buf =3D v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> +		if (buf)
> +			for (i =3D 0; i < buf->vb2_buf.num_planes; i++)
> +				vb2_set_plane_payload(&buf->vb2_buf, i, 0);
> +	}
> +
> +	buf =3D v4l2_m2m_next_src_buf(ctx->m2m_ctx);
> +	if (buf && buf->vb2_buf.req_obj.req)
> +		v4l2_ctrl_request_complete(buf->vb2_buf.req_obj.req,
> +					   &ctx->ctrl_handler);
> +
> +	vp9_finish_frame_ctx(vp9);
> +
> +	ctx->int_cond =3D 1;
> +	ctx->job_finished =3D true;
> +	v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev_dec, ctx->m2m_ctx,
> +					 state);
> +	wake_up(&ctx->queue);
> +}

[Severity: High]
Does calling v4l2_m2m_buf_done_and_job_finish() here in vp9_finish() race
with aml_vp9_dec_run() and m2mops_vdec_device_run()?

m2mops_vdec_device_run() calls ctx->codec_ops->run(ctx) (aml_vp9_dec_run()),
which blocks in wait_event_timeout(ctx->queue, ctx->int_cond, ...). When
vp9_irq_thread() calls vp9_finish(), v4l2_m2m_buf_done_and_job_finish()
completes src_buf and dst_buf, clears TRANS_RUNNING, and can start the next
m2m job or unblock a concurrent v4l2_m2m_cancel_job() in streamoff/close
before wake_up(&ctx->queue) runs and before aml_vp9_dec_run() returns:

drivers/media/platform/amlogic/vdec/aml_vdec.c:m2mops_vdec_device_run() {
    ...
    ctx->job_finished =3D false;
    ret =3D ctx->codec_ops->run(ctx);

    v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
    ...
}

When aml_vp9_dec_run() wakes up, it writes ctx->int_cond =3D 0 (which can
clobber the next job's state), m2mops_vdec_device_run() calls
v4l2_m2m_buf_copy_metadata(src_buf, dst_buf) on buffers already returned to
vb2/userspace, and if streamoff/close ran after TRANS_RUNNING was cleared,
ctx and vp9 may already be freed.

> +
> +static irqreturn_t vp9_irq_thread(int irq, void *priv)
> +{
> +	struct aml_vp9_ctx *vp9 =3D priv;
> +	struct aml_vdec_ctx *ctx =3D vp9->v4l2_ctx;
> +	struct aml_vdec_hw *hw =3D vp9->hw;
> +	u32 st =3D hw->hevc_irq_status & 0xff;
> +	u32 next =3D VP9_10B_DECODE_SLICE;

[ ... ]

> +	case VP9_NAL_DECODE_DONE:
> +	case HEVC_ACTION_DONE:
> +	case VP9_DECODE_BUFEMPTY:
> +	case VP9_SEARCH_BUFEMPTY:
> +	case VP9_EOS:
> +		vp9_finish(vp9, VB2_BUF_STATE_DONE);
> +		return IRQ_HANDLED;
> +	default:
> +		dev_dbg(hw->dev, "vp9: unhandled status %02x\n", st);
> +		break;
> +	}
> +
> +	regmap_write(hw->map[DOS_BUS], HEVC_ASSIST_MBOX0_CLR_REG, 1);
> +	regmap_write(hw->map[DOS_BUS], HEVC_DEC_STATUS_REG, next);
> +	return IRQ_HANDLED;
> +}

[Severity: High]
In vp9_irq_thread(), next is initialized to VP9_10B_DECODE_SLICE. If the
microcode posts any status code that hits the default branch (such as
VP9_HEAD_SEARCH_DONE, VP9_DECPIC_DATA_ERROR, or VP9_DECODE_OVER_SIZE)
before VP9_HEAD_PARSER_DONE has run aml_vp9_config_picture(), won't writing
next to HEVC_DEC_STATUS_REG command the microcode to decode a slice using
unconfigured or stale DMA addresses?

[ ... ]

> +void aml_vp9_exit(void *priv)
> +{
> +	struct aml_vdec_ctx *ctx =3D priv;
> +	struct aml_vp9_ctx *vp9 =3D ctx->codec_priv;
> +
> +	if (!vp9)
> +		return;
> +
> +	vp9->hw->hevc_irq_thread_fn =3D NULL;
> +	vp9->hw->hevc_priv =3D NULL;
> +	if (vp9->started) {
> +		regmap_write(vp9->hw->map[DOS_BUS], HEVC_MPSR, 0);
> +		aml_vp9_teardown(vp9->hw);
> +		/*
> +		 * Deliberately not hvdec_disable(): powering the HEVC core
> +		 * down here leaves it in a state the next context's bring-up
> +		 * does not recover from, and every frame of the *second*
> +		 * decode session on this core then times out - whichever
> +		 * codec it is.  The domain is left up until the module is
> +		 * unloaded.
> +		 */
> +	}
> +	kfree(vp9);
> +	ctx->codec_priv =3D NULL;
> +}

[Severity: Critical]
Can aml_vp9_exit() race with an in-flight threaded interrupt or a second
context opening the decoder?

1. hevc_irq_thread() in aml_vdec_hw.c reads hw->hevc_irq_thread_fn and
   hw->hevc_priv without synchronization:

       if (hw->hevc_irq_thread_fn)
           return hw->hevc_irq_thread_fn(irq, hw->hevc_priv);

   Because aml_vp9_exit() clears hevc_irq_thread_fn and hevc_priv before
   halting the hardware and never calls synchronize_irq(vp9->hw->hevc_irq),
   an in-flight threaded IRQ can either call vp9_irq_thread(irq, NULL) or
   continue running vp9_irq_thread() while aml_vp9_teardown() and
   kfree(vp9) free vp9_ws, vp9_slots, and vp9.
2. Clearing vp9->hw->hevc_priv =3D NULL before aml_vp9_teardown(vp9->hw)
   allows another thread in aml_vp9_init() to succeed at
   cmpxchg(&hw->hevc_priv, NULL, vp9) and access the global vp9_ws and
   vp9_slots while aml_vp9_teardown() is freeing them.

> +
> +int aml_vp9_dec_run(void *priv)
> +{

[ ... ]

> +	if (!vp9->started) {
> +		ret =3D aml_vp9_bringup(hw, ctx->pix_fmt[AML_FMT_SRC].width,
> +				      ctx->pix_fmt[AML_FMT_SRC].height);
> +		if (ret) {
> +			hvdec_disable(hw);
> +			return ret;
> +		}
> +	}
> +
> +	vp9_prepare_frame_ctx(vp9, dec, hdr);
> +	vp9_set_dw_target(ctx);
> +
> +	ret =3D aml_vp9_feed(hw, vb2_plane_vaddr(vb, 0),
> +			   vb2_get_plane_payload(vb, 0));
> +	if (ret)
> +		return ret;

[ ... ]

> +	if (!ret) {
> +		int k;
> +
> +		dev_err(hw->dev, "vp9: decode timeout, status %02x pc %08x\n",
> +			hw->hevc_irq_status, read_dos_reg(hw, HEVC_MPC_E));
> +		dev_err(hw->dev,
> +			"vp9: dec_status %08x adapt %08x parser_ctl %08x shift %08x\n",
> +			read_dos_reg(hw, HEVC_DEC_STATUS_REG),
> +			read_dos_reg(hw, VP9_ADAPT_PROB_REG),
> +			read_dos_reg(hw, REG_ALIGN(0x3050)),
> +			read_dos_reg(hw, HEVC_SHIFT_BYTE_COUNT));
> +		for (k =3D 0; k < 16; k++)
> +			dev_err(hw->dev, "vp9: scratch[%x] %08x\n", k,
> +				read_dos_reg(hw, REG_ALIGN(0x30c0 + k)));
> +		/*
> +		 * After a timeout the core decodes every later frame to garbage
> +		 * - in this session and the next ones - until its memories are
> +		 * cycled.  Have the next frame cycle them, reload the microcode
> +		 * and bring the decoder up again; the stream picks up at its
> +		 * next key frame.
> +		 */
> +		hw->hevc_dirty =3D true;
> +		vp9->ucode_loaded =3D false;
> +		vp9->started =3D false;
> +		ret =3D -ETIMEDOUT;
> +	} else {
> +		ret =3D 0;
> +	}

[Severity: High]
There seem to be two issues when aml_vp9_dec_run() fails or times out:

1. Does this leak the DMA buffers in vp9_ws and vp9_slots[]?
   In aml_vp9_exit(), aml_vp9_teardown(vp9->hw) is only called if
   vp9->started is true. However, on timeout here, vp9->started is set to
   false without calling aml_vp9_teardown(). Similarly, if aml_vp9_feed()
   fails on the first frame after aml_vp9_bringup() has allocated vp9_ws,
   aml_vp9_dec_run() returns early before vp9->started is set to true. If
   the user then closes the context, aml_vp9_exit() skips
   aml_vp9_teardown(), leaking vp9_ws.vaddr, vp9_ws.side_vaddr,
   vp9_ws.stream_vaddr, and all 10 vp9_slots[] allocations (as well as
   leaving hvdec_enable(hw) unbalanced on every frame).
2. On timeout, aml_vp9_dec_run() returns -ETIMEDOUT without stopping the
   AMRISC (HEVC_MPSR / HEVC_CPSR), disabling stream fetch
   (HEVC_STREAM_CONTROL), masking HEVC_ASSIST_MBOX0_MASK, or synchronizing
   with hw->hevc_irq. When m2mops_vdec_device_run() sees the error return,
   it immediately completes the CAPTURE buffer with VB2_BUF_STATE_ERROR and
   finishes the job. Can the still-running hardware continue DMA-writing
   into vp9_dw_target_y after the CAPTURE buffer is returned to userspace,
   or raise a late interrupt that calls vp9_finish() a second time?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025192507.2100=
58-1-christian.koever-draxl@student.uibk.ac.at?part=3D8
