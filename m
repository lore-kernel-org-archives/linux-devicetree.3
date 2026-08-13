Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E87A37EFFB
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 22:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786660442; cv=none; b=dSjJfjYParnC6iNWmFMqVyTp1uQic/hhHD+FCYmSdAmYVJ9yGMip5bcxAb8w9tjU7GRZOFKUA02El8COsAae6+R8M6J7sUGFRP4UYaVVWD6Jmw3nomj3HjV9FUvbH799RxGdkSIXygRgNacJmhS2+69Z/4fDKHcD7nafHYCMnOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786660442; c=relaxed/simple;
	bh=OlmsOOUtNfHRVuuDt7+gL9ew8Fgq2FmZg0tBv6N3XCs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TDRXqesGhurGKOQL2v7zxFNQh0P30QxJQmbIoHzXT2o+exZ+NQ1HIaMDPDJ5aNighwOLD8iU7J45gsYL1gzKpZCAkkruKRPgQhryCxKDZWLBvEeN7BAgaCRpCj7usPIb9CaCoAFJKlJlbwimTgUc1zlh4x1Ca3VAkGN7iWNkylM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lstm19o9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lstm19o9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82DF41F000E9;
	Thu, 13 Aug 2026 22:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786660440;
	bh=2bQGm3zR9Fx2/7g0sMPiE+viKPgVVtEMdeCg4VEir0o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Lstm19o9zu4W/L5Mf5emPN+H7+kDChY4D8KT48OywU2qupztU9BDwlqoTTv/sR4aC
	 2cLqc42b4lZJD/LFIWDL6p5OIfG6yIMwJBRNU7bqZsM8DP7n1ltjGQF1pDJvnZ9cFl
	 pnpbthQnaDImxNehU0HCmtfsCQ686OxzeOa2PhSeMSuErDdfWXvDAV9jhqaIfkCyTO
	 i9NlqKeQSf+9Dn9QlM0/c0F8BUEyzz3jAddPpg0L1Br+FgJfnAWldiKgHnNY7Mh/fv
	 LGg/0F4uJWhScLdEWXNrl2BqcaAgCMDzmzHWtIBRWXaaRQJJES4TruAdIZBHi0eCPm
	 yey86ixthXb5Q==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline
 Processing Engine driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260323125824.211615-3-loic.poulain@oss.qualcomm.com>
References: <20260323125824.211615-3-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 22:33:56 +0000
Message-Id: <20260813223400.82DF41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 15 potential issue=
(s) to consider:
- [Critical] Unprivileged user can trigger a severe DMA out-of-bounds write=
 by matching CAPTURE and OUTPUT formats to a Bayer format.
- [High] Use-after-free of device state on driver unbind due to devm_kzallo=
c and empty video_device release callback.
- [High] Race condition in IRQ handler between Write Engine violation and I=
DLE states causes hardware hangs or hides errors.
- [High] Failing to start streaming leaks V4L2 buffers and permanently elev=
ates interconnect bandwidth and OPP requirements.
- [High] The interrupt handler accesses hardware registers without verifyin=
g the device is powered on, causing a bus crash on spurious interrupts.
- [High] Active DMA buffers are returned to userspace prematurely during st=
op_streaming while the hardware is still performing DMA.
- [High] ope_job_abort writes to hardware registers to trigger a reset afte=
r the device has already been powered off.
- [High] An integer overflow when calculating sizeimage from a user-supplie=
d stride allows a massive out-of-bounds DMA read.
- [High] Missing DMA mask configuration for 32-bit hardware registers.
- [Medium] V4L2 format negotiation ignores requested stride (bytesperline) =
and computes undersized buffers for YUV formats.
- [Medium] Downscaler truncation and missing phase adjustment per stripe ca=
use image tearing and dropped pixels.
- [Medium] S_FMT on the output queue fails to adjust the capture format, al=
lowing unsupported upscaling.
- [Medium] Missing media_device_cleanup() call causes a memory leak of medi=
a framework resources on removal or probe failure.
- [Medium] Software reset during probe will always time out due to unconfig=
ured IRQ mask.
- [Low] Unconditional assignment of &ope_pm_ops lacks the pm_ptr() wrapper,=
 causing dead code when PM is disabled.
