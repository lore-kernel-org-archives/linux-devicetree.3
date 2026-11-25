Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795588685;
	b=ueCRkrDOUA9PFKXIXHTj7I27b9Ut/DWsA/ILy92ah8WTuzSP6bpPuzKWE3VCXA5JB2c2
	 oVvbC7GUacnBusO1XR0mjkXweiRABpyrdJ/he4bLLCS5Tnl1KtC5VYAix4hQ9pdrhuf3U
	 eTBjonGUgzWw4oMuM3w0MFvdIXXWyqqB1AfNayyxj69qqhQ8nohbwfN0KS+fsYdOU3wgj
	 EFrN2t5TA1vXTMqBQr0o/12OClF6WseHSzBedoHTJPKi/7yK3s/CrfZW9utUKJO0uNBT9
	 k+faXoabYurdwlo00iUEMWzdIotk/bVUEy0u9scOpfWXYi5CmPlcVefhT/ni0/UKeyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795588685;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hefX9Mcz/qbVxKniT0rwckoFzxw7xEs7InKYWGpdxcc=;
	b=p6W3asLYjdvPRVcqBz/tt4XKLOPKBNsVyBKIWkuiqVxAnY9krnidL/FpiXy91HBuYGyV
	 5Z2PxkhkMvS5L6ruxbjpXZpuC3/2CrOvrzBb1/U4AKZuYeIpKQyaj3b/U9q+eH7K+jtem
	 xra7SV1CkbdYv5Ef0zz1QMpy+0rIrGleLPXCp6Kyhb+g43ayQQilbhkeLq59d/lUqnXPw
	 mvDpkc0a6goXEttrDr9L90nw7npkEARA4+Bn8oKWxTN4pHhEW6wdmnPl4oNX/4RXhdniz
	 tXWBlVAjNHQv0PBUdyp0aoFkxXw6/OrCaTE7H+xlmSJCoo7F34McUMEzzn+/O5M8PQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kSNfOCNH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE06F606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kSNfOCNH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258891F000C4;
	Wed, 25 Nov 2026 06:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795588685;
	bh=hefX9Mcz/qbVxKniT0rwckoFzxw7xEs7InKYWGpdxcc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kSNfOCNHL4BQAHJao4VkUW2RjR5h9aXWJLZKnADL5eFMKsdKWxOdUwN+5djJcWidu
	 HxAW6hFd51Bl9usVcmuEJ/OZlrcJaU3GPCXrwif9pX6hIcFgP5SwT7rS9cN/681ZDv
	 BWaKLg2nlYxa0gybiTHKYCycUEYmwv2+sp5eC3xRh4Vx2k+dyhrdTLdynSeZVCCGOw
	 mmCtKgeAwEe1PUYAsVse56EdOHUrdTmnxyNzjbslts2sJBkSnRX2aR3Etogfxzz6vg
	 OfwckvVjVbOc9/gOmcxCZRRHpTRv1++AosExc1M04CBDPI5g/0MeP2lG3G9YX9X5bJ
	 iURdmhm4xEOtg==
Message-ID: <sashiko-outbox-232719@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 05/15] media: mediatek: jpeg: Fix multi-core clk
 suspend and resume setting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261125061618.2544386-6-kyrie.wu@mediatek.com>
References: <20261125061618.2544386-1-kyrie.wu@mediatek.com>
 <20261125061618.2544386-6-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 06:38:04 +0000
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
- [High] media: mediatek: jpeg: system suspend deadlock in
  v4l2_m2m_suspend()
- [Medium] media: mediatek: jpeg: uncoordinated v4l2_m2m_resume() on
  shared m2m_dev
- [Medium] media: mediatek: jpeg: race between hw_state idle and
  pm_runtime_put()
--

commit ef54e8a58e87570a3e896564d7ed5ef3de2fbbc3
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: jpeg: Fix multi-core clk suspend and resume setting

