Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794616537;
	b=1ThuRaSBYuKBFM4uSKGoHPersmTHkhTymqfaR8qWo/HQMym2AThm1RzhL1zeWliRbd09
	 D1Fz/x5Gdi4AfstEgeoBeSEQIu8aDX5JkiJLvGso4s0uLaDZK/e3B7mrSVEEnZmRGBxnm
	 nnjz+bMV8vqkkB9McSz2mjfdzfl0Pxq/0cqdsSYFNpdTJFDhM42eWXwJEWllU8liUcQPe
	 UsTjS6LEPmTS3HkHDhxjjRqhmMqhQxGO9EkB88loYXaVKWsIg1ZGnsAWFJ9eRQVPHl1Im
	 Cqu/H8W7Y2MK6Nbrie7Qow0qNnyvnF/s+nmD00qq9Q5nFTAXqJlDKaUt2Xri8v2QBNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794616537;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mvxsSOwYqHruIwMBBwX8IgLOf1/E3ff91X6NmfZjpbE=;
	b=3z5Hb9h8YbPbraqARQlTw2R8EOlpPGYe2phH6d6T1OR4Tnorf4ZACX1MzOzf3RyeG4Su
	 VUol3NzVCDO54AFClD3HcDyCs+MT3hMScdseo0EKPgz4N0r1trQfls+n3On1AK5Umwkv0
	 DCnVPjFcJdoRC3PDQf4/BHSKkYpLgd5lhkp6u4vx+yoImKNTOQz8DixuFLgQiBuQ42cN7
	 xnTY5+YOH0cFpUZKuT9aXncpwu7IRp9hGnkIAiiTL5Nr5zOUE5PkCySOtaabBuwHpP3ny
	 vXrdT5M5Q8AML1OfF5PdPPSk9xuA5lgJMuyJ1nCHXEY07kO3znK0nsK19S8a0uE8C+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XeKjTBFo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F80E606A331
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 00:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XeKjTBFo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB5191F000C4;
	Sat, 14 Nov 2026 00:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794616537;
	bh=mvxsSOwYqHruIwMBBwX8IgLOf1/E3ff91X6NmfZjpbE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XeKjTBFo/fO9N6VS0/vaI4EG9dKoYZTWX+knVubaqwPWWcG47SFHTXJxQY9c2eMWf
	 Y6RCliXTemRzH7fNyzYZhxgR17GMdxpBisffgSy4E6dJLpSCFfjSM1Nl3NQjSBIBES
	 pqeOV4Iy72q9YTkPd824F1I9hE/YmIz8wK8TP2On+NbX5DWJYzvp31M4cytT2CRF5m
	 HTl9OoKlskZOirBfNq7TZzNeiVq9/A7eUf1a/9C6hPXwgyLhgpvVrhBY0Fe+roiW6f
	 Xs2BASSumx8MMOGGl83byf79plLdl/cAT6GFbnDLMn8rC9KnhdbGy7ADhgpbeiV4ir
	 DMJySXGLK8KFg==
Message-ID: <sashiko-outbox-213935@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] media: rockchip: Add IEP2 deinterlacer driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261114-iep2-v1-2-a8edde5a21e1@gmail.com>
References: <20261114-iep2-v1-0-a8edde5a21e1@gmail.com>
 <20261114-iep2-v1-2-a8edde5a21e1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 00:35:36 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] media: rockchip: iep2: lost frame-done IRQ in iep_irq() when
  OSD_MAX fires
- [Medium] media: rockchip: iep2: unreleased prev and second dst buf in
  iep_fail_job()
- [Medium] media: rockchip: iep2: race and use-after-free in
  iep_remove() on unbind
--

commit 33c094e881e4e76b67c9126fbcce91524e080828
Author: Arun Iyengar <aiyengar1990@gmail.com>

media: rockchip: Add IEP2 deinterlacer driver

This commit adds a V4L2 mem2mem driver for the Rockchip IEP2 deinterlacer on
RK3568 and RK3588 SoCs, supporting bob and motion-adaptive deinterlacing at
frame and field rates.

> diff --git a/drivers/media/platform/rockchip/iep2/iep2.c b/drivers/media/=
platform/rockchip/iep2/iep2.c
> new file mode 100644
> index 0000000000000..26f5fec02b679
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/iep2/iep2.c
[ ... ]
> +static void iep_job_done(struct iep_ctx *ctx, enum vb2_buffer_state stat=
e)
> +{
> +	struct iep_dev *iep =3D ctx->iep;
> +	struct vb2_v4l2_buffer *src =3D ctx->job_src;
> +	unsigned int i;
> +
> +	for (i =3D 0; i < ctx->job_ndst; i++) {
> +		v4l2_m2m_buf_done(ctx->job_dst[i], state);
> +		ctx->job_dst[i] =3D NULL;
> +	}
> +	ctx->job_ndst =3D 0;
> +	ctx->job_src =3D NULL;
> +
> +	if (ctx->prev) {
> +		v4l2_m2m_buf_done(ctx->prev, VB2_BUF_STATE_DONE);
> +		ctx->prev =3D NULL;
> +	}
> +
> +	if (src) {
> +		if (ctx->job_keep_src && state =3D=3D VB2_BUF_STATE_DONE)
> +			ctx->prev =3D src;
> +		else
> +			v4l2_m2m_buf_done(src, state);
> +	}
> +	ctx->job_keep_src =3D false;
> +
> +	pm_runtime_put_autosuspend(iep->dev);
> +	v4l2_m2m_job_finish(iep->m2m_dev, ctx->fh.m2m_ctx);
> +}
> +
> +static void iep_fail_job(struct iep_ctx *ctx)
> +{
> +	struct vb2_v4l2_buffer *src, *dst;
> +
> +	src =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +	dst =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +	if (src)
> +		v4l2_m2m_buf_done(src, VB2_BUF_STATE_ERROR);
> +	if (dst)
> +		v4l2_m2m_buf_done(dst, VB2_BUF_STATE_ERROR);
> +	v4l2_m2m_job_finish(ctx->iep->m2m_dev, ctx->fh.m2m_ctx);
> +}

