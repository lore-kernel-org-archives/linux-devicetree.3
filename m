Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECA3349B1C
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 06:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789712495; cv=none; b=lhcf95wgaxDmyGuG6kxzb49SHD95ZTf/YmcgsuTUkdlLJIrhwHKP5I6iwajtDMVr5AXSrrH84ygIfmmArZGCVZtjSiYIyEaHn+sy9Me/v0iYUrKZMSEQ9U55tBE92c0fRHlHi65uKObFOGDHs9DXZL5RbP8xnr92SVVAPLLJbf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789712495; c=relaxed/simple;
	bh=f+h38T6bWETM/EpEnuCjyRe2CHmBEYmfMuXGLTjosbM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LUzBwvh5l5SS4M0Rgqpr5w5pHawCLiFINDlWnZ/4/ERT5ICzGeyew0/uY9TpCQYIsgJ55TsLJonjcT6IaDShxI7T15FTtIcEMF97vikQ3OSOggXBCXfL4P3MFw+uGn987SSqaWeEN8EB859Oc4ifwF/cYGokUWuKBdoTfaG4/k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KeI3hhrR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KeI3hhrR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58F1D1F000FF;
	Fri, 18 Sep 2026 06:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789712493;
	bh=voiaymzuvc6inf3nGJrtQ9Wrnhcqjkm29bn34peS2/0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KeI3hhrRlm0Tjup6TCqP3AOrnqYw7q0/gsEzSb9BhTF2vvFC5BTfvA1enlvWI6Xhx
	 oW7A/9SyfbxU1TH+expd7VGcuy7SYtIEVqYNz3TNO0jq1GYEi9y3/MDG/9AxU5VLDk
	 Q431Jd7FwFRX1IuZD3vZLGAt8T5yfyrp0GxdNJ7VjpDHycmKirQ6GxQI47qfKNnuRD
	 vB/kwmIcn/wGQmbIaoxM2ZgNZeF1sVK3zc1N7aTpb7mPJa/e+lXl3U7AuwzBaVsFSC
	 TDqfPjIzZ9+yh5zYfRSEUHDjz0+AIq73UoDEekNg6Zemm6JftS2vb19Wiwfp3uSaA7
	 DCksyTBVKOiIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] media: rockchip: Add JPEG decoder driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sascha Hauer" <s.hauer@pengutronix.de>
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org
In-Reply-To: <20260918-rockchip-jpegdec-v4-2-0dd97df47abb@pengutronix.de>
References: <20260918-rockchip-jpegdec-v4-0-0dd97df47abb@pengutronix.de>
 <20260918-rockchip-jpegdec-v4-2-0dd97df47abb@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 06:21:32 +0000
Message-Id: <20260918062133.58F1D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] media: rkjpegd: Use-After-Free and deadlock on device unbind
- [High] media: rkjpegd: Use-After-Free of m2m_dev in IRQ handler during un=
bind
- [High] media: rkjpegd: rkjpegd_has_eoi() falsely rejects valid padded fra=
mes
- [High] media: rkjpegd: watchdog re-arm race during unbind causes Use-Afte=
r-Free
- [Medium] pm: asynchronous runtime PM put canceled during remove causes cl=
ock leak
- [Medium] pm: missing pm_runtime_mark_last_busy() nullifies autosuspend de=
lay
- [Medium] media: rkjpegd: missing hardware soft-reset on errors stalls VPU=
 pipeline
- [Low] v4l2: rkjpegd_enum_framesizes() violates API by returning -ENOTTY
- [Low] media: rkjpegd: DMA side buffers lack explicit little-endian conver=
sion
--

commit 455a15dd0ca95ed7b099c16a178924a772ab8357
Author: Sascha Hauer <s.hauer@pengutronix.de>

media: rockchip: Add JPEG decoder driver

This commit adds a driver for the VDPU720 JPEG hardware decoder found on
various Rockchip SoCs. It implements the V4L2 mem2mem stateful decoder
interface to convert JPEG inputs into NV12 outputs.

