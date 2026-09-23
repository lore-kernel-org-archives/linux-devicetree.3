Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C21753CA71
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 16:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790180819; cv=none; b=tzEShbTWOP3BmygtN38eip8x+Bfi8y3L9tCjDnDH1PQEY3ChftfUSnC7SeuhDj1PvqVfeLTdZyciBPlDDzMlsbpxyuJNxLtGqBlr+spx72z/lDGquItwMXRQ483Hd+WU1o6nI0Hgn7A1BMepH7vuHzC9UGAZtl+bcl20fMgh+lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790180819; c=relaxed/simple;
	bh=6mWaZ/+KOAjE5M6nCBLcLVFyhfLVZY+0M4DKJJZ3eog=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PZS2SjDv93x7NAp2KnfPyWKnUNqCLMsDpP4pOFMug9OKFk+ECrMgqj1GqPY+Z684IhMIB3a38qUtoOcrZ6wWcY0ki7rPD/Togsy+1pWiWyKIZpS7H2el1a8rQjS8nMxpG2DiEWTIKlKXi6gMU/c/WO3eKIvQlx0XPzFO6kNN2pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dpCLb7CC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dpCLb7CC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FE411F00893;
	Wed, 23 Sep 2026 16:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790180816;
	bh=YIUE9V8/G3pD8VZFVM0Xu3SDsK12/OqC0i9gcfYit9A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dpCLb7CC+F9b/l92eRNuVxk8afad+Ay87RfcoA/paC147WCGL7ZjvlGSZKMmxSR7D
	 Fs7bGArzTmnAG4+30Q961a+SFDHei7PiSDsMlhy/5CShMAoaFHBcza5c9PFBNVEh1l
	 YcdQjQ2xEObxeErPTCgF8caXgsIIRwOXSoPYvzgcuXtGFC+S1/U+04bIiYTSCBSxPv
	 tC4o+0bqJZScvA6swhYi1L3bv7bD0/vmYymqjuGv/pcON4emZmQrSnYx5Rn5vJ4ow6
	 VVp3egob7Hb2/zntqwI2cfi90JzMhvigwszySFHMK/oMXp/OoUIQdbAjat8xK5q956
	 JgIcnvUvsswBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 6/9] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260923-camss-isp-ope-v9-6-86a75dc18b83@oss.qualcomm.com>
References: <20260923-camss-isp-ope-v9-0-86a75dc18b83@oss.qualcomm.com>
 <20260923-camss-isp-ope-v9-6-86a75dc18b83@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 16:26:56 +0000
Message-Id: <20260923162656.8FE411F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [Critical] media: memory corruption via active crop/compose modification =
during streaming
- [High] pm: hardware power leak due to async pm_runtime_put() in stop_stre=
aming
- [High] media: out-of-bounds DMA stride due to incorrect clamp and align o=
rdering
- [High] media: image size violation due to invalid scaler output pixel cal=
culation
- [High] media: dead queue caused by lockless destruction of shared run_work
- [Medium] media: registration race exposes incomplete media graph to users=
pace
- [Medium] media: data race on Gamma LUT cache state during context destruc=
tion
- [Low] media: build failure when CONFIG_MEDIA_CONTROLLER is disabled
--

commit 22118f1287a95c24fecdb6655e65ff6e1e0a42f2
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: media: qcom: camss: Add CAMSS Offline Processing Engine driver

Adds an image processing driver for the Qualcomm Offline Processing Engine
(OPE), an ISP block converting raw Bayer frames to YUV. Exposes three video
nodes per pipeline instance.

Link: https://github.com/jwrdegoede/libcamera/commits/camss_pipeline_v2.1/
Link: https://github.com/loicpoulain/camss-isp-m2m-test

