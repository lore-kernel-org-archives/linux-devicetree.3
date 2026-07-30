Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2010E380FFE
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 07:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785397209; cv=none; b=i0PVIb5acMUTtT01R3EPoFjugnTqS1pfzPOfZMLmcegw+7LvEKTOelv1VjvIXSRQQgFBO+fjeBpXqKqAosB2j3XXENGiRA8SFR0u+0rC66Y50FpCli6uK0rSUQgO5dmxrGwIUuPVx3MSLUph9YRhuQH4gGCNIiuTb4rTgoXBoY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785397209; c=relaxed/simple;
	bh=Po9WUBNS8RsR3rZoT/Z3rKXwsPzyPNMmaoQWG1w9wMM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ANpfjTC//nVoj2yb0PYknThRNcOBdletTjJSeVZtQ7KPqiII0YpXdEQ1AjkYu3Nt0ClBqKa6kvR5DZsAzOTzJD/j9RtK9xz/+z6uj6APGCQOqXHIenx6KxTE/ZWQLbznMVtiTwwTchZD2KccB78jUF9ffhdJoOQ3n/96rohpju4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VpN3w/j0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VpN3w/j0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3930D1F00A3A;
	Thu, 30 Jul 2026 07:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785397207;
	bh=aIVY5roWp80WT6cxxRzgcuBzSWlZLMTNn0ySiSmqYXw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VpN3w/j0TLCexct5uHnzxutWekyu9c82hE78E7KOot3KQm0gdzXIJtUdQhAorw8r9
	 jnr0vm9DpH2WiygOD2x2zy2oIZfBFERYvX6U0ZDGJcKhacmKLL9nbyCGN1KSq1t5ZM
	 VaoUhtCnZ79eA+KZcGF8DhIiJelz1l4t+F6XlrgavnpECcdbp0seMB+zej5F2qSlPM
	 R8wRQdUy5g1WaK1yAcrbmwE8Kef8RLRmLKlddH+rGS4bV/vME2ZYNEZGa/RRHLUSOb
	 rW3wTSR+9jV0xv3PyUant9uuwycDSFhcGUZhJVxKmojf1z0awtuMnxZLHJsfL0fmyo
	 YGVIeRkWuD/dQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] media: axiado: add V4L2 capture driver for
 AX3000/AX3005 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tzu-Hao Wei" <twei@axiado.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260730-ax3000-display-driver-v1-2-4fbd4d0c85d3@axiado.com>
References: <20260730-ax3000-display-driver-v1-0-4fbd4d0c85d3@axiado.com>
 <20260730-ax3000-display-driver-v1-2-4fbd4d0c85d3@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 07:40:06 +0000
Message-Id: <20260730074007.3930D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Premature freeing of the video structure in remove() while file de=
scriptors are open causes Use-After-Free.
- [High] Double-delete pattern in stop_streaming and suspend leaves capture=
_work pending, causing a use-after-free.
- [High] Unvalidated control mailbox resource size leads to out-of-bounds M=
MIO reads.
- [Medium] Missing v4l2_device_unregister() causes a permanent reference le=
ak of the platform device.
- [Medium] TRY_FMT and S_FMT return -EINVAL when the requested format size =
exceeds the hardware memory bounds, instead of adjusting the format.
- [Medium] The control mailbox is mapped as cacheable system RAM (MEMREMAP_=
WB) but read using the I/O accessor ioread32().
- [Low] The rmb() memory barrier in axiado_video_capture_one() serves no pu=
rpose and provides no hardware synchronization.
--

--- Patch [2]: [PATCH 2/2] media: axiado: add V4L2 capture driver for AX300=
0/AX3005 SoC ---
commit 495100d44286c3a0f06e864e461f3d27d8be933b
Author: Tzu-Hao Wei <twei@axiado.com>
Subject: media: axiado: add V4L2 capture driver for AX3000/AX3005 SoC

