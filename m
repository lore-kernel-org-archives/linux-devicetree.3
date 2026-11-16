Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794794636;
	b=wHtTW+qpx+OM5c/XsvKcM5IwcrP4yWF4CnGjFAQmkK/Ez1XlAmmGjwigLePjwf+Z5czv
	 Uq5Tpw8lqxig6auHCiP603LSUdsVYelZyc4s+UZaEttj0B0aBLiguDeYTUdYGpYeOHxPf
	 0/Pbj8oqJvS2JFD7vMFcwrGugOoWxJbRsK/UL9U/8bpe7gIi90zb7tJmjNQBedyNz0aFO
	 MsdH50XSFGoFkkZ8+NikwiOY2hSle6SaPE8IaBgFAt9nKgS4NREK+0/3UtqI/V6EbaDjg
	 6UAcqiK7zP41h/89ZS0c5zNmlaOyJTbEEv0RS9hGeN1upBozrWNNpSrxKRc2tXtfFaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794794636;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=A+exirj2lN/QaUdQNJy0KY2kCcsuyipH0D/pJtaEFF8=;
	b=yJ4k4aNzDktje+U9Yw/55YMlZT32UTEKPEAtBJjUeUy92FrDbHpNH86mYrripprfIDHD
	 Y8JOcWmlEYnpgEe+EaXzXaP2PVcIe9fp97dkEvkXZ6krHuUtGaYDNLuNX3lIfWMMtkKZ4
	 Hay0kAVkKJrmTeCCEuDwVWsU9d0+UdmXiXFspzyvVd4ZVHheV+VruHVs/+sl6hv91IXXM
	 CBy1DIuG+ko9+aPG2FpYrrhwGCJylTPF9ODBjrPSsRMVYeTpvnyx/Jl6AAy5XSvwzVK8t
	 XMUIIO7a9j5x7X21lrKN0l1F3gC1d60kw7EM1CrTSDaj/HCFFllfXxuW2TRI/maOgUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="O4Vvt/aE";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BEA606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 02:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O4Vvt/aE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D5C1F000C4;
	Mon, 16 Nov 2026 02:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794794636;
	bh=A+exirj2lN/QaUdQNJy0KY2kCcsuyipH0D/pJtaEFF8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O4Vvt/aE1atZ2lBn6/PuxiZbdmxc1IbQ8pt/2NsEgt2ek7A0zl/qGqxB1uwCJdZWp
	 DnR0TtCPdUtHZyRIDo3BQcGMJhmOvyy3y3EQCsN1xPwq6M2O1TUmHG2hUthlOHq2+F
	 naphvWFE2nBOpMeD+K3B7JAcysEX5jUV79/EC8DZHOjgvCiDxaQ7aTILmNMs8n6y7M
	 xtkQB8dUTZ6QFlDR0f08XFDq3Z+voyJw5DtEx/kIHcoHSLSoeL3dcNyFaVmplp8sP0
	 FDTleXJTAYLUyR22TSlIY/UdldxqRx4l4no8QT14w9kTbguh/tJR0f5tWk7uoa6sHx
	 rzDJbw7B6rhhA==
Message-ID: <sashiko-outbox-216060@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 05/13] media: mediatek: jpeg: Fix multi-core clk
 suspend and resume setting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261116013402.1273016-6-kyrie.wu@mediatek.com>
References: <20261116013402.1273016-1-kyrie.wu@mediatek.com>
 <20261116013402.1273016-6-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 02:03:55 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] media: mediatek: jpeg: deadlock and missed hw wait in
  v4l2_m2m_suspend()
- [Medium] media: mediatek: jpeg: uncoordinated v4l2_m2m_resume() on
  shared m2m_dev
--

commit 3fc9b3db7f2ed0b9fd6715e9fd9cf8dac338e53f
Author: Kyrie Wu <kyrie.wu@mediatek.com>