> diff --git a/drivers/media/platform/qcom/camss/ope/core.c b/drivers/media=
/platform/qcom/camss/ope/core.c
> --- a/drivers/media/platform/qcom/camss/ope/core.c
> +++ b/drivers/media/platform/qcom/camss/ope/core.c
[ ... ]
> +static unsigned int ope_calc_h_scale(unsigned int src, unsigned int dst,
> +				     unsigned int nstripes, unsigned int c_hsub,
> +				     unsigned int sw_align)
> +{
[ ... ]
> +	/* Find the smallest h_scale denominator >=3D dst such that the
> +	 * last-stripe adjustment can satisfy both Y and C pixel counts.
> +	 */
> +	for (denom =3D dst; denom <=3D dst + 16 * nstripes; denom++) {
> +		unsigned int hs =3D DS_Q21(src, denom);
> +		unsigned int tw =3D (nstripes - 1) * DS_OUTPUT_PIX(OPE_STRIPE_MAX_W, 0=
, hs);

[Severity: High]
Does this calculate the total output pixels correctly?=20

It looks like the calculation assumes all non-final stripes are exactly=20
OPE_STRIPE_MAX_W pixels wide. However, ope_gen_stripes() might reduce the=20
actual penultimate stripe width to satisfy the minimum width requirement fo=
r=20
the final stripe.=20

If the penultimate stripe is shrunk, would this cause a mismatch in the=20
output pixel count and trigger an OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0_IMG_SZ_V=
IOL=20
hardware image size violation?

[ ... ]
> +static void ope_gen_stripes(struct ope_ctx *ctx, dma_addr_t src, dma_add=
r_t dst)
> +{
[ ... ]
> +		stripe->src.pattern =3D src_hw ? src_hw->pattern : 0;
> +		stripe->src.format =3D src_hw ? src_hw->unpacker : 0;
> +
> +		/* Ensure last stripe is wide enough */
> +		if (width > OPE_STRIPE_MAX_W && width < OPE_STRIPE_MAX_W + OPE_STRIPE_=
MIN_W)
> +			stripe->src.width -=3D OPE_STRIPE_MIN_W * 2;

[Severity: High]
This appears to be the location where the penultimate stripe width is reduc=
ed.

Should the scaling coefficient calculator be updated to account for this=20
reduction so we don't encounter the image size constraint violation at=20
runtime?

[ ... ]
> +static void ope_sched_cancel(struct ope_ctx *ctx)
> +{
> +	struct ope_dev *ope =3D ctx->ope;
> +	bool running;
> +
> +	disable_work_sync(&ope->run_work);

[Severity: High]
Could this disable_work_sync() cause a deadlock if called locklessly during=
=20
context destruction?=20

If another process concurrently opens the device and starts streaming, its=
=20
call to schedule_work() might get silently dropped because the globally sha=
red=20
work item is disabled here. When the workqueue is later re-enabled, the=20
dropped jobs wouldn't be restarted, potentially leaving the new stream=20
permanently stalled.

[ ... ]
> +static const struct ope_fmt *ope_fmt_try(struct ope_dev *ope, bool is_ou=
tput,
> +					 struct v4l2_pix_format_mplane *pix)
> +{
[ ... ]
> +	if (is_output && fmt->fourcc !=3D V4L2_PIX_FMT_GREY)
> +		align =3D 8 * fmt->c_hsub;
> +	else
> +		align =3D 1;
> +
> +	bytesperline =3D min(bytesperline, ALIGN_DOWN(OPE_MAX_STRIDE, align));
> +	bytesperline =3D ALIGN(bytesperline, align);

[Severity: High]
Is the order of clamping and alignment correct here?=20

If bytesperline is clamped to ALIGN_DOWN(OPE_MAX_STRIDE, align) and happens=
=20
to not be a multiple of the alignment, the subsequent ALIGN() operation wil=
l=20
round it up.=20

Could this cause the final bytesperline to exceed OPE_MAX_STRIDE, resulting=
=20
in an out-of-bounds DMA transfer when the hardware stride register is=20
programmed?

[ ... ]
> +static void ope_prog_gamma(struct ope_ctx *ctx, bool force)
> +{
[ ... ]
> +	} else {
> +		/* Dirty, or miss in both banks: upload into the LRU bank. */
> +		bank =3D !ope->glut_mru_bank;
> +		ope_glut_upload(ctx, bank);
> +	}
> +
> +	ope->glut_mru_bank =3D bank;

[Severity: Medium]
Is it safe to update the global gamma LUT cache state here while=20
ope_ctx_destroy() might be concurrently invalidating the cache locklessly?=
=20

It looks like ope_glut_cache_invalidate() modifies the current and MRU bank=
=20
variables without a lock, which could race with this assignment and lead to=
=20
incorrect hardware bank selection for concurrent streams.

[ ... ]
> +static void ope_stop_streaming(struct vb2_queue *q)
> +{
[ ... ]
> +	ope_sched_cancel(ctx);
> +	ope_queue_drain(ctx, idx, VB2_BUF_STATE_ERROR);
> +	ope_sched_resume(ctx);
> +
> +	pm_runtime_put(ctx->ope->dev);

[Severity: High]
Does this asynchronous pm_runtime_put() leave the device vulnerable to a=20
power leak during driver unbind?=20

If userspace stops the stream or closes the device, and the device is=20
immediately unbound, the devres cleanup will call pm_runtime_disable(). Thi=
s=20
cancels any pending async suspend requests, leaving the power domains and=20
clocks permanently enabled.=20

Should this be pm_runtime_put_sync() instead?

[ ... ]
> +static int ope_proc_set_fmt(struct v4l2_subdev *sd,
> +			    struct v4l2_subdev_state *state,
> +			    struct v4l2_subdev_format *fmt)
> +{
> +	if (fmt->pad =3D=3D OPE_PROC_PAD_SINK_PAR)
> +		return v4l2_subdev_get_fmt(sd, state, fmt);
> +
> +	if (fmt->pad =3D=3D OPE_PROC_PAD_SINK_IN) {
> +		ope_proc_set_sink_fmt(state, &fmt->format);
> +		return 0;
> +	}

[Severity: Critical]
Can the active format be changed here while the pipeline is currently=20
streaming?=20

If userspace dynamically increases the format size during an active stream,=
=20
ope_run_work() might fetch this new active state using=20
v4l2_subdev_lock_and_get_active_state() without validating it against the=20
previously allocated DMA buffer size. This could result in the hardware=20
writing past the end of the DMA buffer.

[ ... ]
> +static int ope_proc_set_selection(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state,
> +				  struct v4l2_subdev_selection *sel)
> +{
> +	if (sel->pad =3D=3D OPE_PROC_PAD_SINK_IN) {
> +		if (sel->target !=3D V4L2_SEL_TGT_CROP)
> +			return -EINVAL;
> +		ope_proc_set_sink_crop(state, &sel->r);
> +		return 0;
> +	}

[Severity: Critical]
Similar to the format change above, can this active crop rectangle be=20
modified mid-stream?=20

Altering the crop size during streaming might increase the active compose=20
size beyond what the video node buffer was allocated for, potentially causi=
ng=20
memory corruption.

[ ... ]
> +static void ope_ctx_destroy(struct ope_ctx *ctx)
> +{
[ ... ]
> +	ope_sched_resume(ctx);
> +
> +	/* Do not leave the LUT cache pointing at a context about to be freed */
> +	ope_glut_cache_invalidate(ctx->ope);

[Severity: Medium]
As mentioned earlier, mutating the global cache state here without holding=
=20
any locks seems to race against other contexts running ope_prog_gamma().=20

Could this cause incorrect gamma LUT application for concurrent streams?

[ ... ]
> +static int ope_release(struct file *file)
> +{
[ ... ]
> +	scoped_guard(mutex, &ope->mutex) {
> +		if (--ope->open_count !=3D 0)
> +			return 0;
> +		ope->shared_ctx =3D NULL;
> +		scoped_guard(spinlock, &ope->ctx_lock)
> +			list_del(&ctx->list);
> +	}
> +
> +	ope_ctx_destroy(ctx);

[Severity: High]
Calling ope_ctx_destroy() outside of the main device mutex appears to be=20
what leads to the lockless workqueue disable and LUT cache invalidation=20
races described above.=20

Is there a reason context destruction is performed concurrently rather than=
=20
under the mutex?

[ ... ]
> +static int ope_v4l2_register(struct ope_dev *ope)
> +{
[ ... ]
> +	ret =3D v4l2_device_register(ope->dev, &ope->v4l2_dev);
> +	if (ret) {
> +		/* No v4l2_device reference exists yet, so release @ope directly */
> +		ope_v4l2_dev_release(&ope->v4l2_dev);
> +		return ret;
> +	}
> +
> +	ret =3D media_device_register(&ope->mdev);
> +	if (ret)
> +		goto err_v4l2;
> +
> +	ope->pipeline =3D camss_isp_pipeline_alloc(OPE_ENTITY_COUNT);

[Severity: Medium]
Is the media device being registered and exposed to userspace too early?=20

It looks like media_device_register() is called before the pipeline entitie=
s=20
are allocated and the internal subdev links are created via=20
media_create_pad_link(). If udev triggers an application launch upon device=
=20
creation, the application might fail because the media graph is incomplete.

[ ... ]
> +static void ope_remove(struct platform_device *pdev)
> +{
> +	struct ope_dev *ope =3D platform_get_drvdata(pdev);
> +
> +	disable_irq(ope->irq);
> +	ope_unregister(ope);
> +}

[Severity: High]
Does this remove path safely handle device suspension?=20

Because the stop_streaming path uses an asynchronous pm_runtime_put(),=20
removing the driver immediately without explicitly forcing the device to=20
suspend might disable devres PM before the async suspend completes, causing=
=20
a power leak.

> diff --git a/drivers/media/platform/qcom/camss/ope/pipeline.c b/drivers/m=
edia/platform/qcom/camss/ope/pipeline.c
> --- a/drivers/media/platform/qcom/camss/ope/pipeline.c
> +++ b/drivers/media/platform/qcom/camss/ope/pipeline.c
> @@ ... @@
> +#if !IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
> +static inline int media_entity_pads_init(struct media_entity *e, u16 n,
> +					 struct media_pad *p) { return 0; }
> +static inline void media_entity_remove_links(struct media_entity *e) {}
> +static inline int media_create_pad_link(struct media_entity *src, u16 sp,
> +					struct media_entity *sink, u16 dp,
> +					u32 flags) { return 0; }
> +#endif

[Severity: Low]
Does this cause a compilation error when CONFIG_MEDIA_CONTROLLER is disable=
d?=20

The function media_entity_pads_init() is already unconditionally declared a=
s=20
a non-static function in include/media/media-entity.h. Providing a static=20
inline fallback here creates a static vs non-static declaration conflict.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-camss-isp-=
ope-v9-0-86a75dc18b83@oss.qualcomm.com?part=3D6
