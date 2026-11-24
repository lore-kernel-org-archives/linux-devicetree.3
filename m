Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541967;
	b=YmSRBHRS6sutKPnWNzfSmWMFSLWd0HAxuTp9g1Q5k94jgS6bgwt4xWX7G6uLHBdnZS55
	 e317DgELRp+2bT+O93skqZYVbzWLFliXf+nFpVXgYmNUe1kI8P50dVS6TyTW60L0MYjjb
	 v2IAbCE53L7RmAolct/HYmvzjc36zPDaj0S34aFbJI5IMbmWasKN8msizCAYCYXnpdJ2w
	 7jvysv7chIXIh6Zlk5ZIZPpypoD77PtdmIhZo+z9ERkOFqIkPbfSEt77jJUmD5tRpZvYm
	 X3P091aUwtmdTmXC98ImWgbomkgl4fnlE3YGR5vgtcENCj5rv2eCSPSFxLwps3MVAYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541967;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2DHfqrsqFQgn520F+/RmNDlgDeR7DrAEHvjrpJ2piSI=;
	b=VB52Z0hnEpb41xfpTp4vgnT5omYOD1nofpVvof5YMgXK9dXrk52hd3ecDxaAiPepy7Na
	 QV6CtHK2pacShtZA4IW6h5FUWNxR6bgouTHSchZ+dCTuMkv8cC0h0QnfrGwjQK/i5bpi1
	 bHpg4DH9Nu7XfBxWhnNbwpLB1BX7zfz+Oq2izKwFT9lDGpas05F/fdVkiaLrc953djm1w
	 s8RwHog91FXU/YnXsFmjbI6rzoghfmR63uhZvdmEm4hDz6UUhff6FkRQ6YJwgsuSLEaGC
	 OULqEhC6OVvNJRTQB4cjJdsgZlZMYmz9gVlxHCrzK+0sP8M8Y7IkX8TaDwdy8N0QwCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TaBjvdZy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E92606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TaBjvdZy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9855E1F000C6;
	Tue, 24 Nov 2026 17:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795541966;
	bh=2DHfqrsqFQgn520F+/RmNDlgDeR7DrAEHvjrpJ2piSI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TaBjvdZy65NIMNm3QLDp1AP9uCc/MJ+0aJGCjJbQMWW/WBcLLjrSOZ0qOjTC13+lG
	 JjwbHZQTYFhBmyLoLM8jotdG0/ADkUJvb+2njR/kxCeg4KXwnUhY70MrEhN8XKnFMn
	 3V3coaBtWMcBhPR4kD44NgAcivk3QSc8NSykpU44VXq8/YY52GmU09XwcdjxM89ByC
	 V9P2KQ591Nq9PP75/CmxNpjr9azu+y3E7dhtu59wiS589HjRg8mY8ZgHouMzq4Qwkq
	 Xb54t2NmJuU7pTQqjj34gG+G0ZzbNGwk/Gm7UYTTFVVegfbCis40DAa4C5M0cIBGmV
	 3osvCZDxiyrKA==
Message-ID: <sashiko-outbox-231725@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 13/24] media: mali-c720: Add Mali-C720 ISP driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anthony McGivern" <anthony.mcgivern@arm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261124-b4-initial-upstream-candidate-v1-13-0cb9bde1bd30@arm.com>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
 <20261124-b4-initial-upstream-candidate-v1-13-0cb9bde1bd30@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 17:39:26 +0000
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
- [High] media: mali-c720: reuse_buffer descriptor lost across runtime
  PM reset
- [Medium] media: mali-c720: premature upstream disable in fr_pipe
  disable_streams()
- [Medium] media: mali-c720: unbalanced power off on probe error in
  mali_c720_probe()
- [Medium] media: mali-c720: race on capture format in
  mali_c720_s_fmt_vid_cap_mplane()
- [Low] media: mali-c720: legacy PM ops macros and missing pm_ptr() in
  mali-c720-core
--

commit 673cd59feb7192d4abbadb5d84db3f82e14b2c89
Author: Anthony McGivern <Anthony.McGivern@arm.com>

media: mali-c720: Add Mali-C720 ISP driver

This commit integrates the hardware identification, capability discovery,
context management, V4L2 subdevices, power management, media graph
registration, frame scheduling, and build configuration for the Mali-C720
ISP driver.

> diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-capture.c b/d=
rivers/media/platform/arm/mali-c720/mali-c720-capture.c
> index 78e9f5aba97d5..ef69901730b4e 100644
> --- a/drivers/media/platform/arm/mali-c720/mali-c720-capture.c
> +++ b/drivers/media/platform/arm/mali-c720/mali-c720-capture.c
> @@ -289,6 +294,7 @@ static int mali_c720_vb2_start_streaming(struct vb2_q=
ueue *q, unsigned int count
>  	struct mali_c720_cap_dev *cap_dev =3D q->drv_priv;
>  	struct mali_c720 *mali_c720 =3D cap_dev->mali_c720;
>  	struct mali_c720_context *ctx =3D mali_c720_get_active_context(mali_c72=
0);
> +	struct v4l2_subdev *isp_sd =3D &mali_c720->isp.mdev.sd;
>  	int ret;
> =20
>  	guard(mutex)(&mali_c720->device_lock);
> @@ -328,8 +334,30 @@ static int mali_c720_vb2_start_streaming(struct vb2_=
queue *q, unsigned int count
>  		goto err_release_buffer_pool;
>  	}
> =20
> +	/*
> +	 * All ISP source pads use the same start process, so the HV pad can
> +	 * represent the ISP when starting the pipeline.
> +	 */
> +	ret =3D mali_c720_pipeline_ready(mali_c720);
> +	if (ret && ret !=3D -EAGAIN)
> +		goto err_disable_src;
> +
> +	if (!ret) {
> +		ret =3D v4l2_subdev_enable_streams(isp_sd,
> +						 MALI_C720_ISP_PAD_SOURCE_HV,
> +						 BIT(0));
> +		if (ret) {
> +			dev_err(mali_c720->dev, "%s failed to start ISP subdevice\n",
> +				cap_dev->vdev.name);
> +			goto err_disable_src;
> +		}
> +	}
> +
>  	return 0;
> =20
> +err_disable_src:
> +	v4l2_subdev_disable_streams(cap_dev->src_sd, cap_dev->src_pad,
> +				    BIT(0));
>  err_release_buffer_pool:
>  	mali_c720_cap_dev_release_buffer_pool(cap_dev);

[Severity: Medium]
Can a concurrent VIDIOC_S_FMT on one capture device race with
VIDIOC_STREAMON on the other capture device in the pipeline and bypass link
validation?

Each capture node has its own cap_dev->lock (used for vdev->lock and
vb2q->lock). When both FR0_RGB and FR0_YUV links are enabled:

CPU0 (cap_devs[0] VIDIOC_STREAMON)    CPU1 (cap_devs[1] VIDIOC_S_FMT)
lock(&cap_devs[0].lock)               lock(&cap_devs[1].lock)
mali_c720_vb2_start_streaming()       mali_c720_s_fmt_vid_cap_mplane()
  lock(&mali_c720->device_lock)         media_entity_is_streaming() -> false
  video_device_pipeline_start()
    __media_pipeline_start()
      mali_c720_link_validate()
        reads cap_devs[1].format        mali_c720_set_format()
      cap_devs[1].pad.pipe =3D pipe         writes cap_devs[1].format  <-- =
race

When VIDIOC_STREAMON is subsequently called on cap_devs[1],
__media_pipeline_start() sees pipe->start_count > 0 and skips link
validation, so the buffer pool is configured with an unvalidated
cap_devs[1].format that may not match the upstream FR pipe pad format.
Taking mali_c720->device_lock in mali_c720_s_fmt_vid_cap_mplane() would
serialize format updates against video_device_pipeline_start().

[Severity: Medium]
When both FR0_RGB and FR0_YUV links on the FR pipe are enabled, does
disabling one source pad stream here (or in mali_c720_vb2_stop_streaming())
prematurely disable the upstream vision_pipe subdevice while the other FR
pipe source pad is still active?

When the second capture device starts streaming,
mali_c720_fr_pipe_enable_streams() calls v4l2_subdev_enable_streams() on
pipe->remote_src (which returns -EALREADY without incrementing the upstream
stream count) and sets the second pad bit in pipe->enabled_crops. However,
mali_c720_fr_pipe_disable_streams() disables pipe->remote_src
unconditionally:

drivers/media/platform/arm/mali-c720/mali-c720-fr-pipe.c:mali_c720_fr_pipe_=
disable_streams() {
	if (pipe->remote_src) {
		src_sd =3D media_entity_to_v4l2_subdev(pipe->remote_src->entity);
		v4l2_subdev_disable_streams(src_sd, pipe->remote_src->index,
					    BIT(0));
	}
	pipe->remote_src =3D NULL;

	guard(spinlock)(&pipe->resizer_lock);
	pipe->enabled_crops &=3D ~BIT(pad);
}

If starting the second capture device fails and jumps to err_disable_src,
or if one of the two capture devices stops streaming first, the upstream
vision_pipe subdevice is disabled and pipe->remote_src is cleared while the
remaining FR pipe pad is still enabled.

> diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-core.c b/driv=
ers/media/platform/arm/mali-c720/mali-c720-core.c
> new file mode 100644
> index 0000000000000..2a46e7b348910
> --- /dev/null
> +++ b/drivers/media/platform/arm/mali-c720/mali-c720-core.c

[ ... ]

> +static int mali_c720_power_on(struct mali_c720 *mali_c720)
> +{
> +	int ret;
> +
> +	ret =3D clk_prepare_enable(mali_c720->clk);
> +	if (ret) {
> +		dev_err(mali_c720->dev, "failed to enable clocks\n");
> +		return ret;
> +	}
> +
> +	ret =3D reset_control_deassert(mali_c720->reset);
> +	if (ret) {
> +		dev_err(mali_c720->dev, "failed to deassert resets\n");
> +		goto err_disable_clk;
> +	}
> +
> +	return 0;
> +
> +err_disable_clk:
> +	clk_disable_unprepare(mali_c720->clk);
> +	return ret;
> +}
> +
> +static void mali_c720_power_off(struct mali_c720 *mali_c720)
> +{
> +	reset_control_assert(mali_c720->reset);
> +	clk_disable_unprepare(mali_c720->clk);
> +}
> +
> +static int __maybe_unused mali_c720_runtime_resume(struct device *dev)
> +{
> +	struct mali_c720 *mali_c720 =3D dev_get_drvdata(dev);
> +
> +	return mali_c720_power_on(mali_c720);
> +}
> +
> +static int __maybe_unused mali_c720_runtime_suspend(struct device *dev)
> +{
> +	struct mali_c720 *mali_c720 =3D dev_get_drvdata(dev);
> +
> +	mali_c720_power_off(mali_c720);
> +	return 0;
> +}

[Severity: High]
Does asserting mali_c720->reset in mali_c720_power_off() wipe the
ctx_mgr->reuse_buffer descriptor registers that were only programmed during
probe?

In mali_c720_probe(), mali_c720_init_ctx_mgr() calls
mali_c720_ctx_mgr_init_reuse_buffer() once to program the hardware raw
buffer descriptor at index ctx_mgr->reuse_buffer (including setting
buffer->nonsecure to 1) before calling pm_runtime_idle(&pdev->dev):

drivers/media/platform/arm/mali-c720/mali-c720-ctx-mgr.c:mali_c720_ctx_mgr_=
init_reuse_buffer() {
    ...
	buffer_addr =3D mali_c720_group_base(&buffer->raw_group, ctx_mgr->reuse_bu=
ffer);
	mali_c720_ctx_mgr_buffer_request(mali_c720, buffer_addr,
					 MALI_C720_BUFFER_STATE_SW_EMPTY);
	mali_c720_group_write(mali_c720, buffer_addr,
			      &buffer->nonsecure, 1);
    ...
}

When the ISP enters runtime suspend (or system suspend),
mali_c720_power_off() asserts mali_c720->reset and disables mali_c720->clk,
resetting the MMIO registers. On runtime resume, mali_c720_power_on() does
not re-initialize ctx_mgr->reuse_buffer, so when streaming later stops,
mali_c720_ctx_mgr_stop_input_port() enables the input port with an
unconfigured reuse_buffer descriptor (nonsecure =3D 0), breaking the
r0p0/r0p1 input cleanup workaround and timing out waiting for the input
port to stop.

> +
> +static int __maybe_unused mali_c720_suspend(struct device *dev)
> +{
> +	struct mali_c720 *mali_c720 =3D dev_get_drvdata(dev);
> +
> +	guard(mutex)(&mali_c720->device_lock);
> +
> +	/* Active pipelines cannot survive the hardware reset during suspend. */
> +	if (media_entity_is_streaming(&mali_c720->isp.mdev.sd.entity))
> +		return -EBUSY;
> +
> +	return pm_runtime_force_suspend(dev);
> +}
> +
> +static const struct dev_pm_ops mali_c720_pm_ops =3D {
> +	SET_SYSTEM_SLEEP_PM_OPS(mali_c720_suspend,
> +				pm_runtime_force_resume)
> +	SET_RUNTIME_PM_OPS(mali_c720_runtime_suspend, mali_c720_runtime_resume,
> +			   NULL)
> +};

[ ... ]

> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
> +	pm_runtime_use_autosuspend(&pdev->dev);
> +	pm_runtime_set_active(&pdev->dev);
> +	pm_runtime_enable(&pdev->dev);
> +
> +	ret =3D platform_get_irq_byname(pdev, "isp");
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to get interrupt\n");
> +		goto err_pm_runtime_disable;
> +	}
> +	irq =3D (unsigned int)ret;
> +
> +	spin_lock_init(&mali_c720->irq_lock);
> +	INIT_KFIFO(mali_c720->irq_fifo);
> +	ret =3D devm_request_threaded_irq(&pdev->dev, irq,
> +					mali_c720_isr_top, mali_c720_isr,
> +					0,
> +					dev_driver_string(&pdev->dev),
> +					&pdev->dev);
> +	if (ret) {
> +		dev_err(dev, "Failed to request threaded IRQ\n");
> +		goto err_pm_runtime_disable;
> +	}
> +	mali_c720->irq =3D irq;
> +
> +	mali_c720->media_dev.dev =3D dev;
> +	mali_c720->media_dev.ops =3D &mali_c720_media_device_ops;
> +	ret =3D mali_c720_media_frameworks_init(mali_c720);
> +	if (ret)
> +		goto err_free_irq;
> +
> +	pm_runtime_idle(&pdev->dev);
> +
> +	dev_info(&pdev->dev, "Media frameworks and entities registered successf=
ully\n");
> +
> +	return 0;
> +
> +err_free_irq:
> +	devm_free_irq(dev, mali_c720->irq, dev);
> +err_pm_runtime_disable:
> +	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_set_suspended(&pdev->dev);
> +err_power_off:
> +	mali_c720_power_off(mali_c720);

[Severity: Medium]
Can the err_pm_runtime_disable error path call mali_c720_power_off() a
second time if the device has already runtime-suspended after
pm_runtime_enable()?

Runtime PM is enabled with usage_count =3D=3D 0 before IRQ request and
mali_c720_media_frameworks_init(). If the device runtime-suspends during
that window and a later step fails, err_pm_runtime_disable falls through to
err_power_off without checking !pm_runtime_status_suspended(&pdev->dev) the
way mali_c720_remove() does, causing an unbalanced clk_disable_unprepare().
Also, neither err_pm_runtime_disable nor mali_c720_remove() calls
pm_runtime_dont_use_autosuspend(&pdev->dev) to pair with
pm_runtime_use_autosuspend(&pdev->dev).

[ ... ]

> +static struct platform_driver mali_c720_driver =3D {
> +	.driver		=3D {
> +		.name		=3D "mali-c720",
> +		.of_match_table	=3D mali_c720_of_match,
> +		.pm =3D &mali_c720_pm_ops,
> +	},
> +	.probe		=3D mali_c720_probe,
> +	.remove		=3D mali_c720_remove,
> +};

[Severity: Low]
This isn't a bug, but using SYSTEM_SLEEP_PM_OPS() and RUNTIME_PM_OPS() in
mali_c720_pm_ops along with .pm =3D pm_ptr(&mali_c720_pm_ops) here would let
the compiler drop the PM callbacks and drop the __maybe_unused annotations
when CONFIG_PM or CONFIG_PM_SLEEP is disabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-b4-initial=
-upstream-candidate-v1-0-0cb9bde1bd30@arm.com?part=3D13