> diff --git a/drivers/media/platform/rockchip/rkjpegd/rkjpegd.c b/drivers/=
media/platform/rockchip/rkjpegd/rkjpegd.c
> new file mode 100644
> index 0000000000000..2b0271f1be5a6
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkjpegd/rkjpegd.c
[ ... ]
> +static int rkjpegd_enum_framesizes(struct file *file, void *priv,
> +				   struct v4l2_frmsizeenum *fsize)
> +{
> +	if (fsize->index)
> +		return -EINVAL;
> +
> +	/*
> +	 * Only the coded format has a size userspace gets to pick.  The
> +	 * decoded one follows the bitstream, so there is nothing to enumerate
> +	 * for it, and saying otherwise is actively harmful: a step here
> +	 * describes the sizes that may be asked for, and userspace turns it
> +	 * into a set the visible rectangle then has to be a member of.  The
> +	 * capture buffer is padded to a macroblock, the picture in it is not,
> +	 * so a 1080 line frame would fall outside a set built on a step of 16
> +	 * and could not be negotiated at all.
> +	 */
> +	if (fsize->pixel_format !=3D V4L2_PIX_FMT_JPEG)
> +		return -ENOTTY;

[Severity: Low]
Is it intentional to return -ENOTTY instead of -EINVAL for unsupported form=
ats?

The V4L2 API specifies returning -EINVAL in this case. Returning -ENOTTY
signals that the ioctl itself is completely unsupported, which breaks
capability negotiation for testing tools like v4l2-compliance.

[ ... ]
> +static void rkjpegd_job_finish(struct rkjpegd_ctx *ctx,
> +			       enum vb2_buffer_state state)
> +{
> +	struct rkjpegd_dev *jpegd =3D ctx->dev;
> +
> +	pm_runtime_put_autosuspend(jpegd->dev);

[Severity: Medium]
Does this code nullify the autosuspend delay by missing a call to
pm_runtime_mark_last_busy()?

Without updating the last_busy timestamp before dropping the reference, the=
 PM
core may act on an outdated or zero timestamp and bypass the configured 100=
ms
delay.

> +
> +	rkjpegd_job_finish_no_pm(ctx, state);
> +}
[ ... ]
> +static int vdpu720_write_qtbl(struct rkjpegd_ctx *ctx,
> +			      const struct v4l2_jpeg_header *hdr)
> +{
[ ... ]
> +		/*
> +		 * Reorder zigzag -> raster scan.
> +		 * v4l2_jpeg_zigzag_scan_index[z] =3D raster position of zigzag
> +		 * element z.  JPEG Q-tables are stored in zigzag order; the
> +		 * hardware expects them in natural raster (row-major) order.
> +		 */
> +		for (i =3D 0; i < VDPU720_QTBL_ENTRIES; i++)
> +			dst[v4l2_jpeg_zigzag_scan_index[i]] =3D (u16)qtbl[i];

[Severity: Low]
Do the DMA side buffers require explicit little-endian conversion?

The hardware natively expects these structures in little-endian byte order.
Writing via native u16 assignments will store values in big-endian format
on big-endian hosts, corrupting the decoded images. Using __le16 and
cpu_to_le16() would prevent this.

> +	}
> +
> +	return 0;
> +}
[ ... ]
> +static int vdpu720_write_htbl(struct rkjpegd_ctx *ctx,
> +			      const struct v4l2_jpeg_header *hdr)
> +{
[ ... ]
> +		vdpu720_compute_mincode(dc_bits, min_dc, acc_dc);
> +		vdpu720_compute_mincode(ac_bits, min_ac, acc_ac);
> +
> +		for (i =3D 0; i < 16; i++)
> +			*p_mincode++ =3D min_dc[i];

[Severity: Low]
Does this also need explicit little-endian conversion like the Q-tables abo=
ve?

[ ... ]
> +static irqreturn_t rkjpegd_vdpu720_irq(int irq, void *dev_id)
> +{
[ ... ]
> +	if (!(status & VDPU720_IRQ_RAW))
> +		goto out_put;
> +
> +	rkjpegd_write(jpegd, 0, VDPU720_REG_INT);
> +
> +	state =3D (status & VDPU720_ERR_MASK) ?
> +		VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE;

[Severity: Medium]
If a decode or bus error occurs, is the hardware missing a soft-reset here?

If it's not reset, the VPU might remain wedged. The mem2mem core would then
schedule the next job, writing VDPU720_DEC_E to the hardware, which would
hang and stall the pipeline until the 2-second watchdog fires.

[ ... ]
> +static bool rkjpegd_has_eoi(const void *data, u32 len)
> +{
> +	u8 tail[64];
> +	u32 tail_len, i;
> +
> +	/*
> +	 * v4l2_jpeg_parse_header() stops at the start of scan marker and never
> +	 * looks at the entropy coded data behind it, so a frame truncated
> +	 * because it did not fit the buffer parses without an error.  The
> +	 * hardware would decode as many macroblocks as it finds and hand out a
> +	 * half filled frame indistinguishable from a good one.
> +	 *
> +	 * An end of image marker cannot appear inside the entropy coded data,
> +	 * where 0xff bytes are stuffed, so finding one means the frame is
> +	 * complete.  Only the last few bytes are searched, which covers a
> +	 * payload padded up to a 64 byte boundary and any short trailer.
> +	 * Looking further back is not worth it: the buffer is uncached, so a
> +	 * walk over the whole payload costs one bus transaction per byte, and
> +	 * a payload ending far behind its marker is one whose bytesused was
> +	 * never set, in which case videobuf2 substitutes the full plane length
> +	 * and a recycled buffer holds the previous frame's bytes back there
> +	 * anyway.  The tail is copied out in one memcpy() for the same reason.
> +	 */
> +	tail_len =3D min_t(u32, len, sizeof(tail));
> +	memcpy(tail, data + len - tail_len, tail_len);
> +
> +	for (i =3D 0; i + 1 < tail_len; i++)
> +		if (tail[i] =3D=3D 0xff && tail[i + 1] =3D=3D 0xd9)
> +			return true;
> +
> +	return false;
> +}

[Severity: High]
Does this logic mathematically fail to find the EOI marker when exactly 63
bytes of padding are appended?

If a payload of length N is padded with 63 bytes, the total length becomes
N + 63. The EOI marker's 0xff byte sits at index N - 2. The 64-byte search
window starts at length - 64, which evaluates to N - 1. The 0xff byte falls
completely outside the search window, causing valid frames to be rejected.

[ ... ]
> +static void rkjpegd_remove(struct platform_device *pdev)
> +{
> +	struct rkjpegd_dev *jpegd =3D platform_get_drvdata(pdev);
> +
> +	cancel_delayed_work_sync(&jpegd->watchdog_work);
> +	rkjpegd_v4l2_cleanup(jpegd);
> +	reset_control_assert(jpegd->resets);
> +	pm_runtime_dont_use_autosuspend(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
> +}

[Severity: High]
Does rkjpegd_remove() tear down the device without waiting for userspace fi=
le
descriptors to close or active jobs to finish?

If userspace holds a file descriptor open during unbind, the device structu=
res
will be freed here, and a subsequent close() will cause rkjpegd_release() to
dereference freed memory.

Additionally, rkjpegd_v4l2_cleanup() frees the M2M structure before
reset_control_assert() halts the hardware. If a hardware decode job complet=
es
in this race window, the interrupt fires and rkjpegd_vdpu720_irq() will
dereference the already freed jpegd->m2m_dev.

[Severity: High]
Can a concurrent job re-arm the watchdog after it is canceled?

The M2M framework is active until rkjpegd_v4l2_cleanup() executes, so a
concurrent VIDIOC_QBUF ioctl could schedule a new job, calling
rkjpegd_vdpu720_run() and re-arming the watchdog via schedule_delayed_work(=
).
When the timer fires after the device is freed, it will cause a use-after-f=
ree.

[Severity: Medium]
Could this leak hardware clocks by canceling a pending asynchronous suspend?

When a job completes, rkjpegd_job_finish() calls pm_runtime_put_autosuspend=
().
If unbind happens immediately, pm_runtime_disable() will cancel the pending
autosuspend request, leaving the device stuck in the RPM_ACTIVE state.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-rockchip-j=
pegdec-v4-0-0dd97df47abb@pengutronix.de?part=3D2