--

--- Patch [2]: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Proces=
sing Engine driver ---
commit 8365da77f4126cf158c51c00837bac58f33da60b
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

media: qcom: camss: Add CAMSS Offline Processing Engine driver

This commit introduces a minimal driver for the Qualcomm Offline Processing
Engine (OPE). It provides memory-to-memory hardware block support for image
processing using Fetch and Write Engines. The processing model splits frames
into stripes for efficient pipeline execution.

> diff --git a/drivers/media/platform/qcom/camss/camss-ope.c b/drivers/medi=
a/platform/qcom/camss/camss-ope.c
> new file mode 100644
> index 0000000000000..f45a16437b6db
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-ope.c
> @@ -0,0 +1,2058 @@

[ ... ]

> +static void ope_gen_stripe_yuv_dst(struct ope_ctx *ctx, struct ope_strip=
e *stripe, dma_addr_t dst)
> +{
[ ... ]
> +	stripe->dst[OPE_WR_CLIENT_DISP_Y].addr =3D dst;
> +	stripe->dst[OPE_WR_CLIENT_DISP_Y].x_init =3D x_init;
> +	stripe->dst[OPE_WR_CLIENT_DISP_Y].width =3D width;
> +	stripe->dst[OPE_WR_CLIENT_DISP_Y].height =3D height;
> +	stripe->dst[OPE_WR_CLIENT_DISP_Y].stride =3D img_width;

[Severity: Medium]
Is the userspace-requested stride being ignored here?

In ope_try_fmt(), the requested padded stride is accepted, but sizeimage is
computed using pix_mp->width. Here, the hardware is configured to write
tightly packed data with a stride of img_width, completely ignoring the
negotiated bytesperline.

[ ... ]

> +static void ope_gen_stripe_dsc(struct ope_ctx *ctx, struct ope_stripe *s=
tripe,
> +			       unsigned int h_scale, unsigned int v_scale)
> +{
[ ... ]
> +	dsc_c->output_width =3D DS_OUTPUT_PIX(dsc_c->input_width, 0, h_scale);
> +	dsc_c->output_height =3D DS_OUTPUT_PIX(dsc_c->input_height, 0, v_scale);

[Severity: Medium]
Will this per-stripe output width calculation lose precision?

Since DS_OUTPUT_PIX uses integer division, the fractional remainder is
discarded on each stripe. The phase doesn't appear to be tracked and adjust=
ed
between stripes. Could this result in image tearing and dropped output pixe=
ls?

[ ... ]

> +static irqreturn_t ope_irq(int irq, void *dev_id)
> +{
[ ... ]
> +	if (status & OPE_TOP_IRQ_STATUS_WE)
> +		ope_we_irq(ctx);
> +
> +	if (status & OPE_TOP_IRQ_STATUS_IDLE)
> +		ope_buf_done(ctx);

[Severity: High]
Is there a race condition between the WE (error) and IDLE states?

If both status flags are set, ope_we_irq() initiates an asynchronous softwa=
re
reset via ope_job_abort(). Immediately after, ope_buf_done() might execute =
and
mistakenly complete the job or write a GO command while the hardware is
resetting.

When the reset later completes, ope_job_done() could be called again on the
same job.

[ ... ]

> +static int ope_try_fmt(struct v4l2_format *f, const struct ope_fmt *fmt)
> +{
[ ... ]
> +	if (ope_pix_fmt_is_yuv(pix_mp->pixelformat)) {
> +		stride =3D MAX(pix_mp->width, stride);
> +		size =3D fmt->depth * pix_mp->width / 8 * pix_mp->height;
> +	} else {
> +		stride =3D MAX(pix_mp->width * fmt->depth / 8, stride);
> +		size =3D stride * pix_mp->height;

[Severity: High]
Can the multiplication for size overflow here?

The user-supplied bytesperline is accepted without bounds checking as strid=
e.
If userspace provides a maliciously large stride (like 0x80000001) with a s=
mall
height, this 32-bit multiplication can overflow, resulting in a tiny buffer
allocation.

Later, this massive stride is programmed into the Fetch Engine:

    ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_RD_STRIDE, stripe->src.stride);

Could this instruct the hardware to perform a massive out-of-bounds DMA rea=
d?

[ ... ]

> +static int ope_try_fmt_vid_cap(struct file *file, void *priv,
> +			       struct v4l2_format *f)
> +{
[ ... ]
> +	if (!(fmt->types & MEM2MEM_CAPTURE) && (fmt !=3D ctx->q_data_src.fmt))
> +		return -EINVAL;

[Severity: Critical]
Does bypassing the MEM2MEM_CAPTURE check when fmt =3D=3D ctx->q_data_src.fm=
t allow
unprivileged users to configure the capture queue with a source-only Bayer
format?

If so, sizeimage is calculated at 1 byte per pixel. Later in
ope_gen_stripes(), since ope_pix_fmt_is_yuv() is false for Bayer, it falls
back to ope_gen_stripe_argb_dst(), which programs the Write Engine to output
64-bit ARGB (8 bytes per pixel):

	stripe->dst[OPE_WR_CLIENT_ARGB].stride =3D img_width * 8;
	stripe->dst[OPE_WR_CLIENT_ARGB].format =3D OPE_PACKER_FMT_PLAIN_64;

Could this cause the hardware to write 8 bytes per pixel into a buffer
allocated for only 1 byte per pixel, causing a severe DMA out-of-bounds wri=
te?

[ ... ]

> +static int ope_s_fmt_vid_out(struct file *file, void *priv,
> +			     struct v4l2_format *f)
> +{
> +	struct ope_ctx *ctx =3D file2ctx(file);
> +	int ret;
> +
> +	ret =3D ope_try_fmt_vid_out(file, priv, f);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ope_s_fmt(file2ctx(file), f);

[Severity: Medium]
Does updating the output queue format here need to adjust or validate the
capture queue dimensions?

Since the hardware downscaler doesn't support upscaling, if userspace
configures a large capture format and then uses VIDIOC_S_FMT on the output
queue to set a smaller source format, it seems this updates the source
parameters but doesn't clamp the capture queue dimensions.

[ ... ]

> +static int ope_start_streaming(struct vb2_queue *q, unsigned int count)
> +{
[ ... ]
> +	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
> +		ctx->started =3D true;
> +		ope_adjust_power(ctx->ope);
> +	}
> +
> +	ret =3D pm_runtime_resume_and_get(ctx->ope->dev);
> +	if (ret) {
> +		dev_err(ope->dev, "Could not resume\n");
> +		return ret;
> +	}

[Severity: High]
If pm_runtime_resume_and_get() fails, does this leak V4L2 buffers and leave
the power state permanently elevated?

Returning early on error here skips reverting ctx->started, adjusting the
power down, and returning the queued buffers via v4l2_m2m_buf_done() as
required by the V4L2 API.

[ ... ]

> +static void ope_stop_streaming(struct vb2_queue *q)
> +{
[ ... ]
> +	pm_runtime_put(ctx->ope->dev);

[Severity: High]
Is it safe to drop the PM runtime reference here before job cancellation?

When v4l2_m2m_cancel_job() subsequently calls the driver's ope_job_abort(),=
 it
writes directly to OPE_TOP_RESET_CMD without a pm_runtime_resume_and_get()
guard. Could this lead to a kernel crash by accessing unclocked registers?

> +
> +	for (;;) {
> +		if (V4L2_TYPE_IS_OUTPUT(q->type))
> +			vbuf =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +		else
> +			vbuf =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +		if (vbuf =3D=3D NULL)
> +			return;
> +
> +		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
> +	}

[Severity: High]
Are active DMA buffers being returned to userspace prematurely here?

In ope_device_run(), buffers are fetched via v4l2_m2m_next_src_buf() but not
removed from the internal queues. When streaming is stopped, this loop remo=
ves
all buffers and returns them to userspace.

Since this happens before v4l2_m2m_cancel_job() actually aborts the hardware
operation, could the hardware continue performing DMA writes to buffers that
have already been released to userspace, causing memory corruption?

[ ... ]

> +static int ope_release(struct file *file)
> +{
> +	struct ope_dev *ope =3D video_drvdata(file);
> +	struct ope_ctx *ctx =3D file2ctx(file);
> +
> +	dev_dbg(ope->dev, "Releasing ctx %p\n", ctx);
> +
> +	guard(mutex)(&ope->mutex);

[Severity: High]
Can accessing ope->mutex here cause a use-after-free on driver unbind?

The ope_dev structure is allocated in ope_probe() using devm_kzalloc(), tyi=
ng
its lifetime to the device binding. The video_device embedded within it uses
video_device_release_empty.

If the device is unbound via sysfs while userspace holds the file descriptor
open, ope_remove() completes and devres frees ope_dev. When the file
descriptor is subsequently closed, this function will dereference the freed
ope structure to acquire the mutex.

[ ... ]

> +static int ope_soft_reset(struct ope_dev *ope)
> +{
[ ... ]
> +	ope_write(ope, OPE_TOP_RESET_CMD, OPE_TOP_RESET_CMD_SW);
> +
> +	if (!wait_for_completion_timeout(&ope->reset_complete,
> +					 msecs_to_jiffies(OPE_RESET_TIMEOUT_MS))) {

[Severity: Medium]
Will this wait always time out?

OPE_TOP_IRQ_MASK isn't configured prior to this reset (it is programmed
later in ope_irq_init()). If the hardware defaults to masking all interrupts
on reset, wait_for_completion_timeout() will unconditionally time out and f=
ail
the probe.

[ ... ]

> +static int ope_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret =3D ope_init_power(ope);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Power init failed\n");

[Severity: High]
Does this driver need to configure a 32-bit DMA mask?

The hardware registers are programmed with 32-bit DMA addresses via
writel_relaxed(), but dma_set_mask_and_coherent() doesn't appear to be call=
ed.
On platforms with more than 4GB of memory, the DMA framework might provide
64-bit addresses, which would be silently truncated when written to the
hardware, causing memory corruption or IOMMU faults.

[ ... ]

> +	ret =3D devm_request_irq(dev, irq, ope_irq, IRQF_TRIGGER_RISING, "ope",=
 ope);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Requesting IRQ failed\n");

[Severity: High]
Could a spurious interrupt cause a bus crash here?

The interrupt is registered before the device is powered on with
pm_runtime_resume_and_get(). The device is also routinely suspended when id=
le.

If an interrupt fires while suspended, ope_irq() will unconditionally read
OPE_TOP_IRQ_STATUS. Should it verify the power state using
pm_runtime_get_if_active() before accessing unclocked registers?

[ ... ]

> +static void ope_remove(struct platform_device *pdev)
> +{
> +	struct ope_dev *ope =3D platform_get_drvdata(pdev);
> +
> +	media_device_unregister(&ope->mdev);

[Severity: Medium]
Is a call to media_device_cleanup() missing here and in the probe error pat=
hs?

Without it, media framework internals like the IDA and lists allocated by
media_device_init() might leak upon driver unload or probe failure.

[ ... ]

> +static struct platform_driver ope_driver =3D {
> +	.probe		=3D ope_probe,
> +	.remove		=3D ope_remove,
> +	.driver		=3D {
> +		.name	=3D MEM2MEM_NAME,
> +		.of_match_table =3D ope_dt_ids,
> +		.pm =3D &ope_pm_ops,

[Severity: Low]
Should &ope_pm_ops be wrapped with pm_ptr()?

Assigning it unconditionally creates dead code for the PM callbacks when
CONFIG_PM is disabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260323125824.2116=
15-1-loic.poulain@oss.qualcomm.com?part=3D2