This commit adds a V4L2 capture driver for the Axiado AX3000/AX3005 SoCs.
It captures frames from a shared memory region without a DMA engine,
polling via a software timer and workqueue.

> diff --git a/drivers/media/platform/axiado/axiado-video.c b/drivers/media=
/platform/axiado/axiado-video.c
> new file mode 100644
> index 0000000000000..f8962bdfe84dc
> --- /dev/null
> +++ b/drivers/media/platform/axiado/axiado-video.c

[ ... ]

> +static void axiado_video_capture_one(struct axiado_video *video)
> +{
> +	struct axiado_video_buffer *buf;
> +	struct vb2_v4l2_buffer *vbuf;
> +	unsigned long flags;
> +	size_t copy_sz;
> +	void *vaddr;
> +
> +	spin_lock_irqsave(&video->buf_lock, flags);
> +	if (!READ_ONCE(video->streaming) || list_empty(&video->pending)) {
> +		spin_unlock_irqrestore(&video->buf_lock, flags);
> +		return;
> +	}
> +	buf =3D list_first_entry(&video->pending, struct axiado_video_buffer, l=
ink);
> +	list_del_init(&buf->link);
> +	spin_unlock_irqrestore(&video->buf_lock, flags);
> +
> +	vbuf =3D &buf->vb;
> +	vaddr =3D vb2_plane_vaddr(&vbuf->vb2_buf, 0);
> +
> +	if (vaddr) {
> +		/*
> +		 * Prevent the CPU from reordering the loads below against
> +		 * prior loads.  This does not coordinate with the display
> +		 * engine writer; a torn frame is possible if the poll timer
> +		 * fires while the producer is mid-update.
> +		 */
> +		rmb();

[Severity: Low]
Is this rmb() necessary? Since there are no prior memory loads acting as a
synchronization flag from the producer, and the preceding
spin_unlock_irqrestore() already provides full barrier semantics, does this
barrier serve any hardware synchronization purpose?

[ ... ]

> +static void axiado_video_stop_streaming(struct vb2_queue *q)
> +{
> +	struct axiado_video *video =3D vb2_get_drv_priv(q);
> +	struct axiado_video_buffer *buf, *tmp;
> +	struct list_head drain;
> +	unsigned long flags;
> +
> +	WRITE_ONCE(video->streaming, false);
> +	timer_delete_sync(&video->timer);
> +	cancel_work_sync(&video->capture_work);
> +	/*
> +	 * A capture_work instance that read streaming=3D=3Dtrue before the
> +	 * WRITE_ONCE above may have called mod_timer() just before
> +	 * cancel_work_sync() returned.  Delete again to close that window.
> +	 */
> +	timer_delete_sync(&video->timer);

[Severity: High]
Can this teardown sequence leave the capture work queued after the timer is
stopped, leading to a use-after-free?

If capture_work reads video->streaming as true, but is preempted before
calling mod_timer(), cancel_work_sync() will block until the work finishes.
However, the work then wakes up and arms the timer. The second
timer_delete_sync() deletes the timer, but leaves the newly queued work
pending. Once the driver is freed, could this queued work execute on freed
memory? (Note that this identical pattern is also used in the
axiado_video_suspend callback below).

[ ... ]

> +static int axiado_video_check_addr_size(const struct axiado_video *video,
> +					const struct v4l2_pix_format *p)
> +{
> +	if (p->sizeimage > video->addr_size) {
> +		dev_dbg(video->dev,
> +			"sizeimage %u exceeds shared region %zu\n",
> +			p->sizeimage, video->addr_size);
> +		return -EINVAL;
> +	}

[Severity: Medium]
Should VIDIOC_TRY_FMT and VIDIOC_S_FMT return -EINVAL when the requested
format size exceeds the hardware memory bounds?=20

The V4L2 specification dictates that these ioctls must adjust the parameters
to a supported configuration rather than returning an error for unsupported
formats. Could this break generic V4L2 userspace applications?

[ ... ]

> +static void axiado_video_detect_timings(const struct axiado_video *video,
> +					struct v4l2_dv_timings *timings)
> +{
> +	u32 width, height;
> +
> +	if (video->ctrl_reg) {
> +		width =3D ioread32(video->ctrl_reg + AX_DP_MODE_DATA);
> +		height =3D ioread32(video->ctrl_reg + AX_DP_MODE_DATA + 4);

[Severity: High]
Is there a bounds check missing for the control mailbox resource size?

In axiado_video_probe(), the driver maps the control mailbox memory-region
without verifying its size, and here it unconditionally reads from offset
0x1000 (AX_DP_MODE_DATA) and 0x1004. If the device tree specifies a memory
region smaller than 0x1008 bytes, wouldn't these ioread32() calls perform
out-of-bounds accesses on the mapping?

[ ... ]

> +static int axiado_video_probe(struct platform_device *pdev)
> +{
> +	struct axiado_video *video;
> +	struct device_node *node;
> +	struct resource res;
> +	int ret;

[ ... ]

> +	/* Optional control mailbox (second memory-region entry). */
> +	node =3D of_parse_phandle(pdev->dev.of_node, "memory-region", 1);
> +	if (node) {
> +		struct resource ctrl_res;
> +
> +		ret =3D of_address_to_resource(node, 0, &ctrl_res);
> +		of_node_put(node);
> +		if (!ret) {
> +			video->ctrl_reg =3D devm_memremap(&pdev->dev, ctrl_res.start,
> +							resource_size(&ctrl_res),
> +							MEMREMAP_WB);

[Severity: Medium]
Are I/O accessors like ioread32() the correct way to read from a cacheable
system RAM mapping (MEMREMAP_WB)?

Since devm_memremap(..., MEMREMAP_WB) creates a cacheable mapping, using
ioread32() does not invalidate caches, and the CPU will likely read stale
cached values instead of the latest host-written data. Does this also
violate type safety by assigning the void * returned by devm_memremap() to a
void __iomem *?

[ ... ]

> +	video->vdev.fops	=3D &axiado_video_fops;
> +	video->vdev.ioctl_ops	=3D &axiado_video_ioctl_ops;
> +	video->vdev.v4l2_dev	=3D &video->v4l2_dev;
> +	video->vdev.queue	=3D &video->queue;
> +	video->vdev.lock	=3D &video->video_lock;
> +	video->vdev.release	=3D video_device_release_empty;

[Severity: High]
Does assigning video_device_release_empty disconnect the V4L2 char device
lifecycle from the memory allocation, potentially causing a use-after-free?

Since the video_device is embedded inside struct axiado_video, if userspace
still holds a file descriptor open when the device is unbound, the core V4L2
subsystem will hold a reference to it. Because the release callback is empty
and v4l2_device_put() frees the struct in remove(), won't this result in a
use-after-free when the file descriptor is subsequently closed?

[ ... ]

> +static void axiado_video_remove(struct platform_device *pdev)
> +{
> +	struct axiado_video *video =3D platform_get_drvdata(pdev);
> +
> +	vb2_video_unregister_device(&video->vdev);
> +	/*
> +	 * Drop the reference held since v4l2_device_register().  If all file
> +	 * descriptors are already closed this triggers axiado_v4l2_device_rele=
ase
> +	 * immediately; otherwise it fires when the last fd is released.
> +	 */
> +	v4l2_device_put(&video->v4l2_dev);
> +}

[Severity: Medium]
Is a call to v4l2_device_unregister() missing here?

v4l2_device_register() takes a reference on the parent platform device via
get_device(). This reference must be released by calling
v4l2_device_unregister(). Without it, is the parent device reference leaked
every time the driver is unbound?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-ax3000-dis=
play-driver-v1-0-4fbd4d0c85d3@axiado.com?part=3D2
