Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792507219;
	b=j5p76puCOCJXcCfJ3Q1V7R8m+YBNlOnDqZXhNil8DiN8DJMYDxR4RjJadcUf56bVUq2l
	 RqXYgWslnZF+v5aoE/IgKQwgE18DFsEgr/pt4JG4t6eWo/yseDIPYTbarfY5IbQR20irh
	 ul0UtQnhmmNvC25P4ycEnxd2qyQcEpGBdOY78dWynNgPDaDuyYrA8QS4LByvVU4yJBfR0
	 CPF7cPLuH5cru/wAZBMHQLQ7/TSNrE5nqxoV1pQe3NMioVYFAWJu+Bwly6hHPfFN+pDhU
	 +ZcTLmhCfVkO57KsZ68WndW4JPnsm6udXxEGR63rBoCyZqpmKQyqFlg42o495m6/fxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792507219;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bV3EG3t+jix2WDDptxZUopP1qrkVhSXIwiOD21oUDhs=;
	b=jNKTefvN/oCKZHPtkR/UOZJJ6YUsLHugpVCD42fAKFs05sNlvPDD5QSbe56j7/bRN6TI
	 IAOs0rbW7QFp2Rkvo7xmHVInehImor8c5p+B0kWaMwJaNII44UQwmuH6XA8czoYoCQbCH
	 YQMUYNCH1BZeHjq+lE7RE51dXm7aGHHG15ketb+O7aRVSQZwbZalb31nb3Y/C2LvEred4
	 +YUOzo51ZmL9GHF7Vu2Q0Uc95/tTMdbBNK/Ww8pyfZtFfiCtsJyl9kT3eY8eyxFcbu2If
	 l+HvBYnpDFIWp0qTa6/72j2zIdP8nYB7JpEAcbnC1TszYANK/v9x6I3Zu6VhoL3WWPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S9D8MjHI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F59606A31C
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 14:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S9D8MjHI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C254F1F000C4;
	Tue, 20 Oct 2026 14:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792507219;
	bh=bV3EG3t+jix2WDDptxZUopP1qrkVhSXIwiOD21oUDhs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S9D8MjHIVUTUe8QTU6XTxceIilspN+5PIHjCD9+fKo6u6orUpXTBXywfG0V0Z+DXF
	 GyU4PmOWfpLoZR+Kh/h77CTZPT4M+51K3bopdGV/x5poryeo0WF8yT0HmCpWj4LMu/
	 Ul1snuNx2FvZW79T2ta84wI4cRCpt930Y8oSG2jP/JCjDy9WPemT+yve9WI6AFN65Q
	 EtkBQaZ5tHAbBNrqktb5VGo15MwLYzgkrfqfQ4fjrxvlbbaZRoGa0LWyppajMduFq3
	 ZnY+iuJHZj6uwh0cc1/Dv6IDcRfkMsT2AHLiBUKlldWqJSxZQ1xSyTijrx0R901dTy
	 w/ZFNUMJYouNQ==
Message-ID: <sashiko-outbox-179178@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 16/17] arm64: dts: apple: t6030: add avd nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sofus Forstreuter" <sofus.c@icloud.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261020-avd-v3-16-85cbaa2125d8@icloud.com>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
 <20261020-avd-v3-16-85cbaa2125d8@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 14:40:18 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] media: apple: avd: missing frame parameter validation in avd_a=
v1_run()
- [High] media: apple: avd: out-of-bounds access in avd_h264_realloc_slices=
() and avd_h264_run()
- [High] media: apple: avd: missing vb2_plane_vaddr() NULL checks in VP9 an=
d AV1
- [High] media: apple: avd: IRQ/watchdog race and lifecycle bugs in avd-drv=
.c
- [Low] arm64: dts: apple: undocumented apple,t6030-dart compatible in t603=
0.dtsi
--

commit 9b154ea927f0743f0c2465c6faf3859e38c47d5c
Author: Sofus Forstreuter <sofus.c@icloud.com>

arm64: dts: apple: t6030: add avd nodes