media: mediatek: jpeg: Fix multi-core clk suspend and resume setting

This commit moves multi-core clock management to the hardware component
devices' runtime PM callbacks and adds system sleep callbacks to suspend
and resume the M2M queue and component clocks.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index 3c22417f4e7c4..b9ba37a880b2d 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c

[ ... ]

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
> +
> +	if (READ_ONCE(jpeg->hw_state) !=3D MTK_JPEG_HW_IDLE)
> +		ret =3D -EBUSY;

[Severity: High]
Can v4l2_m2m_suspend() deadlock during system suspend, and does it wait
for active multi-core hardware jobs?

v4l2_m2m_suspend() waits until TRANS_RUNNING is cleared by
v4l2_m2m_job_finish().  However, mtk_jpegdec_worker() and
mtk_jpegenc_worker() call v4l2_m2m_job_finish() immediately after starting
the hardware, while jpeg->hw_state is still MTK_JPEG_HW_BUSY:

drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:mtk_jpegdec_worker() {
    ...
	mtk_jpeg_dec_start(comp_jpeg[hw_id]->reg_base);
	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
	spin_unlock_irqrestore(&comp_jpeg[hw_id]->hw_lock, flags);
}

As a result, v4l2_m2m_suspend() does not wait for an in-flight frame to
finish on the hardware, and the subsequent jpeg->hw_state check
immediately fails system suspend with -EBUSY whenever a frame is active.

Furthermore, mtk_jpeg_probe() allocates jpeg->workqueue with WQ_FREEZABLE,
which is frozen during suspend_freeze_processes() before device suspend
callbacks run, whereas v4l2_m2m_job_finish() schedules the next job via
m2m_dev->job_work on the non-freezable system_percpu_wq:

kworker (jpeg->workqueue)         PM task / system_percpu_wq
                                  suspend_freeze_processes()
                                    freeze_workqueues_begin()
mtk_jpegdec_worker()
  mtk_jpeg_dec_start()
  v4l2_m2m_job_finish()
                                  v4l2_m2m_try_run()
                                    curr_ctx->job_flags |=3D TRANS_RUNNING
                                    mtk_jpeg_multicore_dec_device_run()
                                      queue_work(jpeg->workqueue, ...)
                                      (queued on frozen workqueue)
                                  mtk_jpegdec_suspend()
                                    v4l2_m2m_suspend()
                                      wait_event(..., !TRANS_RUNNING)
                                      <-- hangs forever

The same issue applies to mtk_jpegenc_suspend() in mtk_jpeg_enc_hw.c.

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
Does calling v4l2_m2m_resume() on the shared master_dev->m2m_dev from
each component device unpause the M2M queue while sibling components are
still force-suspended?

In multi-core mode, the parent device and all component devices share a
single m2m_dev whose QUEUE_PAUSED flag is a single non-refcounted bit.
During system resume, the parent device resumes before its children in
mtk_jpeg_resume() and calls v4l2_m2m_resume(jpeg->m2m_dev), and the first
child to resume calls v4l2_m2m_resume(jpeg->master_dev->m2m_dev) again
while the remaining child devices are still force-suspended (and even if a
sibling fails pm_runtime_force_resume()).  Similarly, if one child device
suspends and a second child fails mtk_jpegdec_suspend() with -EBUSY, the
error path calls v4l2_m2m_resume() before dpm_resume() has force-resumed
the first child.

If v4l2_m2m_resume() dispatches a queued job while any idle sibling is
still force-suspended, mtk_jpegdec_worker() or mtk_jpegenc_worker() can
select that sibling, fail pm_runtime_resume_and_get() with -EACCES, and
complete the buffers with VB2_BUF_STATE_ERROR.  The same issue exists in
mtk_jpegenc_suspend() and mtk_jpegenc_resume() in mtk_jpeg_enc_hw.c.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116013402.1273=
016-1-kyrie.wu@mediatek.com?part=3D5