This commit moves multi-core JPEG clock management into runtime PM
callbacks on the hardware component devices and adds system sleep
callbacks for the encoder and decoder component drivers.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index 3c22417f4e7c4..b9ba37a880b2d 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -533,13 +533,12 @@ static void mtk_jpegdec_timeout_work(struct work_st=
ruct *work)
>  	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
> =20
>  	mtk_jpeg_dec_reset(cjpeg->reg_base);
> -	clk_disable_unprepare(cjpeg->jdec_clk.clks->clk);
> -	pm_runtime_put(cjpeg->dev);
>  	cjpeg->hw_state =3D MTK_JPEG_HW_IDLE;
>  	atomic_inc(&master_jpeg->hw_rdy);
>  	wake_up(&master_jpeg->hw_wq);
>  	v4l2_m2m_buf_done(src_buf, buf_state);
>  	mtk_jpegdec_put_buf(cjpeg);
> +	pm_runtime_put(cjpeg->dev);
>  }
> =20
>  static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
> @@ -547,7 +546,6 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq=
, void *priv)
>  	struct vb2_v4l2_buffer *src_buf, *dst_buf;
>  	struct mtk_jpeg_src_buf *jpeg_src_buf;
>  	enum vb2_buffer_state buf_state;
> -	struct mtk_jpeg_ctx *ctx;
>  	u32 dec_irq_ret;
>  	u32 irq_status;
>  	int i;
> @@ -557,7 +555,6 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq=
, void *priv)
> =20
>  	cancel_delayed_work(&jpeg->job_timeout_work);
> =20
> -	ctx =3D jpeg->hw_param.curr_ctx;
>  	src_buf =3D jpeg->hw_param.src_buffer;
>  	dst_buf =3D jpeg->hw_param.dst_buffer;
>  	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
> @@ -580,12 +577,11 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int i=
rq, void *priv)
>  	buf_state =3D VB2_BUF_STATE_DONE;
>  	v4l2_m2m_buf_done(src_buf, buf_state);
>  	mtk_jpegdec_put_buf(jpeg);
> -	pm_runtime_put(ctx->jpeg->dev);
> -	clk_disable_unprepare(jpeg->jdec_clk.clks->clk);
> =20
>  	jpeg->hw_state =3D MTK_JPEG_HW_IDLE;
>  	wake_up(&master_jpeg->hw_wq);
>  	atomic_inc(&master_jpeg->hw_rdy);
> +	pm_runtime_put(jpeg->dev);
> =20
>  	return IRQ_HANDLED;
>  }

[Severity: Medium]
Can setting hw_state =3D MTK_JPEG_HW_IDLE before calling pm_runtime_put()
race with mtk_jpegdec_suspend()?

CPU0 (IRQ / timeout)              CPU1 (system suspend)
mtk_jpegdec_hw_irq_handler()
  jpeg->hw_state =3D MTK_JPEG_HW_IDLE;
                                  mtk_jpegdec_suspend()
                                    READ_ONCE(jpeg->hw_state) =3D=3D IDLE
                                    pm_runtime_force_suspend(dev)
                                      usage_count =3D=3D 2 (> 1)
                                      dev->power.needs_force_resume =3D 1
  pm_runtime_put(jpeg->dev)

If mtk_jpegdec_suspend() runs between the hw_state store and
pm_runtime_put(), dev->power.usage_count is still 2 (1 from
device_prepare() plus 1 from the finishing job).
pm_runtime_force_suspend() then sees usage_count > 1, skips
pm_runtime_set_suspended(), and sets needs_force_resume, causing
pm_runtime_force_resume() to unconditionally re-enable the component
clocks on resume and leave the idle device active.  The same ordering
exists in mtk_jpegenc_timeout_work() and mtk_jpegenc_hw_irq_handler().