This commit adds the Apple Video Decoder (AVD) and its associated DART
IOMMU nodes to the Apple T6030 device tree.

> diff --git a/arch/arm64/boot/dts/apple/t6030.dtsi b/arch/arm64/boot/dts/a=
pple/t6030.dtsi
> index dda9568af11f9..805042bd9270d 100644
> --- a/arch/arm64/boot/dts/apple/t6030.dtsi
> +++ b/arch/arm64/boot/dts/apple/t6030.dtsi
> @@ -361,6 +361,38 @@ pmgr_gfx: power-management@290e80000 {
>  			/* child nodes are added in t6030-pmgr.dtsi */
>  		};
> =20
> +		avd_dart: iommu@30b010000 {
> +			compatible =3D "apple,t6030-dart", "apple,t8110-dart";

[Severity: Low]
Should "apple,t6030-dart" be documented in
Documentation/devicetree/bindings/iommu/apple,dart.yaml before adding it
here?

Currently, properties:compatible in apple,dart.yaml only permits:

  compatible:
    oneOf:
      - enum:
          - apple,t8103-dart
          - apple,t8103-usb4-dart
          - apple,t8110-dart
          - apple,t6000-dart
      - items:
          - const: apple,t6020-dart
          - const: apple,t8110-dart

Does running make dtbs_check on t6030-j514s.dtb and t6030-j516s.dtb fail
schema validation on /soc/iommu@30b010000 without a corresponding binding
update?

> +			reg =3D <0x3 0x0b010000 0x0 0x4000>;
> +			interrupt-parent =3D <&aic>;
> +			interrupts =3D <AIC_IRQ 795 IRQ_TYPE_LEVEL_HIGH>;
> +			#iommu-cells =3D <1>;
> +			power-domains =3D <&ps_avd_sys>;
> +		};
> +
> +		video-codec@30b070000 {
> +			compatible =3D "apple,t6030-avd", "apple,t8122-avd";

[Severity: Critical]
Enabling video-codec@30b070000 with compatible "apple,t8122-avd" exposes
the AV1 decoder path in drivers/media/platform/apple/avd/avd-av1.c via
avd_device_run() -> avd_av1_run(). Since neither validate_av1_frame() in
drivers/media/v4l2-core/v4l2-ctrls-core.c nor avd_av1_try_ctrl() validates
ref_frame_idx, primary_ref_frame, upscaled_width, frame_width_minus_1, or
frame_height_minus_1 from V4L2_CID_STATELESS_AV1_FRAME, can userspace
trigger out-of-bounds memory accesses and divide-by-zero errors here?

Specifically:

1. In set_ref_hdr() in drivers/media/platform/apple/avd/avd-av1.c:

	for (i =3D 0; i < 6; i++) {
		for (j =3D i + 1; j < 7; j++) {
			if (frame->reference_frame_ts[frame->ref_frame_idx[i]] =3D=3D
			    frame->reference_frame_ts[frame->ref_frame_idx[j]]) {
				ref_slots[j] =3D ref_slots[i];
				break;
			}
		}
	}

Since frame->ref_frame_idx[i] is an unvalidated __s8, can a negative value
or a value >=3D 8 read out of bounds of the 8-element
frame->reference_frame_ts[] array?

2. In avd_av1_get_ref_buf() in drivers/media/platform/apple/avd/avd-av1.c:

	if (idx < 0 || idx >=3D V4L2_AV1_TOTAL_REFS_PER_FRAME ||
	    frame->ref_frame_idx[idx] >=3D ARRAY_SIZE(frame->reference_frame_ts))
		ts =3D -1;
	else
		ts =3D frame->reference_frame_ts[frame->ref_frame_idx[idx]];

frame->ref_frame_idx has V4L2_AV1_REFS_PER_FRAME (7) elements, whereas
V4L2_AV1_TOTAL_REFS_PER_FRAME is 8. If avd_av1_set_prob() passes
run->frame->primary_ref_frame (which is only checked for =3D=3D 7 rather th=
an
>=3D V4L2_AV1_REFS_PER_FRAME), or if idx is 7, doesn't this read
frame->ref_frame_idx[7] out of bounds, or allow a negative
frame->ref_frame_idx[idx] to underflow frame->reference_frame_ts[]?

3. In set_header() -> calc_upscale() in
drivers/media/platform/apple/avd/avd-av1.c:

	downscaled_plane_w =3D AV1_DIV_ROUND_UP_POW2(frame_width, sub_x);
	upscaled_plane_w =3D AV1_DIV_ROUND_UP_POW2(upscaled_width, sub_x);
	*step_x =3D ((downscaled_plane_w << SUPERRES_SCALE_BITS) +
		   (upscaled_plane_w / 2)) /
		  upscaled_plane_w;

Can an unvalidated frame->upscaled_width =3D=3D 0 cause upscaled_plane_w to=
 be
0 and trigger a divide-by-zero? Similarly, in set_refs(), can
frame->frame_width_minus_1 =3D=3D 0xffffffff or
frame->frame_height_minus_1 =3D=3D 0xffffffff wrap width or height to 0 when
adding 1 and divide by zero?

4. In update_dec_buf_info() and avd_av1_set_prob() in
drivers/media/platform/apple/avd/avd-av1.c:

	memcpy(vb2_plane_vaddr(&dst->base.vb.vb2_buf, 0) +
		       AVD_AV1_CDFS_OFFSET(dst->base.vb.vb2_buf.planes[0].length,
					   dst->av1.color_size),
	       av1_ctx->bufs.probs.cpu, sizeof(struct avd_av1_cdfs));

dst->av1.color_size is calculated from frame_width_minus_1 + 1 and
frame_height_minus_1 + 1 without checking that they fit within the capture
format dimensions in ctx->decoded_fmt.fmt.pix_mp or
dst->base.vb.vb2_buf.planes[0].length. If dst->av1.color_size exceeds the
plane length, doesn't AVD_AV1_CDFS_OFFSET() underflow and cause memcpy() to
write before the start of the buffer?

[Severity: High]
Also in the H.264 decoder path enabled by this node (via
v4l2_m2m_request_queue() -> avd_device_run() -> avd_h264_run() in
drivers/media/platform/apple/avd/avd-h264.c), can slice reallocation and
error handling access memory out of bounds?

In avd_h264_realloc_slices():

	h264_ctx->alloc_slice_num =3D alloc_slice_num;
	memcpy(h264_ctx->slices, tmp,
	       sizeof(*h264_ctx->slices) * h264_ctx->slice_num);
	kfree(tmp);

	/* we could already have the correct size */
	if ((alloc_slice_num + 1) * sizeof(*job->segments) < job->buf.size)
		return 0;

	ret =3D avd_buf_alloc(ctx->dev, &tmp_buf,
			   (alloc_slice_num + 1) * sizeof(*job->segments));
	if (ret)
		return -ENOMEM;

	job->segments =3D tmp_buf.cpu;
	job->num_alloc =3D (alloc_slice_num + 1);
	memset(tmp_buf.cpu, 0, tmp_buf.size);
	memcpy(job->segments, job->buf.cpu,
	       sizeof(*job->segments) * (job->num + 1));

1. On the first slice of a frame, avd_init_job() allocates
job->num_alloc =3D h264_ctx->alloc_slice_num + 1 segments, and
avd_end_segment() increments job->num for the stream header and for each
slice. When h264_ctx->slice_num reaches h264_ctx->alloc_slice_num, job->num
is already equal to the old job->num_alloc (alloc_slice_num + 1). Doesn't
copying sizeof(*job->segments) * (job->num + 1) bytes read one
struct avd_segment past the end of job->buf.cpu?

2. Since h264_ctx->alloc_slice_num is updated before the early return and
before avd_buf_alloc(), if the early return is taken (without updating
job->num_alloc) or if avd_buf_alloc() fails with -ENOMEM, won't
h264_ctx->alloc_slice_num remain enlarged while job->segments and
job->num_alloc stay at their old capacity, causing subsequent slices to
skip reallocation and write out of bounds on job->segments?

3. In avd_h264_run(), avd_h264_realloc_slices() is only called when
ctx->job.segments is non-NULL, yet h264_ctx->slices[h264_ctx->slice_num] is
written and h264_ctx->slice_num is incremented before checking
is_new_frame(run.slice_params) and !ctx->job.segments:

	if (ctx->job.segments &&
	    h264_ctx->slice_num >=3D h264_ctx->alloc_slice_num) {
		ret =3D avd_h264_realloc_slices(ctx);
		if (ret)
			goto postamble;
	}

	h264_ctx->active_slice =3D &h264_ctx->slices[h264_ctx->slice_num];
	ret =3D avd_buf_alloc(ctx->dev, h264_ctx->active_slice,
			    vb2_get_plane_payload(&src->vb2_buf, 0));
	if (ret)
		goto postamble;

	memcpy(h264_ctx->active_slice->cpu, slice,
	       h264_ctx->active_slice->size);
	h264_ctx->slice_num++;

If userspace queues slices with first_mb_in_slice !=3D 0 and
V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF set while ctx->job.segments is NULL,
avd_h264_run() returns -EINVAL and avd_h264_done() skips resetting
h264_ctx->slice_num because V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF is set. Can
repeatedly queueing such buffers increment h264_ctx->slice_num past
h264_ctx->alloc_slice_num without reallocating h264_ctx->slices[]? Also,
should avd_h264_stop() clear ctx->job.segments =3D NULL on streamoff?

[Severity: High]
In avd_queue_init() in drivers/media/platform/apple/avd/avd-drv.c, both
src_vq and dst_vq enable VB2_DMABUF with vb2_dma_contig_memops. Unlike
avd_h264_run(), which checks the return value of vb2_plane_vaddr() for
NULL, the VP9 and AV1 paths enabled by "apple,t8122-avd" do not check
vb2_plane_vaddr() before dereferencing it:

In avd_vp9_run() -> set_tiles() in
drivers/media/platform/apple/avd/avd-vp9.c:

	const u8 *data =3D vb2_plane_vaddr(&src->vb2_buf, 0);
	...
				tile_size =3D get_unaligned_be32(&data[offset]);

And in avd_av1_run() -> avd_av1_set_prob() in
drivers/media/platform/apple/avd/avd-av1.c:

		memcpy(av1_ctx->bufs.probs.cpu,
		       vb2_plane_vaddr(&ref->base.vb.vb2_buf, 0) +
			       AVD_AV1_CDFS_OFFSET(
				       ref->base.vb.vb2_buf.planes[0].length,
				       ref->av1.color_size),
		       sizeof(struct avd_av1_cdfs));
	}

	/*
	 * AVD writes nothing when DISABLE_FRAME_END_UPDATE_CDF is
	 * enabled
	 */
	memcpy(vb2_plane_vaddr(&dst->base.vb.vb2_buf, 0) +
		       AVD_AV1_CDFS_OFFSET(dst->base.vb.vb2_buf.planes[0].length,
					   dst->av1.color_size),
	       av1_ctx->bufs.probs.cpu, sizeof(struct avd_av1_cdfs));

