Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945513B530D
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 13:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784555398; cv=none; b=NxEsaL71UzAVKgs85su8YD3TY54I+jGnE85YQl97zHMhG5zaLNJ8ncbWWdtjL4ZlPUlj+3AQnh4ceCOOZPhIUBr5fiAd61JBK1ZFOXYnNvNbZe/TPjfz1Qg7gi1/Qx7vFfYP+aeWLBBXZXJwwj5GRLTkS/f8UbFkldgJKbRtihk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784555398; c=relaxed/simple;
	bh=I9aHPX6Amyy+N+rGYtUp0THg2zbEAF6Crsr95qv+NsA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KpplrzqB9VvpK0DMGn8mt2WWTUWaZf8doVo6mY7C+nksOxS9FpexaqXEIEoNTxLQ6+sgecMqEXhKt2Gf+Tlrt4uEPMH4ypQT51kEbQ9GbtynCpwjPScp8uhAPlDy6qd86bggn4W7xvyq9giJzJMpYWqMm+N0i6J5TA9oQwz8C7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B89OiaIi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B89OiaIi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6F291F000E9;
	Mon, 20 Jul 2026 13:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784555396;
	bh=mJAI0cHXyvLzDZcbVYrW+fVlMFtsFcAYhF/jsC6rqpM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B89OiaIizec20Uy/r952+4nafdpRxrtt889GN1dxzprJ9Mj2j+OOGqk2Hy+ByS38U
	 CJQ7q6yYpRblJae+H7jnTTywihr6gZqb+bkfnIttReZhYuSfBV1R9UKs3oilIk0VMR
	 b5bjlGpyrK1yL0KVNCn2oRSChL2yQyl81g2TaWyZxL2qpd2IhbVoBP9Xe4PmdgipH6
	 RheCbUd7TuaC10Q77Q52rfMloyKtxYZgR5ggZaZeyQLaWCPV/qirPmY8BBjU16pkA6
	 GZrOu9q9Knc+iCTFL7x84khqsSmzyFJKnsv22mDJCO6Ni75tZNnOLgFbMNvY+BOLK+
	 OX3D2T7tJJoIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 05/12] media: mediatek: jpeg: Fix multi-core clk
 suspend and resume setting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260720133432.1042046-6-kyrie.wu@mediatek.com>
References: <20260720133432.1042046-1-kyrie.wu@mediatek.com>
 <20260720133432.1042046-6-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 13:49:55 +0000
Message-Id: <20260720134955.B6F291F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Unsafe global M2M device suspend/resume from component PM callback=
s.
- [Low] Unconditional assignment of dev_pm_ops structures without pm_ptr(),=
 leading to dead code.

Pre-existing issues:
- [Critical] Race condition between hardware IRQ handler and timeout worker.
- [High] Timeout handlers advertise hardware as IDLE before fully consuming=
 hardware parameters, leading to queue corruption.
- [High] Use-After-Free due to dangling pointers on component probe failure.
--

--- Patch [5]: [PATCH v16 05/12] media: mediatek: jpeg: Fix multi-core clk =
suspend and resume setting ---
commit 11ea0f3a8e261149b85cc30379d74f6a788b6148
Author: Kyrie Wu <kyrie.wu@mediatek.com>
Date:   Mon Jul 20 13:34:25 2026 +0000

    media: mediatek: jpeg: Fix multi-core clk suspend and resume setting

The suspend/resume callback function is defined in the dev_pm_ops
structure, which is defined in platform_driver. For multiple-core
architecture, each hardware driver will register a platform_driver
structure, so it is necessary to add a suspend/resume callback
function for each hardware to support this operation.

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index 9ca68cde45a48..970c0a30e3659 100644
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

[Severity: High]
This is a pre-existing issue, but does waking up waiters before
mtk_jpegdec_put_buf() consumes the hardware parameters risk queue corruptio=
n?

If a waiting worker thread wakes up and overwrites cjpeg->hw_param before
mtk_jpegdec_put_buf() executes, the newly overwritten parameters might be
used to complete the wrong buffer, leaving the actual timed-out buffer stuc=
k.

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

[Severity: Critical]
This is a pre-existing issue, but is there a race condition between this
hardware IRQ handler and the timeout worker?

If the hardware interrupt fires at the exact moment the job timeout worker
begins execution, cancel_delayed_work() will return false. Without further
synchronization, both threads might concurrently execute v4l2_m2m_buf_done(=
),
pm_runtime_put(), and atomic_inc() on the same job, which could lead to a
use-after-free or memory corruption.