> @@ -673,11 +669,67 @@ static int mtk_jpegdec_hw_probe(struct platform_dev=
ice *pdev)
>  	return 0;
>  }
> =20
> +static int mtk_jpegdec_pm_suspend(struct device *dev)
> +{
> +	struct mtk_jpegdec_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +
> +	clk_bulk_disable_unprepare(jpeg->jdec_clk.clk_num,
> +				   jpeg->jdec_clk.clks);
> +
> +	return 0;
> +}
> +
> +static int mtk_jpegdec_pm_resume(struct device *dev)
> +{
> +	struct mtk_jpegdec_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +
> +	return clk_bulk_prepare_enable(jpeg->jdec_clk.clk_num,
> +				       jpeg->jdec_clk.clks);
> +}
> +
> +static int mtk_jpegdec_suspend(struct device *dev)
> +{
> +	struct mtk_jpegdec_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	/* Stop new submissions before checking hardware activity. */
> +	v4l2_m2m_suspend(jpeg->master_dev->m2m_dev);

[Severity: High]
Can v4l2_m2m_suspend() deadlock during system suspend when a multi-core
job is queued on jpeg->workqueue?

In multi-core mode, mtk_jpeg_probe() allocates jpeg->workqueue with
WQ_FREEZABLE, and mtk_jpeg_multicore_dec_device_run() only queues
ctx->jpeg_work onto jpeg->workqueue while TRANS_RUNNING remains set on
curr_ctx until mtk_jpegdec_worker() runs and calls v4l2_m2m_job_finish().

kworker                           PM suspend
mtk_jpegdec_worker() (job 1)      freeze_kernel_threads()
                                    freeze_workqueues_begin()
  v4l2_m2m_job_finish()
    schedule_work(&m2m_dev->job_work)
v4l2_m2m_device_run_work()
  v4l2_m2m_try_run() (job 2)
    curr_ctx->job_flags |=3D TRANS_RUNNING
    queue_work(jpeg->workqueue, &ctx->jpeg_work)
    (queued on frozen wq; cannot run)
                                  dpm_suspend()
                                    mtk_jpegdec_suspend()
                                      v4l2_m2m_suspend()
                                        wait_event(..., !TRANS_RUNNING)
                                        <-- hangs forever

Because v4l2_m2m_device_run_work() runs on the non-freezable
system_percpu_wq, a worker finishing while workqueues are freezing can
schedule the next M2M job onto the already-frozen jpeg->workqueue before
v4l2_m2m_suspend() sets QUEUE_PAUSED.  v4l2_m2m_suspend() then waits
uninterruptibly for TRANS_RUNNING to clear on a work item that will not
run until thaw_workqueues().  mtk_jpegenc_suspend() has the same issue.

> +
> +	if (READ_ONCE(jpeg->hw_state) !=3D MTK_JPEG_HW_IDLE)
> +		ret =3D -EBUSY;
> +	else
> +		ret =3D pm_runtime_force_suspend(dev);
> +	if (ret)
> +		v4l2_m2m_resume(jpeg->master_dev->m2m_dev);
> +
> +	return ret;
> +}
> +
> +static int mtk_jpegdec_resume(struct device *dev)
> +{
> +	struct mtk_jpegdec_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D pm_runtime_force_resume(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	v4l2_m2m_resume(jpeg->master_dev->m2m_dev);
> +
> +	return 0;
> +}

[Severity: Medium]
Does calling v4l2_m2m_resume() on the shared master_dev->m2m_dev from each
component and from the parent device unpause the M2M queue while component
devices are still force-suspended?

All component devices and the parent master device share a single
master_dev->m2m_dev, where QUEUE_PAUSED is a single non-reference-counted
bit and v4l2_m2m_resume() immediately calls v4l2_m2m_try_run().

During dpm_resume(), the parent device runs mtk_jpeg_resume() before its
child component devices and calls v4l2_m2m_resume(jpeg->m2m_dev) while all
children still have runtime PM disabled by pm_runtime_force_suspend(), and
the first child component to resume does the same before its remaining
siblings have resumed.  Similarly, if one child component is idle and
enters pm_runtime_force_suspend() during dpm_suspend(), and a later
sibling is busy and returns -EBUSY, its error path calls
v4l2_m2m_resume(jpeg->master_dev->m2m_dev) while the first sibling is
still force-suspended.  Any job dispatched in that window selects an idle
force-suspended component, fails pm_runtime_resume_and_get() with -EACCES,
and completes user buffers with VB2_BUF_STATE_ERROR.  mtk_jpegenc_suspend()
and mtk_jpegenc_resume() have the same issue.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125061618.2544=
386-1-kyrie.wu@mediatek.com?part=3D5