If an imported DMABUF fails dma_buf_vmap_unlocked() in vb2_plane_vaddr()
and returns NULL, won't these dereference a NULL pointer + offset?

[Severity: High]
Finally, in drivers/media/platform/apple/avd/avd-drv.c (bound via this
video-codec@30b070000 node), there appear to be a few concurrency and
lifecycle issues:

1. In avd_watchdog_func():

	writel(0, avd->mbox + AVD_REG_MBOX_IRQ_ENABLE);
	ret =3D avd_reset(avd);
	if (ret)
		dev_err(avd->dev, "failed to reset: %d", ret);

	avd_job_finish(ctx, VB2_BUF_STATE_ERROR);

And in avd_irq_handler():

	static irqreturn_t avd_irq_handler(int irq, void *data)
	{
		struct avd_dev *avd =3D data;
		struct avd_ctx *ctx =3D v4l2_m2m_get_curr_priv(avd->m2m_dev);

Can avd_watchdog_func() race with a concurrently running or pending
threaded avd_irq_handler()? Without synchronizing the IRQ before calling
avd_reset() and avd_job_finish(), if avd_job_finish() starts the next
queued M2M job and re-arms watchdog_work, couldn't the in-flight
avd_irq_handler() look up the newly started job via
v4l2_m2m_get_curr_priv(avd->m2m_dev), cancel its watchdog, and prematurely
finish it?

2. In avd_probe(), devm_request_threaded_irq() registers avd_irq_handler()
before avd_v4l2_init() allocates avd->m2m_dev, and in avd_remove(),
avd_v4l2_cleanup() frees avd->m2m_dev via v4l2_m2m_release() before the
IRQ is freed. If an interrupt fires during probe or remove, won't
v4l2_m2m_get_curr_priv(avd->m2m_dev) in avd_irq_handler() dereference a
NULL or freed avd->m2m_dev?

3. In avd_boot():

	memcpy_toio(avd->code, avd->fw->data, avd->fw->size);

	writel_relaxed(AVD_MBOX_ENABLE, avd->mbox + AVD_REG_MBOX1_STATUS);
	writel_relaxed(AVD_MBOX_ENABLE, avd->mbox + AVD_REG_MBOX0_STATUS);
	writel_relaxed(AVD_MBOX0_NOT_EMPTY,
		       avd->mbox + AVD_REG_MBOX_IRQ_ENABLE);
	writel_relaxed(AVD_RUN_CTRL_UNK_RUN, avd->mbox + AVD_REG_RUN_CTRL);

	/* wait for cm3 to boot */
	ret =3D readl_poll_timeout(avd->mbox + AVD_REG_FLAG0_SET, val, val =3D=3D =
1,
				 10, 10000);
	if (ret)
		return ret;

	memcpy_fromio(version, avd->sram, sizeof(version));
	dev_info_once(avd->dev, "fw version: %s\n", version);

Should avd_boot() verify that avd->fw->size does not exceed the "code"
region size (0x10000 in this DT node) before memcpy_toio(), use writel()
instead of writel_relaxed() when writing AVD_RUN_CTRL_UNK_RUN so the
firmware copy is ordered before starting the coprocessor, and ensure
version is NUL-terminated before printing it with %s?

4. In avd_open():

	v4l2_fh_init(&ctx->fh, video_devdata(filp));

	ctx->fh.m2m_ctx =3D v4l2_m2m_ctx_init(avd->m2m_dev, ctx, avd_queue_init);
	if (IS_ERR(ctx->fh.m2m_ctx)) {
		ret =3D PTR_ERR(ctx->fh.m2m_ctx);
		goto err_free_ctx;
	}

	ret =3D avd_init_ctrls(ctx);
	if (ret)
		goto err_cleanup_m2m_ctx;

Should the err_cleanup_m2m_ctx and err_free_ctx error paths call
v4l2_fh_exit(&ctx->fh) before freeing ctx?

> +			reg =3D <0x3 0x0b070000 0x0 0x4000>,
> +			      <0x3 0x0b080000 0x0 0x10000>,
> +			      <0x3 0x0b090000 0x0 0x14000>,
> +			      <0x3 0x0b0a4000 0x0 0x4000>,
> +			      <0x3 0x0b100000 0x0 0x10000>;
> +			reg-names =3D "piodma", "code", "sram", "mbox", "ctrl";

[ ... ]

> +		};
> +
>  		pinctrl_ap: pinctrl@347100000 {

[ ... ]

=E2=80=94
=F0=9F=A4=96 Generated by Linux Kernel Patch Review Bot
Christina Quast <contact@ayrton.dev>
Based on prompts at https://github.com/masoncl/review-prompts

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-avd-v3-0-8=
5cbaa2125d8@icloud.com?part=3D16