[ ... ]
> @@ -673,11 +669,58 @@ static int mtk_jpegdec_hw_probe(struct platform_dev=
ice *pdev)
>  	return 0;
>  }
> =20
[ ... ]
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
Does calling v4l2_m2m_resume() from a component's resume callback unpause
the global master job queue prematurely?

If the system enters suspend, the first component to resume will unpause the
global queue. This might cause the worker thread to dispatch jobs to other
components that have not yet resumed, potentially leading to deadlocks or
queue corruption. Should the v4l2_m2m_suspend() and v4l2_m2m_resume() calls
be restricted to the master device instead?

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
Does unconditionally assigning the pm pointer here generate dead code when
CONFIG_PM is disabled?

According to the subsystem guidelines, the dev_pm_ops structure pointer
should be wrapped with pm_ptr() to eliminate dead code and prevent compiler
warnings when PM support is disabled.

>  	},
>  };

[Severity: High]
This is a pre-existing issue, but is there a use-after-free risk during
probe failure in mtk_jpegdec_hw_probe()?

Looking at mtk_jpegdec_hw_probe():

	i =3D atomic_add_return(1, &master_dev->hw_index) - 1;
	master_dev->dec_hw_dev[i] =3D dev;
	master_dev->reg_decbase[i] =3D dev->reg_base;
	dev->master_dev =3D master_dev;

	ret =3D mtk_jpegdec_smmu_init(dev);
	if (ret)
		return ret;

If mtk_jpegdec_smmu_init() fails, the component's memory is freed, but it
remains in the master_dev->dec_hw_dev array. Could the master device's work=
er
later iterate through this array, find this available core, and dereference
the freed memory?

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index 44a064dc7b3d0..4a8559c359536 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -263,13 +263,12 @@ static void mtk_jpegenc_timeout_work(struct work_st=
ruct *work)
>  	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
> =20
>  	mtk_jpeg_enc_reset(cjpeg->reg_base);
> -	clk_disable_unprepare(cjpeg->venc_clk.clks->clk);
> -	pm_runtime_put(cjpeg->dev);
>  	cjpeg->hw_state =3D MTK_JPEG_HW_IDLE;
>  	atomic_inc(&master_jpeg->hw_rdy);
>  	wake_up(&master_jpeg->hw_wq);
>  	v4l2_m2m_buf_done(src_buf, buf_state);
>  	mtk_jpegenc_put_buf(cjpeg);

[Severity: High]
This is a pre-existing issue, but does waking up waiters before
mtk_jpegenc_put_buf() consumes the hardware parameters risk queue corruptio=
n?

If a waiting worker thread wakes up and overwrites cjpeg->hw_param before
mtk_jpegenc_put_buf() executes, the newly overwritten parameters might be
used to complete the wrong buffer, leaving the actual timed-out buffer stuc=
k.

> +	pm_runtime_put(cjpeg->dev);
>  }
> =20

[Severity: Critical]
This is a pre-existing issue, but does mtk_jpegenc_hw_irq_handler() share t=
he
same race condition with the timeout worker as the decoder?

Similar to the decoder, if the hardware interrupt fires when the job timeout
worker begins execution, cancel_delayed_work() will return false, potential=
ly
leading to use-after-free or memory corruption.

[ ... ]
> @@ -394,11 +392,58 @@ static int mtk_jpegenc_hw_probe(struct platform_dev=
ice *pdev)
>  	return 0;
>  }
> =20
[ ... ]
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
Does calling v4l2_m2m_resume() from a component's resume callback unpause
the global master job queue prematurely?

Similar to the decoder, if the system enters suspend, the first component to
resume will unpause the global queue, which could cause the worker thread to
dispatch jobs to other components that have not yet resumed.

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
Does unconditionally assigning the pm pointer here generate dead code when
CONFIG_PM is disabled?

The pm_ptr() macro should be used to wrap the pointer.

>  	},
>  };

[Severity: High]
This is a pre-existing issue, but is there a use-after-free risk during
probe failure in mtk_jpegenc_hw_probe()?

Looking at mtk_jpegenc_hw_probe():

	i =3D atomic_add_return(1, &master_dev->hw_index) - 1;
	master_dev->enc_hw_dev[i] =3D dev;
	master_dev->reg_encbase[i] =3D dev->reg_base;
	dev->master_dev =3D master_dev;

	ret =3D mtk_jpegenc_smmu_init(dev);
	if (ret)
		return ret;

If mtk_jpegenc_smmu_init() fails, the component's memory is freed, but it
remains in the master_dev->enc_hw_dev array. The master device's worker
could later iterate through this array and dereference the freed memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720133432.1042=
046-1-kyrie.wu@mediatek.com?part=3D5
