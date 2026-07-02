Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA1C3A9D88
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 07:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782978310; cv=none; b=Dbru0wJR1T6Ko5BnwoBs9Ifa6pcjRRnVRIIOGEDyzeGQCQkY6DoN1/4JKXCgVgviVE/SC2/XTsycDk5dz2m9/dWBPPx46W0sZIUsBn+iSFVyR8rPxb9vZvBWJm+W59iGSoZOsK+iMt76ssAd/66M5PO5O/l9vgKlC4SFbSPQhS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782978310; c=relaxed/simple;
	bh=mfUe9CUm9dkCHxIK/jz+QATBw29nt7BTLVnTMtCkxK4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YZOt1crNoFO+Z+nrpXLP6/+kXqxxKOSjqv+ZVvtFNc1QxAYqJjf41ZhIrCWPdKr6UtPTb4T3YTZ+878rzD1KBQFwrN5A1f/IV8Pb0TwOuFDdME8x4OFV5c4snQ7PdyPfj32jHCOQyz6iGrTy/pgnF2bj7KIx5/DkF/qZ011uX+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WQuABcd0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WQuABcd0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03BCD1F000E9;
	Thu,  2 Jul 2026 07:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782978305;
	bh=fpxIi43onm4CjbJdLICU88MVshx5nJaGGDnNVJFQRHY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WQuABcd0AOIp0WinAa7R0sDDI205HJ3Wj5zWsnnhayyI0dc4ziiMhKOecb+1Bmodx
	 21lylkELSOu3qXwTM2Ntaq57DI2l+DJJ7KCOM8zIKM8TlDTBpUiylPFQRZ/u157mqh
	 M/q2CNBXj+FcOHq20xUKMRq7atgT+bGdF3tnRztWy7oLyh6UAJUX7H/LwabP90Ragz
	 ubtm2/zHz8ZR3zyclr4i8rLM9HhsX4VdzT127bnuPwZirjB1XOPJlyBI0jgWZ5CS0B
	 N62iczLUOw8uvAE00EyRB6YnZmT9/vIXEDlXNPDMechcfBO8BJjf3yeh8Hk6K6b5u8
	 2kAYQ9NdWzq1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 05/12] media: mediatek: jpeg: Fix multi-core clk
 suspend and resume setting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260702072614.10373-6-kyrie.wu@mediatek.com>
References: <20260702072614.10373-1-kyrie.wu@mediatek.com>
 <20260702072614.10373-6-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 07:45:04 +0000
Message-Id: <20260702074505.03BCD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:

New issues:
- [High] Component-level system resume callbacks unpause the shared V4L2 M2=
M queue prematurely, causing jobs to be dispatched to components that are s=
till in system suspend.
- [High] Missing pm_runtime_disable() on the probe error path leaves runtim=
e PM enabled.
- [Medium] Double acquisition of clocks via devm_clk_bulk_get() causes dupl=
icate resources and leaks original references.
- [Low] Unconditional assignment of dev_pm_ops produces dead code when PM i=
s disabled.

Pre-existing issues:
- [Critical] Race condition between timeout work and IRQ handler leads to d=
ouble-completion and PM usage underflow.
- [High] Unfixed pm_runtime_get_sync() usage counter leak in the encoder wo=
rker error path.
- [High] The worker threads call v4l2_m2m_job_finish() immediately after st=
arting the hardware, leading to a UAF upon device release.
- [High] Missed wakeup in IRQ handler due to incorrect ordering of wake_up(=
) and atomic_inc().
--

commit 5cd8fa923e48c4448d2b551ff3153b7043979096
Author: Kyrie Wu <kyrie.wu@mediatek.com>
Subject: media: mediatek: jpeg: Fix multi-core clk suspend and resume setti=
ng

This commit adds component-level suspend and resume callbacks for the Media=
Tek
JPEG multi-core architecture. It registers power management operations for
each hardware driver to handle clock preparation and power management across
system sleep states.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c

[ ... ]

> @@ -1647,13 +1653,6 @@ static void mtk_jpegenc_worker(struct work_struct =
*work)
>  		goto enc_end;
>  	}