[Severity: Medium]
When pm_runtime_resume_and_get() fails in iep_device_run(), does
iep_fail_job() leave ctx->prev and the second field-rate CAPTURE buffer
queued?

In motion-adaptive mode, failing src without first completing and clearing
ctx->prev returns the current OUTPUT buffer ahead of the reference buffer h=
eld
from the previous frame.  In field-rate mode, iep_job_ready() waits for two
CAPTURE buffers, so leaving ctx->prev on src_vq->queued_list and the second
CAPTURE buffer on dst_vq->queued_list keeps both queues non-empty while no =
new
job can run, causing poll() or blocking VIDIOC_DQBUF to hang even after
iep_resume() calls v4l2_m2m_resume().

[ ... ]
> +static irqreturn_t iep_irq(int irq, void *data)
> +{
> +	struct iep_dev *iep =3D data;
> +	irqreturn_t ret =3D IRQ_NONE;
> +	u32 status;
> +
> +	/* Shared with the IOMMU: registers are only accessible during a job */
> +	spin_lock(&iep->irq_lock);
> +	if (!iep->busy)
> +		goto out;
> +
> +	status =3D iep_read(iep, IEP2_INT_STS);
> +	if (!status) {
> +		/* IOMMU fault: the IEP would retry the read forever */
> +		if (++iep->foreign_irqs < IEP_MAX_FOREIGN_IRQS)
> +			goto out;
> +
> +		iep_write(iep, IEP2_INT_EN, 0);
> +		iep_write(iep, IEP2_CONFIG0, IEP2_ACLK_SRESET_P);
> +		iep->busy =3D false;
> +		iep->irq_status =3D IEP_IRQ_IOMMU_FAULT;
> +		ret =3D IRQ_WAKE_THREAD;
> +		goto out;
> +	}
> +
> +	iep_write(iep, IEP2_INT_CLR, 0xffffffff);
> +	ret =3D IRQ_HANDLED;
> +
> +	if (status & IEP2_INT_VALID) {
> +		iep->busy =3D false;
> +		iep->irq_status =3D status;
> +		ret =3D IRQ_WAKE_THREAD;
> +	}
> +out:
> +	spin_unlock(&iep->irq_lock);
> +
> +	return ret;
> +}

[Severity: Medium]
Can writing 0xffffffff to IEP2_INT_CLR drop a frame-done interrupt when
IEP2_INT_OSD_MAX fires first?

iep_hw_config() enables IEP2_INT_OSD_MAX in IEP2_INT_EN, but IEP2_INT_VALID
only includes IEP2_INT_TIMEOUT, IEP2_INT_BUS_ERROR and IEP2_INT_FRM_DONE.  =
If
IEP2_INT_OSD_MAX triggers iep_irq() and IEP2_INT_FRM_DONE asserts between
reading IEP2_INT_STS and writing 0xffffffff to IEP2_INT_CLR, the frame-done
status is cleared in hardware without waking iep_irq_thread(), stalling the
job until the 500 ms watchdog times out and resets the block.  Clearing only
status (or not enabling IEP2_INT_OSD_MAX) would avoid losing the completion.

[ ... ]
> +static void iep_remove(struct platform_device *pdev)
> +{
> +	struct iep_dev *iep =3D platform_get_drvdata(pdev);
> +
> +	v4l2_m2m_suspend(iep->m2m_dev);
> +	video_unregister_device(&iep->vfd);
> +	cancel_delayed_work_sync(&iep->watchdog_work);
> +
> +	/* Disabling runtime PM drops a pending autosuspend */
> +	pm_runtime_dont_use_autosuspend(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
> +	if (!pm_runtime_status_suspended(&pdev->dev))
> +		iep_runtime_suspend(&pdev->dev);
> +	pm_runtime_set_suspended(&pdev->dev);
> +
> +	if (iep->empty_domain)
> +		iommu_domain_free(iep->empty_domain);
> +	iep->empty_domain =3D NULL;
> +}

[Severity: Medium]
Can v4l2_m2m_suspend() race with iep_release() and read a freed m2m_ctx?

v4l2_m2m_suspend() (also called from iep_suspend() without iep->mutex) reads
m2m_dev->curr_ctx under job_spinlock, drops the spinlock, and waits on
curr_ctx->finished:

CPU0                              CPU1
iep_remove()
  v4l2_m2m_suspend(iep->m2m_dev)
    curr_ctx =3D m2m_dev->curr_ctx
                                  iep_release()
                                    mutex_lock(&iep->mutex)
                                    v4l2_m2m_ctx_release(ctx->fh.m2m_ctx)
                                      wait_event(m2m_ctx->finished, ...)
                                      /* job finishes */
                                      kfree(m2m_ctx)
    wait_event(curr_ctx->finished,
      !(curr_ctx->job_flags & ...))  <-- use-after-free

In addition, iep_remove() never acquires iep->mutex, so an ioctl that enter=
ed
__video_do_ioctl() before video_unregister_device() cleared
V4L2_FL_REGISTERED can still be running under iep->mutex while iep_remove()
disables runtime PM, unprepares clocks, and frees iep->empty_domain.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-iep2-v1-0-=
a8edde5a21e1@gmail.com?part=3D2