[Severity: High]
This is a pre-existing issue, but if pm_runtime_get_sync() fails earlier in
mtk_jpegenc_worker(), does the error path to enc_end skip calling
pm_runtime_put_noidle() and leak the usage counter?

The same fix applied to mtk_jpegdec_worker() using pm_runtime_resume_and_ge=
t()
does not appear to be applied here.

[Severity: High]
This is a pre-existing issue, but does calling v4l2_m2m_job_finish()
immediately after starting the hardware cause a use-after-free upon device
release?

In mtk_jpegenc_worker() and mtk_jpegdec_worker(), the hardware starts and
then the worker calls v4l2_m2m_job_finish() prematurely:

    mtk_jpeg_enc_start(comp_jpeg[hw_id]->reg_base);
    v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
    v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
    v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);

When a user closes the file descriptor, v4l2_m2m_ctx_release() and
stop_streaming() are called. The interrupt handler could then call
v4l2_m2m_buf_done(), immediately waking up the waiter in stop_streaming().
This allows the context to be freed while the interrupt handler is still
manipulating it, causing a use-after-free write.

> -	ret =3D clk_prepare_enable(comp_jpeg[hw_id]->venc_clk.clks->clk);
> -	if (ret) {
> -		dev_err(jpeg->dev, "%s : %d, jpegenc clk_prepare_enable fail\n",
> -			__func__, __LINE__);
> -		goto enc_end;
> -	}
> -
>  	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
>  	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);

[ ... ]

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c

[ ... ]

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

[Severity: Critical]
This is a pre-existing issue, but does calling cancel_delayed_work() instead
of cancel_delayed_work_sync() here cause a race condition if the timeout
handler is concurrently executing on another processor?

Since neither path takes a lock to serialize completion, both could proceed
to reset the hardware, call v4l2_m2m_buf_done() on the same buffer, increme=
nt
the ready counter twice, and invoke pm_runtime_put(). Could this corrupt the
buffer linked list or cause a power management usage counter underflow?

> -	ctx =3D jpeg->hw_param.curr_ctx;

[ ... ]

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

[Severity: High]
This is a pre-existing issue, but does calling wake_up() immediately before
atomic_inc() cause a missed wakeup?

If the waiting worker thread wakes up and checks atomic_read() before the
increment happens, it will go back to sleep. Since the subsequent atomic_in=
c()
is not followed by another wake_up(), could the worker thread hang
indefinitely?

> +	pm_runtime_put(jpeg->dev);
> =20
>  	return IRQ_HANDLED;
>  }

[ ... ]

> @@ -668,15 +664,69 @@ static int mtk_jpegdec_hw_probe(struct platform_dev=
ice *pdev)
> =20
>  	platform_set_drvdata(pdev, dev);
>  	pm_runtime_enable(&pdev->dev);
> +	ret =3D devm_clk_bulk_get(dev->dev,
> +				jpegdec_clk->clk_num,
> +				jpegdec_clk->clks);

[Severity: Medium]
Does this second devm_clk_bulk_get() overwrite the clocks already acquired
by devm_clk_bulk_get_all() earlier in the probe function?

This appears to acquire the clocks a second time, overwriting the array
pointers and leaking the original references until device unbind.

> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to init clk\n");
> +		return ret;
> +	}

[Severity: High]
If devm_clk_bulk_get() fails here, does the probe function return without
disabling the runtime power management?

Returning directly leaves the power management core tracking runtime status
as enabled for a device that failed to probe. Should pm_runtime_disable()
be called in this error path?

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

[Severity: High]
When a component resumes, does calling v4l2_m2m_resume() on the single shar=
ed
master queue unpause it prematurely?

If the shared queue is unpaused while sibling components are still suspende=
d,
could a job be immediately dispatched to a suspended sibling, causing
pm_runtime_resume_and_get() to fail or block improperly?

> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops mtk_jpegdec_pm_ops =3D {
> +	SYSTEM_SLEEP_PM_OPS(mtk_jpegdec_suspend, mtk_jpegdec_resume)
> +	RUNTIME_PM_OPS(mtk_jpegdec_pm_suspend, mtk_jpegdec_pm_resume, NULL)
> +};
> +
>  static struct platform_driver mtk_jpegdec_hw_driver =3D {
>  	.probe =3D mtk_jpegdec_hw_probe,
>  	.driver =3D {
>  		.name =3D "mtk-jpegdec-hw",
>  		.of_match_table =3D mtk_jpegdec_hw_ids,
> +		.pm             =3D &mtk_jpegdec_pm_ops,

[Severity: Low]
Does unconditionally assigning mtk_jpegdec_pm_ops produce dead code when
power management is disabled?

Guidelines suggest wrapping the assignment with pm_ptr() to eliminate dead
code and compiler warnings when power management support is disabled.

>  	},
>  };

[ ... ]

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c

[ ... ]

> @@ -304,12 +303,11 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int i=
rq, void *priv)
>  	buf_state =3D VB2_BUF_STATE_DONE;
>  	v4l2_m2m_buf_done(src_buf, buf_state);
>  	mtk_jpegenc_put_buf(jpeg);
> -	pm_runtime_put(ctx->jpeg->dev);
> -	clk_disable_unprepare(jpeg->venc_clk.clks->clk);
> =20
>  	jpeg->hw_state =3D MTK_JPEG_HW_IDLE;
>  	wake_up(&master_jpeg->hw_wq);
>  	atomic_inc(&master_jpeg->hw_rdy);

[Severity: Critical]
This is a pre-existing issue, but does calling cancel_delayed_work() earlier
in this interrupt handler cause a race condition if the timeout handler is
executing concurrently? Both paths could proceed to reset the hardware and =
call
v4l2_m2m_buf_done() on the same buffer locklessly.

[Severity: High]
This is also a pre-existing issue, but does calling wake_up() immediately
before atomic_inc() here cause a missed wakeup if the worker thread checks =
the
counter before the increment?

> +	pm_runtime_put(jpeg->dev);
> =20
>  	return IRQ_HANDLED;
>  }

[ ... ]

> @@ -390,15 +388,69 @@ static int mtk_jpegenc_hw_probe(struct platform_dev=
ice *pdev)
> =20
>  	platform_set_drvdata(pdev, dev);
>  	pm_runtime_enable(&pdev->dev);
> +	ret =3D devm_clk_bulk_get(dev->dev,
> +				jpegenc_clk->clk_num,
> +				jpegenc_clk->clks);

[Severity: Medium]
Similarly for the encoder, does this devm_clk_bulk_get() overwrite the cloc=
ks
acquired by devm_clk_bulk_get_all() earlier in the probe function?

> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to init clk\n");
> +		return ret;
> +	}

[Severity: High]
If devm_clk_bulk_get() fails here, does this error path also skip calling
pm_runtime_disable()?

> +
> +static int mtk_jpegenc_resume(struct device *dev)
> +{
> +	struct mtk_jpegenc_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D pm_runtime_force_resume(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	v4l2_m2m_resume(jpeg->master_dev->m2m_dev);

[Severity: High]
Like the decoder, does calling v4l2_m2m_resume() here unpause the shared
master queue prematurely while other siblings might still be suspended?

> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops mtk_jpegenc_pm_ops =3D {
> +	SYSTEM_SLEEP_PM_OPS(mtk_jpegenc_suspend, mtk_jpegenc_resume)
> +	RUNTIME_PM_OPS(mtk_jpegenc_pm_suspend, mtk_jpegenc_pm_resume, NULL)
> +};
> +
>  static struct platform_driver mtk_jpegenc_hw_driver =3D {
>  	.probe =3D mtk_jpegenc_hw_probe,
>  	.driver =3D {
>  		.name =3D "mtk-jpegenc-hw",
>  		.of_match_table =3D mtk_jpegenc_drv_ids,
> +		.pm =3D &mtk_jpegenc_pm_ops,

[Severity: Low]
Should this assignment be wrapped with pm_ptr() to avoid dead code when
power management is disabled?

>  	},
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702072614.1037=
3-1-kyrie.wu@mediatek.com?part=3D5
